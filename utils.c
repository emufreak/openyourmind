#include <proto/exec.h>
#include <exec/types.h>
#include "utils.h"

/*struct ExecBase *SysBase;
volatile struct Custom *hw;
struct DosLibrary *DOSBase;
struct GfxBase *GfxBase;*/

ULONG *Bitplane1;
ULONG *Bitplane2;

ULONG ClColor[32];
ULONG ClsSprites[16];
ULONG ClScreen[12];

ULONG *Copperlist1;
ULONG *Copperlist2;
ULONG volatile *DrawBuffer;
ULONG volatile *ViewBuffer;
ULONG volatile *DrawCopper;
ULONG volatile *ViewCopper;

/*UWORD SystemInts;
UWORD SystemDMA;
UWORD SystemADKCON;

APTR SystemIrq;
struct View *ActiView;*/

volatile struct Custom *hw;

/*APTR GetVBR(void) {
	APTR vbr = 0;
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE

	if (SysBase->AttnFlags & AFF_68010) 
		vbr = (APTR)Supervisor((void*)getvbr);

	return vbr;
}*/

/*void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
}*/

/*APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
}*/

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
/*void WaitVbl() {
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		vpos&=0x1ff00;
		if (vpos!=(311<<8))
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
		vpos&=0x1ff00;
		if (vpos==(311<<8))
			break;
	}
}*/

inline void WaitBlt() {
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
}

ULONG ClsSprites[] = { 0x01200000, 0x01220000,0x01240000,0x01260000, 0x01280000, 
        0x012a0000, 0x012c0000, 0x012e0000, 0x01300000, 0x01320000, 0x01340000,
                 0x01360000, 0x01380000, 0x013a0000, 0x013c0000, 0x013e0000  };

ULONG ClScreen[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 0x00902cc1,
         0x00920030, 0x009400d0, 0x01020000, 0x01040000, 0x010800c6, 0x010a00c6, 
                                                                  0x01005200 };

//INCBIN(ClColor, "raw/eye.cop") 
/*
ULONG ClColor[] = { 0x01800000, 0x01820fff, 0x01840dca, 0x01860ca3, 0x01880791, 
         0x018a0671, 0x018c0461, 0x018e0341, 0x01900121, 0x01920110, 0x01940999,  
         0x01960678, 0x01980446, 0x019a0334, 0x019c0122, 0x019e0112, 0x01a00111,  
         0x01a20655, 0x01a40444, 0x01a60443, 0x01a80232, 0x01aa0212, 0x01ac0985, 
         0x01ae0662, 0x01b00552, 0x01b20221, 0x01b40a51, 0x01b60531, 0x01b80210, 
         0x01ba0100, 0x01bc0001, 0x01be0111 };*/

ULONG ClColor[] = { 0x01800555,0x01820E66,0x01840888,0x01860E77,0x01880E88,
   0x018A0D97,0x018C0AAA,0x018E0E99,0x01900CB6,0x01920EA9,0x01940DB8,0x01960CCC,
   0x01980FBB,0x019A0ECA,0x019C0BE7,0x019E0EDC,0x01A00DDD,0x01A20FDD,0x01A40DE8,
   0x01A60EEA,0x01A80DE9,0x01AA0DFB,0x01AC0FEE,0x01AE0EFC,0x01B00EFF,0x01B20EFC,
           0x01B40EFD,0x01B60FFE,0x01B80FFF,0x01BA0FFF,0x01BC0FFF, 0x01BE0FFF };

void FreeDisplay( int clsize, int bplsize) {
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
}

void SetBplPointers() {
  UWORD highword = (ULONG)DrawBuffer >> 16;
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
  
  UWORD *copword = (UWORD *) DrawCopper;
  copword[COPBPL1LOW] = lowword;
  copword[COPBPL1HIGH] = highword;
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}

void SwapCl() {
  ULONG tmp = (ULONG) DrawCopper;
  DrawCopper = ViewCopper;
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}

/*void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
	OwnBlitter();
	WaitBlit();	
	//Disable();
  Forbid();
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
	SystemInts=hw->intenar;
	SystemDMA=hw->dmaconr;
	hw->intena=0x7fff;//disable all interrupts
	hw->intreq=0x7fff;//Clear any interrupts that were pending
	
	WaitVbl();
	WaitVbl();
	hw->dmacon=0x7fff;//Clear all DMA channels

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	/*LoadView(0);
	WaitTOF();
	WaitTOF();

	WaitVbl();
	WaitVbl();

	VBR=GetVBR();
	SystemIrq=GetInterruptHandler(); //store interrupt register
}*/

/*void FreeSystem() { 
	WaitVbl();
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
	hw->intreq=0x7fff;//Clear any interrupts that were pending
	hw->dmacon=0x7fff;//Clear all DMA channels

	//restore interrupts
	SetInterruptHandler(SystemIrq);*/

	/*Restore system copper list(s). */
	/*hw->cop1lc=(ULONG)GfxBase->copinit;
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
	hw->copjmp1=0x7fff; //start coppper*/

	/*Restore all interrupts and DMA settings. */
	/*hw->intena=SystemInts|0x8000;
	hw->dmacon=SystemDMA|0x8000;
	hw->adkcon=SystemADKCON|0x8000;

	LoadView(ActiView);
	WaitTOF();
	WaitTOF();
	WaitBlit();	
	DisownBlitter();
  Permit();
	//Enable();
}*/

void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
  for( int i=0;i<size;i++) 
    *destination++ = *source++;  
}

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
  for( int i=0;i<lines; i++) {
    for( int i2=0;i2<linelength;i2++) 
      *target++ = pattern;
    target += mod;
  }
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
short MouseRight(){return !((*(volatile UWORD*)0xdff016)&(1<<10));}