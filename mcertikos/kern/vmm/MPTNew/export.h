#ifndef _KERN_VMM_MPTNEW_H_
#define _KERN_VMM_MPTNEW_H_

#ifdef _KERN_

/* Phase 0 (original) */
unsigned int alloc_page(unsigned int proc_index, unsigned int vaddr,
                        unsigned int perm);
unsigned int alloc_mem_quota(unsigned int id, unsigned int quota);

/* Phase 6 — multi-page allocation API */
unsigned int alloc_pages(unsigned int proc_index, unsigned int vaddr,
                         unsigned int perm, unsigned int order);
void free_pages(unsigned int proc_index, unsigned int vaddr,
                unsigned int order);
void free_range(unsigned int proc_index, unsigned int start,
                unsigned int end);

/* Phase 6 — brk tracking */
void brk_init(void);
unsigned int sys_brk(unsigned int proc_index, unsigned int new_brk);

#endif  /* _KERN_ */

#endif  /* !_KERN_VMM_MPTNEW_H_ */
