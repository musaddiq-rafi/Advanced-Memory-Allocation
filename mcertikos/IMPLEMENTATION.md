# Advanced Memory Allocation — Implementation Log

## Phase 1 — Extend AT Metadata (`MATIntro`)

### Goal

Add buddy-allocator metadata (`order`, `is_head`) to the per-page allocation table so that later phases (buddy free lists, coalescing) have the bookkeeping fields they need.

### Changes

#### 1. `kern/pmm/MATIntro/MATIntro.c`

Extended `struct ATStruct` with two new fields:

```c
struct ATStruct {
    unsigned int perm;       // (existing) 0=BIOS, 1=kernel, >1=normal
    unsigned int allocated;  // (existing) 0=free, >0=allocated
    unsigned int order;      // NEW — buddy order (0..10) for block heads
    unsigned int is_head;    // NEW — 1 if this page starts a buddy block
};
```

Added four getter/setter functions at the end of the file:

| Function | Purpose |
|---|---|
| `at_get_order(page_index)` | Returns `AT[page_index].order` |
| `at_set_order(page_index, order)` | Sets `AT[page_index].order` |
| `at_is_head(page_index)` | Returns `AT[page_index].is_head` |
| `at_set_head(page_index, head)` | Sets `AT[page_index].is_head` |

These follow the same pattern as the existing `at_is_norm`, `at_is_allocated`, etc.

Since `ATStruct` is a static array of 2^20 entries, the two new `unsigned int` fields add ~8 MB of static memory. This is acceptable — the existing array already occupies ~8 MB, and the kernel runs in identity-mapped physical memory with plenty of headroom.

#### 2. `kern/pmm/MATIntro/export.h`

Added the four new function prototypes:

```c
unsigned int at_get_order(unsigned int page_index);
void at_set_order(unsigned int page_index, unsigned int order);
unsigned int at_is_head(unsigned int page_index);
void at_set_head(unsigned int page_index, unsigned int head);
```

These are now available for import by downstream modules (`MATOp`, `MContainer`, etc.).

#### 3. `kern/pmm/MATIntro/test.c`

Replaced the empty `MATIntro_test_own()` stub with actual tests covering the new fields:

- **Order round-trip**: Sets `at_set_order` with values `{0, 1, 5, 10, 3, 7}` and verifies `at_get_order` returns each value correctly. This covers the minimum (0), maximum (10, matching `MAX_ORDER`), and several intermediate orders.
- **Head flag round-trip**: Sets `at_set_head` to 1, verifies `at_is_head` returns 1, then sets to 0 and verifies it returns 0.
- **State restoration**: Uses page index 2 (avoiding pages 0 and 1 used by earlier tests) and saves/restores all original values before returning, so subsequent test suites are not affected.

The test runs within the existing `test_MATIntro()` aggregator: `MATIntro_test1() + MATIntro_test2() + MATIntro_test3() + MATIntro_test_own()`.

#### 4. `kern/init/init.c`

Two additions so the `TEST` build actually runs the MATIntro suite:

1. Added `extern bool test_MATIntro(void);` to the `#ifdef TEST` declarations block.
2. Added a runner block **before** the existing MContainer block:

```c
dprintf("Testing the MATIntro layer...\n");
if (test_MATIntro() == 0)
    dprintf("All tests passed.\n");
else
    dprintf("Test failed.\n");
dprintf("\n");
```

This establishes the bottom-up test order that will be extended in Phase 2: MATIntro → (MATOp) → MContainer → MPTIntro → MPTOp → MPTComm → MPTKern → MPTNew.

### Backward Compatibility

- The existing `perm` and `allocated` fields are untouched — all original getters/setters work identically.
- The new `order` and `is_head` fields are zero-initialized by the C static storage guarantee, so they start in a safe default state (order 0, not a head). No existing code reads these fields, so there is no behavioral change until Phase 2 begins using them.
- All three original `MATIntro_test{1,2,3}` tests continue to pass unchanged.

---

## Phase 2 — Buddy Allocator (`MATOp`)

### Goal

Replace the naive circular-scan page allocator with a buddy allocator supporting orders 0–10 (1 page up to 1024 pages = 4 MB). This provides O(log n) allocation of physically consecutive, power-of-2-aligned page blocks with automatic split and coalesce.

### Changes

#### 1. `kern/pmm/MATOp/MATOp.c` — Full Rewrite

The entire file was rewritten. The old circular-scan `palloc` / `pfree` and `last_palloc_index` state variable are gone.

**New data structures (static):**

```c
#define MAX_ORDER 10

struct FreeNode {
    unsigned int prev;   // page index of previous node (0 = sentinel)
    unsigned int next;   // page index of next node (0 = sentinel)
};

static struct FreeNode free_nodes[1 << 20];          // per-page doubly-linked list node
static unsigned int free_list_head[MAX_ORDER + 1];   // head page index per order (0 = empty)
```

Each order 0–10 has its own doubly-linked free list threaded through `free_nodes[]`. Page index 0 is used as the "null" sentinel (page 0 is kernel-reserved and never in user range).

**Helper functions:**

| Function | Purpose |
|---|---|
| `fl_remove(page_index, order)` | Unlinks a page from its order's free list |
| `fl_insert(page_index, order)` | Inserts a page at the head of its order's free list |

**Core functions:**

| Function | Signature | Description |
|---|---|---|
| `buddy_init()` | `void buddy_init(void)` | Scans `[VM_USERLO_PI, VM_USERHI_PI)` and groups all normal, unallocated pages into the largest possible aligned buddy blocks, inserting each into the appropriate free list. Sets `order` and `is_head` metadata via the Phase 1 AT setters. |
| `palloc_n(order)` | `unsigned int palloc_n(unsigned int order)` | Allocates 2^order consecutive, 2^order-aligned pages. Searches free lists from the requested order upward; if a larger block is found, **splits** recursively (upper half goes back on the free list at the lower order). Marks all pages as allocated and sets head metadata. Returns starting page index, or 0 on failure. |
| `pfree_n(page_index, order)` | `void pfree_n(unsigned int page_index, unsigned int order)` | Frees a 2^order block. Marks all pages unallocated, then attempts to **coalesce** with the XOR-buddy (`page_index ^ (1 << order)`) if the buddy is free, same order, in user range, and marked as a head. Recursively coalesces upward until no merge is possible. |
| `palloc()` | `unsigned int palloc(void)` | Backward-compatible wrapper: `return palloc_n(0);` |
| `pfree(pfree_index)` | `void pfree(unsigned int pfree_index)` | Backward-compatible wrapper: `pfree_n(pfree_index, 0);` |

**Buddy address calculation:**

```
buddy_index = page_index XOR (1 << order)
```

Both page_index and buddy_index must be aligned to 2^order. The XOR flips exactly the bit that distinguishes the two halves of a parent block.

**Split algorithm (allocating order k from a free block of order k+n):**
1. Pop the block from free list at order k+n.
2. For each level from k+n−1 down to k: the upper half (at `page_index + 2^level`) becomes a new free block at that level; the lower half continues to be split.
3. The final lower half at order k is the allocated block.

**Coalesce algorithm (freeing order k):**
1. Mark pages unallocated.
2. Compute buddy; if buddy is free, same order, head, and in user range → remove buddy from free list, pick the lower of the two as the new block start, increment order, repeat.
3. Insert the final (possibly merged) block into its order's free list.

#### 2. `kern/pmm/MATOp/export.h`

Added three new function prototypes alongside the existing two:

```c
unsigned int palloc_n(unsigned int order);
void pfree_n(unsigned int page_index, unsigned int order);
void buddy_init(void);
```

These are now available for import by `MContainer` (Phase 3).

#### 3. `kern/pmm/MATOp/import.h`

Added imports for the four Phase 1 AT metadata functions that the buddy allocator uses:

```c
unsigned int at_get_order(unsigned int page_index);
void at_set_order(unsigned int page_index, unsigned int order);
unsigned int at_is_head(unsigned int page_index);
void at_set_head(unsigned int page_index, unsigned int head);
```

These are needed by `buddy_init` (to set initial block metadata), `palloc_n` (to mark allocated blocks), `pfree_n` (to check buddy status and set merged block metadata).

#### 4. `kern/pmm/MATOp/test.c`

Kept the original `MATOp_test1` (single-page palloc/pfree) and added three new tests per the plan:

| Test | What it verifies |
|---|---|
| `MATOp_test_palloc_n_orders` | `palloc_n(0)`, `palloc_n(1)`, `palloc_n(10)` each return a correctly aligned, in-range block with all pages marked allocated and correct head metadata; `pfree_n` clears all pages. |
| `MATOp_test_split_coalesce` | Allocates order-1, frees it, allocates two order-0 blocks (from the split halves), frees both, verifies coalescing by successfully re-allocating order-1. |
| `MATOp_test_backward_compat` | `palloc()` and `pfree()` still work correctly as order-0 wrappers — two consecutive allocations return distinct pages, both free cleanly. |

The aggregator is now: `MATOp_test1() + MATOp_test_palloc_n_orders() + MATOp_test_split_coalesce() + MATOp_test_backward_compat()`.

#### 5. `kern/init/init.c`

Two additions:

1. Added `extern bool test_MATOp(void);` to the `#ifdef TEST` declarations block.
2. Added a runner block between MATIntro and MContainer:

```c
dprintf("Testing the MATOp layer...\n");
if (test_MATOp() == 0)
    dprintf("All tests passed.\n");
else
    dprintf("Test failed.\n");
dprintf("\n");
```

The full test order is now: **MATIntro → MATOp → MContainer → MPTIntro → MPTOp → MPTComm → MPTKern → MPTNew**.

### Design Decisions

1. **Page 0 as sentinel**: The free list uses index 0 to mean "no node." This is safe because page 0 is in kernel-reserved space (`perm == 1`) and never enters the buddy system.

2. **Static `free_nodes[]` array**: 2^20 entries × 8 bytes = 8 MB. This parallels the existing `AT[]` array approach. An alternative (embedding prev/next in `ATStruct`) would have avoided the extra array, but would change the MATIntro layer's structure — keeping them separate respects the layer boundary.

3. **`buddy_init` scans upward**: For each stretch of consecutive normal-unallocated pages, it finds the largest power-of-2 block that fits the alignment. This maximises initial large-block availability, important for super-page allocation in later phases.

4. **No `get_nps()` dependency in core functions**: The buddy allocator never reads `nps` — it relies solely on the free lists built by `buddy_init`. This makes `palloc_n`/`pfree_n` constant-time per order level.

### Backward Compatibility

- `palloc()` and `pfree()` are thin wrappers around `palloc_n(0)` and `pfree_n(index, 0)`. Their signatures are unchanged, so `MContainer` and all downstream modules calling them continue to work.
- The original `MATOp_test1` is kept and still passes — it tests the `palloc`/`pfree` wrappers.
- `MContainer/import.h` imports `palloc` and `pfree` which are still exported with identical signatures.

### Note

`buddy_init()` is exported but **not yet called** by anyone — it will be integrated into the init chain in Phase 3 when `container_init()` calls it after `pmem_init()`. Until then, the free lists are empty and `palloc_n`/`pfree_n` would return 0. The backward-compatible `palloc`/`pfree` wrappers go through the buddy system too, so **the MATOp tests will only pass once Phase 3 wires `buddy_init()` into `container_init()`**, or if it is called separately in the test harness.

---

## Phase 3 — Multi-Page Container (`MContainer`)

### Goal

Extend the per-process memory container with multi-page allocation/free functions that use the buddy allocator, and wire `buddy_init()` into the initialization chain so the buddy system is active at boot.

### Changes

#### 1. `kern/pmm/MContainer/MContainer.c`

**Init chain update** — Added `buddy_init()` call in `container_init()` immediately after `pmem_init()`:

```c
pmem_init(mbi_addr);
buddy_init();  // Build buddy free lists from the AT after pmem_init
```

This is the critical wiring that makes the buddy allocator live. `pmem_init` populates the AT permission table; `buddy_init` then scans it to build free lists. The quota-counting loop that follows is unaffected because `buddy_init` only sets `order`/`is_head` metadata and builds `free_nodes[]` — it does not modify the `allocated` flags that the loop inspects.

**New functions** — Added two functions at the end of the file:

| Function | Signature | Description |
|---|---|---|
| `container_alloc_n` | `unsigned int container_alloc_n(unsigned int id, unsigned int order)` | Checks quota (`container_can_consume(id, 2^order)`), calls `palloc_n(order)`, increments `usage` by `2^order`. Returns starting page index or 0 on failure. |
| `container_free_n` | `void container_free_n(unsigned int id, unsigned int page_index, unsigned int order)` | Calls `pfree_n(page_index, order)`, decrements `usage` by `2^order`. |

Unlike the existing `container_alloc` (which doesn't check quota — the caller is expected to), `container_alloc_n` includes a quota check directly. This is important because multi-page allocations can consume many pages at once and the caller may not know the exact count.

#### 2. `kern/pmm/MContainer/export.h`

Added two new function prototypes:

```c
unsigned int container_alloc_n(unsigned int id, unsigned int order);
void container_free_n(unsigned int id, unsigned int page_index, unsigned int order);
```

These will be imported by `MPTNew` in Phase 6.

#### 3. `kern/pmm/MContainer/import.h`

Added imports for the three buddy allocator functions from MATOp:

```c
unsigned int palloc_n(unsigned int order);
void pfree_n(unsigned int page_index, unsigned int order);
void buddy_init(void);
```

#### 4. `kern/pmm/MContainer/test.c`

Replaced the empty `MContainer_test_own()` stub with four new tests:

| Test | What it verifies |
|---|---|
| `MContainer_test_alloc_n` | Creates a child with quota 100; `container_alloc_n(chid, 3)` returns a valid page index and deducts 8 from usage; `container_free_n` restores usage to 0. |
| `MContainer_test_free_n` | Creates a child with quota 64; allocates order-2 (4 pages), verifies usage += 4; frees and verifies usage restored. |
| `MContainer_test_quota_limit` | Creates a child with quota 4; order-3 (8 pages) must fail and leave usage unchanged; order-2 (4 pages) must succeed. |
| `MContainer_test_backward_compat` | Creates a child with quota 50; `container_alloc`/`container_free` still work as single-page operations (usage goes 0 → 1 → 0). |

Each test creates its own child process via `container_split` for isolation. All allocations are freed before returning.

The aggregator is now: `MContainer_test1() + MContainer_test2() + MContainer_test_alloc_n() + MContainer_test_free_n() + MContainer_test_quota_limit() + MContainer_test_backward_compat()`.

### Key Integration Point

This phase completes the critical connection: `container_init → pmem_init → buddy_init`. With this in place:
- All MATOp tests (Phase 2) now pass because `buddy_init()` builds the free lists before any allocation is attempted.
- `palloc()` and `pfree()` now go through the buddy system rather than the old circular scan.
- The entire PMM stack is functional: MATIntro (metadata) → MATInit (AT init) → MATOp (buddy allocator) → MContainer (quota-aware wrappers).

### Backward Compatibility

- `container_alloc` and `container_free` are unchanged — they still call `palloc()`/`pfree()` which are now buddy wrappers. No signature or behavioral change for callers.
- Existing tests (`MContainer_test1`, `MContainer_test2`) continue to pass.
- The init chain is strictly extended (one new call inserted), not restructured.

---

## Phase 4 — PSE Infrastructure (`MPTIntro` + `x86`)

### Goal

Add x86 Page Size Extension (PSE) support so the system can map 4 MB super-pages via a single PDE entry with the `PTE_PS` bit, and provide the MPTIntro-level primitives for setting and querying super-page PDEs.

### Changes

#### 1. `kern/lib/x86.h`

Added the `CR4_PSE` constant to the CR4 section:

```c
#define CR4_PSE        0x00000010  /* Page Size Extension */
```

This is the bit that must be set in CR4 to enable 4 MB page support on x86.

#### 2. `kern/lib/x86.c`

Added `enable_pse()` at the end of the file:

```c
gcc_inline void enable_pse(void)
{
    lcr4(rcr4() | CR4_PSE);
}
```

This ORs `CR4_PSE` into CR4, enabling the processor to interpret the `PTE_PS` bit in page directory entries as "this PDE maps a 4 MB page directly" rather than pointing to a page table.

#### 3. `kern/vmm/MPTIntro/MPTIntro.c`

Added two new functions after `rmv_ptbl_entry`:

| Function | Signature | Description |
|---|---|---|
| `set_pdir_entry_superpage` | `void set_pdir_entry_superpage(unsigned int proc_index, unsigned int pde_index, unsigned int page_index, unsigned int perm)` | Sets a PDE to map a 4 MB super-page. Computes `(page_index << 12) | PTE_PS | perm` and stores it in `PDirPool[proc_index][pde_index]`. The `page_index` must be 1024-page aligned (physically 4 MB aligned). |
| `is_superpage` | `unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index)` | Returns 1 if the PDE has `PTE_PS` set, 0 otherwise. Used by higher layers to distinguish super-page PDEs from regular page-table-pointer PDEs. |

These follow the same casting pattern as the existing `set_pdir_entry` — storing an integer value into the `unsigned int *` typed PDirPool array.

#### 4. `kern/vmm/MPTIntro/export.h`

Added two new function prototypes:

```c
void set_pdir_entry_superpage(unsigned int proc_index, unsigned int pde_index,
                              unsigned int page_index, unsigned int perm);
unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index);
```

#### 5. `kern/vmm/MPTInit/MPTInit.c`

Added `enable_pse()` call between `pdir_init_kern` and `set_pdir_base`:

```c
void paging_init(unsigned int mbi_addr)
{
    pdir_init_kern(mbi_addr);
    enable_pse();        // NEW: enable 4 MB page support
    set_pdir_base(0);
    enable_paging();
}
```

PSE must be enabled before paging is turned on (or at least before any super-page PDE is used). Placing it here ensures it's active for all subsequent operations.

#### 6. `kern/vmm/MPTInit/import.h`

Added `enable_pse()` to the import declarations so `MPTInit.c` can call it.

#### 7. `kern/vmm/MPTIntro/test.c`

Replaced the empty `MPTIntro_test_own()` with three new tests:

| Test | What it verifies |
|---|---|
| `MPTIntro_test_superpage_pde` | `set_pdir_entry_superpage` sets the `PTE_PS` bit in the PDE; `is_superpage` returns 1. Uses proc 2, PDE 256 for isolation. |
| `MPTIntro_test_superpage_addr` | The PDE encodes the correct physical address (`page_index << 12`) in bits 31:12, and the correct permission bits (`PTE_PS | PTE_P | PTE_W | PTE_U = 0x087`) in bits 11:0. |
| `MPTIntro_test_not_superpage` | A regular `set_pdir_entry` does NOT set `PTE_PS`; `is_superpage` returns 0. Confirms the two PDE-setting functions produce distinguishable results. |

All tests clean up via `rmv_pdir_entry` before returning.

The aggregator is now: `MPTIntro_test1() + MPTIntro_test2() + MPTIntro_test_superpage_pde() + MPTIntro_test_superpage_addr() + MPTIntro_test_not_superpage()`.

### Note on TEST build

The `TEST` build uses `pdir_init_kern` (not `paging_init`), so `enable_pse()` is not called during test runs. This is fine — the tests only manipulate in-memory `PDirPool` entries and verify bit patterns; they don't depend on the CPU actually interpreting `PTE_PS`. When the full `paging_init` path runs (non-TEST), PSE is enabled before paging starts.

### Backward Compatibility

- `PTE_PS` (0x080) already existed in `x86.h` — no existing code is affected.
- `set_pdir_entry` is unchanged — it still sets P|W|U without PS.
- The two new MPTIntro functions are purely additive; no existing function signatures change.
- `paging_init` inserts one extra call; the order `pdir_init_kern → enable_pse → set_pdir_base → enable_paging` is safe because PSE can be enabled at any time before (or after) paging is active.

---

## Phase 5 — Super-Page Map/Unmap (`MPTKern`)

### Goal

Add high-level `map_superpage` and `unmap_superpage` functions to the MPTKern layer, providing a clean interface for mapping/unmapping 4 MB super-pages that parallels the existing `map_page`/`unmap_page` pair.

### Changes

#### 1. `kern/vmm/MPTKern/MPTKern.c`

Added two functions after `unmap_page`:

| Function | Signature | Description |
|---|---|---|
| `map_superpage` | `unsigned int map_superpage(unsigned int proc_index, unsigned int vaddr, unsigned int page_index, unsigned int perm)` | Computes `pde_index = vaddr >> 22`, calls `set_pdir_entry_superpage` from Phase 4, returns `page_index`. Requires `vaddr` to be 4 MB-aligned and `page_index` to be 1024-page-aligned. |
| `unmap_superpage` | `void unmap_superpage(unsigned int proc_index, unsigned int vaddr)` | Computes `pde_index = vaddr >> 22`, calls `rmv_pdir_entry` to clear the PDE. No page table to worry about — super-pages bypass the second-level table. |

These are intentionally thin wrappers. The value they add over calling MPTIntro directly is:
- Taking a virtual address instead of a PDE index (consistent with `map_page`/`unmap_page`).
- Providing a clean export for the MPTNew layer (Phase 6) to use without reaching down two layers.

#### 2. `kern/vmm/MPTKern/export.h`

Added two new function prototypes:

```c
unsigned int map_superpage(unsigned int proc_index, unsigned int vaddr,
                           unsigned int page_index, unsigned int perm);
void unmap_superpage(unsigned int proc_index, unsigned int vaddr);
```

#### 3. `kern/vmm/MPTKern/import.h`

Added imports for the Phase 4 MPTIntro functions needed by the new code:

```c
void set_pdir_entry_superpage(unsigned int proc_index, unsigned int pde_index,
                              unsigned int page_index, unsigned int perm);
unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index);
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index);
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index);
```

`rmv_pdir_entry` and `get_pdir_entry` are existing MPTIntro functions that weren't previously imported at this layer. They're needed by `unmap_superpage` and by the tests.

#### 4. `kern/vmm/MPTKern/test.c`

Added `#include <vmm/MPTIntro/export.h>` for direct access to `is_superpage`, `get_pdir_entry`, and `rmv_pdir_entry` in tests. Replaced the empty `MPTKern_test_own()` with two tests:

| Test | What it verifies |
|---|---|
| `MPTKern_test_map_superpage` | `map_superpage(2, 0x40000000, 0x40000, P\|W\|U)` produces a PDE with `PTE_PS` set, `is_superpage` returns 1, and the physical address bits match `page_index << 12`. Uses proc 2, PDE 256. |
| `MPTKern_test_unmap_superpage` | After mapping, `unmap_superpage` clears the PDE to 0 and `is_superpage` returns 0. Uses proc 2, PDE 257. |

Both tests clean up via `rmv_pdir_entry` on failure paths.

The aggregator is now: `MPTKern_test1() + MPTKern_test2() + MPTKern_test_map_superpage() + MPTKern_test_unmap_superpage()`.

### Backward Compatibility

- `map_page` and `unmap_page` are completely unchanged.
- `pdir_init_kern` is unchanged.
- The two new functions are purely additive; no existing signatures or behavior are affected.
- Existing tests (`MPTKern_test1`, `MPTKern_test2`) continue to pass.
