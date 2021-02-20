#ifndef UTILS_H
#define UTILS_H

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

extern struct ExecBase *SysBase;
extern volatile struct Custom *hw;
extern struct DosLibrary *DOSBase;
extern struct GfxBase *GfxBase;

extern ULONG *Bitplane1;
extern ULONG *Bitplane2;

extern ULONG ClColor[32];
extern ULONG ClsSprites[16];
extern ULONG ClScreen[12];

extern ULONG *Copperlist1;
extern ULONG *Copperlist2;
extern UWORD volatile *DrawBuffer; //2be60 //2be30
extern UWORD volatile *ViewBuffer; //41e22 //41df2
extern ULONG volatile *DrawCopper;
extern ULONG volatile *ViewCopper;


void FreeDisplay( int clsize, int bplsize);
void SetBplPointers();
void SwapCl();
/*extern UWORD SystemInts;
extern UWORD SystemDMA;
extern UWORD SystemADKCON;
volatile static APTR VBR=0;
extern APTR SystemIrq;
extern struct View *ActiView;*/

static APTR GetVBR(void);
//void SetInterruptHandler(APTR interrupt);
//APTR GetInterruptHandler();
//void WaitVbl();
void WaitBlt();
/*void TakeSystem();
void FreeSystem();*/
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size);
void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                                    ULONG lnelength, ULONG mod);
short MouseLeft();
short MouseRight();

#endif