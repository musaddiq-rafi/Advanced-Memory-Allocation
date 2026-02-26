#include <lib/debug.h>
#include "export.h"

int MContainer_test1()
{
    if (container_get_quota(0) <= 10000) {
        dprintf("test 1.1 failed: (%d <= 10000)\n", container_get_quota(0));
        return 1;
    }
    if (container_can_consume(0, 10000) != 1) {
        dprintf("test 1.2 failed: (%d != 1)\n", container_can_consume(0, 10000));
        return 1;
    }
    if (container_can_consume(0, 10000000) != 0) {
        dprintf("test 1.3 failed: (%d != 0)\n", container_can_consume(0, 10000000));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}

int MContainer_test2()
{
    unsigned int old_usage = container_get_usage(0);
    unsigned int old_nchildren = container_get_nchildren(0);
    unsigned int chid = container_split(0, 100);
    if (container_get_quota(chid) != 100
        || container_get_parent(chid) != 0
        || container_get_usage(chid) != 0
        || container_get_nchildren(chid) != 0
        || container_get_usage(0) != old_usage + 100
        || container_get_nchildren(0) != old_nchildren + 1) {
        dprintf("test 2.1 failed:\n"
                "(%d != 100 || %d != 0 || %d != 0\n"
                " || %d != 0 || %d != %d || %d != %d)\n",
                container_get_quota(chid),
                container_get_parent(chid),
                container_get_usage(chid),
                container_get_nchildren(chid),
                container_get_usage(0), old_usage + 100,
                container_get_nchildren(0), old_nchildren + 1);
        return 1;
    }
    container_alloc(chid);
    if (container_get_usage(chid) != 1) {
        dprintf("test 2.2 failed: (%d != 1)\n", container_get_usage(chid));
        return 1;
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
 * Test container_alloc_n: allocate 2^3 = 8 pages, verify usage deducted
 * and a valid page index returned.
 */
int MContainer_test_alloc_n()
{
    unsigned int chid, old_usage_0, pi;

    /* Create a child with quota 100 for isolated testing */
    old_usage_0 = container_get_usage(0);
    chid = container_split(0, 100);
    if (chid >= 64) {
        dprintf("test alloc_n failed: container_split returned %u\n", chid);
        return 1;
    }

    pi = container_alloc_n(chid, 3);  /* 2^3 = 8 pages */
    if (pi == 0) {
        dprintf("test alloc_n failed: container_alloc_n returned 0\n");
        return 1;
    }
    if (container_get_usage(chid) != 8) {
        dprintf("test alloc_n failed: usage = %d, expected 8\n", container_get_usage(chid));
        container_free_n(chid, pi, 3);
        return 1;
    }

    /* Clean up */
    container_free_n(chid, pi, 3);
    if (container_get_usage(chid) != 0) {
        dprintf("test alloc_n failed: usage after free = %d, expected 0\n", container_get_usage(chid));
        return 1;
    }

    dprintf("test alloc_n passed.\n");
    return 0;
}

/**
 * Test container_free_n: allocate then free, verify usage returns to previous value.
 */
int MContainer_test_free_n()
{
    unsigned int chid, pi, usage_before;

    /* Create a child with quota 64 */
    chid = container_split(0, 64);
    if (chid >= 64) {
        dprintf("test free_n failed: container_split returned %u\n", chid);
        return 1;
    }

    usage_before = container_get_usage(chid);  /* should be 0 */

    pi = container_alloc_n(chid, 2);  /* 2^2 = 4 pages */
    if (pi == 0) {
        dprintf("test free_n failed: container_alloc_n returned 0\n");
        return 1;
    }
    if (container_get_usage(chid) != usage_before + 4) {
        dprintf("test free_n failed: usage = %d, expected %d\n",
                container_get_usage(chid), usage_before + 4);
        container_free_n(chid, pi, 2);
        return 1;
    }

    container_free_n(chid, pi, 2);
    if (container_get_usage(chid) != usage_before) {
        dprintf("test free_n failed: usage after free = %d, expected %d\n",
                container_get_usage(chid), usage_before);
        return 1;
    }

    dprintf("test free_n passed.\n");
    return 0;
}

/**
 * Test quota limit: allocation fails when quota - usage < count;
 * usage must remain unchanged on failure.
 */
int MContainer_test_quota_limit()
{
    unsigned int chid, pi, usage_before;

    /* Create a child with quota 4 — just enough for order-2 but not order-3 */
    chid = container_split(0, 4);
    if (chid >= 64) {
        dprintf("test quota_limit failed: container_split returned %u\n", chid);
        return 1;
    }

    usage_before = container_get_usage(chid);  /* 0 */

    /* order-3 needs 8 pages, quota is only 4 — must fail */
    pi = container_alloc_n(chid, 3);
    if (pi != 0) {
        dprintf("test quota_limit failed: alloc should have returned 0 but got %u\n", pi);
        container_free_n(chid, pi, 3);
        return 1;
    }
    if (container_get_usage(chid) != usage_before) {
        dprintf("test quota_limit failed: usage changed to %d after failed alloc\n",
                container_get_usage(chid));
        return 1;
    }

    /* order-2 needs 4 pages, quota is 4 — should succeed */
    pi = container_alloc_n(chid, 2);
    if (pi == 0) {
        dprintf("test quota_limit failed: order-2 alloc returned 0\n");
        return 1;
    }
    container_free_n(chid, pi, 2);

    dprintf("test quota_limit passed.\n");
    return 0;
}

/**
 * Test backward compatibility: container_alloc / container_free still work.
 */
int MContainer_test_backward_compat()
{
    unsigned int chid, pi, usage_after_alloc;

    chid = container_split(0, 50);
    if (chid >= 64) {
        dprintf("test backward_compat failed: container_split returned %u\n", chid);
        return 1;
    }

    pi = container_alloc(chid);
    if (pi == 0) {
        dprintf("test backward_compat failed: container_alloc returned 0\n");
        return 1;
    }
    usage_after_alloc = container_get_usage(chid);
    if (usage_after_alloc != 1) {
        dprintf("test backward_compat failed: usage = %d, expected 1\n", usage_after_alloc);
        container_free(chid, pi);
        return 1;
    }

    container_free(chid, pi);
    if (container_get_usage(chid) != 0) {
        dprintf("test backward_compat failed: usage after free = %d\n", container_get_usage(chid));
        return 1;
    }

    dprintf("test backward_compat passed.\n");
    return 0;
}

int test_MContainer()
{
    return MContainer_test1()
         + MContainer_test2()
         + MContainer_test_alloc_n()
         + MContainer_test_free_n()
         + MContainer_test_quota_limit()
         + MContainer_test_backward_compat();
}
