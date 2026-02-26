#include <lib/debug.h>
#include <lib/x86.h>
#include <pmm/MContainer/export.h>
#include <vmm/MPTOp/export.h>
#include <vmm/MPTIntro/export.h>
#include "export.h"

int MPTKern_test1()
{
    unsigned int vaddr = 4096 * 1024 * 300;
    container_split(0, 100);
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
        dprintf("test 1.1 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) != 0) {
        dprintf("test 1.2 failed: (%d != 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    map_page(1, vaddr, 100, 7);
    if (get_ptbl_entry_by_va(1, vaddr) == 0) {
        dprintf("test 1.3 failed: (%d == 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    if (get_pdir_entry_by_va(1, vaddr) == 0) {
        dprintf("test 1.4 failed: (%d == 0)\n", get_pdir_entry_by_va(1, vaddr));
        return 1;
    }
    unmap_page(1, vaddr);
    if (get_ptbl_entry_by_va(1, vaddr) != 0) {
        dprintf("test 1.5 failed: (%d != 0)\n", get_ptbl_entry_by_va(1, vaddr));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}

int MPTKern_test2()
{
    unsigned int i;
    for (i = 256; i < 960; i++) {
        if (get_ptbl_entry_by_va(0, i * 4096 * 1024L) !=
            i * 4096 * 1024L + 3) {
            dprintf("test 2.1 failed (i = %d): (%d != %d)\n",
                    get_ptbl_entry_by_va(0, i * 4096 * 1024L),
                    i * 4096 * 1024L + 3);
            return 1;
        }
    }
    dprintf("test 2 passed.\n");
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
 * Test map_superpage: sets PDE with PS bit and correct physical address.
 */
int MPTKern_test_map_superpage()
{
    unsigned int pde, page_index, pde_index;
    unsigned int vaddr = 4096 * 1024 * 256;  /* 0x40000000, PDE index 256 */

    page_index = 0x40000;  /* 1024-page aligned = 0x40000000 physical */

    map_superpage(2, vaddr, page_index, PTE_P | PTE_W | PTE_U);

    pde_index = vaddr >> 22;  /* = 256 */
    pde = get_pdir_entry(2, pde_index);

    /* PDE must have PTE_PS set */
    if (!(pde & PTE_PS)) {
        dprintf("test map_superpage failed: PTE_PS not set (pde=0x%x)\n", pde);
        rmv_pdir_entry(2, pde_index);
        return 1;
    }

    /* is_superpage must return 1 */
    if (is_superpage(2, pde_index) != 1) {
        dprintf("test map_superpage failed: is_superpage returned 0\n");
        rmv_pdir_entry(2, pde_index);
        return 1;
    }

    /* Physical address must be page_index << 12 */
    if ((pde & 0xFFFFF000) != (page_index << 12)) {
        dprintf("test map_superpage failed: addr 0x%x != 0x%x\n",
                pde & 0xFFFFF000, page_index << 12);
        rmv_pdir_entry(2, pde_index);
        return 1;
    }

    rmv_pdir_entry(2, pde_index);
    dprintf("test map_superpage passed.\n");
    return 0;
}

/**
 * Test unmap_superpage: clears the PDE entry.
 */
int MPTKern_test_unmap_superpage()
{
    unsigned int pde, pde_index;
    unsigned int vaddr = 4096 * 1024 * 257;  /* PDE index 257 */
    unsigned int page_index = 0x40400;  /* 1024-aligned */

    map_superpage(2, vaddr, page_index, PTE_P | PTE_W | PTE_U);

    pde_index = vaddr >> 22;  /* = 257 */

    /* Verify it's mapped first */
    pde = get_pdir_entry(2, pde_index);
    if (pde == 0) {
        dprintf("test unmap_superpage failed: PDE not set after map\n");
        return 1;
    }

    /* Now unmap */
    unmap_superpage(2, vaddr);

    pde = get_pdir_entry(2, pde_index);
    if (pde != 0) {
        dprintf("test unmap_superpage failed: PDE not cleared (pde=0x%x)\n", pde);
        return 1;
    }

    if (is_superpage(2, pde_index) != 0) {
        dprintf("test unmap_superpage failed: is_superpage still 1 after unmap\n");
        return 1;
    }

    dprintf("test unmap_superpage passed.\n");
    return 0;
}

int test_MPTKern()
{
    return MPTKern_test1() + MPTKern_test2()
         + MPTKern_test_map_superpage()
         + MPTKern_test_unmap_superpage();
}
