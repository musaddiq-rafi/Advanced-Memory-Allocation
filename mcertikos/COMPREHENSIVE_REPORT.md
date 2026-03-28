# Advanced Memory Allocation in mCertiKOS — Comprehensive Implementation & Test Report

**Workspace:** `mcertikos/`

**Date:** 2026-03-28

This document is a **single, end-to-end, very verbose** explanation of how the project goals were achieved in this codebase, and how the **project-added test cases** work (including what each test is trying to catch).

If you want a quicker, phase-by-phase change log, the repo already contains:
- `IMPLEMENTATION.md` (phases 1–7 change log)
- `multipageallocapi-and-syscall-plumbing.md` (phase 6–7 focus)
- `testcases-explanation.md` (manual tests only)

This report intentionally consolidates and expands those into **one** teachable narrative.

---

## Table of contents

1. Project goals and what “done” means
2. Background: pages, indices, buddy orders, PDE/PTE, and super-pages
3. Where user memory lives (important constants and address ranges)
4. Architecture overview (PMM layers, VMM layers, syscall path)
5. Implementation walkthrough
   - Phase 1: MATIntro metadata extensions
   - Phase 2: MATOp buddy allocator
   - Phase 3: MContainer multi-page + quota wiring
   - Phase 4: PSE infrastructure + super-page PDE support
   - Phase 5: MPTKern super-page map/unmap
   - Phase 6: MPTNew multi-page mapping + kernel `sys_brk`
   - Phase 7: userspace `brk()` + trap/syscall dispatch
6. Robustness, fragmentation handling, and performance discussion
7. Test harness overview (what runs, in what order, and why)
8. Project-added test-case walkthrough (tests introduced for this project)
9. Appendix: key symbols → files

---

## 1) Project goals and what “done” means

The project statement asked for an upgraded memory allocation system that supports:

1. **Allocate physically consecutive pages**
2. **Allocate super pages** (x86 Page Size Extension / 4 MB pages)
3. **Free pages**

…and expose this functionality through **`brk()`** (syscall), while being:

- **Robust** (correct rollback on failure, safe freeing, doesn’t leak mappings/physical memory)
- Able to handle **fragmentation** (avoid permanent external fragmentation; coalesce where possible)
- **Decent performance** (avoid O(n) scans per allocation; reduce mapping and TLB pressure via super-pages)

### What counts as “achieved” in this repository

In this repository, those goals are implemented as follows:

- **Physically consecutive allocation:** Implemented by a **buddy allocator** in the PMM layer (`palloc_n(order)` / `pfree_n(page_index, order)`), where allocating order `k` returns `2^k` consecutive page frames.
- **Super-page mapping:** Implemented in the VMM layers by setting a PDE with the **`PTE_PS` bit** and enabling CPU support via **CR4.PSE**.
- **Freeing:** Implemented by buddy coalescing at the PMM level, plus explicit unmapping at the VMM level.
- **`brk()` syscall:** Implemented end-to-end:
  - Userspace `brk()` wrapper uses `int $48` (interrupt gate `T_SYSCALL`).
  - Kernel trap dispatcher routes syscall `SYS_BRK` to `sys_brk()`.
  - `sys_brk()` grows/shrinks heap mappings using the multi-page alloc/free primitives.

---

## 2) Background (the minimum concepts you need)

This section is intentionally long and “slow”, because it’s the foundation for explaining the design and the tests.

### 2.1 Pages and page indices

- The hardware uses a **page size** of **4 KB** (4096 bytes).
- A **page index** (also called a “page frame number” in other OSes) is a number that identifies a 4 KB physical page.

In this codebase, the conversion between **page index** and **physical address** is:

- Physical address = `page_index << 12`
- Page index = `physical_address >> 12`

That’s why you see code like:

- Creating a PTE/PDE address field with `(page_index << 12)`
- Recovering a page index by reading `pte >> 12` or `pde >> 12`

### 2.2 Virtual memory: PDEs and PTEs

On x86 (32-bit, non-PAE) with 4 KB pages:

- A virtual address is split as:
  - **PDE index**: bits 31..22 (10 bits)
  - **PTE index**: bits 21..12 (10 bits)
  - **offset**: bits 11..0 (12 bits)

So:

- `pde_index = vaddr >> 22`
- `pte_index = (vaddr >> 12) & 0x3FF`

Each process has a **page directory** (1024 entries). Each PDE either:

- points to a **page table** (1024 PTEs), or
- maps a **4 MB super-page** directly (when `PTE_PS` is set), bypassing the PTE level.

### 2.3 Permissions and important bits

Defined in `kern/lib/x86.h`:

- `PTE_P` (present)
- `PTE_W` (writable)
- `PTE_U` (user)
- `PTE_G` (global)
- `PTE_PS` (page size / “super-page” bit in PDE)

### 2.4 Buddy allocator “order”

A buddy allocator manages free memory in blocks whose sizes are powers of two.

- **order 0**: `2^0 = 1` page  (4 KB)
- **order 1**: `2^1 = 2` pages (8 KB)
- **order 2**: `2^2 = 4` pages (16 KB)
- …
- **order 10**: `2^10 = 1024` pages = **4 MB**

This repository uses:

- `MAX_ORDER = 10`

because `2^10` pages matches **one 4 MB super-page**, which is the biggest mapping granularity this project adds.

### 2.5 “Buddy” address computation

For a block of order `k` starting at page index `p`, the buddy block start is:

- `buddy = p XOR (1 << k)`

This works because buddy blocks differ exactly in the `k`th bit of the aligned block start.

---

## 3) Where user memory lives (constants and address ranges)

Several modules define the same core constants:

```c
#define PAGESIZE      4096
#define VM_USERLO     0x40000000
#define VM_USERHI     0xF0000000
#define VM_USERLO_PI  (VM_USERLO / PAGESIZE)
#define VM_USERHI_PI  (VM_USERHI / PAGESIZE)
```

Interpretation in this codebase:

- **User virtual addresses** live in: `[VM_USERLO, VM_USERHI)`
- The PMM also treats **physical addresses** in `[VM_USERLO, VM_USERHI)` as the region eligible for “normal” allocation (subject to the BIOS/multiboot memory map).

In other words, this kernel reserves:

- physical addresses `< VM_USERLO` (below 1 GB) for the kernel
- physical addresses `>= VM_USERHI` (>= 3.75 GB) for the kernel

and uses the middle band for user page allocation.

### 3.1 Why this matters for the design

This shared boundary shows up in both subsystems:

- `pmem_init()` (PMM) uses it to decide which physical pages can ever be “normal”.
- `pdir_init()` (VMM) uses it to decide which PDEs are “user part” vs “kernel part”.
- `sys_brk()` (VMM+syscall) grows the heap starting at `VM_USERLO`.

### 3.2 QEMU RAM size

The default QEMU configuration (see the repo Makefile) uses **2 GB RAM** (`-m 2048`).

That implies:

- physical RAM covers roughly `[0, 0x80000000)`
- the project’s “user physical region” `[0x40000000, 0xF0000000)` intersects it as `[0x40000000, 0x80000000)`

So there is typically **~1 GB of physical RAM** available for user allocations in this configuration.

---

## 4) Architecture overview

mCertiKOS is designed as a **layered kernel**. Each layer exports a small interface and imports from lower layers.

### 4.1 PMM (Physical Memory Management) layers

PMM stack used in this project:

- `MATIntro`: the allocation table `AT[]` (per-page metadata)
- `MATInit`: reads memory map and initializes the allocation table permissions
- `MATOp`: implements the allocator (`palloc*`/`pfree*`) — replaced with buddy allocator
- `MContainer`: per-process quota system on top of the allocator

### 4.2 VMM (Virtual Memory Management) layers

VMM stack relevant here:

- `MPTIntro`: raw operations on `PDirPool` and page tables; super-page PDE helpers added here
- `MPTOp`: address-to-index helpers and identity page-table initialization
- `MPTComm`: creates page directories and allocates page-table pages on demand
- `MPTKern`: maps/unmaps regular pages; super-page map/unmap added here
- `MPTNew`: top-level allocator/mapping helpers; brk core is implemented here
- `MPTInit`: boot-time paging initialization; calls `enable_pse()` and `brk_init()`

### 4.3 Syscall and trap path

- The IDT entry `T_SYSCALL = 48` exists and is user-callable (DPL=3).
- The kernel trap handler (`trap()`) dispatches `T_SYSCALL` to a syscall handler.
- Syscall number is passed in `eax`.
- For `SYS_BRK`, the single argument is passed in `ebx`.

---

## 5) Implementation walkthrough (what changed and why)

This section explains the implementation, roughly in the same conceptual “phases” used by the existing repo docs.

### Phase 1 — MATIntro: add buddy metadata

**Files:**

- `kern/pmm/MATIntro/MATIntro.c`
- `kern/pmm/MATIntro/export.h`

#### 5.1.1 What was missing

A buddy allocator needs to know (at least):

- “What order is this free/allocated block?”
- “Where does the block start?”

The original per-page metadata only tracked:

- permission (`perm`)
- allocation flag (`allocated`)

#### 5.1.2 What was added

The allocation table struct was extended:

```c
struct ATStruct {
    unsigned int perm;
    unsigned int allocated;
    unsigned int order;    /* buddy order (meaningful on heads) */
    unsigned int is_head;  /* 1 if this page begins a block */
};
```

And the following getters/setters were added:

- `at_get_order(page_index)` / `at_set_order(page_index, order)`
- `at_is_head(page_index)` / `at_set_head(page_index, head)`

#### 5.1.3 Why this solves the “buddy metadata” problem

Once the buddy allocator sets these fields consistently:

- A free/allocated block’s **head page** encodes the block’s order.
- Coalescing can validate “is the buddy also a head of the same order?”

That enables deterministic coalescing without scanning.

---

### Phase 2 — MATOp: buddy allocator for multi-page contiguous physical allocation

**Files:**

- `kern/pmm/MATOp/MATOp.c`
- `kern/pmm/MATOp/export.h`
- `kern/pmm/MATOp/import.h`

This is the core change that enables “physically consecutive pages”.

#### 5.2.1 Data structures

The allocator maintains a free list per order:

- `free_list_head[order]` → page index of the head block (or 0 if empty)
- `free_nodes[page_index]` → doubly-linked list pointers (`prev`, `next`) for when that page index is a list node

These structures exist in `MATOp.c`:

```c
struct FreeNode {
    unsigned int prev;
    unsigned int next;
};

static struct FreeNode free_nodes[1 << 20];
static unsigned int free_list_head[MAX_ORDER + 1];
```

**Important design detail:**

- The free lists are *not* stored inside `ATStruct`.
- They are stored in a separate static array (`free_nodes`) to avoid bloating the already-large AT struct further.

#### 5.2.2 buddy_init()

`buddy_init()` is called after `pmem_init()` (see Phase 3).

Its job:

1. Clear all free-list state.
2. Scan the user physical range `[VM_USERLO_PI, VM_USERHI_PI)`.
3. For each run of “normal and unallocated” pages, carve it into the **largest aligned power-of-two blocks** possible (bounded by `MAX_ORDER`).
4. Insert each resulting block head into the appropriate free list.
5. Stamp `AT[head].order` and `AT[head].is_head` (and clear metadata on non-head pages).

This is what makes the allocator “ready” before any allocations occur.

#### 5.2.3 palloc_n(order)

`palloc_n(order)` allocates `2^order` consecutive pages.

High-level algorithm:

1. Find the smallest `current_order >= order` that has a non-empty free list.
2. Pop one block of that order.
3. While `current_order > order`, split:
   - keep the lower half as the “continuing” block
   - insert the upper half back as a free block of `current_order-1`
4. Mark the final `2^order` pages as allocated and stamp head metadata.

What you gain:

- **Consecutive physical pages** are guaranteed because blocks are contiguous ranges of page indices.
- Time is bounded because there are only `MAX_ORDER+1` lists.

#### 5.2.4 pfree_n(page_index, order)

`pfree_n()` frees a block and performs coalescing.

High-level algorithm:

1. Mark all pages in the block as unallocated.
2. While possible, compute buddy = `page_index XOR (1<<order)` and check:
   - buddy in user range
   - buddy is free
   - buddy is a head
   - buddy has the same order
3. If so, remove buddy from free list and merge into order+1 block.
4. Finally insert the merged block head into the appropriate free list.

This is the “fragmentation control” component: coalescing rebuilds large blocks when adjacent buddies are both free.

#### 5.2.5 Backward compatible single-page API

The original `palloc()` and `pfree()` remain, but are now thin wrappers:

- `palloc()` → `palloc_n(0)`
- `pfree(i)` → `pfree_n(i, 0)`

This is important because many existing kernel components still allocate single pages.

---

### Phase 3 — MContainer: quota-aware multi-page allocation

**Files:**

- `kern/pmm/MContainer/MContainer.c`
- `kern/pmm/MContainer/export.h`
- `kern/pmm/MContainer/import.h`

#### 5.3.1 container_init wires the buddy allocator into boot

`container_init()` does the critical wiring:

1. Calls `pmem_init(mbi_addr)` (build AT permissions)
2. Calls `buddy_init()` (build buddy free lists)
3. Counts how many pages are `normal && !allocated` to compute the root quota

This ensures that by the time anything calls `palloc()`/`palloc_n()`, the free lists are constructed.

#### 5.3.2 Multi-page container interface

Two new functions are provided:

- `container_alloc_n(id, order)`
- `container_free_n(id, page_index, order)`

`container_alloc_n` checks quota first:

- requested pages = `1 << order`
- if `container_can_consume(id, requested)` is false → fail

Then it calls `palloc_n(order)` and updates usage by that page count.

This is what makes multi-page allocation usable by higher layers without violating quotas.

---

### Phase 4 — Super-pages: enable PSE + super-page PDE helpers

This phase has two separate parts:

1. **CPU support:** enable CR4.PSE
2. **Page table support:** allow PDEs with `PTE_PS`

#### 5.4.1 Enabling PSE

**Files:**

- `kern/lib/x86.h` defines `CR4_PSE`
- `kern/dev/mboot.c` implements `enable_pse()`
- `kern/vmm/MPTInit/MPTInit.c` calls `enable_pse()` during boot

`enable_pse()` sets the CR4 bit:

```c
void enable_pse(void)
{
    uint32_t cr4 = rcr4();
    cr4 |= CR4_PSE;
    lcr4(cr4);
}
```

This is required for the CPU to interpret PDEs with `PTE_PS` as 4 MB mappings.

#### 5.4.2 Setting and detecting super-page PDEs

**Files:**

- `kern/vmm/MPTIntro/MPTIntro.c`

Two functions are added:

- `set_pdir_entry_superpage(proc, pde_index, page_index, perm)`
- `is_superpage(proc, pde_index)`

`set_pdir_entry_superpage` stores:

- physical base = `page_index << 12`
- plus `PTE_PS` bit
- plus permissions

**Alignment requirement:**

- 4 MB super-pages require the physical base to be 4 MB aligned.
- In page-index terms, that means **1024-page aligned**.
- The buddy allocator guarantees this when allocating order 10 blocks.

---

### Phase 5 — MPTKern: high-level map/unmap for super-pages

**Files:**

- `kern/vmm/MPTKern/MPTKern.c`

Two helpers mirror the existing `map_page`/`unmap_page` pair:

- `map_superpage(proc, vaddr, page_index, perm)`
- `unmap_superpage(proc, vaddr)`

These are thin wrappers around MPTIntro primitives and exist so the top layer (`MPTNew`) doesn’t need to reach down multiple layers.

---

### Phase 6 — MPTNew: multi-page mapping API + kernel `sys_brk`

**Files:**

- `kern/vmm/MPTNew/MPTNew.c`
- `kern/vmm/MPTNew/import.h`
- `kern/vmm/MPTNew/export.h`

This phase is where the PMM multi-page allocation is connected to the VMM mapping, and where `brk()` semantics are implemented.

#### 5.6.1 Per-process break state

`MPTNew.c` keeps:

- `static unsigned int proc_brk[NUM_IDS];`

and initializes it via:

- `brk_init()` sets every entry to `VM_USERLO`

In **non-TEST** builds, `paging_init()` calls `brk_init()`.

In **TEST** builds, `paging_init()` is skipped, so the MPTNew test explicitly calls `brk_init()`.

#### 5.6.2 alloc_pages(proc, vaddr, perm, order)

This is the core multi-page mapping helper.

Steps:

1. Allocate a consecutive physical block:
   - `page_index = container_alloc_n(proc, order)`
2. If allocation fails → return `MagicNumber`
3. If `order == 10` and `vaddr` is 4 MB aligned → map as a **super-page**:
   - `map_superpage(proc, vaddr, page_index, perm)`
4. Otherwise map `2^order` pages one-by-one:
   - loop `i = 0..(2^order-1)`
   - `map_page(proc, vaddr + i*4096, page_index + i, perm)`
5. If mapping fails mid-loop, rollback:
   - unmap already-mapped pages
   - `container_free_n(proc, page_index, order)`
   - return `MagicNumber`

Why rollback matters:

- It prevents partial mappings and physical leaks when the VMM runs out of page-table pages.

#### 5.6.3 free_pages(proc, vaddr, order)

Steps:

1. If this address is mapped as a super-page (`order==10` and `is_superpage(...)`):
   - read physical base from PDE
   - `unmap_superpage()`
   - `container_free_n(proc, page_index, order)`
2. Otherwise:
   - read physical base from the first PTE (`get_ptbl_entry_by_va`)
   - unmap `2^order` pages with `unmap_page`
   - free the physical block with `container_free_n`

#### 5.6.4 free_range(proc, start, end)

`free_range` frees a virtual interval `[start, end)` by iterating from `start` upward.

At each step, it:

1. Computes `pi = addr / PAGESIZE`.
2. Reads `order = at_get_order(pi)`.
3. Computes `block_bytes = (1<<order) * PAGESIZE`.
4. If the block would overshoot `end`, it reduces the order until it fits.
5. Calls `free_pages(proc, addr, order)`.
6. Advances `addr += block_bytes`.

Why it exists:

- It lets `sys_brk` rollback and shrink without tracking an explicit list of allocations.

#### 5.6.5 sys_brk(proc, new_brk)

Semantics implemented:

- `new_brk == 0` → query current break
- if out of range → return 0
- otherwise, page-align upward
- if `new_brk > old_brk` → grow by allocating pages
- if `new_brk < old_brk` → shrink by freeing pages

Grow algorithm details:

- Starting at `addr = old_brk`, repeatedly pick the **largest order** that:
  - fits in remaining page count
  - is compatible with the alignment of `addr`

This is a greedy algorithm that tries to allocate larger blocks when possible. Benefits:

- fewer allocator calls
- fewer page table updates
- increases chance of using order 10 blocks (super-page eligibility) when `addr` and size align

Robustness detail:

- If any allocation fails during growth, `sys_brk` calls `free_range(old_brk, addr)` to rollback only what this call allocated.

---

### Phase 7 — Syscall plumbing: userspace `brk()` to kernel `sys_brk()`

This phase connects the VMM logic to a real syscall entry point.

#### 5.7.1 IDT entry for syscalls

**File:** `kern/dev/intr.c`

The IDT gate is installed at interrupt number 48 (`T_SYSCALL`) with **DPL=3**, meaning user code can execute `int $48`.

#### 5.7.2 Kernel trap dispatch

**File:** `kern/lib/trap.c`

`trap()` now handles:

- `T_PGFLT` (page faults): existing demand paging via `alloc_page`
- `T_SYSCALL` (syscalls): new syscall dispatch

The syscall dispatch convention:

- `eax` = syscall number
- `ebx` = first argument
- return value written back to `eax`

For `SYS_BRK`:

- syscall number = 1 (defined in `kern/lib/x86.h`)
- `ebx` carries the requested new break

The handler calls:

- `sys_brk(CID, new_brk)`

and stores the return in `eax`.

It also switches to the kernel page directory (`set_pdir_base(0)`) while executing, then restores to the current process (`set_pdir_base(CID)`).

#### 5.7.3 Userspace stub

**Files:**

- `user/include/syscall.h` declares `void *brk(void *addr);`
- `user/lib/fake_syscall.c` implements it using inline assembly

The stub does:

- move `SYS_BRK` into `eax`
- move argument into `ebx`
- `int $48`
- return value from `eax`

So userspace sees:

- `brk(NULL)` → returns current break
- `brk(addr)` → returns new break on success, `NULL` on failure

---

## 6) Robustness, fragmentation handling, and performance

### 6.1 Robustness properties (what the code explicitly guards)

1. **No partial multi-page mappings on failure**
   - `alloc_pages` rolls back already-mapped pages if `map_page` fails mid-loop.

2. **Rollback on `brk` grow failure**
   - If growing the heap fails at some point, `sys_brk` frees the range it just allocated in that syscall.

3. **Super-page mappings are detected and handled**
   - `free_pages` checks `is_superpage` and uses PDE-based unmapping/freeing.

### 6.2 Fragmentation

The main fragmentation control is provided by the buddy allocator:

- Splitting allows satisfying small allocations even if only large blocks exist.
- Coalescing rebuilds large blocks when both halves become free.

On top of that, `sys_brk` uses a greedy “largest aligned block” strategy, which:

- reduces the number of blocks used to represent a contiguous heap segment
- improves the likelihood that later frees coalesce cleanly

### 6.3 Performance

Compared to a naive “scan AT for a free page” allocator:

- The buddy allocator avoids O(n) scans across the entire physical page table.
- Allocation and free are bounded by `MAX_ORDER` (here 10), i.e. a small constant.

Super-pages improve performance by:

- reducing page table entry writes during mapping (1 PDE instead of 1024 PTEs)
- reducing TLB pressure (one translation entry can cover a larger region)

---

## 7) Test harness overview

### 7.1 How tests are run

The kernel has a TEST mode (`make TEST=1`) that:

- initializes basic paging structures
- runs a fixed sequence of test suites
- prints pass/fail messages

### 7.2 Important difference: TEST mode skips paging_init()

In `kern/init/init.c`:

- **TEST build** calls `pdir_init_kern(mbi_addr)` directly.
- **non-TEST build** calls `paging_init(mbi_addr)`.

This matters because:

- `paging_init()` calls `enable_pse()` and `brk_init()`.
- Therefore in TEST mode:
  - PSE is not enabled (but tests can still validate the PDE bit patterns)
  - `proc_brk[]` is not initialized (so the MPTNew test explicitly calls `brk_init()`)

### 7.3 Test suite order

The order (from `kern/init/init.c`) is:

1. `test_MATIntro()`
2. `test_MATOp()`
3. `test_MContainer()`
4. `test_MPTIntro()`
5. `test_MPTOp()`
6. `test_MPTComm()`
7. `test_MPTKern()`
8. `test_MPTNew()`

This is bottom-up (PMM → VMM → top-level).

---

## 8) Project-added test-case walkthrough (tests introduced for this project)

This section explains the test functions that were added (or materially extended) to validate the **new project requirements**:

- multi-page / physically-consecutive allocation (`palloc_n` / `pfree_n`)
- quota-aware multi-page allocation (`container_alloc_n` / `container_free_n`)
- super-page PDE support (`PTE_PS`) and super-page mapping helpers
- `sys_brk()` heap growth/shrink semantics

The repository also contains many **starter** tests that pre-date this project (e.g., “basic sanity” tests for existing helpers). Those are intentionally omitted here per request.

### 8.1 PMM: MATIntro project tests (`kern/pmm/MATIntro/test.c`)

#### Test: MATIntro_test_own()

**Goal:** Validate the newly-added buddy metadata getters/setters.

**What it does:**

- Uses a safe page index (2) so it doesn’t interfere with the earlier MATIntro baseline tests.
- Writes several `order` values using `at_set_order` and checks `at_get_order` returns the same values.
- Sets `is_head` to 1 and 0 using `at_set_head` and checks `at_is_head` matches.
- Restores original values.

**What it catches if broken:**

- the new metadata fields aren’t stored correctly
- the new AT accessors index the wrong entry

---

### 8.2 PMM: MATOp project tests (`kern/pmm/MATOp/test.c`)

#### Test: MATOp_test_palloc_n_orders()

**Goal:** Verify that `palloc_n(order)` returns **consecutive, aligned** blocks for representative orders.

**What it does:**

- For each order in `{0, 1, 10}`:
   - allocates a block with `palloc_n(order)`
   - checks user-range and alignment (`pi % 2^order == 0`)
   - checks every page in the block is marked allocated
   - checks the head metadata (`at_is_head(pi) == 1` and `at_get_order(pi) == order`)
   - frees the block with `pfree_n(pi, order)` and checks allocation bits are cleared

**What it catches if broken:**

- non-consecutive allocations (violating the “contiguous pages” requirement)
- misalignment (which breaks the buddy invariant and later coalescing)
- missing/incorrect head metadata stamping
- `pfree_n` not clearing allocation state for the whole block

#### Test: MATOp_test_split_coalesce()

**Goal:** Explicitly validate buddy allocator splitting and coalescing.

**What it does:**

- Allocates an order-1 block (2 pages) and frees it.
- Allocates two order-0 blocks (forcing a split path), then frees both.
- Allocates order-1 again; this should succeed if the two freed buddies coalesced back.

**What it catches if broken:**

- splitting doesn’t populate smaller-order free lists correctly
- coalescing fails due to incorrect buddy computation or head/order metadata

#### Test: MATOp_test_backward_compat()

**Goal:** Ensure the legacy single-page API (`palloc`/`pfree`) still works correctly after the buddy rewrite.

**What it does:**

- Allocates two pages via `palloc()` and verifies they’re distinct and marked allocated.
- Frees both via `pfree()` and verifies they become unallocated.

---

### 8.3 PMM: MContainer project tests (`kern/pmm/MContainer/test.c`)

#### Test: MContainer_test_alloc_n()

**Goal:** Validate quota-aware multi-page allocation via `container_alloc_n`.

**What it does:**

- Creates a child container with quota 100.
- Allocates order 3 (8 pages) via `container_alloc_n(chid, 3)`.
- Checks that `container_get_usage(chid)` becomes 8.
- Frees via `container_free_n(chid, pi, 3)` and checks usage returns to 0.

#### Test: MContainer_test_free_n()

**Goal:** Validate `container_free_n` accounting for multi-page frees.

**What it does:**

- Allocates order 2 (4 pages) and checks usage increases by 4.
- Frees order 2 and checks usage returns to the previous value.

#### Test: MContainer_test_quota_limit()

**Goal:** Validate quota enforcement and “no side effects on failure” for multi-page requests.

**What it does:**

- Creates a child with quota 4.
- Tries order 3 (8 pages): must fail (return 0) and usage must remain unchanged.
- Tries order 2 (4 pages): must succeed.

#### Test: MContainer_test_backward_compat()

**Goal:** Ensure the legacy single-page container API (`container_alloc`/`container_free`) still works.

---

### 8.4 VMM: MPTIntro super-page tests (`kern/vmm/MPTIntro/test.c`)

#### Test: MPTIntro_test_superpage_pde()

**Goal:** Verify that `set_pdir_entry_superpage` sets the `PTE_PS` bit and `is_superpage()` detects it.

**What it does:**

- Installs a super-page PDE (proc 2, PDE index 256) using `set_pdir_entry_superpage`.
- Reads back the PDE and checks `PTE_PS` is set.
- Checks `is_superpage(2, 256)` returns 1.
- Removes the entry.

#### Test: MPTIntro_test_superpage_addr()

**Goal:** Validate the physical base address and low permission bits in a PS PDE.

**What it does:**

- Installs a PS PDE with `page_index = 0x40000` (i.e., physical base `0x40000000`).
- Verifies `pde & 0xFFFFF000 == page_index << 12`.
- Verifies low bits include `P|W|U|PS`.

#### Test: MPTIntro_test_not_superpage()

**Goal:** Ensure regular PDE setup does not set `PTE_PS`, and `is_superpage()` reports false.

---

### 8.5 VMM: MPTKern super-page map/unmap tests (`kern/vmm/MPTKern/test.c`)

#### Test: MPTKern_test_map_superpage()

**Goal:** Validate `map_superpage` installs a `PTE_PS` PDE with the correct base address.

**What it does:**

- Maps a super-page at VA `0x40000000` (PDE index 256) to physical base `page_index = 0x40000`.
- Reads the PDE and checks:
   - `PTE_PS` is set
   - `is_superpage` returns 1
   - the address bits match `page_index << 12`

#### Test: MPTKern_test_unmap_superpage()

**Goal:** Validate `unmap_superpage` clears the PDE and the entry is no longer considered a super-page.

---

### 8.6 VMM: MPTNew multi-page mapping + brk tests (`kern/vmm/MPTNew/test.c`)

#### Test: MPTNew_test_alloc_free_pages()

**Goal:** Validate `alloc_pages` and `free_pages` for an order-2 (4-page) allocation.

**What it does:**

- Allocates 4 pages at a fixed VA (`0x50000000`) for a fresh child container.
- Verifies the 4 consecutive PTEs are present (`PTE_P` set).
- Frees the block and verifies those PTEs are cleared.

#### Test: MPTNew_test_brk_grow_shrink()

**Goal:** Validate the core `sys_brk` semantics: query, grow, and shrink.

**What it does:**

- Calls `brk_init()` first (because TEST mode skips `paging_init()`).
- Uses `sys_brk(chid, 0)` to query the initial break and expects `VM_USERLO`.
- Grows by 4 pages and verifies those pages are mapped.
- Shrinks back and verifies those pages are unmapped.

#### Test: MPTNew_test_own()

**Goal:** Aggregate the project-specific MPTNew tests into the test harness.

**What it does:**

- Returns the sum of `MPTNew_test_alloc_free_pages()` and `MPTNew_test_brk_grow_shrink()`.

---

## 9) Appendix: key symbols → files

This table is meant for “where do I find the code?” quick lookup.

### PMM

- Allocation table metadata: `kern/pmm/MATIntro/MATIntro.c`
- Physical memory init: `kern/pmm/MATInit/MATInit.c`
- Buddy allocator: `kern/pmm/MATOp/MATOp.c`
- Container quota + alloc wrappers: `kern/pmm/MContainer/MContainer.c`

### VMM

- Raw page directory/table ops + superpage PDE: `kern/vmm/MPTIntro/MPTIntro.c`
- VA helpers + identity PT init: `kern/vmm/MPTOp/MPTOp.c`
- Page-directory init + page-table page allocation: `kern/vmm/MPTComm/MPTComm.c`
- `map_page`/`unmap_page` + superpage map/unmap: `kern/vmm/MPTKern/MPTKern.c`
- Multi-page mapping + `sys_brk`: `kern/vmm/MPTNew/MPTNew.c`
- Boot paging init (calls `enable_pse`, `brk_init`): `kern/vmm/MPTInit/MPTInit.c`

### Syscall plumbing

- IDT gate setup (DPL=3 for syscalls): `kern/dev/intr.c`
- Trap dispatch + syscall handler: `kern/lib/trap.c`
- Userspace `brk` stub: `user/lib/fake_syscall.c`
- Syscall prototype: `user/include/syscall.h`

### CPU paging toggles

- `enable_paging` and `enable_pse`: `kern/dev/mboot.c`
- constants: `kern/lib/x86.h`

---

## End

Presentation/teaching version (slide-style, with diagrams): [`COMPREHENSIVE_REPORT_TEACHING.md`](COMPREHENSIVE_REPORT_TEACHING.md).
