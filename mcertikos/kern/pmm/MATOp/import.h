#ifndef _KERN_PMM_MATOP_H_
#define _KERN_PMM_MATOP_H_

#ifdef _KERN_

/**
 * The getter and setter functions implemented in the MATIntro layer.
 */

// The total number of physical pages.
unsigned int get_nps(void);

// Whether the page with the given index has normal permissions.
unsigned int at_is_norm(unsigned int page_index);

// Whether the page with the given index is already allocated.
unsigned int at_is_allocated(unsigned int page_index);

// Mark the allocation flag of the page with the given index using the given value.
void at_set_allocated(unsigned int page_index, unsigned int allocated);

// Buddy order getter/setter (from Phase 1 MATIntro extension).
unsigned int at_get_order(unsigned int page_index);
void at_set_order(unsigned int page_index, unsigned int order);

// Head flag getter/setter (from Phase 1 MATIntro extension).
unsigned int at_is_head(unsigned int page_index);
void at_set_head(unsigned int page_index, unsigned int head);

#endif  /* _KERN_ */

#endif  /* !_KERN_PMM_MATOP_H_ */
