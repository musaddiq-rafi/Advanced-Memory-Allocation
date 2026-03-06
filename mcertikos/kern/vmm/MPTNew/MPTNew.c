#include <lib/x86.h>

#include "import.h"

#define PAGESIZE      4096
#define VM_USERLO     0x40000000
#define VM_USERHI     0xF0000000
#define VM_USERLO_PI  (VM_USERLO / PAGESIZE)
#define VM_USERHI_PI  (VM_USERHI / PAGESIZE)
#define MAX_ORDER     10

/* Per-process program break (virtual address). Initialised to VM_USERLO. */
static unsigned int proc_brk[NUM_IDS];

/**
 * brk_init — initialise all per-process program breaks to VM_USERLO.
 * Called once from paging_init after the memory subsystem is ready.
 */
void brk_init(void)
{
    unsigned int i;
    for (i = 0; i < NUM_IDS; i++)
        proc_brk[i] = VM_USERLO;
}

/**
 * alloc_page — allocate one physical page and map it at [vaddr].
 *
 * Called by the page-fault handler.  Returns the PDE value on success
 * or MagicNumber on failure.
 */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr,
                        unsigned int perm)
{
    unsigned int page_index = container_alloc(proc_index);
    if (page_index == 0)
        return MagicNumber;
    return map_page(proc_index, vaddr, page_index, perm);
}

/**
 * alloc_pages — allocate 2^order consecutive physical pages and map them
 * starting at [vaddr].
 *
 * When order == MAX_ORDER and vaddr is 4 MB-aligned, a single super-page
 * PDE is used instead of 1024 individual PTEs.
 *
 * Returns the starting physical page index on success, or MagicNumber on
 * failure (with any partial mappings rolled back).
 */
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order)
{
    unsigned int count = 1u << order;
    unsigned int page_index, i;

    page_index = container_alloc_n(proc_index, order);
    if (page_index == 0)
        return MagicNumber;

    /* Super-page fast path: order 10, 4 MB-aligned virtual address */
    if (order == MAX_ORDER && (vaddr & 0x3FFFFFu) == 0) {
        map_superpage(proc_index, vaddr, page_index, perm);
        return page_index;
    }

    /* Regular path: map each page individually */
    for (i = 0; i < count; i++) {
        unsigned int va = vaddr + i * PAGESIZE;
        unsigned int result = map_page(proc_index, va, page_index + i, perm);
        if (result == MagicNumber) {
            /* Rollback: unmap pages already mapped */
            unsigned int j;
            for (j = 0; j < i; j++)
                unmap_page(proc_index, vaddr + j * PAGESIZE);
            container_free_n(proc_index, page_index, order);
            return MagicNumber;
        }
    }
    return page_index;
}

/**
 * free_pages — unmap and free a 2^order block of pages at [vaddr].
 *
 * Detects super-page mappings automatically via is_superpage().
 */
void free_pages(unsigned int proc_index, unsigned int vaddr,
                unsigned int order)
{
    unsigned int count = 1u << order;
    unsigned int pde_index = vaddr >> 22;
    unsigned int i, page_index;

    /* Super-page case */
    if (order == MAX_ORDER && is_superpage(proc_index, pde_index)) {
        unsigned int pde = get_pdir_entry(proc_index, pde_index);
        page_index = pde >> 12;
        unmap_superpage(proc_index, vaddr);
        container_free_n(proc_index, page_index, order);
        return;
    }

    /* Regular multi-page: resolve physical base from first PTE */
    {
        unsigned int pte = get_ptbl_entry_by_va(proc_index, vaddr);
        page_index = pte >> 12;
    }
    for (i = 0; i < count; i++)
        unmap_page(proc_index, vaddr + i * PAGESIZE);
    container_free_n(proc_index, page_index, order);
}

/**
 * free_range — free all pages in the virtual range [start, end).
 *
 * Walks the range and, for each head page, reads the buddy order stored in
 * the AT and frees the corresponding block.  Used by sys_brk for rollback
 * and shrink operations.
 */
void free_range(unsigned int proc_index, unsigned int start, unsigned int end)
{
    unsigned int addr = start;
    while (addr < end) {
        unsigned int pi = addr / PAGESIZE;
        unsigned int order = at_get_order(pi);
        unsigned int block_bytes = (1u << order) * PAGESIZE;

        /* Clamp: don't free beyond [end) */
        while (order > 0 && addr + block_bytes > end) {
            order--;
            block_bytes = (1u << order) * PAGESIZE;
        }

        free_pages(proc_index, addr, order);
        addr += block_bytes;
    }
}

/**
 * sys_brk — kernel-side handler for the brk() system call.
 *
 * new_brk == 0  → query: return current break.
 * new_brk > brk → grow heap by allocating pages.
 * new_brk < brk → shrink heap by freeing pages.
 *
 * Returns the new (or current) break on success, 0 on failure.
 */
unsigned int sys_brk(unsigned int proc_index, unsigned int new_brk)
{
    unsigned int old_brk, addr, remaining, order, block_pages, block_bytes;

    /* Query */
    if (new_brk == 0)
        return proc_brk[proc_index];

    /* Range check */
    if (new_brk < VM_USERLO || new_brk > VM_USERHI)
        return 0;

    /* Page-align upward */
    new_brk = (new_brk + PAGESIZE - 1) & ~(PAGESIZE - 1);

    old_brk = proc_brk[proc_index];

    if (new_brk > old_brk) {
        /* GROW: allocate pages from old_brk up to new_brk */
        addr = old_brk;
        while (addr < new_brk) {
            remaining = (new_brk - addr) / PAGESIZE;
            order = 0;
            /* Pick the largest order that fits alignment and remaining count */
            while (order < MAX_ORDER) {
                unsigned int next_order = order + 1;
                unsigned int next_count = 1u << next_order;
                if (next_count > remaining)
                    break;
                if ((addr / PAGESIZE) & (next_count - 1))
                    break;
                order = next_order;
            }
            block_bytes = (1u << order) * PAGESIZE;

            if (alloc_pages(proc_index, addr,
                            PTE_P | PTE_W | PTE_U, order) == MagicNumber) {
                /* OOM: roll back everything allocated this call */
                free_range(proc_index, old_brk, addr);
                return 0;
            }
            addr += block_bytes;
        }
    } else if (new_brk < old_brk) {
        /* SHRINK: free pages from new_brk up to old_brk */
        free_range(proc_index, new_brk, old_brk);
    }

    proc_brk[proc_index] = new_brk;
    return new_brk;
}

/**
 * alloc_mem_quota — designate memory quota for a new child process.
 */
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota)
{
    return container_split(id, quota);
}
