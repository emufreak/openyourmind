//extern void __WriteText( ULONG, ULONG *, char *);
#define __USER_LABEL_PREFIX__ 
#define __REGISTER_PREFIX__ %
#define __IMMEDIATE_PREFIX__ #

#define CONCAT1(a, b) CONCAT2(a, b)
#define CONCAT2(a, b) a ## b
#define SYM(x) CONCAT1 (__USER_LABEL_PREFIX__, x)
#define FUNC(x) .type SYM(x),function
#define REG(x) CONCAT1 (__REGISTER_PREFIX__, x)
#define IMM(x) CONCAT1 (__IMMEDIATE_PREFIX__, x)
#define d0 REG (d0)
#define d1 REG (d1)
#define d2 REG (d2)
#define d3 REG (d3)
#define d4 REG (d4)
#define d5 REG (d5)
#define d6 REG (d6)
#define d7 REG (d7)
#define a0 REG (a0)
#define a1 REG (a1)
#define a2 REG (a2)
#define a3 REG (a3)
#define a4 REG (a4)
#define a5 REG (a5)
#define a6 REG (a6)
#define fp REG (fp)
#define sp REG (sp)
#define pc REG (pc)

