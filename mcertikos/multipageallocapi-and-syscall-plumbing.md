# Multi-Page Alloc API & Syscall Plumbing — Implementation Log

## Overview

This document covers **Phase 6** (Multi-Page Allocation API in `MPTNew`) and **Phase 7**
(Syscall Plumbing — `brk()` end-to-end) of the Advanced Memory Allocation lab.
Phases 1–5 (buddy allocator, super-page PSE infrastructure) are documented in
`IMPLEMENTATION.md`.

---

## Phase 6 — Multi-Page Alloc API (`MPTNew`)

### Goal

Extend `MPTNew` with the ability to allocate and free **2^order consecutive, aligned
physical pages** and map them into a process's virtual address space. When the allocation
spans a full 4 MB-aligned PDE region (`order == 10`), it takes the **super-page fast
path** — a single PDE write instead of 1024 PTE writes. Add per-process program-break
(`brk`) state and a kernel-side `sys_brk` handler that uses these primitives to
grow/shrink the heap.

### Changes

#### 1. `kern/vmm/MPTNew/MPTNew.c` — Major Addition

The original `alloc_page` and `alloc_mem_quota` stubs are preserved unchanged.
The following new items were added:

---

##### `proc_brk[]` — per-process program break

```c
static unsigned int proc_brk[NUM_IDS];
```

A static array of `NUM_IDS` (64) unsigned ints. Each entry stores the current
virtual-address program break for the corresponding process. Initialised to
`VM_USERLO` (0x40000000) by `brk_init()`.

---

##### `brk_init(void)`

```c
void brk_init(void)
{
    unsigned int i;
    for (i = 0; i < NUM_IDS; i++)
        proc_brk[i] = VM_USERLO;
}
```

Called once from `paging_init()` (in `MPTInit`) immediately after `enable_pse()`.
Ensures all breaks start at the bottom of the user virtual address range.

---

##### `alloc_pages(proc_index, vaddr, perm, order)`

```c
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order);
```

Allocates `2^order` consecutive physical pages via `container_alloc_n(proc_index, order)`
and maps them starting at `vaddr`.

**Super-page fast path** — if `order == MAX_ORDER` (10) and `vaddr` is 4 MB-aligned
(`vaddr & 0x3FFFFF == 0`), a single call to `map_superpage()` is made instead of
iterating over 1024 pages.

**Regular path** — loops over `2^order` pages calling `map_page()` for each.
On partial failure (e.g. page table allocation fails mid-loop), the already-mapped
pages are unmapped and the physical block is returned via `container_free_n()`.

Returns the starting physical page index on success, or `MagicNumber` on failure.

---

##### `free_pages(proc_index, vaddr, order)`

```c
void free_pages(unsigned int proc_index, unsigned int vaddr,
                unsigned int order);
```

Unmaps and frees a `2^order` block at `vaddr`.

- **Super-page path**: if the PDE at `vaddr >> 22` has `PTE_PS` set, reads the
  physical address from the PDE (`pde >> 12`), calls `unmap_superpage()`, then
  `container_free_n()`.
- **Regular path**: reads the physical base from the first PTE, calls `unmap_page()`
  for each page in the block, then `container_free_n()`.

---

##### `free_range(proc_index, start, end)`

```c
void free_range(unsigned int proc_index, unsigned int start, unsigned int end);
```

Iterates over the virtual range `[start, end)` freeing each allocated buddy block.
For each position it reads `at_get_order(pi)` on the head page to determine the
block size, then calls `free_pages()`. This allows `sys_brk` shrink/rollback to
operate correctly even when the range was allocated in variable-order chunks.

---

##### `sys_brk(proc_index, new_brk)`

```c
unsigned int sys_brk(unsigned int proc_index, unsigned int new_brk);
```

Kernel-side `brk()` handler:

| `new_brk` | Behaviour |
|---|---|
| `0` | Query — returns `proc_brk[proc_index]` unchanged |
| `> VM_USERHI` or `< VM_USERLO` | Returns `0` (invalid) |
| `> old_brk` | **Grow**: allocates pages from `old_brk` to `new_brk` using the largest fitting aligned buddy order at each step |
| `< old_brk` | **Shrink**: frees pages from `new_brk` to `old_brk` via `free_range()` |

**Grow algorithm** — at each iteration picks the maximum order `k` such that:
- `2^k <= remaining_pages`
- the current virtual address is `2^k`-page aligned

This greedy approach minimises the number of allocations and maximises buddy block size
(reducing fragmentation). On out-of-memory mid-grow, already-allocated pages in this
call are rolled back via `free_range(proc_index, old_brk, current_addr)`.

Returns the new break on success, `0` on failure.

---

#### 2. `kern/vmm/MPTNew/export.h`

Added five new prototypes alongside the original two:

```c
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order);
void free_pages(unsigned int proc_index, unsigned int vaddr,
                unsigned int order);
void free_range(unsigned int proc_index, unsigned int start,
                unsigned int end);
void brk_init(void);
unsigned int sys_brk(unsigned int proc_index, unsigned int new_brk);
```

#### 3. `kern/vmm/MPTNew/import.h`

Expanded from 4 imports to 13 to cover everything the new functions need:

| Import | Source | Used by |
|---|---|---|
| `container_alloc` / `container_free` / `container_split` | `MContainer` | `alloc_page`, `alloc_mem_quota` (existing) |
| `container_alloc_n` / `container_free_n` | `MContainer` | `alloc_pages`, `free_pages`, `free_range`, `sys_brk` |
| `map_page` / `unmap_page` | `MPTKern` | `alloc_page`, `alloc_pages`, `free_pages` |
| `map_superpage` / `unmap_superpage` | `MPTKern` | `alloc_pages`, `free_pages` |
| `is_superpage` / `get_pdir_entry` | `MPTIntro` | `free_pages` |
| `get_ptbl_entry_by_va` | `MPTOp` | `free_pages` |
| `at_get_order` | `MATIntro` | `free_range` |

#### 4. `kern/vmm/MPTNew/test.c`

Added includes `<lib/x86.h>` and `<vmm/MPTIntro/export.h>` for `PTE_P`/`PTE_W`/`PTE_U`
and `get_ptbl_entry_by_va` respectively.

Replaced the empty `MPTNew_test_own()` stub with two new tests:

| Test | What it verifies |
|---|---|
| `MPTNew_test_alloc_free_pages` | `alloc_pages(1, 0x50000000, P\|W\|U, 2)` maps 4 consecutive pages; all PTEs have `PTE_P` set. `free_pages(1, …, 2)` clears all 4 PTEs. |
| `MPTNew_test_brk_grow_shrink` | `sys_brk(2, VM_USERLO)` sets break; query returns same value; grow by 4 pages — all PTEs mapped; shrink back — all PTEs cleared. |

The aggregator is: `MPTNew_test1() + MPTNew_test_own()`.

#### 5. `kern/vmm/MPTInit/MPTInit.c` and `import.h`

Added `brk_init()` call in `paging_init()` between `enable_pse()` and `set_pdir_base()`:

```c
void paging_init(unsigned int mbi_addr)
{
    pdir_init_kern(mbi_addr);
    enable_pse();    /* Phase 4: enable 4 MB page support */
    brk_init();      /* Phase 6: initialise per-process program breaks */
    set_pdir_base(0);
    enable_paging();
}
```

`import.h` was updated to declare `void brk_init(void)`.

### Design Decisions

1. **`free_range` uses `at_get_order`** — rather than maintaining a separate side table of
   "what order was this vaddr allocated at", we rely on the buddy metadata already stored
   in `AT[pi].order`. When `sys_brk` grows the heap with variable-order blocks, each block
   head has its order stamped by `palloc_n`. `free_range` reads that stamp back via
   `at_get_order`, ensuring correct granularity freeing without extra bookkeeping.

2. **Super-page path is opportunistic** — `alloc_pages` uses a super-page PDE only when
   `order == 10` AND the virtual address is 4 MB-aligned. Otherwise it falls back to
   individual PTEs. This matches the buddy allocator's guarantee that `palloc_n(10)` always
   returns a 4 MB-aligned physical block.

3. **Rollback on partial failure** — if any `map_page` call fails mid-loop (e.g. page table
   allocation exhausted), already-mapped pages are unmapped and the physical block is freed
   before returning `MagicNumber`. This prevents memory leaks on OOM.

4. **`TEST` build note** — `paging_init` is not called in `TEST` mode (`kern_init` calls
   `pdir_init_kern` directly). Therefore `brk_init()` is **not** called in tests. The
   `MPTNew_test_own` tests call `sys_brk` directly and set the break explicitly, so they
   work correctly without relying on the init chain.

### Backward Compatibility

- `alloc_page` and `alloc_mem_quota` are completely unchanged.
- `MPTNew_test1` continues to pass unchanged.
- No existing function signatures are modified.

---

## Phase 7 — Syscall Plumbing

### Goal

Wire the software-interrupt syscall path from userspace through the IDT and kernel trap
dispatcher all the way to `sys_brk`. The IDT entry for `T_SYSCALL` (interrupt 48) already
existed; what was missing was the kernel-side dispatch and the userspace `brk()` stub.

### Changes

#### 1. `kern/lib/x86.h` — `SYS_BRK` Constant

Added to the "other constants" section:

```c
#define SYS_BRK  1
```

System call numbers are passed in `eax` when the user executes `int $T_SYSCALL`.
`SYS_BRK = 1` is the only syscall added in this phase; future syscalls would extend
this numbering.

#### 2. `kern/lib/trap.c` — Syscall Dispatch

Added a `static void syscall_handler(tf_t *tf)` function and extended `trap()` with a
new `else if` branch:

```c
static void syscall_handler(tf_t *tf)
{
    unsigned int syscall_num = tf->regs.eax;
    switch (syscall_num) {
        case SYS_BRK: {
            unsigned int new_brk = tf->regs.ebx;
            tf->regs.eax = sys_brk(CID, new_brk);
            break;
        }
        default:
            tf->regs.eax = (unsigned int)-1;
            KERN_DEBUG("unknown syscall: %d\n", syscall_num);
            break;
    }
}

void trap(tf_t *tf)
{
    if (tf->trapno == T_PGFLT) {
        set_pdir_base(0);
        pgflt_handler(tf);
    } else if (tf->trapno == T_SYSCALL) {
        set_pdir_base(0);
        syscall_handler(tf);
    } else {
        KERN_DEBUG("unhandled trap: %d\n", tf->trapno);
        trap_dump(tf);
        KERN_PANIC("stop!\n");
    }
    set_pdir_base(CID);
    trap_return(tf);
}
```

**Calling convention** (i386 fast-syscall):

| Register | Role |
|---|---|
| `eax` (in) | System call number (`SYS_BRK = 1`) |
| `ebx` (in) | First argument (`new_brk` for `SYS_BRK`) |
| `eax` (out) | Return value (`new_brk` on success, `0` on failure) |

The `set_pdir_base(0)` / `set_pdir_base(CID)` pair around the handler matches the
existing pattern in `pgflt_handler`, ensuring the kernel identity map is active during
the call and restored to the process's page directory on exit.

`T_SYSCALL = 48` is defined in `kern/dev/intr.h` which is already included by `trap.c`.

#### 3. `user/include/syscall.h` — `brk()` Prototype

```c
void *brk(void *addr);
```

`addr` is the desired new program break. Pass `NULL` (0) to query the current break.
Returns the new break on success or `NULL` on failure.

#### 4. `user/lib/fake_syscall.c` — `brk()` Stub

```c
#define SYS_BRK   1
#define T_SYSCALL 48

void *brk(void *addr)
{
    unsigned int result;
    __asm__ __volatile__ (
        "movl %1, %%eax\n"
        "movl %2, %%ebx\n"
        "int  %3\n"
        "movl %%eax, %0\n"
        : "=r" (result)
        : "i" (SYS_BRK),
          "r" ((unsigned int)(addr)),
          "i" (T_SYSCALL)
        : "eax", "ebx"
    );
    return (void *)result;
}
```

Uses inline assembly to execute `int $48`. The `"i"` constraint for `SYS_BRK` and
`T_SYSCALL` embeds them as immediate constants. The `"r"` constraint for `addr` loads
it into a general register before being moved into `ebx`.

### End-to-End Call Flow

```
User process calls brk(new_addr)
  │
  ▼
user/lib/fake_syscall.c :: brk()
  eax ← SYS_BRK (1)
  ebx ← new_addr
  int $48                       ← T_SYSCALL
  │
  ▼ (CPU saves registers, switches to kernel stack via IDT)
kern/dev/idt.S :: Xsyscall
  pushes trapframe, calls trap()
  │
  ▼
kern/lib/trap.c :: trap()
  tf->trapno == T_SYSCALL (48)
  set_pdir_base(0)
  syscall_handler(tf)
  │
  ▼
kern/lib/trap.c :: syscall_handler()
  tf->regs.eax == SYS_BRK (1)
  new_brk = tf->regs.ebx
  tf->regs.eax = sys_brk(CID, new_brk)
  │
  ▼
kern/vmm/MPTNew/MPTNew.c :: sys_brk()
  [allocates / frees pages, updates proc_brk]
  returns new break
  │
  ▼ (unwinds back through trap)
kern/lib/trap.c :: trap()
  set_pdir_base(CID)
  trap_return(tf)              ← iret restores user registers
  │
  ▼
User: brk() returns (void *)result from eax
```

### Design Decisions

1. **`T_SYSCALL` already in the IDT** — `kern/dev/intr.c` registers `Xsyscall` at gate 48
   with DPL=3 (user-accessible). No IDT changes were needed; only `trap.c` needed the
   dispatch branch.

2. **`CID` as proc_index** — `trap.c` uses the existing `extern unsigned int CID` global
   (the current process ID) when calling `sys_brk`. This matches the pattern used by
   `pgflt_handler` which calls `alloc_page(CID, …)`.

3. **Return value in `eax`** — both the kernel (`tf->regs.eax = …`) and the userspace stub
   (`movl %%eax, %0`) communicate through the `eax` slot of the trapframe, which the x86
   `iret` instruction restores into the user's `eax`.

4. **Unknown syscall returns `-1`** — unrecognised syscall numbers leave `eax = 0xFFFFFFFF`
   (i.e. `(unsigned int)-1`) and print a debug message. No kernel panic, allowing future
   syscalls to be added gracefully.

---

## File Change Summary

| File | Phase | Change |
|---|---|---|
| `kern/vmm/MPTNew/MPTNew.c` | 6 | Added `brk_init`, `alloc_pages`, `free_pages`, `free_range`, `sys_brk`; rewrote `alloc_page` for clarity |
| `kern/vmm/MPTNew/export.h` | 6 | Added 5 new prototypes |
| `kern/vmm/MPTNew/import.h` | 6 | Expanded from 4 to 13 imports |
| `kern/vmm/MPTNew/test.c` | 6 | Added includes; replaced empty `test_own` with 2 real tests |
| `kern/vmm/MPTInit/MPTInit.c` | 6 | Added `brk_init()` call in `paging_init` |
| `kern/vmm/MPTInit/import.h` | 6 | Added `brk_init` declaration |
| `kern/lib/x86.h` | 7 | Added `SYS_BRK = 1` |
| `kern/lib/trap.c` | 7 | Added `syscall_handler`; extended `trap()` with `T_SYSCALL` branch |
| `user/include/syscall.h` | 7 | Declared `void *brk(void *addr)` |
| `user/lib/fake_syscall.c` | 7 | Implemented `brk()` inline-assembly stub |

---

## Backward Compatibility

- `alloc_page`, `alloc_mem_quota`, `MPTNew_test1` — unchanged.
- `palloc`, `pfree`, `palloc_n`, `pfree_n`, `container_alloc`, `container_alloc_n` — all unchanged.
- `trap()` for `T_PGFLT` — unchanged; new `T_SYSCALL` branch is purely additive.
- Existing userspace functions (`yield`, `sys_getc`, `sys_puts`) — unchanged.
- All previously passing tests (`MATIntro`, `MATOp`, `MContainer`, `MPTIntro`, `MPTOp`, `MPTComm`, `MPTKern`) — unaffected.
