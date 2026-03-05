#ifndef _USER_SYSCALL_H_
#define _USER_SYSCALL_H_

void yield(void);
int sys_getc(void);
void sys_puts(const char *s, unsigned int len);

/* Phase 7 — brk() heap-grow/shrink syscall */
void *brk(void *addr);

#endif  /* !_USER_SYSCALL_H_ */
