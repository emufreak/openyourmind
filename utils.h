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
volatile struct Custom *hw;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;

//backup
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
