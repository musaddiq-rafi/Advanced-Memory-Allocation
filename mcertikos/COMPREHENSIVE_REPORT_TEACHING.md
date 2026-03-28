# Advanced Memory Allocation in mCertiKOS — Teaching / Presentation Version

**Workspace:** `mcertikos/`  
**Date:** 2026-03-28

This is a slide-style, teaching-oriented version of `COMPREHENSIVE_REPORT.md`.

- It is intentionally structured like a deck: each section is a “slide”, separated by `---`.
- It focuses on what changed for this project: multi-page contiguous allocation, super-pages, and `brk()`.
- It also summarizes the **project-added tests** that validate those changes.

---

## 1) Problem statement (what we needed to add)

We needed to upgrade mCertiKOS to support:

- **Physically consecutive page allocation** (allocate $2^k$ contiguous 4KB frames)
- **Super-pages (4MB pages)** using x86 PSE (`PTE_PS` in the PDE)
- **Freeing** of allocated pages
- Expose this to user programs via **`brk()`** (a syscall)

Quality requirements:

- Robustness (rollback on failure, no leaks)
- Fragmentation handling (coalesce free blocks)
- Reasonable performance (avoid linear scans, use larger blocks when possible)

---

## 2) Mental model: pages, indices, and “order”

- Base page size: **4KB**
- Physical pages are referred to by **page index** (page frame number)

Conversions:

- `phys_addr = page_index << 12`
- `page_index = phys_addr >> 12`

Buddy allocator orders (here `MAX_ORDER = 10`):

- order 0: 1 page (4KB)
- order 1: 2 pages (8KB)
- …
- order 10: 1024 pages = **4MB** (exactly one super-page)

---

## 3) Address ranges (what’s “user memory” here)

Key constants used consistently across PMM/VMM:

- `PAGESIZE = 4096`
- `VM_USERLO = 0x40000000` (1GB)
- `VM_USERHI = 0xF0000000` (~3.75GB)

Interpretation in this codebase:

- PMM considers physical pages in `[VM_USERLO, VM_USERHI)` as candidates for user allocations (subject to the multiboot map).
- VMM uses the same split to separate user PDEs (roughly 256..959) from kernel PDEs.

---

## 4) Layered architecture (what calls what)

The implementation is layered, bottom-up:

- **PMM**: AT metadata → buddy allocator → container quota wrapper
- **VMM**: page table primitives → map/unmap helpers → multi-page mapping → `sys_brk`
- **Syscall plumbing**: userspace stub → `int $48` → trap dispatch → `sys_brk`

---

## 5) End-to-end flow (from user to physical memory)

```mermaid
flowchart TD
  U[Userspace brk(addr)] -->|int $48| T[trap: T_SYSCALL]
  T --> D[syscall dispatch: SYS_BRK]
  D --> SB[sys_brk(proc,new_brk)]
  SB --> AP[alloc_pages/free_pages]
  AP -->|map 4KB| MP[map_page/unmap_page]
  AP -->|map 4MB| MSP[map_superpage/unmap_superpage]
  AP --> CA[container_alloc_n/free_n]
  CA --> BA[palloc_n/pfree_n buddy allocator]
  BA --> AT[AT metadata: allocated/order/is_head]
```

---

## 6) PMM foundation: AT metadata (buddy needs extra info)

Buddy allocation needs to know:

- the **size** of a block (order)
- where a block **starts** (head)

So the allocation table is extended (conceptually):

- `allocated` (per-page allocation bit)
- `order` (meaningful on head pages)
- `is_head` (marks the beginning of a block)

Why this matters:

- Coalescing requires checking whether the buddy block is *also* a free head of the same order.

---

## 7) Buddy allocator overview (why it solves “consecutive pages”)

Buddy allocator invariant:

- free memory is tracked as blocks of size $2^k$ pages
- each block’s start is aligned to its size

That directly gives you:

- **consecutive physical frames** (a block is a contiguous run of indices)
- bounded-time allocation/free (orders 0..10)

---

## 8) buddy_init(): building the free lists

At boot (after `pmem_init` sets permissions):

- scan the user physical range `[VM_USERLO_PI, VM_USERHI_PI)`
- find runs of “normal, free” pages
- carve each run into the **largest aligned** power-of-two blocks (up to order 10)
- insert each block head into the appropriate free list

Outcome:

- the allocator is ready before anything calls `palloc()`/`palloc_n()`.

---

## 9) palloc_n(order): allocate $2^order$ consecutive pages

Algorithm sketch:

1. Find the smallest `current_order >= order` with a non-empty free list.
2. Pop a block from that list.
3. While `current_order > order`, split:
   - keep the lower half
   - push the upper half into the `current_order-1` free list
4. Mark the resulting block’s pages allocated; stamp head metadata.

Key property:

- the returned page index is aligned: `pi % (1<<order) == 0`.

---

## 10) pfree_n(page_index, order): free + coalesce

Free + coalesce loop:

1. Mark the block pages as free.
2. Compute buddy start using XOR:

   - `buddy = page_index XOR (1 << order)`

3. If the buddy is free, a head, and same order:
   - remove buddy from its free list
   - merge into order+1 (choose the lower start)
   - repeat
4. Insert the final merged block.

This is what fights fragmentation:

- once both halves are free, you recover larger blocks.

---

## 11) Container layer: quota-aware multi-page allocation

`MContainer` wraps the allocator with per-container accounting:

- `container_alloc_n(id, order)`:
  - checks quota can cover `1<<order` pages
  - calls `palloc_n(order)`
  - increments usage by `1<<order`

- `container_free_n(id, pi, order)`:
  - calls `pfree_n(pi, order)`
  - decrements usage by `1<<order`

This prevents a process from growing its heap beyond its assigned budget.

---

## 12) Super-pages: x86 PSE (4MB mappings)

A 4MB mapping is represented by:

- a **PDE** with the **`PTE_PS`** bit set
- the PDE’s address bits encode the 4MB-aligned physical base

CPU requirement:

- enable CR4.PSE (`enable_pse()` sets `CR4_PSE`).

Alignment requirement:

- physical base must be 4MB aligned
- in page-index terms: aligned to 1024 pages (exactly order 10)

---

## 13) VMM: mapping helpers for super-pages

New helpers mirror existing 4KB mapping APIs:

- `map_superpage(proc, vaddr, page_index, perm)`
- `unmap_superpage(proc, vaddr)`

And helper predicates:

- `is_superpage(proc, pde_index)` checks whether a PDE has `PTE_PS` set.

These keep `MPTNew` from reaching deep into lower layers.

---

## 14) MPTNew: multi-page virtual mappings (alloc_pages/free_pages)

`alloc_pages(proc, vaddr, perm, order)`:

- allocates a **consecutive physical block** via `container_alloc_n(proc, order)`
- maps it into the process at `vaddr`:
  - if `order == 10` and `vaddr` is 4MB-aligned: map as one super-page
  - else: map as $2^order$ 4KB pages
- if mapping fails mid-way, it **rolls back**:
  - unmaps what it mapped so far
  - frees the physical block

`free_pages(proc, vaddr, order)`:

- detects super-page mappings and uses PDE-based unmap/free
- otherwise unmaps $2^order$ PTEs and frees the physical block

---

## 15) sys_brk(proc, new_brk): heap grow/shrink

Semantics:

- `new_brk == 0` → query current break
- otherwise: validate range, align, then grow or shrink

Grow path:

- greedily allocate the **largest order** that fits the remaining growth *and* respects alignment of the current VA
- this reduces the number of blocks/mappings and improves performance

Robustness:

- on failure part-way through growth, `sys_brk` frees only what it allocated in that call (rollback).

---

## 16) Syscall plumbing (userspace → kernel)

Userspace `brk()`:

- places `SYS_BRK` in `eax`
- places the argument in `ebx`
- triggers `int $48` (IDT entry `T_SYSCALL = 48`)

Kernel dispatch:

- trap handler recognizes `T_SYSCALL`
- reads syscall number from `eax`
- routes `SYS_BRK` to `sys_brk()`
- writes return value back to `eax`

---

## 17) Project-added test strategy (what we validated)

The new tests focus on verifying:

- **buddy metadata** accessors (`order`, `is_head`)
- **multi-page contiguity** and **alignment** of `palloc_n`
- **split/coalesce** behavior (fragmentation control)
- **quota correctness** for multi-page allocations
- **super-page PDE bit patterns** (`PTE_PS`) and map/unmap behavior
- **multi-page virtual mappings** via `alloc_pages/free_pages`
- **`sys_brk` grow/shrink** correctness at the page-table level

---

## 18) Project-added tests — quick map (file → tests)

- `kern/pmm/MATIntro/test.c`
  - `MATIntro_test_own` (new AT buddy metadata)

- `kern/pmm/MATOp/test.c`
  - `MATOp_test_palloc_n_orders`
  - `MATOp_test_split_coalesce`
  - `MATOp_test_backward_compat`

- `kern/pmm/MContainer/test.c`
  - `MContainer_test_alloc_n`
  - `MContainer_test_free_n`
  - `MContainer_test_quota_limit`
  - `MContainer_test_backward_compat`

- `kern/vmm/MPTIntro/test.c`
  - `MPTIntro_test_superpage_pde`
  - `MPTIntro_test_superpage_addr`
  - `MPTIntro_test_not_superpage`

- `kern/vmm/MPTKern/test.c`
  - `MPTKern_test_map_superpage`
  - `MPTKern_test_unmap_superpage`

- `kern/vmm/MPTNew/test.c`
  - `MPTNew_test_alloc_free_pages`
  - `MPTNew_test_brk_grow_shrink`

---

## 19) Key takeaways

- Buddy allocation gives **contiguous physical blocks** with fast split/coalesce.
- Super-pages are “just” a PDE mode switch (`PTE_PS`), but require CR4.PSE and alignment.
- `sys_brk` ties PMM + VMM together, and must be careful about rollback and freeing.
- The project-added tests are targeted: they validate the new capabilities directly.
