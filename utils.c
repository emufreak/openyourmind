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

volatile struct Custom *hw;

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