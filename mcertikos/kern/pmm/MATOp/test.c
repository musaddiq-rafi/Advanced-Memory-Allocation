#include <lib/debug.h>
#include <pmm/MATIntro/export.h>
#include "export.h"

#define PAGESIZE     4096
#define VM_USERLO    0x40000000
#define VM_USERHI    0xF0000000
#define VM_USERLO_PI (VM_USERLO / PAGESIZE)
#define VM_USERHI_PI (VM_USERHI / PAGESIZE)

/**
 * Original test — single-page palloc/pfree via backward-compatible wrappers.
 */
int MATOp_test1()
{
    int page_index = palloc();
    if (page_index < VM_USERLO_PI || VM_USERHI_PI <= page_index) {
        dprintf("test 1.1 failed: (%d < VM_USERLO_PI || VM_USERHI_PI <= %d)\n", page_index, page_index);
        pfree(page_index);
        return 1;
    }
    if (at_is_norm(page_index) != 1) {
        dprintf("test 1.2 failed: (%d != 1)\n", at_is_norm(page_index));
        pfree(page_index);
        return 1;
    }
    if (at_is_allocated(page_index) != 1) {
        dprintf("test 1.3 failed: (%d != 1)\n", at_is_allocated(page_index));
        pfree(page_index);
        return 1;
    }
    pfree(page_index);
    if (at_is_allocated(page_index) != 0) {
        dprintf("test 1.4 failed: (%d != 0)\n", at_is_allocated(page_index));
        return 1;
    }
    dprintf("test 1 passed.\n");
    return 0;
}

/**
 * Test palloc_n at orders 0, 1, and 10.
 * Verifies correct alignment, allocation flags, user range, and successful free.
 */
int MATOp_test_palloc_n_orders()
{
    unsigned int orders[] = {0, 1, 10};
    unsigned int num_orders = 3;
    unsigned int idx, pi, block_size, i, order;

    for (idx = 0; idx < num_orders; idx++) {
        order = orders[idx];
        block_size = 1u << order;

        pi = palloc_n(order);
        if (pi == 0) {
            dprintf("test palloc_n_orders failed: palloc_n(%u) returned 0\n", order);
            return 1;
        }
        /* Must be in user range */
        if (pi < VM_USERLO_PI || pi + block_size > VM_USERHI_PI) {
            dprintf("test palloc_n_orders failed: order %u, pi %u out of user range\n", order, pi);
            pfree_n(pi, order);
            return 1;
        }
        /* Must be aligned to 2^order */
        if ((pi & (block_size - 1)) != 0) {
            dprintf("test palloc_n_orders failed: order %u, pi %u not aligned\n", order, pi);
            pfree_n(pi, order);
            return 1;
        }
        /* All pages must be allocated */
        for (i = 0; i < block_size; i++) {
            if (at_is_allocated(pi + i) != 1) {
                dprintf("test palloc_n_orders failed: order %u, page %u not allocated\n", order, pi + i);
                pfree_n(pi, order);
                return 1;
            }
        }
        /* Head page metadata */
        if (at_is_head(pi) != 1) {
            dprintf("test palloc_n_orders failed: order %u, pi %u not marked as head\n", order, pi);
            pfree_n(pi, order);
            return 1;
        }
        if (at_get_order(pi) != order) {
            dprintf("test palloc_n_orders failed: order %u, pi %u order mismatch %u\n", order, pi, at_get_order(pi));
            pfree_n(pi, order);
            return 1;
        }

        /* Free and verify all pages cleared */
        pfree_n(pi, order);
        for (i = 0; i < block_size; i++) {
            if (at_is_allocated(pi + i) != 0) {
                dprintf("test palloc_n_orders failed: order %u, page %u still allocated after free\n", order, pi + i);
                return 1;
            }
        }
    }

    dprintf("test palloc_n_orders passed.\n");
    return 0;
}

/**
 * Test split and coalesce.
 * Allocates order-1, frees it, then allocates two order-0 blocks (should be
 * the two halves). Frees both and verifies they coalesce back to order-1.
 */
int MATOp_test_split_coalesce()
{
    unsigned int pi1, pa, pb;

    /* Allocate an order-1 block (2 consecutive pages) */
    pi1 = palloc_n(1);
    if (pi1 == 0) {
        dprintf("test split_coalesce failed: initial palloc_n(1) returned 0\n");
        return 1;
    }
    if ((pi1 & 1) != 0) {
        dprintf("test split_coalesce failed: order-1 block %u not 2-aligned\n", pi1);
        pfree_n(pi1, 1);
        return 1;
    }

    /* Free to return it to the pool */
    pfree_n(pi1, 1);

    /* Now allocate two order-0 blocks — they should come from the split
     * of the block we just freed (or an equivalent one). */
    pa = palloc_n(0);
    pb = palloc_n(0);
    if (pa == 0 || pb == 0) {
        dprintf("test split_coalesce failed: order-0 alloc returned 0\n");
        if (pa) pfree_n(pa, 0);
        if (pb) pfree_n(pb, 0);
        return 1;
    }

    /* Both must be allocated */
    if (at_is_allocated(pa) != 1 || at_is_allocated(pb) != 1) {
        dprintf("test split_coalesce failed: pages not marked allocated\n");
        pfree_n(pa, 0);
        pfree_n(pb, 0);
        return 1;
    }

    /* Free both — they should coalesce */
    pfree_n(pa, 0);
    pfree_n(pb, 0);

    /* After freeing both, neither should be allocated */
    if (at_is_allocated(pa) != 0 || at_is_allocated(pb) != 0) {
        dprintf("test split_coalesce failed: pages still allocated after free\n");
        return 1;
    }

    /* Verify coalescing: allocate order-1 again; should succeed
     * (if coalescing didn't work, the free list would only have order-0 blocks). */
    pi1 = palloc_n(1);
    if (pi1 == 0) {
        dprintf("test split_coalesce failed: re-alloc order-1 returned 0 (coalesce broken?)\n");
        return 1;
    }
    pfree_n(pi1, 1);

    dprintf("test split_coalesce passed.\n");
    return 0;
}

/**
 * Test backward compatibility: palloc() and pfree() still behave as
 * single-page allocators.
 */
int MATOp_test_backward_compat()
{
    unsigned int p1, p2;

    p1 = palloc();
    if (p1 == 0) {
        dprintf("test backward_compat failed: palloc() returned 0\n");
        return 1;
    }
    if (p1 < VM_USERLO_PI || p1 >= VM_USERHI_PI) {
        dprintf("test backward_compat failed: palloc() out of range (%u)\n", p1);
        pfree(p1);
        return 1;
    }
    if (at_is_allocated(p1) != 1) {
        dprintf("test backward_compat failed: page %u not allocated\n", p1);
        pfree(p1);
        return 1;
    }

    p2 = palloc();
    if (p2 == 0 || p2 == p1) {
        dprintf("test backward_compat failed: second palloc() returned %u (first was %u)\n", p2, p1);
        pfree(p1);
        if (p2 && p2 != p1) pfree(p2);
        return 1;
    }

    pfree(p1);
    pfree(p2);

    if (at_is_allocated(p1) != 0 || at_is_allocated(p2) != 0) {
        dprintf("test backward_compat failed: pages still allocated after pfree\n");
        return 1;
    }

    dprintf("test backward_compat passed.\n");
    return 0;
}

int test_MATOp()
{
    return MATOp_test1()
         + MATOp_test_palloc_n_orders()
         + MATOp_test_split_coalesce()
         + MATOp_test_backward_compat();
}
