#ifndef _KERN_VMM_MPTKERN_H_
#define _KERN_VMM_MPTKERN_H_

#ifdef _KERN_

void pdir_init(unsigned int mbi_addr);
void set_pdir_entry_identity(unsigned int proc_index, unsigned int pde_index);
unsigned int get_pdir_entry_by_va(unsigned int proc_index, unsigned int vaddr);
unsigned int alloc_ptbl(unsigned int proc_index, unsigned int vaddr);
void set_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr,
                          unsigned int page_index, unsigned int perm);
void rmv_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr);
unsigned int get_ptbl_entry_by_va(unsigned int proc_index, unsigned int vaddr);

// Super-page PDE functions (from MPTIntro, Phase 4)
void set_pdir_entry_superpage(unsigned int proc_index, unsigned int pde_index,
                              unsigned int page_index, unsigned int perm);
unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index);
void rmv_pdir_entry(unsigned int proc_index, unsigned int pde_index);
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index);

#endif  /* _KERN_ */

#endif  /* !_KERN_VMM_MPTKERN_H_ */
