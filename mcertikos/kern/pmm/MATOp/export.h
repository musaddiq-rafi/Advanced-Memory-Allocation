#ifndef _KERN_PMM_MATOP_H_
#define _KERN_PMM_MATOP_H_

#ifdef _KERN_

unsigned int palloc(void);
void pfree(unsigned int pfree_index);

unsigned int palloc_n(unsigned int order);
void pfree_n(unsigned int page_index, unsigned int order);
void buddy_init(void);

#endif  /* _KERN_ */

#endif  /* !_KERN_PMM_MATOP_H_ */
