#include <lib/x86.h>
#include <lib/debug.h>
#include "export.h"

extern char *PDirPool[NUM_IDS][1024];
extern unsigned int IDPTbl[1024][1024];

int MPTIntro_test1()
{
    set_pdir_base(0);
    if ((unsigned int) PDirPool[0] != rcr3()) {
        dprintf("test 1.1 failed: (%d != %d)\n",
                (unsigned int) PDirPool[0], rcr3());
        return 1;
    }
    set_pdir_entry_identity(1, 1);
    set_pdir_entry(1, 2, 100);
    if (get_pdir_entry(1, 1) != (unsigned int) IDPTbl[1] + 7) {
        dprintf("test 1.2 failed: (%d != %d)\n",
                get_pdir_entry(1, 1), (unsigned int) IDPTbl[1] + 7);
        return 1;
    }
    if (get_pdir_entry(1, 2) != 409607) {
        dprintf("test 1.3 failed: (%d != 409607)\n", get_pdir_entry(1, 2));
        return 1;
    }
    rmv_pdir_entry(1, 1);
    rmv_pdir_entry(1, 2);
    if (get_pdir_entry(1, 1) != 0 || get_pdir_entry(1, 2) != 0) {
        dprintf("test 1.4 failed: (%d != 0 || %d != 0)\n",
                get_pdir_entry(1, 1), get_pdir_entry(1, 2));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}

int MPTIntro_test2()
{
    set_pdir_entry(1, 1, 10000);
    set_ptbl_entry(1, 1, 1, 10000, 259);
    if (get_ptbl_entry(1, 1, 1) != 40960259) {
        dprintf("test 2.1 failed: (%d != 40960259)\n", get_ptbl_entry(1, 1, 1));
        return 1;
    }
    rmv_ptbl_entry(1, 1, 1);
    if (get_ptbl_entry(1, 1, 1) != 0) {
        dprintf("test 2.2 failed: (%d != 0)\n", get_ptbl_entry(1, 1, 1));
        return 1;
    }
    rmv_pdir_entry(1, 1);
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
 * Test set_pdir_entry_superpage sets PDE with PTE_PS bit;
 * is_superpage returns 1.
 */
int MPTIntro_test_superpage_pde()
{
    unsigned int pde;

    dprintf("test superpage_pde: begin\n");

    /* Use proc 2, pde 256 (VA 0x40000000) for isolation */
    set_pdir_entry_superpage(2, 256, 0x40000, PTE_P | PTE_W | PTE_U);

    pde = get_pdir_entry(2, 256);

        dprintf("test superpage_pde: pde=0x%x (PTE_PS=%u) is_superpage=%u\n",
            pde, (pde & PTE_PS) ? 1 : 0, is_superpage(2, 256));
    if (!(pde & PTE_PS)) {
        dprintf("test superpage_pde failed: PTE_PS not set (pde=0x%x)\n", pde);
        rmv_pdir_entry(2, 256);
        return 1;
    }
    if (is_superpage(2, 256) != 1) {
        dprintf("test superpage_pde failed: is_superpage returned 0\n");
        rmv_pdir_entry(2, 256);
        return 1;
    }

    rmv_pdir_entry(2, 256);
    dprintf("test superpage_pde passed.\n");
    return 0;
}

/**
 * Test that the PDE encodes the correct physical address (page_index << 12)
 * and permission bits alongside the PS bit.
 */
int MPTIntro_test_superpage_addr()
{
    unsigned int pde, expected_addr, perm;

    dprintf("test superpage_addr: begin\n");

    /* page_index = 0x40000 (1024-page aligned), perm = P|W|U = 7 */
    set_pdir_entry_superpage(2, 257, 0x40000, PTE_P | PTE_W | PTE_U);

    pde = get_pdir_entry(2, 257);
    expected_addr = 0x40000 << 12;  /* = 0x40000000 */
    perm = PTE_P | PTE_W | PTE_U | PTE_PS;  /* 0x087 */

        dprintf("test superpage_addr: pde=0x%x expected_addr=0x%x expected_perm=0x%x\n",
            pde, expected_addr, perm);

    if ((pde & 0xFFFFF000) != expected_addr) {
        dprintf("test superpage_addr failed: addr 0x%x != 0x%x\n",
                pde & 0xFFFFF000, expected_addr);
        rmv_pdir_entry(2, 257);
        return 1;
    }
    if ((pde & 0xFFF) != perm) {
        dprintf("test superpage_addr failed: perm 0x%x != 0x%x\n",
                pde & 0xFFF, perm);
        rmv_pdir_entry(2, 257);
        return 1;
    }

    rmv_pdir_entry(2, 257);
    dprintf("test superpage_addr passed.\n");
    return 0;
}

/**
 * Test that a regular set_pdir_entry does NOT set PTE_PS;
 * is_superpage returns 0.
 */
int MPTIntro_test_not_superpage()
{
    unsigned int pde;

    dprintf("test not_superpage: begin\n");

    set_pdir_entry(2, 258, 10000);

    pde = get_pdir_entry(2, 258);

        dprintf("test not_superpage: pde=0x%x (PTE_PS=%u) is_superpage=%u\n",
            pde, (pde & PTE_PS) ? 1 : 0, is_superpage(2, 258));
    if (pde & PTE_PS) {
        dprintf("test not_superpage failed: PTE_PS is set on regular entry (pde=0x%x)\n", pde);
        rmv_pdir_entry(2, 258);
        return 1;
    }
    if (is_superpage(2, 258) != 0) {
        dprintf("test not_superpage failed: is_superpage returned 1\n");
        rmv_pdir_entry(2, 258);
        return 1;
    }

    rmv_pdir_entry(2, 258);
    dprintf("test not_superpage passed.\n");
    return 0;
}

int test_MPTIntro()
{
    return MPTIntro_test1() + MPTIntro_test2()
         + MPTIntro_test_superpage_pde()
         + MPTIntro_test_superpage_addr()
         + MPTIntro_test_not_superpage();
}
