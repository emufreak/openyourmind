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

ULONG *Bitplane1;
ULONG *Bitplane2;

ULONG * ClBuild();
ULONG ClColor[2];
ULONG ClsSprites[16];
ULONG ClScreen[12];
int CopBpl1High;
int CopBpl1Low;

ULONG *Copperlist1;
ULONG *Copperlist2;
ULONG *DrawBuffer;
ULONG *ViewBuffer;
ULONG *DrawCopper;
ULONG *ViewCopper;
int PrepareDisplay();
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
