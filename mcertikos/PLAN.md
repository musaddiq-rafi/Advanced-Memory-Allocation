# Advanced Memory Allocation Plan for mCertiKOS

## 1. Current Architecture Summary

The existing system is layered:

```
PMM (Physical Memory Management)
  MATIntro  →  AT[1<<20] array with {perm, allocated} per page
  MATInit   →  Reads BIOS memory map, initialises AT perm fields
  MATOp     →  palloc() (circular scan, one page) / pfree()
  MContainer →  Per-process quota containers wrapping palloc/pfree

VMM (Virtual Memory Management)
  MPTIntro  →  Raw PDirPool[64][1024] + IDPTbl[1024][1024] manipulation
  MPTOp     →  VA→PDE/PTE helpers, identity table init
  MPTComm   →  pdir_init, alloc_ptbl/free_ptbl
  MPTKern   →  map_page/unmap_page, pdir_init_kern
  MPTInit   →  paging_init (top-level)
  MPTNew    →  alloc_page (single page, demand-paged via pgflt_handler)
```

### Current limitations

| Area | Limitation |
|---|---|
| `palloc()` | Allocates exactly **one** page; circular-scan O(n) per call |
| `AT` struct | Tracks only `{perm, allocated}` — no order/buddy metadata |
| `alloc_page` | Maps one 4 KB page at a time (triggered by page fault) |
| Page tables | Only 4 KB pages; no PSE (Page Size Extension) support |
| Syscalls | `T_SYSCALL` IDT entry exists but `trap()` does not dispatch it |
| `brk` | Does not exist in the kernel or userspace |
| Fragmentation | No coalescing, no buddy system, no free-list — just scan |

---

## 2. Goals

1. **Physically consecutive multi-page allocation** — `palloc_n(order)` allocates $2^{order}$ aligned, consecutive physical pages.
2. **Super-page (4 MB PSE) support** — When a full PDE-aligned (1024-page) block is allocated, map it as a single 4 MB page via the `PTE_PS` bit.
3. **`brk()` syscall** — Userspace calls `brk(addr)` to grow/shrink its heap; the kernel allocates or frees the necessary pages.
4. **Fragmentation management** — Buddy allocator with split/coalesce to keep external fragmentation under control.
5. **Freeing pages** — `brk()` can shrink; kernel unmaps and frees (including coalescing buddies).

---

## 3. Scope of Changes

### Primary directories (kern/pmm and kern/vmm)

| Module | Change type | Purpose |
|---|---|---|
| `kern/pmm/MATIntro` | **Modify** | Extend `ATStruct` with buddy-order metadata |
| `kern/pmm/MATOp` | **Major rewrite** | Replace circular scan with buddy allocator |
| `kern/pmm/MContainer` | **Modify** | Track multi-page allocations in quota accounting |
| `kern/vmm/MPTIntro` | **Modify** | Add CR4.PSE enable helper; handle `PTE_PS` in PDE entries |
| `kern/vmm/MPTKern` | **Modify** | Add `map_superpage` / `unmap_superpage` |
| `kern/vmm/MPTNew` | **Major rewrite** | Add `alloc_pages`, `free_pages`, `sys_brk` kernel-side handler |

### Modules outside kern/pmm and kern/vmm (necessary)

| Module | Change type | Purpose |
|---|---|---|
| `kern/lib/trap.c` | **Modify** | Dispatch `T_SYSCALL` to a syscall handler; route `SYS_BRK` |
| `kern/lib/x86.h` | **Modify** | Add `CR4_PSE`, `PTE_PS` constant (already 0x080), `SYS_BRK` number |
| `kern/lib/x86.c` | **Modify** | Add `enable_pse()` (set CR4.PSE bit) |
| `kern/dev/idt.S` | No change | `T_SYSCALL` handler already in IDT |
| `kern/init/init.c` | **Modify** | Register new test suites for advanced allocation |
| `user/include/syscall.h` | **Modify** | Declare `brk()` prototype |
| `user/lib/fake_syscall.c` | **Modify** | Implement userspace `brk()` stub (int $T_SYSCALL) |

The majority of the work is squarely in `kern/pmm` and `kern/vmm`. The changes outside those directories are thin glue (syscall dispatch, one CR4 helper, userspace stub).

---

## 4. Detailed Design

### 4.1 Buddy Allocator in `kern/pmm`

#### 4.1.1 Extended AT Metadata (`MATIntro`)

```c
/* Current */
struct ATStruct {
    unsigned int perm;
    unsigned int allocated;
};

/* Proposed */
struct ATStruct {
    unsigned int perm;       // 0=BIOS, 1=kernel, >1=normal
    unsigned int allocated;  // 0=free, 1=allocated
    unsigned int order;      // buddy order (0..10); only meaningful for block heads
    unsigned int is_head;    // 1 if this page is the first page of a buddy block
};
```

Add getters/setters:  
`at_get_order`, `at_set_order`, `at_is_head`, `at_set_head`.

Update `export.h` and `import.h` downstream.

#### 4.1.2 Buddy Free Lists (`MATOp`)

Replace the current circular-scan `palloc` / `pfree` with a **buddy allocator** supporting orders 0 through `MAX_ORDER` (= 10, i.e. up to $2^{10} = 1024$ consecutive pages = 4 MB).

**Data structures (static in MATOp.c):**

```c
#define MAX_ORDER 10   // 2^10 pages = 4 MB (one full PDE)

// Doubly-linked free list per order
struct FreeNode {
    unsigned int prev;  // page index of previous node (0 = sentinel)
    unsigned int next;  // page index of next node (0 = sentinel)
};

static struct FreeNode free_nodes[1 << 20];  // per-page link
static unsigned int free_list_head[MAX_ORDER + 1]; // head page index per order (0 = empty)
```

**Algorithms:**

| Function | Signature | Description |
|---|---|---|
| `buddy_init()` | `void buddy_init(void)` | Called once after `pmem_init`. Scans all normal (`perm > 1`) unallocated pages and groups them into the largest possible power-of-2-aligned blocks, inserting each into the appropriate free list. |
| `palloc_n(order)` | `unsigned int palloc_n(unsigned int order)` | Allocate $2^{order}$ consecutive, $2^{order}$-aligned pages. Walk free lists from `order` up; if found at a higher order, **split** recursively. Returns the starting page index, or 0 on failure. |
| `pfree_n(page_index, order)` | `void pfree_n(unsigned int page_index, unsigned int order)` | Free a $2^{order}$ block. Check if **buddy** is free and same order; if so, **coalesce** and recurse up. |
| `palloc()` | (unchanged signature) | Thin wrapper: `return palloc_n(0);` — backward compatible. |
| `pfree()` | (unchanged signature) | Thin wrapper: `pfree_n(pfree_index, 0);` — backward compatible. |

**Buddy address calculation:**

```
buddy_index = page_index XOR (1 << order)
```

Both `page_index` and `buddy_index` must be aligned to $2^{order}$.

**Split** (allocating order _k_ from a free block of order _k+1_):
1. Remove the order-(_k+1_) block from its free list.
2. The lower half becomes the allocated block (order _k_).
3. The upper half (at `page_index + (1 << k)`) is inserted into the order-_k_ free list.

**Coalesce** (freeing order _k_):
1. Compute buddy; if buddy is free, same order, and both aligned, merge.
2. Remove buddy from free list, promote to order _k+1_, recurse.

Update `MATOp/export.h`:
```c
unsigned int palloc(void);              // backward compat
unsigned int palloc_n(unsigned int order);
void pfree(unsigned int pfree_index);   // backward compat
void pfree_n(unsigned int page_index, unsigned int order);
void buddy_init(void);
```

#### 4.1.3 Container Multi-Page Support (`MContainer`)

```c
unsigned int container_alloc_n(unsigned int id, unsigned int order) {
    unsigned int count = 1u << order;
    if (!container_can_consume(id, count)) return 0;
    unsigned int pid = palloc_n(order);
    if (pid == 0) return 0;
    CONTAINER[id].usage += count;
    return pid;
}

void container_free_n(unsigned int id, unsigned int page_index, unsigned int order) {
    pfree_n(page_index, order);
    CONTAINER[id].usage -= (1u << order);
}
```

Keep `container_alloc` and `container_free` unchanged for backward compatibility (they call the order-0 versions internally already).

Update `MContainer/export.h` and downstream `import.h` files.

#### 4.1.4 Initialization Chain Update

In `MContainer/MContainer.c :: container_init()`, after calling `pmem_init()` and counting free pages, call `buddy_init()` to build the initial free lists:

```c
void container_init(unsigned int mbi_addr) {
    pmem_init(mbi_addr);
    buddy_init();          // <— NEW: build free lists
    // ... rest unchanged (count quota, init CONTAINER[0])
}
```

This keeps the init call chain intact:
```
paging_init → pdir_init_kern → pdir_init → idptbl_init
  → container_init → pmem_init → devinit
                    → buddy_init          ← NEW
```

---

### 4.2 Super-Page Support in `kern/vmm`

#### 4.2.1 Enable PSE (`MPTIntro` + `x86`)

In `kern/lib/x86.h`, verify `PTE_PS` is `0x080` (already present) and add:
```c
#define CR4_PSE 0x00000010  /* Page Size Extension */
```

In `kern/lib/x86.c`, add:
```c
void enable_pse(void) {
    lcr4(rcr4() | CR4_PSE);
}
```

Call `enable_pse()` from `paging_init()` in `MPTInit`, right before `enable_paging()`.

#### 4.2.2 Super-Page PDE Mapping (`MPTIntro`)

Add two new functions:

```c
/*
 * Set a PDE to map a 4 MB super-page directly.
 * The PDE stores {page_index[31:22], PS=1, permissions}.
 * page_index must be aligned to 1024 pages (22-bit physical alignment).
 */
void set_pdir_entry_superpage(unsigned int proc_index,
                              unsigned int pde_index,
                              unsigned int page_index,
                              unsigned int perm) {
    unsigned int value = (page_index << 12) | PTE_PS | perm;
    PDirPool[proc_index][pde_index] = (unsigned int *)value;
}

unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index) {
    unsigned int pde = (unsigned int)PDirPool[proc_index][pde_index];
    return (pde & PTE_PS) ? 1 : 0;
}
```

Export these in `MPTIntro/export.h`.

#### 4.2.3 High-Level Super-Page Helpers (`MPTKern`)

```c
/*
 * Map a 4 MB super-page: vaddr must be 4 MB aligned, page_index must be
 * 1024-page aligned.
 */
unsigned int map_superpage(unsigned int proc_index, unsigned int vaddr,
                           unsigned int page_index, unsigned int perm) {
    unsigned int pde_index = vaddr >> 22;
    set_pdir_entry_superpage(proc_index, pde_index, page_index, perm);
    return page_index;
}

/*
 * Unmap a 4 MB super-page at the given 4 MB-aligned vaddr.
 */
void unmap_superpage(unsigned int proc_index, unsigned int vaddr) {
    unsigned int pde_index = vaddr >> 22;
    rmv_pdir_entry(proc_index, pde_index);
}
```

Export in `MPTKern/export.h`.

---

### 4.3 Multi-Page Allocation API (`MPTNew`)

Extend MPTNew with three core functions:

```c
/*
 * Allocate 2^order physically consecutive pages and map them starting at vaddr.
 * vaddr must be page-aligned.
 * If order == 10 and vaddr is 4 MB-aligned, use a super-page mapping.
 * Returns the PDE value on success, or MagicNumber on failure.
 */
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order) {
    unsigned int count = 1u << order;
    unsigned int page_index = container_alloc_n(proc_index, order);
    if (page_index == 0) return MagicNumber;

    // Super-page case: order 10 and 4 MB-aligned virtual address
    if (order == 10 && (vaddr & 0x3FFFFF) == 0) {
        return map_superpage(proc_index, vaddr, page_index, perm);
    }

    // Regular multi-page: map each page individually
    for (unsigned int i = 0; i < count; i++) {
        unsigned int va = vaddr + i * PAGESIZE;
        unsigned int result = map_page(proc_index, va, page_index + i, perm);
        if (result == MagicNumber) {
            // Rollback on failure: unmap what we mapped, free the block
            for (unsigned int j = 0; j < i; j++)
                unmap_page(proc_index, vaddr + j * PAGESIZE);
            container_free_n(proc_index, page_index, order);
            return MagicNumber;
        }
    }
    return page_index;
}

/*
 * Free 2^order pages starting at vaddr.
 * Resolves the physical page, unmaps, and frees the buddy block.
 */
void free_pages(unsigned int proc_index, unsigned int vaddr, unsigned int order) {
    unsigned int count = 1u << order;
    unsigned int pde_index = vaddr >> 22;

    // Super-page case
    if (order == 10 && is_superpage(proc_index, pde_index)) {
        unsigned int pde = get_pdir_entry(proc_index, pde_index);
        unsigned int page_index = pde >> 12;
        unmap_superpage(proc_index, vaddr);
        container_free_n(proc_index, page_index, order);
        return;
    }

    // Regular multi-page: resolve first page's physical index from PTE
    unsigned int pte = get_ptbl_entry_by_va(proc_index, vaddr);
    unsigned int page_index = pte >> 12;

    for (unsigned int i = 0; i < count; i++)
        unmap_page(proc_index, vaddr + i * PAGESIZE);

    container_free_n(proc_index, page_index, order);
}
```

Update `MPTNew/export.h`:
```c
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr, unsigned int perm);
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order);
void free_pages(unsigned int proc_index, unsigned int vaddr, unsigned int order);
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota);
```

---

### 4.4 `brk()` Syscall

#### 4.4.1 System Call Number (`kern/lib/x86.h`)

```c
#define SYS_BRK 1
```

#### 4.4.2 Per-Process Heap Tracking

Add a static array in `MPTNew.c` (or a new small module) to track the current program break per process:

```c
static unsigned int proc_brk[NUM_IDS];  // current break (virtual address)

// Initialise all breaks to VM_USERLO at container_init or pdir_init time.
void brk_init(void) {
    for (int i = 0; i < NUM_IDS; i++)
        proc_brk[i] = VM_USERLO;
}
```

#### 4.4.3 Kernel-Side `sys_brk` (`MPTNew`)

```c
/*
 * sys_brk(proc_index, new_brk):
 *   If new_brk > current break: allocate pages to cover [old_brk, new_brk).
 *     - Try to use the largest buddy order that fits and is aligned.
 *     - Prefer super-page when a full 4 MB-aligned range is requested.
 *   If new_brk < current break: free pages in [new_brk, old_brk).
 *   If new_brk == 0: return current break (query).
 *   Returns the new break on success, or 0 on failure.
 */
unsigned int sys_brk(unsigned int proc_index, unsigned int new_brk) {
    if (new_brk == 0)
        return proc_brk[proc_index];  // query

    // Clamp to user range
    if (new_brk < VM_USERLO || new_brk > VM_USERHI)
        return 0;

    unsigned int old_brk = proc_brk[proc_index];
    new_brk = roundup(new_brk, PAGESIZE);  // page-align

    if (new_brk > old_brk) {
        // GROW: allocate pages from old_brk to new_brk
        unsigned int addr = old_brk;
        while (addr < new_brk) {
            // Determine the largest order we can allocate here:
            //   - remaining size must be >= 2^order pages
            //   - addr must be aligned to 2^order pages
            unsigned int remaining_pages = (new_brk - addr) / PAGESIZE;
            unsigned int order = 0;
            while (order < MAX_ORDER
                   && (1u << (order + 1)) <= remaining_pages
                   && ((addr / PAGESIZE) & ((1u << (order + 1)) - 1)) == 0)
                order++;

            unsigned int result = alloc_pages(proc_index, addr,
                                              PTE_W | PTE_U | PTE_P, order);
            if (result == MagicNumber) {
                // Out of memory — roll back everything we allocated this call
                // (free from old_brk to addr)
                free_range(proc_index, old_brk, addr);
                return 0;
            }
            addr += (1u << order) * PAGESIZE;
        }
    } else if (new_brk < old_brk) {
        // SHRINK: free pages from new_brk to old_brk
        free_range(proc_index, new_brk, old_brk);
    }

    proc_brk[proc_index] = new_brk;
    return new_brk;
}
```

A helper `free_range` will walk the range and determine the order of each block to free. One approach: store the order alongside each allocation in a small side table, or re-derive it from the AT metadata (`at_get_order` on the head page).

#### 4.4.4 Trap Dispatch (`kern/lib/trap.c`)

Extend `trap()` to handle `T_SYSCALL`:

```c
static void syscall_handler(tf_t *tf) {
    unsigned int syscall_num = tf->regs.eax;
    switch (syscall_num) {
        case SYS_BRK: {
            unsigned int new_brk = tf->regs.ebx;
            tf->regs.eax = sys_brk(CID, new_brk);
            break;
        }
        default:
            tf->regs.eax = (unsigned int)-1;
            break;
    }
}

void trap(tf_t *tf) {
    if (tf->trapno == T_PGFLT) {
        set_pdir_base(0);
        pgflt_handler(tf);
    } else if (tf->trapno == T_SYSCALL) {
        set_pdir_base(0);
        syscall_handler(tf);
    } else {
        // ... existing default handler
    }
    set_pdir_base(CID);
    trap_return(tf);
}
```

#### 4.4.5 Userspace `brk()` Stub

In `user/include/syscall.h`:
```c
void *brk(void *addr);
```

In `user/lib/fake_syscall.c` (or a real syscall wrapper):
```c
#define SYS_BRK 1

void *brk(void *addr) {
    unsigned int result;
    asm volatile (
        "movl %1, %%eax\n"
        "movl %2, %%ebx\n"
        "int %3\n"
        "movl %%eax, %0\n"
        : "=r"(result)
        : "i"(SYS_BRK), "r"((unsigned int)addr), "i"(0x30) /* T_SYSCALL=48 */
        : "eax", "ebx"
    );
    return (void *)result;
}
```

---

## 5. Implementation Order

The work is divided into 8 phases. Each phase builds on the previous and is independently testable.

### Phase 1 — Extend AT Metadata (`MATIntro`)
- Add `order`, `is_head` fields and getters/setters.
- Update `export.h`.
- Write unit tests.
- **Files:** `kern/pmm/MATIntro/MATIntro.c`, `export.h`, `test.c`

### Phase 2 — Buddy Allocator (`MATOp`)
- Implement free-list data structures, `buddy_init`, `palloc_n`, `pfree_n`.
- Keep `palloc`/`pfree` as wrappers.
- Update `export.h`, `import.h`.
- Write unit tests.
- **Files:** `kern/pmm/MATOp/MATOp.c`, `export.h`, `import.h`, `test.c`

### Phase 3 — Multi-Page Container (`MContainer`)
- Add `container_alloc_n`, `container_free_n`.
- Call `buddy_init()` in `container_init`.
- Update `export.h`.
- Write unit tests.
- **Files:** `kern/pmm/MContainer/MContainer.c`, `export.h`, `test.c`

### Phase 4 — PSE Infrastructure (`MPTIntro` + `x86`)
- Add `CR4_PSE` constant, `enable_pse()`.
- Add `set_pdir_entry_superpage`, `is_superpage`.
- Call `enable_pse()` in `paging_init`.
- Write unit tests.
- **Files:** `kern/vmm/MPTIntro/MPTIntro.c`, `export.h`, `kern/lib/x86.h`, `kern/lib/x86.c`, `kern/vmm/MPTInit/MPTInit.c`

### Phase 5 — Super-Page Map/Unmap (`MPTKern`)
- Add `map_superpage`, `unmap_superpage`.
- Update `export.h`.
- Write unit tests.
- **Files:** `kern/vmm/MPTKern/MPTKern.c`, `export.h`, `test.c`

### Phase 6 — Multi-Page Alloc API (`MPTNew`)
- Implement `alloc_pages`, `free_pages`, `free_range`.
- Add `proc_brk` tracking and `brk_init`.
- Implement `sys_brk`.
- Update `export.h`, `import.h`.
- Write unit tests.
- **Files:** `kern/vmm/MPTNew/MPTNew.c`, `export.h`, `import.h`, `test.c`

### Phase 7 — Syscall Plumbing
- Extend `trap()` with `T_SYSCALL` dispatch.
- Add `SYS_BRK` to `kern/lib/x86.h`.
- Add userspace `brk()` stub.
- **Files:** `kern/lib/trap.c`, `kern/lib/x86.h`, `user/include/syscall.h`, `user/lib/fake_syscall.c`

### Phase 8 — Integration & Test Harness (`init.c`)
- Register new test suites in `kern_main`.
- End-to-end tests.
- **Files:** `kern/init/init.c`

---

## 6. Test Plan

### 6.1 Unit Tests — PMM Layer

All test functions follow the existing convention: return 0 on pass, non-zero on failure. Each test restores any mutated kernel state before returning.

#### `MATIntro/test.c` — New Tests

| Test | What it verifies |
|---|---|
| `MATIntro_test_order` | `at_set_order` / `at_get_order` round-trip for various orders 0..10 |
| `MATIntro_test_head` | `at_set_head` / `at_is_head` for head vs non-head pages |

#### `MATOp/test.c` — Buddy Allocator Tests

| Test | What it verifies |
|---|---|
| `MATOp_test_palloc_n_order0` | `palloc_n(0)` returns a valid, allocated, normal page in user range; `pfree_n` clears it |
| `MATOp_test_palloc_n_order1` | `palloc_n(1)` returns a 2-page-aligned block; both pages are consecutive and allocated |
| `MATOp_test_palloc_n_large` | `palloc_n(10)` returns a 1024-page-aligned block (4 MB); verify alignment and consecutiveness |
| `MATOp_test_split` | Allocate order-1, free it, allocate two order-0s — they should be the two halves |
| `MATOp_test_coalesce` | Allocate two order-0 buddies, free both — they coalesce into order-1 (verify by allocating order-1 and getting the same block back) |
| `MATOp_test_exhaust` | Allocate until failure; verify `palloc_n` returns 0; free all; verify re-allocation succeeds |
| `MATOp_test_alignment` | For each order 0..10, verify returned page_index is aligned to $2^{order}$ |
| `MATOp_test_backward_compat` | `palloc()` and `pfree()` still work as before (order-0 wrapper) |

#### `MContainer/test.c` — Multi-Page Quota Tests

| Test | What it verifies |
|---|---|
| `MContainer_test_alloc_n` | `container_alloc_n(id, 3)` deducts 8 from quota; returns valid block |
| `MContainer_test_free_n` | `container_free_n` returns count to quota |
| `MContainer_test_quota_limit` | Allocation fails when `quota - usage < count`; usage unchanged |
| `MContainer_test_backward_compat` | `container_alloc` / `container_free` still work (order-0) |

### 6.2 Unit Tests — VMM Layer

#### `MPTIntro/test.c` — Super-Page PDE Tests

| Test | What it verifies |
|---|---|
| `MPTIntro_test_superpage_pde` | `set_pdir_entry_superpage` sets PDE with `PTE_PS` bit; `is_superpage` returns 1 |
| `MPTIntro_test_superpage_addr` | PDE encodes correct physical address (page_index << 12) |
| `MPTIntro_test_not_superpage` | Regular `set_pdir_entry` does NOT set `PTE_PS`; `is_superpage` returns 0 |

#### `MPTKern/test.c` — Super-Page Map/Unmap Tests

| Test | What it verifies |
|---|---|
| `MPTKern_test_map_superpage` | `map_superpage` sets PDE with PS bit and correct address |
| `MPTKern_test_unmap_superpage` | `unmap_superpage` clears PDE entry |

#### `MPTNew/test.c` — Multi-Page Alloc & brk Tests

| Test | What it verifies |
|---|---|
| `MPTNew_test_alloc_pages_order0` | `alloc_pages(proc, vaddr, perm, 0)` same as `alloc_page` — backward compat |
| `MPTNew_test_alloc_pages_order2` | `alloc_pages(proc, vaddr, perm, 2)` maps 4 consecutive VA pages to 4 consecutive PA pages |
| `MPTNew_test_alloc_pages_super` | `alloc_pages(proc, 4MB_aligned_va, perm, 10)` produces a super-page PDE |
| `MPTNew_test_free_pages` | After `alloc_pages`, `free_pages` unmaps all pages and returns quota |
| `MPTNew_test_free_superpage` | After allocating a super-page, `free_pages(proc, va, 10)` clears the PDE |
| `MPTNew_test_alloc_fail_rollback` | When allocation fails mid-way, all previously mapped pages are rolled back |
| `MPTNew_test_brk_grow` | `sys_brk(proc, VM_USERLO + 8*PAGESIZE)` maps 8 pages; break advances |
| `MPTNew_test_brk_shrink` | `sys_brk(proc, VM_USERLO + 4*PAGESIZE)` after growing to 8 pages; 4 pages freed |
| `MPTNew_test_brk_query` | `sys_brk(proc, 0)` returns current break |
| `MPTNew_test_brk_align` | Non-page-aligned brk request is rounded up |
| `MPTNew_test_brk_range` | `sys_brk` rejects addresses outside `[VM_USERLO, VM_USERHI]` |
| `MPTNew_test_brk_superpage` | Growing break by 4 MB from a 4 MB-aligned start produces a super-page |
| `MPTNew_test_brk_fragment` | Grow, shrink, grow pattern; verify pages are properly coalesced and re-usable |

### 6.3 Integration / End-to-End Tests (in `init.c`)

These run in the test harness alongside existing layer tests.

| Test | What it verifies |
|---|---|
| `test_e2e_brk_alloc_free` | Simulate a user process: split quota, brk up, verify PTEs, brk down, verify pages freed, brk up again — verify re-use of freed physical memory |
| `test_e2e_superpage_lifecycle` | Allocate 4 MB super-page via brk, verify PDE has PS bit, free via brk, verify PDE cleared |
| `test_e2e_fragmentation` | Allocate many small blocks, free every other one, then allocate a large block — verify buddy coalescing handles it |
| `test_e2e_multi_process` | Two child processes each call brk; verify physical pages don't overlap and quota is respected |

### 6.4 Test Registration

In `kern/init/init.c`, add:
```c
#ifdef TEST
extern bool test_MATIntro(void);   // already there (implicitly via MContainer)
extern bool test_MATOp(void);      // new: buddy tests
extern bool test_MContainer(void); // extended
extern bool test_MPTIntro(void);   // extended
extern bool test_MPTKern(void);    // extended
extern bool test_MPTNew(void);     // heavily extended
extern bool test_AdvancedAlloc(void); // new: integration tests
#endif
```

Add a new block in `kern_main`:
```c
dprintf("Testing Advanced Allocation...\n");
if (test_AdvancedAlloc() == 0)
    dprintf("All tests passed.\n");
else
    dprintf("Test failed.\n");
```

---

## 7. Fragmentation Strategy

The buddy allocator inherently manages fragmentation through two mechanisms:

1. **Internal fragmentation** is bounded: a request for _n_ pages is rounded up to $2^{\lceil\log_2 n\rceil}$, wasting at most $n - 1$ pages. For the `brk()` implementation, we mitigate this by choosing the **largest fitting order per aligned chunk** rather than rounding the entire request up to one block.

2. **External fragmentation** is handled by **coalescing**: when a block is freed, its buddy is checked; if also free and at the same order, they merge into the next order. This recurse up to `MAX_ORDER`. Over time, this tends to regenerate large contiguous regions.

The `brk()` implementation specifically addresses fragmentation by:
- Allocating the largest possible power-of-2 block at each step of the grow loop (greedy best-fit by order).
- Tracking allocation order per block (via `at_get_order` on head pages) so `free_range` can free at the correct granularity.
- Coalescing freed blocks immediately, making memory available for future large allocations.

---

## 8. Performance Considerations

| Operation | Current cost | New cost |
|---|---|---|
| `palloc()` (single page) | O(n) circular scan | O(log n) buddy split (worst case split from `MAX_ORDER`) |
| `palloc_n(order)` | N/A | O(log n) |
| `pfree()` (single page) | O(1) | O(log n) buddy coalesce |
| `pfree_n(page_index, order)` | N/A | O(log n) |
| `brk(+k pages)` | N/A (page fault per page) | O(k · log n) total; fewer calls than k page faults |
| Super-page map | N/A | O(1) single PDE write |

The buddy allocator's free-list lookup is O(1) per order level, and we have at most 11 levels, so allocation and freeing are effectively O(1) in practice.

---

## 9. File Change Summary

| File | Action |
|---|---|
| `kern/pmm/MATIntro/MATIntro.c` | Add `order`, `is_head` fields + getters/setters |
| `kern/pmm/MATIntro/export.h` | Export new getters/setters |
| `kern/pmm/MATIntro/test.c` | New tests for order/head |
| `kern/pmm/MATOp/MATOp.c` | **Rewrite**: buddy allocator with free lists |
| `kern/pmm/MATOp/export.h` | Export `palloc_n`, `pfree_n`, `buddy_init` |
| `kern/pmm/MATOp/import.h` | Import new AT getters/setters |
| `kern/pmm/MATOp/test.c` | Comprehensive buddy tests |
| `kern/pmm/MContainer/MContainer.c` | Add `container_alloc_n`, `container_free_n`; call `buddy_init` |
| `kern/pmm/MContainer/export.h` | Export new functions |
| `kern/pmm/MContainer/import.h` | Import `buddy_init`, `palloc_n`, `pfree_n` |
| `kern/pmm/MContainer/test.c` | Multi-page quota tests |
| `kern/vmm/MPTIntro/MPTIntro.c` | Add `set_pdir_entry_superpage`, `is_superpage` |
| `kern/vmm/MPTIntro/export.h` | Export new functions |
| `kern/vmm/MPTIntro/test.c` | Super-page PDE tests |
| `kern/vmm/MPTKern/MPTKern.c` | Add `map_superpage`, `unmap_superpage` |
| `kern/vmm/MPTKern/export.h` | Export new functions |
| `kern/vmm/MPTKern/test.c` | Super-page map/unmap tests |
| `kern/vmm/MPTNew/MPTNew.c` | **Major addition**: `alloc_pages`, `free_pages`, `free_range`, `sys_brk`, `brk_init`, `proc_brk` |
| `kern/vmm/MPTNew/export.h` | Export new functions |
| `kern/vmm/MPTNew/import.h` | Import `container_alloc_n`, `container_free_n`, `map_superpage`, etc. |
| `kern/vmm/MPTNew/test.c` | Extensive multi-page + brk tests |
| `kern/vmm/MPTInit/MPTInit.c` | Call `enable_pse()` + `brk_init()` |
| `kern/lib/x86.h` | Add `CR4_PSE`, `SYS_BRK`, `MAX_ORDER` |
| `kern/lib/x86.c` | Add `enable_pse()` |
| `kern/lib/trap.c` | Add `T_SYSCALL` dispatch + `SYS_BRK` handler |
| `kern/init/init.c` | Register new test suites |
| `user/include/syscall.h` | Declare `brk()` |
| `user/lib/fake_syscall.c` | Implement `brk()` stub |

**Total: 15 files in `kern/pmm` + `kern/vmm` (primary), 6 files outside (thin glue).**

---

## 10. Risks & Mitigations

| Risk | Mitigation |
|---|---|
| Buddy metadata memory overhead (4 extra bytes × 1M entries ≈ 4 MB) | Acceptable; static array, same as existing AT |
| Super-page requires 4 MB physical alignment — may rarely be available after fragmentation | Buddy allocator naturally produces aligned blocks; super-page is opportunistic, falls back to 4 KB pages |
| `brk()` rollback complexity on OOM | `free_range` walks [old_brk, partially_allocated_addr) and frees per tracked order; tested explicitly |
| Existing tests break if `palloc` behavior changes | `palloc` / `pfree` wrappers preserve exact semantics (order-0); existing tests pass unchanged |
| `PTE_PS` not supported by emulator/CPU | QEMU supports PSE; detected via CPUID if needed; graceful fallback to 4 KB pages |
