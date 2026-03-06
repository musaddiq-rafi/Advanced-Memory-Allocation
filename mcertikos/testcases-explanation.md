# Manually Added Test Cases — Explanation

All test cases below were added as part of this lab's implementation.
Pre-existing tests (`test1`, `test2`, `test3`) are not covered here.

---

## Layer: `MATIntro` — `MATIntro_test_own()`

**File:** `kern/pmm/MATIntro/test.c`

### What it tests
The two new fields added to `ATStruct`: `order` (buddy block size level) and `is_head` (whether a page is the first page of a buddy block).

### How it works (passes)
1. **Order round-trip** — Saves the original `order` of page index 2. Writes six different order values `{0, 1, 5, 10, 3, 7}` one at a time using `at_set_order`, and immediately reads back with `at_get_order`. Verifies the returned value matches exactly what was written. Restores the original value at the end.
2. **Head flag round-trip** — Saves original `is_head` of page 2. Sets it to `1`, reads back and checks it is `1`. Sets to `0`, reads back and checks it is `0`. Restores original.

### How it fails
- Fails if `at_get_order` returns a different value than what was just written by `at_set_order`.
- Fails if `at_is_head` returns a wrong value after `at_set_head(page, 1)` or `at_set_head(page, 0)`.
- Uses page index 2 specifically to avoid touching pages 0 and 1 that earlier tests use.

---

## Layer: `MATOp` — Three new tests

**File:** `kern/pmm/MATOp/test.c`

---

### `MATOp_test_palloc_n_orders()`

#### What it tests
`palloc_n(order)` and `pfree_n(page_index, order)` for orders 0 (1 page), 1 (2 pages), and 10 (1024 pages = 4 MB).

#### How it works (passes)
For each order in `{0, 1, 10}`:
1. Calls `palloc_n(order)` and checks the returned page index is not 0.
2. Checks the block is within the user range `[VM_USERLO_PI, VM_USERHI_PI)`.
3. Checks the starting page index is aligned to `2^order` (i.e. `pi & (block_size - 1) == 0`).
4. Checks every page in the block has `at_is_allocated == 1`.
5. Checks the head page has `at_is_head == 1` and `at_get_order == order`.
6. Calls `pfree_n(pi, order)` and checks every page in the block has `at_is_allocated == 0`.

#### How it fails
- Fails if `palloc_n` returns 0 (out of memory or buddy not initialised).
- Fails if the returned block is outside the user range.
- Fails if the returned block is not aligned to `2^order` boundaries.
- Fails if any page in the block is not marked allocated after `palloc_n`.
- Fails if head metadata (`is_head`, `order`) is not set correctly.
- Fails if any page is still marked allocated after `pfree_n`.

---

### `MATOp_test_split_coalesce()`

#### What it tests
The buddy allocator's **split** and **coalesce** behaviour.

#### How it works (passes)
1. Allocates an order-1 block (2 consecutive pages) — verifies it is 2-aligned.
2. Frees the order-1 block — it goes back on the order-1 free list.
3. Allocates two separate order-0 blocks (`pa`, `pb`) — these come from the buddy system splitting the previously freed order-1 block (or equivalent).
4. Verifies both order-0 pages are allocated.
5. Frees `pa` then `pb` — when both halves of a buddy pair are freed, the allocator should coalesce them back into one order-1 block.
6. Verifies coalescing worked by successfully allocating `palloc_n(1)` again — if coalescing failed, only order-0 blocks would be available and this would fail.

#### How it fails
- Fails if `palloc_n(1)` returns 0 at the start.
- Fails if order-1 block is not 2-aligned.
- Fails if either order-0 allocation returns 0 or leaves pages unallocated.
- Fails if pages are still allocated after both `pfree_n` calls.
- **Key failure mode**: fails if the final `palloc_n(1)` returns 0, meaning coalescing did not happen — the two order-0 free blocks were not merged back into an order-1 block.

---

### `MATOp_test_backward_compat()`

#### What it tests
That the old-style `palloc()` and `pfree()` wrappers still work correctly after the buddy allocator replaced the original circular-scan implementation.

#### How it works (passes)
1. Calls `palloc()` — verifies it returns a valid, non-zero page index in the user range with `at_is_allocated == 1`.
2. Calls `palloc()` a second time — verifies it returns a *different* page (two allocations must not return the same page).
3. Calls `pfree(p1)` and `pfree(p2)` — verifies both pages are then unallocated.

#### How it fails
- Fails if `palloc()` returns 0 or an out-of-range index.
- Fails if the second `palloc()` returns the same page as the first.
- Fails if either page is still marked allocated after `pfree`.

---

## Layer: `MContainer` — Four new tests

**File:** `kern/pmm/MContainer/test.c`

---

### `MContainer_test_alloc_n()`

#### What it tests
`container_alloc_n(id, order)` correctly allocates `2^order` pages and deducts them from the container's usage counter.

#### How it works (passes)
1. Creates a child container (quota 100) via `container_split(0, 100)`.
2. Calls `container_alloc_n(chid, 3)` to request `2^3 = 8` pages.
3. Verifies the returned page index is non-zero.
4. Verifies `container_get_usage(chid) == 8`.
5. Calls `container_free_n(chid, pi, 3)` and verifies usage returns to 0.

#### How it fails
- Fails if `container_alloc_n` returns 0 (allocation failed despite sufficient quota).
- Fails if usage is not exactly 8 after allocation.
- Fails if usage is not 0 after freeing.

---

### `MContainer_test_free_n()`

#### What it tests
`container_free_n(id, page_index, order)` correctly returns `2^order` pages to the free pool and decrements the usage counter.

#### How it works (passes)
1. Creates a child container (quota 64).
2. Records `usage_before = 0`.
3. Allocates order-2 (`2^2 = 4` pages) via `container_alloc_n(chid, 2)`.
4. Verifies usage is now `usage_before + 4`.
5. Calls `container_free_n(chid, pi, 2)` and verifies usage returns to `usage_before`.

#### How it fails
- Fails if allocation returns 0.
- Fails if usage after allocation is not `usage_before + 4`.
- Fails if usage after free is not restored to `usage_before`.

---

### `MContainer_test_quota_limit()`

#### What it tests
That `container_alloc_n` correctly **rejects** allocations that would exceed the quota, and leaves usage unchanged on failure.

#### How it works (passes)
1. Creates a child container with quota exactly 4 pages.
2. Tries `container_alloc_n(chid, 3)` requesting `2^3 = 8` pages — must return 0 (failure) because quota is only 4.
3. Verifies usage has not changed after the failed attempt.
4. Tries `container_alloc_n(chid, 2)` requesting `2^2 = 4` pages — must succeed (quota == 4).
5. Frees the block.

#### How it fails
- Fails if `container_alloc_n(chid, 3)` returns non-zero (it should have been rejected).
- Fails if usage changed after the failed allocation (side-effects must not occur on failure).
- Fails if `container_alloc_n(chid, 2)` returns 0 (exact-quota allocation must succeed).

---

### `MContainer_test_backward_compat()`

#### What it tests
That the original single-page `container_alloc` and `container_free` still work correctly through the buddy system.

#### How it works (passes)
1. Creates a child container (quota 50).
2. Calls `container_alloc(chid)` — verifies it returns a non-zero page index.
3. Verifies usage is now 1.
4. Calls `container_free(chid, pi)` — verifies usage returns to 0.

#### How it fails
- Fails if `container_alloc` returns 0.
- Fails if usage is not 1 after a single allocation.
- Fails if usage is not 0 after freeing.

---

## Layer: `MPTIntro` — Three new tests

**File:** `kern/vmm/MPTIntro/test.c`

---

### `MPTIntro_test_superpage_pde()`

#### What it tests
That `set_pdir_entry_superpage` sets the `PTE_PS` bit in the PDE, and that `is_superpage` recognises it.

#### How it works (passes)
1. Calls `set_pdir_entry_superpage(2, 256, 0x40000, PTE_P | PTE_W | PTE_U)` — writes a super-page PDE into process 2's page directory at entry 256.
2. Reads the raw PDE value with `get_pdir_entry(2, 256)`.
3. Checks that `pde & PTE_PS` is non-zero (the PS bit is set).
4. Calls `is_superpage(2, 256)` — must return 1.
5. Cleans up with `rmv_pdir_entry(2, 256)`.

#### How it fails
- Fails if the `PTE_PS` (0x080) bit is not set in the stored PDE.
- Fails if `is_superpage` returns 0 despite the PS bit being present.

---

### `MPTIntro_test_superpage_addr()`

#### What it tests
That the physical address and permission bits are encoded correctly in a super-page PDE.

#### How it works (passes)
1. Calls `set_pdir_entry_superpage(2, 257, 0x40000, PTE_P | PTE_W | PTE_U)` with `page_index = 0x40000`.
2. Reads back the PDE.
3. Checks the upper 20 bits `(pde & 0xFFFFF000)` equal `0x40000 << 12 = 0x40000000` (the physical address).
4. Checks the lower 12 bits `(pde & 0xFFF)` equal `PTE_P | PTE_W | PTE_U | PTE_PS = 0x087`.
5. Cleans up.

#### How it fails
- Fails if the physical address bits in the PDE do not match `page_index << 12`.
- Fails if the permission bits do not include all of `PTE_P`, `PTE_W`, `PTE_U`, and `PTE_PS`.

---

### `MPTIntro_test_not_superpage()`

#### What it tests
That a regular `set_pdir_entry` does **not** set the `PTE_PS` bit, and that `is_superpage` returns 0 for it.

#### How it works (passes)
1. Calls `set_pdir_entry(2, 258, 10000)` — a normal page-table-pointer PDE.
2. Reads the PDE and verifies `PTE_PS` is **not** set.
3. Calls `is_superpage(2, 258)` — must return 0.
4. Cleans up.

#### How it fails
- Fails if `PTE_PS` is accidentally set by the regular `set_pdir_entry` function.
- Fails if `is_superpage` incorrectly returns 1 for a normal PDE.

---

## Layer: `MPTKern` — Two new tests

**File:** `kern/vmm/MPTKern/test.c`

---

### `MPTKern_test_map_superpage()`

#### What it tests
The high-level `map_superpage(proc, vaddr, page_index, perm)` function correctly sets up a super-page PDE from a virtual address.

#### How it works (passes)
1. Calls `map_superpage(2, 0x40000000, 0x40000, PTE_P | PTE_W | PTE_U)` — maps a 4 MB super-page at VA `0x40000000` for process 2.
2. Derives `pde_index = vaddr >> 22 = 256`.
3. Reads `get_pdir_entry(2, 256)` and checks `PTE_PS` is set.
4. Calls `is_superpage(2, 256)` — must return 1.
5. Checks `(pde & 0xFFFFF000) == (0x40000 << 12)` — physical address matches.
6. Cleans up with `rmv_pdir_entry`.

#### How it fails
- Fails if `PTE_PS` is not set after `map_superpage`.
- Fails if `is_superpage` returns 0.
- Fails if the physical address stored in the PDE does not match `page_index << 12`.

---

### `MPTKern_test_unmap_superpage()`

#### What it tests
That `unmap_superpage(proc, vaddr)` clears the PDE entry completely.

#### How it works (passes)
1. Maps a super-page at VA `0x40400000` (PDE 257) for process 2.
2. Verifies the PDE is non-zero after mapping.
3. Calls `unmap_superpage(2, 0x40400000)`.
4. Reads the PDE again — must be 0.
5. Calls `is_superpage(2, 257)` — must return 0.

#### How it fails
- Fails if the PDE is already 0 after mapping (map itself failed).
- Fails if the PDE is still non-zero after `unmap_superpage`.
- Fails if `is_superpage` still returns 1 after unmapping.

---

## Layer: `MPTNew` — Two new tests

**File:** `kern/vmm/MPTNew/test.c`

---

### `MPTNew_test_alloc_free_pages()`

#### What it tests
The new `alloc_pages(proc, vaddr, perm, order)` and `free_pages(proc, vaddr, order)` functions — mapping and unmapping multiple consecutive physical pages.

#### How it works (passes)
1. Creates a fresh child container with quota 200 via `container_split(0, 200)`.
2. Calls `alloc_pages(chid, 0x50000000, PTE_P | PTE_W | PTE_U, 2)` to allocate `2^2 = 4` consecutive pages mapped at VA `0x50000000`.
3. Verifies the return value is not `MagicNumber` (success).
4. Loops over all 4 pages (at offsets 0, 4096, 8192, 12288) and checks each PTE has `PTE_P` set — i.e. each page is actually mapped.
5. Calls `free_pages(chid, 0x50000000, 2)`.
6. Loops again over all 4 pages and checks each PTE has `PTE_P` **cleared** — all mappings removed.

#### How it fails
- Fails if `alloc_pages` returns `MagicNumber` (out of memory or container quota exceeded).
- Fails if any of the 4 PTEs does not have `PTE_P` set after allocation.
- Fails if any of the 4 PTEs still has `PTE_P` set after `free_pages`.

---

### `MPTNew_test_brk_grow_shrink()`

#### What it tests
The full `sys_brk` heap management: query, grow, shrink, and PTE state verification.

#### How it works (passes)
1. Calls `brk_init()` explicitly — required because the `TEST` build path skips `paging_init()`, so `proc_brk[]` would otherwise be zero-initialised rather than set to `VM_USERLO`.
2. Creates a fresh child container with quota 300.
3. **Query test**: calls `sys_brk(chid, 0)` — must return `0x40000000` (`VM_USERLO`), confirming `brk_init` worked.
4. **Grow test**: calls `sys_brk(chid, brk0 + 4 * 4096)` to grow the heap by 4 pages. Verifies the return value is exactly `brk0 + 16384`. Then reads all 4 PTEs and confirms each has `PTE_P` set.
5. **Shrink test**: calls `sys_brk(chid, brk0)` to shrink back to the original break. Verifies return is `brk0`. Then reads all 4 PTEs and confirms each has `PTE_P` **cleared**.

#### How it fails
- Fails if `brk_init()` does not set `proc_brk[]` to `VM_USERLO`, causing the query to return a wrong value.
- Fails if `sys_brk` grow returns a wrong address (not `brk0 + 4 * 4096`).
- Fails if any of the 4 pages is not mapped after growing (allocation or mapping failed silently).
- Fails if any of the 4 pages is still mapped after shrinking (free or unmap failed).
- **Critical edge case**: if `brk_init()` is omitted, `proc_brk[chid]` starts at 0, so a "grow to VM_USERLO" call would attempt to allocate 262144 pages — causing an OOM failure or hang.
