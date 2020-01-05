#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
#include <hardware/intbits.h>

struct ExecBase *SysBase;
extern volatile struct Custom *hw;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;

ULONG __attribute__((chip)) Bitplane1[20*640];
ULONG __attribute__((chip)) Bitplane2[20*640];

void ClBuild();
ULONG ClColor[2];
ULONG ClsSprites[16];
ULONG ClScreen[12];
int CopBpl1High;
int CopBpl1Low;
ULONG  __attribute__((chip)) Copperlist1[33];
ULONG __attribute__((chip)) Copperlist2[33];
ULONG *DrawBuffer;
ULONG *ViewBuffer;
ULONG *DrawCopper;
ULONG *ViewCopper;
void PrepareDisplay();
void SetBplPointers();
void SwapCl();
UWORD SystemInts;
UWORD SystemDMA;
UWORD SystemADKCON;
volatile static APTR VBR=0;
APTR SystemIrq;
struct View *ActiView;

APTR GetVBR(void);
void SetInterruptHandler(APTR interrupt);
APTR GetInterruptHandler();
void WaitVbl();
void WaitBlt();
void TakeSystem();
void FreeSystem();

short MouseLeft();
short MouseRight();
