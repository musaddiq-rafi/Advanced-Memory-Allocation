#ifndef _KERN_PMM_MATINTRO_H_
#define _KERN_PMM_MATINTRO_H_

#ifdef _KERN_

unsigned int get_nps(void);
void set_nps(unsigned int page_index);

unsigned int at_is_norm(unsigned int page_index);
void at_set_perm(unsigned int page_index, unsigned int perm);

unsigned int at_is_allocated(unsigned int page_index);
void at_set_allocated(unsigned int page_index, unsigned int allocated);

unsigned int at_get_order(unsigned int page_index);
void at_set_order(unsigned int page_index, unsigned int order);

unsigned int at_is_head(unsigned int page_index);
void at_set_head(unsigned int page_index, unsigned int head);

#endif  /* _KERN_ */

#endif  /* !_KERN_PMM_MATINTRO_H_ */
