#include <string.h>

#define VM_DYNLINK 0xe0000000

#define dll ((unsigned int *) VM_DYNLINK)

typedef void (*print_t)(char *, ...);
print_t kprint;

typedef char (*getc_t)(void);
getc_t kgetc;

void init()
{
    kprint = (print_t)(dll[0]);
    kgetc = (getc_t)(dll[1]);
}

void yield()
{

}

int sys_getc(void)
{
    return kgetc();
}

char output[1024];

void sys_puts(const char *s, unsigned int len)
{
    unsigned int rlen = len < 1023 ? len : 1023;
    strncpy(output, s, rlen);
    output[rlen] = '\0';
    kprint("%s", s);
}

/* Phase 7 — brk() syscall stub.
 *
 * Calling convention:
 *   eax = SYS_BRK (1)
 *   ebx = new_brk (0 = query current break)
 * Return value (new break, or 0 on failure) is left in eax.
 */
#define SYS_BRK    1
#define T_SYSCALL  48

void *brk(void *addr)
{
    unsigned int result;
    __asm__ __volatile__ (
        "movl %1, %%eax\n"
        "movl %2, %%ebx\n"
        "int  %3\n"
        "movl %%eax, %0\n"
        : "=r" (result)
        : "i" (SYS_BRK),
          "r" ((unsigned int)(addr)),
          "i" (T_SYSCALL)
        : "eax", "ebx"
    );
    return (void *)result;
}
