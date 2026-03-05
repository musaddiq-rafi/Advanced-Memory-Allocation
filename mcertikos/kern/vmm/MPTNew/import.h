#ifndef _KERN_VMM_MPTNEW_IMPORT_H_
#define _KERN_VMM_MPTNEW_IMPORT_H_

#ifdef _KERN_

/* MContainer */
unsigned int container_alloc(unsigned int id);
void container_free(unsigned int id, unsigned int page_index);
unsigned int container_split(unsigned int id, unsigned int quota);
unsigned int container_alloc_n(unsigned int id, unsigned int order);
void container_free_n(unsigned int id, unsigned int page_index,
                      unsigned int order);

/* MPTKern — regular page map */
unsigned int map_page(unsigned int proc_index, unsigned int vaddr,
                      unsigned int page_index, unsigned int perm);
unsigned int unmap_page(unsigned int proc_index, unsigned int vaddr);

/* MPTKern — super-page map */
unsigned int map_superpage(unsigned int proc_index, unsigned int vaddr,
                           unsigned int page_index, unsigned int perm);
void unmap_superpage(unsigned int proc_index, unsigned int vaddr);

/* MPTIntro — PDE/PTE inspection */
unsigned int is_superpage(unsigned int proc_index, unsigned int pde_index);
unsigned int get_pdir_entry(unsigned int proc_index, unsigned int pde_index);
unsigned int get_ptbl_entry_by_va(unsigned int proc_index,
                                  unsigned int vaddr);

/* MATIntro — AT metadata (for free_range order lookup) */
unsigned int at_get_order(unsigned int page_index);

#endif  /* _KERN_ */

#endif  /* !_KERN_VMM_MPTNEW_IMPORT_H_ */
