#ifndef _KERN_VMM_MPTINIT_H_
#define _KERN_VMM_MPTINIT_H_

#ifdef _KERN_

void pdir_init_kern(unsigned int mbi_addr);
void set_pdir_base(unsigned int index);
void enable_paging(void);
void enable_pse(void);
void brk_init(void);

#endif  /* _KERN_ */

#endif  /* !_KERN_VMM_MPTINIT_H_ */
