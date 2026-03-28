#include <lib/debug.h>
#include <lib/x86.h>
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include <vmm/MPTIntro/export.h>
#include <vmm/MPTNew/export.h>
#include "export.h"

int MPTNew_test1()
{
    unsigned int vaddr = 4096 * 1024 * 400;
    container_split(0, 100);
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) != 0) {
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    alloc_page(1, vaddr, 7);
    if (get_ptbl_entry_by_va(1, vaddr) == 0) {
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) == 0) {
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}

/**
 * Write Your Own Test Script (optional)
 *
 * Come up with your own interesting test cases to challenge your classmates!
 * In addition to the provided simple tests, selected (correct and interesting) test functions
 * will be used in the actual grading of the lab!
 * Your test function itself will not be graded. So don't be afraid of submitting a wrong script.
 *
 * The test function should return 0 for passing the test and a non-zero code for failing the test.
 * Be extra careful to make sure that if you overwrite some of the kernel data, they are set back to
 * the original value. O.w., it may make the future test scripts to fail even if you implement all
 * the functions correctly.
 */
/**
 * Test alloc_pages / free_pages at order 2 (4 pages).
 * Verifies that 4 consecutive PTEs are mapped and then cleanly freed.
 *
 * By the time this runs, MPTNew_test1 has already done container_split(0, 100)
 * creating child 7 (proc 0 has nchildren == 7 after earlier test suites).
 * We create our own child with container_split(0, 200).
 */
int MPTNew_test_alloc_free_pages()
{
    unsigned int vaddr = 0x50000000;  /* PDE 320 — well inside user range */
    unsigned int i, pte, result;
    unsigned int chid;

    dprintf("test alloc_free_pages: begin (vaddr=0x%x order=2)\n", vaddr);

    /* Create a fresh child container with enough quota */
    chid = container_split(0, 200);
    if (chid >= NUM_IDS) {
        dprintf("test alloc_free_pages failed: container_split returned %u\n", chid);
        return 1;
    }

    dprintf("test alloc_free_pages: chid=%u\n", chid);

    result = alloc_pages(chid, vaddr, PTE_P | PTE_W | PTE_U, 2);
    if (result == MagicNumber) {
        dprintf("test alloc_free_pages failed: alloc_pages order-2 returned MagicNumber\n");
        return 1;
    }

    dprintf("test alloc_free_pages: alloc_pages succeeded (result=%u)\n", result);

    /* All 4 PTEs must be present */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, vaddr + i * 4096);
        dprintf("test alloc_free_pages: pte[%u]=0x%x\n", i, pte);
        if (!(pte & PTE_P)) {
            dprintf("test alloc_free_pages failed: page %u not mapped (pte=0x%x)\n", i, pte);
            free_pages(chid, vaddr, 2);
            return 1;
        }
    }

    free_pages(chid, vaddr, 2);

    dprintf("test alloc_free_pages: freed range, re-checking PTEs\n");

    /* After freeing, PTEs must be cleared */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, vaddr + i * 4096);
        dprintf("test alloc_free_pages: after free pte[%u]=0x%x\n", i, pte);
        if (pte & PTE_P) {
            dprintf("test alloc_free_pages failed: page %u still mapped after free\n", i);
            return 1;
        }
    }

    dprintf("test alloc_free_pages passed.\n");
    return 0;
}

/**
 * Test sys_brk: grow by 4 pages, verify PTEs, then shrink back, verify freed.
 * Also tests the query (new_brk == 0) path.
 *
 * We call brk_init() first so proc_brk[] is initialised to VM_USERLO,
 * since the TEST build path does not call paging_init().
 */
int MPTNew_test_brk_grow_shrink()
{
    unsigned int brk0, brk1, brk2, i, pte;
    unsigned int chid;

    dprintf("test brk_grow_shrink: begin\n");

    /* Initialise proc_brk[] — needed because TEST mode skips paging_init */
    brk_init();

    dprintf("test brk_grow_shrink: brk_init() done\n");

    /* Create a fresh child container */
    chid = container_split(0, 300);
    if (chid >= NUM_IDS) {
        dprintf("test brk_grow_shrink failed: container_split returned %u\n", chid);
        return 1;
    }

    dprintf("test brk_grow_shrink: chid=%u\n", chid);

    /* Query current break — should be VM_USERLO after brk_init */
    brk0 = sys_brk(chid, 0);
    dprintf("test brk_grow_shrink: query brk0=0x%x\n", brk0);
    if (brk0 != 0x40000000) {
        dprintf("test brk_grow_shrink failed: initial query returned 0x%x, expected 0x40000000\n", brk0);
        return 1;
    }

    /* Grow by 4 pages */
    brk1 = sys_brk(chid, brk0 + 4 * 4096);
    dprintf("test brk_grow_shrink: grow -> brk1=0x%x\n", brk1);
    if (brk1 != brk0 + 4 * 4096) {
        dprintf("test brk_grow_shrink failed: grow returned 0x%x, expected 0x%x\n",
                brk1, brk0 + 4 * 4096);
        return 1;
    }

    /* All 4 pages must be mapped */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, brk0 + i * 4096);
        dprintf("test brk_grow_shrink: after grow pte[%u]=0x%x\n", i, pte);
        if (!(pte & PTE_P)) {
            dprintf("test brk_grow_shrink failed: page %u not mapped after grow\n", i);
            sys_brk(chid, brk0);
            return 1;
        }
    }

    /* Shrink back to brk0 */
    brk2 = sys_brk(chid, brk0);
    dprintf("test brk_grow_shrink: shrink -> brk2=0x%x\n", brk2);
    if (brk2 != brk0) {
        dprintf("test brk_grow_shrink failed: shrink returned 0x%x, expected 0x%x\n",
                brk2, brk0);
        return 1;
    }

    /* Pages must be unmapped */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, brk0 + i * 4096);
        dprintf("test brk_grow_shrink: after shrink pte[%u]=0x%x\n", i, pte);
        if (pte & PTE_P) {
            dprintf("test brk_grow_shrink failed: page %u still mapped after shrink\n", i);
            return 1;
        }
    }

    dprintf("test brk_grow_shrink passed.\n");
    return 0;
}

int MPTNew_test_own()
{
    dprintf("test MPTNew_own: begin\n");
    return MPTNew_test_alloc_free_pages() + MPTNew_test_brk_grow_shrink();
}

int test_MPTNew()
{
    return MPTNew_test1() + MPTNew_test_own();
}
