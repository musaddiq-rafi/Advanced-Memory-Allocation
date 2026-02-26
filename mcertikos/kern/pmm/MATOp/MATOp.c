#include <lib/debug.h>
#include <lib/types.h>
#include "import.h"

#define PAGESIZE     4096
#define VM_USERLO    0x40000000
#define VM_USERHI    0xF0000000
#define VM_USERLO_PI (VM_USERLO / PAGESIZE)
#define VM_USERHI_PI (VM_USERHI / PAGESIZE)

#define MAX_ORDER 10  /* 2^10 = 1024 pages = 4 MB */

/**
 * Per-page doubly-linked free-list node.
 * prev/next store page indices; 0 means "no node" (sentinel).
 */
struct FreeNode {
    unsigned int prev;
    unsigned int next;
};

static struct FreeNode free_nodes[1 << 20];
static unsigned int free_list_head[MAX_ORDER + 1];  /* head page index per order; 0 = empty */

/* ------------------------------------------------------------------ */
/*  Free-list helpers                                                   */
/* ------------------------------------------------------------------ */

/** Remove page_index from its order's free list. */
static void fl_remove(unsigned int page_index, unsigned int order)
{
    unsigned int p = free_nodes[page_index].prev;
    unsigned int n = free_nodes[page_index].next;

    if (p != 0)
        free_nodes[p].next = n;
    else
        free_list_head[order] = n;  /* was the head */

    if (n != 0)
        free_nodes[n].prev = p;

    free_nodes[page_index].prev = 0;
    free_nodes[page_index].next = 0;
}

/** Insert page_index at the head of the order's free list. */
static void fl_insert(unsigned int page_index, unsigned int order)
{
    unsigned int old_head = free_list_head[order];

    free_nodes[page_index].prev = 0;
    free_nodes[page_index].next = old_head;

    if (old_head != 0)
        free_nodes[old_head].prev = page_index;

    free_list_head[order] = page_index;
}

/* ------------------------------------------------------------------ */
/*  Buddy allocator core                                                */
/* ------------------------------------------------------------------ */

/**
 * buddy_init — build initial free lists from the AT.
 *
 * Called once after pmem_init().  Scans all normal, unallocated pages in
 * [VM_USERLO_PI, VM_USERHI_PI) and groups them into the largest possible
 * power-of-2-aligned buddy blocks, inserting each into its free list.
 */
void buddy_init(void)
{
    unsigned int i, order, block_size;

    /* Zero all free-list state */
    for (i = 0; i < (1u << 20); i++) {
        free_nodes[i].prev = 0;
        free_nodes[i].next = 0;
    }
    for (i = 0; i <= MAX_ORDER; i++)
        free_list_head[i] = 0;

    /* Walk the user region and form the largest blocks we can.
     * A block of order k requires:
     *   - page_index aligned to 2^k
     *   - 2^k consecutive normal-perm, unallocated pages
     */
    i = VM_USERLO_PI;
    while (i < VM_USERHI_PI) {
        if (!at_is_norm(i) || at_is_allocated(i)) {
            i++;
            continue;
        }

        /* Find the largest order that fits alignment and available run. */
        order = 0;
        while (order < MAX_ORDER) {
            unsigned int next_order = order + 1;
            block_size = 1u << next_order;
            /* Alignment check */
            if ((i & (block_size - 1)) != 0)
                break;
            /* Range check */
            if (i + block_size > VM_USERHI_PI)
                break;
            /* All pages in the extended block must be normal & unallocated */
            {
                unsigned int j;
                unsigned int ok = 1;
                for (j = i + (1u << order); j < i + block_size; j++) {
                    if (!at_is_norm(j) || at_is_allocated(j)) {
                        ok = 0;
                        break;
                    }
                }
                if (!ok)
                    break;
            }
            order = next_order;
        }

        block_size = 1u << order;

        /* Mark AT metadata for this block */
        at_set_order(i, order);
        at_set_head(i, 1);
        {
            unsigned int j;
            for (j = 1; j < block_size; j++) {
                at_set_order(i + j, 0);
                at_set_head(i + j, 0);
            }
        }

        fl_insert(i, order);

        i += block_size;
    }
}

/**
 * palloc_n — allocate 2^order consecutive, aligned physical pages.
 *
 * Returns the starting page index, or 0 on failure.
 */
unsigned int palloc_n(unsigned int order)
{
    unsigned int current_order, page_index, block_size, i;

    if (order > MAX_ORDER)
        return 0;

    /* Walk up from requested order to find a free block. */
    for (current_order = order; current_order <= MAX_ORDER; current_order++) {
        if (free_list_head[current_order] != 0)
            break;
    }
    if (current_order > MAX_ORDER)
        return 0;  /* out of memory */

    /* Pop the first block from this order's free list. */
    page_index = free_list_head[current_order];
    fl_remove(page_index, current_order);

    /* Split down to the requested order. */
    while (current_order > order) {
        current_order--;
        /* The upper "buddy" half goes back on the free list. */
        {
            unsigned int buddy = page_index + (1u << current_order);
            at_set_order(buddy, current_order);
            at_set_head(buddy, 1);
            fl_insert(buddy, current_order);
        }
    }

    /* Mark all pages in the allocated block. */
    block_size = 1u << order;
    at_set_order(page_index, order);
    at_set_head(page_index, 1);
    for (i = 0; i < block_size; i++)
        at_set_allocated(page_index + i, 1);

    /* Clear head flag on non-head pages of this block */
    for (i = 1; i < block_size; i++)
        at_set_head(page_index + i, 0);

    return page_index;
}

/**
 * pfree_n — free a 2^order block starting at page_index.
 *
 * Coalesces with the buddy if the buddy is free and at the same order.
 */
void pfree_n(unsigned int page_index, unsigned int order)
{
    unsigned int block_size, i, buddy;

    if (order > MAX_ORDER)
        return;

    /* Mark all pages as unallocated. */
    block_size = 1u << order;
    for (i = 0; i < block_size; i++)
        at_set_allocated(page_index + i, 0);

    /* Coalesce with buddy while possible. */
    while (order < MAX_ORDER) {
        buddy = page_index ^ (1u << order);

        /* Buddy must be in user range */
        if (buddy < VM_USERLO_PI || buddy + (1u << order) > VM_USERHI_PI)
            break;

        /* Buddy must be free, same order, and a head */
        if (at_is_allocated(buddy))
            break;
        if (!at_is_head(buddy))
            break;
        if (at_get_order(buddy) != order)
            break;

        /* Remove buddy from its free list and merge */
        fl_remove(buddy, order);

        /* The merged block starts at the lower of the two */
        if (buddy < page_index)
            page_index = buddy;

        order++;
    }

    /* Set metadata on the (possibly merged) block head */
    at_set_order(page_index, order);
    at_set_head(page_index, 1);

    fl_insert(page_index, order);
}

/**
 * palloc — allocate a single physical page (backward compatible).
 *
 * Thin wrapper around palloc_n(0).
 */
unsigned int palloc(void)
{
    return palloc_n(0);
}

/**
 * pfree — free a single physical page (backward compatible).
 *
 * Thin wrapper around pfree_n(page_index, 0).
 */
void pfree(unsigned int pfree_index)
{
    pfree_n(pfree_index, 0);
}
