#include "import.h"

/**
 * Initializes the page structures, enables PSE for super-page support,
 * moves to the kernel page structure (0), and turns on the paging.
 */
void paging_init(unsigned int mbi_addr)
{
    pdir_init_kern(mbi_addr);
    enable_pse();   /* Enable 4 MB page support (Phase 4) */
    brk_init();     /* Initialise per-process program breaks (Phase 6) */
    set_pdir_base(0);
    enable_paging();
}
