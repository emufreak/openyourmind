#include "support/gcc8_c_support.h"
#include <proto/exec.h>
#include <proto/dos.h>
#include <proto/graphics.h>
#include <graphics/gfxbase.h>
#include <graphics/view.h>
#include <exec/execbase.h>
#include <hardware/custom.h>
#include <hardware/intbits.h>


#define COPBPL1HIGH 57
#define COPBPL1LOW 59
#define COPBPL2HIGH 61
#define COPBPL2LOW 63

struct ExecBase *SysBase;
extern volatile struct Custom *hw;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;

ULONG *Bitplane1;
ULONG *Bitplane2;

ULONG ClColor[32];
ULONG ClsSprites[16];
ULONG ClScreen[12];

ULONG *Copperlist1;
ULONG *Copperlist2;
ULONG *DrawBuffer;
ULONG *ViewBuffer;
ULONG *DrawCopper;
ULONG *ViewCopper;
void FreeDisplay();
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
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size);

short MouseLeft();
short MouseRight();