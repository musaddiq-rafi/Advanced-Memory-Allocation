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
 * Creates a dedicated child container, allocates 4 consecutive pages at a
 * fixed VA, verifies all 4 PTEs are present, then frees and verifies cleared.
 */
int MPTNew_test_alloc_free_pages()
{
    unsigned int vaddr = 0x60000000;  /* well inside user range, not used by test1 */
    unsigned int chid;
    unsigned int i, pte;
    unsigned int result;
    unsigned int old_nchildren = container_get_nchildren(0);

    /* Allocate a dedicated child with enough quota for 4 pages + 1 page table */
    chid = container_split(0, 16);
    if (chid >= NUM_IDS) {
        dprintf("test alloc_free_pages failed: container_split returned %u\n", chid);
        return 1;
    }

    result = alloc_pages(chid, vaddr, PTE_P | PTE_W | PTE_U, 2);
    if (result == MagicNumber) {
        dprintf("test alloc_free_pages failed: alloc_pages order-2 returned MagicNumber\n");
        return 1;
    }

    /* All 4 PTEs must be present */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, vaddr + i * 4096);
        if (!(pte & PTE_P)) {
            dprintf("test alloc_free_pages failed: page %u not mapped (pte=0x%x)\n", i, pte);
            free_pages(chid, vaddr, 2);
            return 1;
        }
    }

    free_pages(chid, vaddr, 2);

    /* After freeing, PTEs must be cleared */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, vaddr + i * 4096);
        if (pte & PTE_P) {
            dprintf("test alloc_free_pages failed: page %u still mapped after free\n", i);
            return 1;
        }
    }

    dprintf("test alloc_free_pages passed.\n");
    return 0;
}

/**
 * Test sys_brk: set break, grow by 4 pages, verify PTEs, shrink back,
 * verify PTEs cleared.  Also tests the query (new_brk == 0) path.
 *
 * Uses a dedicated child container so the test is self-contained.
 */
int MPTNew_test_brk_grow_shrink()
{
    unsigned int chid;
    unsigned int brk0, brk1, brk2;
    unsigned int i, pte;

    /* Fresh child with enough quota for 4 data pages + page-table page */
    chid = container_split(0, 16);
    if (chid >= NUM_IDS) {
        dprintf("test brk_grow_shrink failed: container_split returned %u\n", chid);
        return 1;
    }

    /* Explicitly seed the break for this child to VM_USERLO */
    brk0 = sys_brk(chid, 0x40000000);
    if (brk0 != 0x40000000) {
        dprintf("test brk_grow_shrink failed: initial brk set returned 0x%x\n", brk0);
        return 1;
    }

    /* Query must return same value */
    if (sys_brk(chid, 0) != brk0) {
        dprintf("test brk_grow_shrink failed: query returned wrong value\n");
        return 1;
    }

    /* Grow by 4 pages */
    brk1 = sys_brk(chid, brk0 + 4 * 4096);
    if (brk1 != brk0 + 4 * 4096) {
        dprintf("test brk_grow_shrink failed: grow returned 0x%x, expected 0x%x\n",
                brk1, brk0 + 4 * 4096);
        if (brk1) sys_brk(chid, brk0);
        return 1;
    }

    /* All 4 pages must be mapped */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, brk0 + i * 4096);
        if (!(pte & PTE_P)) {
            dprintf("test brk_grow_shrink failed: page %u not mapped after grow\n", i);
            sys_brk(chid, brk0);
            return 1;
        }
    }

    /* Shrink back to brk0 */
    brk2 = sys_brk(chid, brk0);
    if (brk2 != brk0) {
        dprintf("test brk_grow_shrink failed: shrink returned 0x%x, expected 0x%x\n",
                brk2, brk0);
        return 1;
    }

    /* All 4 pages must be unmapped */
    for (i = 0; i < 4; i++) {
        pte = get_ptbl_entry_by_va(chid, brk0 + i * 4096);
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
    return MPTNew_test_alloc_free_pages() + MPTNew_test_brk_grow_shrink();
}

int test_MPTNew()
{
    return MPTNew_test1() + MPTNew_test_own();
}
