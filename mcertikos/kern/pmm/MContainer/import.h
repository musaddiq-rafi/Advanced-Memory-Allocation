#ifndef _KERN_PMM_MCONTAINER_H_
#define _KERN_PMM_MCONTAINER_H_

#ifdef _KERN_

unsigned int get_nps(void);
unsigned int at_is_norm(unsigned int page_index);
unsigned int at_is_allocated(unsigned int page_index);
void pmem_init(unsigned int mbi_addr);
unsigned int palloc(void);
void pfree(unsigned int pfree_index);

// Buddy allocator functions (from MATOp, Phase 2)
unsigned int palloc_n(unsigned int order);
void pfree_n(unsigned int page_index, unsigned int order);
void buddy_init(void);

#endif  /* _KERN_ */

#endif  /* !_KERN_PMM_MCONTAINER_H_ */
