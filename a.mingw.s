
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:


int main();

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
	main();
       0:	4ef9 0000 0d04 	jmp d04 <main>
       6:	4e71           	nop

00000008 <GetVBR>:
#include <proto/exec.h>
#include <exec/types.h>

volatile struct Custom *hw;

APTR GetVBR(void) {
       8:	4fef ffec      	lea -20(sp),sp
       c:	2f0e           	move.l a6,-(sp)
       e:	2f07           	move.l d7,-(sp)
	APTR vbr = 0;
      10:	42af 0018      	clr.l 24(sp)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
      14:	3f7c 4e7a 000a 	move.w #20090,10(sp)
      1a:	3f7c 0801 000c 	move.w #2049,12(sp)
      20:	3f7c 4e73 000e 	move.w #20083,14(sp)

	if (SysBase->AttnFlags & AFF_68010) 
      26:	2079 0001 ba7c 	movea.l 1ba7c <_edata>,a0
      2c:	3028 0128      	move.w 296(a0),d0
      30:	3000           	move.w d0,d0
      32:	0280 0000 ffff 	andi.l #65535,d0
      38:	7201           	moveq #1,d1
      3a:	c081           	and.l d1,d0
      3c:	4a80           	tst.l d0
      3e:	672c           	beq.s 6c <GetVBR+0x64>
		vbr = (APTR)Supervisor((void*)getvbr);
      40:	41ef 001c      	lea 28(sp),a0
      44:	41e8 ffee      	lea -18(a0),a0
      48:	2f48 0014      	move.l a0,20(sp)
      4c:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
      52:	2c40           	movea.l d0,a6
      54:	2e2f 0014      	move.l 20(sp),d7
      58:	cf8d           	exg d7,a5
      5a:	4eae ffe2      	jsr -30(a6)
      5e:	cf8d           	exg d7,a5
      60:	2f40 0010      	move.l d0,16(sp)
      64:	202f 0010      	move.l 16(sp),d0
      68:	2f40 0018      	move.l d0,24(sp)

	return vbr;
      6c:	202f 0018      	move.l 24(sp),d0
}
      70:	2e1f           	move.l (sp)+,d7
      72:	2c5f           	movea.l (sp)+,a6
      74:	4fef 0014      	lea 20(sp),sp
      78:	4e75           	rts

0000007a <SetInterruptHandler>:

void SetInterruptHandler(APTR interrupt) {
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
      7a:	2079 0001 baae 	movea.l 1baae <VBR.lto_priv.0>,a0
      80:	41e8 006c      	lea 108(a0),a0
      84:	20af 0004      	move.l 4(sp),(a0)
}
      88:	4e75           	rts

0000008a <GetInterruptHandler>:

APTR GetInterruptHandler() {
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
      8a:	2079 0001 baae 	movea.l 1baae <VBR.lto_priv.0>,a0
      90:	2028 006c      	move.l 108(a0),d0
}
      94:	4e75           	rts

00000096 <WaitVbl>:

//vblank begins at vpos 312 hpos 1 and ends at vpos 25 hpos 1
//vsync begins at line 2 hpos 132 and ends at vpos 5 hpos 18 
void WaitVbl() {
      96:	518f           	subq.l #8,sp
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
      98:	207c 00df f004 	movea.l #14675972,a0
      9e:	2010           	move.l (a0),d0
      a0:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
      a2:	2017           	move.l (sp),d0
      a4:	0280 0001 ff00 	andi.l #130816,d0
      aa:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
      ac:	2017           	move.l (sp),d0
      ae:	0c80 0001 3700 	cmpi.l #79616,d0
      b4:	67e2           	beq.s 98 <WaitVbl+0x2>
			break;
	}
	while (1) {
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
      b6:	207c 00df f004 	movea.l #14675972,a0
      bc:	2010           	move.l (a0),d0
      be:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
      c2:	202f 0004      	move.l 4(sp),d0
      c6:	0280 0001 ff00 	andi.l #130816,d0
      cc:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
      d0:	202f 0004      	move.l 4(sp),d0
      d4:	0c80 0001 3700 	cmpi.l #79616,d0
      da:	66da           	bne.s b6 <WaitVbl+0x20>
			break;
	}
}
      dc:	508f           	addq.l #8,sp
      de:	4e75           	rts

000000e0 <WaitBlt>:

inline void WaitBlt() {
      e0:	598f           	subq.l #4,sp
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
      e2:	2079 0001 baba 	movea.l 1baba <hw>,a0
      e8:	3f68 0002 0002 	move.w 2(a0),2(sp)
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
      ee:	2079 0001 baba 	movea.l 1baba <hw>,a0
      f4:	3028 0002      	move.w 2(a0),d0
      f8:	3000           	move.w d0,d0
      fa:	0280 0000 ffff 	andi.l #65535,d0
     100:	0280 0000 4000 	andi.l #16384,d0
     106:	4a80           	tst.l d0
     108:	66e4           	bne.s ee <WaitBlt+0xe>
}
     10a:	588f           	addq.l #4,sp
     10c:	4e75           	rts

0000010e <FreeDisplay>:
   0x018A0D97,0x018C0AAA,0x018E0E99,0x01900CB6,0x01920EA9,0x01940DB8,0x01960CCC,
   0x01980FBB,0x019A0ECA,0x019C0BE7,0x019E0EDC,0x01A00DDD,0x01A20FDD,0x01A40DE8,
   0x01A60EEA,0x01A80DE9,0x01AA0DFB,0x01AC0FEE,0x01AE0EFC,0x01B00EFF,0x01B20EFC,
           0x01B40EFD,0x01B60FFE,0x01B80FFF,0x01BA0FFF,0x01BC0FFF, 0x01BE0FFF };

void FreeDisplay( int clsize, int bplsize) {
     10e:	4fef ffe0      	lea -32(sp),sp
     112:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     114:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
     11a:	4a80           	tst.l d0
     11c:	6722           	beq.s 140 <FreeDisplay+0x32>
     11e:	2f79 0001 ba90 	move.l 1ba90 <Copperlist1>,32(sp)
     124:	0020 
     126:	2f6f 0028 001c 	move.l 40(sp),28(sp)
     12c:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     132:	2c40           	movea.l d0,a6
     134:	226f 0020      	movea.l 32(sp),a1
     138:	202f 001c      	move.l 28(sp),d0
     13c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     140:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
     146:	4a80           	tst.l d0
     148:	6722           	beq.s 16c <FreeDisplay+0x5e>
     14a:	2f79 0001 ba94 	move.l 1ba94 <Copperlist2>,24(sp)
     150:	0018 
     152:	2f6f 0028 0014 	move.l 40(sp),20(sp)
     158:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     15e:	2c40           	movea.l d0,a6
     160:	226f 0018      	movea.l 24(sp),a1
     164:	202f 0014      	move.l 20(sp),d0
     168:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
     16c:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
     172:	4a80           	tst.l d0
     174:	6722           	beq.s 198 <FreeDisplay+0x8a>
     176:	2f79 0001 ba88 	move.l 1ba88 <Bitplane1>,16(sp)
     17c:	0010 
     17e:	2f6f 002c 000c 	move.l 44(sp),12(sp)
     184:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     18a:	2c40           	movea.l d0,a6
     18c:	226f 0010      	movea.l 16(sp),a1
     190:	202f 000c      	move.l 12(sp),d0
     194:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
     198:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
     19e:	4a80           	tst.l d0
     1a0:	6722           	beq.s 1c4 <FreeDisplay+0xb6>
     1a2:	2f79 0001 ba8c 	move.l 1ba8c <Bitplane2>,8(sp)
     1a8:	0008 
     1aa:	2f6f 002c 0004 	move.l 44(sp),4(sp)
     1b0:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     1b6:	2c40           	movea.l d0,a6
     1b8:	226f 0008      	movea.l 8(sp),a1
     1bc:	202f 0004      	move.l 4(sp),d0
     1c0:	4eae ff2e      	jsr -210(a6)
}
     1c4:	2c5f           	movea.l (sp)+,a6
     1c6:	4fef 0020      	lea 32(sp),sp
     1ca:	4e75           	rts

000001cc <SetBplPointers>:

void SetBplPointers() {
     1cc:	4fef fff4      	lea -12(sp),sp
  UWORD highword = (ULONG)DrawBuffer >> 16;
     1d0:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
     1d6:	4240           	clr.w d0
     1d8:	4840           	swap d0
     1da:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     1de:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
     1e4:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     1e8:	2f79 0001 baa0 	move.l 1baa0 <DrawCopper>,4(sp)
     1ee:	0004 
  copword[COPBPL1LOW] = lowword;
     1f0:	307c 0076      	movea.w #118,a0
     1f4:	d1ef 0004      	adda.l 4(sp),a0
     1f8:	30af 0008      	move.w 8(sp),(a0)
  copword[COPBPL1HIGH] = highword;
     1fc:	307c 0072      	movea.w #114,a0
     200:	d1ef 0004      	adda.l 4(sp),a0
     204:	30af 000a      	move.w 10(sp),(a0)
  
  ULONG tmp = (ULONG) DrawBuffer;
     208:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
     20e:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     210:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
     216:	23c0 0001 ba98 	move.l d0,1ba98 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     21c:	2017           	move.l (sp),d0
     21e:	23c0 0001 ba9c 	move.l d0,1ba9c <ViewBuffer>
}
     224:	4fef 000c      	lea 12(sp),sp
     228:	4e75           	rts

0000022a <SwapCl>:

void SwapCl() {
     22a:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     22c:	2039 0001 baa0 	move.l 1baa0 <DrawCopper>,d0
     232:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     234:	2039 0001 baa4 	move.l 1baa4 <ViewCopper>,d0
     23a:	23c0 0001 baa0 	move.l d0,1baa0 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     240:	2017           	move.l (sp),d0
     242:	23c0 0001 baa4 	move.l d0,1baa4 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     248:	2039 0001 baa4 	move.l 1baa4 <ViewCopper>,d0
     24e:	2079 0001 baba 	movea.l 1baba <hw>,a0
     254:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     258:	2079 0001 baba 	movea.l 1baba <hw>,a0
     25e:	2017           	move.l (sp),d0
     260:	3140 0088      	move.w d0,136(a0)
}
     264:	588f           	addq.l #4,sp
     266:	4e75           	rts

00000268 <TakeSystem>:

void TakeSystem() {
     268:	598f           	subq.l #4,sp
     26a:	2f0e           	move.l a6,-(sp)
	ActiView=GfxBase->ActiView; //store current view
     26c:	2079 0001 ba84 	movea.l 1ba84 <GfxBase>,a0
     272:	2028 0022      	move.l 34(a0),d0
     276:	23c0 0001 bab6 	move.l d0,1bab6 <ActiView>
	OwnBlitter();
     27c:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     282:	2c40           	movea.l d0,a6
     284:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     288:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     28e:	2c40           	movea.l d0,a6
     290:	4eae ff1c      	jsr -228(a6)
	//Disable();
  Forbid();
     294:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     29a:	2c40           	movea.l d0,a6
     29c:	4eae ff7c      	jsr -132(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     2a0:	2079 0001 baba 	movea.l 1baba <hw>,a0
     2a6:	3028 0010      	move.w 16(a0),d0
     2aa:	33c0 0001 baac 	move.w d0,1baac <SystemADKCON>
	SystemInts=hw->intenar;
     2b0:	2079 0001 baba 	movea.l 1baba <hw>,a0
     2b6:	3028 001c      	move.w 28(a0),d0
     2ba:	33c0 0001 baa8 	move.w d0,1baa8 <SystemInts>
	SystemDMA=hw->dmaconr;
     2c0:	2079 0001 baba 	movea.l 1baba <hw>,a0
     2c6:	3028 0002      	move.w 2(a0),d0
     2ca:	33c0 0001 baaa 	move.w d0,1baaa <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     2d0:	2079 0001 baba 	movea.l 1baba <hw>,a0
     2d6:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     2dc:	2079 0001 baba 	movea.l 1baba <hw>,a0
     2e2:	317c 7fff 009c 	move.w #32767,156(a0)
	
	WaitVbl();
     2e8:	4eba fdac      	jsr 96 <WaitVbl>(pc)
	WaitVbl();
     2ec:	4eba fda8      	jsr 96 <WaitVbl>(pc)
	hw->dmacon=0x7fff;//Clear all DMA channels
     2f0:	2079 0001 baba 	movea.l 1baba <hw>,a0
     2f6:	317c 7fff 0096 	move.w #32767,150(a0)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     2fc:	42af 0004      	clr.l 4(sp)
     300:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     306:	2c40           	movea.l d0,a6
     308:	226f 0004      	movea.l 4(sp),a1
     30c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     310:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     316:	2c40           	movea.l d0,a6
     318:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     31c:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     322:	2c40           	movea.l d0,a6
     324:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     328:	4eba fd6c      	jsr 96 <WaitVbl>(pc)
	WaitVbl();
     32c:	4eba fd68      	jsr 96 <WaitVbl>(pc)

	VBR=GetVBR();
     330:	4eba fcd6      	jsr 8 <GetVBR>(pc)
     334:	23c0 0001 baae 	move.l d0,1baae <VBR.lto_priv.0>
	SystemIrq=GetInterruptHandler(); //store interrupt register
     33a:	4eba fd4e      	jsr 8a <GetInterruptHandler>(pc)
     33e:	23c0 0001 bab2 	move.l d0,1bab2 <SystemIrq>
}
     344:	2c5f           	movea.l (sp)+,a6
     346:	588f           	addq.l #4,sp
     348:	4e75           	rts

0000034a <FreeSystem>:

void FreeSystem() { 
     34a:	598f           	subq.l #4,sp
     34c:	2f0e           	move.l a6,-(sp)
	WaitVbl();
     34e:	4eba fd46      	jsr 96 <WaitVbl>(pc)
	WaitBlt();
     352:	4eba fd8c      	jsr e0 <WaitBlt>(pc)
	hw->intena=0x7fff;//disable all interrupts
     356:	2079 0001 baba 	movea.l 1baba <hw>,a0
     35c:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     362:	2079 0001 baba 	movea.l 1baba <hw>,a0
     368:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     36e:	2079 0001 baba 	movea.l 1baba <hw>,a0
     374:	317c 7fff 0096 	move.w #32767,150(a0)

	//restore interrupts
	SetInterruptHandler(SystemIrq);
     37a:	2039 0001 bab2 	move.l 1bab2 <SystemIrq>,d0
     380:	2f00           	move.l d0,-(sp)
     382:	4eba fcf6      	jsr 7a <SetInterruptHandler>(pc)
     386:	588f           	addq.l #4,sp

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     388:	2079 0001 ba84 	movea.l 1ba84 <GfxBase>,a0
     38e:	2028 0026      	move.l 38(a0),d0
     392:	2079 0001 baba 	movea.l 1baba <hw>,a0
     398:	2140 0080      	move.l d0,128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     39c:	2079 0001 ba84 	movea.l 1ba84 <GfxBase>,a0
     3a2:	2028 0032      	move.l 50(a0),d0
     3a6:	2079 0001 baba 	movea.l 1baba <hw>,a0
     3ac:	2140 0084      	move.l d0,132(a0)
	hw->copjmp1=0x7fff; //start coppper
     3b0:	2079 0001 baba 	movea.l 1baba <hw>,a0
     3b6:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     3bc:	3039 0001 baa8 	move.w 1baa8 <SystemInts>,d0
     3c2:	2079 0001 baba 	movea.l 1baba <hw>,a0
     3c8:	0040 8000      	ori.w #-32768,d0
     3cc:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     3d0:	3039 0001 baaa 	move.w 1baaa <SystemDMA>,d0
     3d6:	2079 0001 baba 	movea.l 1baba <hw>,a0
     3dc:	0040 8000      	ori.w #-32768,d0
     3e0:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     3e4:	3039 0001 baac 	move.w 1baac <SystemADKCON>,d0
     3ea:	2079 0001 baba 	movea.l 1baba <hw>,a0
     3f0:	0040 8000      	ori.w #-32768,d0
     3f4:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     3f8:	2f79 0001 bab6 	move.l 1bab6 <ActiView>,4(sp)
     3fe:	0004 
     400:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     406:	2c40           	movea.l d0,a6
     408:	226f 0004      	movea.l 4(sp),a1
     40c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     410:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     416:	2c40           	movea.l d0,a6
     418:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     41c:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     422:	2c40           	movea.l d0,a6
     424:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     428:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     42e:	2c40           	movea.l d0,a6
     430:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     434:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     43a:	2c40           	movea.l d0,a6
     43c:	4eae fe32      	jsr -462(a6)
  Permit();
     440:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     446:	2c40           	movea.l d0,a6
     448:	4eae ff76      	jsr -138(a6)
	//Enable();
}
     44c:	2c5f           	movea.l (sp)+,a6
     44e:	588f           	addq.l #4,sp
     450:	4e75           	rts

00000452 <Utils_CopyMem>:

void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     452:	598f           	subq.l #4,sp
     454:	2f02           	move.l d2,-(sp)
  for( int i=0;i<size;i++) 
     456:	42af 0004      	clr.l 4(sp)
     45a:	6024           	bra.s 480 <Utils_CopyMem+0x2e>
    *destination++ = *source++;  
     45c:	222f 000c      	move.l 12(sp),d1
     460:	2001           	move.l d1,d0
     462:	5880           	addq.l #4,d0
     464:	2f40 000c      	move.l d0,12(sp)
     468:	202f 0010      	move.l 16(sp),d0
     46c:	2400           	move.l d0,d2
     46e:	5882           	addq.l #4,d2
     470:	2f42 0010      	move.l d2,16(sp)
     474:	2041           	movea.l d1,a0
     476:	2210           	move.l (a0),d1
     478:	2040           	movea.l d0,a0
     47a:	2081           	move.l d1,(a0)
  for( int i=0;i<size;i++) 
     47c:	52af 0004      	addq.l #1,4(sp)
     480:	202f 0004      	move.l 4(sp),d0
     484:	b0af 0014      	cmp.l 20(sp),d0
     488:	65d2           	bcs.s 45c <Utils_CopyMem+0xa>
}
     48a:	241f           	move.l (sp)+,d2
     48c:	588f           	addq.l #4,sp
     48e:	4e75           	rts

00000490 <Utils_FillLong>:

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
     490:	518f           	subq.l #8,sp
  for( int i=0;i<lines; i++) {
     492:	42af 0004      	clr.l 4(sp)
     496:	6030           	bra.s 4c8 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
     498:	4297           	clr.l (sp)
     49a:	6014           	bra.s 4b0 <Utils_FillLong+0x20>
      *target++ = pattern;
     49c:	202f 000c      	move.l 12(sp),d0
     4a0:	2200           	move.l d0,d1
     4a2:	5881           	addq.l #4,d1
     4a4:	2f41 000c      	move.l d1,12(sp)
     4a8:	2040           	movea.l d0,a0
     4aa:	20af 0010      	move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
     4ae:	5297           	addq.l #1,(sp)
     4b0:	2017           	move.l (sp),d0
     4b2:	b0af 0018      	cmp.l 24(sp),d0
     4b6:	65e4           	bcs.s 49c <Utils_FillLong+0xc>
    target += mod;
     4b8:	202f 001c      	move.l 28(sp),d0
     4bc:	d080           	add.l d0,d0
     4be:	d080           	add.l d0,d0
     4c0:	d1af 000c      	add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
     4c4:	52af 0004      	addq.l #1,4(sp)
     4c8:	202f 0004      	move.l 4(sp),d0
     4cc:	b0af 0014      	cmp.l 20(sp),d0
     4d0:	65c6           	bcs.s 498 <Utils_FillLong+0x8>
  }
}
     4d2:	508f           	addq.l #8,sp
     4d4:	4e75           	rts

000004d6 <MouseLeft>:

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     4d6:	207c 00bf e001 	movea.l #12574721,a0
     4dc:	1010           	move.b (a0),d0
     4de:	1000           	move.b d0,d0
     4e0:	0280 0000 00ff 	andi.l #255,d0
     4e6:	7240           	moveq #64,d1
     4e8:	c081           	and.l d1,d0
     4ea:	4a80           	tst.l d0
     4ec:	57c0           	seq d0
     4ee:	4400           	neg.b d0
     4f0:	1000           	move.b d0,d0
     4f2:	0240 00ff      	andi.w #255,d0
     4f6:	4e75           	rts

000004f8 <MouseRight>:
     4f8:	207c 00df f016 	movea.l #14675990,a0
     4fe:	3010           	move.w (a0),d0
     500:	3000           	move.w d0,d0
     502:	0280 0000 ffff 	andi.l #65535,d0
     508:	0280 0000 0400 	andi.l #1024,d0
     50e:	4a80           	tst.l d0
     510:	57c0           	seq d0
     512:	4400           	neg.b d0
     514:	1000           	move.b d0,d0
     516:	0240 00ff      	andi.w #255,d0
     51a:	4e75           	rts

0000051c <interruptHandler>:
#include "zoom.h"
#include "zoom102.h"

volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
     51c:	598f           	subq.l #4,sp
     51e:	2f08           	move.l a0,-(sp)
     520:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     522:	2079 0001 baba 	movea.l 1baba <hw>,a0
     528:	317c 0020 009c 	move.w #32,156(a0)
     52e:	2079 0001 baba 	movea.l 1baba <hw>,a0
     534:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     53a:	2039 0001 bae4 	move.l 1bae4 <frameCounter>,d0
     540:	5280           	addq.l #1,d0
     542:	23c0 0001 bae4 	move.l d0,1bae4 <frameCounter>
  UWORD *bp = 0x200;
     548:	2f7c 0000 0200 	move.l #512,8(sp)
     54e:	0008 
  *bp = 0;
     550:	206f 0008      	movea.l 8(sp),a0
     554:	4250           	clr.w (a0)
  //Zoom_VblankHandler();
}
     556:	201f           	move.l (sp)+,d0
     558:	205f           	movea.l (sp)+,a0
     55a:	588f           	addq.l #4,sp
     55c:	4e73           	rte

0000055e <RunDemo>:

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     55e:	2079 0001 baba 	movea.l 1baba <hw>,a0
     564:	317c 87ff 0096 	move.w #-30721,150(a0)
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	//SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     56a:	2079 0001 baba 	movea.l 1baba <hw>,a0
     570:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     576:	2079 0001 baba 	movea.l 1baba <hw>,a0
     57c:	317c 0020 009c 	move.w #32,156(a0)
     582:	6008           	bra.s 58c <RunDemo+0x2e>
  //PrepareDisplay();

	while(Zoom_Counter < 1000) {
		WaitVbl();
     584:	4eba fb10      	jsr 96 <WaitVbl>(pc)
    RunFrame();
     588:	4eba 0038      	jsr 5c2 <RunFrame>(pc)
	while(Zoom_Counter < 1000) {
     58c:	3039 0001 bae2 	move.w 1bae2 <Zoom_Counter>,d0
     592:	0c40 03e7      	cmpi.w #999,d0
     596:	63ec           	bls.s 584 <RunDemo+0x26>
	}
  Zoom_Dealloc();
     598:	4eba 0c8e      	jsr 1228 <Zoom_Dealloc>(pc)

	//SetInterruptHandler((APTR)interruptHandler);
}
     59c:	4e75           	rts

0000059e <SetInterrupt>:

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     59e:	487a ff7c      	pea 51c <interruptHandler>(pc)
     5a2:	4eba fad6      	jsr 7a <SetInterruptHandler>(pc)
     5a6:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     5a8:	2079 0001 baba 	movea.l 1baba <hw>,a0
     5ae:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     5b4:	2079 0001 baba 	movea.l 1baba <hw>,a0
     5ba:	317c 0020 009c 	move.w #32,156(a0)
}
     5c0:	4e75           	rts

000005c2 <RunFrame>:

void RunFrame() {
     5c2:	4fef fff0      	lea -16(sp),sp
     5c6:	2f0e           	move.l a6,-(sp)
  Zoom_Blit4ZoomFinished = 0;
     5c8:	4279 0001 baca 	clr.w 1baca <Zoom_Blit4ZoomFinished>
  UWORD tmp = Zoom_LevelOfZoom;
     5ce:	3f79 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,18(sp)
     5d4:	0012 
  if(Zoom_LevelOfZoom == 0)
     5d6:	3039 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,d0
     5dc:	4a40           	tst.w d0
     5de:	6632           	bne.s 612 <RunFrame+0x50>
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     5e0:	2f79 0001 bac2 	move.l 1bac2 <Zoom_StartImage>,14(sp)
     5e6:	000e 
     5e8:	2f79 0001 ba98 	move.l 1ba98 <DrawBuffer>,10(sp)
     5ee:	000a 
     5f0:	2f7c 0000 ff00 	move.l #65280,6(sp)
     5f6:	0006 
     5f8:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     5fe:	2c40           	movea.l d0,a6
     600:	206f 000e      	movea.l 14(sp),a0
     604:	226f 000a      	movea.l 10(sp),a1
     608:	202f 0006      	move.l 6(sp),d0
     60c:	4eae fd8a      	jsr -630(a6)
     610:	602c           	bra.s 63e <RunFrame+0x7c>
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
     612:	3039 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,d0
     618:	3000           	move.w d0,d0
     61a:	0280 0000 ffff 	andi.l #65535,d0
     620:	2079 0001 ba98 	movea.l 1ba98 <DrawBuffer>,a0
     626:	2239 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d1
     62c:	4878 0005      	pea 5 <_start+0x5>
     630:	2f00           	move.l d0,-(sp)
     632:	2f08           	move.l a0,-(sp)
     634:	2f01           	move.l d1,-(sp)
     636:	4eba 1424      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
     63a:	4fef 0010      	lea 16(sp),sp

  Zoom_Blit4ZoomFinished = 1;
     63e:	33fc 0001 0001 	move.w #1,1baca <Zoom_Blit4ZoomFinished>
     644:	baca 
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  while( tmp == Zoom_LevelOfZoom) { }
     646:	3039 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,d0
     64c:	b06f 0012      	cmp.w 18(sp),d0
     650:	67f4           	beq.s 646 <RunFrame+0x84>
     652:	2c5f           	movea.l (sp)+,a6
     654:	4fef 0010      	lea 16(sp),sp
     658:	4e75           	rts

0000065a <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     65a:	4fef fff4      	lea -12(sp),sp
     65e:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     660:	42af 000c      	clr.l 12(sp)
     664:	601e           	bra.s 684 <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     666:	202f 0018      	move.l 24(sp),d0
     66a:	2200           	move.l d0,d1
     66c:	5481           	addq.l #2,d1
     66e:	2f41 0018      	move.l d1,24(sp)
     672:	2040           	movea.l d0,a0
     674:	3010           	move.w (a0),d0
     676:	206f 0014      	movea.l 20(sp),a0
     67a:	3080           	move.w d0,(a0)
    copperlist += 2;
     67c:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     680:	52af 000c      	addq.l #1,12(sp)
     684:	7005           	moveq #5,d0
     686:	b0af 000c      	cmp.l 12(sp),d0
     68a:	6cda           	bge.s 666 <Zoom_InsertShift+0xc>
  }
  copperlist--;
     68c:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     690:	222f 0018      	move.l 24(sp),d1
     694:	2401           	move.l d1,d2
     696:	5482           	addq.l #2,d2
     698:	2f42 0018      	move.l d2,24(sp)
     69c:	202f 0014      	move.l 20(sp),d0
     6a0:	2400           	move.l d0,d2
     6a2:	5482           	addq.l #2,d2
     6a4:	2f42 0014      	move.l d2,20(sp)
     6a8:	2041           	movea.l d1,a0
     6aa:	3210           	move.w (a0),d1
     6ac:	2040           	movea.l d0,a0
     6ae:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     6b0:	202f 0018      	move.l 24(sp),d0
     6b4:	2200           	move.l d0,d1
     6b6:	5481           	addq.l #2,d1
     6b8:	2f41 0018      	move.l d1,24(sp)
     6bc:	2040           	movea.l d0,a0
     6be:	3010           	move.w (a0),d0
     6c0:	206f 0014      	movea.l 20(sp),a0
     6c4:	3080           	move.w d0,(a0)
  copperlist += 2;
     6c6:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     6ca:	42af 0008      	clr.l 8(sp)
     6ce:	601e           	bra.s 6ee <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     6d0:	202f 0018      	move.l 24(sp),d0
     6d4:	2200           	move.l d0,d1
     6d6:	5481           	addq.l #2,d1
     6d8:	2f41 0018      	move.l d1,24(sp)
     6dc:	2040           	movea.l d0,a0
     6de:	3010           	move.w (a0),d0
     6e0:	206f 0014      	movea.l 20(sp),a0
     6e4:	3080           	move.w d0,(a0)
    copperlist += 2;
     6e6:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     6ea:	52af 0008      	addq.l #1,8(sp)
     6ee:	7009           	moveq #9,d0
     6f0:	b0af 0008      	cmp.l 8(sp),d0
     6f4:	6cda           	bge.s 6d0 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     6f6:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     6fa:	222f 0018      	move.l 24(sp),d1
     6fe:	2401           	move.l d1,d2
     700:	5482           	addq.l #2,d2
     702:	2f42 0018      	move.l d2,24(sp)
     706:	202f 0014      	move.l 20(sp),d0
     70a:	2400           	move.l d0,d2
     70c:	5482           	addq.l #2,d2
     70e:	2f42 0014      	move.l d2,20(sp)
     712:	2041           	movea.l d1,a0
     714:	3210           	move.w (a0),d1
     716:	2040           	movea.l d0,a0
     718:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     71a:	202f 0018      	move.l 24(sp),d0
     71e:	2200           	move.l d0,d1
     720:	5481           	addq.l #2,d1
     722:	2f41 0018      	move.l d1,24(sp)
     726:	2040           	movea.l d0,a0
     728:	3010           	move.w (a0),d0
     72a:	206f 0014      	movea.l 20(sp),a0
     72e:	3080           	move.w d0,(a0)
  copperlist += 2;
     730:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     734:	42af 0004      	clr.l 4(sp)
     738:	601e           	bra.s 758 <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     73a:	202f 0018      	move.l 24(sp),d0
     73e:	2200           	move.l d0,d1
     740:	5481           	addq.l #2,d1
     742:	2f41 0018      	move.l d1,24(sp)
     746:	2040           	movea.l d0,a0
     748:	3010           	move.w (a0),d0
     74a:	206f 0014      	movea.l 20(sp),a0
     74e:	3080           	move.w d0,(a0)
    copperlist += 2;
     750:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     754:	52af 0004      	addq.l #1,4(sp)
     758:	7006           	moveq #6,d0
     75a:	b0af 0004      	cmp.l 4(sp),d0
     75e:	6cda           	bge.s 73a <Zoom_InsertShift+0xe0>
  }
}
     760:	241f           	move.l (sp)+,d2
     762:	4fef 000c      	lea 12(sp),sp
     766:	4e75           	rts

00000768 <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     768:	518f           	subq.l #8,sp
     76a:	202f 000c      	move.l 12(sp),d0
     76e:	3000           	move.w d0,d0
     770:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     774:	7200           	moveq #0,d1
     776:	322f 0002      	move.w 2(sp),d1
     77a:	2001           	move.l d1,d0
     77c:	d080           	add.l d0,d0
     77e:	d081           	add.l d1,d0
     780:	2200           	move.l d0,d1
     782:	e789           	lsl.l #3,d1
     784:	d081           	add.l d1,d0
     786:	e788           	lsl.l #3,d0
     788:	2200           	move.l d0,d1
     78a:	0681 0001 a5c0 	addi.l #107968,d1
     790:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     794:	202f 0010      	move.l 16(sp),d0
     798:	0680 0000 012a 	addi.l #298,d0
     79e:	2f2f 0004      	move.l 4(sp),-(sp)
     7a2:	2f00           	move.l d0,-(sp)
     7a4:	4eba feb4      	jsr 65a <Zoom_InsertShift>(pc)
     7a8:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     7aa:	7236           	moveq #54,d1
     7ac:	d2af 0004      	add.l 4(sp),d1
     7b0:	202f 0010      	move.l 16(sp),d0
     7b4:	0680 0000 01a2 	addi.l #418,d0
     7ba:	2f01           	move.l d1,-(sp)
     7bc:	2f00           	move.l d0,-(sp)
     7be:	4eba fe9a      	jsr 65a <Zoom_InsertShift>(pc)
     7c2:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     7c4:	726c           	moveq #108,d1
     7c6:	d2af 0004      	add.l 4(sp),d1
     7ca:	202f 0010      	move.l 16(sp),d0
     7ce:	0680 0000 0212 	addi.l #530,d0
     7d4:	2f01           	move.l d1,-(sp)
     7d6:	2f00           	move.l d0,-(sp)
     7d8:	4eba fe80      	jsr 65a <Zoom_InsertShift>(pc)
     7dc:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     7de:	222f 0004      	move.l 4(sp),d1
     7e2:	0681 0000 00a2 	addi.l #162,d1
     7e8:	202f 0010      	move.l 16(sp),d0
     7ec:	0680 0000 0282 	addi.l #642,d0
     7f2:	2f01           	move.l d1,-(sp)
     7f4:	2f00           	move.l d0,-(sp)
     7f6:	4eba fe62      	jsr 65a <Zoom_InsertShift>(pc)
     7fa:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     7fc:	508f           	addq.l #8,sp
     7fe:	4e75           	rts

00000800 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
     800:	4fef fe9c      	lea -356(sp),sp
     804:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  UWORD size4buffer = 40*544*ZMBPLDEPTH;
     808:	3f7c a900 015a 	move.w #-22272,346(sp)
  UWORD size4target = 44*272*ZMBPLDEPTH;
     80e:	3f7c e9c0 0158 	move.w #-5696,344(sp)
  ULONG *pic1 = AllocMem( size4buffer, MEMF_CHIP);
     814:	7000           	moveq #0,d0
     816:	302f 015a      	move.w 346(sp),d0
     81a:	2f40 0154      	move.l d0,340(sp)
     81e:	7002           	moveq #2,d0
     820:	2f40 0150      	move.l d0,336(sp)
     824:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     82a:	2c40           	movea.l d0,a6
     82c:	202f 0154      	move.l 340(sp),d0
     830:	222f 0150      	move.l 336(sp),d1
     834:	4eae ff3a      	jsr -198(a6)
     838:	2f40 014c      	move.l d0,332(sp)
     83c:	202f 014c      	move.l 332(sp),d0
     840:	2f40 0148      	move.l d0,328(sp)
  if( pic1 == 0) {
     844:	4aaf 0148      	tst.l 328(sp)
     848:	6646           	bne.s 890 <Test_Zoom2+0x90>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic1\n", 38);
     84a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     850:	2c40           	movea.l d0,a6
     852:	4eae ffc4      	jsr -60(a6)
     856:	2f40 0144      	move.l d0,324(sp)
     85a:	202f 0144      	move.l 324(sp),d0
     85e:	2f40 0140      	move.l d0,320(sp)
     862:	2f7c 0000 74b2 	move.l #29874,316(sp)
     868:	013c 
     86a:	7226           	moveq #38,d1
     86c:	2f41 0138      	move.l d1,312(sp)
     870:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     876:	2c40           	movea.l d0,a6
     878:	222f 0140      	move.l 320(sp),d1
     87c:	242f 013c      	move.l 316(sp),d2
     880:	262f 0138      	move.l 312(sp),d3
     884:	4eae ffd0      	jsr -48(a6)
     888:	2f40 0134      	move.l d0,308(sp)
     88c:	6000 046c      	bra.w cfa <Test_Zoom2+0x4fa>
    return;
  }
  ULONG *pic2 = AllocMem( size4buffer*2,MEMF_CHIP);
     890:	7000           	moveq #0,d0
     892:	302f 015a      	move.w 346(sp),d0
     896:	d080           	add.l d0,d0
     898:	2f40 0130      	move.l d0,304(sp)
     89c:	7002           	moveq #2,d0
     89e:	2f40 012c      	move.l d0,300(sp)
     8a2:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     8a8:	2c40           	movea.l d0,a6
     8aa:	202f 0130      	move.l 304(sp),d0
     8ae:	222f 012c      	move.l 300(sp),d1
     8b2:	4eae ff3a      	jsr -198(a6)
     8b6:	2f40 0128      	move.l d0,296(sp)
     8ba:	202f 0128      	move.l 296(sp),d0
     8be:	2f40 0124      	move.l d0,292(sp)
  if( pic2 == 0) {
     8c2:	4aaf 0124      	tst.l 292(sp)
     8c6:	6646           	bne.s 90e <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic2\n", 38);
     8c8:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     8ce:	2c40           	movea.l d0,a6
     8d0:	4eae ffc4      	jsr -60(a6)
     8d4:	2f40 0120      	move.l d0,288(sp)
     8d8:	202f 0120      	move.l 288(sp),d0
     8dc:	2f40 011c      	move.l d0,284(sp)
     8e0:	2f7c 0000 74d9 	move.l #29913,280(sp)
     8e6:	0118 
     8e8:	7226           	moveq #38,d1
     8ea:	2f41 0114      	move.l d1,276(sp)
     8ee:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     8f4:	2c40           	movea.l d0,a6
     8f6:	222f 011c      	move.l 284(sp),d1
     8fa:	242f 0118      	move.l 280(sp),d2
     8fe:	262f 0114      	move.l 276(sp),d3
     902:	4eae ffd0      	jsr -48(a6)
     906:	2f40 0110      	move.l d0,272(sp)
     90a:	6000 03ee      	bra.w cfa <Test_Zoom2+0x4fa>
    return;
  }
  ULONG *target = AllocMem( size4target, MEMF_CHIP);
     90e:	7000           	moveq #0,d0
     910:	302f 0158      	move.w 344(sp),d0
     914:	2f40 010c      	move.l d0,268(sp)
     918:	7002           	moveq #2,d0
     91a:	2f40 0108      	move.l d0,264(sp)
     91e:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     924:	2c40           	movea.l d0,a6
     926:	202f 010c      	move.l 268(sp),d0
     92a:	222f 0108      	move.l 264(sp),d1
     92e:	4eae ff3a      	jsr -198(a6)
     932:	2f40 0104      	move.l d0,260(sp)
     936:	202f 0104      	move.l 260(sp),d0
     93a:	2f40 0100      	move.l d0,256(sp)
  UWORD *bp = 0x200;
     93e:	2f7c 0000 0200 	move.l #512,252(sp)
     944:	00fc 
  *bp = 0;
     946:	206f 00fc      	movea.l 252(sp),a0
     94a:	4250           	clr.w (a0)
  if( target == 0) {
     94c:	4aaf 0100      	tst.l 256(sp)
     950:	6646           	bne.s 998 <Test_Zoom2+0x198>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
     952:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     958:	2c40           	movea.l d0,a6
     95a:	4eae ffc4      	jsr -60(a6)
     95e:	2f40 00f8      	move.l d0,248(sp)
     962:	202f 00f8      	move.l 248(sp),d0
     966:	2f40 00f4      	move.l d0,244(sp)
     96a:	2f7c 0000 7500 	move.l #29952,240(sp)
     970:	00f0 
     972:	7228           	moveq #40,d1
     974:	2f41 00ec      	move.l d1,236(sp)
     978:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     97e:	2c40           	movea.l d0,a6
     980:	222f 00f4      	move.l 244(sp),d1
     984:	242f 00f0      	move.l 240(sp),d2
     988:	262f 00ec      	move.l 236(sp),d3
     98c:	4eae ffd0      	jsr -48(a6)
     990:	2f40 00e8      	move.l d0,232(sp)
     994:	6000 0364      	bra.w cfa <Test_Zoom2+0x4fa>
    return;
  }
  Zoom_Zl4Words = AllocMem( 21*8, MEMF_ANY);
     998:	2f7c 0000 00a8 	move.l #168,228(sp)
     99e:	00e4 
     9a0:	42af 00e0      	clr.l 224(sp)
     9a4:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     9aa:	2c40           	movea.l d0,a6
     9ac:	202f 00e4      	move.l 228(sp),d0
     9b0:	222f 00e0      	move.l 224(sp),d1
     9b4:	4eae ff3a      	jsr -198(a6)
     9b8:	2f40 00dc      	move.l d0,220(sp)
     9bc:	202f 00dc      	move.l 220(sp),d0
     9c0:	23c0 0001 baf8 	move.l d0,1baf8 <Zoom_Zl4Words>
  if( Zoom_Zl4Words == 0) {
     9c6:	2039 0001 baf8 	move.l 1baf8 <Zoom_Zl4Words>,d0
     9cc:	4a80           	tst.l d0
     9ce:	6646           	bne.s a16 <Test_Zoom2+0x216>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for Zoom_Zl4Words\n", 40);
     9d0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     9d6:	2c40           	movea.l d0,a6
     9d8:	4eae ffc4      	jsr -60(a6)
     9dc:	2f40 00d8      	move.l d0,216(sp)
     9e0:	202f 00d8      	move.l 216(sp),d0
     9e4:	2f40 00d4      	move.l d0,212(sp)
     9e8:	2f7c 0000 7529 	move.l #29993,208(sp)
     9ee:	00d0 
     9f0:	7028           	moveq #40,d0
     9f2:	2f40 00cc      	move.l d0,204(sp)
     9f6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     9fc:	2c40           	movea.l d0,a6
     9fe:	222f 00d4      	move.l 212(sp),d1
     a02:	242f 00d0      	move.l 208(sp),d2
     a06:	262f 00cc      	move.l 204(sp),d3
     a0a:	4eae ffd0      	jsr -48(a6)
     a0e:	2f40 00c8      	move.l d0,200(sp)
     a12:	6000 02e6      	bra.w cfa <Test_Zoom2+0x4fa>
    return;
  }
  
  UWORD *pos2write = Zoom_Zl4Words;
     a16:	2f79 0001 baf8 	move.l 1baf8 <Zoom_Zl4Words>,372(sp)
     a1c:	0174 
  for( int i=0;i<14;i++) {
     a1e:	42af 0170      	clr.l 368(sp)
     a22:	603a           	bra.s a5e <Test_Zoom2+0x25e>
    *pos2write++ = 4;
     a24:	202f 0174      	move.l 372(sp),d0
     a28:	2200           	move.l d0,d1
     a2a:	5481           	addq.l #2,d1
     a2c:	2f41 0174      	move.l d1,372(sp)
     a30:	2040           	movea.l d0,a0
     a32:	30bc 0004      	move.w #4,(a0)
    *pos2write++ = 4;
     a36:	202f 0174      	move.l 372(sp),d0
     a3a:	2200           	move.l d0,d1
     a3c:	5481           	addq.l #2,d1
     a3e:	2f41 0174      	move.l d1,372(sp)
     a42:	2040           	movea.l d0,a0
     a44:	30bc 0004      	move.w #4,(a0)
    *pos2write++ = 8;
     a48:	202f 0174      	move.l 372(sp),d0
     a4c:	2200           	move.l d0,d1
     a4e:	5481           	addq.l #2,d1
     a50:	2f41 0174      	move.l d1,372(sp)
     a54:	2040           	movea.l d0,a0
     a56:	30bc 0008      	move.w #8,(a0)
  for( int i=0;i<14;i++) {
     a5a:	52af 0170      	addq.l #1,368(sp)
     a5e:	700d           	moveq #13,d0
     a60:	b0af 0170      	cmp.l 368(sp),d0
     a64:	6cbe           	bge.s a24 <Test_Zoom2+0x224>
  }
  //16   16 ffff
  //8+16 40 ff00
  //8+16 64 0000
  Utils_FillLong( pic1, 0xfff00f00, 272, 10, 0 );
     a66:	42a7           	clr.l -(sp)
     a68:	4878 000a      	pea a <GetVBR+0x2>
     a6c:	4878 0110      	pea 110 <FreeDisplay+0x2>
     a70:	2f3c fff0 0f00 	move.l #-1044736,-(sp)
     a76:	2f2f 0158      	move.l 344(sp),-(sp)
     a7a:	4eba fa14      	jsr 490 <Utils_FillLong>(pc)
     a7e:	4fef 0014      	lea 20(sp),sp
  Utils_FillLong( pic1+10*272, 0xfff00f00, 272, 10, 0 );
     a82:	202f 0148      	move.l 328(sp),d0
     a86:	0680 0000 2a80 	addi.l #10880,d0
     a8c:	42a7           	clr.l -(sp)
     a8e:	4878 000a      	pea a <GetVBR+0x2>
     a92:	4878 0110      	pea 110 <FreeDisplay+0x2>
     a96:	2f3c fff0 0f00 	move.l #-1044736,-(sp)
     a9c:	2f00           	move.l d0,-(sp)
     a9e:	4eba f9f0      	jsr 490 <Utils_FillLong>(pc)
     aa2:	4fef 0014      	lea 20(sp),sp
  Utils_FillLong( pic2, 0x0000ffff, 272, 20, 0);
     aa6:	42a7           	clr.l -(sp)
     aa8:	4878 0014      	pea 14 <GetVBR+0xc>
     aac:	4878 0110      	pea 110 <FreeDisplay+0x2>
     ab0:	2f3c 0000 ffff 	move.l #65535,-(sp)
     ab6:	2f2f 0134      	move.l 308(sp),-(sp)
     aba:	4eba f9d4      	jsr 490 <Utils_FillLong>(pc)
     abe:	4fef 0014      	lea 20(sp),sp
  Utils_FillLong( pic2+20*272, 0x0000ffff, 272, 20, 0);
     ac2:	202f 0124      	move.l 292(sp),d0
     ac6:	0680 0000 5500 	addi.l #21760,d0
     acc:	42a7           	clr.l -(sp)
     ace:	4878 0014      	pea 14 <GetVBR+0xc>
     ad2:	4878 0110      	pea 110 <FreeDisplay+0x2>
     ad6:	2f3c 0000 ffff 	move.l #65535,-(sp)
     adc:	2f00           	move.l d0,-(sp)
     ade:	4eba f9b0      	jsr 490 <Utils_FillLong>(pc)
     ae2:	4fef 0014      	lea 20(sp),sp
  //Utils_FillLong( pic2, 0x0000ffff, size4buffer*2);

  
  for( int i=1;i<=1;i++) {
     ae6:	7201           	moveq #1,d1
     ae8:	2f41 016c      	move.l d1,364(sp)
     aec:	6000 0194      	bra.w c82 <Test_Zoom2+0x482>
    Zoom_ZoomIntoPicture2( (UWORD *)pic1, (UWORD *) pic2,(UWORD *) target, i, 
     af0:	202f 016c      	move.l 364(sp),d0
     af4:	3000           	move.w d0,d0
     af6:	0280 0000 ffff 	andi.l #65535,d0
     afc:	4878 0005      	pea 5 <_start+0x5>
     b00:	2f00           	move.l d0,-(sp)
     b02:	2f2f 0108      	move.l 264(sp),-(sp)
     b06:	2f2f 0130      	move.l 304(sp),-(sp)
     b0a:	2f2f 0158      	move.l 344(sp),-(sp)
     b0e:	4eba 1384      	jsr 1e94 <Zoom_ZoomIntoPicture2>(pc)
     b12:	4fef 0014      	lea 20(sp),sp
                                                                             5);
    UWORD *bp = 0x200;
     b16:	2f7c 0000 0200 	move.l #512,196(sp)
     b1c:	00c4 
    *bp = 0;
     b1e:	206f 00c4      	movea.l 196(sp),a0
     b22:	4250           	clr.w (a0)
    UWORD *pos = (UWORD *) target + 1;
     b24:	202f 0100      	move.l 256(sp),d0
     b28:	5480           	addq.l #2,d0
     b2a:	2f40 0168      	move.l d0,360(sp)
    //ULONG pattern = 0xffff << (16 - i*2);
    UWORD pattern[3] = { 0x00ff, 0xff0f, 0xffff };
     b2e:	3f7c 00ff 007e 	move.w #255,126(sp)
     b34:	3f7c ff0f 0080 	move.w #-241,128(sp)
     b3a:	3f7c ffff 0082 	move.w #-1,130(sp)
    for( int i2=0;i2<2;i2++) {
     b40:	42af 0164      	clr.l 356(sp)
     b44:	6000 012e      	bra.w c74 <Test_Zoom2+0x474>
      for( int i3=0;i3<7;i3++) {
     b48:	42af 0160      	clr.l 352(sp)
     b4c:	6000 0114      	bra.w c62 <Test_Zoom2+0x462>
        for( int i4=0; i4<3;i4++) {
     b50:	42af 015c      	clr.l 348(sp)
     b54:	6000 00fe      	bra.w c54 <Test_Zoom2+0x454>
          if(*pos++ != pattern[i4])  {
     b58:	202f 0168      	move.l 360(sp),d0
     b5c:	2200           	move.l d0,d1
     b5e:	5481           	addq.l #2,d1
     b60:	2f41 0168      	move.l d1,360(sp)
     b64:	2040           	movea.l d0,a0
     b66:	3210           	move.w (a0),d1
     b68:	202f 015c      	move.l 348(sp),d0
     b6c:	d080           	add.l d0,d0
     b6e:	41ef 0178      	lea 376(sp),a0
     b72:	d088           	add.l a0,d0
     b74:	2040           	movea.l d0,a0
     b76:	41e8 ff06      	lea -250(a0),a0
     b7a:	3010           	move.w (a0),d0
     b7c:	b041           	cmp.w d1,d0
     b7e:	6700 00d0      	beq.w c50 <Test_Zoom2+0x450>
            pos--;
     b82:	55af 0168      	subq.l #2,360(sp)
            UWORD data[3];
            char str[100];
            data[0] = i;
     b86:	202f 016c      	move.l 364(sp),d0
     b8a:	3f40 0078      	move.w d0,120(sp)
            data[1] = i3*3+i4;
     b8e:	222f 0160      	move.l 352(sp),d1
     b92:	3001           	move.w d1,d0
     b94:	d040           	add.w d0,d0
     b96:	d240           	add.w d0,d1
     b98:	202f 015c      	move.l 348(sp),d0
     b9c:	d041           	add.w d1,d0
     b9e:	3f40 007a      	move.w d0,122(sp)
            data[2] = *pos;
     ba2:	206f 0168      	movea.l 360(sp),a0
     ba6:	3010           	move.w (a0),d0
     ba8:	3f40 007c      	move.w d0,124(sp)
            pos++;
     bac:	54af 0168      	addq.l #2,360(sp)
            
            RawDoFmt( "Test_Zoom2: Pattern for zoomlevel %d, byte %d messed up."
     bb0:	2f7c 0000 7559 	move.l #30041,192(sp)
     bb6:	00c0 
     bb8:	203c 0000 0178 	move.l #376,d0
     bbe:	d08f           	add.l sp,d0
     bc0:	0680 ffff ff00 	addi.l #-256,d0
     bc6:	2f40 00bc      	move.l d0,188(sp)
     bca:	2f7c 0000 729c 	move.l #29340,184(sp)
     bd0:	00b8 
     bd2:	223c 0000 0178 	move.l #376,d1
     bd8:	d28f           	add.l sp,d1
     bda:	0681 ffff fe9c 	addi.l #-356,d1
     be0:	2f41 00b4      	move.l d1,180(sp)
     be4:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     bea:	2c40           	movea.l d0,a6
     bec:	206f 00c0      	movea.l 192(sp),a0
     bf0:	226f 00bc      	movea.l 188(sp),a1
     bf4:	246f 00b8      	movea.l 184(sp),a2
     bf8:	266f 00b4      	movea.l 180(sp),a3
     bfc:	4eae fdf6      	jsr -522(a6)
     c00:	2f40 00b0      	move.l d0,176(sp)
                                        "Result was %x.\n", data, PutChar, str);
            Write( Output(), str, 66);
     c04:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     c0a:	2c40           	movea.l d0,a6
     c0c:	4eae ffc4      	jsr -60(a6)
     c10:	2f40 00ac      	move.l d0,172(sp)
     c14:	202f 00ac      	move.l 172(sp),d0
     c18:	2f40 00a8      	move.l d0,168(sp)
     c1c:	203c 0000 0178 	move.l #376,d0
     c22:	d08f           	add.l sp,d0
     c24:	0680 ffff fe9c 	addi.l #-356,d0
     c2a:	2f40 00a4      	move.l d0,164(sp)
     c2e:	7242           	moveq #66,d1
     c30:	2f41 00a0      	move.l d1,160(sp)
     c34:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     c3a:	2c40           	movea.l d0,a6
     c3c:	222f 00a8      	move.l 168(sp),d1
     c40:	242f 00a4      	move.l 164(sp),d2
     c44:	262f 00a0      	move.l 160(sp),d3
     c48:	4eae ffd0      	jsr -48(a6)
     c4c:	2f40 009c      	move.l d0,156(sp)
        for( int i4=0; i4<3;i4++) {
     c50:	52af 015c      	addq.l #1,348(sp)
     c54:	7002           	moveq #2,d0
     c56:	b0af 015c      	cmp.l 348(sp),d0
     c5a:	6c00 fefc      	bge.w b58 <Test_Zoom2+0x358>
      for( int i3=0;i3<7;i3++) {
     c5e:	52af 0160      	addq.l #1,352(sp)
     c62:	7206           	moveq #6,d1
     c64:	b2af 0160      	cmp.l 352(sp),d1
     c68:	6c00 fee6      	bge.w b50 <Test_Zoom2+0x350>
          }
        }
      } 
      pos+=2;
     c6c:	58af 0168      	addq.l #4,360(sp)
    for( int i2=0;i2<2;i2++) {
     c70:	52af 0164      	addq.l #1,356(sp)
     c74:	7001           	moveq #1,d0
     c76:	b0af 0164      	cmp.l 356(sp),d0
     c7a:	6c00 fecc      	bge.w b48 <Test_Zoom2+0x348>
  for( int i=1;i<=1;i++) {
     c7e:	52af 016c      	addq.l #1,364(sp)
     c82:	7201           	moveq #1,d1
     c84:	b2af 016c      	cmp.l 364(sp),d1
     c88:	6c00 fe66      	bge.w af0 <Test_Zoom2+0x2f0>
    }
  }
  FreeMem( pic1, size4buffer);
     c8c:	2f6f 0148 0098 	move.l 328(sp),152(sp)
     c92:	7000           	moveq #0,d0
     c94:	302f 015a      	move.w 346(sp),d0
     c98:	2f40 0094      	move.l d0,148(sp)
     c9c:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     ca2:	2c40           	movea.l d0,a6
     ca4:	226f 0098      	movea.l 152(sp),a1
     ca8:	202f 0094      	move.l 148(sp),d0
     cac:	4eae ff2e      	jsr -210(a6)
  FreeMem( pic2, size4buffer*2);
     cb0:	2f6f 0124 0090 	move.l 292(sp),144(sp)
     cb6:	7000           	moveq #0,d0
     cb8:	302f 015a      	move.w 346(sp),d0
     cbc:	d080           	add.l d0,d0
     cbe:	2f40 008c      	move.l d0,140(sp)
     cc2:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     cc8:	2c40           	movea.l d0,a6
     cca:	226f 0090      	movea.l 144(sp),a1
     cce:	202f 008c      	move.l 140(sp),d0
     cd2:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, size4target);
     cd6:	2f6f 0100 0088 	move.l 256(sp),136(sp)
     cdc:	7000           	moveq #0,d0
     cde:	302f 0158      	move.w 344(sp),d0
     ce2:	2f40 0084      	move.l d0,132(sp)
     ce6:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     cec:	2c40           	movea.l d0,a6
     cee:	226f 0088      	movea.l 136(sp),a1
     cf2:	202f 0084      	move.l 132(sp),d0
     cf6:	4eae ff2e      	jsr -210(a6)
     cfa:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
     cfe:	4fef 0164      	lea 356(sp),sp
     d02:	4e75           	rts

00000d04 <main>:
#include "utils.h"
#include "runtests.h"
#include "rundemo.h"

int main() {
     d04:	4fef ffd8      	lea -40(sp),sp
     d08:	2f0e           	move.l a6,-(sp)

  UWORD test = 99;
     d0a:	3f7c 0063 002a 	move.w #99,42(sp)
  /*UWORD *bp = 0x200;
  *bp = test;*/
  ULONG tmp = 4;
     d10:	7004           	moveq #4,d0
     d12:	2f40 0026      	move.l d0,38(sp)
  SysBase = *((struct ExecBase**)tmp);
     d16:	206f 0026      	movea.l 38(sp),a0
     d1a:	2010           	move.l (a0),d0
     d1c:	23c0 0001 ba7c 	move.l d0,1ba7c <_edata>
	hw = (struct Custom*)0xdff000;
     d22:	23fc 00df f000 	move.l #14675968,1baba <hw>
     d28:	0001 baba 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
     d2c:	2f7c 0000 75a1 	move.l #30113,34(sp)
     d32:	0022 
     d34:	42af 001e      	clr.l 30(sp)
     d38:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     d3e:	2c40           	movea.l d0,a6
     d40:	226f 0022      	movea.l 34(sp),a1
     d44:	202f 001e      	move.l 30(sp),d0
     d48:	4eae fdd8      	jsr -552(a6)
     d4c:	2f40 001a      	move.l d0,26(sp)
     d50:	202f 001a      	move.l 26(sp),d0
     d54:	23c0 0001 ba84 	move.l d0,1ba84 <GfxBase>
	if (!GfxBase)
     d5a:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
     d60:	4a80           	tst.l d0
     d62:	6614           	bne.s d78 <main+0x74>
		Exit(0);
     d64:	42af 0016      	clr.l 22(sp)
     d68:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     d6e:	2c40           	movea.l d0,a6
     d70:	222f 0016      	move.l 22(sp),d1
     d74:	4eae ff70      	jsr -144(a6)

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     d78:	2f7c 0000 75b2 	move.l #30130,18(sp)
     d7e:	0012 
     d80:	42af 000e      	clr.l 14(sp)
     d84:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     d8a:	2c40           	movea.l d0,a6
     d8c:	226f 0012      	movea.l 18(sp),a1
     d90:	202f 000e      	move.l 14(sp),d0
     d94:	4eae fdd8      	jsr -552(a6)
     d98:	2f40 000a      	move.l d0,10(sp)
     d9c:	202f 000a      	move.l 10(sp),d0
     da0:	23c0 0001 ba80 	move.l d0,1ba80 <DOSBase>
	if (!DOSBase)
     da6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     dac:	4a80           	tst.l d0
     dae:	6614           	bne.s dc4 <main+0xc0>
		Exit(0);
     db0:	42af 0006      	clr.l 6(sp)
     db4:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
     dba:	2c40           	movea.l d0,a6
     dbc:	222f 0006      	move.l 6(sp),d1
     dc0:	4eae ff70      	jsr -144(a6)

	//KPrintF("Hello debugger from Amiga!\n");
	//Write(Output(), "Hello console!\n", 15);
	/*Delay(50);*/
  //Zoom_InitRun();
  RunTests();	//warpmode(1);
     dc4:	4eba 6250      	jsr 7016 <RunTests>(pc)
     dc8:	7000           	moveq #0,d0

	//FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     dca:	2c5f           	movea.l (sp)+,a6
     dcc:	4fef 0028      	lea 40(sp),sp
     dd0:	4e75           	rts

00000dd2 <Zoom_VblankHandler>:
UWORD *Zoom_Zl4Words;


void Zoom_VblankHandler() {
  
  Zoom_Counter++;
     dd2:	3039 0001 bae2 	move.w 1bae2 <Zoom_Counter>,d0
     dd8:	5240           	addq.w #1,d0
     dda:	33c0 0001 bae2 	move.w d0,1bae2 <Zoom_Counter>
  SwapCl();
     de0:	4eba f448      	jsr 22a <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     de4:	33fc 0001 0001 	move.w #1,1bac6 <Zoom_MouseReleased>
     dea:	bac6 
  if( MouseLeft())
     dec:	4eba f6e8      	jsr 4d6 <MouseLeft>(pc)
     df0:	4a40           	tst.w d0
     df2:	6708           	beq.s dfc <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     df4:	33fc 0001 0001 	move.w #1,1bac8 <Zoom_Mousepressed>
     dfa:	bac8 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     dfc:	3039 0001 bac8 	move.w 1bac8 <Zoom_Mousepressed>,d0
     e02:	0c40 0001      	cmpi.w #1,d0
     e06:	6616           	bne.s e1e <Zoom_VblankHandler+0x4c>
     e08:	4eba f6cc      	jsr 4d6 <MouseLeft>(pc)
     e0c:	4a40           	tst.w d0
     e0e:	660e           	bne.s e1e <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e10:	33fc 0001 0001 	move.w #1,1bac6 <Zoom_MouseReleased>
     e16:	bac6 
    Zoom_Mousepressed = 0;
     e18:	4279 0001 bac8 	clr.w 1bac8 <Zoom_Mousepressed>
  }
    if( Zoom_MouseReleased == 1) {
     e1e:	3039 0001 bac6 	move.w 1bac6 <Zoom_MouseReleased>,d0
     e24:	0c40 0001      	cmpi.w #1,d0
     e28:	666c           	bne.s e96 <Zoom_VblankHandler+0xc4>
      Zoom_MouseReleased = 0;
     e2a:	4279 0001 bac6 	clr.w 1bac6 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
     e30:	3039 0001 bace 	move.w 1bace <Zoom_LevelOf102Zoom>,d0
     e36:	4a40           	tst.w d0
     e38:	664e           	bne.s e88 <Zoom_VblankHandler+0xb6>
 
        if( Zoom_LevelOfZoom == 17)
     e3a:	3039 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,d0
     e40:	0c40 0011      	cmpi.w #17,d0
     e44:	660a           	bne.s e50 <Zoom_VblankHandler+0x7e>
          Zoom_LevelOfZoom = 0;
     e46:	33fc 0000 0001 	move.w #0,1bacc <Zoom_LevelOfZoom>
     e4c:	bacc 
     e4e:	600e           	bra.s e5e <Zoom_VblankHandler+0x8c>
        else
          Zoom_LevelOfZoom++;
     e50:	3039 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,d0
     e56:	5240           	addq.w #1,d0
     e58:	33c0 0001 bacc 	move.w d0,1bacc <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     e5e:	3039 0001 bacc 	move.w 1bacc <Zoom_LevelOfZoom>,d0
     e64:	3000           	move.w d0,d0
     e66:	0280 0000 ffff 	andi.l #65535,d0
     e6c:	2240           	movea.l d0,a1
     e6e:	d3c0           	adda.l d0,a1
     e70:	41f9 0001 b4c0 	lea 1b4c0 <MaxZoom102>,a0
     e76:	3031 8800      	move.w (0,a1,a0.l),d0
     e7a:	5540           	subq.w #2,d0
     e7c:	33c0 0001 bace 	move.w d0,1bace <Zoom_LevelOf102Zoom>
        Zoom_SwapBuffers();
     e82:	4eba 0fee      	jsr 1e72 <Zoom_SwapBuffers>(pc)
     e86:	600e           	bra.s e96 <Zoom_VblankHandler+0xc4>
      } else 
        Zoom_LevelOf102Zoom--;
     e88:	3039 0001 bace 	move.w 1bace <Zoom_LevelOf102Zoom>,d0
     e8e:	5340           	subq.w #1,d0
     e90:	33c0 0001 bace 	move.w d0,1bace <Zoom_LevelOf102Zoom>
    }
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     e96:	2239 0001 baa0 	move.l 1baa0 <DrawCopper>,d1
     e9c:	3039 0001 bace 	move.w 1bace <Zoom_LevelOf102Zoom>,d0
     ea2:	3000           	move.w d0,d0
     ea4:	0280 0000 ffff 	andi.l #65535,d0
     eaa:	2f01           	move.l d1,-(sp)
     eac:	2f00           	move.l d0,-(sp)
     eae:	4eba f8b8      	jsr 768 <Zoom_Shrink102>(pc)
     eb2:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     eb4:	2239 0001 baa0 	move.l 1baa0 <DrawCopper>,d1
     eba:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
     ec0:	2f01           	move.l d1,-(sp)
     ec2:	2f00           	move.l d0,-(sp)
     ec4:	4eba 0f30      	jsr 1df6 <Zoom_SetBplPointers>(pc)
     ec8:	508f           	addq.l #8,sp
 
}
     eca:	4e75           	rts

00000ecc <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     ecc:	4fef fff4      	lea -12(sp),sp
     ed0:	2f0e           	move.l a6,-(sp)
  CopyMem( startimage, destination, ZMBPLSIZE);
     ed2:	2f79 0001 b514 	move.l 1b514 <startimage>,12(sp)
     ed8:	000c 
     eda:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     ee0:	2f7c 0000 ff00 	move.l #65280,4(sp)
     ee6:	0004 
     ee8:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
     eee:	2c40           	movea.l d0,a6
     ef0:	206f 000c      	movea.l 12(sp),a0
     ef4:	226f 0008      	movea.l 8(sp),a1
     ef8:	202f 0004      	move.l 4(sp),d0
     efc:	4eae fd90      	jsr -624(a6)
}
     f00:	2c5f           	movea.l (sp)+,a6
     f02:	4fef 000c      	lea 12(sp),sp
     f06:	4e75           	rts

00000f08 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     f08:	598f           	subq.l #4,sp
     f0a:	202f 0010      	move.l 16(sp),d0
     f0e:	3000           	move.w d0,d0
     f10:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     f14:	4eba f1ca      	jsr e0 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     f18:	2079 0001 baba 	movea.l 1baba <hw>,a0
     f1e:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     f24:	2079 0001 baba 	movea.l 1baba <hw>,a0
     f2a:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f30:	302f 0002      	move.w 2(sp),d0
     f34:	ed48           	lsl.w #6,d0
     f36:	2079 0001 baba 	movea.l 1baba <hw>,a0
     f3c:	5440           	addq.w #2,d0
     f3e:	3140 0058      	move.w d0,88(a0)

}
     f42:	588f           	addq.l #4,sp
     f44:	4e75           	rts

00000f46 <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     f46:	518f           	subq.l #8,sp
     f48:	202f 0014      	move.l 20(sp),d0
     f4c:	3000           	move.w d0,d0
     f4e:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     f52:	3039 0001 badc 	move.w 1badc <ZoomBlit_Increment4SrcA>,d0
     f58:	3000           	move.w d0,d0
     f5a:	0280 0000 ffff 	andi.l #65535,d0
     f60:	d080           	add.l d0,d0
     f62:	222f 000c      	move.l 12(sp),d1
     f66:	d280           	add.l d0,d1
     f68:	2f41 0004      	move.l d1,4(sp)
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  WaitBlt();
     f6c:	4eba f172      	jsr e0 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
     f70:	2079 0001 baba 	movea.l 1baba <hw>,a0
     f76:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
     f7c:	2079 0001 baba 	movea.l 1baba <hw>,a0
     f82:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
     f88:	2079 0001 baba 	movea.l 1baba <hw>,a0
     f8e:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f94:	302f 0002      	move.w 2(sp),d0
     f98:	ed48           	lsl.w #6,d0
     f9a:	2079 0001 baba 	movea.l 1baba <hw>,a0
     fa0:	5440           	addq.w #2,d0
     fa2:	3140 0058      	move.w d0,88(a0)

}
     fa6:	508f           	addq.l #8,sp
     fa8:	4e75           	rts

00000faa <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod) {
     faa:	4fef fff4      	lea -12(sp),sp
     fae:	206f 001c      	movea.l 28(sp),a0
     fb2:	222f 0020      	move.l 32(sp),d1
     fb6:	202f 0024      	move.l 36(sp),d0
     fba:	3048           	movea.w a0,a0
     fbc:	3f48 0004      	move.w a0,4(sp)
     fc0:	3201           	move.w d1,d1
     fc2:	3f41 0002      	move.w d1,2(sp)
     fc6:	3000           	move.w d0,d0
     fc8:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  UWORD *bp = 0x200;
     fca:	2f7c 0000 0200 	move.l #512,8(sp)
     fd0:	0008 
  *bp = 0;
     fd2:	206f 0008      	movea.l 8(sp),a0
     fd6:	4250           	clr.w (a0)
  UWORD bltsize = (height << 6) + 2;
     fd8:	302f 0004      	move.w 4(sp),d0
     fdc:	ed48           	lsl.w #6,d0
     fde:	3200           	move.w d0,d1
     fe0:	5441           	addq.w #2,d1
     fe2:	3f41 0006      	move.w d1,6(sp)
  
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  WaitBlt();
     fe6:	4eba f0f8      	jsr e0 <WaitBlt>(pc)
  1101
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  hw->bltamod = bltamod;
     fea:	2079 0001 baba 	movea.l 1baba <hw>,a0
     ff0:	316f 0002 0064 	move.w 2(sp),100(a0)
  hw->bltbmod = bltbmod;  
     ff6:	2079 0001 baba 	movea.l 1baba <hw>,a0
     ffc:	3157 0062      	move.w (sp),98(a0)
  hw->bltapt = src4a;
    1000:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1006:	216f 0010 0050 	move.l 16(sp),80(a0)
  hw->bltbpt = src4b;
    100c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1012:	216f 0014 004c 	move.l 20(sp),76(a0)
  hw->bltdpt = dst;
    1018:	2079 0001 baba 	movea.l 1baba <hw>,a0
    101e:	216f 0018 0054 	move.l 24(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1024:	302f 0004      	move.w 4(sp),d0
    1028:	ed48           	lsl.w #6,d0
    102a:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1030:	5440           	addq.w #2,d0
    1032:	3140 0058      	move.w d0,88(a0)

}
    1036:	4fef 000c      	lea 12(sp),sp
    103a:	4e75           	rts

0000103c <Zoom_InitRun>:


void Zoom_InitRun() {
    103c:	4fef ffc8      	lea -56(sp),sp
    1040:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1042:	4279 0001 bae2 	clr.w 1bae2 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1048:	7004           	moveq #4,d0
    104a:	2f40 0038      	move.l d0,56(sp)
    104e:	7002           	moveq #2,d0
    1050:	2f40 0034      	move.l d0,52(sp)
    1054:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    105a:	2c40           	movea.l d0,a6
    105c:	202f 0038      	move.l 56(sp),d0
    1060:	222f 0034      	move.l 52(sp),d1
    1064:	4eae ff3a      	jsr -198(a6)
    1068:	2f40 0030      	move.l d0,48(sp)
    106c:	202f 0030      	move.l 48(sp),d0
    1070:	23c0 0001 bad4 	move.l d0,1bad4 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    1076:	33fc 000f 0001 	move.w #15,1bace <Zoom_LevelOf102Zoom>
    107c:	bace 
  ZoomHorizontal = 16;
    107e:	33fc 0010 0001 	move.w #16,1bad2 <ZoomHorizontal>
    1084:	bad2 
  Zoom_PrepareDisplay();
    1086:	4eba 01dc      	jsr 1264 <Zoom_PrepareDisplay>(pc)
  Zoom_StartImage = startimage;
    108a:	2039 0001 b514 	move.l 1b514 <startimage>,d0
    1090:	23c0 0001 bac2 	move.l d0,1bac2 <Zoom_StartImage>
  Zoom_LoadImage( Bitplane1);
    1096:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    109c:	2f00           	move.l d0,-(sp)
    109e:	4eba fe2c      	jsr ecc <Zoom_LoadImage>(pc)
    10a2:	588f           	addq.l #4,sp
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
    10a4:	2239 0001 ba8c 	move.l 1ba8c <Bitplane2>,d1
    10aa:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    10b0:	4878 0005      	pea 5 <_start+0x5>
    10b4:	42a7           	clr.l -(sp)
    10b6:	2f01           	move.l d1,-(sp)
    10b8:	2f00           	move.l d0,-(sp)
    10ba:	4eba 09a0      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    10be:	4fef 0010      	lea 16(sp),sp
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
    10c2:	2f79 0001 ba8c 	move.l 1ba8c <Bitplane2>,44(sp)
    10c8:	002c 
    10ca:	2f79 0001 ba88 	move.l 1ba88 <Bitplane1>,40(sp)
    10d0:	0028 
    10d2:	2f7c 0000 ff00 	move.l #65280,36(sp)
    10d8:	0024 
    10da:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    10e0:	2c40           	movea.l d0,a6
    10e2:	206f 002c      	movea.l 44(sp),a0
    10e6:	226f 0028      	movea.l 40(sp),a1
    10ea:	202f 0024      	move.l 36(sp),d0
    10ee:	4eae fd90      	jsr -624(a6)
  CopyMem( Bitplane2, startimage, ZMBPLSIZE);
    10f2:	2f79 0001 ba8c 	move.l 1ba8c <Bitplane2>,32(sp)
    10f8:	0020 
    10fa:	2f79 0001 b514 	move.l 1b514 <startimage>,28(sp)
    1100:	001c 
    1102:	2f7c 0000 ff00 	move.l #65280,24(sp)
    1108:	0018 
    110a:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    1110:	2c40           	movea.l d0,a6
    1112:	206f 0020      	movea.l 32(sp),a0
    1116:	226f 001c      	movea.l 28(sp),a1
    111a:	202f 0018      	move.l 24(sp),d0
    111e:	4eae fd90      	jsr -624(a6)
  
  Zoom_Shrink102( 15, Copperlist1);
    1122:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    1128:	2f00           	move.l d0,-(sp)
    112a:	4878 000f      	pea f <GetVBR+0x7>
    112e:	4eba f638      	jsr 768 <Zoom_Shrink102>(pc)
    1132:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1134:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    113a:	2f00           	move.l d0,-(sp)
    113c:	4878 000f      	pea f <GetVBR+0x7>
    1140:	4eba f626      	jsr 768 <Zoom_Shrink102>(pc)
    1144:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    1146:	33fc 0001 0001 	move.w #1,1bacc <Zoom_LevelOfZoom>
    114c:	bacc 
  Zoom_Direction = 1;                                                  
    114e:	33fc 0001 0001 	move.w #1,1bad0 <Zoom_Direction>
    1154:	bad0 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1156:	7016           	moveq #22,d0
    1158:	2f40 0014      	move.l d0,20(sp)
    115c:	2f7c 0001 0001 	move.l #65537,16(sp)
    1162:	0010 
    1164:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    116a:	2c40           	movea.l d0,a6
    116c:	202f 0014      	move.l 20(sp),d0
    1170:	222f 0010      	move.l 16(sp),d1
    1174:	4eae ff3a      	jsr -198(a6)
    1178:	2f40 000c      	move.l d0,12(sp)
    117c:	202f 000c      	move.l 12(sp),d0
    1180:	23c0 0001 bade 	move.l d0,1bade <Zoom_vbint>
    1186:	2039 0001 bade 	move.l 1bade <Zoom_vbint>,d0
    118c:	4a80           	tst.l d0
    118e:	673e           	beq.s 11ce <Zoom_InitRun+0x192>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1190:	2079 0001 bade 	movea.l 1bade <Zoom_vbint>,a0
    1196:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    119c:	2079 0001 bade 	movea.l 1bade <Zoom_vbint>,a0
    11a2:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    11a8:	2079 0001 bade 	movea.l 1bade <Zoom_vbint>,a0
    11ae:	217c 0001 74bf 	move.l #95423,10(a0)
    11b4:	000a 
    Zoom_vbint->is_Data = NULL;
    11b6:	2079 0001 bade 	movea.l 1bade <Zoom_vbint>,a0
    11bc:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    11c0:	2079 0001 bade 	movea.l 1bade <Zoom_vbint>,a0
    11c6:	217c 0000 0dd2 	move.l #3538,18(a0)
    11cc:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    11ce:	7005           	moveq #5,d0
    11d0:	2f40 0008      	move.l d0,8(sp)
    11d4:	2f79 0001 bade 	move.l 1bade <Zoom_vbint>,4(sp)
    11da:	0004 
    11dc:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    11e2:	2c40           	movea.l d0,a6
    11e4:	202f 0008      	move.l 8(sp),d0
    11e8:	226f 0004      	movea.l 4(sp),a1
    11ec:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    11f0:	2239 0001 baa4 	move.l 1baa4 <ViewCopper>,d1
    11f6:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
    11fc:	2f01           	move.l d1,-(sp)
    11fe:	2f00           	move.l d0,-(sp)
    1200:	4eba 0bf4      	jsr 1df6 <Zoom_SetBplPointers>(pc)
    1204:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1206:	2239 0001 baa0 	move.l 1baa0 <DrawCopper>,d1
    120c:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
    1212:	2f01           	move.l d1,-(sp)
    1214:	2f00           	move.l d0,-(sp)
    1216:	4eba 0bde      	jsr 1df6 <Zoom_SetBplPointers>(pc)
    121a:	508f           	addq.l #8,sp
  SwapCl();
    121c:	4eba f00c      	jsr 22a <SwapCl>(pc)
  
}
    1220:	2c5f           	movea.l (sp)+,a6
    1222:	4fef 0038      	lea 56(sp),sp
    1226:	4e75           	rts

00001228 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1228:	518f           	subq.l #8,sp
    122a:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    122c:	7005           	moveq #5,d0
    122e:	2f40 0008      	move.l d0,8(sp)
    1232:	2f79 0001 bade 	move.l 1bade <Zoom_vbint>,4(sp)
    1238:	0004 
    123a:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    1240:	2c40           	movea.l d0,a6
    1242:	202f 0008      	move.l 8(sp),d0
    1246:	226f 0004      	movea.l 4(sp),a1
    124a:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    124e:	2f3c 0000 ff00 	move.l #65280,-(sp)
    1254:	4878 031c      	pea 31c <TakeSystem+0xb4>
    1258:	4eba eeb4      	jsr 10e <FreeDisplay>(pc)
    125c:	508f           	addq.l #8,sp
}
    125e:	2c5f           	movea.l (sp)+,a6
    1260:	508f           	addq.l #8,sp
    1262:	4e75           	rts

00001264 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    1264:	4fef ffb8      	lea -72(sp),sp
    1268:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClbuildZoom( );
    126c:	4eba 01be      	jsr 142c <ClbuildZoom>(pc)
    1270:	23c0 0001 ba90 	move.l d0,1ba90 <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    1276:	4eba 01b4      	jsr 142c <ClbuildZoom>(pc)
    127a:	23c0 0001 ba94 	move.l d0,1ba94 <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    1280:	2f7c 0000 ff00 	move.l #65280,80(sp)
    1286:	0050 
    1288:	7002           	moveq #2,d0
    128a:	2f40 004c      	move.l d0,76(sp)
    128e:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    1294:	2c40           	movea.l d0,a6
    1296:	202f 0050      	move.l 80(sp),d0
    129a:	222f 004c      	move.l 76(sp),d1
    129e:	4eae ff3a      	jsr -198(a6)
    12a2:	2f40 0048      	move.l d0,72(sp)
    12a6:	202f 0048      	move.l 72(sp),d0
    12aa:	23c0 0001 ba88 	move.l d0,1ba88 <Bitplane1>
  if(Bitplane1 == 0) {
    12b0:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    12b6:	4a80           	tst.l d0
    12b8:	6658           	bne.s 1312 <Zoom_PrepareDisplay+0xae>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    12ba:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    12c0:	2c40           	movea.l d0,a6
    12c2:	4eae ffc4      	jsr -60(a6)
    12c6:	2f40 0044      	move.l d0,68(sp)
    12ca:	202f 0044      	move.l 68(sp),d0
    12ce:	2f40 0040      	move.l d0,64(sp)
    12d2:	2f7c 0001 74cd 	move.l #95437,60(sp)
    12d8:	003c 
    12da:	7026           	moveq #38,d0
    12dc:	2f40 0038      	move.l d0,56(sp)
    12e0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    12e6:	2c40           	movea.l d0,a6
    12e8:	222f 0040      	move.l 64(sp),d1
    12ec:	242f 003c      	move.l 60(sp),d2
    12f0:	262f 0038      	move.l 56(sp),d3
    12f4:	4eae ffd0      	jsr -48(a6)
    12f8:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    12fc:	7001           	moveq #1,d0
    12fe:	2f40 0030      	move.l d0,48(sp)
    1302:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    1308:	2c40           	movea.l d0,a6
    130a:	222f 0030      	move.l 48(sp),d1
    130e:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1312:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    1318:	23c0 0001 ba98 	move.l d0,1ba98 <DrawBuffer>
  DrawCopper = Copperlist1;
    131e:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    1324:	23c0 0001 baa0 	move.l d0,1baa0 <DrawCopper>
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    132a:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1330:	002c 
    1332:	7002           	moveq #2,d0
    1334:	2f40 0028      	move.l d0,40(sp)
    1338:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    133e:	2c40           	movea.l d0,a6
    1340:	202f 002c      	move.l 44(sp),d0
    1344:	222f 0028      	move.l 40(sp),d1
    1348:	4eae ff3a      	jsr -198(a6)
    134c:	2f40 0024      	move.l d0,36(sp)
    1350:	202f 0024      	move.l 36(sp),d0
    1354:	23c0 0001 ba8c 	move.l d0,1ba8c <Bitplane2>
  if(Bitplane2 == 0) {
    135a:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    1360:	4a80           	tst.l d0
    1362:	6658           	bne.s 13bc <Zoom_PrepareDisplay+0x158>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1364:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    136a:	2c40           	movea.l d0,a6
    136c:	4eae ffc4      	jsr -60(a6)
    1370:	2f40 0020      	move.l d0,32(sp)
    1374:	202f 0020      	move.l 32(sp),d0
    1378:	2f40 001c      	move.l d0,28(sp)
    137c:	2f7c 0001 74f4 	move.l #95476,24(sp)
    1382:	0018 
    1384:	7026           	moveq #38,d0
    1386:	2f40 0014      	move.l d0,20(sp)
    138a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    1390:	2c40           	movea.l d0,a6
    1392:	222f 001c      	move.l 28(sp),d1
    1396:	242f 0018      	move.l 24(sp),d2
    139a:	262f 0014      	move.l 20(sp),d3
    139e:	4eae ffd0      	jsr -48(a6)
    13a2:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    13a6:	7001           	moveq #1,d0
    13a8:	2f40 000c      	move.l d0,12(sp)
    13ac:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    13b2:	2c40           	movea.l d0,a6
    13b4:	222f 000c      	move.l 12(sp),d1
    13b8:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    13bc:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    13c2:	23c0 0001 ba9c 	move.l d0,1ba9c <ViewBuffer>
  ViewCopper = Copperlist2;
    13c8:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    13ce:	23c0 0001 baa4 	move.l d0,1baa4 <ViewCopper>
  return 0;
    13d4:	7000           	moveq #0,d0
}
    13d6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    13da:	4fef 0048      	lea 72(sp),sp
    13de:	4e75           	rts

000013e0 <Zoom_Init>:

void Zoom_Init() {
    13e0:	4fef fff4      	lea -12(sp),sp
    13e4:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    13e6:	7004           	moveq #4,d0
    13e8:	2f40 000c      	move.l d0,12(sp)
    13ec:	7002           	moveq #2,d0
    13ee:	2f40 0008      	move.l d0,8(sp)
    13f2:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    13f8:	2c40           	movea.l d0,a6
    13fa:	202f 000c      	move.l 12(sp),d0
    13fe:	222f 0008      	move.l 8(sp),d1
    1402:	4eae ff3a      	jsr -198(a6)
    1406:	2f40 0004      	move.l d0,4(sp)
    140a:	202f 0004      	move.l 4(sp),d0
    140e:	23c0 0001 bad4 	move.l d0,1bad4 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1414:	33fc 0010 0001 	move.w #16,1bad2 <ZoomHorizontal>
    141a:	bad2 
  Zoom_LevelOf102Zoom = 15;
    141c:	33fc 000f 0001 	move.w #15,1bace <Zoom_LevelOf102Zoom>
    1422:	bace 
}
    1424:	2c5f           	movea.l (sp)+,a6
    1426:	4fef 000c      	lea 12(sp),sp
    142a:	4e75           	rts

0000142c <ClbuildZoom>:


ULONG * ClbuildZoom() {
    142c:	4fef ffac      	lea -84(sp),sp
    1430:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1434:	2f7c 0000 031c 	move.l #796,68(sp)
    143a:	0044 
    143c:	7002           	moveq #2,d0
    143e:	2f40 0040      	move.l d0,64(sp)
    1442:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    1448:	2c40           	movea.l d0,a6
    144a:	202f 0044      	move.l 68(sp),d0
    144e:	222f 0040      	move.l 64(sp),d1
    1452:	4eae ff3a      	jsr -198(a6)
    1456:	2f40 003c      	move.l d0,60(sp)
    145a:	202f 003c      	move.l 60(sp),d0
    145e:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    1462:	4aaf 0038      	tst.l 56(sp)
    1466:	6658           	bne.s 14c0 <ClbuildZoom+0x94>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1468:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    146e:	2c40           	movea.l d0,a6
    1470:	4eae ffc4      	jsr -60(a6)
    1474:	2f40 0034      	move.l d0,52(sp)
    1478:	202f 0034      	move.l 52(sp),d0
    147c:	2f40 0030      	move.l d0,48(sp)
    1480:	2f7c 0001 751b 	move.l #95515,44(sp)
    1486:	002c 
    1488:	7228           	moveq #40,d1
    148a:	2f41 0028      	move.l d1,40(sp)
    148e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    1494:	2c40           	movea.l d0,a6
    1496:	222f 0030      	move.l 48(sp),d1
    149a:	242f 002c      	move.l 44(sp),d2
    149e:	262f 0028      	move.l 40(sp),d3
    14a2:	4eae ffd0      	jsr -48(a6)
    14a6:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    14aa:	7401           	moveq #1,d2
    14ac:	2f42 0020      	move.l d2,32(sp)
    14b0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    14b6:	2c40           	movea.l d0,a6
    14b8:	222f 0020      	move.l 32(sp),d1
    14bc:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    14c0:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    14c6:	2f7c 0001 a328 	move.l #107304,88(sp)
    14cc:	0058 
  for(int i=0; i<16;i++)
    14ce:	42af 0054      	clr.l 84(sp)
    14d2:	6024           	bra.s 14f8 <ClbuildZoom+0xcc>
    *cl++ = *clpartinstruction++;
    14d4:	222f 0058      	move.l 88(sp),d1
    14d8:	2001           	move.l d1,d0
    14da:	5880           	addq.l #4,d0
    14dc:	2f40 0058      	move.l d0,88(sp)
    14e0:	202f 005c      	move.l 92(sp),d0
    14e4:	2400           	move.l d0,d2
    14e6:	5882           	addq.l #4,d2
    14e8:	2f42 005c      	move.l d2,92(sp)
    14ec:	2041           	movea.l d1,a0
    14ee:	2210           	move.l (a0),d1
    14f0:	2040           	movea.l d0,a0
    14f2:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    14f4:	52af 0054      	addq.l #1,84(sp)
    14f8:	700f           	moveq #15,d0
    14fa:	b0af 0054      	cmp.l 84(sp),d0
    14fe:	6cd4           	bge.s 14d4 <ClbuildZoom+0xa8>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1500:	2f7c 0001 a368 	move.l #107368,88(sp)
    1506:	0058 
  for(int i=0; i<12;i++)
    1508:	42af 0050      	clr.l 80(sp)
    150c:	6024           	bra.s 1532 <ClbuildZoom+0x106>
    *cl++ = *clpartinstruction++;
    150e:	222f 0058      	move.l 88(sp),d1
    1512:	2401           	move.l d1,d2
    1514:	5882           	addq.l #4,d2
    1516:	2f42 0058      	move.l d2,88(sp)
    151a:	202f 005c      	move.l 92(sp),d0
    151e:	2400           	move.l d0,d2
    1520:	5882           	addq.l #4,d2
    1522:	2f42 005c      	move.l d2,92(sp)
    1526:	2041           	movea.l d1,a0
    1528:	2210           	move.l (a0),d1
    152a:	2040           	movea.l d0,a0
    152c:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    152e:	52af 0050      	addq.l #1,80(sp)
    1532:	700b           	moveq #11,d0
    1534:	b0af 0050      	cmp.l 80(sp),d0
    1538:	6cd4           	bge.s 150e <ClbuildZoom+0xe2>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    153a:	202f 005c      	move.l 92(sp),d0
    153e:	2200           	move.l d0,d1
    1540:	5881           	addq.l #4,d1
    1542:	2f41 005c      	move.l d1,92(sp)
    1546:	2040           	movea.l d0,a0
    1548:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    154e:	202f 005c      	move.l 92(sp),d0
    1552:	2200           	move.l d0,d1
    1554:	5881           	addq.l #4,d1
    1556:	2f41 005c      	move.l d1,92(sp)
    155a:	2040           	movea.l d0,a0
    155c:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    1562:	202f 005c      	move.l 92(sp),d0
    1566:	2200           	move.l d0,d1
    1568:	5881           	addq.l #4,d1
    156a:	2f41 005c      	move.l d1,92(sp)
    156e:	2040           	movea.l d0,a0
    1570:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    1576:	202f 005c      	move.l 92(sp),d0
    157a:	2200           	move.l d0,d1
    157c:	5881           	addq.l #4,d1
    157e:	2f41 005c      	move.l d1,92(sp)
    1582:	2040           	movea.l d0,a0
    1584:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    158a:	202f 005c      	move.l 92(sp),d0
    158e:	2200           	move.l d0,d1
    1590:	5881           	addq.l #4,d1
    1592:	2f41 005c      	move.l d1,92(sp)
    1596:	2040           	movea.l d0,a0
    1598:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    159e:	202f 005c      	move.l 92(sp),d0
    15a2:	2200           	move.l d0,d1
    15a4:	5881           	addq.l #4,d1
    15a6:	2f41 005c      	move.l d1,92(sp)
    15aa:	2040           	movea.l d0,a0
    15ac:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    15b2:	202f 005c      	move.l 92(sp),d0
    15b6:	2200           	move.l d0,d1
    15b8:	5881           	addq.l #4,d1
    15ba:	2f41 005c      	move.l d1,92(sp)
    15be:	2040           	movea.l d0,a0
    15c0:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    15c6:	202f 005c      	move.l 92(sp),d0
    15ca:	2200           	move.l d0,d1
    15cc:	5881           	addq.l #4,d1
    15ce:	2f41 005c      	move.l d1,92(sp)
    15d2:	2040           	movea.l d0,a0
    15d4:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    15da:	202f 005c      	move.l 92(sp),d0
    15de:	2200           	move.l d0,d1
    15e0:	5881           	addq.l #4,d1
    15e2:	2f41 005c      	move.l d1,92(sp)
    15e6:	2040           	movea.l d0,a0
    15e8:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    15ee:	202f 005c      	move.l 92(sp),d0
    15f2:	2200           	move.l d0,d1
    15f4:	5881           	addq.l #4,d1
    15f6:	2f41 005c      	move.l d1,92(sp)
    15fa:	2040           	movea.l d0,a0
    15fc:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1602:	2f7c 0001 a2a8 	move.l #107176,88(sp)
    1608:	0058 
  for(int i=0; i<32;i++)
    160a:	42af 004c      	clr.l 76(sp)
    160e:	6024           	bra.s 1634 <ClbuildZoom+0x208>
    *cl++ = *clpartinstruction++;
    1610:	222f 0058      	move.l 88(sp),d1
    1614:	2001           	move.l d1,d0
    1616:	5880           	addq.l #4,d0
    1618:	2f40 0058      	move.l d0,88(sp)
    161c:	202f 005c      	move.l 92(sp),d0
    1620:	2400           	move.l d0,d2
    1622:	5882           	addq.l #4,d2
    1624:	2f42 005c      	move.l d2,92(sp)
    1628:	2041           	movea.l d1,a0
    162a:	2210           	move.l (a0),d1
    162c:	2040           	movea.l d0,a0
    162e:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    1630:	52af 004c      	addq.l #1,76(sp)
    1634:	701f           	moveq #31,d0
    1636:	b0af 004c      	cmp.l 76(sp),d0
    163a:	6cd4           	bge.s 1610 <ClbuildZoom+0x1e4>
  
  ULONG cop2 = cl+3;
    163c:	700c           	moveq #12,d0
    163e:	d0af 005c      	add.l 92(sp),d0
    1642:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1646:	202f 001c      	move.l 28(sp),d0
    164a:	4240           	clr.w d0
    164c:	4840           	swap d0
    164e:	2200           	move.l d0,d1
    1650:	0681 0084 0000 	addi.l #8650752,d1
    1656:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    165a:	202f 001c      	move.l 28(sp),d0
    165e:	0280 0000 ffff 	andi.l #65535,d0
    1664:	2400           	move.l d0,d2
    1666:	0682 0086 0000 	addi.l #8781824,d2
    166c:	2f42 0014      	move.l d2,20(sp)
  clpartinstruction = Cl102ZoomInit;
    1670:	2f7c 0001 a398 	move.l #107416,88(sp)
    1676:	0058 
  *cl++ = cop2lch;
    1678:	202f 005c      	move.l 92(sp),d0
    167c:	2200           	move.l d0,d1
    167e:	5881           	addq.l #4,d1
    1680:	2f41 005c      	move.l d1,92(sp)
    1684:	2040           	movea.l d0,a0
    1686:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    168a:	202f 005c      	move.l 92(sp),d0
    168e:	2200           	move.l d0,d1
    1690:	5881           	addq.l #4,d1
    1692:	2f41 005c      	move.l d1,92(sp)
    1696:	2040           	movea.l d0,a0
    1698:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    169c:	202f 005c      	move.l 92(sp),d0
    16a0:	2200           	move.l d0,d1
    16a2:	5881           	addq.l #4,d1
    16a4:	2f41 005c      	move.l d1,92(sp)
    16a8:	2040           	movea.l d0,a0
    16aa:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    16b0:	7078           	moveq #120,d0
    16b2:	d0af 001c      	add.l 28(sp),d0
    16b6:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    16ba:	222f 001c      	move.l 28(sp),d1
    16be:	0681 0000 0158 	addi.l #344,d1
    16c4:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    16c8:	2f7c 0001 a3a4 	move.l #107428,88(sp)
    16ce:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    16d0:	202f 0010      	move.l 16(sp),d0
    16d4:	4240           	clr.w d0
    16d6:	4840           	swap d0
    16d8:	307c 0070      	movea.w #112,a0
    16dc:	d1ef 0058      	adda.l 88(sp),a0
    16e0:	0680 0084 0000 	addi.l #8650752,d0
    16e6:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    16e8:	202f 0010      	move.l 16(sp),d0
    16ec:	0280 0000 ffff 	andi.l #65535,d0
    16f2:	307c 0074      	movea.w #116,a0
    16f6:	d1ef 0058      	adda.l 88(sp),a0
    16fa:	0680 0086 0000 	addi.l #8781824,d0
    1700:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1702:	202f 000c      	move.l 12(sp),d0
    1706:	4240           	clr.w d0
    1708:	4840           	swap d0
    170a:	206f 0058      	movea.l 88(sp),a0
    170e:	41e8 0150      	lea 336(a0),a0
    1712:	0680 0084 0000 	addi.l #8650752,d0
    1718:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    171a:	202f 000c      	move.l 12(sp),d0
    171e:	0280 0000 ffff 	andi.l #65535,d0
    1724:	206f 0058      	movea.l 88(sp),a0
    1728:	41e8 0154      	lea 340(a0),a0
    172c:	0680 0086 0000 	addi.l #8781824,d0
    1732:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1734:	42af 0048      	clr.l 72(sp)
    1738:	6024           	bra.s 175e <ClbuildZoom+0x332>
    *cl++ = *clpartinstruction++;
    173a:	222f 0058      	move.l 88(sp),d1
    173e:	2401           	move.l d1,d2
    1740:	5882           	addq.l #4,d2
    1742:	2f42 0058      	move.l d2,88(sp)
    1746:	202f 005c      	move.l 92(sp),d0
    174a:	2400           	move.l d0,d2
    174c:	5882           	addq.l #4,d2
    174e:	2f42 005c      	move.l d2,92(sp)
    1752:	2041           	movea.l d1,a0
    1754:	2210           	move.l (a0),d1
    1756:	2040           	movea.l d0,a0
    1758:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    175a:	52af 0048      	addq.l #1,72(sp)
    175e:	7071           	moveq #113,d0
    1760:	b0af 0048      	cmp.l 72(sp),d0
    1764:	6cd4           	bge.s 173a <ClbuildZoom+0x30e>

   *cl++ = 0xfffffffe;
    1766:	202f 005c      	move.l 92(sp),d0
    176a:	2200           	move.l d0,d1
    176c:	5881           	addq.l #4,d1
    176e:	2f41 005c      	move.l d1,92(sp)
    1772:	74fe           	moveq #-2,d2
    1774:	2040           	movea.l d0,a0
    1776:	2082           	move.l d2,(a0)

  return retval;
    1778:	202f 0038      	move.l 56(sp),d0
}
    177c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1780:	4fef 0054      	lea 84(sp),sp
    1784:	4e75           	rts

00001786 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    1786:	4fef ffb8      	lea -72(sp),sp
    178a:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    178e:	4eba fc9c      	jsr 142c <ClbuildZoom>(pc)
    1792:	23c0 0001 ba90 	move.l d0,1ba90 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    1798:	4eba fc92      	jsr 142c <ClbuildZoom>(pc)
    179c:	23c0 0001 ba94 	move.l d0,1ba94 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17a2:	2f7c 0000 ff00 	move.l #65280,80(sp)
    17a8:	0050 
    17aa:	7002           	moveq #2,d0
    17ac:	2f40 004c      	move.l d0,76(sp)
    17b0:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    17b6:	2c40           	movea.l d0,a6
    17b8:	202f 0050      	move.l 80(sp),d0
    17bc:	222f 004c      	move.l 76(sp),d1
    17c0:	4eae ff3a      	jsr -198(a6)
    17c4:	2f40 0048      	move.l d0,72(sp)
    17c8:	202f 0048      	move.l 72(sp),d0
    17cc:	23c0 0001 ba88 	move.l d0,1ba88 <Bitplane1>
  if(Bitplane1 == 0) {
    17d2:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    17d8:	4a80           	tst.l d0
    17da:	6658           	bne.s 1834 <PrepareDisplayZoom+0xae>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    17dc:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    17e2:	2c40           	movea.l d0,a6
    17e4:	4eae ffc4      	jsr -60(a6)
    17e8:	2f40 0044      	move.l d0,68(sp)
    17ec:	202f 0044      	move.l 68(sp),d0
    17f0:	2f40 0040      	move.l d0,64(sp)
    17f4:	2f7c 0001 74cd 	move.l #95437,60(sp)
    17fa:	003c 
    17fc:	7026           	moveq #38,d0
    17fe:	2f40 0038      	move.l d0,56(sp)
    1802:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    1808:	2c40           	movea.l d0,a6
    180a:	222f 0040      	move.l 64(sp),d1
    180e:	242f 003c      	move.l 60(sp),d2
    1812:	262f 0038      	move.l 56(sp),d3
    1816:	4eae ffd0      	jsr -48(a6)
    181a:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    181e:	7001           	moveq #1,d0
    1820:	2f40 0030      	move.l d0,48(sp)
    1824:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    182a:	2c40           	movea.l d0,a6
    182c:	222f 0030      	move.l 48(sp),d1
    1830:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1834:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    183a:	23c0 0001 ba98 	move.l d0,1ba98 <DrawBuffer>
  DrawCopper = Copperlist1;
    1840:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    1846:	23c0 0001 baa0 	move.l d0,1baa0 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    184c:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1852:	002c 
    1854:	7002           	moveq #2,d0
    1856:	2f40 0028      	move.l d0,40(sp)
    185a:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    1860:	2c40           	movea.l d0,a6
    1862:	202f 002c      	move.l 44(sp),d0
    1866:	222f 0028      	move.l 40(sp),d1
    186a:	4eae ff3a      	jsr -198(a6)
    186e:	2f40 0024      	move.l d0,36(sp)
    1872:	202f 0024      	move.l 36(sp),d0
    1876:	23c0 0001 ba8c 	move.l d0,1ba8c <Bitplane2>
  if(Bitplane2 == 0) {
    187c:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    1882:	4a80           	tst.l d0
    1884:	6658           	bne.s 18de <PrepareDisplayZoom+0x158>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1886:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    188c:	2c40           	movea.l d0,a6
    188e:	4eae ffc4      	jsr -60(a6)
    1892:	2f40 0020      	move.l d0,32(sp)
    1896:	202f 0020      	move.l 32(sp),d0
    189a:	2f40 001c      	move.l d0,28(sp)
    189e:	2f7c 0001 74f4 	move.l #95476,24(sp)
    18a4:	0018 
    18a6:	7026           	moveq #38,d0
    18a8:	2f40 0014      	move.l d0,20(sp)
    18ac:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    18b2:	2c40           	movea.l d0,a6
    18b4:	222f 001c      	move.l 28(sp),d1
    18b8:	242f 0018      	move.l 24(sp),d2
    18bc:	262f 0014      	move.l 20(sp),d3
    18c0:	4eae ffd0      	jsr -48(a6)
    18c4:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    18c8:	7001           	moveq #1,d0
    18ca:	2f40 000c      	move.l d0,12(sp)
    18ce:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    18d4:	2c40           	movea.l d0,a6
    18d6:	222f 000c      	move.l 12(sp),d1
    18da:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    18de:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    18e4:	23c0 0001 ba9c 	move.l d0,1ba9c <ViewBuffer>
  ViewCopper = Copperlist2;
    18ea:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    18f0:	23c0 0001 baa4 	move.l d0,1baa4 <ViewCopper>
  /*SwapCl();
  Zoom_SetBplPointers();
  SwapCl();
  Zoom_SetBplPointers();*/
  return 0;
    18f6:	7000           	moveq #0,d0
}
    18f8:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    18fc:	4fef 0048      	lea 72(sp),sp
    1900:	4e75           	rts

00001902 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1902:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1908:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    190e:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1914:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    191a:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1920:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1926:	2079 0001 baba 	movea.l 1baba <hw>,a0
    192c:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1932:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1938:	317c 002c 0066 	move.w #44,102(a0)
}
    193e:	4e75           	rts

00001940 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1940:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1946:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    194c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1952:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1958:	2079 0001 baba 	movea.l 1baba <hw>,a0
    195e:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1964:	2079 0001 baba 	movea.l 1baba <hw>,a0
    196a:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    1970:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1976:	317c 0028 0066 	move.w #40,102(a0)
}
    197c:	4e75           	rts

0000197e <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    197e:	4fef fff4      	lea -12(sp),sp
    1982:	206f 0010      	movea.l 16(sp),a0
    1986:	222f 0014      	move.l 20(sp),d1
    198a:	202f 0018      	move.l 24(sp),d0
    198e:	3048           	movea.w a0,a0
    1990:	3f48 0004      	move.w a0,4(sp)
    1994:	3201           	move.w d1,d1
    1996:	3f41 0002      	move.w d1,2(sp)
    199a:	3000           	move.w d0,d0
    199c:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    199e:	4279 0001 badc 	clr.w 1badc <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    19a4:	302f 0002      	move.w 2(sp),d0
    19a8:	906f 0004      	sub.w 4(sp),d0
    19ac:	3200           	move.w d0,d1
    19ae:	5341           	subq.w #1,d1
    19b0:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    19b4:	3017           	move.w (sp),d0
    19b6:	720c           	moveq #12,d1
    19b8:	e368           	lsl.w d1,d0
    19ba:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    19be:	4a57           	tst.w (sp)
    19c0:	6610           	bne.s 19d2 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    19c2:	33fc 0001 0001 	move.w #1,1badc <ZoomBlit_Increment4SrcA>
    19c8:	badc 
    shifta = 15 << 12;
    19ca:	3f7c f000 000a 	move.w #-4096,10(sp)
    19d0:	600c           	bra.s 19de <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    19d2:	3017           	move.w (sp),d0
    19d4:	5340           	subq.w #1,d0
    19d6:	720c           	moveq #12,d1
    19d8:	e368           	lsl.w d1,d0
    19da:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    19de:	4eba e700      	jsr e0 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    19e2:	2079 0001 baba 	movea.l 1baba <hw>,a0
    19e8:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    19ee:	2079 0001 baba 	movea.l 1baba <hw>,a0
    19f4:	302f 000a      	move.w 10(sp),d0
    19f8:	0640 0de4      	addi.w #3556,d0
    19fc:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a00:	7000           	moveq #0,d0
    1a02:	302f 0008      	move.w 8(sp),d0
    1a06:	7210           	moveq #16,d1
    1a08:	9280           	sub.l d0,d1
    1a0a:	7000           	moveq #0,d0
    1a0c:	4640           	not.w d0
    1a0e:	e3a8           	lsl.l d1,d0
    1a10:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1a16:	2000           	move.l d0,d0
    1a18:	3140 0070      	move.w d0,112(a0)
}
    1a1c:	4fef 000c      	lea 12(sp),sp
    1a20:	4e75           	rts

00001a22 <Init_Copy>:

void Init_Copy( WORD shift) {
    1a22:	598f           	subq.l #4,sp
    1a24:	202f 0008      	move.l 8(sp),d0
    1a28:	3000           	move.w d0,d0
    1a2a:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a2c:	3017           	move.w (sp),d0
    1a2e:	720c           	moveq #12,d1
    1a30:	e368           	lsl.w d1,d0
    1a32:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1a36:	4eba e6a8      	jsr e0 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1a3a:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1a40:	302f 0002      	move.w 2(sp),d0
    1a44:	0640 09f0      	addi.w #2544,d0
    1a48:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1a4c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1a52:	317c 0000 0042 	move.w #0,66(a0)
}
    1a58:	588f           	addq.l #4,sp
    1a5a:	4e75           	rts

00001a5c <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1a5c:	4fef ffcc      	lea -52(sp),sp
    1a60:	222f 0040      	move.l 64(sp),d1
    1a64:	202f 0044      	move.l 68(sp),d0
    1a68:	3201           	move.w d1,d1
    1a6a:	3f41 0002      	move.w d1,2(sp)
    1a6e:	3000           	move.w d0,d0
    1a70:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1a72:	4eba e66c      	jsr e0 <WaitBlt>(pc)
  Init_Blit();
    1a76:	4eba fe8a      	jsr 1902 <Init_Blit>(pc)
  WORD shiftright = 9;
    1a7a:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1a80:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1a86:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1a8c:	322f 0002      	move.w 2(sp),d1
    1a90:	3001           	move.w d1,d0
    1a92:	d040           	add.w d0,d0
    1a94:	d040           	add.w d0,d0
    1a96:	d041           	add.w d1,d0
    1a98:	d040           	add.w d0,d0
    1a9a:	0640 014c      	addi.w #332,d0
    1a9e:	3f40 002c      	move.w d0,44(sp)
    1aa2:	601a           	bra.s 1abe <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1aa4:	302f 002c      	move.w 44(sp),d0
    1aa8:	906f 0002      	sub.w 2(sp),d0
    1aac:	0640 ffed      	addi.w #-19,d0
    1ab0:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1ab4:	302f 0032      	move.w 50(sp),d0
    1ab8:	5340           	subq.w #1,d0
    1aba:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1abe:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1ac4:	6ede           	bgt.s 1aa4 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1ac6:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1aca:	322f 0002      	move.w 2(sp),d1
    1ace:	3001           	move.w d1,d0
    1ad0:	d040           	add.w d0,d0
    1ad2:	d040           	add.w d0,d0
    1ad4:	d041           	add.w d1,d0
    1ad6:	4440           	neg.w d0
    1ad8:	0640 0012      	addi.w #18,d0
    1adc:	3f40 0028      	move.w d0,40(sp)
    1ae0:	601c           	bra.s 1afe <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1ae2:	302f 0028      	move.w 40(sp),d0
    1ae6:	d06f 0002      	add.w 2(sp),d0
    1aea:	0640 0013      	addi.w #19,d0
    1aee:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1af2:	302f 0030      	move.w 48(sp),d0
    1af6:	3200           	move.w d0,d1
    1af8:	5341           	subq.w #1,d1
    1afa:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1afe:	4a6f 0028      	tst.w 40(sp)
    1b02:	6dde           	blt.s 1ae2 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b04:	42af 0024      	clr.l 36(sp)
    1b08:	6000 02dc      	bra.w 1de6 <Zoom_ZoomIntoPicture+0x38a>

    ZoomHorizontal = ZoomHorizontalStart;
    1b0c:	33ef 0028 0001 	move.w 40(sp),1bad2 <ZoomHorizontal>
    1b12:	bad2 

    WORD linesleft = 272;
    1b14:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b1a:	7000           	moveq #0,d0
    1b1c:	302f 0030      	move.w 48(sp),d0
    1b20:	7200           	moveq #0,d1
    1b22:	3217           	move.w (sp),d1
    1b24:	2f01           	move.l d1,-(sp)
    1b26:	2f00           	move.l d0,-(sp)
    1b28:	4eb9 0000 7194 	jsr 7194 <__mulsi3>
    1b2e:	508f           	addq.l #8,sp
    1b30:	2200           	move.l d0,d1
    1b32:	2001           	move.l d1,d0
    1b34:	d080           	add.l d0,d0
    1b36:	d081           	add.l d1,d0
    1b38:	e788           	lsl.l #3,d0
    1b3a:	2200           	move.l d0,d1
    1b3c:	202f 0024      	move.l 36(sp),d0
    1b40:	2041           	movea.l d1,a0
    1b42:	91c0           	suba.l d0,a0
    1b44:	41e8 0016      	lea 22(a0),a0
    1b48:	2008           	move.l a0,d0
    1b4a:	d088           	add.l a0,d0
    1b4c:	222f 0038      	move.l 56(sp),d1
    1b50:	d280           	add.l d0,d1
    1b52:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1b56:	222f 0024      	move.l 36(sp),d1
    1b5a:	7000           	moveq #0,d0
    1b5c:	9081           	sub.l d1,d0
    1b5e:	d080           	add.l d0,d0
    1b60:	2040           	movea.l d0,a0
    1b62:	41e8 002c      	lea 44(a0),a0
    1b66:	202f 003c      	move.l 60(sp),d0
    1b6a:	d088           	add.l a0,d0
    1b6c:	2f40 001a      	move.l d0,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1b70:	3217           	move.w (sp),d1
    1b72:	3001           	move.w d1,d0
    1b74:	d040           	add.w d0,d0
    1b76:	d041           	add.w d1,d0
    1b78:	e748           	lsl.w #3,d0
    1b7a:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1b7e:	7000           	moveq #0,d0
    1b80:	302f 002e      	move.w 46(sp),d0
    1b84:	306f 002c      	movea.w 44(sp),a0
    1b88:	b1c0           	cmpa.l d0,a0
    1b8a:	6e00 010a      	bgt.w 1c96 <Zoom_ZoomIntoPicture+0x23a>
      Init_Copy( shiftright);
    1b8e:	306f 0032      	movea.w 50(sp),a0
    1b92:	2f08           	move.l a0,-(sp)
    1b94:	4eba fe8c      	jsr 1a22 <Init_Copy>(pc)
    1b98:	588f           	addq.l #4,sp
    1b9a:	6000 00ee      	bra.w 1c8a <Zoom_ZoomIntoPicture+0x22e>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1b9e:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1ba4:	b06f 0022      	cmp.w 34(sp),d0
    1ba8:	6c16           	bge.s 1bc0 <Zoom_ZoomIntoPicture+0x164>
          linesleft -= ZoomHorizontal;
    1baa:	322f 0022      	move.w 34(sp),d1
    1bae:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1bb4:	3041           	movea.w d1,a0
    1bb6:	90c0           	suba.w d0,a0
    1bb8:	3008           	move.w a0,d0
    1bba:	3f40 0022      	move.w d0,34(sp)
    1bbe:	600c           	bra.s 1bcc <Zoom_ZoomIntoPicture+0x170>
        } else {
          ZoomHorizontal = linesleft;
    1bc0:	33ef 0022 0001 	move.w 34(sp),1bad2 <ZoomHorizontal>
    1bc6:	bad2 
          linesleft = 0;
    1bc8:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1bcc:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1bd2:	322f 0018      	move.w 24(sp),d1
    1bd6:	c3c0           	muls.w d0,d1
    1bd8:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1bdc:	4a6f 0022      	tst.w 34(sp)
    1be0:	6f4c           	ble.s 1c2e <Zoom_ZoomIntoPicture+0x1d2>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1be2:	7200           	moveq #0,d1
    1be4:	322f 0016      	move.w 22(sp),d1
    1be8:	7000           	moveq #0,d0
    1bea:	302f 002a      	move.w 42(sp),d0
    1bee:	d081           	add.l d1,d0
    1bf0:	d080           	add.l d0,d0
    1bf2:	222f 001e      	move.l 30(sp),d1
    1bf6:	d280           	add.l d0,d1
    1bf8:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1bfc:	7000           	moveq #0,d0
    1bfe:	302f 0016      	move.w 22(sp),d0
    1c02:	d080           	add.l d0,d0
    1c04:	222f 001a      	move.l 26(sp),d1
    1c08:	d280           	add.l d0,d1
    1c0a:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c0e:	7000           	moveq #0,d0
    1c10:	3017           	move.w (sp),d0
    1c12:	2f00           	move.l d0,-(sp)
    1c14:	2f2f 0012      	move.l 18(sp),-(sp)
    1c18:	2f2f 001a      	move.l 26(sp),-(sp)
    1c1c:	4eba f2ea      	jsr f08 <Zoom_CopyWord>(pc)
    1c20:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c24:	302f 0022      	move.w 34(sp),d0
    1c28:	5340           	subq.w #1,d0
    1c2a:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c2e:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1c34:	c1d7           	muls.w (sp),d0
    1c36:	7200           	moveq #0,d1
    1c38:	3200           	move.w d0,d1
    1c3a:	7000           	moveq #0,d0
    1c3c:	302f 002a      	move.w 42(sp),d0
    1c40:	d080           	add.l d0,d0
    1c42:	d0af 001e      	add.l 30(sp),d0
    1c46:	2f01           	move.l d1,-(sp)
    1c48:	2f2f 001e      	move.l 30(sp),-(sp)
    1c4c:	2f00           	move.l d0,-(sp)
    1c4e:	4eba f2b8      	jsr f08 <Zoom_CopyWord>(pc)
    1c52:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1c56:	7000           	moveq #0,d0
    1c58:	302f 0016      	move.w 22(sp),d0
    1c5c:	d080           	add.l d0,d0
    1c5e:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1c62:	7200           	moveq #0,d1
    1c64:	322f 0016      	move.w 22(sp),d1
    1c68:	7000           	moveq #0,d0
    1c6a:	302f 0018      	move.w 24(sp),d0
    1c6e:	d081           	add.l d1,d0
    1c70:	d080           	add.l d0,d0
    1c72:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1c76:	302f 0002      	move.w 2(sp),d0
    1c7a:	d040           	add.w d0,d0
    1c7c:	906f 0002      	sub.w 2(sp),d0
    1c80:	0640 0012      	addi.w #18,d0
    1c84:	33c0 0001 bad2 	move.w d0,1bad2 <ZoomHorizontal>
      while(linesleft > 0) {
    1c8a:	4a6f 0022      	tst.w 34(sp)
    1c8e:	6e00 ff0e      	bgt.w 1b9e <Zoom_ZoomIntoPicture+0x142>
    1c92:	6000 0148      	bra.w 1ddc <Zoom_ZoomIntoPicture+0x380>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1c96:	326f 0032      	movea.w 50(sp),a1
    1c9a:	306f 002c      	movea.w 44(sp),a0
    1c9e:	7000           	moveq #0,d0
    1ca0:	302f 002e      	move.w 46(sp),d0
    1ca4:	2f09           	move.l a1,-(sp)
    1ca6:	2f08           	move.l a0,-(sp)
    1ca8:	2f00           	move.l d0,-(sp)
    1caa:	4eba fcd2      	jsr 197e <Init_ZoomBlit>(pc)
    1cae:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1cb2:	302f 002c      	move.w 44(sp),d0
    1cb6:	906f 0002      	sub.w 2(sp),d0
    1cba:	0640 ffed      	addi.w #-19,d0
    1cbe:	3f40 002c      	move.w d0,44(sp)
    1cc2:	6000 00ee      	bra.w 1db2 <Zoom_ZoomIntoPicture+0x356>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1cc6:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1ccc:	b06f 0022      	cmp.w 34(sp),d0
    1cd0:	6c16           	bge.s 1ce8 <Zoom_ZoomIntoPicture+0x28c>
          linesleft -= ZoomHorizontal;
    1cd2:	322f 0022      	move.w 34(sp),d1
    1cd6:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1cdc:	3041           	movea.w d1,a0
    1cde:	90c0           	suba.w d0,a0
    1ce0:	3008           	move.w a0,d0
    1ce2:	3f40 0022      	move.w d0,34(sp)
    1ce6:	600c           	bra.s 1cf4 <Zoom_ZoomIntoPicture+0x298>
        } else {
          ZoomHorizontal = linesleft;
    1ce8:	33ef 0022 0001 	move.w 34(sp),1bad2 <ZoomHorizontal>
    1cee:	bad2 
          linesleft = 0;
    1cf0:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1cf4:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1cfa:	322f 0018      	move.w 24(sp),d1
    1cfe:	c3c0           	muls.w d0,d1
    1d00:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1d04:	4a6f 0022      	tst.w 34(sp)
    1d08:	6f4c           	ble.s 1d56 <Zoom_ZoomIntoPicture+0x2fa>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d0a:	7200           	moveq #0,d1
    1d0c:	322f 000c      	move.w 12(sp),d1
    1d10:	7000           	moveq #0,d0
    1d12:	302f 002a      	move.w 42(sp),d0
    1d16:	d081           	add.l d1,d0
    1d18:	d080           	add.l d0,d0
    1d1a:	222f 001e      	move.l 30(sp),d1
    1d1e:	d280           	add.l d0,d1
    1d20:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d24:	7000           	moveq #0,d0
    1d26:	302f 000c      	move.w 12(sp),d0
    1d2a:	d080           	add.l d0,d0
    1d2c:	222f 001a      	move.l 26(sp),d1
    1d30:	d280           	add.l d0,d1
    1d32:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1d36:	7000           	moveq #0,d0
    1d38:	3017           	move.w (sp),d0
    1d3a:	2f00           	move.l d0,-(sp)
    1d3c:	2f2f 0008      	move.l 8(sp),-(sp)
    1d40:	2f2f 0010      	move.l 16(sp),-(sp)
    1d44:	4eba f200      	jsr f46 <Zoom_ZoomBlit>(pc)
    1d48:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1d4c:	302f 0022      	move.w 34(sp),d0
    1d50:	5340           	subq.w #1,d0
    1d52:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1d56:	3039 0001 bad2 	move.w 1bad2 <ZoomHorizontal>,d0
    1d5c:	c1d7           	muls.w (sp),d0
    1d5e:	7200           	moveq #0,d1
    1d60:	3200           	move.w d0,d1
    1d62:	7000           	moveq #0,d0
    1d64:	302f 002a      	move.w 42(sp),d0
    1d68:	d080           	add.l d0,d0
    1d6a:	d0af 001e      	add.l 30(sp),d0
    1d6e:	2f01           	move.l d1,-(sp)
    1d70:	2f2f 001e      	move.l 30(sp),-(sp)
    1d74:	2f00           	move.l d0,-(sp)
    1d76:	4eba f1ce      	jsr f46 <Zoom_ZoomBlit>(pc)
    1d7a:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1d7e:	7000           	moveq #0,d0
    1d80:	302f 000c      	move.w 12(sp),d0
    1d84:	d080           	add.l d0,d0
    1d86:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1d8a:	7200           	moveq #0,d1
    1d8c:	322f 000c      	move.w 12(sp),d1
    1d90:	7000           	moveq #0,d0
    1d92:	302f 0018      	move.w 24(sp),d0
    1d96:	d081           	add.l d1,d0
    1d98:	d080           	add.l d0,d0
    1d9a:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1d9e:	302f 0002      	move.w 2(sp),d0
    1da2:	d040           	add.w d0,d0
    1da4:	906f 0002      	sub.w 2(sp),d0
    1da8:	0640 0012      	addi.w #18,d0
    1dac:	33c0 0001 bad2 	move.w d0,1bad2 <ZoomHorizontal>
      while( linesleft > 0) {
    1db2:	4a6f 0022      	tst.w 34(sp)
    1db6:	6e00 ff0e      	bgt.w 1cc6 <Zoom_ZoomIntoPicture+0x26a>
      }
      shiftright--;  
    1dba:	302f 0032      	move.w 50(sp),d0
    1dbe:	5340           	subq.w #1,d0
    1dc0:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1dc4:	4a6f 0032      	tst.w 50(sp)
    1dc8:	6c12           	bge.s 1ddc <Zoom_ZoomIntoPicture+0x380>
        shiftright += 16;
    1dca:	302f 0032      	move.w 50(sp),d0
    1dce:	0640 0010      	addi.w #16,d0
    1dd2:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1dd6:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1ddc:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1de2:	52af 0024      	addq.l #1,36(sp)
    1de6:	7015           	moveq #21,d0
    1de8:	b0af 0024      	cmp.l 36(sp),d0
    1dec:	6c00 fd1e      	bge.w 1b0c <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1df0:	4fef 0034      	lea 52(sp),sp
    1df4:	4e75           	rts

00001df6 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( ULONG *buffer, ULONG *copper) {
    1df6:	4fef fff0      	lea -16(sp),sp
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    1dfa:	3039 0001 bace 	move.w 1bace <Zoom_LevelOf102Zoom>,d0
    1e00:	e248           	lsr.w #1,d0
    1e02:	3000           	move.w d0,d0
    1e04:	0280 0000 ffff 	andi.l #65535,d0
    1e0a:	7208           	moveq #8,d1
    1e0c:	9280           	sub.l d0,d1
    1e0e:	2001           	move.l d1,d0
    1e10:	2200           	move.l d0,d1
    1e12:	2001           	move.l d1,d0
    1e14:	e988           	lsl.l #4,d0
    1e16:	9081           	sub.l d1,d0
    1e18:	e988           	lsl.l #4,d0
    1e1a:	5880           	addq.l #4,d0
    1e1c:	d0af 0014      	add.l 20(sp),d0
    1e20:	2f40 000c      	move.l d0,12(sp)
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1e24:	7072           	moveq #114,d0
    1e26:	d0af 0018      	add.l 24(sp),d0
    1e2a:	2f40 0008      	move.l d0,8(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e2e:	42af 0004      	clr.l 4(sp)
    1e32:	6030           	bra.s 1e64 <Zoom_SetBplPointers+0x6e>
    UWORD highword = (ULONG)plane2set >> 16;
    1e34:	202f 000c      	move.l 12(sp),d0
    1e38:	4240           	clr.w d0
    1e3a:	4840           	swap d0
    1e3c:	3f40 0002      	move.w d0,2(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1e40:	3eaf 000e      	move.w 14(sp),(sp)
    *posofcopper = highword;
    1e44:	206f 0008      	movea.l 8(sp),a0
    1e48:	30af 0002      	move.w 2(sp),(a0)
    posofcopper += 2;
    1e4c:	58af 0008      	addq.l #4,8(sp)
    *posofcopper = lowword;
    1e50:	206f 0008      	movea.l 8(sp),a0
    1e54:	3097           	move.w (sp),(a0)
    posofcopper += 2;
    1e56:	58af 0008      	addq.l #4,8(sp)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1e5a:	7230           	moveq #48,d1
    1e5c:	d3af 000c      	add.l d1,12(sp)
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e60:	52af 0004      	addq.l #1,4(sp)
    1e64:	7004           	moveq #4,d0
    1e66:	b0af 0004      	cmp.l 4(sp),d0
    1e6a:	6cc8           	bge.s 1e34 <Zoom_SetBplPointers+0x3e>
  }
  
}
    1e6c:	4fef 0010      	lea 16(sp),sp
    1e70:	4e75           	rts

00001e72 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers() {
    1e72:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawBuffer;
    1e74:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    1e7a:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
    1e7c:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
    1e82:	23c0 0001 ba98 	move.l d0,1ba98 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1e88:	2017           	move.l (sp),d0
    1e8a:	23c0 0001 ba9c 	move.l d0,1ba9c <ViewBuffer>
}
    1e90:	588f           	addq.l #4,sp
    1e92:	4e75           	rts

00001e94 <Zoom_ZoomIntoPicture2>:

void Zoom_ZoomIntoPicture2( UWORD *source1, UWORD *source2, UWORD *target, 
  UWORD levelofzoom, UWORD nrofplanes) {
    1e94:	4fef ffcc      	lea -52(sp),sp
    1e98:	2f02           	move.l d2,-(sp)
    1e9a:	222f 0048      	move.l 72(sp),d1
    1e9e:	202f 004c      	move.l 76(sp),d0
    1ea2:	3201           	move.w d1,d1
    1ea4:	3f41 0008      	move.w d1,8(sp)
    1ea8:	3000           	move.w d0,d0
    1eaa:	3f40 0006      	move.w d0,6(sp)

  
  UWORD posx4a = 320-7*(levelofzoom-1);
    1eae:	302f 0008      	move.w 8(sp),d0
    1eb2:	3200           	move.w d0,d1
    1eb4:	e748           	lsl.w #3,d0
    1eb6:	3401           	move.w d1,d2
    1eb8:	9440           	sub.w d0,d2
    1eba:	3002           	move.w d2,d0
    1ebc:	3040           	movea.w d0,a0
    1ebe:	41e8 0147      	lea 327(a0),a0
    1ec2:	3f48 0036      	move.w a0,54(sp)
  UWORD posx4b = 640-14*( levelofzoom-1);
    1ec6:	322f 0008      	move.w 8(sp),d1
    1eca:	3001           	move.w d1,d0
    1ecc:	e749           	lsl.w #3,d1
    1ece:	9041           	sub.w d1,d0
    1ed0:	d040           	add.w d0,d0
    1ed2:	3200           	move.w d0,d1
    1ed4:	0641 028e      	addi.w #654,d1
    1ed8:	3f41 0034      	move.w d1,52(sp)
  UWORD ystart = 8*levelofzoom;
    1edc:	302f 0008      	move.w 8(sp),d0
    1ee0:	e748           	lsl.w #3,d0
    1ee2:	3f40 001c      	move.w d0,28(sp)
  target = target + 21;
    1ee6:	742a           	moveq #42,d2
    1ee8:	d5af 0044      	add.l d2,68(sp)
  ULONG pos4astart = ( ULONG)source1 + ystart * 40;
    1eec:	7200           	moveq #0,d1
    1eee:	322f 001c      	move.w 28(sp),d1
    1ef2:	2001           	move.l d1,d0
    1ef4:	d080           	add.l d0,d0
    1ef6:	d080           	add.l d0,d0
    1ef8:	d081           	add.l d1,d0
    1efa:	e788           	lsl.l #3,d0
    1efc:	2200           	move.l d0,d1
    1efe:	202f 003c      	move.l 60(sp),d0
    1f02:	2401           	move.l d1,d2
    1f04:	d480           	add.l d0,d2
    1f06:	2f42 0018      	move.l d2,24(sp)
  ULONG pos4bstart = ( ULONG)source2 + ystart * 80;
    1f0a:	7200           	moveq #0,d1
    1f0c:	322f 001c      	move.w 28(sp),d1
    1f10:	2001           	move.l d1,d0
    1f12:	d080           	add.l d0,d0
    1f14:	d080           	add.l d0,d0
    1f16:	d081           	add.l d1,d0
    1f18:	e988           	lsl.l #4,d0
    1f1a:	2200           	move.l d0,d1
    1f1c:	202f 0040      	move.l 64(sp),d0
    1f20:	2401           	move.l d1,d2
    1f22:	d480           	add.l d0,d2
    1f24:	2f42 0014      	move.l d2,20(sp)
  UWORD *zl4word = Zoom_Zl4Words + 21 * (levelofzoom) - 1;
    1f28:	2079 0001 baf8 	movea.l 1baf8 <Zoom_Zl4Words>,a0
    1f2e:	7200           	moveq #0,d1
    1f30:	322f 0008      	move.w 8(sp),d1
    1f34:	2001           	move.l d1,d0
    1f36:	d080           	add.l d0,d0
    1f38:	d081           	add.l d1,d0
    1f3a:	2200           	move.l d0,d1
    1f3c:	e789           	lsl.l #3,d1
    1f3e:	9280           	sub.l d0,d1
    1f40:	2001           	move.l d1,d0
    1f42:	d081           	add.l d1,d0
    1f44:	2200           	move.l d0,d1
    1f46:	2001           	move.l d1,d0
    1f48:	5580           	subq.l #2,d0
    1f4a:	d1c0           	adda.l d0,a0
    1f4c:	2f48 0030      	move.l a0,48(sp)
  WaitBlt();
    1f50:	4eba e18e      	jsr e0 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    1f54:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1f5a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1f60:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1f66:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = ZMLINESIZE2 - 2;
    1f6c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    1f72:	317c 002a 0066 	move.w #42,102(a0)
  for(int i=1;i<=21;i++) {
    1f78:	7001           	moveq #1,d0
    1f7a:	2f40 002c      	move.l d0,44(sp)
    1f7e:	6000 0202      	bra.w 2182 <Zoom_ZoomIntoPicture2+0x2ee>
    UWORD *targetpos = target - i;
    1f82:	202f 002c      	move.l 44(sp),d0
    1f86:	d080           	add.l d0,d0
    1f88:	4480           	neg.l d0
    1f8a:	222f 0044      	move.l 68(sp),d1
    1f8e:	d280           	add.l d0,d1
    1f90:	2f41 0028      	move.l d1,40(sp)
    UWORD nrofpixels = 16 - *zl4word;
    1f94:	206f 0030      	movea.l 48(sp),a0
    1f98:	3010           	move.w (a0),d0
    1f9a:	7410           	moveq #16,d2
    1f9c:	9440           	sub.w d0,d2
    1f9e:	3f42 0012      	move.w d2,18(sp)
    posx4a -= nrofpixels;
    1fa2:	302f 0012      	move.w 18(sp),d0
    1fa6:	916f 0036      	sub.w d0,54(sp)
    posx4b -= nrofpixels*2;
    1faa:	302f 0012      	move.w 18(sp),d0
    1fae:	d040           	add.w d0,d0
    1fb0:	916f 0034      	sub.w d0,52(sp)
    ULONG pos4a = pos4astart + ( ( posx4a - 1) >> 4) * 2;
    1fb4:	7000           	moveq #0,d0
    1fb6:	302f 0036      	move.w 54(sp),d0
    1fba:	5380           	subq.l #1,d0
    1fbc:	e880           	asr.l #4,d0
    1fbe:	d080           	add.l d0,d0
    1fc0:	222f 0018      	move.l 24(sp),d1
    1fc4:	d280           	add.l d0,d1
    1fc6:	2f41 0024      	move.l d1,36(sp)
    ULONG pos4b = pos4bstart + ( ( posx4b - 1) >> 4) * 2;
    1fca:	7000           	moveq #0,d0
    1fcc:	302f 0034      	move.w 52(sp),d0
    1fd0:	5380           	subq.l #1,d0
    1fd2:	e880           	asr.l #4,d0
    1fd4:	d080           	add.l d0,d0
    1fd6:	242f 0014      	move.l 20(sp),d2
    1fda:	d480           	add.l d0,d2
    1fdc:	2f42 0020      	move.l d2,32(sp)
    //shift channel a = R of (17 + zl - pos)/16
    UWORD shifta = ( ( 16 + *zl4word - ( posx4a & 0xf)) & 0xf) << 12;
    1fe0:	206f 0030      	movea.l 48(sp),a0
    1fe4:	3010           	move.w (a0),d0
    1fe6:	906f 0036      	sub.w 54(sp),d0
    1fea:	3000           	move.w d0,d0
    1fec:	0280 0000 ffff 	andi.l #65535,d0
    1ff2:	720c           	moveq #12,d1
    1ff4:	e3a8           	lsl.l d1,d0
    1ff6:	3f40 0010      	move.w d0,16(sp)
    //shift channel b = R of (17 - pos)/16 
    UWORD shiftb = ( (16  - ( posx4b & 0xf)) & 0xf) << 12;
    1ffa:	7000           	moveq #0,d0
    1ffc:	302f 0034      	move.w 52(sp),d0
    2000:	4480           	neg.l d0
    2002:	740c           	moveq #12,d2
    2004:	e5a8           	lsl.l d2,d0
    2006:	3f40 000e      	move.w d0,14(sp)
    UWORD bltcon0 = 0xde4 + shifta;
    200a:	306f 0010      	movea.w 16(sp),a0
    200e:	41e8 0de4      	lea 3556(a0),a0
    2012:	3f48 000c      	move.w a0,12(sp)
    UWORD linesleft = 271;
    2016:	3f7c 010f 001e 	move.w #271,30(sp)
    UWORD lines2write;
    WaitBlt();
    201c:	4eba e0c2      	jsr e0 <WaitBlt>(pc)
    hw->bltcon1 = shiftb; 
    2020:	2079 0001 baba 	movea.l 1baba <hw>,a0
    2026:	316f 000e 0042 	move.w 14(sp),66(a0)
    hw->bltcon0 = bltcon0;
    202c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    2032:	316f 000c 0040 	move.w 12(sp),64(a0)
    hw->bltcdat = 0xffff >> (*zl4word--*2);
    2038:	202f 0030      	move.l 48(sp),d0
    203c:	2200           	move.l d0,d1
    203e:	5581           	subq.l #2,d1
    2040:	2f41 0030      	move.l d1,48(sp)
    2044:	2040           	movea.l d0,a0
    2046:	3010           	move.w (a0),d0
    2048:	3000           	move.w d0,d0
    204a:	0280 0000 ffff 	andi.l #65535,d0
    2050:	d080           	add.l d0,d0
    2052:	7200           	moveq #0,d1
    2054:	4641           	not.w d1
    2056:	2401           	move.l d1,d2
    2058:	e0a2           	asr.l d0,d2
    205a:	2002           	move.l d2,d0
    205c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    2062:	2000           	move.l d0,d0
    2064:	3140 0070      	move.w d0,112(a0)
    2068:	6000 010c      	bra.w 2176 <Zoom_ZoomIntoPicture2+0x2e2>
    while (linesleft > 0) {
      lines2write = 2*levelofzoom;
    206c:	302f 0008      	move.w 8(sp),d0
    2070:	d040           	add.w d0,d0
    2072:	3f40 000a      	move.w d0,10(sp)
      lines2write = linesleft > lines2write ? lines2write : linesleft;
    2076:	322f 000a      	move.w 10(sp),d1
    207a:	302f 001e      	move.w 30(sp),d0
    207e:	b240           	cmp.w d0,d1
    2080:	6402           	bcc.s 2084 <Zoom_ZoomIntoPicture2+0x1f0>
    2082:	3001           	move.w d1,d0
    2084:	3f40 000a      	move.w d0,10(sp)
      Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 36, 76);
    2088:	7000           	moveq #0,d0
    208a:	302f 000a      	move.w 10(sp),d0
    208e:	206f 0020      	movea.l 32(sp),a0
    2092:	222f 0024      	move.l 36(sp),d1
    2096:	4878 004c      	pea 4c <GetVBR+0x44>
    209a:	4878 0024      	pea 24 <GetVBR+0x1c>
    209e:	2f00           	move.l d0,-(sp)
    20a0:	2f2f 0034      	move.l 52(sp),-(sp)
    20a4:	2f08           	move.l a0,-(sp)
    20a6:	2f01           	move.l d1,-(sp)
    20a8:	4eba ef00      	jsr faa <Zoom_ZoomBlit2>(pc)
    20ac:	4fef 0018      	lea 24(sp),sp
      pos4a += 40 * lines2write;
    20b0:	7200           	moveq #0,d1
    20b2:	322f 000a      	move.w 10(sp),d1
    20b6:	2001           	move.l d1,d0
    20b8:	d080           	add.l d0,d0
    20ba:	d080           	add.l d0,d0
    20bc:	d081           	add.l d1,d0
    20be:	e788           	lsl.l #3,d0
    20c0:	d1af 0024      	add.l d0,36(sp)
      pos4b += 80 * lines2write;
    20c4:	7200           	moveq #0,d1
    20c6:	322f 000a      	move.w 10(sp),d1
    20ca:	2001           	move.l d1,d0
    20cc:	d080           	add.l d0,d0
    20ce:	d080           	add.l d0,d0
    20d0:	d081           	add.l d1,d0
    20d2:	e988           	lsl.l #4,d0
    20d4:	d1af 0020      	add.l d0,32(sp)
      targetpos += lines2write * ZMLINESIZE2/2;
    20d8:	7200           	moveq #0,d1
    20da:	322f 000a      	move.w 10(sp),d1
    20de:	2001           	move.l d1,d0
    20e0:	d080           	add.l d0,d0
    20e2:	d081           	add.l d1,d0
    20e4:	d080           	add.l d0,d0
    20e6:	d080           	add.l d0,d0
    20e8:	9081           	sub.l d1,d0
    20ea:	d080           	add.l d0,d0
    20ec:	d080           	add.l d0,d0
    20ee:	d1af 0028      	add.l d0,40(sp)
      linesleft -= lines2write;
    20f2:	302f 000a      	move.w 10(sp),d0
    20f6:	916f 001e      	sub.w d0,30(sp)
      if( linesleft == 0) break;
    20fa:	4a6f 001e      	tst.w 30(sp)
    20fe:	677e           	beq.s 217e <Zoom_ZoomIntoPicture2+0x2ea>
      lines2write = 16 - levelofzoom * 2;
    2100:	7000           	moveq #0,d0
    2102:	302f 0008      	move.w 8(sp),d0
    2106:	7208           	moveq #8,d1
    2108:	9280           	sub.l d0,d1
    210a:	2001           	move.l d1,d0
    210c:	2000           	move.l d0,d0
    210e:	d040           	add.w d0,d0
    2110:	3f40 000a      	move.w d0,10(sp)
      lines2write = linesleft > lines2write ? lines2write : linesleft;
    2114:	322f 000a      	move.w 10(sp),d1
    2118:	302f 001e      	move.w 30(sp),d0
    211c:	b240           	cmp.w d0,d1
    211e:	6402           	bcc.s 2122 <Zoom_ZoomIntoPicture2+0x28e>
    2120:	3001           	move.w d1,d0
    2122:	3f40 000a      	move.w d0,10(sp)
      if( lines2write > 0) {
    2126:	4a6f 000a      	tst.w 10(sp)
    212a:	674a           	beq.s 2176 <Zoom_ZoomIntoPicture2+0x2e2>
        Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 76, 156);
    212c:	7000           	moveq #0,d0
    212e:	302f 000a      	move.w 10(sp),d0
    2132:	206f 0020      	movea.l 32(sp),a0
    2136:	222f 0024      	move.l 36(sp),d1
    213a:	4878 009c      	pea 9c <WaitVbl+0x6>
    213e:	4878 004c      	pea 4c <GetVBR+0x44>
    2142:	2f00           	move.l d0,-(sp)
    2144:	2f2f 0034      	move.l 52(sp),-(sp)
    2148:	2f08           	move.l a0,-(sp)
    214a:	2f01           	move.l d1,-(sp)
    214c:	4eba ee5c      	jsr faa <Zoom_ZoomBlit2>(pc)
    2150:	4fef 0018      	lea 24(sp),sp
        targetpos += lines2write * ZMLINESIZE2/2;
    2154:	7200           	moveq #0,d1
    2156:	322f 000a      	move.w 10(sp),d1
    215a:	2001           	move.l d1,d0
    215c:	d080           	add.l d0,d0
    215e:	d081           	add.l d1,d0
    2160:	d080           	add.l d0,d0
    2162:	d080           	add.l d0,d0
    2164:	9081           	sub.l d1,d0
    2166:	d080           	add.l d0,d0
    2168:	d080           	add.l d0,d0
    216a:	d1af 0028      	add.l d0,40(sp)
        linesleft -= lines2write;
    216e:	342f 000a      	move.w 10(sp),d2
    2172:	956f 001e      	sub.w d2,30(sp)
    while (linesleft > 0) {
    2176:	4a6f 001e      	tst.w 30(sp)
    217a:	6600 fef0      	bne.w 206c <Zoom_ZoomIntoPicture2+0x1d8>
  for(int i=1;i<=21;i++) {
    217e:	52af 002c      	addq.l #1,44(sp)
    2182:	7015           	moveq #21,d0
    2184:	b0af 002c      	cmp.l 44(sp),d0
    2188:	6c00 fdf8      	bge.w 1f82 <Zoom_ZoomIntoPicture2+0xee>
      }
    }
  }
}
    218c:	241f           	move.l (sp)+,d2
    218e:	4fef 0034      	lea 52(sp),sp
    2192:	4e75           	rts

00002194 <SwScrollerTest>:

char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
    2194:	4fef ff98      	lea -104(sp),sp
    2198:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  PrepareDisplaySW();
    219c:	4eba 0218      	jsr 23b6 <PrepareDisplaySW>(pc)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    21a0:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    21a6:	4878 0010      	pea 10 <GetVBR+0x8>
    21aa:	4879 0001 a328 	pea 1a328 <ClsSprites>
    21b0:	42a7           	clr.l -(sp)
    21b2:	2f00           	move.l d0,-(sp)
    21b4:	4eba 088c      	jsr 2a42 <TestCopperlistBatch>(pc)
    21b8:	4fef 0010      	lea 16(sp),sp
    21bc:	4a80           	tst.l d0
    21be:	6642           	bne.s 2202 <SwScrollerTest+0x6e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    21c0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    21c6:	2c40           	movea.l d0,a6
    21c8:	4eae ffc4      	jsr -60(a6)
    21cc:	2f40 0070      	move.l d0,112(sp)
    21d0:	202f 0070      	move.l 112(sp),d0
    21d4:	2f40 006c      	move.l d0,108(sp)
    21d8:	2f7c 0001 7552 	move.l #95570,104(sp)
    21de:	0068 
    21e0:	702c           	moveq #44,d0
    21e2:	2f40 0064      	move.l d0,100(sp)
    21e6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    21ec:	2c40           	movea.l d0,a6
    21ee:	222f 006c      	move.l 108(sp),d1
    21f2:	242f 0068      	move.l 104(sp),d2
    21f6:	262f 0064      	move.l 100(sp),d3
    21fa:	4eae ffd0      	jsr -48(a6)
    21fe:	2f40 0060      	move.l d0,96(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2202:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2208:	4878 000c      	pea c <GetVBR+0x4>
    220c:	4879 0001 a368 	pea 1a368 <ClScreen>
    2212:	4878 0010      	pea 10 <GetVBR+0x8>
    2216:	2f00           	move.l d0,-(sp)
    2218:	4eba 0828      	jsr 2a42 <TestCopperlistBatch>(pc)
    221c:	4fef 0010      	lea 16(sp),sp
    2220:	4a80           	tst.l d0
    2222:	6642           	bne.s 2266 <SwScrollerTest+0xd2>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    2224:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    222a:	2c40           	movea.l d0,a6
    222c:	4eae ffc4      	jsr -60(a6)
    2230:	2f40 005c      	move.l d0,92(sp)
    2234:	202f 005c      	move.l 92(sp),d0
    2238:	2f40 0058      	move.l d0,88(sp)
    223c:	2f7c 0001 7588 	move.l #95624,84(sp)
    2242:	0054 
    2244:	7036           	moveq #54,d0
    2246:	2f40 0050      	move.l d0,80(sp)
    224a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2250:	2c40           	movea.l d0,a6
    2252:	222f 0058      	move.l 88(sp),d1
    2256:	242f 0054      	move.l 84(sp),d2
    225a:	262f 0050      	move.l 80(sp),d3
    225e:	4eae ffd0      	jsr -48(a6)
    2262:	2f40 004c      	move.l d0,76(sp)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2266:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    226c:	4878 0002      	pea 2 <_start+0x2>
    2270:	4879 0001 a2a8 	pea 1a2a8 <ClColor>
    2276:	4878 001e      	pea 1e <GetVBR+0x16>
    227a:	2f00           	move.l d0,-(sp)
    227c:	4eba 07c4      	jsr 2a42 <TestCopperlistBatch>(pc)
    2280:	4fef 0010      	lea 16(sp),sp
    2284:	4a80           	tst.l d0
    2286:	6642           	bne.s 22ca <SwScrollerTest+0x136>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2288:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    228e:	2c40           	movea.l d0,a6
    2290:	4eae ffc4      	jsr -60(a6)
    2294:	2f40 0048      	move.l d0,72(sp)
    2298:	202f 0048      	move.l 72(sp),d0
    229c:	2f40 0044      	move.l d0,68(sp)
    22a0:	2f7c 0001 75bf 	move.l #95679,64(sp)
    22a6:	0040 
    22a8:	7021           	moveq #33,d0
    22aa:	2f40 003c      	move.l d0,60(sp)
    22ae:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    22b4:	2c40           	movea.l d0,a6
    22b6:	222f 0044      	move.l 68(sp),d1
    22ba:	242f 0040      	move.l 64(sp),d2
    22be:	262f 003c      	move.l 60(sp),d3
    22c2:	4eae ffd0      	jsr -48(a6)
    22c6:	2f40 0038      	move.l d0,56(sp)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    22ca:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    22d0:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd3e2d>
    22d4:	4878 0020      	pea 20 <GetVBR+0x18>
    22d8:	2f00           	move.l d0,-(sp)
    22da:	4eba 07a4      	jsr 2a80 <TestCopperlistPos>(pc)
    22de:	4fef 000c      	lea 12(sp),sp
    22e2:	4a80           	tst.l d0
    22e4:	6642           	bne.s 2328 <SwScrollerTest+0x194>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    22e6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    22ec:	2c40           	movea.l d0,a6
    22ee:	4eae ffc4      	jsr -60(a6)
    22f2:	2f40 0034      	move.l d0,52(sp)
    22f6:	202f 0034      	move.l 52(sp),d0
    22fa:	2f40 0030      	move.l d0,48(sp)
    22fe:	2f7c 0001 75e1 	move.l #95713,44(sp)
    2304:	002c 
    2306:	7022           	moveq #34,d0
    2308:	2f40 0028      	move.l d0,40(sp)
    230c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2312:	2c40           	movea.l d0,a6
    2314:	222f 0030      	move.l 48(sp),d1
    2318:	242f 002c      	move.l 44(sp),d2
    231c:	262f 0028      	move.l 40(sp),d3
    2320:	4eae ffd0      	jsr -48(a6)
    2324:	2f40 0024      	move.l d0,36(sp)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    2328:	2239 0001 b518 	move.l 1b518 <sw_text>,d1
    232e:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    2334:	2f01           	move.l d1,-(sp)
    2336:	2f00           	move.l d0,-(sp)
    2338:	4879 0001 b51c 	pea 1b51c <sw_testfont>
    233e:	4eba 0388      	jsr 26c8 <WriteFont>(pc)
    2342:	4fef 000c      	lea 12(sp),sp

  UWORD *tstpointer = (UWORD *)DrawBuffer;
    2346:	2f79 0001 ba98 	move.l 1ba98 <DrawBuffer>,32(sp)
    234c:	0020 
  if( *tstpointer != 0xff00)
    234e:	206f 0020      	movea.l 32(sp),a0
    2352:	3010           	move.w (a0),d0
    2354:	0c40 ff00      	cmpi.w #-256,d0
    2358:	6742           	beq.s 239c <SwScrollerTest+0x208>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    235a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2360:	2c40           	movea.l d0,a6
    2362:	4eae ffc4      	jsr -60(a6)
    2366:	2f40 001c      	move.l d0,28(sp)
    236a:	202f 001c      	move.l 28(sp),d0
    236e:	2f40 0018      	move.l d0,24(sp)
    2372:	2f7c 0001 7604 	move.l #95748,20(sp)
    2378:	0014 
    237a:	7031           	moveq #49,d0
    237c:	2f40 0010      	move.l d0,16(sp)
    2380:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2386:	2c40           	movea.l d0,a6
    2388:	222f 0018      	move.l 24(sp),d1
    238c:	242f 0014      	move.l 20(sp),d2
    2390:	262f 0010      	move.l 16(sp),d3
    2394:	4eae ffd0      	jsr -48(a6)
    2398:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    239c:	2f3c 0000 c800 	move.l #51200,-(sp)
    23a2:	4878 0084      	pea 84 <SetInterruptHandler+0xa>
    23a6:	4eba dd66      	jsr 10e <FreeDisplay>(pc)
    23aa:	508f           	addq.l #8,sp
    23ac:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    23b0:	4fef 0068      	lea 104(sp),sp
    23b4:	4e75           	rts

000023b6 <PrepareDisplaySW>:
 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {
    23b6:	4fef ffb8      	lea -72(sp),sp
    23ba:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildSW();
    23be:	4eba 0182      	jsr 2542 <ClbuildSW>(pc)
    23c2:	23c0 0001 ba90 	move.l d0,1ba90 <Copperlist1>
  Copperlist2 = ClbuildSW();
    23c8:	4eba 0178      	jsr 2542 <ClbuildSW>(pc)
    23cc:	23c0 0001 ba94 	move.l d0,1ba94 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    23d2:	2f7c 0000 c800 	move.l #51200,80(sp)
    23d8:	0050 
    23da:	7002           	moveq #2,d0
    23dc:	2f40 004c      	move.l d0,76(sp)
    23e0:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    23e6:	2c40           	movea.l d0,a6
    23e8:	202f 0050      	move.l 80(sp),d0
    23ec:	222f 004c      	move.l 76(sp),d1
    23f0:	4eae ff3a      	jsr -198(a6)
    23f4:	2f40 0048      	move.l d0,72(sp)
    23f8:	202f 0048      	move.l 72(sp),d0
    23fc:	23c0 0001 ba88 	move.l d0,1ba88 <Bitplane1>
  if(Bitplane1 == 0) {
    2402:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    2408:	4a80           	tst.l d0
    240a:	6658           	bne.s 2464 <PrepareDisplaySW+0xae>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    240c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2412:	2c40           	movea.l d0,a6
    2414:	4eae ffc4      	jsr -60(a6)
    2418:	2f40 0044      	move.l d0,68(sp)
    241c:	202f 0044      	move.l 68(sp),d0
    2420:	2f40 0040      	move.l d0,64(sp)
    2424:	2f7c 0001 74cd 	move.l #95437,60(sp)
    242a:	003c 
    242c:	7026           	moveq #38,d0
    242e:	2f40 0038      	move.l d0,56(sp)
    2432:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2438:	2c40           	movea.l d0,a6
    243a:	222f 0040      	move.l 64(sp),d1
    243e:	242f 003c      	move.l 60(sp),d2
    2442:	262f 0038      	move.l 56(sp),d3
    2446:	4eae ffd0      	jsr -48(a6)
    244a:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    244e:	7001           	moveq #1,d0
    2450:	2f40 0030      	move.l d0,48(sp)
    2454:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    245a:	2c40           	movea.l d0,a6
    245c:	222f 0030      	move.l 48(sp),d1
    2460:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    2464:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    246a:	23c0 0001 ba98 	move.l d0,1ba98 <DrawBuffer>
  DrawCopper = Copperlist1;
    2470:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2476:	23c0 0001 baa0 	move.l d0,1baa0 <DrawCopper>
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    247c:	2f7c 0000 c800 	move.l #51200,44(sp)
    2482:	002c 
    2484:	7002           	moveq #2,d0
    2486:	2f40 0028      	move.l d0,40(sp)
    248a:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    2490:	2c40           	movea.l d0,a6
    2492:	202f 002c      	move.l 44(sp),d0
    2496:	222f 0028      	move.l 40(sp),d1
    249a:	4eae ff3a      	jsr -198(a6)
    249e:	2f40 0024      	move.l d0,36(sp)
    24a2:	202f 0024      	move.l 36(sp),d0
    24a6:	23c0 0001 ba8c 	move.l d0,1ba8c <Bitplane2>
  if(Bitplane2 == 0) {
    24ac:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    24b2:	4a80           	tst.l d0
    24b4:	6658           	bne.s 250e <PrepareDisplaySW+0x158>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    24b6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    24bc:	2c40           	movea.l d0,a6
    24be:	4eae ffc4      	jsr -60(a6)
    24c2:	2f40 0020      	move.l d0,32(sp)
    24c6:	202f 0020      	move.l 32(sp),d0
    24ca:	2f40 001c      	move.l d0,28(sp)
    24ce:	2f7c 0001 74f4 	move.l #95476,24(sp)
    24d4:	0018 
    24d6:	7026           	moveq #38,d0
    24d8:	2f40 0014      	move.l d0,20(sp)
    24dc:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    24e2:	2c40           	movea.l d0,a6
    24e4:	222f 001c      	move.l 28(sp),d1
    24e8:	242f 0018      	move.l 24(sp),d2
    24ec:	262f 0014      	move.l 20(sp),d3
    24f0:	4eae ffd0      	jsr -48(a6)
    24f4:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    24f8:	7001           	moveq #1,d0
    24fa:	2f40 000c      	move.l d0,12(sp)
    24fe:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2504:	2c40           	movea.l d0,a6
    2506:	222f 000c      	move.l 12(sp),d1
    250a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    250e:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    2514:	23c0 0001 ba9c 	move.l d0,1ba9c <ViewBuffer>
  ViewCopper = Copperlist2;
    251a:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    2520:	23c0 0001 baa4 	move.l d0,1baa4 <ViewCopper>
  SwapCl();
    2526:	4eba dd02      	jsr 22a <SwapCl>(pc)
  SetBplPointers();
    252a:	4eba dca0      	jsr 1cc <SetBplPointers>(pc)
  SwapCl();
    252e:	4eba dcfa      	jsr 22a <SwapCl>(pc)
  SetBplPointers();
    2532:	4eba dc98      	jsr 1cc <SetBplPointers>(pc)
  return 0;
    2536:	7000           	moveq #0,d0
}
    2538:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    253c:	4fef 0048      	lea 72(sp),sp
    2540:	4e75           	rts

00002542 <ClbuildSW>:

ULONG * ClbuildSW() {
    2542:	4fef ffc4      	lea -60(sp),sp
    2546:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    254a:	2f7c 0000 0084 	move.l #132,48(sp)
    2550:	0030 
    2552:	7002           	moveq #2,d0
    2554:	2f40 002c      	move.l d0,44(sp)
    2558:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    255e:	2c40           	movea.l d0,a6
    2560:	202f 0030      	move.l 48(sp),d0
    2564:	222f 002c      	move.l 44(sp),d1
    2568:	4eae ff3a      	jsr -198(a6)
    256c:	2f40 0028      	move.l d0,40(sp)
    2570:	202f 0028      	move.l 40(sp),d0
    2574:	2f40 0024      	move.l d0,36(sp)
  
  if( retval == 0) {
    2578:	4aaf 0024      	tst.l 36(sp)
    257c:	6658           	bne.s 25d6 <ClbuildSW+0x94>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    257e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2584:	2c40           	movea.l d0,a6
    2586:	4eae ffc4      	jsr -60(a6)
    258a:	2f40 0020      	move.l d0,32(sp)
    258e:	202f 0020      	move.l 32(sp),d0
    2592:	2f40 001c      	move.l d0,28(sp)
    2596:	2f7c 0001 751b 	move.l #95515,24(sp)
    259c:	0018 
    259e:	7228           	moveq #40,d1
    25a0:	2f41 0014      	move.l d1,20(sp)
    25a4:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    25aa:	2c40           	movea.l d0,a6
    25ac:	222f 001c      	move.l 28(sp),d1
    25b0:	242f 0018      	move.l 24(sp),d2
    25b4:	262f 0014      	move.l 20(sp),d3
    25b8:	4eae ffd0      	jsr -48(a6)
    25bc:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    25c0:	7401           	moveq #1,d2
    25c2:	2f42 000c      	move.l d2,12(sp)
    25c6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    25cc:	2c40           	movea.l d0,a6
    25ce:	222f 000c      	move.l 12(sp),d1
    25d2:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    25d6:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    25dc:	2f7c 0001 a328 	move.l #107304,64(sp)
    25e2:	0040 
  for(int i=0; i<16;i++)
    25e4:	42af 003c      	clr.l 60(sp)
    25e8:	6024           	bra.s 260e <ClbuildSW+0xcc>
    *cl++ = *clpartinstruction++;
    25ea:	222f 0040      	move.l 64(sp),d1
    25ee:	2001           	move.l d1,d0
    25f0:	5880           	addq.l #4,d0
    25f2:	2f40 0040      	move.l d0,64(sp)
    25f6:	202f 0044      	move.l 68(sp),d0
    25fa:	2400           	move.l d0,d2
    25fc:	5882           	addq.l #4,d2
    25fe:	2f42 0044      	move.l d2,68(sp)
    2602:	2041           	movea.l d1,a0
    2604:	2210           	move.l (a0),d1
    2606:	2040           	movea.l d0,a0
    2608:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    260a:	52af 003c      	addq.l #1,60(sp)
    260e:	700f           	moveq #15,d0
    2610:	b0af 003c      	cmp.l 60(sp),d0
    2614:	6cd4           	bge.s 25ea <ClbuildSW+0xa8>
  clpartinstruction = ClScreen;
    2616:	2f7c 0001 a368 	move.l #107368,64(sp)
    261c:	0040 
  for(int i=0; i<12;i++)
    261e:	42af 0038      	clr.l 56(sp)
    2622:	6024           	bra.s 2648 <ClbuildSW+0x106>
    *cl++ = *clpartinstruction++;
    2624:	222f 0040      	move.l 64(sp),d1
    2628:	2401           	move.l d1,d2
    262a:	5882           	addq.l #4,d2
    262c:	2f42 0040      	move.l d2,64(sp)
    2630:	202f 0044      	move.l 68(sp),d0
    2634:	2400           	move.l d0,d2
    2636:	5882           	addq.l #4,d2
    2638:	2f42 0044      	move.l d2,68(sp)
    263c:	2041           	movea.l d1,a0
    263e:	2210           	move.l (a0),d1
    2640:	2040           	movea.l d0,a0
    2642:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    2644:	52af 0038      	addq.l #1,56(sp)
    2648:	700b           	moveq #11,d0
    264a:	b0af 0038      	cmp.l 56(sp),d0
    264e:	6cd4           	bge.s 2624 <ClbuildSW+0xe2>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    2650:	202f 0044      	move.l 68(sp),d0
    2654:	2200           	move.l d0,d1
    2656:	5881           	addq.l #4,d1
    2658:	2f41 0044      	move.l d1,68(sp)
    265c:	2040           	movea.l d0,a0
    265e:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    2664:	202f 0044      	move.l 68(sp),d0
    2668:	2200           	move.l d0,d1
    266a:	5881           	addq.l #4,d1
    266c:	2f41 0044      	move.l d1,68(sp)
    2670:	2040           	movea.l d0,a0
    2672:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2678:	2f7c 0001 a2a8 	move.l #107176,64(sp)
    267e:	0040 
  for(int i=0; i<2;i++)
    2680:	42af 0034      	clr.l 52(sp)
    2684:	6024           	bra.s 26aa <ClbuildSW+0x168>
    *cl++ = *clpartinstruction++;
    2686:	222f 0040      	move.l 64(sp),d1
    268a:	2001           	move.l d1,d0
    268c:	5880           	addq.l #4,d0
    268e:	2f40 0040      	move.l d0,64(sp)
    2692:	202f 0044      	move.l 68(sp),d0
    2696:	2400           	move.l d0,d2
    2698:	5882           	addq.l #4,d2
    269a:	2f42 0044      	move.l d2,68(sp)
    269e:	2041           	movea.l d1,a0
    26a0:	2210           	move.l (a0),d1
    26a2:	2040           	movea.l d0,a0
    26a4:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    26a6:	52af 0034      	addq.l #1,52(sp)
    26aa:	7001           	moveq #1,d0
    26ac:	b0af 0034      	cmp.l 52(sp),d0
    26b0:	6cd4           	bge.s 2686 <ClbuildSW+0x144>

  *cl = 0xfffffffe;
    26b2:	206f 0044      	movea.l 68(sp),a0
    26b6:	72fe           	moveq #-2,d1
    26b8:	2081           	move.l d1,(a0)

  return retval;
    26ba:	202f 0024      	move.l 36(sp),d0
}
    26be:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    26c2:	4fef 003c      	lea 60(sp),sp
    26c6:	4e75           	rts

000026c8 <WriteFont>:

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    26c8:	4fef fff0      	lea -16(sp),sp
  UWORD *bmpptr = Destination;
    26cc:	2f6f 0018 000c 	move.l 24(sp),12(sp)
  UWORD *fntptr = font;
    26d2:	2f6f 0014 0008 	move.l 20(sp),8(sp)

  char charpos = *text;
    26d8:	206f 001c      	movea.l 28(sp),a0
    26dc:	1f50 0003      	move.b (a0),3(sp)
  charpos -= 0x20;
    26e0:	102f 0003      	move.b 3(sp),d0
    26e4:	0600 ffe0      	addi.b #-32,d0
    26e8:	1f40 0003      	move.b d0,3(sp)
  charpos = charpos<<3;
    26ec:	102f 0003      	move.b 3(sp),d0
    26f0:	4880           	ext.w d0
    26f2:	48c0           	ext.l d0
    26f4:	e788           	lsl.l #3,d0
    26f6:	1f40 0003      	move.b d0,3(sp)
  fntptr += charpos;
    26fa:	102f 0003      	move.b 3(sp),d0
    26fe:	4880           	ext.w d0
    2700:	3040           	movea.w d0,a0
    2702:	2008           	move.l a0,d0
    2704:	d088           	add.l a0,d0
    2706:	d1af 0008      	add.l d0,8(sp)
  for(int i=1;i<=8;i++) {
    270a:	7001           	moveq #1,d0
    270c:	2f40 0004      	move.l d0,4(sp)
    2710:	6020           	bra.s 2732 <WriteFont+0x6a>
    *bmpptr = *fntptr++;
    2712:	202f 0008      	move.l 8(sp),d0
    2716:	2200           	move.l d0,d1
    2718:	5481           	addq.l #2,d1
    271a:	2f41 0008      	move.l d1,8(sp)
    271e:	2040           	movea.l d0,a0
    2720:	3010           	move.w (a0),d0
    2722:	206f 000c      	movea.l 12(sp),a0
    2726:	3080           	move.w d0,(a0)
    bmpptr += 40;
    2728:	7050           	moveq #80,d0
    272a:	d1af 000c      	add.l d0,12(sp)
  for(int i=1;i<=8;i++) {
    272e:	52af 0004      	addq.l #1,4(sp)
    2732:	7208           	moveq #8,d1
    2734:	b2af 0004      	cmp.l 4(sp),d1
    2738:	6cd8           	bge.s 2712 <WriteFont+0x4a>
  }

}
    273a:	4fef 0010      	lea 16(sp),sp
    273e:	4e75           	rts

00002740 <ClBuild>:
#include "utils.h"




ULONG * ClBuild() {
    2740:	4fef ffc4      	lea -60(sp),sp
    2744:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    2748:	2f7c 0000 0084 	move.l #132,48(sp)
    274e:	0030 
    2750:	7002           	moveq #2,d0
    2752:	2f40 002c      	move.l d0,44(sp)
    2756:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    275c:	2c40           	movea.l d0,a6
    275e:	202f 0030      	move.l 48(sp),d0
    2762:	222f 002c      	move.l 44(sp),d1
    2766:	4eae ff3a      	jsr -198(a6)
    276a:	2f40 0028      	move.l d0,40(sp)
    276e:	202f 0028      	move.l 40(sp),d0
    2772:	2f40 0024      	move.l d0,36(sp)
  if( retval == 0) {
    2776:	4aaf 0024      	tst.l 36(sp)
    277a:	6658           	bne.s 27d4 <ClBuild+0x94>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    277c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2782:	2c40           	movea.l d0,a6
    2784:	4eae ffc4      	jsr -60(a6)
    2788:	2f40 0020      	move.l d0,32(sp)
    278c:	202f 0020      	move.l 32(sp),d0
    2790:	2f40 001c      	move.l d0,28(sp)
    2794:	2f7c 0001 751b 	move.l #95515,24(sp)
    279a:	0018 
    279c:	7228           	moveq #40,d1
    279e:	2f41 0014      	move.l d1,20(sp)
    27a2:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    27a8:	2c40           	movea.l d0,a6
    27aa:	222f 001c      	move.l 28(sp),d1
    27ae:	242f 0018      	move.l 24(sp),d2
    27b2:	262f 0014      	move.l 20(sp),d3
    27b6:	4eae ffd0      	jsr -48(a6)
    27ba:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    27be:	7401           	moveq #1,d2
    27c0:	2f42 000c      	move.l d2,12(sp)
    27c4:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    27ca:	2c40           	movea.l d0,a6
    27cc:	222f 000c      	move.l 12(sp),d1
    27d0:	4eae ff70      	jsr -144(a6)
  }
    
  ULONG *cl = retval;
    27d4:	2f6f 0024 0044 	move.l 36(sp),68(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    27da:	2f7c 0001 a328 	move.l #107304,64(sp)
    27e0:	0040 
  for(int i=0; i<16;i++)
    27e2:	42af 003c      	clr.l 60(sp)
    27e6:	6024           	bra.s 280c <ClBuild+0xcc>
    *cl++ = *clpartinstruction++;
    27e8:	222f 0040      	move.l 64(sp),d1
    27ec:	2001           	move.l d1,d0
    27ee:	5880           	addq.l #4,d0
    27f0:	2f40 0040      	move.l d0,64(sp)
    27f4:	202f 0044      	move.l 68(sp),d0
    27f8:	2400           	move.l d0,d2
    27fa:	5882           	addq.l #4,d2
    27fc:	2f42 0044      	move.l d2,68(sp)
    2800:	2041           	movea.l d1,a0
    2802:	2210           	move.l (a0),d1
    2804:	2040           	movea.l d0,a0
    2806:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    2808:	52af 003c      	addq.l #1,60(sp)
    280c:	700f           	moveq #15,d0
    280e:	b0af 003c      	cmp.l 60(sp),d0
    2812:	6cd4           	bge.s 27e8 <ClBuild+0xa8>
  clpartinstruction = ClScreen;
    2814:	2f7c 0001 a368 	move.l #107368,64(sp)
    281a:	0040 
  for(int i=0; i<12;i++)
    281c:	42af 0038      	clr.l 56(sp)
    2820:	6024           	bra.s 2846 <ClBuild+0x106>
    *cl++ = *clpartinstruction++;
    2822:	222f 0040      	move.l 64(sp),d1
    2826:	2401           	move.l d1,d2
    2828:	5882           	addq.l #4,d2
    282a:	2f42 0040      	move.l d2,64(sp)
    282e:	202f 0044      	move.l 68(sp),d0
    2832:	2400           	move.l d0,d2
    2834:	5882           	addq.l #4,d2
    2836:	2f42 0044      	move.l d2,68(sp)
    283a:	2041           	movea.l d1,a0
    283c:	2210           	move.l (a0),d1
    283e:	2040           	movea.l d0,a0
    2840:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    2842:	52af 0038      	addq.l #1,56(sp)
    2846:	700b           	moveq #11,d0
    2848:	b0af 0038      	cmp.l 56(sp),d0
    284c:	6cd4           	bge.s 2822 <ClBuild+0xe2>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    284e:	202f 0044      	move.l 68(sp),d0
    2852:	2200           	move.l d0,d1
    2854:	5881           	addq.l #4,d1
    2856:	2f41 0044      	move.l d1,68(sp)
    285a:	2040           	movea.l d0,a0
    285c:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    2862:	202f 0044      	move.l 68(sp),d0
    2866:	2200           	move.l d0,d1
    2868:	5881           	addq.l #4,d1
    286a:	2f41 0044      	move.l d1,68(sp)
    286e:	2040           	movea.l d0,a0
    2870:	20bc 00e2 0000 	move.l #14811136,(a0)

  clpartinstruction = ClColor;
    2876:	2f7c 0001 a2a8 	move.l #107176,64(sp)
    287c:	0040 
  for(int i=0; i<2;i++)
    287e:	42af 0034      	clr.l 52(sp)
    2882:	6024           	bra.s 28a8 <ClBuild+0x168>
    *cl++ = *clpartinstruction++;
    2884:	222f 0040      	move.l 64(sp),d1
    2888:	2001           	move.l d1,d0
    288a:	5880           	addq.l #4,d0
    288c:	2f40 0040      	move.l d0,64(sp)
    2890:	202f 0044      	move.l 68(sp),d0
    2894:	2400           	move.l d0,d2
    2896:	5882           	addq.l #4,d2
    2898:	2f42 0044      	move.l d2,68(sp)
    289c:	2041           	movea.l d1,a0
    289e:	2210           	move.l (a0),d1
    28a0:	2040           	movea.l d0,a0
    28a2:	2081           	move.l d1,(a0)
  for(int i=0; i<2;i++)
    28a4:	52af 0034      	addq.l #1,52(sp)
    28a8:	7001           	moveq #1,d0
    28aa:	b0af 0034      	cmp.l 52(sp),d0
    28ae:	6cd4           	bge.s 2884 <ClBuild+0x144>
  *cl = 0xfffffffe;
    28b0:	206f 0044      	movea.l 68(sp),a0
    28b4:	72fe           	moveq #-2,d1
    28b6:	2081           	move.l d1,(a0)

  return retval;
    28b8:	202f 0024      	move.l 36(sp),d0
}
    28bc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    28c0:	4fef 003c      	lea 60(sp),sp
    28c4:	4e75           	rts

000028c6 <PrepareDisplay>:

int PrepareDisplay() {
    28c6:	4fef ffb8      	lea -72(sp),sp
    28ca:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClBuild( );
    28ce:	4eba fe70      	jsr 2740 <ClBuild>(pc)
    28d2:	23c0 0001 ba90 	move.l d0,1ba90 <Copperlist1>
  Copperlist2 = ClBuild( );
    28d8:	4eba fe66      	jsr 2740 <ClBuild>(pc)
    28dc:	23c0 0001 ba94 	move.l d0,1ba94 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    28e2:	2f7c 0000 c800 	move.l #51200,80(sp)
    28e8:	0050 
    28ea:	7002           	moveq #2,d0
    28ec:	2f40 004c      	move.l d0,76(sp)
    28f0:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    28f6:	2c40           	movea.l d0,a6
    28f8:	202f 0050      	move.l 80(sp),d0
    28fc:	222f 004c      	move.l 76(sp),d1
    2900:	4eae ff3a      	jsr -198(a6)
    2904:	2f40 0048      	move.l d0,72(sp)
    2908:	202f 0048      	move.l 72(sp),d0
    290c:	23c0 0001 ba88 	move.l d0,1ba88 <Bitplane1>
  if(Bitplane1 == 0) {
    2912:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    2918:	4a80           	tst.l d0
    291a:	6658           	bne.s 2974 <PrepareDisplay+0xae>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    291c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2922:	2c40           	movea.l d0,a6
    2924:	4eae ffc4      	jsr -60(a6)
    2928:	2f40 0044      	move.l d0,68(sp)
    292c:	202f 0044      	move.l 68(sp),d0
    2930:	2f40 0040      	move.l d0,64(sp)
    2934:	2f7c 0001 74cd 	move.l #95437,60(sp)
    293a:	003c 
    293c:	7026           	moveq #38,d0
    293e:	2f40 0038      	move.l d0,56(sp)
    2942:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2948:	2c40           	movea.l d0,a6
    294a:	222f 0040      	move.l 64(sp),d1
    294e:	242f 003c      	move.l 60(sp),d2
    2952:	262f 0038      	move.l 56(sp),d3
    2956:	4eae ffd0      	jsr -48(a6)
    295a:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    295e:	7001           	moveq #1,d0
    2960:	2f40 0030      	move.l d0,48(sp)
    2964:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    296a:	2c40           	movea.l d0,a6
    296c:	222f 0030      	move.l 48(sp),d1
    2970:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane1;
    2974:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    297a:	23c0 0001 ba9c 	move.l d0,1ba9c <ViewBuffer>
  ViewCopper = Copperlist1;
    2980:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2986:	23c0 0001 baa4 	move.l d0,1baa4 <ViewCopper>
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    298c:	2f7c 0000 c800 	move.l #51200,44(sp)
    2992:	002c 
    2994:	7002           	moveq #2,d0
    2996:	2f40 0028      	move.l d0,40(sp)
    299a:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    29a0:	2c40           	movea.l d0,a6
    29a2:	202f 002c      	move.l 44(sp),d0
    29a6:	222f 0028      	move.l 40(sp),d1
    29aa:	4eae ff3a      	jsr -198(a6)
    29ae:	2f40 0024      	move.l d0,36(sp)
    29b2:	202f 0024      	move.l 36(sp),d0
    29b6:	23c0 0001 ba8c 	move.l d0,1ba8c <Bitplane2>
  if(Bitplane2 == 0) {
    29bc:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    29c2:	4a80           	tst.l d0
    29c4:	6658           	bne.s 2a1e <PrepareDisplay+0x158>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    29c6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    29cc:	2c40           	movea.l d0,a6
    29ce:	4eae ffc4      	jsr -60(a6)
    29d2:	2f40 0020      	move.l d0,32(sp)
    29d6:	202f 0020      	move.l 32(sp),d0
    29da:	2f40 001c      	move.l d0,28(sp)
    29de:	2f7c 0001 74f4 	move.l #95476,24(sp)
    29e4:	0018 
    29e6:	7026           	moveq #38,d0
    29e8:	2f40 0014      	move.l d0,20(sp)
    29ec:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    29f2:	2c40           	movea.l d0,a6
    29f4:	222f 001c      	move.l 28(sp),d1
    29f8:	242f 0018      	move.l 24(sp),d2
    29fc:	262f 0014      	move.l 20(sp),d3
    2a00:	4eae ffd0      	jsr -48(a6)
    2a04:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    2a08:	7001           	moveq #1,d0
    2a0a:	2f40 000c      	move.l d0,12(sp)
    2a0e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2a14:	2c40           	movea.l d0,a6
    2a16:	222f 000c      	move.l 12(sp),d1
    2a1a:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane2;
    2a1e:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    2a24:	23c0 0001 ba98 	move.l d0,1ba98 <DrawBuffer>
  DrawCopper = Copperlist2;
    2a2a:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    2a30:	23c0 0001 baa0 	move.l d0,1baa0 <DrawCopper>
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
    2a36:	7000           	moveq #0,d0
}
    2a38:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2a3c:	4fef 0048      	lea 72(sp),sp
    2a40:	4e75           	rts

00002a42 <TestCopperlistBatch>:

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
    2a42:	598f           	subq.l #4,sp
  for( int i=0;i<length;i++)
    2a44:	4297           	clr.l (sp)
    2a46:	602a           	bra.s 2a72 <TestCopperlistBatch+0x30>
    if( instructions[ pos+i] != batch[ i])
    2a48:	202f 000c      	move.l 12(sp),d0
    2a4c:	d097           	add.l (sp),d0
    2a4e:	d080           	add.l d0,d0
    2a50:	d080           	add.l d0,d0
    2a52:	206f 0008      	movea.l 8(sp),a0
    2a56:	d1c0           	adda.l d0,a0
    2a58:	2210           	move.l (a0),d1
    2a5a:	2017           	move.l (sp),d0
    2a5c:	d080           	add.l d0,d0
    2a5e:	d080           	add.l d0,d0
    2a60:	206f 0010      	movea.l 16(sp),a0
    2a64:	d1c0           	adda.l d0,a0
    2a66:	2010           	move.l (a0),d0
    2a68:	b081           	cmp.l d1,d0
    2a6a:	6704           	beq.s 2a70 <TestCopperlistBatch+0x2e>
      return 0;
    2a6c:	7000           	moveq #0,d0
    2a6e:	600c           	bra.s 2a7c <TestCopperlistBatch+0x3a>
  for( int i=0;i<length;i++)
    2a70:	5297           	addq.l #1,(sp)
    2a72:	2017           	move.l (sp),d0
    2a74:	b0af 0014      	cmp.l 20(sp),d0
    2a78:	6dce           	blt.s 2a48 <TestCopperlistBatch+0x6>
  return 1;
    2a7a:	7001           	moveq #1,d0
}
    2a7c:	588f           	addq.l #4,sp
    2a7e:	4e75           	rts

00002a80 <TestCopperlistPos>:

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    2a80:	202f 0008      	move.l 8(sp),d0
    2a84:	d080           	add.l d0,d0
    2a86:	d080           	add.l d0,d0
    2a88:	206f 0004      	movea.l 4(sp),a0
    2a8c:	d1c0           	adda.l d0,a0
    2a8e:	2010           	move.l (a0),d0
    2a90:	b0af 000c      	cmp.l 12(sp),d0
    2a94:	6604           	bne.s 2a9a <TestCopperlistPos+0x1a>
    return 1;
    2a96:	7001           	moveq #1,d0
    2a98:	6002           	bra.s 2a9c <TestCopperlistPos+0x1c>
  else 
    return 0;
    2a9a:	7000           	moveq #0,d0
}
    2a9c:	4e75           	rts

00002a9e <TestCopperList>:

void TestCopperList() {
    2a9e:	4fef feb8      	lea -328(sp),sp
    2aa2:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Write( Output(), "%d", hw->cop1lc);
    2aa6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2aac:	2c40           	movea.l d0,a6
    2aae:	4eae ffc4      	jsr -60(a6)
    2ab2:	2f40 0150      	move.l d0,336(sp)
    2ab6:	202f 0150      	move.l 336(sp),d0
    2aba:	2f40 014c      	move.l d0,332(sp)
    2abe:	2f7c 0001 7be7 	move.l #97255,328(sp)
    2ac4:	0148 
    2ac6:	2079 0001 baba 	movea.l 1baba <hw>,a0
    2acc:	2028 0080      	move.l 128(a0),d0
    2ad0:	2f40 0144      	move.l d0,324(sp)
    2ad4:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2ada:	2c40           	movea.l d0,a6
    2adc:	222f 014c      	move.l 332(sp),d1
    2ae0:	242f 0148      	move.l 328(sp),d2
    2ae4:	262f 0144      	move.l 324(sp),d3
    2ae8:	4eae ffd0      	jsr -48(a6)
    2aec:	2f40 0140      	move.l d0,320(sp)
  Copperlist1 = ClBuild();
    2af0:	4eba fc4e      	jsr 2740 <ClBuild>(pc)
    2af4:	23c0 0001 ba90 	move.l d0,1ba90 <Copperlist1>
  DrawCopper = Copperlist1;
    2afa:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2b00:	23c0 0001 baa0 	move.l d0,1baa0 <DrawCopper>
  Copperlist2 = ClBuild();
    2b06:	4eba fc38      	jsr 2740 <ClBuild>(pc)
    2b0a:	23c0 0001 ba94 	move.l d0,1ba94 <Copperlist2>
  ViewCopper = Copperlist2;
    2b10:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    2b16:	23c0 0001 baa4 	move.l d0,1baa4 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2b1c:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2b22:	4878 0010      	pea 10 <GetVBR+0x8>
    2b26:	4879 0001 a328 	pea 1a328 <ClsSprites>
    2b2c:	42a7           	clr.l -(sp)
    2b2e:	2f00           	move.l d0,-(sp)
    2b30:	4eba ff10      	jsr 2a42 <TestCopperlistBatch>(pc)
    2b34:	4fef 0010      	lea 16(sp),sp
    2b38:	4a80           	tst.l d0
    2b3a:	6642           	bne.s 2b7e <TestCopperList+0xe0>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2b3c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2b42:	2c40           	movea.l d0,a6
    2b44:	4eae ffc4      	jsr -60(a6)
    2b48:	2f40 013c      	move.l d0,316(sp)
    2b4c:	202f 013c      	move.l 316(sp),d0
    2b50:	2f40 0138      	move.l d0,312(sp)
    2b54:	2f7c 0001 7552 	move.l #95570,308(sp)
    2b5a:	0134 
    2b5c:	702c           	moveq #44,d0
    2b5e:	2f40 0130      	move.l d0,304(sp)
    2b62:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2b68:	2c40           	movea.l d0,a6
    2b6a:	222f 0138      	move.l 312(sp),d1
    2b6e:	242f 0134      	move.l 308(sp),d2
    2b72:	262f 0130      	move.l 304(sp),d3
    2b76:	4eae ffd0      	jsr -48(a6)
    2b7a:	2f40 012c      	move.l d0,300(sp)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2b7e:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2b84:	4878 000c      	pea c <GetVBR+0x4>
    2b88:	4879 0001 a368 	pea 1a368 <ClScreen>
    2b8e:	4878 0010      	pea 10 <GetVBR+0x8>
    2b92:	2f00           	move.l d0,-(sp)
    2b94:	4eba feac      	jsr 2a42 <TestCopperlistBatch>(pc)
    2b98:	4fef 0010      	lea 16(sp),sp
    2b9c:	4a80           	tst.l d0
    2b9e:	6642           	bne.s 2be2 <TestCopperList+0x144>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    2ba0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2ba6:	2c40           	movea.l d0,a6
    2ba8:	4eae ffc4      	jsr -60(a6)
    2bac:	2f40 0128      	move.l d0,296(sp)
    2bb0:	202f 0128      	move.l 296(sp),d0
    2bb4:	2f40 0124      	move.l d0,292(sp)
    2bb8:	2f7c 0001 7588 	move.l #95624,288(sp)
    2bbe:	0120 
    2bc0:	7036           	moveq #54,d0
    2bc2:	2f40 011c      	move.l d0,284(sp)
    2bc6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2bcc:	2c40           	movea.l d0,a6
    2bce:	222f 0124      	move.l 292(sp),d1
    2bd2:	242f 0120      	move.l 288(sp),d2
    2bd6:	262f 011c      	move.l 284(sp),d3
    2bda:	4eae ffd0      	jsr -48(a6)
    2bde:	2f40 0118      	move.l d0,280(sp)
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
    2be2:	23fc 0004 0000 	move.l #262144,1ba98 <DrawBuffer>
    2be8:	0001 ba98 
  ViewBuffer = (ULONG *)0x50000;
    2bec:	23fc 0005 0000 	move.l #327680,1ba9c <ViewBuffer>
    2bf2:	0001 ba9c 
  
  SetBplPointers();
    2bf6:	4eba d5d4      	jsr 1cc <SetBplPointers>(pc)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    2bfa:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    2c00:	0c80 0005 0000 	cmpi.l #327680,d0
    2c06:	660e           	bne.s 2c16 <TestCopperList+0x178>
    2c08:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
    2c0e:	0c80 0004 0000 	cmpi.l #262144,d0
    2c14:	6742           	beq.s 2c58 <TestCopperList+0x1ba>
    Write( Output(), 
    2c16:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2c1c:	2c40           	movea.l d0,a6
    2c1e:	4eae ffc4      	jsr -60(a6)
    2c22:	2f40 0114      	move.l d0,276(sp)
    2c26:	202f 0114      	move.l 276(sp),d0
    2c2a:	2f40 0110      	move.l d0,272(sp)
    2c2e:	2f7c 0001 7bea 	move.l #97258,268(sp)
    2c34:	010c 
    2c36:	703b           	moveq #59,d0
    2c38:	2f40 0108      	move.l d0,264(sp)
    2c3c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2c42:	2c40           	movea.l d0,a6
    2c44:	222f 0110      	move.l 272(sp),d1
    2c48:	242f 010c      	move.l 268(sp),d2
    2c4c:	262f 0108      	move.l 264(sp),d3
    2c50:	4eae ffd0      	jsr -48(a6)
    2c54:	2f40 0104      	move.l d0,260(sp)
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2c58:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2c5e:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    2c64:	4878 001c      	pea 1c <GetVBR+0x14>
    2c68:	2f00           	move.l d0,-(sp)
    2c6a:	4eba fe14      	jsr 2a80 <TestCopperlistPos>(pc)
    2c6e:	4fef 000c      	lea 12(sp),sp
    2c72:	4a80           	tst.l d0
    2c74:	6642           	bne.s 2cb8 <TestCopperList+0x21a>
    Write(Output(), 
    2c76:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2c7c:	2c40           	movea.l d0,a6
    2c7e:	4eae ffc4      	jsr -60(a6)
    2c82:	2f40 0100      	move.l d0,256(sp)
    2c86:	202f 0100      	move.l 256(sp),d0
    2c8a:	2f40 00fc      	move.l d0,252(sp)
    2c8e:	2f7c 0001 7c26 	move.l #97318,248(sp)
    2c94:	00f8 
    2c96:	703c           	moveq #60,d0
    2c98:	2f40 00f4      	move.l d0,244(sp)
    2c9c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2ca2:	2c40           	movea.l d0,a6
    2ca4:	222f 00fc      	move.l 252(sp),d1
    2ca8:	242f 00f8      	move.l 248(sp),d2
    2cac:	262f 00f4      	move.l 244(sp),d3
    2cb0:	4eae ffd0      	jsr -48(a6)
    2cb4:	2f40 00f0      	move.l d0,240(sp)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    2cb8:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2cbe:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    2cc4:	4878 001d      	pea 1d <GetVBR+0x15>
    2cc8:	2f00           	move.l d0,-(sp)
    2cca:	4eba fdb4      	jsr 2a80 <TestCopperlistPos>(pc)
    2cce:	4fef 000c      	lea 12(sp),sp
    2cd2:	4a80           	tst.l d0
    2cd4:	6642           	bne.s 2d18 <TestCopperList+0x27a>
    Write(Output(), 
    2cd6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2cdc:	2c40           	movea.l d0,a6
    2cde:	4eae ffc4      	jsr -60(a6)
    2ce2:	2f40 00ec      	move.l d0,236(sp)
    2ce6:	202f 00ec      	move.l 236(sp),d0
    2cea:	2f40 00e8      	move.l d0,232(sp)
    2cee:	2f7c 0001 7c63 	move.l #97379,228(sp)
    2cf4:	00e4 
    2cf6:	703c           	moveq #60,d0
    2cf8:	2f40 00e0      	move.l d0,224(sp)
    2cfc:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2d02:	2c40           	movea.l d0,a6
    2d04:	222f 00e8      	move.l 232(sp),d1
    2d08:	242f 00e4      	move.l 228(sp),d2
    2d0c:	262f 00e0      	move.l 224(sp),d3
    2d10:	4eae ffd0      	jsr -48(a6)
    2d14:	2f40 00dc      	move.l d0,220(sp)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2d18:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2d1e:	4878 0002      	pea 2 <_start+0x2>
    2d22:	4879 0001 a2a8 	pea 1a2a8 <ClColor>
    2d28:	4878 001e      	pea 1e <GetVBR+0x16>
    2d2c:	2f00           	move.l d0,-(sp)
    2d2e:	4eba fd12      	jsr 2a42 <TestCopperlistBatch>(pc)
    2d32:	4fef 0010      	lea 16(sp),sp
    2d36:	4a80           	tst.l d0
    2d38:	6642           	bne.s 2d7c <TestCopperList+0x2de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2d3a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2d40:	2c40           	movea.l d0,a6
    2d42:	4eae ffc4      	jsr -60(a6)
    2d46:	2f40 00d8      	move.l d0,216(sp)
    2d4a:	202f 00d8      	move.l 216(sp),d0
    2d4e:	2f40 00d4      	move.l d0,212(sp)
    2d52:	2f7c 0001 75bf 	move.l #95679,208(sp)
    2d58:	00d0 
    2d5a:	7021           	moveq #33,d0
    2d5c:	2f40 00cc      	move.l d0,204(sp)
    2d60:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2d66:	2c40           	movea.l d0,a6
    2d68:	222f 00d4      	move.l 212(sp),d1
    2d6c:	242f 00d0      	move.l 208(sp),d2
    2d70:	262f 00cc      	move.l 204(sp),d3
    2d74:	4eae ffd0      	jsr -48(a6)
    2d78:	2f40 00c8      	move.l d0,200(sp)

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2d7c:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2d82:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd3e2d>
    2d86:	4878 0020      	pea 20 <GetVBR+0x18>
    2d8a:	2f00           	move.l d0,-(sp)
    2d8c:	4eba fcf2      	jsr 2a80 <TestCopperlistPos>(pc)
    2d90:	4fef 000c      	lea 12(sp),sp
    2d94:	4a80           	tst.l d0
    2d96:	6642           	bne.s 2dda <TestCopperList+0x33c>
    Write(Output(), "Copperlist End not correctly set.\n", 34);
    2d98:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2d9e:	2c40           	movea.l d0,a6
    2da0:	4eae ffc4      	jsr -60(a6)
    2da4:	2f40 00c4      	move.l d0,196(sp)
    2da8:	202f 00c4      	move.l 196(sp),d0
    2dac:	2f40 00c0      	move.l d0,192(sp)
    2db0:	2f7c 0001 75e1 	move.l #95713,188(sp)
    2db6:	00bc 
    2db8:	7022           	moveq #34,d0
    2dba:	2f40 00b8      	move.l d0,184(sp)
    2dbe:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2dc4:	2c40           	movea.l d0,a6
    2dc6:	222f 00c0      	move.l 192(sp),d1
    2dca:	242f 00bc      	move.l 188(sp),d2
    2dce:	262f 00b8      	move.l 184(sp),d3
    2dd2:	4eae ffd0      	jsr -48(a6)
    2dd6:	2f40 00b4      	move.l d0,180(sp)
  
  SwapCl();
    2dda:	4eba d44e      	jsr 22a <SwapCl>(pc)
  
  if( DrawCopper != Copperlist2)
    2dde:	2239 0001 baa0 	move.l 1baa0 <DrawCopper>,d1
    2de4:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    2dea:	b081           	cmp.l d1,d0
    2dec:	6742           	beq.s 2e30 <TestCopperList+0x392>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
    2dee:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2df4:	2c40           	movea.l d0,a6
    2df6:	4eae ffc4      	jsr -60(a6)
    2dfa:	2f40 00b0      	move.l d0,176(sp)
    2dfe:	202f 00b0      	move.l 176(sp),d0
    2e02:	2f40 00ac      	move.l d0,172(sp)
    2e06:	2f7c 0001 7ca0 	move.l #97440,168(sp)
    2e0c:	00a8 
    2e0e:	7015           	moveq #21,d0
    2e10:	2f40 00a4      	move.l d0,164(sp)
    2e14:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2e1a:	2c40           	movea.l d0,a6
    2e1c:	222f 00ac      	move.l 172(sp),d1
    2e20:	242f 00a8      	move.l 168(sp),d2
    2e24:	262f 00a4      	move.l 164(sp),d3
    2e28:	4eae ffd0      	jsr -48(a6)
    2e2c:	2f40 00a0      	move.l d0,160(sp)

  
  PrepareDisplay();
    2e30:	4eba fa94      	jsr 28c6 <PrepareDisplay>(pc)
  if( DrawBuffer != Bitplane2) 
    2e34:	2239 0001 ba98 	move.l 1ba98 <DrawBuffer>,d1
    2e3a:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    2e40:	b081           	cmp.l d1,d0
    2e42:	6742           	beq.s 2e86 <TestCopperList+0x3e8>
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
    2e44:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2e4a:	2c40           	movea.l d0,a6
    2e4c:	4eae ffc4      	jsr -60(a6)
    2e50:	2f40 009c      	move.l d0,156(sp)
    2e54:	202f 009c      	move.l 156(sp),d0
    2e58:	2f40 0098      	move.l d0,152(sp)
    2e5c:	2f7c 0001 7cb6 	move.l #97462,148(sp)
    2e62:	0094 
    2e64:	7037           	moveq #55,d0
    2e66:	2f40 0090      	move.l d0,144(sp)
    2e6a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2e70:	2c40           	movea.l d0,a6
    2e72:	222f 0098      	move.l 152(sp),d1
    2e76:	242f 0094      	move.l 148(sp),d2
    2e7a:	262f 0090      	move.l 144(sp),d3
    2e7e:	4eae ffd0      	jsr -48(a6)
    2e82:	2f40 008c      	move.l d0,140(sp)
                                                                            55);
  if( DrawCopper != Copperlist2) 
    2e86:	2239 0001 baa0 	move.l 1baa0 <DrawCopper>,d1
    2e8c:	2039 0001 ba94 	move.l 1ba94 <Copperlist2>,d0
    2e92:	b081           	cmp.l d1,d0
    2e94:	6742           	beq.s 2ed8 <TestCopperList+0x43a>
    Write( Output(), 
    2e96:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2e9c:	2c40           	movea.l d0,a6
    2e9e:	4eae ffc4      	jsr -60(a6)
    2ea2:	2f40 0088      	move.l d0,136(sp)
    2ea6:	202f 0088      	move.l 136(sp),d0
    2eaa:	2f40 0084      	move.l d0,132(sp)
    2eae:	2f7c 0001 7cee 	move.l #97518,128(sp)
    2eb4:	0080 
    2eb6:	7039           	moveq #57,d0
    2eb8:	2f40 007c      	move.l d0,124(sp)
    2ebc:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2ec2:	2c40           	movea.l d0,a6
    2ec4:	222f 0084      	move.l 132(sp),d1
    2ec8:	242f 0080      	move.l 128(sp),d2
    2ecc:	262f 007c      	move.l 124(sp),d3
    2ed0:	4eae ffd0      	jsr -48(a6)
    2ed4:	2f40 0078      	move.l d0,120(sp)
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    2ed8:	2239 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d1
    2ede:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    2ee4:	b081           	cmp.l d1,d0
    2ee6:	6742           	beq.s 2f2a <TestCopperList+0x48c>
    Write( Output(), 
    2ee8:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2eee:	2c40           	movea.l d0,a6
    2ef0:	4eae ffc4      	jsr -60(a6)
    2ef4:	2f40 0074      	move.l d0,116(sp)
    2ef8:	202f 0074      	move.l 116(sp),d0
    2efc:	2f40 0070      	move.l d0,112(sp)
    2f00:	2f7c 0001 7d28 	move.l #97576,108(sp)
    2f06:	006c 
    2f08:	7038           	moveq #56,d0
    2f0a:	2f40 0068      	move.l d0,104(sp)
    2f0e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2f14:	2c40           	movea.l d0,a6
    2f16:	222f 0070      	move.l 112(sp),d1
    2f1a:	242f 006c      	move.l 108(sp),d2
    2f1e:	262f 0068      	move.l 104(sp),d3
    2f22:	4eae ffd0      	jsr -48(a6)
    2f26:	2f40 0064      	move.l d0,100(sp)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    2f2a:	2239 0001 baa4 	move.l 1baa4 <ViewCopper>,d1
    2f30:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    2f36:	b081           	cmp.l d1,d0
    2f38:	6742           	beq.s 2f7c <TestCopperList+0x4de>
    Write( Output(), 
    2f3a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2f40:	2c40           	movea.l d0,a6
    2f42:	4eae ffc4      	jsr -60(a6)
    2f46:	2f40 0060      	move.l d0,96(sp)
    2f4a:	202f 0060      	move.l 96(sp),d0
    2f4e:	2f40 005c      	move.l d0,92(sp)
    2f52:	2f7c 0001 7d61 	move.l #97633,88(sp)
    2f58:	0058 
    2f5a:	703a           	moveq #58,d0
    2f5c:	2f40 0054      	move.l d0,84(sp)
    2f60:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2f66:	2c40           	movea.l d0,a6
    2f68:	222f 005c      	move.l 92(sp),d1
    2f6c:	242f 0058      	move.l 88(sp),d2
    2f70:	262f 0054      	move.l 84(sp),d3
    2f74:	4eae ffd0      	jsr -48(a6)
    2f78:	2f40 0050      	move.l d0,80(sp)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
    2f7c:	4eba d24e      	jsr 1cc <SetBplPointers>(pc)
  SwapCl();
    2f80:	4eba d2a8      	jsr 22a <SwapCl>(pc)
  UWORD *copword = ViewCopper;
    2f84:	2f79 0001 baa4 	move.l 1baa4 <ViewCopper>,76(sp)
    2f8a:	004c 
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    2f8c:	307c 0076      	movea.w #118,a0
    2f90:	d1ef 004c      	adda.l 76(sp),a0
    2f94:	3010           	move.w (a0),d0
    2f96:	7200           	moveq #0,d1
    2f98:	3200           	move.w d0,d1
    2f9a:	307c 0072      	movea.w #114,a0
    2f9e:	d1ef 004c      	adda.l 76(sp),a0
    2fa2:	3010           	move.w (a0),d0
    2fa4:	3000           	move.w d0,d0
    2fa6:	0280 0000 ffff 	andi.l #65535,d0
    2fac:	4840           	swap d0
    2fae:	4240           	clr.w d0
    2fb0:	d081           	add.l d1,d0
    2fb2:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    2fb6:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    2fbc:	b0af 0048      	cmp.l 72(sp),d0
    2fc0:	6742           	beq.s 3004 <TestCopperList+0x566>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    2fc2:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2fc8:	2c40           	movea.l d0,a6
    2fca:	4eae ffc4      	jsr -60(a6)
    2fce:	2f40 0044      	move.l d0,68(sp)
    2fd2:	202f 0044      	move.l 68(sp),d0
    2fd6:	2f40 0040      	move.l d0,64(sp)
    2fda:	2f7c 0001 7d9c 	move.l #97692,60(sp)
    2fe0:	003c 
    2fe2:	7048           	moveq #72,d0
    2fe4:	2f40 0038      	move.l d0,56(sp)
    2fe8:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    2fee:	2c40           	movea.l d0,a6
    2ff0:	222f 0040      	move.l 64(sp),d1
    2ff4:	242f 003c      	move.l 60(sp),d2
    2ff8:	262f 0038      	move.l 56(sp),d3
    2ffc:	4eae ffd0      	jsr -48(a6)
    3000:	2f40 0034      	move.l d0,52(sp)
                                                   " after first frame.\n", 72);
  SetBplPointers();
    3004:	4eba d1c6      	jsr 1cc <SetBplPointers>(pc)
  SwapCl();
    3008:	4eba d220      	jsr 22a <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    300c:	2f79 0001 baa4 	move.l 1baa4 <ViewCopper>,76(sp)
    3012:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    3014:	307c 0076      	movea.w #118,a0
    3018:	d1ef 004c      	adda.l 76(sp),a0
    301c:	3010           	move.w (a0),d0
    301e:	7200           	moveq #0,d1
    3020:	3200           	move.w d0,d1
    3022:	307c 0072      	movea.w #114,a0
    3026:	d1ef 004c      	adda.l 76(sp),a0
    302a:	3010           	move.w (a0),d0
    302c:	3000           	move.w d0,d0
    302e:	0280 0000 ffff 	andi.l #65535,d0
    3034:	4840           	swap d0
    3036:	4240           	clr.w d0
    3038:	d081           	add.l d1,d0
    303a:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane1) 
    303e:	2039 0001 ba88 	move.l 1ba88 <Bitplane1>,d0
    3044:	b0af 0048      	cmp.l 72(sp),d0
    3048:	6742           	beq.s 308c <TestCopperList+0x5ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
    304a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3050:	2c40           	movea.l d0,a6
    3052:	4eae ffc4      	jsr -60(a6)
    3056:	2f40 0030      	move.l d0,48(sp)
    305a:	202f 0030      	move.l 48(sp),d0
    305e:	2f40 002c      	move.l d0,44(sp)
    3062:	2f7c 0001 7de5 	move.l #97765,40(sp)
    3068:	0028 
    306a:	7049           	moveq #73,d0
    306c:	2f40 0024      	move.l d0,36(sp)
    3070:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3076:	2c40           	movea.l d0,a6
    3078:	222f 002c      	move.l 44(sp),d1
    307c:	242f 0028      	move.l 40(sp),d2
    3080:	262f 0024      	move.l 36(sp),d3
    3084:	4eae ffd0      	jsr -48(a6)
    3088:	2f40 0020      	move.l d0,32(sp)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
    308c:	4eba d13e      	jsr 1cc <SetBplPointers>(pc)
  SwapCl();
    3090:	4eba d198      	jsr 22a <SwapCl>(pc)

  copword = (UWORD *) ViewCopper;
    3094:	2f79 0001 baa4 	move.l 1baa4 <ViewCopper>,76(sp)
    309a:	004c 
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
    309c:	307c 0076      	movea.w #118,a0
    30a0:	d1ef 004c      	adda.l 76(sp),a0
    30a4:	3010           	move.w (a0),d0
    30a6:	7200           	moveq #0,d1
    30a8:	3200           	move.w d0,d1
    30aa:	307c 0072      	movea.w #114,a0
    30ae:	d1ef 004c      	adda.l 76(sp),a0
    30b2:	3010           	move.w (a0),d0
    30b4:	3000           	move.w d0,d0
    30b6:	0280 0000 ffff 	andi.l #65535,d0
    30bc:	4840           	swap d0
    30be:	4240           	clr.w d0
    30c0:	d081           	add.l d1,d0
    30c2:	2f40 0048      	move.l d0,72(sp)
  if( pointer != (ULONG) Bitplane2) 
    30c6:	2039 0001 ba8c 	move.l 1ba8c <Bitplane2>,d0
    30cc:	b0af 0048      	cmp.l 72(sp),d0
    30d0:	6742           	beq.s 3114 <TestCopperList+0x676>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
    30d2:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    30d8:	2c40           	movea.l d0,a6
    30da:	4eae ffc4      	jsr -60(a6)
    30de:	2f40 001c      	move.l d0,28(sp)
    30e2:	202f 001c      	move.l 28(sp),d0
    30e6:	2f40 0018      	move.l d0,24(sp)
    30ea:	2f7c 0001 7e2f 	move.l #97839,20(sp)
    30f0:	0014 
    30f2:	7048           	moveq #72,d0
    30f4:	2f40 0010      	move.l d0,16(sp)
    30f8:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    30fe:	2c40           	movea.l d0,a6
    3100:	222f 0018      	move.l 24(sp),d1
    3104:	242f 0014      	move.l 20(sp),d2
    3108:	262f 0010      	move.l 16(sp),d3
    310c:	4eae ffd0      	jsr -48(a6)
    3110:	2f40 000c      	move.l d0,12(sp)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
    3114:	2f3c 0000 c800 	move.l #51200,-(sp)
    311a:	4878 0084      	pea 84 <SetInterruptHandler+0xa>
    311e:	4eba cfee      	jsr 10e <FreeDisplay>(pc)
    3122:	508f           	addq.l #8,sp
    3124:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3128:	4fef 0148      	lea 328(sp),sp
    312c:	4e75           	rts

0000312e <ZoomTest>:
#include "utilsasm.h"
#include <string.h>
#include "zoomtest2.h"

void ZoomTest() {
  TestZoomSpeed();
    312e:	4eba 001c      	jsr 314c <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    3132:	4eba 00ac      	jsr 31e0 <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    3136:	4eba 056e      	jsr 36a6 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    313a:	4eba 0800      	jsr 393c <TestCopyWord>(pc)
  TestZoom4Picture();
    313e:	4eba 0dea      	jsr 3f2a <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    3142:	4eba 0af2      	jsr 3c36 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    3146:	4eba d6b8      	jsr 800 <Test_Zoom2>(pc)
}
    314a:	4e75           	rts

0000314c <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    314c:	4fef ffe8      	lea -24(sp),sp
    3150:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    3154:	4eba d112      	jsr 268 <TakeSystem>(pc)
	WaitVbl();
    3158:	4eba cf3c      	jsr 96 <WaitVbl>(pc)
  //               fedcba9876543210
  hw->dmacon = 0b1000011111100000;
    315c:	2079 0001 baba 	movea.l 1baba <hw>,a0
    3162:	317c 87e0 0096 	move.w #-30752,150(a0)
  Zoom_InitRun(); 
    3168:	4eba ded2      	jsr 103c <Zoom_InitRun>(pc)

  int success = 1;
    316c:	7001           	moveq #1,d0
    316e:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    3172:	4eba d44e      	jsr 5c2 <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    3176:	3039 0001 bae2 	move.w 1bae2 <Zoom_Counter>,d0
    317c:	0c40 0008      	cmpi.w #8,d0
    3180:	6304           	bls.s 3186 <TestZoomSpeed+0x3a>
    3182:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    3186:	4eba e0a0      	jsr 1228 <Zoom_Dealloc>(pc)
  FreeSystem();
    318a:	4eba d1be      	jsr 34a <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    318e:	4aaf 0020      	tst.l 32(sp)
    3192:	6642           	bne.s 31d6 <TestZoomSpeed+0x8a>
    3194:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    319a:	2c40           	movea.l d0,a6
    319c:	4eae ffc4      	jsr -60(a6)
    31a0:	2f40 001c      	move.l d0,28(sp)
    31a4:	202f 001c      	move.l 28(sp),d0
    31a8:	2f40 0018      	move.l d0,24(sp)
    31ac:	2f7c 0001 7e78 	move.l #97912,20(sp)
    31b2:	0014 
    31b4:	701c           	moveq #28,d0
    31b6:	2f40 0010      	move.l d0,16(sp)
    31ba:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    31c0:	2c40           	movea.l d0,a6
    31c2:	222f 0018      	move.l 24(sp),d1
    31c6:	242f 0014      	move.l 20(sp),d2
    31ca:	262f 0010      	move.l 16(sp),d3
    31ce:	4eae ffd0      	jsr -48(a6)
    31d2:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    31d6:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    31da:	4fef 0018      	lea 24(sp),sp
    31de:	4e75           	rts

000031e0 <ZoomTestDisplay>:

void ZoomTestDisplay() {
    31e0:	4fef ff38      	lea -200(sp),sp
    31e4:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    31e8:	4eba e1f6      	jsr 13e0 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    31ec:	4eba e598      	jsr 1786 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    31f0:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    31f6:	4878 0010      	pea 10 <GetVBR+0x8>
    31fa:	4879 0001 a328 	pea 1a328 <ClsSprites>
    3200:	42a7           	clr.l -(sp)
    3202:	2f00           	move.l d0,-(sp)
    3204:	4eba f83c      	jsr 2a42 <TestCopperlistBatch>(pc)
    3208:	4fef 0010      	lea 16(sp),sp
    320c:	4a80           	tst.l d0
    320e:	6642           	bne.s 3252 <ZoomTestDisplay+0x72>
    Write( Output(), 
    3210:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3216:	2c40           	movea.l d0,a6
    3218:	4eae ffc4      	jsr -60(a6)
    321c:	2f40 00d0      	move.l d0,208(sp)
    3220:	202f 00d0      	move.l 208(sp),d0
    3224:	2f40 00cc      	move.l d0,204(sp)
    3228:	2f7c 0001 7e97 	move.l #97943,200(sp)
    322e:	00c8 
    3230:	7045           	moveq #69,d0
    3232:	2f40 00c4      	move.l d0,196(sp)
    3236:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    323c:	2c40           	movea.l d0,a6
    323e:	222f 00cc      	move.l 204(sp),d1
    3242:	242f 00c8      	move.l 200(sp),d2
    3246:	262f 00c4      	move.l 196(sp),d3
    324a:	4eae ffd0      	jsr -48(a6)
    324e:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    3252:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    3258:	4878 000c      	pea c <GetVBR+0x4>
    325c:	4879 0001 a368 	pea 1a368 <ClScreen>
    3262:	4878 0010      	pea 10 <GetVBR+0x8>
    3266:	2f00           	move.l d0,-(sp)
    3268:	4eba f7d8      	jsr 2a42 <TestCopperlistBatch>(pc)
    326c:	4fef 0010      	lea 16(sp),sp
    3270:	4a80           	tst.l d0
    3272:	6642           	bne.s 32b6 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    3274:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    327a:	2c40           	movea.l d0,a6
    327c:	4eae ffc4      	jsr -60(a6)
    3280:	2f40 00bc      	move.l d0,188(sp)
    3284:	202f 00bc      	move.l 188(sp),d0
    3288:	2f40 00b8      	move.l d0,184(sp)
    328c:	2f7c 0001 7edd 	move.l #98013,180(sp)
    3292:	00b4 
    3294:	7046           	moveq #70,d0
    3296:	2f40 00b0      	move.l d0,176(sp)
    329a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    32a0:	2c40           	movea.l d0,a6
    32a2:	222f 00b8      	move.l 184(sp),d1
    32a6:	242f 00b4      	move.l 180(sp),d2
    32aa:	262f 00b0      	move.l 176(sp),d3
    32ae:	4eae ffd0      	jsr -48(a6)
    32b2:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    32b6:	23fc 0004 0000 	move.l #262144,1ba98 <DrawBuffer>
    32bc:	0001 ba98 
  ViewBuffer = (ULONG *) 0x50000;
    32c0:	23fc 0005 0000 	move.l #327680,1ba9c <ViewBuffer>
    32c6:	0001 ba9c 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    32ca:	2239 0001 baa0 	move.l 1baa0 <DrawCopper>,d1
    32d0:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    32d6:	2f01           	move.l d1,-(sp)
    32d8:	2f00           	move.l d0,-(sp)
    32da:	4eba eb1a      	jsr 1df6 <Zoom_SetBplPointers>(pc)
    32de:	508f           	addq.l #8,sp
  Zoom_SwapBuffers();
    32e0:	4eba eb90      	jsr 1e72 <Zoom_SwapBuffers>(pc)
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    32e4:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    32ea:	0c80 0005 0000 	cmpi.l #327680,d0
    32f0:	660e           	bne.s 3300 <ZoomTestDisplay+0x120>
    32f2:	2039 0001 ba9c 	move.l 1ba9c <ViewBuffer>,d0
    32f8:	0c80 0004 0000 	cmpi.l #262144,d0
    32fe:	6742           	beq.s 3342 <ZoomTestDisplay+0x162>
    Write( Output(), 
    3300:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3306:	2c40           	movea.l d0,a6
    3308:	4eae ffc4      	jsr -60(a6)
    330c:	2f40 00a8      	move.l d0,168(sp)
    3310:	202f 00a8      	move.l 168(sp),d0
    3314:	2f40 00a4      	move.l d0,164(sp)
    3318:	2f7c 0001 7f24 	move.l #98084,160(sp)
    331e:	00a0 
    3320:	703b           	moveq #59,d0
    3322:	2f40 009c      	move.l d0,156(sp)
    3326:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    332c:	2c40           	movea.l d0,a6
    332e:	222f 00a4      	move.l 164(sp),d1
    3332:	242f 00a0      	move.l 160(sp),d2
    3336:	262f 009c      	move.l 156(sp),d3
    333a:	4eae ffd0      	jsr -48(a6)
    333e:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    3342:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    3348:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    334e:	4878 001c      	pea 1c <GetVBR+0x14>
    3352:	2f00           	move.l d0,-(sp)
    3354:	4eba f72a      	jsr 2a80 <TestCopperlistPos>(pc)
    3358:	4fef 000c      	lea 12(sp),sp
    335c:	4a80           	tst.l d0
    335e:	6642           	bne.s 33a2 <ZoomTestDisplay+0x1c2>
    Write(Output(), 
    3360:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3366:	2c40           	movea.l d0,a6
    3368:	4eae ffc4      	jsr -60(a6)
    336c:	2f40 0094      	move.l d0,148(sp)
    3370:	202f 0094      	move.l 148(sp),d0
    3374:	2f40 0090      	move.l d0,144(sp)
    3378:	2f7c 0001 7f60 	move.l #98144,140(sp)
    337e:	008c 
    3380:	703c           	moveq #60,d0
    3382:	2f40 0088      	move.l d0,136(sp)
    3386:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    338c:	2c40           	movea.l d0,a6
    338e:	222f 0090      	move.l 144(sp),d1
    3392:	242f 008c      	move.l 140(sp),d2
    3396:	262f 0088      	move.l 136(sp),d3
    339a:	4eae ffd0      	jsr -48(a6)
    339e:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    33a2:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    33a8:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    33ae:	4878 001d      	pea 1d <GetVBR+0x15>
    33b2:	2f00           	move.l d0,-(sp)
    33b4:	4eba f6ca      	jsr 2a80 <TestCopperlistPos>(pc)
    33b8:	4fef 000c      	lea 12(sp),sp
    33bc:	4a80           	tst.l d0
    33be:	6642           	bne.s 3402 <ZoomTestDisplay+0x222>
    Write(Output(), 
    33c0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    33c6:	2c40           	movea.l d0,a6
    33c8:	4eae ffc4      	jsr -60(a6)
    33cc:	2f40 0080      	move.l d0,128(sp)
    33d0:	202f 0080      	move.l 128(sp),d0
    33d4:	2f40 007c      	move.l d0,124(sp)
    33d8:	2f7c 0001 7f9d 	move.l #98205,120(sp)
    33de:	0078 
    33e0:	703c           	moveq #60,d0
    33e2:	2f40 0074      	move.l d0,116(sp)
    33e6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    33ec:	2c40           	movea.l d0,a6
    33ee:	222f 007c      	move.l 124(sp),d1
    33f2:	242f 0078      	move.l 120(sp),d2
    33f6:	262f 0074      	move.l 116(sp),d3
    33fa:	4eae ffd0      	jsr -48(a6)
    33fe:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    3402:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    3408:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    340e:	4878 001e      	pea 1e <GetVBR+0x16>
    3412:	2f00           	move.l d0,-(sp)
    3414:	4eba f66a      	jsr 2a80 <TestCopperlistPos>(pc)
    3418:	4fef 000c      	lea 12(sp),sp
    341c:	4a80           	tst.l d0
    341e:	6642           	bne.s 3462 <ZoomTestDisplay+0x282>
    Write(Output(), 
    3420:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3426:	2c40           	movea.l d0,a6
    3428:	4eae ffc4      	jsr -60(a6)
    342c:	2f40 006c      	move.l d0,108(sp)
    3430:	202f 006c      	move.l 108(sp),d0
    3434:	2f40 0068      	move.l d0,104(sp)
    3438:	2f7c 0001 7fda 	move.l #98266,100(sp)
    343e:	0064 
    3440:	703c           	moveq #60,d0
    3442:	2f40 0060      	move.l d0,96(sp)
    3446:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    344c:	2c40           	movea.l d0,a6
    344e:	222f 0068      	move.l 104(sp),d1
    3452:	242f 0064      	move.l 100(sp),d2
    3456:	262f 0060      	move.l 96(sp),d3
    345a:	4eae ffd0      	jsr -48(a6)
    345e:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    3462:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    3468:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    346e:	4878 001f      	pea 1f <GetVBR+0x17>
    3472:	2f00           	move.l d0,-(sp)
    3474:	4eba f60a      	jsr 2a80 <TestCopperlistPos>(pc)
    3478:	4fef 000c      	lea 12(sp),sp
    347c:	4a80           	tst.l d0
    347e:	6642           	bne.s 34c2 <ZoomTestDisplay+0x2e2>
    Write(Output(), 
    3480:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3486:	2c40           	movea.l d0,a6
    3488:	4eae ffc4      	jsr -60(a6)
    348c:	2f40 0058      	move.l d0,88(sp)
    3490:	202f 0058      	move.l 88(sp),d0
    3494:	2f40 0054      	move.l d0,84(sp)
    3498:	2f7c 0001 8017 	move.l #98327,80(sp)
    349e:	0050 
    34a0:	703c           	moveq #60,d0
    34a2:	2f40 004c      	move.l d0,76(sp)
    34a6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    34ac:	2c40           	movea.l d0,a6
    34ae:	222f 0054      	move.l 84(sp),d1
    34b2:	242f 0050      	move.l 80(sp),d2
    34b6:	262f 004c      	move.l 76(sp),d3
    34ba:	4eae ffd0      	jsr -48(a6)
    34be:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    34c2:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    34c8:	4878 0020      	pea 20 <GetVBR+0x18>
    34cc:	4879 0001 a2a8 	pea 1a2a8 <ClColor>
    34d2:	4878 0026      	pea 26 <GetVBR+0x1e>
    34d6:	2f00           	move.l d0,-(sp)
    34d8:	4eba f568      	jsr 2a42 <TestCopperlistBatch>(pc)
    34dc:	4fef 0010      	lea 16(sp),sp
    34e0:	4a80           	tst.l d0
    34e2:	6642           	bne.s 3526 <ZoomTestDisplay+0x346>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    34e4:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    34ea:	2c40           	movea.l d0,a6
    34ec:	4eae ffc4      	jsr -60(a6)
    34f0:	2f40 0044      	move.l d0,68(sp)
    34f4:	202f 0044      	move.l 68(sp),d0
    34f8:	2f40 0040      	move.l d0,64(sp)
    34fc:	2f7c 0001 8054 	move.l #98388,60(sp)
    3502:	003c 
    3504:	7025           	moveq #37,d0
    3506:	2f40 0038      	move.l d0,56(sp)
    350a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3510:	2c40           	movea.l d0,a6
    3512:	222f 0040      	move.l 64(sp),d1
    3516:	242f 003c      	move.l 60(sp),d2
    351a:	262f 0038      	move.l 56(sp),d3
    351e:	4eae ffd0      	jsr -48(a6)
    3522:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    3526:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    352c:	2f00           	move.l d0,-(sp)
    352e:	4878 000f      	pea f <GetVBR+0x7>
    3532:	4eba d234      	jsr 768 <Zoom_Shrink102>(pc)
    3536:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    3538:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    353e:	4879 0001 b540 	pea 1b540 <Cl102ZoomTest>
    3544:	4878 0049      	pea 49 <GetVBR+0x41>
    3548:	2f00           	move.l d0,-(sp)
    354a:	4eba 00c4      	jsr 3610 <TestCopperListZoom102>(pc)
    354e:	4fef 000c      	lea 12(sp),sp
    3552:	4a80           	tst.l d0
    3554:	6642           	bne.s 3598 <ZoomTestDisplay+0x3b8>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    3556:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    355c:	2c40           	movea.l d0,a6
    355e:	4eae ffc4      	jsr -60(a6)
    3562:	2f40 0030      	move.l d0,48(sp)
    3566:	202f 0030      	move.l 48(sp),d0
    356a:	2f40 002c      	move.l d0,44(sp)
    356e:	2f7c 0001 807a 	move.l #98426,40(sp)
    3574:	0028 
    3576:	7025           	moveq #37,d0
    3578:	2f40 0024      	move.l d0,36(sp)
    357c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3582:	2c40           	movea.l d0,a6
    3584:	222f 002c      	move.l 44(sp),d1
    3588:	242f 0028      	move.l 40(sp),d2
    358c:	262f 0024      	move.l 36(sp),d3
    3590:	4eae ffd0      	jsr -48(a6)
    3594:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    3598:	2039 0001 ba90 	move.l 1ba90 <Copperlist1>,d0
    359e:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd3e2d>
    35a2:	4878 00bb      	pea bb <WaitVbl+0x25>
    35a6:	2f00           	move.l d0,-(sp)
    35a8:	4eba f4d6      	jsr 2a80 <TestCopperlistPos>(pc)
    35ac:	4fef 000c      	lea 12(sp),sp
    35b0:	4a80           	tst.l d0
    35b2:	6642           	bne.s 35f6 <ZoomTestDisplay+0x416>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    35b4:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    35ba:	2c40           	movea.l d0,a6
    35bc:	4eae ffc4      	jsr -60(a6)
    35c0:	2f40 001c      	move.l d0,28(sp)
    35c4:	202f 001c      	move.l 28(sp),d0
    35c8:	2f40 0018      	move.l d0,24(sp)
    35cc:	2f7c 0001 809f 	move.l #98463,20(sp)
    35d2:	0014 
    35d4:	7032           	moveq #50,d0
    35d6:	2f40 0010      	move.l d0,16(sp)
    35da:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    35e0:	2c40           	movea.l d0,a6
    35e2:	222f 0018      	move.l 24(sp),d1
    35e6:	242f 0014      	move.l 20(sp),d2
    35ea:	262f 0010      	move.l 16(sp),d3
    35ee:	4eae ffd0      	jsr -48(a6)
    35f2:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    35f6:	2f3c 0000 ff00 	move.l #65280,-(sp)
    35fc:	4878 031c      	pea 31c <TakeSystem+0xb4>
    3600:	4eba cb0c      	jsr 10e <FreeDisplay>(pc)
    3604:	508f           	addq.l #8,sp

}
    3606:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    360a:	4fef 00c8      	lea 200(sp),sp
    360e:	4e75           	rts

00003610 <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    3610:	598f           	subq.l #4,sp
    3612:	202f 000c      	move.l 12(sp),d0
    3616:	3000           	move.w d0,d0
    3618:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    361c:	7000           	moveq #0,d0
    361e:	302f 0002      	move.w 2(sp),d0
    3622:	4878 001c      	pea 1c <GetVBR+0x14>
    3626:	2f2f 0014      	move.l 20(sp),-(sp)
    362a:	2f00           	move.l d0,-(sp)
    362c:	2f2f 0014      	move.l 20(sp),-(sp)
    3630:	4eba f410      	jsr 2a42 <TestCopperlistBatch>(pc)
    3634:	4fef 0010      	lea 16(sp),sp
    3638:	4a80           	tst.l d0
    363a:	6604           	bne.s 3640 <TestCopperListZoom102+0x30>
    return 0;
    363c:	7000           	moveq #0,d0
    363e:	6062           	bra.s 36a2 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    3640:	7078           	moveq #120,d0
    3642:	d0af 0010      	add.l 16(sp),d0
    3646:	7200           	moveq #0,d1
    3648:	322f 0002      	move.w 2(sp),d1
    364c:	307c 001e      	movea.w #30,a0
    3650:	d1c1           	adda.l d1,a0
    3652:	4878 0036      	pea 36 <GetVBR+0x2e>
    3656:	2f00           	move.l d0,-(sp)
    3658:	2f08           	move.l a0,-(sp)
    365a:	2f2f 0014      	move.l 20(sp),-(sp)
    365e:	4eba f3e2      	jsr 2a42 <TestCopperlistBatch>(pc)
    3662:	4fef 0010      	lea 16(sp),sp
    3666:	4a80           	tst.l d0
    3668:	6604           	bne.s 366e <TestCopperListZoom102+0x5e>
    return 0;
    366a:	7000           	moveq #0,d0
    366c:	6034           	bra.s 36a2 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    366e:	202f 0010      	move.l 16(sp),d0
    3672:	0680 0000 0158 	addi.l #344,d0
    3678:	7200           	moveq #0,d1
    367a:	322f 0002      	move.w 2(sp),d1
    367e:	307c 0056      	movea.w #86,a0
    3682:	d1c1           	adda.l d1,a0
    3684:	4878 001c      	pea 1c <GetVBR+0x14>
    3688:	2f00           	move.l d0,-(sp)
    368a:	2f08           	move.l a0,-(sp)
    368c:	2f2f 0014      	move.l 20(sp),-(sp)
    3690:	4eba f3b0      	jsr 2a42 <TestCopperlistBatch>(pc)
    3694:	4fef 0010      	lea 16(sp),sp
    3698:	4a80           	tst.l d0
    369a:	6604           	bne.s 36a0 <TestCopperListZoom102+0x90>
    return 0;
    369c:	7000           	moveq #0,d0
    369e:	6002           	bra.s 36a2 <TestCopperListZoom102+0x92>
 
  return 1;
    36a0:	7001           	moveq #1,d0
}
    36a2:	588f           	addq.l #4,sp
    36a4:	4e75           	rts

000036a6 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    36a6:	4fef ff94      	lea -108(sp),sp
    36aa:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    36ae:	4eba dd30      	jsr 13e0 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    36b2:	4eba e0d2      	jsr 1786 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    36b6:	2f7c 0000 c800 	move.l #51200,116(sp)
    36bc:	0074 
    36be:	7002           	moveq #2,d0
    36c0:	2f40 0070      	move.l d0,112(sp)
    36c4:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    36ca:	2c40           	movea.l d0,a6
    36cc:	202f 0074      	move.l 116(sp),d0
    36d0:	222f 0070      	move.l 112(sp),d1
    36d4:	4eae ff3a      	jsr -198(a6)
    36d8:	2f40 006c      	move.l d0,108(sp)
    36dc:	202f 006c      	move.l 108(sp),d0
    36e0:	23c0 0001 bad8 	move.l d0,1bad8 <Zoom_Source>
  if( Zoom_Source == 0) {
    36e6:	2039 0001 bad8 	move.l 1bad8 <Zoom_Source>,d0
    36ec:	4a80           	tst.l d0
    36ee:	6646           	bne.s 3736 <TestBlitleftOfZoom+0x90>
    Write(  Output(), 
    36f0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    36f6:	2c40           	movea.l d0,a6
    36f8:	4eae ffc4      	jsr -60(a6)
    36fc:	2f40 0068      	move.l d0,104(sp)
    3700:	202f 0068      	move.l 104(sp),d0
    3704:	2f40 0064      	move.l d0,100(sp)
    3708:	2f7c 0001 80d2 	move.l #98514,96(sp)
    370e:	0060 
    3710:	7236           	moveq #54,d1
    3712:	2f41 005c      	move.l d1,92(sp)
    3716:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    371c:	2c40           	movea.l d0,a6
    371e:	222f 0064      	move.l 100(sp),d1
    3722:	242f 0060      	move.l 96(sp),d2
    3726:	262f 005c      	move.l 92(sp),d3
    372a:	4eae ffd0      	jsr -48(a6)
    372e:	2f40 0058      	move.l d0,88(sp)
    3732:	6000 01fe      	bra.w 3932 <TestBlitleftOfZoom+0x28c>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    3736:	2f79 0001 bad8 	move.l 1bad8 <Zoom_Source>,84(sp)
    373c:	0054 
  *tstsource++ = 0x0000;
    373e:	202f 0054      	move.l 84(sp),d0
    3742:	2200           	move.l d0,d1
    3744:	5481           	addq.l #2,d1
    3746:	2f41 0054      	move.l d1,84(sp)
    374a:	2040           	movea.l d0,a0
    374c:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    374e:	206f 0054      	movea.l 84(sp),a0
    3752:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    3756:	702e           	moveq #46,d0
    3758:	d1af 0054      	add.l d0,84(sp)
  *tstsource = 0x1000;
    375c:	206f 0054      	movea.l 84(sp),a0
    3760:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    3764:	54af 0054      	addq.l #2,84(sp)
  *tstsource = 0x8e88;
    3768:	206f 0054      	movea.l 84(sp),a0
    376c:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    3770:	722e           	moveq #46,d1
    3772:	d3af 0054      	add.l d1,84(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    3776:	2039 0001 bad8 	move.l 1bad8 <Zoom_Source>,d0
    377c:	2200           	move.l d0,d1
    377e:	0681 0000 17d0 	addi.l #6096,d1
    3784:	2f41 0054      	move.l d1,84(sp)
  *tstsource++ = 0x0000;
    3788:	202f 0054      	move.l 84(sp),d0
    378c:	2200           	move.l d0,d1
    378e:	5481           	addq.l #2,d1
    3790:	2f41 0054      	move.l d1,84(sp)
    3794:	2040           	movea.l d0,a0
    3796:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    3798:	206f 0054      	movea.l 84(sp),a0
    379c:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    37a0:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    37a6:	2c40           	movea.l d0,a6
    37a8:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    37ac:	4eba e154      	jsr 1902 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    37b0:	42a7           	clr.l -(sp)
    37b2:	4878 0010      	pea 10 <GetVBR+0x8>
    37b6:	4878 0007      	pea 7 <_start+0x7>
    37ba:	4eba e1c2      	jsr 197e <Init_ZoomBlit>(pc)
    37be:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    37c2:	2239 0001 ba98 	move.l 1ba98 <DrawBuffer>,d1
    37c8:	2039 0001 bad8 	move.l 1bad8 <Zoom_Source>,d0
    37ce:	4878 0080      	pea 80 <SetInterruptHandler+0x6>
    37d2:	2f01           	move.l d1,-(sp)
    37d4:	2f00           	move.l d0,-(sp)
    37d6:	4eba d76e      	jsr f46 <Zoom_ZoomBlit>(pc)
    37da:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    37de:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    37e4:	2c40           	movea.l d0,a6
    37e6:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    37ea:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    37f0:	2200           	move.l d0,d1
    37f2:	5481           	addq.l #2,d1
    37f4:	2f41 0050      	move.l d1,80(sp)
  if( *destination != 0x0180) {
    37f8:	206f 0050      	movea.l 80(sp),a0
    37fc:	3010           	move.w (a0),d0
    37fe:	0c40 0180      	cmpi.w #384,d0
    3802:	6742           	beq.s 3846 <TestBlitleftOfZoom+0x1a0>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    3804:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    380a:	2c40           	movea.l d0,a6
    380c:	4eae ffc4      	jsr -60(a6)
    3810:	2f40 004c      	move.l d0,76(sp)
    3814:	202f 004c      	move.l 76(sp),d0
    3818:	2f40 0048      	move.l d0,72(sp)
    381c:	2f7c 0001 810a 	move.l #98570,68(sp)
    3822:	0044 
    3824:	701c           	moveq #28,d0
    3826:	2f40 0040      	move.l d0,64(sp)
    382a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3830:	2c40           	movea.l d0,a6
    3832:	222f 0048      	move.l 72(sp),d1
    3836:	242f 0044      	move.l 68(sp),d2
    383a:	262f 0040      	move.l 64(sp),d3
    383e:	4eae ffd0      	jsr -48(a6)
    3842:	2f40 003c      	move.l d0,60(sp)
  }
  destination += ZMLINESIZE/2;
    3846:	7230           	moveq #48,d1
    3848:	d3af 0050      	add.l d1,80(sp)
  if( *destination != 0x1d88)
    384c:	206f 0050      	movea.l 80(sp),a0
    3850:	3010           	move.w (a0),d0
    3852:	0c40 1d88      	cmpi.w #7560,d0
    3856:	6742           	beq.s 389a <TestBlitleftOfZoom+0x1f4>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    3858:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    385e:	2c40           	movea.l d0,a6
    3860:	4eae ffc4      	jsr -60(a6)
    3864:	2f40 0038      	move.l d0,56(sp)
    3868:	202f 0038      	move.l 56(sp),d0
    386c:	2f40 0034      	move.l d0,52(sp)
    3870:	2f7c 0001 8127 	move.l #98599,48(sp)
    3876:	0030 
    3878:	701c           	moveq #28,d0
    387a:	2f40 002c      	move.l d0,44(sp)
    387e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3884:	2c40           	movea.l d0,a6
    3886:	222f 0034      	move.l 52(sp),d1
    388a:	242f 0030      	move.l 48(sp),d2
    388e:	262f 002c      	move.l 44(sp),d3
    3892:	4eae ffd0      	jsr -48(a6)
    3896:	2f40 0028      	move.l d0,40(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    389a:	2039 0001 ba98 	move.l 1ba98 <DrawBuffer>,d0
    38a0:	2200           	move.l d0,d1
    38a2:	0681 0000 17d0 	addi.l #6096,d1
    38a8:	2f41 0050      	move.l d1,80(sp)
  destination++;
    38ac:	54af 0050      	addq.l #2,80(sp)
  if( *destination != 0x01ff) {
    38b0:	206f 0050      	movea.l 80(sp),a0
    38b4:	3010           	move.w (a0),d0
    38b6:	0c40 01ff      	cmpi.w #511,d0
    38ba:	6742           	beq.s 38fe <TestBlitleftOfZoom+0x258>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    38bc:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    38c2:	2c40           	movea.l d0,a6
    38c4:	4eae ffc4      	jsr -60(a6)
    38c8:	2f40 0024      	move.l d0,36(sp)
    38cc:	202f 0024      	move.l 36(sp),d0
    38d0:	2f40 0020      	move.l d0,32(sp)
    38d4:	2f7c 0001 8144 	move.l #98628,28(sp)
    38da:	001c 
    38dc:	701a           	moveq #26,d0
    38de:	2f40 0018      	move.l d0,24(sp)
    38e2:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    38e8:	2c40           	movea.l d0,a6
    38ea:	222f 0020      	move.l 32(sp),d1
    38ee:	242f 001c      	move.l 28(sp),d2
    38f2:	262f 0018      	move.l 24(sp),d3
    38f6:	4eae ffd0      	jsr -48(a6)
    38fa:	2f40 0014      	move.l d0,20(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    38fe:	2f79 0001 bad8 	move.l 1bad8 <Zoom_Source>,16(sp)
    3904:	0010 
    3906:	2f7c 0000 c800 	move.l #51200,12(sp)
    390c:	000c 
    390e:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3914:	2c40           	movea.l d0,a6
    3916:	226f 0010      	movea.l 16(sp),a1
    391a:	202f 000c      	move.l 12(sp),d0
    391e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    3922:	2f3c 0000 ff00 	move.l #65280,-(sp)
    3928:	4878 031c      	pea 31c <TakeSystem+0xb4>
    392c:	4eba c7e0      	jsr 10e <FreeDisplay>(pc)
    3930:	508f           	addq.l #8,sp
}
    3932:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3936:	4fef 006c      	lea 108(sp),sp
    393a:	4e75           	rts

0000393c <TestCopyWord>:

void TestCopyWord() {
    393c:	4fef ff74      	lea -140(sp),sp
    3940:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    3944:	2f7c 0000 05a0 	move.l #1440,136(sp)
    394a:	0088 
    394c:	7002           	moveq #2,d0
    394e:	2f40 0084      	move.l d0,132(sp)
    3952:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3958:	2c40           	movea.l d0,a6
    395a:	202f 0088      	move.l 136(sp),d0
    395e:	222f 0084      	move.l 132(sp),d1
    3962:	4eae ff3a      	jsr -198(a6)
    3966:	2f40 0080      	move.l d0,128(sp)
    396a:	202f 0080      	move.l 128(sp),d0
    396e:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    3972:	4aaf 007c      	tst.l 124(sp)
    3976:	6646           	bne.s 39be <TestCopyWord+0x82>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3978:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    397e:	2c40           	movea.l d0,a6
    3980:	4eae ffc4      	jsr -60(a6)
    3984:	2f40 0078      	move.l d0,120(sp)
    3988:	202f 0078      	move.l 120(sp),d0
    398c:	2f40 0074      	move.l d0,116(sp)
    3990:	2f7c 0001 815f 	move.l #98655,112(sp)
    3996:	0070 
    3998:	7235           	moveq #53,d1
    399a:	2f41 006c      	move.l d1,108(sp)
    399e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    39a4:	2c40           	movea.l d0,a6
    39a6:	222f 0074      	move.l 116(sp),d1
    39aa:	242f 0070      	move.l 112(sp),d2
    39ae:	262f 006c      	move.l 108(sp),d3
    39b2:	4eae ffd0      	jsr -48(a6)
    39b6:	2f40 0068      	move.l d0,104(sp)
    39ba:	6000 0270      	bra.w 3c2c <TestCopyWord+0x2f0>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    39be:	2f7c 0000 05a0 	move.l #1440,100(sp)
    39c4:	0064 
    39c6:	7002           	moveq #2,d0
    39c8:	2f40 0060      	move.l d0,96(sp)
    39cc:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    39d2:	2c40           	movea.l d0,a6
    39d4:	202f 0064      	move.l 100(sp),d0
    39d8:	222f 0060      	move.l 96(sp),d1
    39dc:	4eae ff3a      	jsr -198(a6)
    39e0:	2f40 005c      	move.l d0,92(sp)
    39e4:	202f 005c      	move.l 92(sp),d0
    39e8:	2f40 0058      	move.l d0,88(sp)
  if( destination == 0) {
    39ec:	4aaf 0058      	tst.l 88(sp)
    39f0:	6646           	bne.s 3a38 <TestCopyWord+0xfc>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    39f2:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    39f8:	2c40           	movea.l d0,a6
    39fa:	4eae ffc4      	jsr -60(a6)
    39fe:	2f40 0054      	move.l d0,84(sp)
    3a02:	202f 0054      	move.l 84(sp),d0
    3a06:	2f40 0050      	move.l d0,80(sp)
    3a0a:	2f7c 0001 815f 	move.l #98655,76(sp)
    3a10:	004c 
    3a12:	7235           	moveq #53,d1
    3a14:	2f41 0048      	move.l d1,72(sp)
    3a18:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3a1e:	2c40           	movea.l d0,a6
    3a20:	222f 0050      	move.l 80(sp),d1
    3a24:	242f 004c      	move.l 76(sp),d2
    3a28:	262f 0048      	move.l 72(sp),d3
    3a2c:	4eae ffd0      	jsr -48(a6)
    3a30:	2f40 0044      	move.l d0,68(sp)
    3a34:	6000 01f6      	bra.w 3c2c <TestCopyWord+0x2f0>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    3a38:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    3a3e:	42af 0090      	clr.l 144(sp)
    3a42:	6000 0086      	bra.w 3aca <TestCopyWord+0x18e>
    *tmp++ = 0;
    3a46:	202f 0094      	move.l 148(sp),d0
    3a4a:	2200           	move.l d0,d1
    3a4c:	5481           	addq.l #2,d1
    3a4e:	2f41 0094      	move.l d1,148(sp)
    3a52:	2040           	movea.l d0,a0
    3a54:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    3a56:	202f 0094      	move.l 148(sp),d0
    3a5a:	2200           	move.l d0,d1
    3a5c:	5481           	addq.l #2,d1
    3a5e:	2f41 0094      	move.l d1,148(sp)
    3a62:	2040           	movea.l d0,a0
    3a64:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    3a68:	202f 0094      	move.l 148(sp),d0
    3a6c:	2200           	move.l d0,d1
    3a6e:	5481           	addq.l #2,d1
    3a70:	2f41 0094      	move.l d1,148(sp)
    3a74:	2040           	movea.l d0,a0
    3a76:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    3a7a:	206f 0094      	movea.l 148(sp),a0
    3a7e:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3a80:	702a           	moveq #42,d0
    3a82:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    3a86:	202f 0094      	move.l 148(sp),d0
    3a8a:	2200           	move.l d0,d1
    3a8c:	5481           	addq.l #2,d1
    3a8e:	2f41 0094      	move.l d1,148(sp)
    3a92:	2040           	movea.l d0,a0
    3a94:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    3a96:	202f 0094      	move.l 148(sp),d0
    3a9a:	2200           	move.l d0,d1
    3a9c:	5481           	addq.l #2,d1
    3a9e:	2f41 0094      	move.l d1,148(sp)
    3aa2:	2040           	movea.l d0,a0
    3aa4:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    3aa8:	202f 0094      	move.l 148(sp),d0
    3aac:	2200           	move.l d0,d1
    3aae:	5481           	addq.l #2,d1
    3ab0:	2f41 0094      	move.l d1,148(sp)
    3ab4:	2040           	movea.l d0,a0
    3ab6:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    3aba:	206f 0094      	movea.l 148(sp),a0
    3abe:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    3ac0:	702a           	moveq #42,d0
    3ac2:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    3ac6:	52af 0090      	addq.l #1,144(sp)
    3aca:	7207           	moveq #7,d1
    3acc:	b2af 0090      	cmp.l 144(sp),d1
    3ad0:	6c00 ff74      	bge.w 3a46 <TestCopyWord+0x10a>
  }
  tmp = destination;
    3ad4:	2f6f 0058 0094 	move.l 88(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3ada:	42af 008c      	clr.l 140(sp)
    3ade:	6014           	bra.s 3af4 <TestCopyWord+0x1b8>
    *tmp++ = 0;
    3ae0:	202f 0094      	move.l 148(sp),d0
    3ae4:	2200           	move.l d0,d1
    3ae6:	5481           	addq.l #2,d1
    3ae8:	2f41 0094      	move.l d1,148(sp)
    3aec:	2040           	movea.l d0,a0
    3aee:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    3af0:	52af 008c      	addq.l #1,140(sp)
    3af4:	0caf 0000 02cf 	cmpi.l #719,140(sp)
    3afa:	008c 
    3afc:	6fe2           	ble.s 3ae0 <TestCopyWord+0x1a4>
  }

  WaitBlit();
    3afe:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    3b04:	2c40           	movea.l d0,a6
    3b06:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    3b0a:	4eba d8d4      	jsr 13e0 <Zoom_Init>(pc)
  Init_Copy( 3);
    3b0e:	4878 0003      	pea 3 <_start+0x3>
    3b12:	4eba df0e      	jsr 1a22 <Init_Copy>(pc)
    3b16:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    3b18:	202f 007c      	move.l 124(sp),d0
    3b1c:	5480           	addq.l #2,d0
    3b1e:	4878 0010      	pea 10 <GetVBR+0x8>
    3b22:	2f2f 005c      	move.l 92(sp),-(sp)
    3b26:	2f00           	move.l d0,-(sp)
    3b28:	4eba d3de      	jsr f08 <Zoom_CopyWord>(pc)
    3b2c:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    3b30:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    3b36:	2c40           	movea.l d0,a6
    3b38:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    3b3c:	202f 0058      	move.l 88(sp),d0
    3b40:	5480           	addq.l #2,d0
    3b42:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    3b46:	206f 0094      	movea.l 148(sp),a0
    3b4a:	3010           	move.w (a0),d0
    3b4c:	0c40 5555      	cmpi.w #21845,d0
    3b50:	6742           	beq.s 3b94 <TestCopyWord+0x258>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    3b52:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3b58:	2c40           	movea.l d0,a6
    3b5a:	4eae ffc4      	jsr -60(a6)
    3b5e:	2f40 0040      	move.l d0,64(sp)
    3b62:	202f 0040      	move.l 64(sp),d0
    3b66:	2f40 003c      	move.l d0,60(sp)
    3b6a:	2f7c 0001 8195 	move.l #98709,56(sp)
    3b70:	0038 
    3b72:	721f           	moveq #31,d1
    3b74:	2f41 0034      	move.l d1,52(sp)
    3b78:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3b7e:	2c40           	movea.l d0,a6
    3b80:	222f 003c      	move.l 60(sp),d1
    3b84:	242f 0038      	move.l 56(sp),d2
    3b88:	262f 0034      	move.l 52(sp),d3
    3b8c:	4eae ffd0      	jsr -48(a6)
    3b90:	2f40 0030      	move.l d0,48(sp)
  tmp += ZMLINESIZE/2;
    3b94:	7030           	moveq #48,d0
    3b96:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    3b9a:	206f 0094      	movea.l 148(sp),a0
    3b9e:	3010           	move.w (a0),d0
    3ba0:	0c40 aaaa      	cmpi.w #-21846,d0
    3ba4:	6742           	beq.s 3be8 <TestCopyWord+0x2ac>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    3ba6:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3bac:	2c40           	movea.l d0,a6
    3bae:	4eae ffc4      	jsr -60(a6)
    3bb2:	2f40 002c      	move.l d0,44(sp)
    3bb6:	202f 002c      	move.l 44(sp),d0
    3bba:	2f40 0028      	move.l d0,40(sp)
    3bbe:	2f7c 0001 81b5 	move.l #98741,36(sp)
    3bc4:	0024 
    3bc6:	7220           	moveq #32,d1
    3bc8:	2f41 0020      	move.l d1,32(sp)
    3bcc:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3bd2:	2c40           	movea.l d0,a6
    3bd4:	222f 0028      	move.l 40(sp),d1
    3bd8:	242f 0024      	move.l 36(sp),d2
    3bdc:	262f 0020      	move.l 32(sp),d3
    3be0:	4eae ffd0      	jsr -48(a6)
    3be4:	2f40 001c      	move.l d0,28(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    3be8:	2f6f 007c 0018 	move.l 124(sp),24(sp)
    3bee:	2f7c 0000 05a0 	move.l #1440,20(sp)
    3bf4:	0014 
    3bf6:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3bfc:	2c40           	movea.l d0,a6
    3bfe:	226f 0018      	movea.l 24(sp),a1
    3c02:	202f 0014      	move.l 20(sp),d0
    3c06:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    3c0a:	2f6f 0058 0010 	move.l 88(sp),16(sp)
    3c10:	2f7c 0000 05a0 	move.l #1440,12(sp)
    3c16:	000c 
    3c18:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3c1e:	2c40           	movea.l d0,a6
    3c20:	226f 0010      	movea.l 16(sp),a1
    3c24:	202f 000c      	move.l 12(sp),d0
    3c28:	4eae ff2e      	jsr -210(a6)
}
    3c2c:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3c30:	4fef 008c      	lea 140(sp),sp
    3c34:	4e75           	rts

00003c36 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    3c36:	4fef ff74      	lea -140(sp),sp
    3c3a:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3c3e:	2f7c 0001 1440 	move.l #70720,102(sp)
    3c44:	0066 
    3c46:	7002           	moveq #2,d0
    3c48:	2f40 0062      	move.l d0,98(sp)
    3c4c:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3c52:	2c40           	movea.l d0,a6
    3c54:	202f 0066      	move.l 102(sp),d0
    3c58:	222f 0062      	move.l 98(sp),d1
    3c5c:	4eae ff3a      	jsr -198(a6)
    3c60:	2f40 005e      	move.l d0,94(sp)
    3c64:	202f 005e      	move.l 94(sp),d0
    3c68:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    3c6c:	4aaf 005a      	tst.l 90(sp)
    3c70:	6646           	bne.s 3cb8 <TestZoom4PictureOn5Planes+0x82>
    Write(  Output(), 
    3c72:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3c78:	2c40           	movea.l d0,a6
    3c7a:	4eae ffc4      	jsr -60(a6)
    3c7e:	2f40 0056      	move.l d0,86(sp)
    3c82:	202f 0056      	move.l 86(sp),d0
    3c86:	2f40 0052      	move.l d0,82(sp)
    3c8a:	2f7c 0001 81d6 	move.l #98774,78(sp)
    3c90:	004e 
    3c92:	7239           	moveq #57,d1
    3c94:	2f41 004a      	move.l d1,74(sp)
    3c98:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3c9e:	2c40           	movea.l d0,a6
    3ca0:	222f 0052      	move.l 82(sp),d1
    3ca4:	242f 004e      	move.l 78(sp),d2
    3ca8:	262f 004a      	move.l 74(sp),d3
    3cac:	4eae ffd0      	jsr -48(a6)
    3cb0:	2f40 0046      	move.l d0,70(sp)
    3cb4:	6000 026a      	bra.w 3f20 <TestZoom4PictureOn5Planes+0x2ea>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3cb8:	2f7c 0001 1440 	move.l #70720,66(sp)
    3cbe:	0042 
    3cc0:	7002           	moveq #2,d0
    3cc2:	2f40 003e      	move.l d0,62(sp)
    3cc6:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3ccc:	2c40           	movea.l d0,a6
    3cce:	202f 0042      	move.l 66(sp),d0
    3cd2:	222f 003e      	move.l 62(sp),d1
    3cd6:	4eae ff3a      	jsr -198(a6)
    3cda:	2f40 003a      	move.l d0,58(sp)
    3cde:	202f 003a      	move.l 58(sp),d0
    3ce2:	2f40 0036      	move.l d0,54(sp)
  if( destination == 0) {
    3ce6:	4aaf 0036      	tst.l 54(sp)
    3cea:	6646           	bne.s 3d32 <TestZoom4PictureOn5Planes+0xfc>
    Write(  Output(), 
    3cec:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3cf2:	2c40           	movea.l d0,a6
    3cf4:	4eae ffc4      	jsr -60(a6)
    3cf8:	2f40 0032      	move.l d0,50(sp)
    3cfc:	202f 0032      	move.l 50(sp),d0
    3d00:	2f40 002e      	move.l d0,46(sp)
    3d04:	2f7c 0001 8210 	move.l #98832,42(sp)
    3d0a:	002a 
    3d0c:	723d           	moveq #61,d1
    3d0e:	2f41 0026      	move.l d1,38(sp)
    3d12:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3d18:	2c40           	movea.l d0,a6
    3d1a:	222f 002e      	move.l 46(sp),d1
    3d1e:	242f 002a      	move.l 42(sp),d2
    3d22:	262f 0026      	move.l 38(sp),d3
    3d26:	4eae ffd0      	jsr -48(a6)
    3d2a:	2f40 0022      	move.l d0,34(sp)
    3d2e:	6000 01f0      	bra.w 3f20 <TestZoom4PictureOn5Planes+0x2ea>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    3d32:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    3d38:	42af 0090      	clr.l 144(sp)
    3d3c:	6050           	bra.s 3d8e <TestZoom4PictureOn5Planes+0x158>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3d3e:	42af 008c      	clr.l 140(sp)
    3d42:	6018           	bra.s 3d5c <TestZoom4PictureOn5Planes+0x126>
      *tmp4source++ = 0x55555555;
    3d44:	202f 0094      	move.l 148(sp),d0
    3d48:	2200           	move.l d0,d1
    3d4a:	5881           	addq.l #4,d1
    3d4c:	2f41 0094      	move.l d1,148(sp)
    3d50:	2040           	movea.l d0,a0
    3d52:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3d58:	52af 008c      	addq.l #1,140(sp)
    3d5c:	703b           	moveq #59,d0
    3d5e:	b0af 008c      	cmp.l 140(sp),d0
    3d62:	6ce0           	bge.s 3d44 <TestZoom4PictureOn5Planes+0x10e>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3d64:	42af 0088      	clr.l 136(sp)
    3d68:	6018           	bra.s 3d82 <TestZoom4PictureOn5Planes+0x14c>
      *tmp4source++ = 0xaaaaaaaa;
    3d6a:	202f 0094      	move.l 148(sp),d0
    3d6e:	2200           	move.l d0,d1
    3d70:	5881           	addq.l #4,d1
    3d72:	2f41 0094      	move.l d1,148(sp)
    3d76:	2040           	movea.l d0,a0
    3d78:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    3d7e:	52af 0088      	addq.l #1,136(sp)
    3d82:	703b           	moveq #59,d0
    3d84:	b0af 0088      	cmp.l 136(sp),d0
    3d88:	6ce0           	bge.s 3d6a <TestZoom4PictureOn5Planes+0x134>
  for(int i=0;i<128+8;i++) {
    3d8a:	52af 0090      	addq.l #1,144(sp)
    3d8e:	0caf 0000 0087 	cmpi.l #135,144(sp)
    3d94:	0090 
    3d96:	6fa6           	ble.s 3d3e <TestZoom4PictureOn5Planes+0x108>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3d98:	4878 0005      	pea 5 <_start+0x5>
    3d9c:	42a7           	clr.l -(sp)
    3d9e:	2f2f 003e      	move.l 62(sp),-(sp)
    3da2:	2f2f 0066      	move.l 102(sp),-(sp)
    3da6:	4eba dcb4      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    3daa:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3dae:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    3db4:	2c40           	movea.l d0,a6
    3db6:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    3dba:	222f 0036      	move.l 54(sp),d1
    3dbe:	5881           	addq.l #4,d1
    3dc0:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    3dc4:	2f7c 0001 b764 	move.l #112484,30(sp)
    3dca:	001e 
  UWORD mask = 0xffff;
    3dcc:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    3dd2:	42af 007e      	clr.l 126(sp)
    3dd6:	6000 00a8      	bra.w 3e80 <TestZoom4PictureOn5Planes+0x24a>
    for(int i2=0;i2<18;i2++) { 
    3dda:	42af 007a      	clr.l 122(sp)
    3dde:	604e           	bra.s 3e2e <TestZoom4PictureOn5Planes+0x1f8>
      for( int i3=0;i3<5;i3++) {
    3de0:	42af 0076      	clr.l 118(sp)
    3de4:	6038           	bra.s 3e1e <TestZoom4PictureOn5Planes+0x1e8>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    3de6:	222f 007e      	move.l 126(sp),d1
    3dea:	2001           	move.l d1,d0
    3dec:	e788           	lsl.l #3,d0
    3dee:	d081           	add.l d1,d0
    3df0:	d080           	add.l d0,d0
    3df2:	d081           	add.l d1,d0
    3df4:	2200           	move.l d0,d1
    3df6:	d2af 007a      	add.l 122(sp),d1
    3dfa:	7000           	moveq #0,d0
    3dfc:	302f 0082      	move.w 130(sp),d0
    3e00:	2f01           	move.l d1,-(sp)
    3e02:	2f00           	move.l d0,-(sp)
    3e04:	2f2f 008c      	move.l 140(sp),-(sp)
    3e08:	2f2f 002a      	move.l 42(sp),-(sp)
    3e0c:	4eba 2f92      	jsr 6da0 <TestRow>(pc)
    3e10:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    3e14:	7030           	moveq #48,d0
    3e16:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    3e1a:	52af 0076      	addq.l #1,118(sp)
    3e1e:	7204           	moveq #4,d1
    3e20:	b2af 0076      	cmp.l 118(sp),d1
    3e24:	6cc0           	bge.s 3de6 <TestZoom4PictureOn5Planes+0x1b0>
      }
      mask = mask ^ 0xffff;
    3e26:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    3e2a:	52af 007a      	addq.l #1,122(sp)
    3e2e:	7011           	moveq #17,d0
    3e30:	b0af 007a      	cmp.l 122(sp),d0
    3e34:	6caa           	bge.s 3de0 <TestZoom4PictureOn5Planes+0x1aa>
    }
    for( int i3=0;i3<5;i3++) {
    3e36:	42af 0072      	clr.l 114(sp)
    3e3a:	6038           	bra.s 3e74 <TestZoom4PictureOn5Planes+0x23e>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3e3c:	222f 007e      	move.l 126(sp),d1
    3e40:	2001           	move.l d1,d0
    3e42:	e788           	lsl.l #3,d0
    3e44:	d081           	add.l d1,d0
    3e46:	d080           	add.l d0,d0
    3e48:	2040           	movea.l d0,a0
    3e4a:	d1c1           	adda.l d1,a0
    3e4c:	41e8 0012      	lea 18(a0),a0
    3e50:	7000           	moveq #0,d0
    3e52:	302f 0082      	move.w 130(sp),d0
    3e56:	2f08           	move.l a0,-(sp)
    3e58:	2f00           	move.l d0,-(sp)
    3e5a:	2f2f 008c      	move.l 140(sp),-(sp)
    3e5e:	2f2f 002a      	move.l 42(sp),-(sp)
    3e62:	4eba 2f3c      	jsr 6da0 <TestRow>(pc)
    3e66:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3e6a:	7230           	moveq #48,d1
    3e6c:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    3e70:	52af 0072      	addq.l #1,114(sp)
    3e74:	7004           	moveq #4,d0
    3e76:	b0af 0072      	cmp.l 114(sp),d0
    3e7a:	6cc0           	bge.s 3e3c <TestZoom4PictureOn5Planes+0x206>
  for(int i=0;i<14;i++) {
    3e7c:	52af 007e      	addq.l #1,126(sp)
    3e80:	720d           	moveq #13,d1
    3e82:	b2af 007e      	cmp.l 126(sp),d1
    3e86:	6c00 ff52      	bge.w 3dda <TestZoom4PictureOn5Planes+0x1a4>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    3e8a:	42af 006e      	clr.l 110(sp)
    3e8e:	6044           	bra.s 3ed4 <TestZoom4PictureOn5Planes+0x29e>
    for( int i3=0;i3<5;i3++) {
    3e90:	42af 006a      	clr.l 106(sp)
    3e94:	602e           	bra.s 3ec4 <TestZoom4PictureOn5Planes+0x28e>
      TestRow( valsupposed, valactual, mask, i2+265);
    3e96:	222f 006e      	move.l 110(sp),d1
    3e9a:	0681 0000 0109 	addi.l #265,d1
    3ea0:	7000           	moveq #0,d0
    3ea2:	302f 0082      	move.w 130(sp),d0
    3ea6:	2f01           	move.l d1,-(sp)
    3ea8:	2f00           	move.l d0,-(sp)
    3eaa:	2f2f 008c      	move.l 140(sp),-(sp)
    3eae:	2f2f 002a      	move.l 42(sp),-(sp)
    3eb2:	4eba 2eec      	jsr 6da0 <TestRow>(pc)
    3eb6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3eba:	7030           	moveq #48,d0
    3ebc:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    3ec0:	52af 006a      	addq.l #1,106(sp)
    3ec4:	7204           	moveq #4,d1
    3ec6:	b2af 006a      	cmp.l 106(sp),d1
    3eca:	6cca           	bge.s 3e96 <TestZoom4PictureOn5Planes+0x260>
    }
    mask = mask ^ 0xffff;
    3ecc:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    3ed0:	52af 006e      	addq.l #1,110(sp)
    3ed4:	7003           	moveq #3,d0
    3ed6:	b0af 006e      	cmp.l 110(sp),d0
    3eda:	6cb4           	bge.s 3e90 <TestZoom4PictureOn5Planes+0x25a>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3edc:	2f6f 005a 001a 	move.l 90(sp),26(sp)
    3ee2:	2f7c 0001 1440 	move.l #70720,22(sp)
    3ee8:	0016 
    3eea:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3ef0:	2c40           	movea.l d0,a6
    3ef2:	226f 001a      	movea.l 26(sp),a1
    3ef6:	202f 0016      	move.l 22(sp),d0
    3efa:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3efe:	2f6f 0036 0012 	move.l 54(sp),18(sp)
    3f04:	2f7c 0001 1440 	move.l #70720,14(sp)
    3f0a:	000e 
    3f0c:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3f12:	2c40           	movea.l d0,a6
    3f14:	226f 0012      	movea.l 18(sp),a1
    3f18:	202f 000e      	move.l 14(sp),d0
    3f1c:	4eae ff2e      	jsr -210(a6)
}
    3f20:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3f24:	4fef 008c      	lea 140(sp),sp
    3f28:	4e75           	rts

00003f2a <TestZoom4Picture>:

void TestZoom4Picture() {
    3f2a:	4fef fe30      	lea -464(sp),sp
    3f2e:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3f32:	2f7c 0000 3740 	move.l #14144,106(sp)
    3f38:	006a 
    3f3a:	7002           	moveq #2,d0
    3f3c:	2f40 0066      	move.l d0,102(sp)
    3f40:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3f46:	2c40           	movea.l d0,a6
    3f48:	202f 006a      	move.l 106(sp),d0
    3f4c:	222f 0066      	move.l 102(sp),d1
    3f50:	4eae ff3a      	jsr -198(a6)
    3f54:	2f40 0062      	move.l d0,98(sp)
    3f58:	202f 0062      	move.l 98(sp),d0
    3f5c:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    3f60:	4aaf 005e      	tst.l 94(sp)
    3f64:	6646           	bne.s 3fac <TestZoom4Picture+0x82>
    Write(  Output(), 
    3f66:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3f6c:	2c40           	movea.l d0,a6
    3f6e:	4eae ffc4      	jsr -60(a6)
    3f72:	2f40 005a      	move.l d0,90(sp)
    3f76:	202f 005a      	move.l 90(sp),d0
    3f7a:	2f40 0056      	move.l d0,86(sp)
    3f7e:	2f7c 0001 81d6 	move.l #98774,82(sp)
    3f84:	0052 
    3f86:	7239           	moveq #57,d1
    3f88:	2f41 004e      	move.l d1,78(sp)
    3f8c:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3f92:	2c40           	movea.l d0,a6
    3f94:	222f 0056      	move.l 86(sp),d1
    3f98:	242f 0052      	move.l 82(sp),d2
    3f9c:	262f 004e      	move.l 78(sp),d3
    3fa0:	4eae ffd0      	jsr -48(a6)
    3fa4:	2f40 004a      	move.l d0,74(sp)
    3fa8:	6000 2dec      	bra.w 6d96 <TestZoom4Picture+0x2e6c>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    3fac:	2f7c 0000 3740 	move.l #14144,70(sp)
    3fb2:	0046 
    3fb4:	7402           	moveq #2,d2
    3fb6:	2f42 0042      	move.l d2,66(sp)
    3fba:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    3fc0:	2c40           	movea.l d0,a6
    3fc2:	202f 0046      	move.l 70(sp),d0
    3fc6:	222f 0042      	move.l 66(sp),d1
    3fca:	4eae ff3a      	jsr -198(a6)
    3fce:	2f40 003e      	move.l d0,62(sp)
    3fd2:	202f 003e      	move.l 62(sp),d0
    3fd6:	2f40 003a      	move.l d0,58(sp)
  if( destination == 0) {
    3fda:	4aaf 003a      	tst.l 58(sp)
    3fde:	6646           	bne.s 4026 <TestZoom4Picture+0xfc>
    Write(  Output(), 
    3fe0:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    3fe6:	2c40           	movea.l d0,a6
    3fe8:	4eae ffc4      	jsr -60(a6)
    3fec:	2f40 0036      	move.l d0,54(sp)
    3ff0:	202f 0036      	move.l 54(sp),d0
    3ff4:	2f40 0032      	move.l d0,50(sp)
    3ff8:	2f7c 0001 8210 	move.l #98832,46(sp)
    3ffe:	002e 
    4000:	703d           	moveq #61,d0
    4002:	2f40 002a      	move.l d0,42(sp)
    4006:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    400c:	2c40           	movea.l d0,a6
    400e:	222f 0032      	move.l 50(sp),d1
    4012:	242f 002e      	move.l 46(sp),d2
    4016:	262f 002a      	move.l 42(sp),d3
    401a:	4eae ffd0      	jsr -48(a6)
    401e:	2f40 0026      	move.l d0,38(sp)
    4022:	6000 2d72      	bra.w 6d96 <TestZoom4Picture+0x2e6c>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    4026:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    402c:	42af 01d4      	clr.l 468(sp)
    4030:	6050           	bra.s 4082 <TestZoom4Picture+0x158>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    4032:	42af 01d0      	clr.l 464(sp)
    4036:	6018           	bra.s 4050 <TestZoom4Picture+0x126>
      *tmp4source++ = 0x55555555;
    4038:	202f 01d8      	move.l 472(sp),d0
    403c:	2200           	move.l d0,d1
    403e:	5881           	addq.l #4,d1
    4040:	2f41 01d8      	move.l d1,472(sp)
    4044:	2040           	movea.l d0,a0
    4046:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    404c:	52af 01d0      	addq.l #1,464(sp)
    4050:	700b           	moveq #11,d0
    4052:	b0af 01d0      	cmp.l 464(sp),d0
    4056:	6ce0           	bge.s 4038 <TestZoom4Picture+0x10e>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    4058:	42af 01cc      	clr.l 460(sp)
    405c:	6018           	bra.s 4076 <TestZoom4Picture+0x14c>
      *tmp4source++ = 0xaaaaaaaa;
    405e:	202f 01d8      	move.l 472(sp),d0
    4062:	2200           	move.l d0,d1
    4064:	5881           	addq.l #4,d1
    4066:	2f41 01d8      	move.l d1,472(sp)
    406a:	2040           	movea.l d0,a0
    406c:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    4072:	52af 01cc      	addq.l #1,460(sp)
    4076:	700b           	moveq #11,d0
    4078:	b0af 01cc      	cmp.l 460(sp),d0
    407c:	6ce0           	bge.s 405e <TestZoom4Picture+0x134>
  for(int i=0;i<128+8;i++) {
    407e:	52af 01d4      	addq.l #1,468(sp)
    4082:	0caf 0000 0087 	cmpi.l #135,468(sp)
    4088:	01d4 
    408a:	6fa6           	ble.s 4032 <TestZoom4Picture+0x108>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    408c:	4878 0001      	pea 1 <_start+0x1>
    4090:	42a7           	clr.l -(sp)
    4092:	2f2f 0042      	move.l 66(sp),-(sp)
    4096:	2f2f 006a      	move.l 106(sp),-(sp)
    409a:	4eba d9c0      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    409e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    40a2:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    40a8:	2c40           	movea.l d0,a6
    40aa:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    40ae:	222f 003a      	move.l 58(sp),d1
    40b2:	5881           	addq.l #4,d1
    40b4:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    40b8:	2f7c 0001 b764 	move.l #112484,34(sp)
    40be:	0022 
  UWORD mask = 0xffff;
    40c0:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    40c6:	42af 01c2      	clr.l 450(sp)
    40ca:	6000 0084      	bra.w 4150 <TestZoom4Picture+0x226>
    for(int i2=0;i2<18;i2++) { 
    40ce:	42af 01be      	clr.l 446(sp)
    40d2:	603c           	bra.s 4110 <TestZoom4Picture+0x1e6>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    40d4:	222f 01c2      	move.l 450(sp),d1
    40d8:	2001           	move.l d1,d0
    40da:	e788           	lsl.l #3,d0
    40dc:	d081           	add.l d1,d0
    40de:	d080           	add.l d0,d0
    40e0:	d081           	add.l d1,d0
    40e2:	2200           	move.l d0,d1
    40e4:	d2af 01be      	add.l 446(sp),d1
    40e8:	7000           	moveq #0,d0
    40ea:	302f 01c6      	move.w 454(sp),d0
    40ee:	2f01           	move.l d1,-(sp)
    40f0:	2f00           	move.l d0,-(sp)
    40f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    40f6:	2f2f 002e      	move.l 46(sp),-(sp)
    40fa:	4eba 2ca4      	jsr 6da0 <TestRow>(pc)
    40fe:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4102:	7430           	moveq #48,d2
    4104:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    4108:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    410c:	52af 01be      	addq.l #1,446(sp)
    4110:	7011           	moveq #17,d0
    4112:	b0af 01be      	cmp.l 446(sp),d0
    4116:	6cbc           	bge.s 40d4 <TestZoom4Picture+0x1aa>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    4118:	222f 01c2      	move.l 450(sp),d1
    411c:	2001           	move.l d1,d0
    411e:	e788           	lsl.l #3,d0
    4120:	d081           	add.l d1,d0
    4122:	d080           	add.l d0,d0
    4124:	2040           	movea.l d0,a0
    4126:	d1c1           	adda.l d1,a0
    4128:	41e8 0012      	lea 18(a0),a0
    412c:	7000           	moveq #0,d0
    412e:	302f 01c6      	move.w 454(sp),d0
    4132:	2f08           	move.l a0,-(sp)
    4134:	2f00           	move.l d0,-(sp)
    4136:	2f2f 01d0      	move.l 464(sp),-(sp)
    413a:	2f2f 002e      	move.l 46(sp),-(sp)
    413e:	4eba 2c60      	jsr 6da0 <TestRow>(pc)
    4142:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4146:	7230           	moveq #48,d1
    4148:	d3af 01c8      	add.l d1,456(sp)
  for(int i=0;i<14;i++) {
    414c:	52af 01c2      	addq.l #1,450(sp)
    4150:	740d           	moveq #13,d2
    4152:	b4af 01c2      	cmp.l 450(sp),d2
    4156:	6c00 ff76      	bge.w 40ce <TestZoom4Picture+0x1a4>
  }

  for(int i2=0;i2<4;i2++) { 
    415a:	42af 01ba      	clr.l 442(sp)
    415e:	6032           	bra.s 4192 <TestZoom4Picture+0x268>
    TestRow( valsupposed, valactual, mask, i2+265);
    4160:	222f 01ba      	move.l 442(sp),d1
    4164:	0681 0000 0109 	addi.l #265,d1
    416a:	7000           	moveq #0,d0
    416c:	302f 01c6      	move.w 454(sp),d0
    4170:	2f01           	move.l d1,-(sp)
    4172:	2f00           	move.l d0,-(sp)
    4174:	2f2f 01d0      	move.l 464(sp),-(sp)
    4178:	2f2f 002e      	move.l 46(sp),-(sp)
    417c:	4eba 2c22      	jsr 6da0 <TestRow>(pc)
    4180:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4184:	7030           	moveq #48,d0
    4186:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    418a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    418e:	52af 01ba      	addq.l #1,442(sp)
    4192:	7203           	moveq #3,d1
    4194:	b2af 01ba      	cmp.l 442(sp),d1
    4198:	6cc6           	bge.s 4160 <TestZoom4Picture+0x236>
  }
  
  UWORD *tmp = source;
    419a:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    41a0:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    41a6:	2f6f 001e 003a 	move.l 30(sp),58(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    41ac:	4878 0001      	pea 1 <_start+0x1>
    41b0:	4878 0001      	pea 1 <_start+0x1>
    41b4:	2f2f 0042      	move.l 66(sp),-(sp)
    41b8:	2f2f 006a      	move.l 106(sp),-(sp)
    41bc:	4eba d89e      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    41c0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    41c4:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    41ca:	2c40           	movea.l d0,a6
    41cc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    41d0:	242f 003a      	move.l 58(sp),d2
    41d4:	5882           	addq.l #4,d2
    41d6:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom2;
    41da:	2f7c 0001 b790 	move.l #112528,34(sp)
    41e0:	0022 
  mask = 0x0000;
    41e2:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    41e6:	42af 01b6      	clr.l 438(sp)
    41ea:	602a           	bra.s 4216 <TestZoom4Picture+0x2ec>
    TestRow( valsupposed, valactual, mask, i2);
    41ec:	7000           	moveq #0,d0
    41ee:	302f 01c6      	move.w 454(sp),d0
    41f2:	2f2f 01b6      	move.l 438(sp),-(sp)
    41f6:	2f00           	move.l d0,-(sp)
    41f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    41fc:	2f2f 002e      	move.l 46(sp),-(sp)
    4200:	4eba 2b9e      	jsr 6da0 <TestRow>(pc)
    4204:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4208:	7030           	moveq #48,d0
    420a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    420e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    4212:	52af 01b6      	addq.l #1,438(sp)
    4216:	720a           	moveq #10,d1
    4218:	b2af 01b6      	cmp.l 438(sp),d1
    421c:	6cce           	bge.s 41ec <TestZoom4Picture+0x2c2>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    421e:	4878 0008      	pea 8 <GetVBR>
    4222:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4228:	2f2f 01d0      	move.l 464(sp),-(sp)
    422c:	2f2f 002e      	move.l 46(sp),-(sp)
    4230:	4eba 2b6e      	jsr 6da0 <TestRow>(pc)
    4234:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4238:	7430           	moveq #48,d2
    423a:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    423e:	4878 0009      	pea 9 <GetVBR+0x1>
    4242:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4248:	2f2f 01d0      	move.l 464(sp),-(sp)
    424c:	2f2f 002e      	move.l 46(sp),-(sp)
    4250:	4eba 2b4e      	jsr 6da0 <TestRow>(pc)
    4254:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4258:	7030           	moveq #48,d0
    425a:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    425e:	4878 000a      	pea a <GetVBR+0x2>
    4262:	42a7           	clr.l -(sp)
    4264:	2f2f 01d0      	move.l 464(sp),-(sp)
    4268:	2f2f 002e      	move.l 46(sp),-(sp)
    426c:	4eba 2b32      	jsr 6da0 <TestRow>(pc)
    4270:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4274:	7230           	moveq #48,d1
    4276:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    427a:	4878 000b      	pea b <GetVBR+0x3>
    427e:	42a7           	clr.l -(sp)
    4280:	2f2f 01d0      	move.l 464(sp),-(sp)
    4284:	2f2f 002e      	move.l 46(sp),-(sp)
    4288:	4eba 2b16      	jsr 6da0 <TestRow>(pc)
    428c:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    4290:	7430           	moveq #48,d2
    4292:	d5af 01c8      	add.l d2,456(sp)
  for(int i=0;i<12;i++) {
    4296:	42af 01b2      	clr.l 434(sp)
    429a:	6000 0118      	bra.w 43b4 <TestZoom4Picture+0x48a>
    for(int i2=0;i2<16;i2++) {  
    429e:	42af 01ae      	clr.l 430(sp)
    42a2:	603c           	bra.s 42e0 <TestZoom4Picture+0x3b6>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    42a4:	222f 01b2      	move.l 434(sp),d1
    42a8:	2001           	move.l d1,d0
    42aa:	e988           	lsl.l #4,d0
    42ac:	d081           	add.l d1,d0
    42ae:	2040           	movea.l d0,a0
    42b0:	d1ef 01ae      	adda.l 430(sp),a0
    42b4:	41e8 000b      	lea 11(a0),a0
    42b8:	7000           	moveq #0,d0
    42ba:	302f 01c6      	move.w 454(sp),d0
    42be:	2f08           	move.l a0,-(sp)
    42c0:	2f00           	move.l d0,-(sp)
    42c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    42c6:	2f2f 002e      	move.l 46(sp),-(sp)
    42ca:	4eba 2ad4      	jsr 6da0 <TestRow>(pc)
    42ce:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    42d2:	7030           	moveq #48,d0
    42d4:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    42d8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    42dc:	52af 01ae      	addq.l #1,430(sp)
    42e0:	720f           	moveq #15,d1
    42e2:	b2af 01ae      	cmp.l 430(sp),d1
    42e6:	6cbc           	bge.s 42a4 <TestZoom4Picture+0x37a>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    42e8:	222f 01b2      	move.l 434(sp),d1
    42ec:	2001           	move.l d1,d0
    42ee:	e988           	lsl.l #4,d0
    42f0:	2040           	movea.l d0,a0
    42f2:	d1c1           	adda.l d1,a0
    42f4:	41e8 0018      	lea 24(a0),a0
    42f8:	7000           	moveq #0,d0
    42fa:	302f 01c6      	move.w 454(sp),d0
    42fe:	2f08           	move.l a0,-(sp)
    4300:	2f00           	move.l d0,-(sp)
    4302:	2f2f 01d0      	move.l 464(sp),-(sp)
    4306:	2f2f 002e      	move.l 46(sp),-(sp)
    430a:	4eba 2a94      	jsr 6da0 <TestRow>(pc)
    430e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4312:	7430           	moveq #48,d2
    4314:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    4318:	222f 01b2      	move.l 434(sp),d1
    431c:	2001           	move.l d1,d0
    431e:	e988           	lsl.l #4,d0
    4320:	2040           	movea.l d0,a0
    4322:	d1c1           	adda.l d1,a0
    4324:	41e8 0019      	lea 25(a0),a0
    4328:	7000           	moveq #0,d0
    432a:	302f 01c6      	move.w 454(sp),d0
    432e:	2f08           	move.l a0,-(sp)
    4330:	2f00           	move.l d0,-(sp)
    4332:	2f2f 01d0      	move.l 464(sp),-(sp)
    4336:	2f2f 002e      	move.l 46(sp),-(sp)
    433a:	4eba 2a64      	jsr 6da0 <TestRow>(pc)
    433e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4342:	7030           	moveq #48,d0
    4344:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4348:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    434c:	222f 01b2      	move.l 434(sp),d1
    4350:	2001           	move.l d1,d0
    4352:	e988           	lsl.l #4,d0
    4354:	2040           	movea.l d0,a0
    4356:	d1c1           	adda.l d1,a0
    4358:	41e8 001a      	lea 26(a0),a0
    435c:	7000           	moveq #0,d0
    435e:	302f 01c6      	move.w 454(sp),d0
    4362:	2f08           	move.l a0,-(sp)
    4364:	2f00           	move.l d0,-(sp)
    4366:	2f2f 01d0      	move.l 464(sp),-(sp)
    436a:	2f2f 002e      	move.l 46(sp),-(sp)
    436e:	4eba 2a30      	jsr 6da0 <TestRow>(pc)
    4372:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4376:	7230           	moveq #48,d1
    4378:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    437c:	222f 01b2      	move.l 434(sp),d1
    4380:	2001           	move.l d1,d0
    4382:	e988           	lsl.l #4,d0
    4384:	2040           	movea.l d0,a0
    4386:	d1c1           	adda.l d1,a0
    4388:	41e8 001b      	lea 27(a0),a0
    438c:	7000           	moveq #0,d0
    438e:	302f 01c6      	move.w 454(sp),d0
    4392:	2f08           	move.l a0,-(sp)
    4394:	2f00           	move.l d0,-(sp)
    4396:	2f2f 01d0      	move.l 464(sp),-(sp)
    439a:	2f2f 002e      	move.l 46(sp),-(sp)
    439e:	4eba 2a00      	jsr 6da0 <TestRow>(pc)
    43a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43a6:	7430           	moveq #48,d2
    43a8:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    43ac:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    43b0:	52af 01b2      	addq.l #1,434(sp)
    43b4:	700b           	moveq #11,d0
    43b6:	b0af 01b2      	cmp.l 434(sp),d0
    43ba:	6c00 fee2      	bge.w 429e <TestZoom4Picture+0x374>
    
  }

  for(int i2=0;i2<15;i2++) { 
    43be:	42af 01aa      	clr.l 426(sp)
    43c2:	602a           	bra.s 43ee <TestZoom4Picture+0x4c4>
    TestRow( valsupposed, valactual, mask, i2);
    43c4:	7000           	moveq #0,d0
    43c6:	302f 01c6      	move.w 454(sp),d0
    43ca:	2f2f 01aa      	move.l 426(sp),-(sp)
    43ce:	2f00           	move.l d0,-(sp)
    43d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    43d4:	2f2f 002e      	move.l 46(sp),-(sp)
    43d8:	4eba 29c6      	jsr 6da0 <TestRow>(pc)
    43dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    43e0:	7230           	moveq #48,d1
    43e2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    43e6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    43ea:	52af 01aa      	addq.l #1,426(sp)
    43ee:	740e           	moveq #14,d2
    43f0:	b4af 01aa      	cmp.l 426(sp),d2
    43f4:	6cce           	bge.s 43c4 <TestZoom4Picture+0x49a>
  }

  tmp = source;
    43f6:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    43fc:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4402:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    4408:	4878 0001      	pea 1 <_start+0x1>
    440c:	4878 0002      	pea 2 <_start+0x2>
    4410:	2f2f 0042      	move.l 66(sp),-(sp)
    4414:	2f2f 006a      	move.l 106(sp),-(sp)
    4418:	4eba d642      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    441c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4420:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    4426:	2c40           	movea.l d0,a6
    4428:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    442c:	202f 003a      	move.l 58(sp),d0
    4430:	5880           	addq.l #4,d0
    4432:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    4436:	2f7c 0001 b7bc 	move.l #112572,34(sp)
    443c:	0022 
  mask = 0xffff;
    443e:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    4444:	42af 01a6      	clr.l 422(sp)
    4448:	602a           	bra.s 4474 <TestZoom4Picture+0x54a>
    TestRow( valsupposed, valactual, mask, i2);
    444a:	7000           	moveq #0,d0
    444c:	302f 01c6      	move.w 454(sp),d0
    4450:	2f2f 01a6      	move.l 422(sp),-(sp)
    4454:	2f00           	move.l d0,-(sp)
    4456:	2f2f 01d0      	move.l 464(sp),-(sp)
    445a:	2f2f 002e      	move.l 46(sp),-(sp)
    445e:	4eba 2940      	jsr 6da0 <TestRow>(pc)
    4462:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4466:	7230           	moveq #48,d1
    4468:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    446c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    4470:	52af 01a6      	addq.l #1,422(sp)
    4474:	7403           	moveq #3,d2
    4476:	b4af 01a6      	cmp.l 422(sp),d2
    447a:	6cce           	bge.s 444a <TestZoom4Picture+0x520>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    447c:	4878 0004      	pea 4 <_start+0x4>
    4480:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4486:	2f2f 01d0      	move.l 464(sp),-(sp)
    448a:	2f2f 002e      	move.l 46(sp),-(sp)
    448e:	4eba 2910      	jsr 6da0 <TestRow>(pc)
    4492:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4496:	7030           	moveq #48,d0
    4498:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    449c:	4878 0005      	pea 5 <_start+0x5>
    44a0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44a6:	2f2f 01d0      	move.l 464(sp),-(sp)
    44aa:	2f2f 002e      	move.l 46(sp),-(sp)
    44ae:	4eba 28f0      	jsr 6da0 <TestRow>(pc)
    44b2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44b6:	7230           	moveq #48,d1
    44b8:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    44bc:	4878 0006      	pea 6 <_start+0x6>
    44c0:	42a7           	clr.l -(sp)
    44c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    44c6:	2f2f 002e      	move.l 46(sp),-(sp)
    44ca:	4eba 28d4      	jsr 6da0 <TestRow>(pc)
    44ce:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44d2:	7430           	moveq #48,d2
    44d4:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    44d8:	4878 0007      	pea 7 <_start+0x7>
    44dc:	42a7           	clr.l -(sp)
    44de:	2f2f 01d0      	move.l 464(sp),-(sp)
    44e2:	2f2f 002e      	move.l 46(sp),-(sp)
    44e6:	4eba 28b8      	jsr 6da0 <TestRow>(pc)
    44ea:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44ee:	7030           	moveq #48,d0
    44f0:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    44f4:	4878 0008      	pea 8 <GetVBR>
    44f8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    44fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4502:	2f2f 002e      	move.l 46(sp),-(sp)
    4506:	4eba 2898      	jsr 6da0 <TestRow>(pc)
    450a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    450e:	7230           	moveq #48,d1
    4510:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    4514:	4878 0009      	pea 9 <GetVBR+0x1>
    4518:	2f3c 0000 ffff 	move.l #65535,-(sp)
    451e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4522:	2f2f 002e      	move.l 46(sp),-(sp)
    4526:	4eba 2878      	jsr 6da0 <TestRow>(pc)
    452a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    452e:	7430           	moveq #48,d2
    4530:	d5af 01c8      	add.l d2,456(sp)

  mask = 0x0000;
    4534:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    4538:	42af 01a2      	clr.l 418(sp)
    453c:	6000 01aa      	bra.w 46e8 <TestZoom4Picture+0x7be>
    for(int i2=0;i2<15;i2++) {  
    4540:	42af 019e      	clr.l 414(sp)
    4544:	6046           	bra.s 458c <TestZoom4Picture+0x662>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4546:	222f 01a2      	move.l 418(sp),d1
    454a:	2001           	move.l d1,d0
    454c:	d080           	add.l d0,d0
    454e:	d081           	add.l d1,d0
    4550:	2200           	move.l d0,d1
    4552:	e789           	lsl.l #3,d1
    4554:	2401           	move.l d1,d2
    4556:	9480           	sub.l d0,d2
    4558:	2002           	move.l d2,d0
    455a:	2040           	movea.l d0,a0
    455c:	d1ef 019e      	adda.l 414(sp),a0
    4560:	41e8 0009      	lea 9(a0),a0
    4564:	7000           	moveq #0,d0
    4566:	302f 01c6      	move.w 454(sp),d0
    456a:	2f08           	move.l a0,-(sp)
    456c:	2f00           	move.l d0,-(sp)
    456e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4572:	2f2f 002e      	move.l 46(sp),-(sp)
    4576:	4eba 2828      	jsr 6da0 <TestRow>(pc)
    457a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    457e:	7030           	moveq #48,d0
    4580:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4584:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    4588:	52af 019e      	addq.l #1,414(sp)
    458c:	720e           	moveq #14,d1
    458e:	b2af 019e      	cmp.l 414(sp),d1
    4592:	6cb2           	bge.s 4546 <TestZoom4Picture+0x61c>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4594:	222f 01a2      	move.l 418(sp),d1
    4598:	2001           	move.l d1,d0
    459a:	d080           	add.l d0,d0
    459c:	d081           	add.l d1,d0
    459e:	2200           	move.l d0,d1
    45a0:	e789           	lsl.l #3,d1
    45a2:	2041           	movea.l d1,a0
    45a4:	91c0           	suba.l d0,a0
    45a6:	41e8 0018      	lea 24(a0),a0
    45aa:	7000           	moveq #0,d0
    45ac:	302f 01c6      	move.w 454(sp),d0
    45b0:	2f08           	move.l a0,-(sp)
    45b2:	2f00           	move.l d0,-(sp)
    45b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    45b8:	2f2f 002e      	move.l 46(sp),-(sp)
    45bc:	4eba 27e2      	jsr 6da0 <TestRow>(pc)
    45c0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45c4:	7430           	moveq #48,d2
    45c6:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    45ca:	222f 01a2      	move.l 418(sp),d1
    45ce:	2001           	move.l d1,d0
    45d0:	d080           	add.l d0,d0
    45d2:	d081           	add.l d1,d0
    45d4:	2200           	move.l d0,d1
    45d6:	e789           	lsl.l #3,d1
    45d8:	2041           	movea.l d1,a0
    45da:	91c0           	suba.l d0,a0
    45dc:	41e8 0019      	lea 25(a0),a0
    45e0:	7000           	moveq #0,d0
    45e2:	302f 01c6      	move.w 454(sp),d0
    45e6:	2f08           	move.l a0,-(sp)
    45e8:	2f00           	move.l d0,-(sp)
    45ea:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ee:	2f2f 002e      	move.l 46(sp),-(sp)
    45f2:	4eba 27ac      	jsr 6da0 <TestRow>(pc)
    45f6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    45fa:	7030           	moveq #48,d0
    45fc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4600:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    4604:	222f 01a2      	move.l 418(sp),d1
    4608:	2001           	move.l d1,d0
    460a:	d080           	add.l d0,d0
    460c:	d081           	add.l d1,d0
    460e:	2200           	move.l d0,d1
    4610:	e789           	lsl.l #3,d1
    4612:	2041           	movea.l d1,a0
    4614:	91c0           	suba.l d0,a0
    4616:	41e8 001a      	lea 26(a0),a0
    461a:	7000           	moveq #0,d0
    461c:	302f 01c6      	move.w 454(sp),d0
    4620:	2f08           	move.l a0,-(sp)
    4622:	2f00           	move.l d0,-(sp)
    4624:	2f2f 01d0      	move.l 464(sp),-(sp)
    4628:	2f2f 002e      	move.l 46(sp),-(sp)
    462c:	4eba 2772      	jsr 6da0 <TestRow>(pc)
    4630:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4634:	7230           	moveq #48,d1
    4636:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    463a:	222f 01a2      	move.l 418(sp),d1
    463e:	2001           	move.l d1,d0
    4640:	d080           	add.l d0,d0
    4642:	d081           	add.l d1,d0
    4644:	2200           	move.l d0,d1
    4646:	e789           	lsl.l #3,d1
    4648:	2041           	movea.l d1,a0
    464a:	91c0           	suba.l d0,a0
    464c:	41e8 001b      	lea 27(a0),a0
    4650:	7000           	moveq #0,d0
    4652:	302f 01c6      	move.w 454(sp),d0
    4656:	2f08           	move.l a0,-(sp)
    4658:	2f00           	move.l d0,-(sp)
    465a:	2f2f 01d0      	move.l 464(sp),-(sp)
    465e:	2f2f 002e      	move.l 46(sp),-(sp)
    4662:	4eba 273c      	jsr 6da0 <TestRow>(pc)
    4666:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    466a:	7430           	moveq #48,d2
    466c:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4670:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4674:	222f 01a2      	move.l 418(sp),d1
    4678:	2001           	move.l d1,d0
    467a:	d080           	add.l d0,d0
    467c:	d081           	add.l d1,d0
    467e:	2200           	move.l d0,d1
    4680:	e789           	lsl.l #3,d1
    4682:	2041           	movea.l d1,a0
    4684:	91c0           	suba.l d0,a0
    4686:	41e8 001c      	lea 28(a0),a0
    468a:	7000           	moveq #0,d0
    468c:	302f 01c6      	move.w 454(sp),d0
    4690:	2f08           	move.l a0,-(sp)
    4692:	2f00           	move.l d0,-(sp)
    4694:	2f2f 01d0      	move.l 464(sp),-(sp)
    4698:	2f2f 002e      	move.l 46(sp),-(sp)
    469c:	4eba 2702      	jsr 6da0 <TestRow>(pc)
    46a0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46a4:	7030           	moveq #48,d0
    46a6:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    46aa:	222f 01a2      	move.l 418(sp),d1
    46ae:	2001           	move.l d1,d0
    46b0:	d080           	add.l d0,d0
    46b2:	d081           	add.l d1,d0
    46b4:	2200           	move.l d0,d1
    46b6:	e789           	lsl.l #3,d1
    46b8:	2041           	movea.l d1,a0
    46ba:	91c0           	suba.l d0,a0
    46bc:	41e8 001d      	lea 29(a0),a0
    46c0:	7000           	moveq #0,d0
    46c2:	302f 01c6      	move.w 454(sp),d0
    46c6:	2f08           	move.l a0,-(sp)
    46c8:	2f00           	move.l d0,-(sp)
    46ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    46ce:	2f2f 002e      	move.l 46(sp),-(sp)
    46d2:	4eba 26cc      	jsr 6da0 <TestRow>(pc)
    46d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46da:	7230           	moveq #48,d1
    46dc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    46e0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    46e4:	52af 01a2      	addq.l #1,418(sp)
    46e8:	740b           	moveq #11,d2
    46ea:	b4af 01a2      	cmp.l 418(sp),d2
    46ee:	6c00 fe50      	bge.w 4540 <TestZoom4Picture+0x616>
  }

  for(int i2=0;i2<8;i2++) {  
    46f2:	42af 019a      	clr.l 410(sp)
    46f6:	6032           	bra.s 472a <TestZoom4Picture+0x800>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    46f8:	222f 019a      	move.l 410(sp),d1
    46fc:	0681 0000 0105 	addi.l #261,d1
    4702:	7000           	moveq #0,d0
    4704:	302f 01c6      	move.w 454(sp),d0
    4708:	2f01           	move.l d1,-(sp)
    470a:	2f00           	move.l d0,-(sp)
    470c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4710:	2f2f 002e      	move.l 46(sp),-(sp)
    4714:	4eba 268a      	jsr 6da0 <TestRow>(pc)
    4718:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    471c:	7030           	moveq #48,d0
    471e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4722:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4726:	52af 019a      	addq.l #1,410(sp)
    472a:	7207           	moveq #7,d1
    472c:	b2af 019a      	cmp.l 410(sp),d1
    4730:	6cc6           	bge.s 46f8 <TestZoom4Picture+0x7ce>
  }

  tmp = source;
    4732:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    4738:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    473e:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    4744:	4878 0001      	pea 1 <_start+0x1>
    4748:	4878 0003      	pea 3 <_start+0x3>
    474c:	2f2f 0042      	move.l 66(sp),-(sp)
    4750:	2f2f 006a      	move.l 106(sp),-(sp)
    4754:	4eba d306      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    4758:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    475c:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    4762:	2c40           	movea.l d0,a6
    4764:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4768:	242f 003a      	move.l 58(sp),d2
    476c:	5882           	addq.l #4,d2
    476e:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom4;
    4772:	2f7c 0001 b7e8 	move.l #112616,34(sp)
    4778:	0022 
  mask = 0x0000;
    477a:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    477e:	4878 0007      	pea 7 <_start+0x7>
    4782:	42a7           	clr.l -(sp)
    4784:	2f2f 01d0      	move.l 464(sp),-(sp)
    4788:	2f2f 002e      	move.l 46(sp),-(sp)
    478c:	4eba 2612      	jsr 6da0 <TestRow>(pc)
    4790:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4794:	7030           	moveq #48,d0
    4796:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    479a:	4878 0008      	pea 8 <GetVBR>
    479e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    47a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    47a8:	2f2f 002e      	move.l 46(sp),-(sp)
    47ac:	4eba 25f2      	jsr 6da0 <TestRow>(pc)
    47b0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    47b4:	7230           	moveq #48,d1
    47b6:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    47ba:	4878 0009      	pea 9 <GetVBR+0x1>
    47be:	2f3c 0000 ffff 	move.l #65535,-(sp)
    47c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    47c8:	2f2f 002e      	move.l 46(sp),-(sp)
    47cc:	4eba 25d2      	jsr 6da0 <TestRow>(pc)
    47d0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    47d4:	7430           	moveq #48,d2
    47d6:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    47da:	4878 0008      	pea 8 <GetVBR>
    47de:	42a7           	clr.l -(sp)
    47e0:	2f2f 01d0      	move.l 464(sp),-(sp)
    47e4:	2f2f 002e      	move.l 46(sp),-(sp)
    47e8:	4eba 25b6      	jsr 6da0 <TestRow>(pc)
    47ec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    47f0:	7030           	moveq #48,d0
    47f2:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    47f6:	4878 0009      	pea 9 <GetVBR+0x1>
    47fa:	42a7           	clr.l -(sp)
    47fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4800:	2f2f 002e      	move.l 46(sp),-(sp)
    4804:	4eba 259a      	jsr 6da0 <TestRow>(pc)
    4808:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    480c:	7230           	moveq #48,d1
    480e:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    4812:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    4818:	42af 0196      	clr.l 406(sp)
    481c:	6000 021a      	bra.w 4a38 <TestZoom4Picture+0xb0e>
    for(int i2=0;i2<14;i2++) {  
    4820:	42af 0192      	clr.l 402(sp)
    4824:	6046           	bra.s 486c <TestZoom4Picture+0x942>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    4826:	222f 0196      	move.l 406(sp),d1
    482a:	2001           	move.l d1,d0
    482c:	d080           	add.l d0,d0
    482e:	d081           	add.l d1,d0
    4830:	2200           	move.l d0,d1
    4832:	e789           	lsl.l #3,d1
    4834:	2401           	move.l d1,d2
    4836:	9480           	sub.l d0,d2
    4838:	2002           	move.l d2,d0
    483a:	2040           	movea.l d0,a0
    483c:	d1ef 0192      	adda.l 402(sp),a0
    4840:	41e8 0009      	lea 9(a0),a0
    4844:	7000           	moveq #0,d0
    4846:	302f 01c6      	move.w 454(sp),d0
    484a:	2f08           	move.l a0,-(sp)
    484c:	2f00           	move.l d0,-(sp)
    484e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4852:	2f2f 002e      	move.l 46(sp),-(sp)
    4856:	4eba 2548      	jsr 6da0 <TestRow>(pc)
    485a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    485e:	7030           	moveq #48,d0
    4860:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4864:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    4868:	52af 0192      	addq.l #1,402(sp)
    486c:	720d           	moveq #13,d1
    486e:	b2af 0192      	cmp.l 402(sp),d1
    4872:	6cb2           	bge.s 4826 <TestZoom4Picture+0x8fc>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    4874:	222f 0196      	move.l 406(sp),d1
    4878:	2001           	move.l d1,d0
    487a:	d080           	add.l d0,d0
    487c:	d081           	add.l d1,d0
    487e:	2200           	move.l d0,d1
    4880:	e789           	lsl.l #3,d1
    4882:	2041           	movea.l d1,a0
    4884:	91c0           	suba.l d0,a0
    4886:	41e8 0018      	lea 24(a0),a0
    488a:	7000           	moveq #0,d0
    488c:	302f 01c6      	move.w 454(sp),d0
    4890:	2f08           	move.l a0,-(sp)
    4892:	2f00           	move.l d0,-(sp)
    4894:	2f2f 01d0      	move.l 464(sp),-(sp)
    4898:	2f2f 002e      	move.l 46(sp),-(sp)
    489c:	4eba 2502      	jsr 6da0 <TestRow>(pc)
    48a0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48a4:	7430           	moveq #48,d2
    48a6:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    48aa:	222f 0196      	move.l 406(sp),d1
    48ae:	2001           	move.l d1,d0
    48b0:	d080           	add.l d0,d0
    48b2:	d081           	add.l d1,d0
    48b4:	2200           	move.l d0,d1
    48b6:	e789           	lsl.l #3,d1
    48b8:	2041           	movea.l d1,a0
    48ba:	91c0           	suba.l d0,a0
    48bc:	41e8 0019      	lea 25(a0),a0
    48c0:	7000           	moveq #0,d0
    48c2:	302f 01c6      	move.w 454(sp),d0
    48c6:	2f08           	move.l a0,-(sp)
    48c8:	2f00           	move.l d0,-(sp)
    48ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    48ce:	2f2f 002e      	move.l 46(sp),-(sp)
    48d2:	4eba 24cc      	jsr 6da0 <TestRow>(pc)
    48d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    48da:	7030           	moveq #48,d0
    48dc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    48e0:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    48e4:	222f 0196      	move.l 406(sp),d1
    48e8:	2001           	move.l d1,d0
    48ea:	d080           	add.l d0,d0
    48ec:	d081           	add.l d1,d0
    48ee:	2200           	move.l d0,d1
    48f0:	e789           	lsl.l #3,d1
    48f2:	2041           	movea.l d1,a0
    48f4:	91c0           	suba.l d0,a0
    48f6:	41e8 001a      	lea 26(a0),a0
    48fa:	7000           	moveq #0,d0
    48fc:	302f 01c6      	move.w 454(sp),d0
    4900:	2f08           	move.l a0,-(sp)
    4902:	2f00           	move.l d0,-(sp)
    4904:	2f2f 01d0      	move.l 464(sp),-(sp)
    4908:	2f2f 002e      	move.l 46(sp),-(sp)
    490c:	4eba 2492      	jsr 6da0 <TestRow>(pc)
    4910:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4914:	7230           	moveq #48,d1
    4916:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    491a:	222f 0196      	move.l 406(sp),d1
    491e:	2001           	move.l d1,d0
    4920:	d080           	add.l d0,d0
    4922:	d081           	add.l d1,d0
    4924:	2200           	move.l d0,d1
    4926:	e789           	lsl.l #3,d1
    4928:	2041           	movea.l d1,a0
    492a:	91c0           	suba.l d0,a0
    492c:	41e8 001b      	lea 27(a0),a0
    4930:	7000           	moveq #0,d0
    4932:	302f 01c6      	move.w 454(sp),d0
    4936:	2f08           	move.l a0,-(sp)
    4938:	2f00           	move.l d0,-(sp)
    493a:	2f2f 01d0      	move.l 464(sp),-(sp)
    493e:	2f2f 002e      	move.l 46(sp),-(sp)
    4942:	4eba 245c      	jsr 6da0 <TestRow>(pc)
    4946:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    494a:	7430           	moveq #48,d2
    494c:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4950:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    4954:	222f 0196      	move.l 406(sp),d1
    4958:	2001           	move.l d1,d0
    495a:	d080           	add.l d0,d0
    495c:	d081           	add.l d1,d0
    495e:	2200           	move.l d0,d1
    4960:	e789           	lsl.l #3,d1
    4962:	2041           	movea.l d1,a0
    4964:	91c0           	suba.l d0,a0
    4966:	41e8 001c      	lea 28(a0),a0
    496a:	7000           	moveq #0,d0
    496c:	302f 01c6      	move.w 454(sp),d0
    4970:	2f08           	move.l a0,-(sp)
    4972:	2f00           	move.l d0,-(sp)
    4974:	2f2f 01d0      	move.l 464(sp),-(sp)
    4978:	2f2f 002e      	move.l 46(sp),-(sp)
    497c:	4eba 2422      	jsr 6da0 <TestRow>(pc)
    4980:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4984:	7030           	moveq #48,d0
    4986:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    498a:	222f 0196      	move.l 406(sp),d1
    498e:	2001           	move.l d1,d0
    4990:	d080           	add.l d0,d0
    4992:	d081           	add.l d1,d0
    4994:	2200           	move.l d0,d1
    4996:	e789           	lsl.l #3,d1
    4998:	2041           	movea.l d1,a0
    499a:	91c0           	suba.l d0,a0
    499c:	41e8 001d      	lea 29(a0),a0
    49a0:	7000           	moveq #0,d0
    49a2:	302f 01c6      	move.w 454(sp),d0
    49a6:	2f08           	move.l a0,-(sp)
    49a8:	2f00           	move.l d0,-(sp)
    49aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ae:	2f2f 002e      	move.l 46(sp),-(sp)
    49b2:	4eba 23ec      	jsr 6da0 <TestRow>(pc)
    49b6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    49ba:	7230           	moveq #48,d1
    49bc:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    49c0:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    49c4:	222f 0196      	move.l 406(sp),d1
    49c8:	2001           	move.l d1,d0
    49ca:	d080           	add.l d0,d0
    49cc:	d081           	add.l d1,d0
    49ce:	2200           	move.l d0,d1
    49d0:	e789           	lsl.l #3,d1
    49d2:	2041           	movea.l d1,a0
    49d4:	91c0           	suba.l d0,a0
    49d6:	41e8 001c      	lea 28(a0),a0
    49da:	7000           	moveq #0,d0
    49dc:	302f 01c6      	move.w 454(sp),d0
    49e0:	2f08           	move.l a0,-(sp)
    49e2:	2f00           	move.l d0,-(sp)
    49e4:	2f2f 01d0      	move.l 464(sp),-(sp)
    49e8:	2f2f 002e      	move.l 46(sp),-(sp)
    49ec:	4eba 23b2      	jsr 6da0 <TestRow>(pc)
    49f0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    49f4:	7430           	moveq #48,d2
    49f6:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    49fa:	222f 0196      	move.l 406(sp),d1
    49fe:	2001           	move.l d1,d0
    4a00:	d080           	add.l d0,d0
    4a02:	d081           	add.l d1,d0
    4a04:	2200           	move.l d0,d1
    4a06:	e789           	lsl.l #3,d1
    4a08:	2041           	movea.l d1,a0
    4a0a:	91c0           	suba.l d0,a0
    4a0c:	41e8 001d      	lea 29(a0),a0
    4a10:	7000           	moveq #0,d0
    4a12:	302f 01c6      	move.w 454(sp),d0
    4a16:	2f08           	move.l a0,-(sp)
    4a18:	2f00           	move.l d0,-(sp)
    4a1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a1e:	2f2f 002e      	move.l 46(sp),-(sp)
    4a22:	4eba 237c      	jsr 6da0 <TestRow>(pc)
    4a26:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4a2a:	7030           	moveq #48,d0
    4a2c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4a30:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    4a34:	52af 0196      	addq.l #1,406(sp)
    4a38:	720b           	moveq #11,d1
    4a3a:	b2af 0196      	cmp.l 406(sp),d1
    4a3e:	6c00 fde0      	bge.w 4820 <TestZoom4Picture+0x8f6>
  }

  TestRow( valsupposed, valactual, mask, 269);
    4a42:	7000           	moveq #0,d0
    4a44:	302f 01c6      	move.w 454(sp),d0
    4a48:	4878 010d      	pea 10d <WaitBlt+0x2d>
    4a4c:	2f00           	move.l d0,-(sp)
    4a4e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a52:	2f2f 002e      	move.l 46(sp),-(sp)
    4a56:	4eba 2348      	jsr 6da0 <TestRow>(pc)
    4a5a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a5e:	7430           	moveq #48,d2
    4a60:	d5af 01c8      	add.l d2,456(sp)
  
  tmp = source;
    4a64:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    4a6a:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4a70:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    4a76:	4878 0001      	pea 1 <_start+0x1>
    4a7a:	4878 0004      	pea 4 <_start+0x4>
    4a7e:	2f2f 0042      	move.l 66(sp),-(sp)
    4a82:	2f2f 006a      	move.l 106(sp),-(sp)
    4a86:	4eba cfd4      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    4a8a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4a8e:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    4a94:	2c40           	movea.l d0,a6
    4a96:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    4a9a:	202f 003a      	move.l 58(sp),d0
    4a9e:	5880           	addq.l #4,d0
    4aa0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    4aa4:	2f7c 0001 b814 	move.l #112660,34(sp)
    4aaa:	0022 
  mask = 0x0000;
    4aac:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    4ab0:	42af 018e      	clr.l 398(sp)
    4ab4:	602a           	bra.s 4ae0 <TestZoom4Picture+0xbb6>
    TestRow( valsupposed, valactual, mask, i2);
    4ab6:	7000           	moveq #0,d0
    4ab8:	302f 01c6      	move.w 454(sp),d0
    4abc:	2f2f 018e      	move.l 398(sp),-(sp)
    4ac0:	2f00           	move.l d0,-(sp)
    4ac2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ac6:	2f2f 002e      	move.l 46(sp),-(sp)
    4aca:	4eba 22d4      	jsr 6da0 <TestRow>(pc)
    4ace:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ad2:	7230           	moveq #48,d1
    4ad4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4ad8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4adc:	52af 018e      	addq.l #1,398(sp)
    4ae0:	740c           	moveq #12,d2
    4ae2:	b4af 018e      	cmp.l 398(sp),d2
    4ae6:	6cce           	bge.s 4ab6 <TestZoom4Picture+0xb8c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    4ae8:	7000           	moveq #0,d0
    4aea:	302f 01c6      	move.w 454(sp),d0
    4aee:	4878 000c      	pea c <GetVBR+0x4>
    4af2:	2f00           	move.l d0,-(sp)
    4af4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4af8:	2f2f 002e      	move.l 46(sp),-(sp)
    4afc:	4eba 22a2      	jsr 6da0 <TestRow>(pc)
    4b00:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b04:	7030           	moveq #48,d0
    4b06:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    4b0a:	7000           	moveq #0,d0
    4b0c:	302f 01c6      	move.w 454(sp),d0
    4b10:	4878 000d      	pea d <GetVBR+0x5>
    4b14:	2f00           	move.l d0,-(sp)
    4b16:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b1a:	2f2f 002e      	move.l 46(sp),-(sp)
    4b1e:	4eba 2280      	jsr 6da0 <TestRow>(pc)
    4b22:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b26:	7230           	moveq #48,d1
    4b28:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4b2c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    4b30:	7000           	moveq #0,d0
    4b32:	302f 01c6      	move.w 454(sp),d0
    4b36:	4878 000e      	pea e <GetVBR+0x6>
    4b3a:	2f00           	move.l d0,-(sp)
    4b3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b40:	2f2f 002e      	move.l 46(sp),-(sp)
    4b44:	4eba 225a      	jsr 6da0 <TestRow>(pc)
    4b48:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b4c:	7430           	moveq #48,d2
    4b4e:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    4b52:	7000           	moveq #0,d0
    4b54:	302f 01c6      	move.w 454(sp),d0
    4b58:	4878 000f      	pea f <GetVBR+0x7>
    4b5c:	2f00           	move.l d0,-(sp)
    4b5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b62:	2f2f 002e      	move.l 46(sp),-(sp)
    4b66:	4eba 2238      	jsr 6da0 <TestRow>(pc)
    4b6a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b6e:	7030           	moveq #48,d0
    4b70:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4b74:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    4b78:	7000           	moveq #0,d0
    4b7a:	302f 01c6      	move.w 454(sp),d0
    4b7e:	4878 0010      	pea 10 <GetVBR+0x8>
    4b82:	2f00           	move.l d0,-(sp)
    4b84:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b88:	2f2f 002e      	move.l 46(sp),-(sp)
    4b8c:	4eba 2212      	jsr 6da0 <TestRow>(pc)
    4b90:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4b94:	7230           	moveq #48,d1
    4b96:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    4b9a:	7000           	moveq #0,d0
    4b9c:	302f 01c6      	move.w 454(sp),d0
    4ba0:	4878 0011      	pea 11 <GetVBR+0x9>
    4ba4:	2f00           	move.l d0,-(sp)
    4ba6:	2f2f 01d0      	move.l 464(sp),-(sp)
    4baa:	2f2f 002e      	move.l 46(sp),-(sp)
    4bae:	4eba 21f0      	jsr 6da0 <TestRow>(pc)
    4bb2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4bb6:	7430           	moveq #48,d2
    4bb8:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    4bbc:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    4bc0:	7000           	moveq #0,d0
    4bc2:	302f 01c6      	move.w 454(sp),d0
    4bc6:	4878 0012      	pea 12 <GetVBR+0xa>
    4bca:	2f00           	move.l d0,-(sp)
    4bcc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bd0:	2f2f 002e      	move.l 46(sp),-(sp)
    4bd4:	4eba 21ca      	jsr 6da0 <TestRow>(pc)
    4bd8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4bdc:	7030           	moveq #48,d0
    4bde:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    4be2:	7000           	moveq #0,d0
    4be4:	302f 01c6      	move.w 454(sp),d0
    4be8:	4878 0013      	pea 13 <GetVBR+0xb>
    4bec:	2f00           	move.l d0,-(sp)
    4bee:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bf2:	2f2f 002e      	move.l 46(sp),-(sp)
    4bf6:	4eba 21a8      	jsr 6da0 <TestRow>(pc)
    4bfa:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4bfe:	7230           	moveq #48,d1
    4c00:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4c04:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    4c08:	7000           	moveq #0,d0
    4c0a:	302f 01c6      	move.w 454(sp),d0
    4c0e:	4878 0014      	pea 14 <GetVBR+0xc>
    4c12:	2f00           	move.l d0,-(sp)
    4c14:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c18:	2f2f 002e      	move.l 46(sp),-(sp)
    4c1c:	4eba 2182      	jsr 6da0 <TestRow>(pc)
    4c20:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c24:	7430           	moveq #48,d2
    4c26:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    4c2a:	7000           	moveq #0,d0
    4c2c:	302f 01c6      	move.w 454(sp),d0
    4c30:	4878 0015      	pea 15 <GetVBR+0xd>
    4c34:	2f00           	move.l d0,-(sp)
    4c36:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c3a:	2f2f 002e      	move.l 46(sp),-(sp)
    4c3e:	4eba 2160      	jsr 6da0 <TestRow>(pc)
    4c42:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4c46:	7030           	moveq #48,d0
    4c48:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4c4c:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    4c50:	42af 018a      	clr.l 394(sp)
    4c54:	6000 028a      	bra.w 4ee0 <TestZoom4Picture+0xfb6>
    for(int i2=0;i2<13;i2++) {  
    4c58:	42af 0186      	clr.l 390(sp)
    4c5c:	6046           	bra.s 4ca4 <TestZoom4Picture+0xd7a>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    4c5e:	222f 018a      	move.l 394(sp),d1
    4c62:	2001           	move.l d1,d0
    4c64:	d080           	add.l d0,d0
    4c66:	d081           	add.l d1,d0
    4c68:	2200           	move.l d0,d1
    4c6a:	e789           	lsl.l #3,d1
    4c6c:	2401           	move.l d1,d2
    4c6e:	9480           	sub.l d0,d2
    4c70:	2002           	move.l d2,d0
    4c72:	2040           	movea.l d0,a0
    4c74:	d1ef 0186      	adda.l 390(sp),a0
    4c78:	41e8 0016      	lea 22(a0),a0
    4c7c:	7000           	moveq #0,d0
    4c7e:	302f 01c6      	move.w 454(sp),d0
    4c82:	2f08           	move.l a0,-(sp)
    4c84:	2f00           	move.l d0,-(sp)
    4c86:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c8a:	2f2f 002e      	move.l 46(sp),-(sp)
    4c8e:	4eba 2110      	jsr 6da0 <TestRow>(pc)
    4c92:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4c96:	7030           	moveq #48,d0
    4c98:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4c9c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    4ca0:	52af 0186      	addq.l #1,390(sp)
    4ca4:	720c           	moveq #12,d1
    4ca6:	b2af 0186      	cmp.l 390(sp),d1
    4caa:	6cb2           	bge.s 4c5e <TestZoom4Picture+0xd34>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    4cac:	222f 018a      	move.l 394(sp),d1
    4cb0:	2001           	move.l d1,d0
    4cb2:	d080           	add.l d0,d0
    4cb4:	d081           	add.l d1,d0
    4cb6:	2200           	move.l d0,d1
    4cb8:	e789           	lsl.l #3,d1
    4cba:	2041           	movea.l d1,a0
    4cbc:	91c0           	suba.l d0,a0
    4cbe:	41e8 0023      	lea 35(a0),a0
    4cc2:	7000           	moveq #0,d0
    4cc4:	302f 01c6      	move.w 454(sp),d0
    4cc8:	2f08           	move.l a0,-(sp)
    4cca:	2f00           	move.l d0,-(sp)
    4ccc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cd0:	2f2f 002e      	move.l 46(sp),-(sp)
    4cd4:	4eba 20ca      	jsr 6da0 <TestRow>(pc)
    4cd8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cdc:	7430           	moveq #48,d2
    4cde:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    4ce2:	222f 018a      	move.l 394(sp),d1
    4ce6:	2001           	move.l d1,d0
    4ce8:	d080           	add.l d0,d0
    4cea:	d081           	add.l d1,d0
    4cec:	2200           	move.l d0,d1
    4cee:	e789           	lsl.l #3,d1
    4cf0:	2041           	movea.l d1,a0
    4cf2:	91c0           	suba.l d0,a0
    4cf4:	41e8 0024      	lea 36(a0),a0
    4cf8:	7000           	moveq #0,d0
    4cfa:	302f 01c6      	move.w 454(sp),d0
    4cfe:	2f08           	move.l a0,-(sp)
    4d00:	2f00           	move.l d0,-(sp)
    4d02:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d06:	2f2f 002e      	move.l 46(sp),-(sp)
    4d0a:	4eba 2094      	jsr 6da0 <TestRow>(pc)
    4d0e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d12:	7030           	moveq #48,d0
    4d14:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4d18:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    4d1c:	222f 018a      	move.l 394(sp),d1
    4d20:	2001           	move.l d1,d0
    4d22:	d080           	add.l d0,d0
    4d24:	d081           	add.l d1,d0
    4d26:	2200           	move.l d0,d1
    4d28:	e789           	lsl.l #3,d1
    4d2a:	2041           	movea.l d1,a0
    4d2c:	91c0           	suba.l d0,a0
    4d2e:	41e8 0025      	lea 37(a0),a0
    4d32:	7000           	moveq #0,d0
    4d34:	302f 01c6      	move.w 454(sp),d0
    4d38:	2f08           	move.l a0,-(sp)
    4d3a:	2f00           	move.l d0,-(sp)
    4d3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d40:	2f2f 002e      	move.l 46(sp),-(sp)
    4d44:	4eba 205a      	jsr 6da0 <TestRow>(pc)
    4d48:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d4c:	7230           	moveq #48,d1
    4d4e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    4d52:	222f 018a      	move.l 394(sp),d1
    4d56:	2001           	move.l d1,d0
    4d58:	d080           	add.l d0,d0
    4d5a:	d081           	add.l d1,d0
    4d5c:	2200           	move.l d0,d1
    4d5e:	e789           	lsl.l #3,d1
    4d60:	2041           	movea.l d1,a0
    4d62:	91c0           	suba.l d0,a0
    4d64:	41e8 0026      	lea 38(a0),a0
    4d68:	7000           	moveq #0,d0
    4d6a:	302f 01c6      	move.w 454(sp),d0
    4d6e:	2f08           	move.l a0,-(sp)
    4d70:	2f00           	move.l d0,-(sp)
    4d72:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d76:	2f2f 002e      	move.l 46(sp),-(sp)
    4d7a:	4eba 2024      	jsr 6da0 <TestRow>(pc)
    4d7e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4d82:	7430           	moveq #48,d2
    4d84:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4d88:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    4d8c:	222f 018a      	move.l 394(sp),d1
    4d90:	2001           	move.l d1,d0
    4d92:	d080           	add.l d0,d0
    4d94:	d081           	add.l d1,d0
    4d96:	2200           	move.l d0,d1
    4d98:	e789           	lsl.l #3,d1
    4d9a:	2041           	movea.l d1,a0
    4d9c:	91c0           	suba.l d0,a0
    4d9e:	41e8 0027      	lea 39(a0),a0
    4da2:	7000           	moveq #0,d0
    4da4:	302f 01c6      	move.w 454(sp),d0
    4da8:	2f08           	move.l a0,-(sp)
    4daa:	2f00           	move.l d0,-(sp)
    4dac:	2f2f 01d0      	move.l 464(sp),-(sp)
    4db0:	2f2f 002e      	move.l 46(sp),-(sp)
    4db4:	4eba 1fea      	jsr 6da0 <TestRow>(pc)
    4db8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4dbc:	7030           	moveq #48,d0
    4dbe:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    4dc2:	222f 018a      	move.l 394(sp),d1
    4dc6:	2001           	move.l d1,d0
    4dc8:	d080           	add.l d0,d0
    4dca:	d081           	add.l d1,d0
    4dcc:	2200           	move.l d0,d1
    4dce:	e789           	lsl.l #3,d1
    4dd0:	2041           	movea.l d1,a0
    4dd2:	91c0           	suba.l d0,a0
    4dd4:	41e8 0028      	lea 40(a0),a0
    4dd8:	7000           	moveq #0,d0
    4dda:	302f 01c6      	move.w 454(sp),d0
    4dde:	2f08           	move.l a0,-(sp)
    4de0:	2f00           	move.l d0,-(sp)
    4de2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4de6:	2f2f 002e      	move.l 46(sp),-(sp)
    4dea:	4eba 1fb4      	jsr 6da0 <TestRow>(pc)
    4dee:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4df2:	7230           	moveq #48,d1
    4df4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4df8:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    4dfc:	222f 018a      	move.l 394(sp),d1
    4e00:	2001           	move.l d1,d0
    4e02:	d080           	add.l d0,d0
    4e04:	d081           	add.l d1,d0
    4e06:	2200           	move.l d0,d1
    4e08:	e789           	lsl.l #3,d1
    4e0a:	2041           	movea.l d1,a0
    4e0c:	91c0           	suba.l d0,a0
    4e0e:	41e8 0029      	lea 41(a0),a0
    4e12:	7000           	moveq #0,d0
    4e14:	302f 01c6      	move.w 454(sp),d0
    4e18:	2f08           	move.l a0,-(sp)
    4e1a:	2f00           	move.l d0,-(sp)
    4e1c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e20:	2f2f 002e      	move.l 46(sp),-(sp)
    4e24:	4eba 1f7a      	jsr 6da0 <TestRow>(pc)
    4e28:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e2c:	7430           	moveq #48,d2
    4e2e:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    4e32:	222f 018a      	move.l 394(sp),d1
    4e36:	2001           	move.l d1,d0
    4e38:	d080           	add.l d0,d0
    4e3a:	d081           	add.l d1,d0
    4e3c:	2200           	move.l d0,d1
    4e3e:	e789           	lsl.l #3,d1
    4e40:	2041           	movea.l d1,a0
    4e42:	91c0           	suba.l d0,a0
    4e44:	41e8 002a      	lea 42(a0),a0
    4e48:	7000           	moveq #0,d0
    4e4a:	302f 01c6      	move.w 454(sp),d0
    4e4e:	2f08           	move.l a0,-(sp)
    4e50:	2f00           	move.l d0,-(sp)
    4e52:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e56:	2f2f 002e      	move.l 46(sp),-(sp)
    4e5a:	4eba 1f44      	jsr 6da0 <TestRow>(pc)
    4e5e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e62:	7030           	moveq #48,d0
    4e64:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4e68:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    4e6c:	222f 018a      	move.l 394(sp),d1
    4e70:	2001           	move.l d1,d0
    4e72:	d080           	add.l d0,d0
    4e74:	d081           	add.l d1,d0
    4e76:	2200           	move.l d0,d1
    4e78:	e789           	lsl.l #3,d1
    4e7a:	2041           	movea.l d1,a0
    4e7c:	91c0           	suba.l d0,a0
    4e7e:	41e8 002b      	lea 43(a0),a0
    4e82:	7000           	moveq #0,d0
    4e84:	302f 01c6      	move.w 454(sp),d0
    4e88:	2f08           	move.l a0,-(sp)
    4e8a:	2f00           	move.l d0,-(sp)
    4e8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e90:	2f2f 002e      	move.l 46(sp),-(sp)
    4e94:	4eba 1f0a      	jsr 6da0 <TestRow>(pc)
    4e98:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e9c:	7230           	moveq #48,d1
    4e9e:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    4ea2:	222f 018a      	move.l 394(sp),d1
    4ea6:	2001           	move.l d1,d0
    4ea8:	d080           	add.l d0,d0
    4eaa:	d081           	add.l d1,d0
    4eac:	2200           	move.l d0,d1
    4eae:	e789           	lsl.l #3,d1
    4eb0:	2041           	movea.l d1,a0
    4eb2:	91c0           	suba.l d0,a0
    4eb4:	41e8 002c      	lea 44(a0),a0
    4eb8:	7000           	moveq #0,d0
    4eba:	302f 01c6      	move.w 454(sp),d0
    4ebe:	2f08           	move.l a0,-(sp)
    4ec0:	2f00           	move.l d0,-(sp)
    4ec2:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ec6:	2f2f 002e      	move.l 46(sp),-(sp)
    4eca:	4eba 1ed4      	jsr 6da0 <TestRow>(pc)
    4ece:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4ed2:	7430           	moveq #48,d2
    4ed4:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4ed8:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    4edc:	52af 018a      	addq.l #1,394(sp)
    4ee0:	7009           	moveq #9,d0
    4ee2:	b0af 018a      	cmp.l 394(sp),d0
    4ee6:	6c00 fd70      	bge.w 4c58 <TestZoom4Picture+0xd2e>
  }

  for(int i2=0;i2<13;i2++) {  
    4eea:	42af 0182      	clr.l 386(sp)
    4eee:	6032           	bra.s 4f22 <TestZoom4Picture+0xff8>
    TestRow( valsupposed, valactual, mask, i2+253);
    4ef0:	222f 0182      	move.l 386(sp),d1
    4ef4:	0681 0000 00fd 	addi.l #253,d1
    4efa:	7000           	moveq #0,d0
    4efc:	302f 01c6      	move.w 454(sp),d0
    4f00:	2f01           	move.l d1,-(sp)
    4f02:	2f00           	move.l d0,-(sp)
    4f04:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f08:	2f2f 002e      	move.l 46(sp),-(sp)
    4f0c:	4eba 1e92      	jsr 6da0 <TestRow>(pc)
    4f10:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f14:	7230           	moveq #48,d1
    4f16:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4f1a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    4f1e:	52af 0182      	addq.l #1,386(sp)
    4f22:	740c           	moveq #12,d2
    4f24:	b4af 0182      	cmp.l 386(sp),d2
    4f28:	6cc6           	bge.s 4ef0 <TestZoom4Picture+0xfc6>
  }

  TestRow( valsupposed, valactual, mask, 266);
    4f2a:	7000           	moveq #0,d0
    4f2c:	302f 01c6      	move.w 454(sp),d0
    4f30:	4878 010a      	pea 10a <WaitBlt+0x2a>
    4f34:	2f00           	move.l d0,-(sp)
    4f36:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f3a:	2f2f 002e      	move.l 46(sp),-(sp)
    4f3e:	4eba 1e60      	jsr 6da0 <TestRow>(pc)
    4f42:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f46:	7030           	moveq #48,d0
    4f48:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    4f4c:	7000           	moveq #0,d0
    4f4e:	302f 01c6      	move.w 454(sp),d0
    4f52:	4878 010b      	pea 10b <WaitBlt+0x2b>
    4f56:	2f00           	move.l d0,-(sp)
    4f58:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f5c:	2f2f 002e      	move.l 46(sp),-(sp)
    4f60:	4eba 1e3e      	jsr 6da0 <TestRow>(pc)
    4f64:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f68:	7230           	moveq #48,d1
    4f6a:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4f6e:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4f72:	7000           	moveq #0,d0
    4f74:	302f 01c6      	move.w 454(sp),d0
    4f78:	4878 010c      	pea 10c <WaitBlt+0x2c>
    4f7c:	2f00           	move.l d0,-(sp)
    4f7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f82:	2f2f 002e      	move.l 46(sp),-(sp)
    4f86:	4eba 1e18      	jsr 6da0 <TestRow>(pc)
    4f8a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f8e:	7430           	moveq #48,d2
    4f90:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4f94:	7000           	moveq #0,d0
    4f96:	302f 01c6      	move.w 454(sp),d0
    4f9a:	4878 010d      	pea 10d <WaitBlt+0x2d>
    4f9e:	2f00           	move.l d0,-(sp)
    4fa0:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fa4:	2f2f 002e      	move.l 46(sp),-(sp)
    4fa8:	4eba 1df6      	jsr 6da0 <TestRow>(pc)
    4fac:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4fb0:	7030           	moveq #48,d0
    4fb2:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4fb6:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4fba:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    4fc0:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4fc6:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    4fcc:	4878 0001      	pea 1 <_start+0x1>
    4fd0:	4878 0005      	pea 5 <_start+0x5>
    4fd4:	2f2f 0042      	move.l 66(sp),-(sp)
    4fd8:	2f2f 006a      	move.l 106(sp),-(sp)
    4fdc:	4eba ca7e      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    4fe0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4fe4:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    4fea:	2c40           	movea.l d0,a6
    4fec:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4ff0:	222f 003a      	move.l 58(sp),d1
    4ff4:	5881           	addq.l #4,d1
    4ff6:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom6;
    4ffa:	2f7c 0001 b840 	move.l #112704,34(sp)
    5000:	0022 
  mask = 0x0000;
    5002:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    5006:	42af 017e      	clr.l 382(sp)
    500a:	602a           	bra.s 5036 <TestZoom4Picture+0x110c>
    TestRow( valsupposed, valactual, mask, i2);
    500c:	7000           	moveq #0,d0
    500e:	302f 01c6      	move.w 454(sp),d0
    5012:	2f2f 017e      	move.l 382(sp),-(sp)
    5016:	2f00           	move.l d0,-(sp)
    5018:	2f2f 01d0      	move.l 464(sp),-(sp)
    501c:	2f2f 002e      	move.l 46(sp),-(sp)
    5020:	4eba 1d7e      	jsr 6da0 <TestRow>(pc)
    5024:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5028:	7430           	moveq #48,d2
    502a:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    502e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5032:	52af 017e      	addq.l #1,382(sp)
    5036:	7006           	moveq #6,d0
    5038:	b0af 017e      	cmp.l 382(sp),d0
    503c:	6cce           	bge.s 500c <TestZoom4Picture+0x10e2>
  }

  for(int i=0;i<6;i++) {
    503e:	42af 017a      	clr.l 378(sp)
    5042:	605c           	bra.s 50a0 <TestZoom4Picture+0x1176>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    5044:	202f 017a      	move.l 378(sp),d0
    5048:	d080           	add.l d0,d0
    504a:	2200           	move.l d0,d1
    504c:	5e81           	addq.l #7,d1
    504e:	7000           	moveq #0,d0
    5050:	302f 01c6      	move.w 454(sp),d0
    5054:	2f01           	move.l d1,-(sp)
    5056:	2f00           	move.l d0,-(sp)
    5058:	2f2f 01d0      	move.l 464(sp),-(sp)
    505c:	2f2f 002e      	move.l 46(sp),-(sp)
    5060:	4eba 1d3e      	jsr 6da0 <TestRow>(pc)
    5064:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5068:	7230           	moveq #48,d1
    506a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    506e:	202f 017a      	move.l 378(sp),d0
    5072:	5880           	addq.l #4,d0
    5074:	d080           	add.l d0,d0
    5076:	2200           	move.l d0,d1
    5078:	7000           	moveq #0,d0
    507a:	302f 01c6      	move.w 454(sp),d0
    507e:	2f01           	move.l d1,-(sp)
    5080:	2f00           	move.l d0,-(sp)
    5082:	2f2f 01d0      	move.l 464(sp),-(sp)
    5086:	2f2f 002e      	move.l 46(sp),-(sp)
    508a:	4eba 1d14      	jsr 6da0 <TestRow>(pc)
    508e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5092:	7430           	moveq #48,d2
    5094:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    5098:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    509c:	52af 017a      	addq.l #1,378(sp)
    50a0:	7005           	moveq #5,d0
    50a2:	b0af 017a      	cmp.l 378(sp),d0
    50a6:	6c9c           	bge.s 5044 <TestZoom4Picture+0x111a>
  }

  for(int i=0;i<10;i++) {
    50a8:	42af 0176      	clr.l 374(sp)
    50ac:	6000 00ce      	bra.w 517c <TestZoom4Picture+0x1252>
    for(int i2=0;i2<12;i2++) {  
    50b0:	42af 0172      	clr.l 370(sp)
    50b4:	6040           	bra.s 50f6 <TestZoom4Picture+0x11cc>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    50b6:	307c 0013      	movea.w #19,a0
    50ba:	d1ef 0172      	adda.l 370(sp),a0
    50be:	222f 0176      	move.l 374(sp),d1
    50c2:	2001           	move.l d1,d0
    50c4:	d080           	add.l d0,d0
    50c6:	d081           	add.l d1,d0
    50c8:	e788           	lsl.l #3,d0
    50ca:	2208           	move.l a0,d1
    50cc:	d280           	add.l d0,d1
    50ce:	7000           	moveq #0,d0
    50d0:	302f 01c6      	move.w 454(sp),d0
    50d4:	2f01           	move.l d1,-(sp)
    50d6:	2f00           	move.l d0,-(sp)
    50d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    50dc:	2f2f 002e      	move.l 46(sp),-(sp)
    50e0:	4eba 1cbe      	jsr 6da0 <TestRow>(pc)
    50e4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    50e8:	7230           	moveq #48,d1
    50ea:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    50ee:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    50f2:	52af 0172      	addq.l #1,370(sp)
    50f6:	740b           	moveq #11,d2
    50f8:	b4af 0172      	cmp.l 370(sp),d2
    50fc:	6cb8           	bge.s 50b6 <TestZoom4Picture+0x118c>
    }
    for(int i=0;i<6;i++) {
    50fe:	42af 016e      	clr.l 366(sp)
    5102:	606c           	bra.s 5170 <TestZoom4Picture+0x1246>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    5104:	222f 016e      	move.l 366(sp),d1
    5108:	2001           	move.l d1,d0
    510a:	d080           	add.l d0,d0
    510c:	d081           	add.l d1,d0
    510e:	e788           	lsl.l #3,d0
    5110:	2040           	movea.l d0,a0
    5112:	41e8 001f      	lea 31(a0),a0
    5116:	7000           	moveq #0,d0
    5118:	302f 01c6      	move.w 454(sp),d0
    511c:	2f08           	move.l a0,-(sp)
    511e:	2f00           	move.l d0,-(sp)
    5120:	2f2f 01d0      	move.l 464(sp),-(sp)
    5124:	2f2f 002e      	move.l 46(sp),-(sp)
    5128:	4eba 1c76      	jsr 6da0 <TestRow>(pc)
    512c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5130:	7030           	moveq #48,d0
    5132:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    5136:	222f 016e      	move.l 366(sp),d1
    513a:	2001           	move.l d1,d0
    513c:	d080           	add.l d0,d0
    513e:	d081           	add.l d1,d0
    5140:	e788           	lsl.l #3,d0
    5142:	2040           	movea.l d0,a0
    5144:	41e8 0020      	lea 32(a0),a0
    5148:	7000           	moveq #0,d0
    514a:	302f 01c6      	move.w 454(sp),d0
    514e:	2f08           	move.l a0,-(sp)
    5150:	2f00           	move.l d0,-(sp)
    5152:	2f2f 01d0      	move.l 464(sp),-(sp)
    5156:	2f2f 002e      	move.l 46(sp),-(sp)
    515a:	4eba 1c44      	jsr 6da0 <TestRow>(pc)
    515e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5162:	7230           	moveq #48,d1
    5164:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    5168:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    516c:	52af 016e      	addq.l #1,366(sp)
    5170:	7405           	moveq #5,d2
    5172:	b4af 016e      	cmp.l 366(sp),d2
    5176:	6c8c           	bge.s 5104 <TestZoom4Picture+0x11da>
  for(int i=0;i<10;i++) {
    5178:	52af 0176      	addq.l #1,374(sp)
    517c:	7009           	moveq #9,d0
    517e:	b0af 0176      	cmp.l 374(sp),d0
    5182:	6c00 ff2c      	bge.w 50b0 <TestZoom4Picture+0x1186>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    5186:	42af 016a      	clr.l 362(sp)
    518a:	6032           	bra.s 51be <TestZoom4Picture+0x1294>
    TestRow( valsupposed, valactual, mask, 258+i2);
    518c:	222f 016a      	move.l 362(sp),d1
    5190:	0681 0000 0102 	addi.l #258,d1
    5196:	7000           	moveq #0,d0
    5198:	302f 01c6      	move.w 454(sp),d0
    519c:	2f01           	move.l d1,-(sp)
    519e:	2f00           	move.l d0,-(sp)
    51a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    51a4:	2f2f 002e      	move.l 46(sp),-(sp)
    51a8:	4eba 1bf6      	jsr 6da0 <TestRow>(pc)
    51ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    51b0:	7230           	moveq #48,d1
    51b2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    51b6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    51ba:	52af 016a      	addq.l #1,362(sp)
    51be:	740a           	moveq #10,d2
    51c0:	b4af 016a      	cmp.l 362(sp),d2
    51c4:	6cc6           	bge.s 518c <TestZoom4Picture+0x1262>
  }

  tmp = source;
    51c6:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    51cc:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    51d2:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    51d8:	4878 0001      	pea 1 <_start+0x1>
    51dc:	4878 0006      	pea 6 <_start+0x6>
    51e0:	2f2f 0042      	move.l 66(sp),-(sp)
    51e4:	2f2f 006a      	move.l 106(sp),-(sp)
    51e8:	4eba c872      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    51ec:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    51f0:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    51f6:	2c40           	movea.l d0,a6
    51f8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    51fc:	202f 003a      	move.l 58(sp),d0
    5200:	5880           	addq.l #4,d0
    5202:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    5206:	2f7c 0001 b86c 	move.l #112748,34(sp)
    520c:	0022 
  mask = 0x0000;
    520e:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5212:	7000           	moveq #0,d0
    5214:	302f 01c6      	move.w 454(sp),d0
    5218:	42a7           	clr.l -(sp)
    521a:	2f00           	move.l d0,-(sp)
    521c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5220:	2f2f 002e      	move.l 46(sp),-(sp)
    5224:	4eba 1b7a      	jsr 6da0 <TestRow>(pc)
    5228:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    522c:	7230           	moveq #48,d1
    522e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5232:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5236:	42af 0166      	clr.l 358(sp)
    523a:	605c           	bra.s 5298 <TestZoom4Picture+0x136e>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    523c:	202f 0166      	move.l 358(sp),d0
    5240:	d080           	add.l d0,d0
    5242:	2200           	move.l d0,d1
    5244:	5281           	addq.l #1,d1
    5246:	7000           	moveq #0,d0
    5248:	302f 01c6      	move.w 454(sp),d0
    524c:	2f01           	move.l d1,-(sp)
    524e:	2f00           	move.l d0,-(sp)
    5250:	2f2f 01d0      	move.l 464(sp),-(sp)
    5254:	2f2f 002e      	move.l 46(sp),-(sp)
    5258:	4eba 1b46      	jsr 6da0 <TestRow>(pc)
    525c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5260:	7430           	moveq #48,d2
    5262:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5266:	202f 0166      	move.l 358(sp),d0
    526a:	5280           	addq.l #1,d0
    526c:	d080           	add.l d0,d0
    526e:	2200           	move.l d0,d1
    5270:	7000           	moveq #0,d0
    5272:	302f 01c6      	move.w 454(sp),d0
    5276:	2f01           	move.l d1,-(sp)
    5278:	2f00           	move.l d0,-(sp)
    527a:	2f2f 01d0      	move.l 464(sp),-(sp)
    527e:	2f2f 002e      	move.l 46(sp),-(sp)
    5282:	4eba 1b1c      	jsr 6da0 <TestRow>(pc)
    5286:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    528a:	7030           	moveq #48,d0
    528c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5290:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5294:	52af 0166      	addq.l #1,358(sp)
    5298:	7206           	moveq #6,d1
    529a:	b2af 0166      	cmp.l 358(sp),d1
    529e:	6c9c           	bge.s 523c <TestZoom4Picture+0x1312>
  }

  for(int i=0;i<10;i++) {
    52a0:	42af 0162      	clr.l 354(sp)
    52a4:	6000 00d4      	bra.w 537a <TestZoom4Picture+0x1450>
    for(int i2=0;i2<11;i2++) {  
    52a8:	42af 015e      	clr.l 350(sp)
    52ac:	6042           	bra.s 52f0 <TestZoom4Picture+0x13c6>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    52ae:	307c 000f      	movea.w #15,a0
    52b2:	d1ef 015e      	adda.l 350(sp),a0
    52b6:	222f 0162      	move.l 354(sp),d1
    52ba:	2001           	move.l d1,d0
    52bc:	d080           	add.l d0,d0
    52be:	d081           	add.l d1,d0
    52c0:	e788           	lsl.l #3,d0
    52c2:	d081           	add.l d1,d0
    52c4:	2208           	move.l a0,d1
    52c6:	d280           	add.l d0,d1
    52c8:	7000           	moveq #0,d0
    52ca:	302f 01c6      	move.w 454(sp),d0
    52ce:	2f01           	move.l d1,-(sp)
    52d0:	2f00           	move.l d0,-(sp)
    52d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    52d6:	2f2f 002e      	move.l 46(sp),-(sp)
    52da:	4eba 1ac4      	jsr 6da0 <TestRow>(pc)
    52de:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    52e2:	7430           	moveq #48,d2
    52e4:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    52e8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    52ec:	52af 015e      	addq.l #1,350(sp)
    52f0:	700a           	moveq #10,d0
    52f2:	b0af 015e      	cmp.l 350(sp),d0
    52f6:	6cb6           	bge.s 52ae <TestZoom4Picture+0x1384>
    }
    for(int i=0;i<7;i++) {
    52f8:	42af 015a      	clr.l 346(sp)
    52fc:	6070           	bra.s 536e <TestZoom4Picture+0x1444>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    52fe:	222f 015a      	move.l 346(sp),d1
    5302:	2001           	move.l d1,d0
    5304:	d080           	add.l d0,d0
    5306:	d081           	add.l d1,d0
    5308:	e788           	lsl.l #3,d0
    530a:	2040           	movea.l d0,a0
    530c:	d1c1           	adda.l d1,a0
    530e:	41e8 001a      	lea 26(a0),a0
    5312:	7000           	moveq #0,d0
    5314:	302f 01c6      	move.w 454(sp),d0
    5318:	2f08           	move.l a0,-(sp)
    531a:	2f00           	move.l d0,-(sp)
    531c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5320:	2f2f 002e      	move.l 46(sp),-(sp)
    5324:	4eba 1a7a      	jsr 6da0 <TestRow>(pc)
    5328:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    532c:	7230           	moveq #48,d1
    532e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    5332:	222f 015a      	move.l 346(sp),d1
    5336:	2001           	move.l d1,d0
    5338:	d080           	add.l d0,d0
    533a:	d081           	add.l d1,d0
    533c:	e788           	lsl.l #3,d0
    533e:	2040           	movea.l d0,a0
    5340:	d1c1           	adda.l d1,a0
    5342:	41e8 001a      	lea 26(a0),a0
    5346:	7000           	moveq #0,d0
    5348:	302f 01c6      	move.w 454(sp),d0
    534c:	2f08           	move.l a0,-(sp)
    534e:	2f00           	move.l d0,-(sp)
    5350:	2f2f 01d0      	move.l 464(sp),-(sp)
    5354:	2f2f 002e      	move.l 46(sp),-(sp)
    5358:	4eba 1a46      	jsr 6da0 <TestRow>(pc)
    535c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5360:	7430           	moveq #48,d2
    5362:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5366:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    536a:	52af 015a      	addq.l #1,346(sp)
    536e:	7006           	moveq #6,d0
    5370:	b0af 015a      	cmp.l 346(sp),d0
    5374:	6c88           	bge.s 52fe <TestZoom4Picture+0x13d4>
  for(int i=0;i<10;i++) {
    5376:	52af 0162      	addq.l #1,354(sp)
    537a:	7209           	moveq #9,d1
    537c:	b2af 0162      	cmp.l 354(sp),d1
    5380:	6c00 ff26      	bge.w 52a8 <TestZoom4Picture+0x137e>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    5384:	42af 0156      	clr.l 342(sp)
    5388:	6032           	bra.s 53bc <TestZoom4Picture+0x1492>
    TestRow( valsupposed, valactual, mask, 256+i2);
    538a:	222f 0156      	move.l 342(sp),d1
    538e:	0681 0000 0100 	addi.l #256,d1
    5394:	7000           	moveq #0,d0
    5396:	302f 01c6      	move.w 454(sp),d0
    539a:	2f01           	move.l d1,-(sp)
    539c:	2f00           	move.l d0,-(sp)
    539e:	2f2f 01d0      	move.l 464(sp),-(sp)
    53a2:	2f2f 002e      	move.l 46(sp),-(sp)
    53a6:	4eba 19f8      	jsr 6da0 <TestRow>(pc)
    53aa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    53ae:	7430           	moveq #48,d2
    53b0:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    53b4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    53b8:	52af 0156      	addq.l #1,342(sp)
    53bc:	7004           	moveq #4,d0
    53be:	b0af 0156      	cmp.l 342(sp),d0
    53c2:	6cc6           	bge.s 538a <TestZoom4Picture+0x1460>
  }

  tmp = source;
    53c4:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    53ca:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    53d0:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    53d6:	4878 0001      	pea 1 <_start+0x1>
    53da:	4878 0007      	pea 7 <_start+0x7>
    53de:	2f2f 0042      	move.l 66(sp),-(sp)
    53e2:	2f2f 006a      	move.l 106(sp),-(sp)
    53e6:	4eba c674      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    53ea:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    53ee:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    53f4:	2c40           	movea.l d0,a6
    53f6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    53fa:	222f 003a      	move.l 58(sp),d1
    53fe:	5881           	addq.l #4,d1
    5400:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    5404:	2f7c 0001 b898 	move.l #112792,34(sp)
    540a:	0022 
  mask = 0xffff;
    540c:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    5412:	7000           	moveq #0,d0
    5414:	302f 01c6      	move.w 454(sp),d0
    5418:	42a7           	clr.l -(sp)
    541a:	2f00           	move.l d0,-(sp)
    541c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5420:	2f2f 002e      	move.l 46(sp),-(sp)
    5424:	4eba 197a      	jsr 6da0 <TestRow>(pc)
    5428:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    542c:	7430           	moveq #48,d2
    542e:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    5432:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5436:	42af 0152      	clr.l 338(sp)
    543a:	605c           	bra.s 5498 <TestZoom4Picture+0x156e>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    543c:	202f 0152      	move.l 338(sp),d0
    5440:	d080           	add.l d0,d0
    5442:	2200           	move.l d0,d1
    5444:	5281           	addq.l #1,d1
    5446:	7000           	moveq #0,d0
    5448:	302f 01c6      	move.w 454(sp),d0
    544c:	2f01           	move.l d1,-(sp)
    544e:	2f00           	move.l d0,-(sp)
    5450:	2f2f 01d0      	move.l 464(sp),-(sp)
    5454:	2f2f 002e      	move.l 46(sp),-(sp)
    5458:	4eba 1946      	jsr 6da0 <TestRow>(pc)
    545c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5460:	7030           	moveq #48,d0
    5462:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5466:	202f 0152      	move.l 338(sp),d0
    546a:	5280           	addq.l #1,d0
    546c:	d080           	add.l d0,d0
    546e:	2200           	move.l d0,d1
    5470:	7000           	moveq #0,d0
    5472:	302f 01c6      	move.w 454(sp),d0
    5476:	2f01           	move.l d1,-(sp)
    5478:	2f00           	move.l d0,-(sp)
    547a:	2f2f 01d0      	move.l 464(sp),-(sp)
    547e:	2f2f 002e      	move.l 46(sp),-(sp)
    5482:	4eba 191c      	jsr 6da0 <TestRow>(pc)
    5486:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    548a:	7230           	moveq #48,d1
    548c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5490:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    5494:	52af 0152      	addq.l #1,338(sp)
    5498:	7404           	moveq #4,d2
    549a:	b4af 0152      	cmp.l 338(sp),d2
    549e:	6c9c           	bge.s 543c <TestZoom4Picture+0x1512>
  }

  for(int i=0;i<9;i++) {
    54a0:	42af 014e      	clr.l 334(sp)
    54a4:	6000 00f0      	bra.w 5596 <TestZoom4Picture+0x166c>
    for(int i2=0;i2<10;i2++) {  
    54a8:	42af 014a      	clr.l 330(sp)
    54ac:	6046           	bra.s 54f4 <TestZoom4Picture+0x15ca>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    54ae:	307c 000b      	movea.w #11,a0
    54b2:	d1ef 014a      	adda.l 330(sp),a0
    54b6:	222f 014e      	move.l 334(sp),d1
    54ba:	2001           	move.l d1,d0
    54bc:	d080           	add.l d0,d0
    54be:	d081           	add.l d1,d0
    54c0:	d080           	add.l d0,d0
    54c2:	d080           	add.l d0,d0
    54c4:	d081           	add.l d1,d0
    54c6:	d080           	add.l d0,d0
    54c8:	2208           	move.l a0,d1
    54ca:	d280           	add.l d0,d1
    54cc:	7000           	moveq #0,d0
    54ce:	302f 01c6      	move.w 454(sp),d0
    54d2:	2f01           	move.l d1,-(sp)
    54d4:	2f00           	move.l d0,-(sp)
    54d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    54da:	2f2f 002e      	move.l 46(sp),-(sp)
    54de:	4eba 18c0      	jsr 6da0 <TestRow>(pc)
    54e2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    54e6:	7030           	moveq #48,d0
    54e8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    54ec:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    54f0:	52af 014a      	addq.l #1,330(sp)
    54f4:	7209           	moveq #9,d1
    54f6:	b2af 014a      	cmp.l 330(sp),d1
    54fa:	6cb2           	bge.s 54ae <TestZoom4Picture+0x1584>
    }
    for(int i2=0;i2<8;i2++) {
    54fc:	42af 0146      	clr.l 326(sp)
    5500:	6000 0086      	bra.w 5588 <TestZoom4Picture+0x165e>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    5504:	222f 014e      	move.l 334(sp),d1
    5508:	2001           	move.l d1,d0
    550a:	d080           	add.l d0,d0
    550c:	d081           	add.l d1,d0
    550e:	d080           	add.l d0,d0
    5510:	d080           	add.l d0,d0
    5512:	d081           	add.l d1,d0
    5514:	d080           	add.l d0,d0
    5516:	2040           	movea.l d0,a0
    5518:	41e8 0015      	lea 21(a0),a0
    551c:	2208           	move.l a0,d1
    551e:	d2af 0146      	add.l 326(sp),d1
    5522:	7000           	moveq #0,d0
    5524:	302f 01c6      	move.w 454(sp),d0
    5528:	2f01           	move.l d1,-(sp)
    552a:	2f00           	move.l d0,-(sp)
    552c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5530:	2f2f 002e      	move.l 46(sp),-(sp)
    5534:	4eba 186a      	jsr 6da0 <TestRow>(pc)
    5538:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    553c:	7430           	moveq #48,d2
    553e:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    5542:	222f 014e      	move.l 334(sp),d1
    5546:	2001           	move.l d1,d0
    5548:	d080           	add.l d0,d0
    554a:	d081           	add.l d1,d0
    554c:	d080           	add.l d0,d0
    554e:	d080           	add.l d0,d0
    5550:	d081           	add.l d1,d0
    5552:	d080           	add.l d0,d0
    5554:	2040           	movea.l d0,a0
    5556:	41e8 0015      	lea 21(a0),a0
    555a:	2208           	move.l a0,d1
    555c:	d2af 0146      	add.l 326(sp),d1
    5560:	7000           	moveq #0,d0
    5562:	302f 01c6      	move.w 454(sp),d0
    5566:	2f01           	move.l d1,-(sp)
    5568:	2f00           	move.l d0,-(sp)
    556a:	2f2f 01d0      	move.l 464(sp),-(sp)
    556e:	2f2f 002e      	move.l 46(sp),-(sp)
    5572:	4eba 182c      	jsr 6da0 <TestRow>(pc)
    5576:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    557a:	7030           	moveq #48,d0
    557c:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5580:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    5584:	52af 0146      	addq.l #1,326(sp)
    5588:	7207           	moveq #7,d1
    558a:	b2af 0146      	cmp.l 326(sp),d1
    558e:	6c00 ff74      	bge.w 5504 <TestZoom4Picture+0x15da>
  for(int i=0;i<9;i++) {
    5592:	52af 014e      	addq.l #1,334(sp)
    5596:	7408           	moveq #8,d2
    5598:	b4af 014e      	cmp.l 334(sp),d2
    559c:	6c00 ff0a      	bge.w 54a8 <TestZoom4Picture+0x157e>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    55a0:	42af 0142      	clr.l 322(sp)
    55a4:	6032           	bra.s 55d8 <TestZoom4Picture+0x16ae>
    TestRow( valsupposed, valactual, mask, 245+i2);
    55a6:	222f 0142      	move.l 322(sp),d1
    55aa:	0681 0000 00f5 	addi.l #245,d1
    55b0:	7000           	moveq #0,d0
    55b2:	302f 01c6      	move.w 454(sp),d0
    55b6:	2f01           	move.l d1,-(sp)
    55b8:	2f00           	move.l d0,-(sp)
    55ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    55be:	2f2f 002e      	move.l 46(sp),-(sp)
    55c2:	4eba 17dc      	jsr 6da0 <TestRow>(pc)
    55c6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    55ca:	7030           	moveq #48,d0
    55cc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    55d0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    55d4:	52af 0142      	addq.l #1,322(sp)
    55d8:	7209           	moveq #9,d1
    55da:	b2af 0142      	cmp.l 322(sp),d1
    55de:	6cc6           	bge.s 55a6 <TestZoom4Picture+0x167c>
  }
  for(int i=0;i<7;i++) {
    55e0:	42af 013e      	clr.l 318(sp)
    55e4:	6064           	bra.s 564a <TestZoom4Picture+0x1720>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    55e6:	202f 013e      	move.l 318(sp),d0
    55ea:	d080           	add.l d0,d0
    55ec:	2200           	move.l d0,d1
    55ee:	0681 0000 00ff 	addi.l #255,d1
    55f4:	7000           	moveq #0,d0
    55f6:	302f 01c6      	move.w 454(sp),d0
    55fa:	2f01           	move.l d1,-(sp)
    55fc:	2f00           	move.l d0,-(sp)
    55fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5602:	2f2f 002e      	move.l 46(sp),-(sp)
    5606:	4eba 1798      	jsr 6da0 <TestRow>(pc)
    560a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    560e:	7430           	moveq #48,d2
    5610:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    5614:	202f 013e      	move.l 318(sp),d0
    5618:	0680 0000 0080 	addi.l #128,d0
    561e:	d080           	add.l d0,d0
    5620:	2200           	move.l d0,d1
    5622:	7000           	moveq #0,d0
    5624:	302f 01c6      	move.w 454(sp),d0
    5628:	2f01           	move.l d1,-(sp)
    562a:	2f00           	move.l d0,-(sp)
    562c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5630:	2f2f 002e      	move.l 46(sp),-(sp)
    5634:	4eba 176a      	jsr 6da0 <TestRow>(pc)
    5638:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    563c:	7030           	moveq #48,d0
    563e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5642:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    5646:	52af 013e      	addq.l #1,318(sp)
    564a:	7206           	moveq #6,d1
    564c:	b2af 013e      	cmp.l 318(sp),d1
    5650:	6c94           	bge.s 55e6 <TestZoom4Picture+0x16bc>
  }
  TestRow( valsupposed, valactual, mask, 269);
    5652:	7000           	moveq #0,d0
    5654:	302f 01c6      	move.w 454(sp),d0
    5658:	4878 010d      	pea 10d <WaitBlt+0x2d>
    565c:	2f00           	move.l d0,-(sp)
    565e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5662:	2f2f 002e      	move.l 46(sp),-(sp)
    5666:	4eba 1738      	jsr 6da0 <TestRow>(pc)
    566a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    566e:	7430           	moveq #48,d2
    5670:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    5674:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    5678:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    567e:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    5684:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    568a:	4878 0001      	pea 1 <_start+0x1>
    568e:	4878 0008      	pea 8 <GetVBR>
    5692:	2f2f 0042      	move.l 66(sp),-(sp)
    5696:	2f2f 006a      	move.l 106(sp),-(sp)
    569a:	4eba c3c0      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    569e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    56a2:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    56a8:	2c40           	movea.l d0,a6
    56aa:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    56ae:	202f 003a      	move.l 58(sp),d0
    56b2:	5880           	addq.l #4,d0
    56b4:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    56b8:	2f7c 0001 b8c4 	move.l #112836,34(sp)
    56be:	0022 
  mask = 0x0000;
    56c0:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    56c4:	7000           	moveq #0,d0
    56c6:	302f 01c6      	move.w 454(sp),d0
    56ca:	42a7           	clr.l -(sp)
    56cc:	2f00           	move.l d0,-(sp)
    56ce:	2f2f 01d0      	move.l 464(sp),-(sp)
    56d2:	2f2f 002e      	move.l 46(sp),-(sp)
    56d6:	4eba 16c8      	jsr 6da0 <TestRow>(pc)
    56da:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    56de:	7230           	moveq #48,d1
    56e0:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    56e4:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    56e8:	42af 013a      	clr.l 314(sp)
    56ec:	605c           	bra.s 574a <TestZoom4Picture+0x1820>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    56ee:	202f 013a      	move.l 314(sp),d0
    56f2:	d080           	add.l d0,d0
    56f4:	2200           	move.l d0,d1
    56f6:	5281           	addq.l #1,d1
    56f8:	7000           	moveq #0,d0
    56fa:	302f 01c6      	move.w 454(sp),d0
    56fe:	2f01           	move.l d1,-(sp)
    5700:	2f00           	move.l d0,-(sp)
    5702:	2f2f 01d0      	move.l 464(sp),-(sp)
    5706:	2f2f 002e      	move.l 46(sp),-(sp)
    570a:	4eba 1694      	jsr 6da0 <TestRow>(pc)
    570e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5712:	7430           	moveq #48,d2
    5714:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    5718:	202f 013a      	move.l 314(sp),d0
    571c:	5280           	addq.l #1,d0
    571e:	d080           	add.l d0,d0
    5720:	2200           	move.l d0,d1
    5722:	7000           	moveq #0,d0
    5724:	302f 01c6      	move.w 454(sp),d0
    5728:	2f01           	move.l d1,-(sp)
    572a:	2f00           	move.l d0,-(sp)
    572c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5730:	2f2f 002e      	move.l 46(sp),-(sp)
    5734:	4eba 166a      	jsr 6da0 <TestRow>(pc)
    5738:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    573c:	7030           	moveq #48,d0
    573e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5742:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5746:	52af 013a      	addq.l #1,314(sp)
    574a:	7202           	moveq #2,d1
    574c:	b2af 013a      	cmp.l 314(sp),d1
    5750:	6c9c           	bge.s 56ee <TestZoom4Picture+0x17c4>
  }

  for(int i=0;i<9;i++) {
    5752:	42af 0136      	clr.l 310(sp)
    5756:	6000 00ea      	bra.w 5842 <TestZoom4Picture+0x1918>
    for(int i2=0;i2<9;i2++) {  
    575a:	42af 0132      	clr.l 306(sp)
    575e:	6044           	bra.s 57a4 <TestZoom4Picture+0x187a>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    5760:	307c 000b      	movea.w #11,a0
    5764:	d1ef 0132      	adda.l 306(sp),a0
    5768:	222f 0136      	move.l 310(sp),d1
    576c:	2001           	move.l d1,d0
    576e:	d080           	add.l d0,d0
    5770:	d081           	add.l d1,d0
    5772:	2200           	move.l d0,d1
    5774:	e789           	lsl.l #3,d1
    5776:	d081           	add.l d1,d0
    5778:	2208           	move.l a0,d1
    577a:	d280           	add.l d0,d1
    577c:	7000           	moveq #0,d0
    577e:	302f 01c6      	move.w 454(sp),d0
    5782:	2f01           	move.l d1,-(sp)
    5784:	2f00           	move.l d0,-(sp)
    5786:	2f2f 01d0      	move.l 464(sp),-(sp)
    578a:	2f2f 002e      	move.l 46(sp),-(sp)
    578e:	4eba 1610      	jsr 6da0 <TestRow>(pc)
    5792:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5796:	7430           	moveq #48,d2
    5798:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    579c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    57a0:	52af 0132      	addq.l #1,306(sp)
    57a4:	7008           	moveq #8,d0
    57a6:	b0af 0132      	cmp.l 306(sp),d0
    57aa:	6cb4           	bge.s 5760 <TestZoom4Picture+0x1836>
    }
    
    for(int i2=0;i2<9;i2++) {
    57ac:	42af 012e      	clr.l 302(sp)
    57b0:	6000 0082      	bra.w 5834 <TestZoom4Picture+0x190a>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    57b4:	222f 0136      	move.l 310(sp),d1
    57b8:	2001           	move.l d1,d0
    57ba:	d080           	add.l d0,d0
    57bc:	d081           	add.l d1,d0
    57be:	2200           	move.l d0,d1
    57c0:	e789           	lsl.l #3,d1
    57c2:	2040           	movea.l d0,a0
    57c4:	d1c1           	adda.l d1,a0
    57c6:	41e8 0014      	lea 20(a0),a0
    57ca:	2208           	move.l a0,d1
    57cc:	d2af 012e      	add.l 302(sp),d1
    57d0:	7000           	moveq #0,d0
    57d2:	302f 01c6      	move.w 454(sp),d0
    57d6:	2f01           	move.l d1,-(sp)
    57d8:	2f00           	move.l d0,-(sp)
    57da:	2f2f 01d0      	move.l 464(sp),-(sp)
    57de:	2f2f 002e      	move.l 46(sp),-(sp)
    57e2:	4eba 15bc      	jsr 6da0 <TestRow>(pc)
    57e6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    57ea:	7230           	moveq #48,d1
    57ec:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    57f0:	222f 0136      	move.l 310(sp),d1
    57f4:	2001           	move.l d1,d0
    57f6:	d080           	add.l d0,d0
    57f8:	d081           	add.l d1,d0
    57fa:	2200           	move.l d0,d1
    57fc:	e789           	lsl.l #3,d1
    57fe:	2040           	movea.l d0,a0
    5800:	d1c1           	adda.l d1,a0
    5802:	41e8 0015      	lea 21(a0),a0
    5806:	2208           	move.l a0,d1
    5808:	d2af 012e      	add.l 302(sp),d1
    580c:	7000           	moveq #0,d0
    580e:	302f 01c6      	move.w 454(sp),d0
    5812:	2f01           	move.l d1,-(sp)
    5814:	2f00           	move.l d0,-(sp)
    5816:	2f2f 01d0      	move.l 464(sp),-(sp)
    581a:	2f2f 002e      	move.l 46(sp),-(sp)
    581e:	4eba 1580      	jsr 6da0 <TestRow>(pc)
    5822:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5826:	7430           	moveq #48,d2
    5828:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    582c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    5830:	52af 012e      	addq.l #1,302(sp)
    5834:	7008           	moveq #8,d0
    5836:	b0af 012e      	cmp.l 302(sp),d0
    583a:	6c00 ff78      	bge.w 57b4 <TestZoom4Picture+0x188a>
  for(int i=0;i<9;i++) {
    583e:	52af 0136      	addq.l #1,310(sp)
    5842:	7208           	moveq #8,d1
    5844:	b2af 0136      	cmp.l 310(sp),d1
    5848:	6c00 ff10      	bge.w 575a <TestZoom4Picture+0x1830>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    584c:	42af 012a      	clr.l 298(sp)
    5850:	6032           	bra.s 5884 <TestZoom4Picture+0x195a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    5852:	222f 012a      	move.l 298(sp),d1
    5856:	0681 0000 00f5 	addi.l #245,d1
    585c:	7000           	moveq #0,d0
    585e:	302f 01c6      	move.w 454(sp),d0
    5862:	2f01           	move.l d1,-(sp)
    5864:	2f00           	move.l d0,-(sp)
    5866:	2f2f 01d0      	move.l 464(sp),-(sp)
    586a:	2f2f 002e      	move.l 46(sp),-(sp)
    586e:	4eba 1530      	jsr 6da0 <TestRow>(pc)
    5872:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5876:	7430           	moveq #48,d2
    5878:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    587c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    5880:	52af 012a      	addq.l #1,298(sp)
    5884:	7008           	moveq #8,d0
    5886:	b0af 012a      	cmp.l 298(sp),d0
    588a:	6cc6           	bge.s 5852 <TestZoom4Picture+0x1928>
  }
  for(int i=0;i<5;i++) {
    588c:	42af 0126      	clr.l 294(sp)
    5890:	6064           	bra.s 58f6 <TestZoom4Picture+0x19cc>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    5892:	202f 0126      	move.l 294(sp),d0
    5896:	d080           	add.l d0,d0
    5898:	2200           	move.l d0,d1
    589a:	0681 0000 0103 	addi.l #259,d1
    58a0:	7000           	moveq #0,d0
    58a2:	302f 01c6      	move.w 454(sp),d0
    58a6:	2f01           	move.l d1,-(sp)
    58a8:	2f00           	move.l d0,-(sp)
    58aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    58ae:	2f2f 002e      	move.l 46(sp),-(sp)
    58b2:	4eba 14ec      	jsr 6da0 <TestRow>(pc)
    58b6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58ba:	7230           	moveq #48,d1
    58bc:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    58c0:	202f 0126      	move.l 294(sp),d0
    58c4:	0680 0000 0082 	addi.l #130,d0
    58ca:	d080           	add.l d0,d0
    58cc:	2200           	move.l d0,d1
    58ce:	7000           	moveq #0,d0
    58d0:	302f 01c6      	move.w 454(sp),d0
    58d4:	2f01           	move.l d1,-(sp)
    58d6:	2f00           	move.l d0,-(sp)
    58d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    58dc:	2f2f 002e      	move.l 46(sp),-(sp)
    58e0:	4eba 14be      	jsr 6da0 <TestRow>(pc)
    58e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    58e8:	7430           	moveq #48,d2
    58ea:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    58ee:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    58f2:	52af 0126      	addq.l #1,294(sp)
    58f6:	7004           	moveq #4,d0
    58f8:	b0af 0126      	cmp.l 294(sp),d0
    58fc:	6c94           	bge.s 5892 <TestZoom4Picture+0x1968>
  }
  TestRow( valsupposed, valactual, mask, 269);
    58fe:	7000           	moveq #0,d0
    5900:	302f 01c6      	move.w 454(sp),d0
    5904:	4878 010d      	pea 10d <WaitBlt+0x2d>
    5908:	2f00           	move.l d0,-(sp)
    590a:	2f2f 01d0      	move.l 464(sp),-(sp)
    590e:	2f2f 002e      	move.l 46(sp),-(sp)
    5912:	4eba 148c      	jsr 6da0 <TestRow>(pc)
    5916:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    591a:	7230           	moveq #48,d1
    591c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5920:	466f 01c6      	not.w 454(sp)

  tmp = source;
    5924:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    592a:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    5930:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    5936:	4878 0001      	pea 1 <_start+0x1>
    593a:	4878 0009      	pea 9 <GetVBR+0x1>
    593e:	2f2f 0042      	move.l 66(sp),-(sp)
    5942:	2f2f 006a      	move.l 106(sp),-(sp)
    5946:	4eba c114      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    594a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    594e:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    5954:	2c40           	movea.l d0,a6
    5956:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    595a:	242f 003a      	move.l 58(sp),d2
    595e:	5882           	addq.l #4,d2
    5960:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom10;
    5964:	2f7c 0001 b8f0 	move.l #112880,34(sp)
    596a:	0022 

  mask = 0xffff;
    596c:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    5972:	7000           	moveq #0,d0
    5974:	302f 01c6      	move.w 454(sp),d0
    5978:	42a7           	clr.l -(sp)
    597a:	2f00           	move.l d0,-(sp)
    597c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5980:	2f2f 002e      	move.l 46(sp),-(sp)
    5984:	4eba 141a      	jsr 6da0 <TestRow>(pc)
    5988:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    598c:	7030           	moveq #48,d0
    598e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5992:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    5996:	7000           	moveq #0,d0
    5998:	302f 01c6      	move.w 454(sp),d0
    599c:	4878 0001      	pea 1 <_start+0x1>
    59a0:	2f00           	move.l d0,-(sp)
    59a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    59a6:	2f2f 002e      	move.l 46(sp),-(sp)
    59aa:	4eba 13f4      	jsr 6da0 <TestRow>(pc)
    59ae:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    59b2:	7230           	moveq #48,d1
    59b4:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    59b8:	7000           	moveq #0,d0
    59ba:	302f 01c6      	move.w 454(sp),d0
    59be:	4878 0002      	pea 2 <_start+0x2>
    59c2:	2f00           	move.l d0,-(sp)
    59c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    59c8:	2f2f 002e      	move.l 46(sp),-(sp)
    59cc:	4eba 13d2      	jsr 6da0 <TestRow>(pc)
    59d0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    59d4:	7430           	moveq #48,d2
    59d6:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    59da:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    59de:	42af 0122      	clr.l 290(sp)
    59e2:	6000 00e0      	bra.w 5ac4 <TestZoom4Picture+0x1b9a>
    for(int i2=0;i2<8;i2++) {  
    59e6:	42af 011e      	clr.l 286(sp)
    59ea:	6040           	bra.s 5a2c <TestZoom4Picture+0x1b02>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    59ec:	206f 011e      	movea.l 286(sp),a0
    59f0:	5688           	addq.l #3,a0
    59f2:	222f 0122      	move.l 290(sp),d1
    59f6:	2001           	move.l d1,d0
    59f8:	e788           	lsl.l #3,d0
    59fa:	9081           	sub.l d1,d0
    59fc:	d080           	add.l d0,d0
    59fe:	d080           	add.l d0,d0
    5a00:	2208           	move.l a0,d1
    5a02:	d280           	add.l d0,d1
    5a04:	7000           	moveq #0,d0
    5a06:	302f 01c6      	move.w 454(sp),d0
    5a0a:	2f01           	move.l d1,-(sp)
    5a0c:	2f00           	move.l d0,-(sp)
    5a0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a12:	2f2f 002e      	move.l 46(sp),-(sp)
    5a16:	4eba 1388      	jsr 6da0 <TestRow>(pc)
    5a1a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a1e:	7030           	moveq #48,d0
    5a20:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a24:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    5a28:	52af 011e      	addq.l #1,286(sp)
    5a2c:	7207           	moveq #7,d1
    5a2e:	b2af 011e      	cmp.l 286(sp),d1
    5a32:	6cb8           	bge.s 59ec <TestZoom4Picture+0x1ac2>
    }
    
    for(int i2=0;i2<10;i2++) {
    5a34:	42af 011a      	clr.l 282(sp)
    5a38:	607c           	bra.s 5ab6 <TestZoom4Picture+0x1b8c>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    5a3a:	222f 0122      	move.l 290(sp),d1
    5a3e:	2001           	move.l d1,d0
    5a40:	e788           	lsl.l #3,d0
    5a42:	9081           	sub.l d1,d0
    5a44:	d080           	add.l d0,d0
    5a46:	d080           	add.l d0,d0
    5a48:	2040           	movea.l d0,a0
    5a4a:	41e8 000b      	lea 11(a0),a0
    5a4e:	2208           	move.l a0,d1
    5a50:	d2af 011a      	add.l 282(sp),d1
    5a54:	7000           	moveq #0,d0
    5a56:	302f 01c6      	move.w 454(sp),d0
    5a5a:	2f01           	move.l d1,-(sp)
    5a5c:	2f00           	move.l d0,-(sp)
    5a5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a62:	2f2f 002e      	move.l 46(sp),-(sp)
    5a66:	4eba 1338      	jsr 6da0 <TestRow>(pc)
    5a6a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a6e:	7430           	moveq #48,d2
    5a70:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    5a74:	222f 0122      	move.l 290(sp),d1
    5a78:	2001           	move.l d1,d0
    5a7a:	e788           	lsl.l #3,d0
    5a7c:	9081           	sub.l d1,d0
    5a7e:	d080           	add.l d0,d0
    5a80:	d080           	add.l d0,d0
    5a82:	2040           	movea.l d0,a0
    5a84:	41e8 000b      	lea 11(a0),a0
    5a88:	2208           	move.l a0,d1
    5a8a:	d2af 011a      	add.l 282(sp),d1
    5a8e:	7000           	moveq #0,d0
    5a90:	302f 01c6      	move.w 454(sp),d0
    5a94:	2f01           	move.l d1,-(sp)
    5a96:	2f00           	move.l d0,-(sp)
    5a98:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a9c:	2f2f 002e      	move.l 46(sp),-(sp)
    5aa0:	4eba 12fe      	jsr 6da0 <TestRow>(pc)
    5aa4:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5aa8:	7030           	moveq #48,d0
    5aaa:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5aae:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    5ab2:	52af 011a      	addq.l #1,282(sp)
    5ab6:	7209           	moveq #9,d1
    5ab8:	b2af 011a      	cmp.l 282(sp),d1
    5abc:	6c00 ff7c      	bge.w 5a3a <TestZoom4Picture+0x1b10>
  for(int i=0;i<9;i++) {
    5ac0:	52af 0122      	addq.l #1,290(sp)
    5ac4:	7408           	moveq #8,d2
    5ac6:	b4af 0122      	cmp.l 290(sp),d2
    5aca:	6c00 ff1a      	bge.w 59e6 <TestZoom4Picture+0x1abc>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    5ace:	42af 0116      	clr.l 278(sp)
    5ad2:	6032           	bra.s 5b06 <TestZoom4Picture+0x1bdc>
    TestRow( valsupposed, valactual, mask, 255+i2);
    5ad4:	222f 0116      	move.l 278(sp),d1
    5ad8:	0681 0000 00ff 	addi.l #255,d1
    5ade:	7000           	moveq #0,d0
    5ae0:	302f 01c6      	move.w 454(sp),d0
    5ae4:	2f01           	move.l d1,-(sp)
    5ae6:	2f00           	move.l d0,-(sp)
    5ae8:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aec:	2f2f 002e      	move.l 46(sp),-(sp)
    5af0:	4eba 12ae      	jsr 6da0 <TestRow>(pc)
    5af4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5af8:	7030           	moveq #48,d0
    5afa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5afe:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    5b02:	52af 0116      	addq.l #1,278(sp)
    5b06:	7207           	moveq #7,d1
    5b08:	b2af 0116      	cmp.l 278(sp),d1
    5b0c:	6cc6           	bge.s 5ad4 <TestZoom4Picture+0x1baa>
  }
  for(int i=0;i<3;i++) {
    5b0e:	42af 0112      	clr.l 274(sp)
    5b12:	6064           	bra.s 5b78 <TestZoom4Picture+0x1c4e>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    5b14:	202f 0112      	move.l 274(sp),d0
    5b18:	d080           	add.l d0,d0
    5b1a:	2200           	move.l d0,d1
    5b1c:	0681 0000 0107 	addi.l #263,d1
    5b22:	7000           	moveq #0,d0
    5b24:	302f 01c6      	move.w 454(sp),d0
    5b28:	2f01           	move.l d1,-(sp)
    5b2a:	2f00           	move.l d0,-(sp)
    5b2c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b30:	2f2f 002e      	move.l 46(sp),-(sp)
    5b34:	4eba 126a      	jsr 6da0 <TestRow>(pc)
    5b38:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b3c:	7430           	moveq #48,d2
    5b3e:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    5b42:	202f 0112      	move.l 274(sp),d0
    5b46:	0680 0000 0084 	addi.l #132,d0
    5b4c:	d080           	add.l d0,d0
    5b4e:	2200           	move.l d0,d1
    5b50:	7000           	moveq #0,d0
    5b52:	302f 01c6      	move.w 454(sp),d0
    5b56:	2f01           	move.l d1,-(sp)
    5b58:	2f00           	move.l d0,-(sp)
    5b5a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b5e:	2f2f 002e      	move.l 46(sp),-(sp)
    5b62:	4eba 123c      	jsr 6da0 <TestRow>(pc)
    5b66:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b6a:	7030           	moveq #48,d0
    5b6c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5b70:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    5b74:	52af 0112      	addq.l #1,274(sp)
    5b78:	7202           	moveq #2,d1
    5b7a:	b2af 0112      	cmp.l 274(sp),d1
    5b7e:	6c94           	bge.s 5b14 <TestZoom4Picture+0x1bea>
  }

  tmp = source;
    5b80:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    5b86:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    5b8c:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    5b92:	4878 0001      	pea 1 <_start+0x1>
    5b96:	4878 000a      	pea a <GetVBR+0x2>
    5b9a:	2f2f 0042      	move.l 66(sp),-(sp)
    5b9e:	2f2f 006a      	move.l 106(sp),-(sp)
    5ba2:	4eba beb8      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    5ba6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5baa:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    5bb0:	2c40           	movea.l d0,a6
    5bb2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5bb6:	242f 003a      	move.l 58(sp),d2
    5bba:	5882           	addq.l #4,d2
    5bbc:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom11;
    5bc0:	2f7c 0001 b91c 	move.l #112924,34(sp)
    5bc6:	0022 

  mask = 0xffff;
    5bc8:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    5bce:	42af 010e      	clr.l 270(sp)
    5bd2:	602a           	bra.s 5bfe <TestZoom4Picture+0x1cd4>
    TestRow( valsupposed, valactual, mask, i2);
    5bd4:	7000           	moveq #0,d0
    5bd6:	302f 01c6      	move.w 454(sp),d0
    5bda:	2f2f 010e      	move.l 270(sp),-(sp)
    5bde:	2f00           	move.l d0,-(sp)
    5be0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5be4:	2f2f 002e      	move.l 46(sp),-(sp)
    5be8:	4eba 11b6      	jsr 6da0 <TestRow>(pc)
    5bec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bf0:	7030           	moveq #48,d0
    5bf2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5bf6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    5bfa:	52af 010e      	addq.l #1,270(sp)
    5bfe:	7205           	moveq #5,d1
    5c00:	b2af 010e      	cmp.l 270(sp),d1
    5c04:	6cce           	bge.s 5bd4 <TestZoom4Picture+0x1caa>
  }

  for(int i2=0;i2<11;i2++) {
    5c06:	42af 010a      	clr.l 266(sp)
    5c0a:	605c           	bra.s 5c68 <TestZoom4Picture+0x1d3e>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    5c0c:	202f 010a      	move.l 266(sp),d0
    5c10:	5680           	addq.l #3,d0
    5c12:	d080           	add.l d0,d0
    5c14:	2200           	move.l d0,d1
    5c16:	7000           	moveq #0,d0
    5c18:	302f 01c6      	move.w 454(sp),d0
    5c1c:	2f01           	move.l d1,-(sp)
    5c1e:	2f00           	move.l d0,-(sp)
    5c20:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c24:	2f2f 002e      	move.l 46(sp),-(sp)
    5c28:	4eba 1176      	jsr 6da0 <TestRow>(pc)
    5c2c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c30:	7430           	moveq #48,d2
    5c32:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    5c36:	202f 010a      	move.l 266(sp),d0
    5c3a:	d080           	add.l d0,d0
    5c3c:	2200           	move.l d0,d1
    5c3e:	5e81           	addq.l #7,d1
    5c40:	7000           	moveq #0,d0
    5c42:	302f 01c6      	move.w 454(sp),d0
    5c46:	2f01           	move.l d1,-(sp)
    5c48:	2f00           	move.l d0,-(sp)
    5c4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c4e:	2f2f 002e      	move.l 46(sp),-(sp)
    5c52:	4eba 114c      	jsr 6da0 <TestRow>(pc)
    5c56:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c5a:	7030           	moveq #48,d0
    5c5c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5c60:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5c64:	52af 010a      	addq.l #1,266(sp)
    5c68:	720a           	moveq #10,d1
    5c6a:	b2af 010a      	cmp.l 266(sp),d1
    5c6e:	6c9c           	bge.s 5c0c <TestZoom4Picture+0x1ce2>
  }

  for(int i=0;i<8;i++) {
    5c70:	42af 0106      	clr.l 262(sp)
    5c74:	6000 00f2      	bra.w 5d68 <TestZoom4Picture+0x1e3e>
    for(int i2=0;i2<7;i2++) {  
    5c78:	42af 0102      	clr.l 258(sp)
    5c7c:	6044           	bra.s 5cc2 <TestZoom4Picture+0x1d98>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    5c7e:	307c 001c      	movea.w #28,a0
    5c82:	d1ef 0102      	adda.l 258(sp),a0
    5c86:	222f 0106      	move.l 262(sp),d1
    5c8a:	2001           	move.l d1,d0
    5c8c:	e788           	lsl.l #3,d0
    5c8e:	9081           	sub.l d1,d0
    5c90:	d080           	add.l d0,d0
    5c92:	d080           	add.l d0,d0
    5c94:	d081           	add.l d1,d0
    5c96:	2208           	move.l a0,d1
    5c98:	d280           	add.l d0,d1
    5c9a:	7000           	moveq #0,d0
    5c9c:	302f 01c6      	move.w 454(sp),d0
    5ca0:	2f01           	move.l d1,-(sp)
    5ca2:	2f00           	move.l d0,-(sp)
    5ca4:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ca8:	2f2f 002e      	move.l 46(sp),-(sp)
    5cac:	4eba 10f2      	jsr 6da0 <TestRow>(pc)
    5cb0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cb4:	7430           	moveq #48,d2
    5cb6:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5cba:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    5cbe:	52af 0102      	addq.l #1,258(sp)
    5cc2:	7006           	moveq #6,d0
    5cc4:	b0af 0102      	cmp.l 258(sp),d0
    5cc8:	6cb4           	bge.s 5c7e <TestZoom4Picture+0x1d54>
    }
    
    for(int i2=0;i2<11;i2++) {
    5cca:	42af 00fe      	clr.l 254(sp)
    5cce:	6000 008a      	bra.w 5d5a <TestZoom4Picture+0x1e30>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    5cd2:	222f 0106      	move.l 262(sp),d1
    5cd6:	2001           	move.l d1,d0
    5cd8:	e788           	lsl.l #3,d0
    5cda:	9081           	sub.l d1,d0
    5cdc:	d080           	add.l d0,d0
    5cde:	d080           	add.l d0,d0
    5ce0:	2040           	movea.l d0,a0
    5ce2:	d1c1           	adda.l d1,a0
    5ce4:	41e8 0023      	lea 35(a0),a0
    5ce8:	202f 00fe      	move.l 254(sp),d0
    5cec:	d080           	add.l d0,d0
    5cee:	2208           	move.l a0,d1
    5cf0:	d280           	add.l d0,d1
    5cf2:	7000           	moveq #0,d0
    5cf4:	302f 01c6      	move.w 454(sp),d0
    5cf8:	2f01           	move.l d1,-(sp)
    5cfa:	2f00           	move.l d0,-(sp)
    5cfc:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d00:	2f2f 002e      	move.l 46(sp),-(sp)
    5d04:	4eba 109a      	jsr 6da0 <TestRow>(pc)
    5d08:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d0c:	7230           	moveq #48,d1
    5d0e:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    5d12:	222f 0106      	move.l 262(sp),d1
    5d16:	2001           	move.l d1,d0
    5d18:	e788           	lsl.l #3,d0
    5d1a:	9081           	sub.l d1,d0
    5d1c:	d080           	add.l d0,d0
    5d1e:	d080           	add.l d0,d0
    5d20:	2040           	movea.l d0,a0
    5d22:	d1c1           	adda.l d1,a0
    5d24:	41e8 000b      	lea 11(a0),a0
    5d28:	202f 00fe      	move.l 254(sp),d0
    5d2c:	d080           	add.l d0,d0
    5d2e:	2208           	move.l a0,d1
    5d30:	d280           	add.l d0,d1
    5d32:	7000           	moveq #0,d0
    5d34:	302f 01c6      	move.w 454(sp),d0
    5d38:	2f01           	move.l d1,-(sp)
    5d3a:	2f00           	move.l d0,-(sp)
    5d3c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d40:	2f2f 002e      	move.l 46(sp),-(sp)
    5d44:	4eba 105a      	jsr 6da0 <TestRow>(pc)
    5d48:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d4c:	7430           	moveq #48,d2
    5d4e:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5d52:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    5d56:	52af 00fe      	addq.l #1,254(sp)
    5d5a:	700a           	moveq #10,d0
    5d5c:	b0af 00fe      	cmp.l 254(sp),d0
    5d60:	6c00 ff70      	bge.w 5cd2 <TestZoom4Picture+0x1da8>
  for(int i=0;i<8;i++) {
    5d64:	52af 0106      	addq.l #1,262(sp)
    5d68:	7207           	moveq #7,d1
    5d6a:	b2af 0106      	cmp.l 262(sp),d1
    5d6e:	6c00 ff08      	bge.w 5c78 <TestZoom4Picture+0x1d4e>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    5d72:	42af 00fa      	clr.l 250(sp)
    5d76:	6032           	bra.s 5daa <TestZoom4Picture+0x1e80>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5d78:	222f 00fa      	move.l 250(sp),d1
    5d7c:	0681 0000 0104 	addi.l #260,d1
    5d82:	7000           	moveq #0,d0
    5d84:	302f 01c6      	move.w 454(sp),d0
    5d88:	2f01           	move.l d1,-(sp)
    5d8a:	2f00           	move.l d0,-(sp)
    5d8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d90:	2f2f 002e      	move.l 46(sp),-(sp)
    5d94:	4eba 100a      	jsr 6da0 <TestRow>(pc)
    5d98:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d9c:	7430           	moveq #48,d2
    5d9e:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    5da2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    5da6:	52af 00fa      	addq.l #1,250(sp)
    5daa:	7006           	moveq #6,d0
    5dac:	b0af 00fa      	cmp.l 250(sp),d0
    5db0:	6cc6           	bge.s 5d78 <TestZoom4Picture+0x1e4e>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    5db2:	7000           	moveq #0,d0
    5db4:	302f 01c6      	move.w 454(sp),d0
    5db8:	4878 010b      	pea 10b <WaitBlt+0x2b>
    5dbc:	2f00           	move.l d0,-(sp)
    5dbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dc2:	2f2f 002e      	move.l 46(sp),-(sp)
    5dc6:	4eba 0fd8      	jsr 6da0 <TestRow>(pc)
    5dca:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5dce:	7230           	moveq #48,d1
    5dd0:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    5dd4:	7000           	moveq #0,d0
    5dd6:	302f 01c6      	move.w 454(sp),d0
    5dda:	4878 010c      	pea 10c <WaitBlt+0x2c>
    5dde:	2f00           	move.l d0,-(sp)
    5de0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5de4:	2f2f 002e      	move.l 46(sp),-(sp)
    5de8:	4eba 0fb6      	jsr 6da0 <TestRow>(pc)
    5dec:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5df0:	7430           	moveq #48,d2
    5df2:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    5df6:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    5dfa:	7000           	moveq #0,d0
    5dfc:	302f 01c6      	move.w 454(sp),d0
    5e00:	4878 010d      	pea 10d <WaitBlt+0x2d>
    5e04:	2f00           	move.l d0,-(sp)
    5e06:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e0a:	2f2f 002e      	move.l 46(sp),-(sp)
    5e0e:	4eba 0f90      	jsr 6da0 <TestRow>(pc)
    5e12:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5e16:	7030           	moveq #48,d0
    5e18:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    5e1c:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    5e22:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    5e28:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    5e2e:	4878 0001      	pea 1 <_start+0x1>
    5e32:	4878 000b      	pea b <GetVBR+0x3>
    5e36:	2f2f 0042      	move.l 66(sp),-(sp)
    5e3a:	2f2f 006a      	move.l 106(sp),-(sp)
    5e3e:	4eba bc1c      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    5e42:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5e46:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    5e4c:	2c40           	movea.l d0,a6
    5e4e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5e52:	222f 003a      	move.l 58(sp),d1
    5e56:	5881           	addq.l #4,d1
    5e58:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    5e5c:	2f7c 0001 b948 	move.l #112968,34(sp)
    5e62:	0022 

  mask = 0x0;
    5e64:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    5e68:	7000           	moveq #0,d0
    5e6a:	302f 01c6      	move.w 454(sp),d0
    5e6e:	42a7           	clr.l -(sp)
    5e70:	2f00           	move.l d0,-(sp)
    5e72:	2f2f 01d0      	move.l 464(sp),-(sp)
    5e76:	2f2f 002e      	move.l 46(sp),-(sp)
    5e7a:	4eba 0f24      	jsr 6da0 <TestRow>(pc)
    5e7e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5e82:	7430           	moveq #48,d2
    5e84:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    5e88:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    5e8c:	42af 00f6      	clr.l 246(sp)
    5e90:	605c           	bra.s 5eee <TestZoom4Picture+0x1fc4>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5e92:	202f 00f6      	move.l 246(sp),d0
    5e96:	d080           	add.l d0,d0
    5e98:	2200           	move.l d0,d1
    5e9a:	5281           	addq.l #1,d1
    5e9c:	7000           	moveq #0,d0
    5e9e:	302f 01c6      	move.w 454(sp),d0
    5ea2:	2f01           	move.l d1,-(sp)
    5ea4:	2f00           	move.l d0,-(sp)
    5ea6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5eaa:	2f2f 002e      	move.l 46(sp),-(sp)
    5eae:	4eba 0ef0      	jsr 6da0 <TestRow>(pc)
    5eb2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5eb6:	7030           	moveq #48,d0
    5eb8:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5ebc:	202f 00f6      	move.l 246(sp),d0
    5ec0:	5280           	addq.l #1,d0
    5ec2:	d080           	add.l d0,d0
    5ec4:	2200           	move.l d0,d1
    5ec6:	7000           	moveq #0,d0
    5ec8:	302f 01c6      	move.w 454(sp),d0
    5ecc:	2f01           	move.l d1,-(sp)
    5ece:	2f00           	move.l d0,-(sp)
    5ed0:	2f2f 01d0      	move.l 464(sp),-(sp)
    5ed4:	2f2f 002e      	move.l 46(sp),-(sp)
    5ed8:	4eba 0ec6      	jsr 6da0 <TestRow>(pc)
    5edc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5ee0:	7230           	moveq #48,d1
    5ee2:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5ee6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    5eea:	52af 00f6      	addq.l #1,246(sp)
    5eee:	740b           	moveq #11,d2
    5ef0:	b4af 00f6      	cmp.l 246(sp),d2
    5ef4:	6c9c           	bge.s 5e92 <TestZoom4Picture+0x1f68>
  } 

  for(int i=0;i<8;i++) {
    5ef6:	42af 00f2      	clr.l 242(sp)
    5efa:	6000 00e6      	bra.w 5fe2 <TestZoom4Picture+0x20b8>
    for(int i2=0;i2<6;i2++) {  
    5efe:	42af 00ee      	clr.l 238(sp)
    5f02:	6040           	bra.s 5f44 <TestZoom4Picture+0x201a>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    5f04:	307c 0019      	movea.w #25,a0
    5f08:	d1ef 00ee      	adda.l 238(sp),a0
    5f0c:	222f 00f2      	move.l 242(sp),d1
    5f10:	2001           	move.l d1,d0
    5f12:	e988           	lsl.l #4,d0
    5f14:	9081           	sub.l d1,d0
    5f16:	d080           	add.l d0,d0
    5f18:	2208           	move.l a0,d1
    5f1a:	d280           	add.l d0,d1
    5f1c:	7000           	moveq #0,d0
    5f1e:	302f 01c6      	move.w 454(sp),d0
    5f22:	2f01           	move.l d1,-(sp)
    5f24:	2f00           	move.l d0,-(sp)
    5f26:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f2a:	2f2f 002e      	move.l 46(sp),-(sp)
    5f2e:	4eba 0e70      	jsr 6da0 <TestRow>(pc)
    5f32:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f36:	7030           	moveq #48,d0
    5f38:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5f3c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    5f40:	52af 00ee      	addq.l #1,238(sp)
    5f44:	7205           	moveq #5,d1
    5f46:	b2af 00ee      	cmp.l 238(sp),d1
    5f4a:	6cb8           	bge.s 5f04 <TestZoom4Picture+0x1fda>
    }
    
    for(int i2=0;i2<12;i2++) {
    5f4c:	42af 00ea      	clr.l 234(sp)
    5f50:	6000 0082      	bra.w 5fd4 <TestZoom4Picture+0x20aa>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    5f54:	222f 00f2      	move.l 242(sp),d1
    5f58:	2001           	move.l d1,d0
    5f5a:	e988           	lsl.l #4,d0
    5f5c:	9081           	sub.l d1,d0
    5f5e:	d080           	add.l d0,d0
    5f60:	2040           	movea.l d0,a0
    5f62:	41e8 001f      	lea 31(a0),a0
    5f66:	202f 00ea      	move.l 234(sp),d0
    5f6a:	d080           	add.l d0,d0
    5f6c:	2208           	move.l a0,d1
    5f6e:	d280           	add.l d0,d1
    5f70:	7000           	moveq #0,d0
    5f72:	302f 01c6      	move.w 454(sp),d0
    5f76:	2f01           	move.l d1,-(sp)
    5f78:	2f00           	move.l d0,-(sp)
    5f7a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5f7e:	2f2f 002e      	move.l 46(sp),-(sp)
    5f82:	4eba 0e1c      	jsr 6da0 <TestRow>(pc)
    5f86:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5f8a:	7430           	moveq #48,d2
    5f8c:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    5f90:	222f 00f2      	move.l 242(sp),d1
    5f94:	2001           	move.l d1,d0
    5f96:	e988           	lsl.l #4,d0
    5f98:	9081           	sub.l d1,d0
    5f9a:	d080           	add.l d0,d0
    5f9c:	2040           	movea.l d0,a0
    5f9e:	41e8 0020      	lea 32(a0),a0
    5fa2:	202f 00ea      	move.l 234(sp),d0
    5fa6:	d080           	add.l d0,d0
    5fa8:	2208           	move.l a0,d1
    5faa:	d280           	add.l d0,d1
    5fac:	7000           	moveq #0,d0
    5fae:	302f 01c6      	move.w 454(sp),d0
    5fb2:	2f01           	move.l d1,-(sp)
    5fb4:	2f00           	move.l d0,-(sp)
    5fb6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5fba:	2f2f 002e      	move.l 46(sp),-(sp)
    5fbe:	4eba 0de0      	jsr 6da0 <TestRow>(pc)
    5fc2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5fc6:	7030           	moveq #48,d0
    5fc8:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5fcc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    5fd0:	52af 00ea      	addq.l #1,234(sp)
    5fd4:	720b           	moveq #11,d1
    5fd6:	b2af 00ea      	cmp.l 234(sp),d1
    5fda:	6c00 ff78      	bge.w 5f54 <TestZoom4Picture+0x202a>
  for(int i=0;i<8;i++) {
    5fde:	52af 00f2      	addq.l #1,242(sp)
    5fe2:	7407           	moveq #7,d2
    5fe4:	b4af 00f2      	cmp.l 242(sp),d2
    5fe8:	6c00 ff14      	bge.w 5efe <TestZoom4Picture+0x1fd4>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    5fec:	42af 00e6      	clr.l 230(sp)
    5ff0:	6032           	bra.s 6024 <TestZoom4Picture+0x20fa>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5ff2:	222f 00e6      	move.l 230(sp),d1
    5ff6:	0681 0000 0104 	addi.l #260,d1
    5ffc:	7000           	moveq #0,d0
    5ffe:	302f 01c6      	move.w 454(sp),d0
    6002:	2f01           	move.l d1,-(sp)
    6004:	2f00           	move.l d0,-(sp)
    6006:	2f2f 01d0      	move.l 464(sp),-(sp)
    600a:	2f2f 002e      	move.l 46(sp),-(sp)
    600e:	4eba 0d90      	jsr 6da0 <TestRow>(pc)
    6012:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6016:	7030           	moveq #48,d0
    6018:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    601c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    6020:	52af 00e6      	addq.l #1,230(sp)
    6024:	7204           	moveq #4,d1
    6026:	b2af 00e6      	cmp.l 230(sp),d1
    602a:	6cc6           	bge.s 5ff2 <TestZoom4Picture+0x20c8>
  }

  tmp = source;
    602c:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    6032:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    6038:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    603e:	4878 0001      	pea 1 <_start+0x1>
    6042:	4878 000c      	pea c <GetVBR+0x4>
    6046:	2f2f 0042      	move.l 66(sp),-(sp)
    604a:	2f2f 006a      	move.l 106(sp),-(sp)
    604e:	4eba ba0c      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    6052:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6056:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    605c:	2c40           	movea.l d0,a6
    605e:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6062:	242f 003a      	move.l 58(sp),d2
    6066:	5882           	addq.l #4,d2
    6068:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom13;
    606c:	2f7c 0001 b974 	move.l #113012,34(sp)
    6072:	0022 

  mask = 0xffff;
    6074:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    607a:	42af 00e2      	clr.l 226(sp)
    607e:	605a           	bra.s 60da <TestZoom4Picture+0x21b0>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6080:	202f 00e2      	move.l 226(sp),d0
    6084:	d080           	add.l d0,d0
    6086:	2200           	move.l d0,d1
    6088:	7000           	moveq #0,d0
    608a:	302f 01c6      	move.w 454(sp),d0
    608e:	2f01           	move.l d1,-(sp)
    6090:	2f00           	move.l d0,-(sp)
    6092:	2f2f 01d0      	move.l 464(sp),-(sp)
    6096:	2f2f 002e      	move.l 46(sp),-(sp)
    609a:	4eba 0d04      	jsr 6da0 <TestRow>(pc)
    609e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60a2:	7030           	moveq #48,d0
    60a4:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    60a8:	202f 00e2      	move.l 226(sp),d0
    60ac:	d080           	add.l d0,d0
    60ae:	2200           	move.l d0,d1
    60b0:	5281           	addq.l #1,d1
    60b2:	7000           	moveq #0,d0
    60b4:	302f 01c6      	move.w 454(sp),d0
    60b8:	2f01           	move.l d1,-(sp)
    60ba:	2f00           	move.l d0,-(sp)
    60bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    60c0:	2f2f 002e      	move.l 46(sp),-(sp)
    60c4:	4eba 0cda      	jsr 6da0 <TestRow>(pc)
    60c8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    60cc:	7230           	moveq #48,d1
    60ce:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    60d2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    60d6:	52af 00e2      	addq.l #1,226(sp)
    60da:	740a           	moveq #10,d2
    60dc:	b4af 00e2      	cmp.l 226(sp),d2
    60e0:	6c9e           	bge.s 6080 <TestZoom4Picture+0x2156>
  } 

  for(int i=0;i<8;i++) {
    60e2:	42af 00de      	clr.l 222(sp)
    60e6:	6000 00de      	bra.w 61c6 <TestZoom4Picture+0x229c>
    for(int i2=0;i2<5;i2++) {  
    60ea:	42af 00da      	clr.l 218(sp)
    60ee:	603e           	bra.s 612e <TestZoom4Picture+0x2204>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    60f0:	307c 0016      	movea.w #22,a0
    60f4:	d1ef 00da      	adda.l 218(sp),a0
    60f8:	222f 00de      	move.l 222(sp),d1
    60fc:	2001           	move.l d1,d0
    60fe:	eb88           	lsl.l #5,d0
    6100:	9081           	sub.l d1,d0
    6102:	2208           	move.l a0,d1
    6104:	d280           	add.l d0,d1
    6106:	7000           	moveq #0,d0
    6108:	302f 01c6      	move.w 454(sp),d0
    610c:	2f01           	move.l d1,-(sp)
    610e:	2f00           	move.l d0,-(sp)
    6110:	2f2f 01d0      	move.l 464(sp),-(sp)
    6114:	2f2f 002e      	move.l 46(sp),-(sp)
    6118:	4eba 0c86      	jsr 6da0 <TestRow>(pc)
    611c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6120:	7030           	moveq #48,d0
    6122:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6126:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    612a:	52af 00da      	addq.l #1,218(sp)
    612e:	7204           	moveq #4,d1
    6130:	b2af 00da      	cmp.l 218(sp),d1
    6134:	6cba           	bge.s 60f0 <TestZoom4Picture+0x21c6>
    }
    
    for(int i2=0;i2<13;i2++) {
    6136:	42af 00d6      	clr.l 214(sp)
    613a:	607c           	bra.s 61b8 <TestZoom4Picture+0x228e>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    613c:	222f 00de      	move.l 222(sp),d1
    6140:	2001           	move.l d1,d0
    6142:	eb88           	lsl.l #5,d0
    6144:	2040           	movea.l d0,a0
    6146:	91c1           	suba.l d1,a0
    6148:	41e8 001b      	lea 27(a0),a0
    614c:	202f 00d6      	move.l 214(sp),d0
    6150:	d080           	add.l d0,d0
    6152:	2208           	move.l a0,d1
    6154:	d280           	add.l d0,d1
    6156:	7000           	moveq #0,d0
    6158:	302f 01c6      	move.w 454(sp),d0
    615c:	2f01           	move.l d1,-(sp)
    615e:	2f00           	move.l d0,-(sp)
    6160:	2f2f 01d0      	move.l 464(sp),-(sp)
    6164:	2f2f 002e      	move.l 46(sp),-(sp)
    6168:	4eba 0c36      	jsr 6da0 <TestRow>(pc)
    616c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6170:	7430           	moveq #48,d2
    6172:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    6176:	222f 00de      	move.l 222(sp),d1
    617a:	2001           	move.l d1,d0
    617c:	eb88           	lsl.l #5,d0
    617e:	2040           	movea.l d0,a0
    6180:	91c1           	suba.l d1,a0
    6182:	41e8 001c      	lea 28(a0),a0
    6186:	202f 00d6      	move.l 214(sp),d0
    618a:	d080           	add.l d0,d0
    618c:	2208           	move.l a0,d1
    618e:	d280           	add.l d0,d1
    6190:	7000           	moveq #0,d0
    6192:	302f 01c6      	move.w 454(sp),d0
    6196:	2f01           	move.l d1,-(sp)
    6198:	2f00           	move.l d0,-(sp)
    619a:	2f2f 01d0      	move.l 464(sp),-(sp)
    619e:	2f2f 002e      	move.l 46(sp),-(sp)
    61a2:	4eba 0bfc      	jsr 6da0 <TestRow>(pc)
    61a6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    61aa:	7030           	moveq #48,d0
    61ac:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    61b0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    61b4:	52af 00d6      	addq.l #1,214(sp)
    61b8:	720c           	moveq #12,d1
    61ba:	b2af 00d6      	cmp.l 214(sp),d1
    61be:	6c00 ff7c      	bge.w 613c <TestZoom4Picture+0x2212>
  for(int i=0;i<8;i++) {
    61c2:	52af 00de      	addq.l #1,222(sp)
    61c6:	7407           	moveq #7,d2
    61c8:	b4af 00de      	cmp.l 222(sp),d2
    61cc:	6c00 ff1c      	bge.w 60ea <TestZoom4Picture+0x21c0>
    }
  } 

  tmp = source;
    61d0:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    61d6:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    61dc:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    61e2:	4878 0001      	pea 1 <_start+0x1>
    61e6:	4878 000d      	pea d <GetVBR+0x5>
    61ea:	2f2f 0042      	move.l 66(sp),-(sp)
    61ee:	2f2f 006a      	move.l 106(sp),-(sp)
    61f2:	4eba b868      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    61f6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    61fa:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    6200:	2c40           	movea.l d0,a6
    6202:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6206:	202f 003a      	move.l 58(sp),d0
    620a:	5880           	addq.l #4,d0
    620c:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    6210:	2f7c 0001 b9a0 	move.l #113056,34(sp)
    6216:	0022 

  mask = 0xffff;
    6218:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    621e:	7000           	moveq #0,d0
    6220:	302f 01c6      	move.w 454(sp),d0
    6224:	42a7           	clr.l -(sp)
    6226:	2f00           	move.l d0,-(sp)
    6228:	2f2f 01d0      	move.l 464(sp),-(sp)
    622c:	2f2f 002e      	move.l 46(sp),-(sp)
    6230:	4eba 0b6e      	jsr 6da0 <TestRow>(pc)
    6234:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    6238:	7230           	moveq #48,d1
    623a:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    623e:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    6242:	42af 00d2      	clr.l 210(sp)
    6246:	605c           	bra.s 62a4 <TestZoom4Picture+0x237a>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6248:	202f 00d2      	move.l 210(sp),d0
    624c:	d080           	add.l d0,d0
    624e:	2200           	move.l d0,d1
    6250:	5281           	addq.l #1,d1
    6252:	7000           	moveq #0,d0
    6254:	302f 01c6      	move.w 454(sp),d0
    6258:	2f01           	move.l d1,-(sp)
    625a:	2f00           	move.l d0,-(sp)
    625c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6260:	2f2f 002e      	move.l 46(sp),-(sp)
    6264:	4eba 0b3a      	jsr 6da0 <TestRow>(pc)
    6268:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    626c:	7430           	moveq #48,d2
    626e:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6272:	202f 00d2      	move.l 210(sp),d0
    6276:	5280           	addq.l #1,d0
    6278:	d080           	add.l d0,d0
    627a:	2200           	move.l d0,d1
    627c:	7000           	moveq #0,d0
    627e:	302f 01c6      	move.w 454(sp),d0
    6282:	2f01           	move.l d1,-(sp)
    6284:	2f00           	move.l d0,-(sp)
    6286:	2f2f 01d0      	move.l 464(sp),-(sp)
    628a:	2f2f 002e      	move.l 46(sp),-(sp)
    628e:	4eba 0b10      	jsr 6da0 <TestRow>(pc)
    6292:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6296:	7030           	moveq #48,d0
    6298:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    629c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    62a0:	52af 00d2      	addq.l #1,210(sp)
    62a4:	7208           	moveq #8,d1
    62a6:	b2af 00d2      	cmp.l 210(sp),d1
    62aa:	6c9c           	bge.s 6248 <TestZoom4Picture+0x231e>
  } 

  for(int i=0;i<7;i++) {
    62ac:	42af 00ce      	clr.l 206(sp)
    62b0:	6000 00cc      	bra.w 637e <TestZoom4Picture+0x2454>
    for(int i2=0;i2<4;i2++) {  
    62b4:	42af 00ca      	clr.l 202(sp)
    62b8:	6036           	bra.s 62f0 <TestZoom4Picture+0x23c6>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    62ba:	7213           	moveq #19,d1
    62bc:	d2af 00ca      	add.l 202(sp),d1
    62c0:	202f 00ce      	move.l 206(sp),d0
    62c4:	eb88           	lsl.l #5,d0
    62c6:	d280           	add.l d0,d1
    62c8:	7000           	moveq #0,d0
    62ca:	302f 01c6      	move.w 454(sp),d0
    62ce:	2f01           	move.l d1,-(sp)
    62d0:	2f00           	move.l d0,-(sp)
    62d2:	2f2f 01d0      	move.l 464(sp),-(sp)
    62d6:	2f2f 002e      	move.l 46(sp),-(sp)
    62da:	4eba 0ac4      	jsr 6da0 <TestRow>(pc)
    62de:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    62e2:	7430           	moveq #48,d2
    62e4:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    62e8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    62ec:	52af 00ca      	addq.l #1,202(sp)
    62f0:	7003           	moveq #3,d0
    62f2:	b0af 00ca      	cmp.l 202(sp),d0
    62f6:	6cc2           	bge.s 62ba <TestZoom4Picture+0x2390>
    }
    
    for(int i2=0;i2<14;i2++) {
    62f8:	42af 00c6      	clr.l 198(sp)
    62fc:	6074           	bra.s 6372 <TestZoom4Picture+0x2448>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    62fe:	202f 00ce      	move.l 206(sp),d0
    6302:	eb88           	lsl.l #5,d0
    6304:	307c 0017      	movea.w #23,a0
    6308:	d1c0           	adda.l d0,a0
    630a:	202f 00c6      	move.l 198(sp),d0
    630e:	d080           	add.l d0,d0
    6310:	2208           	move.l a0,d1
    6312:	d280           	add.l d0,d1
    6314:	7000           	moveq #0,d0
    6316:	302f 01c6      	move.w 454(sp),d0
    631a:	2f01           	move.l d1,-(sp)
    631c:	2f00           	move.l d0,-(sp)
    631e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6322:	2f2f 002e      	move.l 46(sp),-(sp)
    6326:	4eba 0a78      	jsr 6da0 <TestRow>(pc)
    632a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    632e:	7230           	moveq #48,d1
    6330:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    6334:	202f 00ce      	move.l 206(sp),d0
    6338:	eb88           	lsl.l #5,d0
    633a:	307c 0018      	movea.w #24,a0
    633e:	d1c0           	adda.l d0,a0
    6340:	202f 00c6      	move.l 198(sp),d0
    6344:	d080           	add.l d0,d0
    6346:	2208           	move.l a0,d1
    6348:	d280           	add.l d0,d1
    634a:	7000           	moveq #0,d0
    634c:	302f 01c6      	move.w 454(sp),d0
    6350:	2f01           	move.l d1,-(sp)
    6352:	2f00           	move.l d0,-(sp)
    6354:	2f2f 01d0      	move.l 464(sp),-(sp)
    6358:	2f2f 002e      	move.l 46(sp),-(sp)
    635c:	4eba 0a42      	jsr 6da0 <TestRow>(pc)
    6360:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6364:	7430           	moveq #48,d2
    6366:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    636a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    636e:	52af 00c6      	addq.l #1,198(sp)
    6372:	700d           	moveq #13,d0
    6374:	b0af 00c6      	cmp.l 198(sp),d0
    6378:	6c84           	bge.s 62fe <TestZoom4Picture+0x23d4>
  for(int i=0;i<7;i++) {
    637a:	52af 00ce      	addq.l #1,206(sp)
    637e:	7206           	moveq #6,d1
    6380:	b2af 00ce      	cmp.l 206(sp),d1
    6384:	6c00 ff2e      	bge.w 62b4 <TestZoom4Picture+0x238a>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    6388:	42af 00c2      	clr.l 194(sp)
    638c:	6032           	bra.s 63c0 <TestZoom4Picture+0x2496>
    TestRow( valsupposed, valactual, mask, 243+i2);
    638e:	222f 00c2      	move.l 194(sp),d1
    6392:	0681 0000 00f3 	addi.l #243,d1
    6398:	7000           	moveq #0,d0
    639a:	302f 01c6      	move.w 454(sp),d0
    639e:	2f01           	move.l d1,-(sp)
    63a0:	2f00           	move.l d0,-(sp)
    63a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    63a6:	2f2f 002e      	move.l 46(sp),-(sp)
    63aa:	4eba 09f4      	jsr 6da0 <TestRow>(pc)
    63ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63b2:	7430           	moveq #48,d2
    63b4:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    63b8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    63bc:	52af 00c2      	addq.l #1,194(sp)
    63c0:	7003           	moveq #3,d0
    63c2:	b0af 00c2      	cmp.l 194(sp),d0
    63c6:	6cc6           	bge.s 638e <TestZoom4Picture+0x2464>
  }

  for(int i2=0;i2<12;i2++) {
    63c8:	42af 00be      	clr.l 190(sp)
    63cc:	6060           	bra.s 642e <TestZoom4Picture+0x2504>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    63ce:	202f 00be      	move.l 190(sp),d0
    63d2:	d080           	add.l d0,d0
    63d4:	2200           	move.l d0,d1
    63d6:	0681 0000 00f7 	addi.l #247,d1
    63dc:	7000           	moveq #0,d0
    63de:	302f 01c6      	move.w 454(sp),d0
    63e2:	2f01           	move.l d1,-(sp)
    63e4:	2f00           	move.l d0,-(sp)
    63e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    63ea:	2f2f 002e      	move.l 46(sp),-(sp)
    63ee:	4eba 09b0      	jsr 6da0 <TestRow>(pc)
    63f2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    63f6:	7230           	moveq #48,d1
    63f8:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    63fc:	707c           	moveq #124,d0
    63fe:	d0af 00be      	add.l 190(sp),d0
    6402:	d080           	add.l d0,d0
    6404:	2200           	move.l d0,d1
    6406:	7000           	moveq #0,d0
    6408:	302f 01c6      	move.w 454(sp),d0
    640c:	2f01           	move.l d1,-(sp)
    640e:	2f00           	move.l d0,-(sp)
    6410:	2f2f 01d0      	move.l 464(sp),-(sp)
    6414:	2f2f 002e      	move.l 46(sp),-(sp)
    6418:	4eba 0986      	jsr 6da0 <TestRow>(pc)
    641c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6420:	7430           	moveq #48,d2
    6422:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    6426:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    642a:	52af 00be      	addq.l #1,190(sp)
    642e:	700b           	moveq #11,d0
    6430:	b0af 00be      	cmp.l 190(sp),d0
    6434:	6c98           	bge.s 63ce <TestZoom4Picture+0x24a4>
  }

  tmp = source;
    6436:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    643c:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    6442:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    6448:	4878 0001      	pea 1 <_start+0x1>
    644c:	4878 000e      	pea e <GetVBR+0x6>
    6450:	2f2f 0042      	move.l 66(sp),-(sp)
    6454:	2f2f 006a      	move.l 106(sp),-(sp)
    6458:	4eba b602      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    645c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6460:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    6466:	2c40           	movea.l d0,a6
    6468:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    646c:	222f 003a      	move.l 58(sp),d1
    6470:	5881           	addq.l #4,d1
    6472:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom15;
    6476:	2f7c 0001 b9cc 	move.l #113100,34(sp)
    647c:	0022 

  mask = 0x0000;
    647e:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    6482:	42af 00ba      	clr.l 186(sp)
    6486:	605a           	bra.s 64e2 <TestZoom4Picture+0x25b8>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6488:	202f 00ba      	move.l 186(sp),d0
    648c:	d080           	add.l d0,d0
    648e:	2200           	move.l d0,d1
    6490:	7000           	moveq #0,d0
    6492:	302f 01c6      	move.w 454(sp),d0
    6496:	2f01           	move.l d1,-(sp)
    6498:	2f00           	move.l d0,-(sp)
    649a:	2f2f 01d0      	move.l 464(sp),-(sp)
    649e:	2f2f 002e      	move.l 46(sp),-(sp)
    64a2:	4eba 08fc      	jsr 6da0 <TestRow>(pc)
    64a6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64aa:	7430           	moveq #48,d2
    64ac:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    64b0:	202f 00ba      	move.l 186(sp),d0
    64b4:	d080           	add.l d0,d0
    64b6:	2200           	move.l d0,d1
    64b8:	5281           	addq.l #1,d1
    64ba:	7000           	moveq #0,d0
    64bc:	302f 01c6      	move.w 454(sp),d0
    64c0:	2f01           	move.l d1,-(sp)
    64c2:	2f00           	move.l d0,-(sp)
    64c4:	2f2f 01d0      	move.l 464(sp),-(sp)
    64c8:	2f2f 002e      	move.l 46(sp),-(sp)
    64cc:	4eba 08d2      	jsr 6da0 <TestRow>(pc)
    64d0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    64d4:	7030           	moveq #48,d0
    64d6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    64da:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    64de:	52af 00ba      	addq.l #1,186(sp)
    64e2:	7207           	moveq #7,d1
    64e4:	b2af 00ba      	cmp.l 186(sp),d1
    64e8:	6c9e           	bge.s 6488 <TestZoom4Picture+0x255e>
  }

  for(int i=0;i<7;i++) {
    64ea:	42af 00b6      	clr.l 182(sp)
    64ee:	6000 00de      	bra.w 65ce <TestZoom4Picture+0x26a4>
    for(int i2=0;i2<3;i2++) {  
    64f2:	42af 00b2      	clr.l 178(sp)
    64f6:	603e           	bra.s 6536 <TestZoom4Picture+0x260c>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    64f8:	307c 0010      	movea.w #16,a0
    64fc:	d1ef 00b2      	adda.l 178(sp),a0
    6500:	222f 00b6      	move.l 182(sp),d1
    6504:	2001           	move.l d1,d0
    6506:	eb88           	lsl.l #5,d0
    6508:	d081           	add.l d1,d0
    650a:	2208           	move.l a0,d1
    650c:	d280           	add.l d0,d1
    650e:	7000           	moveq #0,d0
    6510:	302f 01c6      	move.w 454(sp),d0
    6514:	2f01           	move.l d1,-(sp)
    6516:	2f00           	move.l d0,-(sp)
    6518:	2f2f 01d0      	move.l 464(sp),-(sp)
    651c:	2f2f 002e      	move.l 46(sp),-(sp)
    6520:	4eba 087e      	jsr 6da0 <TestRow>(pc)
    6524:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6528:	7430           	moveq #48,d2
    652a:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    652e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    6532:	52af 00b2      	addq.l #1,178(sp)
    6536:	7002           	moveq #2,d0
    6538:	b0af 00b2      	cmp.l 178(sp),d0
    653c:	6cba           	bge.s 64f8 <TestZoom4Picture+0x25ce>
    }
    
    for(int i2=0;i2<15;i2++) {
    653e:	42af 00ae      	clr.l 174(sp)
    6542:	607c           	bra.s 65c0 <TestZoom4Picture+0x2696>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    6544:	222f 00b6      	move.l 182(sp),d1
    6548:	2001           	move.l d1,d0
    654a:	eb88           	lsl.l #5,d0
    654c:	2040           	movea.l d0,a0
    654e:	d1c1           	adda.l d1,a0
    6550:	41e8 0013      	lea 19(a0),a0
    6554:	202f 00ae      	move.l 174(sp),d0
    6558:	d080           	add.l d0,d0
    655a:	2208           	move.l a0,d1
    655c:	d280           	add.l d0,d1
    655e:	7000           	moveq #0,d0
    6560:	302f 01c6      	move.w 454(sp),d0
    6564:	2f01           	move.l d1,-(sp)
    6566:	2f00           	move.l d0,-(sp)
    6568:	2f2f 01d0      	move.l 464(sp),-(sp)
    656c:	2f2f 002e      	move.l 46(sp),-(sp)
    6570:	4eba 082e      	jsr 6da0 <TestRow>(pc)
    6574:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6578:	7230           	moveq #48,d1
    657a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    657e:	222f 00b6      	move.l 182(sp),d1
    6582:	2001           	move.l d1,d0
    6584:	eb88           	lsl.l #5,d0
    6586:	2040           	movea.l d0,a0
    6588:	d1c1           	adda.l d1,a0
    658a:	41e8 0013      	lea 19(a0),a0
    658e:	202f 00ae      	move.l 174(sp),d0
    6592:	d080           	add.l d0,d0
    6594:	2208           	move.l a0,d1
    6596:	d280           	add.l d0,d1
    6598:	7000           	moveq #0,d0
    659a:	302f 01c6      	move.w 454(sp),d0
    659e:	2f01           	move.l d1,-(sp)
    65a0:	2f00           	move.l d0,-(sp)
    65a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    65a6:	2f2f 002e      	move.l 46(sp),-(sp)
    65aa:	4eba 07f4      	jsr 6da0 <TestRow>(pc)
    65ae:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    65b2:	7430           	moveq #48,d2
    65b4:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    65b8:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    65bc:	52af 00ae      	addq.l #1,174(sp)
    65c0:	700e           	moveq #14,d0
    65c2:	b0af 00ae      	cmp.l 174(sp),d0
    65c6:	6c00 ff7c      	bge.w 6544 <TestZoom4Picture+0x261a>
  for(int i=0;i<7;i++) {
    65ca:	52af 00b6      	addq.l #1,182(sp)
    65ce:	7206           	moveq #6,d1
    65d0:	b2af 00b6      	cmp.l 182(sp),d1
    65d4:	6c00 ff1c      	bge.w 64f2 <TestZoom4Picture+0x25c8>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    65d8:	42af 00aa      	clr.l 170(sp)
    65dc:	6032           	bra.s 6610 <TestZoom4Picture+0x26e6>
    TestRow( valsupposed, valactual, mask, 247+i2);
    65de:	222f 00aa      	move.l 170(sp),d1
    65e2:	0681 0000 00f7 	addi.l #247,d1
    65e8:	7000           	moveq #0,d0
    65ea:	302f 01c6      	move.w 454(sp),d0
    65ee:	2f01           	move.l d1,-(sp)
    65f0:	2f00           	move.l d0,-(sp)
    65f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    65f6:	2f2f 002e      	move.l 46(sp),-(sp)
    65fa:	4eba 07a4      	jsr 6da0 <TestRow>(pc)
    65fe:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6602:	7430           	moveq #48,d2
    6604:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    6608:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    660c:	52af 00aa      	addq.l #1,170(sp)
    6610:	7002           	moveq #2,d0
    6612:	b0af 00aa      	cmp.l 170(sp),d0
    6616:	6cc6           	bge.s 65de <TestZoom4Picture+0x26b4>
  }

  for(int i2=0;i2<10;i2++) {
    6618:	42af 00a6      	clr.l 166(sp)
    661c:	6060           	bra.s 667e <TestZoom4Picture+0x2754>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    661e:	707d           	moveq #125,d0
    6620:	d0af 00a6      	add.l 166(sp),d0
    6624:	d080           	add.l d0,d0
    6626:	2200           	move.l d0,d1
    6628:	7000           	moveq #0,d0
    662a:	302f 01c6      	move.w 454(sp),d0
    662e:	2f01           	move.l d1,-(sp)
    6630:	2f00           	move.l d0,-(sp)
    6632:	2f2f 01d0      	move.l 464(sp),-(sp)
    6636:	2f2f 002e      	move.l 46(sp),-(sp)
    663a:	4eba 0764      	jsr 6da0 <TestRow>(pc)
    663e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6642:	7230           	moveq #48,d1
    6644:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    6648:	202f 00a6      	move.l 166(sp),d0
    664c:	d080           	add.l d0,d0
    664e:	2200           	move.l d0,d1
    6650:	0681 0000 00fb 	addi.l #251,d1
    6656:	7000           	moveq #0,d0
    6658:	302f 01c6      	move.w 454(sp),d0
    665c:	2f01           	move.l d1,-(sp)
    665e:	2f00           	move.l d0,-(sp)
    6660:	2f2f 01d0      	move.l 464(sp),-(sp)
    6664:	2f2f 002e      	move.l 46(sp),-(sp)
    6668:	4eba 0736      	jsr 6da0 <TestRow>(pc)
    666c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6670:	7430           	moveq #48,d2
    6672:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    6676:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    667a:	52af 00a6      	addq.l #1,166(sp)
    667e:	7009           	moveq #9,d0
    6680:	b0af 00a6      	cmp.l 166(sp),d0
    6684:	6c98           	bge.s 661e <TestZoom4Picture+0x26f4>
  }

  tmp = source;
    6686:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    668c:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    6692:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    6698:	4878 0001      	pea 1 <_start+0x1>
    669c:	4878 000f      	pea f <GetVBR+0x7>
    66a0:	2f2f 0042      	move.l 66(sp),-(sp)
    66a4:	2f2f 006a      	move.l 106(sp),-(sp)
    66a8:	4eba b3b2      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    66ac:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    66b0:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    66b6:	2c40           	movea.l d0,a6
    66b8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    66bc:	222f 003a      	move.l 58(sp),d1
    66c0:	5881           	addq.l #4,d1
    66c2:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    66c6:	2f7c 0001 b9f8 	move.l #113144,34(sp)
    66cc:	0022 

  mask = 0x0000;
    66ce:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    66d2:	7000           	moveq #0,d0
    66d4:	302f 01c6      	move.w 454(sp),d0
    66d8:	42a7           	clr.l -(sp)
    66da:	2f00           	move.l d0,-(sp)
    66dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    66e0:	2f2f 002e      	move.l 46(sp),-(sp)
    66e4:	4eba 06ba      	jsr 6da0 <TestRow>(pc)
    66e8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    66ec:	7430           	moveq #48,d2
    66ee:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    66f2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    66f6:	42af 00a2      	clr.l 162(sp)
    66fa:	605a           	bra.s 6756 <TestZoom4Picture+0x282c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    66fc:	202f 00a2      	move.l 162(sp),d0
    6700:	d080           	add.l d0,d0
    6702:	2200           	move.l d0,d1
    6704:	7000           	moveq #0,d0
    6706:	302f 01c6      	move.w 454(sp),d0
    670a:	2f01           	move.l d1,-(sp)
    670c:	2f00           	move.l d0,-(sp)
    670e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6712:	2f2f 002e      	move.l 46(sp),-(sp)
    6716:	4eba 0688      	jsr 6da0 <TestRow>(pc)
    671a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    671e:	7030           	moveq #48,d0
    6720:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    6724:	202f 00a2      	move.l 162(sp),d0
    6728:	d080           	add.l d0,d0
    672a:	2200           	move.l d0,d1
    672c:	5281           	addq.l #1,d1
    672e:	7000           	moveq #0,d0
    6730:	302f 01c6      	move.w 454(sp),d0
    6734:	2f01           	move.l d1,-(sp)
    6736:	2f00           	move.l d0,-(sp)
    6738:	2f2f 01d0      	move.l 464(sp),-(sp)
    673c:	2f2f 002e      	move.l 46(sp),-(sp)
    6740:	4eba 065e      	jsr 6da0 <TestRow>(pc)
    6744:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6748:	7230           	moveq #48,d1
    674a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    674e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    6752:	52af 00a2      	addq.l #1,162(sp)
    6756:	7405           	moveq #5,d2
    6758:	b4af 00a2      	cmp.l 162(sp),d2
    675c:	6c9e           	bge.s 66fc <TestZoom4Picture+0x27d2>
  }

  for(int i=0;i<7;i++) {
    675e:	42af 009e      	clr.l 158(sp)
    6762:	6000 00e6      	bra.w 684a <TestZoom4Picture+0x2920>
    for(int i2=0;i2<2;i2++) {  
    6766:	42af 009a      	clr.l 154(sp)
    676a:	6040           	bra.s 67ac <TestZoom4Picture+0x2882>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    676c:	307c 000d      	movea.w #13,a0
    6770:	d1ef 009a      	adda.l 154(sp),a0
    6774:	222f 009e      	move.l 158(sp),d1
    6778:	2001           	move.l d1,d0
    677a:	e988           	lsl.l #4,d0
    677c:	d081           	add.l d1,d0
    677e:	d080           	add.l d0,d0
    6780:	2208           	move.l a0,d1
    6782:	d280           	add.l d0,d1
    6784:	7000           	moveq #0,d0
    6786:	302f 01c6      	move.w 454(sp),d0
    678a:	2f01           	move.l d1,-(sp)
    678c:	2f00           	move.l d0,-(sp)
    678e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6792:	2f2f 002e      	move.l 46(sp),-(sp)
    6796:	4eba 0608      	jsr 6da0 <TestRow>(pc)
    679a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    679e:	7030           	moveq #48,d0
    67a0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    67a4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    67a8:	52af 009a      	addq.l #1,154(sp)
    67ac:	7201           	moveq #1,d1
    67ae:	b2af 009a      	cmp.l 154(sp),d1
    67b2:	6cb8           	bge.s 676c <TestZoom4Picture+0x2842>
    }
    
    for(int i2=0;i2<16;i2++) {
    67b4:	42af 0096      	clr.l 150(sp)
    67b8:	6000 0082      	bra.w 683c <TestZoom4Picture+0x2912>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    67bc:	222f 009e      	move.l 158(sp),d1
    67c0:	2001           	move.l d1,d0
    67c2:	e988           	lsl.l #4,d0
    67c4:	d081           	add.l d1,d0
    67c6:	d080           	add.l d0,d0
    67c8:	2040           	movea.l d0,a0
    67ca:	41e8 0010      	lea 16(a0),a0
    67ce:	202f 0096      	move.l 150(sp),d0
    67d2:	d080           	add.l d0,d0
    67d4:	2208           	move.l a0,d1
    67d6:	d280           	add.l d0,d1
    67d8:	7000           	moveq #0,d0
    67da:	302f 01c6      	move.w 454(sp),d0
    67de:	2f01           	move.l d1,-(sp)
    67e0:	2f00           	move.l d0,-(sp)
    67e2:	2f2f 01d0      	move.l 464(sp),-(sp)
    67e6:	2f2f 002e      	move.l 46(sp),-(sp)
    67ea:	4eba 05b4      	jsr 6da0 <TestRow>(pc)
    67ee:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    67f2:	7430           	moveq #48,d2
    67f4:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    67f8:	222f 009e      	move.l 158(sp),d1
    67fc:	2001           	move.l d1,d0
    67fe:	e988           	lsl.l #4,d0
    6800:	d081           	add.l d1,d0
    6802:	d080           	add.l d0,d0
    6804:	2040           	movea.l d0,a0
    6806:	41e8 0011      	lea 17(a0),a0
    680a:	202f 0096      	move.l 150(sp),d0
    680e:	d080           	add.l d0,d0
    6810:	2208           	move.l a0,d1
    6812:	d280           	add.l d0,d1
    6814:	7000           	moveq #0,d0
    6816:	302f 01c6      	move.w 454(sp),d0
    681a:	2f01           	move.l d1,-(sp)
    681c:	2f00           	move.l d0,-(sp)
    681e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6822:	2f2f 002e      	move.l 46(sp),-(sp)
    6826:	4eba 0578      	jsr 6da0 <TestRow>(pc)
    682a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    682e:	7030           	moveq #48,d0
    6830:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6834:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    6838:	52af 0096      	addq.l #1,150(sp)
    683c:	720f           	moveq #15,d1
    683e:	b2af 0096      	cmp.l 150(sp),d1
    6842:	6c00 ff78      	bge.w 67bc <TestZoom4Picture+0x2892>
  for(int i=0;i<7;i++) {
    6846:	52af 009e      	addq.l #1,158(sp)
    684a:	7406           	moveq #6,d2
    684c:	b4af 009e      	cmp.l 158(sp),d2
    6850:	6c00 ff14      	bge.w 6766 <TestZoom4Picture+0x283c>
    }
  }

  for(int i2=0;i2<2;i2++) {
    6854:	42af 0092      	clr.l 146(sp)
    6858:	6032           	bra.s 688c <TestZoom4Picture+0x2962>
    TestRow( valsupposed, valactual, mask, 251+i2);
    685a:	222f 0092      	move.l 146(sp),d1
    685e:	0681 0000 00fb 	addi.l #251,d1
    6864:	7000           	moveq #0,d0
    6866:	302f 01c6      	move.w 454(sp),d0
    686a:	2f01           	move.l d1,-(sp)
    686c:	2f00           	move.l d0,-(sp)
    686e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6872:	2f2f 002e      	move.l 46(sp),-(sp)
    6876:	4eba 0528      	jsr 6da0 <TestRow>(pc)
    687a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    687e:	7030           	moveq #48,d0
    6880:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6884:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    6888:	52af 0092      	addq.l #1,146(sp)
    688c:	7201           	moveq #1,d1
    688e:	b2af 0092      	cmp.l 146(sp),d1
    6892:	6cc6           	bge.s 685a <TestZoom4Picture+0x2930>
  }

  for(int i2=0;i2<8;i2++) {
    6894:	42af 008e      	clr.l 142(sp)
    6898:	6060           	bra.s 68fa <TestZoom4Picture+0x29d0>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    689a:	202f 008e      	move.l 142(sp),d0
    689e:	d080           	add.l d0,d0
    68a0:	2200           	move.l d0,d1
    68a2:	0681 0000 00fd 	addi.l #253,d1
    68a8:	7000           	moveq #0,d0
    68aa:	302f 01c6      	move.w 454(sp),d0
    68ae:	2f01           	move.l d1,-(sp)
    68b0:	2f00           	move.l d0,-(sp)
    68b2:	2f2f 01d0      	move.l 464(sp),-(sp)
    68b6:	2f2f 002e      	move.l 46(sp),-(sp)
    68ba:	4eba 04e4      	jsr 6da0 <TestRow>(pc)
    68be:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68c2:	7430           	moveq #48,d2
    68c4:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    68c8:	707f           	moveq #127,d0
    68ca:	d0af 008e      	add.l 142(sp),d0
    68ce:	d080           	add.l d0,d0
    68d0:	2200           	move.l d0,d1
    68d2:	7000           	moveq #0,d0
    68d4:	302f 01c6      	move.w 454(sp),d0
    68d8:	2f01           	move.l d1,-(sp)
    68da:	2f00           	move.l d0,-(sp)
    68dc:	2f2f 01d0      	move.l 464(sp),-(sp)
    68e0:	2f2f 002e      	move.l 46(sp),-(sp)
    68e4:	4eba 04ba      	jsr 6da0 <TestRow>(pc)
    68e8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    68ec:	7030           	moveq #48,d0
    68ee:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    68f2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    68f6:	52af 008e      	addq.l #1,142(sp)
    68fa:	7207           	moveq #7,d1
    68fc:	b2af 008e      	cmp.l 142(sp),d1
    6900:	6c98           	bge.s 689a <TestZoom4Picture+0x2970>
  }

  tmp = source;
    6902:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    6908:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    690e:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    6914:	4878 0001      	pea 1 <_start+0x1>
    6918:	4878 0010      	pea 10 <GetVBR+0x8>
    691c:	2f2f 0042      	move.l 66(sp),-(sp)
    6920:	2f2f 006a      	move.l 106(sp),-(sp)
    6924:	4eba b136      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    6928:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    692c:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    6932:	2c40           	movea.l d0,a6
    6934:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6938:	242f 003a      	move.l 58(sp),d2
    693c:	5882           	addq.l #4,d2
    693e:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom17;
    6942:	2f7c 0001 ba24 	move.l #113188,34(sp)
    6948:	0022 

  mask = 0xffff;
    694a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    6950:	42af 008a      	clr.l 138(sp)
    6954:	605a           	bra.s 69b0 <TestZoom4Picture+0x2a86>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    6956:	202f 008a      	move.l 138(sp),d0
    695a:	d080           	add.l d0,d0
    695c:	2200           	move.l d0,d1
    695e:	7000           	moveq #0,d0
    6960:	302f 01c6      	move.w 454(sp),d0
    6964:	2f01           	move.l d1,-(sp)
    6966:	2f00           	move.l d0,-(sp)
    6968:	2f2f 01d0      	move.l 464(sp),-(sp)
    696c:	2f2f 002e      	move.l 46(sp),-(sp)
    6970:	4eba 042e      	jsr 6da0 <TestRow>(pc)
    6974:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6978:	7030           	moveq #48,d0
    697a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    697e:	202f 008a      	move.l 138(sp),d0
    6982:	d080           	add.l d0,d0
    6984:	2200           	move.l d0,d1
    6986:	5281           	addq.l #1,d1
    6988:	7000           	moveq #0,d0
    698a:	302f 01c6      	move.w 454(sp),d0
    698e:	2f01           	move.l d1,-(sp)
    6990:	2f00           	move.l d0,-(sp)
    6992:	2f2f 01d0      	move.l 464(sp),-(sp)
    6996:	2f2f 002e      	move.l 46(sp),-(sp)
    699a:	4eba 0404      	jsr 6da0 <TestRow>(pc)
    699e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    69a2:	7230           	moveq #48,d1
    69a4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    69a8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    69ac:	52af 008a      	addq.l #1,138(sp)
    69b0:	7404           	moveq #4,d2
    69b2:	b4af 008a      	cmp.l 138(sp),d2
    69b6:	6c9e           	bge.s 6956 <TestZoom4Picture+0x2a2c>
  }

  for(int i=0;i<7;i++) {
    69b8:	42af 0086      	clr.l 134(sp)
    69bc:	6000 00d4      	bra.w 6a92 <TestZoom4Picture+0x2b68>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    69c0:	222f 0086      	move.l 134(sp),d1
    69c4:	2001           	move.l d1,d0
    69c6:	e988           	lsl.l #4,d0
    69c8:	d081           	add.l d1,d0
    69ca:	d080           	add.l d0,d0
    69cc:	2040           	movea.l d0,a0
    69ce:	d1c1           	adda.l d1,a0
    69d0:	41e8 000a      	lea 10(a0),a0
    69d4:	7000           	moveq #0,d0
    69d6:	302f 01c6      	move.w 454(sp),d0
    69da:	2f08           	move.l a0,-(sp)
    69dc:	2f00           	move.l d0,-(sp)
    69de:	2f2f 01d0      	move.l 464(sp),-(sp)
    69e2:	2f2f 002e      	move.l 46(sp),-(sp)
    69e6:	4eba 03b8      	jsr 6da0 <TestRow>(pc)
    69ea:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    69ee:	7030           	moveq #48,d0
    69f0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    69f4:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    69f8:	42af 0082      	clr.l 130(sp)
    69fc:	6000 0086      	bra.w 6a84 <TestZoom4Picture+0x2b5a>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6a00:	222f 0086      	move.l 134(sp),d1
    6a04:	2001           	move.l d1,d0
    6a06:	e988           	lsl.l #4,d0
    6a08:	d081           	add.l d1,d0
    6a0a:	d080           	add.l d0,d0
    6a0c:	2040           	movea.l d0,a0
    6a0e:	d1c1           	adda.l d1,a0
    6a10:	41e8 000b      	lea 11(a0),a0
    6a14:	202f 0082      	move.l 130(sp),d0
    6a18:	d080           	add.l d0,d0
    6a1a:	2208           	move.l a0,d1
    6a1c:	d280           	add.l d0,d1
    6a1e:	7000           	moveq #0,d0
    6a20:	302f 01c6      	move.w 454(sp),d0
    6a24:	2f01           	move.l d1,-(sp)
    6a26:	2f00           	move.l d0,-(sp)
    6a28:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a2c:	2f2f 002e      	move.l 46(sp),-(sp)
    6a30:	4eba 036e      	jsr 6da0 <TestRow>(pc)
    6a34:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a38:	7230           	moveq #48,d1
    6a3a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6a3e:	222f 0086      	move.l 134(sp),d1
    6a42:	2001           	move.l d1,d0
    6a44:	e988           	lsl.l #4,d0
    6a46:	d081           	add.l d1,d0
    6a48:	d080           	add.l d0,d0
    6a4a:	2040           	movea.l d0,a0
    6a4c:	d1c1           	adda.l d1,a0
    6a4e:	41e8 000c      	lea 12(a0),a0
    6a52:	202f 0082      	move.l 130(sp),d0
    6a56:	d080           	add.l d0,d0
    6a58:	2208           	move.l a0,d1
    6a5a:	d280           	add.l d0,d1
    6a5c:	7000           	moveq #0,d0
    6a5e:	302f 01c6      	move.w 454(sp),d0
    6a62:	2f01           	move.l d1,-(sp)
    6a64:	2f00           	move.l d0,-(sp)
    6a66:	2f2f 01d0      	move.l 464(sp),-(sp)
    6a6a:	2f2f 002e      	move.l 46(sp),-(sp)
    6a6e:	4eba 0330      	jsr 6da0 <TestRow>(pc)
    6a72:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6a76:	7430           	moveq #48,d2
    6a78:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    6a7c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    6a80:	52af 0082      	addq.l #1,130(sp)
    6a84:	7010           	moveq #16,d0
    6a86:	b0af 0082      	cmp.l 130(sp),d0
    6a8a:	6c00 ff74      	bge.w 6a00 <TestZoom4Picture+0x2ad6>
  for(int i=0;i<7;i++) {
    6a8e:	52af 0086      	addq.l #1,134(sp)
    6a92:	7206           	moveq #6,d1
    6a94:	b2af 0086      	cmp.l 134(sp),d1
    6a98:	6c00 ff26      	bge.w 69c0 <TestZoom4Picture+0x2a96>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    6a9c:	7000           	moveq #0,d0
    6a9e:	302f 01c6      	move.w 454(sp),d0
    6aa2:	4878 00ff      	pea ff <WaitBlt+0x1f>
    6aa6:	2f00           	move.l d0,-(sp)
    6aa8:	2f2f 01d0      	move.l 464(sp),-(sp)
    6aac:	2f2f 002e      	move.l 46(sp),-(sp)
    6ab0:	4eba 02ee      	jsr 6da0 <TestRow>(pc)
    6ab4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6ab8:	7430           	moveq #48,d2
    6aba:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    6abe:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    6ac2:	42af 007e      	clr.l 126(sp)
    6ac6:	6064           	bra.s 6b2c <TestZoom4Picture+0x2c02>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6ac8:	202f 007e      	move.l 126(sp),d0
    6acc:	0680 0000 0080 	addi.l #128,d0
    6ad2:	d080           	add.l d0,d0
    6ad4:	2200           	move.l d0,d1
    6ad6:	7000           	moveq #0,d0
    6ad8:	302f 01c6      	move.w 454(sp),d0
    6adc:	2f01           	move.l d1,-(sp)
    6ade:	2f00           	move.l d0,-(sp)
    6ae0:	2f2f 01d0      	move.l 464(sp),-(sp)
    6ae4:	2f2f 002e      	move.l 46(sp),-(sp)
    6ae8:	4eba 02b6      	jsr 6da0 <TestRow>(pc)
    6aec:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6af0:	7030           	moveq #48,d0
    6af2:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6af6:	202f 007e      	move.l 126(sp),d0
    6afa:	d080           	add.l d0,d0
    6afc:	2200           	move.l d0,d1
    6afe:	0681 0000 0101 	addi.l #257,d1
    6b04:	7000           	moveq #0,d0
    6b06:	302f 01c6      	move.w 454(sp),d0
    6b0a:	2f01           	move.l d1,-(sp)
    6b0c:	2f00           	move.l d0,-(sp)
    6b0e:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b12:	2f2f 002e      	move.l 46(sp),-(sp)
    6b16:	4eba 0288      	jsr 6da0 <TestRow>(pc)
    6b1a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6b1e:	7230           	moveq #48,d1
    6b20:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6b24:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    6b28:	52af 007e      	addq.l #1,126(sp)
    6b2c:	7406           	moveq #6,d2
    6b2e:	b4af 007e      	cmp.l 126(sp),d2
    6b32:	6c94           	bge.s 6ac8 <TestZoom4Picture+0x2b9e>
  }   

  tmp = source;
    6b34:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    6b3a:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    6b40:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    6b46:	4878 0001      	pea 1 <_start+0x1>
    6b4a:	4878 0011      	pea 11 <GetVBR+0x9>
    6b4e:	2f2f 0042      	move.l 66(sp),-(sp)
    6b52:	2f2f 006a      	move.l 106(sp),-(sp)
    6b56:	4eba af04      	jsr 1a5c <Zoom_ZoomIntoPicture>(pc)
    6b5a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    6b5e:	2039 0001 ba84 	move.l 1ba84 <GfxBase>,d0
    6b64:	2c40           	movea.l d0,a6
    6b66:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    6b6a:	202f 003a      	move.l 58(sp),d0
    6b6e:	5880           	addq.l #4,d0
    6b70:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    6b74:	2f7c 0001 ba50 	move.l #113232,34(sp)
    6b7a:	0022 

  mask = 0xffff;
    6b7c:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    6b82:	7000           	moveq #0,d0
    6b84:	302f 01c6      	move.w 454(sp),d0
    6b88:	42a7           	clr.l -(sp)
    6b8a:	2f00           	move.l d0,-(sp)
    6b8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    6b90:	2f2f 002e      	move.l 46(sp),-(sp)
    6b94:	4eba 020a      	jsr 6da0 <TestRow>(pc)
    6b98:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6b9c:	7230           	moveq #48,d1
    6b9e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    6ba2:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    6ba6:	42af 007a      	clr.l 122(sp)
    6baa:	605c           	bra.s 6c08 <TestZoom4Picture+0x2cde>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    6bac:	202f 007a      	move.l 122(sp),d0
    6bb0:	d080           	add.l d0,d0
    6bb2:	2200           	move.l d0,d1
    6bb4:	5281           	addq.l #1,d1
    6bb6:	7000           	moveq #0,d0
    6bb8:	302f 01c6      	move.w 454(sp),d0
    6bbc:	2f01           	move.l d1,-(sp)
    6bbe:	2f00           	move.l d0,-(sp)
    6bc0:	2f2f 01d0      	move.l 464(sp),-(sp)
    6bc4:	2f2f 002e      	move.l 46(sp),-(sp)
    6bc8:	4eba 01d6      	jsr 6da0 <TestRow>(pc)
    6bcc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6bd0:	7430           	moveq #48,d2
    6bd2:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    6bd6:	202f 007a      	move.l 122(sp),d0
    6bda:	5280           	addq.l #1,d0
    6bdc:	d080           	add.l d0,d0
    6bde:	2200           	move.l d0,d1
    6be0:	7000           	moveq #0,d0
    6be2:	302f 01c6      	move.w 454(sp),d0
    6be6:	2f01           	move.l d1,-(sp)
    6be8:	2f00           	move.l d0,-(sp)
    6bea:	2f2f 01d0      	move.l 464(sp),-(sp)
    6bee:	2f2f 002e      	move.l 46(sp),-(sp)
    6bf2:	4eba 01ac      	jsr 6da0 <TestRow>(pc)
    6bf6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6bfa:	7030           	moveq #48,d0
    6bfc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    6c00:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6c04:	52af 007a      	addq.l #1,122(sp)
    6c08:	7203           	moveq #3,d1
    6c0a:	b2af 007a      	cmp.l 122(sp),d1
    6c0e:	6c9c           	bge.s 6bac <TestZoom4Picture+0x2c82>
  }

  for(int i=0;i<7;i++) {  
    6c10:	42af 0076      	clr.l 118(sp)
    6c14:	6000 009c      	bra.w 6cb2 <TestZoom4Picture+0x2d88>
    for(int i2=0;i2<18;i2++) {
    6c18:	42af 0072      	clr.l 114(sp)
    6c1c:	6000 0086      	bra.w 6ca4 <TestZoom4Picture+0x2d7a>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    6c20:	222f 0076      	move.l 118(sp),d1
    6c24:	2001           	move.l d1,d0
    6c26:	e988           	lsl.l #4,d0
    6c28:	d081           	add.l d1,d0
    6c2a:	d080           	add.l d0,d0
    6c2c:	2040           	movea.l d0,a0
    6c2e:	d1c1           	adda.l d1,a0
    6c30:	41e8 000b      	lea 11(a0),a0
    6c34:	202f 0072      	move.l 114(sp),d0
    6c38:	d080           	add.l d0,d0
    6c3a:	2208           	move.l a0,d1
    6c3c:	d280           	add.l d0,d1
    6c3e:	7000           	moveq #0,d0
    6c40:	302f 01c6      	move.w 454(sp),d0
    6c44:	2f01           	move.l d1,-(sp)
    6c46:	2f00           	move.l d0,-(sp)
    6c48:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c4c:	2f2f 002e      	move.l 46(sp),-(sp)
    6c50:	4eba 014e      	jsr 6da0 <TestRow>(pc)
    6c54:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6c58:	7430           	moveq #48,d2
    6c5a:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    6c5e:	222f 0076      	move.l 118(sp),d1
    6c62:	2001           	move.l d1,d0
    6c64:	e988           	lsl.l #4,d0
    6c66:	d081           	add.l d1,d0
    6c68:	d080           	add.l d0,d0
    6c6a:	2040           	movea.l d0,a0
    6c6c:	d1c1           	adda.l d1,a0
    6c6e:	41e8 000c      	lea 12(a0),a0
    6c72:	202f 0072      	move.l 114(sp),d0
    6c76:	d080           	add.l d0,d0
    6c78:	2208           	move.l a0,d1
    6c7a:	d280           	add.l d0,d1
    6c7c:	7000           	moveq #0,d0
    6c7e:	302f 01c6      	move.w 454(sp),d0
    6c82:	2f01           	move.l d1,-(sp)
    6c84:	2f00           	move.l d0,-(sp)
    6c86:	2f2f 01d0      	move.l 464(sp),-(sp)
    6c8a:	2f2f 002e      	move.l 46(sp),-(sp)
    6c8e:	4eba 0110      	jsr 6da0 <TestRow>(pc)
    6c92:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    6c96:	7030           	moveq #48,d0
    6c98:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    6c9c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    6ca0:	52af 0072      	addq.l #1,114(sp)
    6ca4:	7211           	moveq #17,d1
    6ca6:	b2af 0072      	cmp.l 114(sp),d1
    6caa:	6c00 ff74      	bge.w 6c20 <TestZoom4Picture+0x2cf6>
  for(int i=0;i<7;i++) {  
    6cae:	52af 0076      	addq.l #1,118(sp)
    6cb2:	7406           	moveq #6,d2
    6cb4:	b4af 0076      	cmp.l 118(sp),d2
    6cb8:	6c00 ff5e      	bge.w 6c18 <TestZoom4Picture+0x2cee>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    6cbc:	42af 006e      	clr.l 110(sp)
    6cc0:	6064           	bra.s 6d26 <TestZoom4Picture+0x2dfc>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    6cc2:	202f 006e      	move.l 110(sp),d0
    6cc6:	0680 0000 0080 	addi.l #128,d0
    6ccc:	d080           	add.l d0,d0
    6cce:	2200           	move.l d0,d1
    6cd0:	7000           	moveq #0,d0
    6cd2:	302f 01c6      	move.w 454(sp),d0
    6cd6:	2f01           	move.l d1,-(sp)
    6cd8:	2f00           	move.l d0,-(sp)
    6cda:	2f2f 01d0      	move.l 464(sp),-(sp)
    6cde:	2f2f 002e      	move.l 46(sp),-(sp)
    6ce2:	4eba 00bc      	jsr 6da0 <TestRow>(pc)
    6ce6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6cea:	7030           	moveq #48,d0
    6cec:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    6cf0:	202f 006e      	move.l 110(sp),d0
    6cf4:	d080           	add.l d0,d0
    6cf6:	2200           	move.l d0,d1
    6cf8:	0681 0000 0101 	addi.l #257,d1
    6cfe:	7000           	moveq #0,d0
    6d00:	302f 01c6      	move.w 454(sp),d0
    6d04:	2f01           	move.l d1,-(sp)
    6d06:	2f00           	move.l d0,-(sp)
    6d08:	2f2f 01d0      	move.l 464(sp),-(sp)
    6d0c:	2f2f 002e      	move.l 46(sp),-(sp)
    6d10:	4eba 008e      	jsr 6da0 <TestRow>(pc)
    6d14:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    6d18:	7230           	moveq #48,d1
    6d1a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    6d1e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    6d22:	52af 006e      	addq.l #1,110(sp)
    6d26:	7403           	moveq #3,d2
    6d28:	b4af 006e      	cmp.l 110(sp),d2
    6d2c:	6c94           	bge.s 6cc2 <TestZoom4Picture+0x2d98>
  }
  TestRow( valsupposed, valactual, mask, 0);
    6d2e:	7000           	moveq #0,d0
    6d30:	302f 01c6      	move.w 454(sp),d0
    6d34:	42a7           	clr.l -(sp)
    6d36:	2f00           	move.l d0,-(sp)
    6d38:	2f2f 01d0      	move.l 464(sp),-(sp)
    6d3c:	2f2f 002e      	move.l 46(sp),-(sp)
    6d40:	4eba 005e      	jsr 6da0 <TestRow>(pc)
    6d44:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    6d48:	7030           	moveq #48,d0
    6d4a:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    6d4e:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    6d52:	2f6f 005e 001a 	move.l 94(sp),26(sp)
    6d58:	2f7c 0000 3740 	move.l #14144,22(sp)
    6d5e:	0016 
    6d60:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    6d66:	2c40           	movea.l d0,a6
    6d68:	226f 001a      	movea.l 26(sp),a1
    6d6c:	202f 0016      	move.l 22(sp),d0
    6d70:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    6d74:	2f6f 003a 0012 	move.l 58(sp),18(sp)
    6d7a:	2f7c 0000 3740 	move.l #14144,14(sp)
    6d80:	000e 
    6d82:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    6d88:	2c40           	movea.l d0,a6
    6d8a:	226f 0012      	movea.l 18(sp),a1
    6d8e:	202f 000e      	move.l 14(sp),d0
    6d92:	4eae ff2e      	jsr -210(a6)
}
    6d96:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    6d9a:	4fef 01d0      	lea 464(sp),sp
    6d9e:	4e75           	rts

00006da0 <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    6da0:	4fef ff40      	lea -192(sp),sp
    6da4:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    6da8:	202f 00e0      	move.l 224(sp),d0
    6dac:	3000           	move.w d0,d0
    6dae:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    6db2:	701c           	moveq #28,d0
    6db4:	d08f           	add.l sp,d0
    6db6:	7264           	moveq #100,d1
    6db8:	2f01           	move.l d1,-(sp)
    6dba:	42a7           	clr.l -(sp)
    6dbc:	2f00           	move.l d0,-(sp)
    6dbe:	4eba 02f0      	jsr 70b0 <memset>(pc)
    6dc2:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    6dc6:	202f 00e4      	move.l 228(sp),d0
    6dca:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    6dce:	42af 00d0      	clr.l 208(sp)
    6dd2:	6000 00d4      	bra.w 6ea8 <TestRow+0x108>
    if( (*testpattern++ ^ xormask) != *destination++) {
    6dd6:	202f 00d8      	move.l 216(sp),d0
    6dda:	2200           	move.l d0,d1
    6ddc:	5481           	addq.l #2,d1
    6dde:	2f41 00d8      	move.l d1,216(sp)
    6de2:	2040           	movea.l d0,a0
    6de4:	3010           	move.w (a0),d0
    6de6:	322f 0016      	move.w 22(sp),d1
    6dea:	b141           	eor.w d0,d1
    6dec:	202f 00dc      	move.l 220(sp),d0
    6df0:	2400           	move.l d0,d2
    6df2:	5482           	addq.l #2,d2
    6df4:	2f42 00dc      	move.l d2,220(sp)
    6df8:	2040           	movea.l d0,a0
    6dfa:	3010           	move.w (a0),d0
    6dfc:	b041           	cmp.w d1,d0
    6dfe:	6700 00a4      	beq.w 6ea4 <TestRow+0x104>
      data[0] = i;
    6e02:	202f 00d0      	move.l 208(sp),d0
    6e06:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    6e0a:	2f7c 0001 824f 	move.l #98895,204(sp)
    6e10:	00cc 
    6e12:	702b           	moveq #43,d0
    6e14:	4600           	not.b d0
    6e16:	d08f           	add.l sp,d0
    6e18:	0680 ffff ff44 	addi.l #-188,d0
    6e1e:	2f40 00c8      	move.l d0,200(sp)
    6e22:	2f7c 0000 729c 	move.l #29340,196(sp)
    6e28:	00c4 
    6e2a:	722b           	moveq #43,d1
    6e2c:	4601           	not.b d1
    6e2e:	d28f           	add.l sp,d1
    6e30:	0681 ffff ff48 	addi.l #-184,d1
    6e36:	2f41 00c0      	move.l d1,192(sp)
    6e3a:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    6e40:	2c40           	movea.l d0,a6
    6e42:	206f 00cc      	movea.l 204(sp),a0
    6e46:	226f 00c8      	movea.l 200(sp),a1
    6e4a:	246f 00c4      	movea.l 196(sp),a2
    6e4e:	266f 00c0      	movea.l 192(sp),a3
    6e52:	4eae fdf6      	jsr -522(a6)
    6e56:	2f40 00bc      	move.l d0,188(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    6e5a:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    6e60:	2c40           	movea.l d0,a6
    6e62:	4eae ffc4      	jsr -60(a6)
    6e66:	2f40 00b8      	move.l d0,184(sp)
    6e6a:	202f 00b8      	move.l 184(sp),d0
    6e6e:	2f40 00b4      	move.l d0,180(sp)
    6e72:	742b           	moveq #43,d2
    6e74:	4602           	not.b d2
    6e76:	d48f           	add.l sp,d2
    6e78:	0682 ffff ff48 	addi.l #-184,d2
    6e7e:	2f42 00b0      	move.l d2,176(sp)
    6e82:	7064           	moveq #100,d0
    6e84:	2f40 00ac      	move.l d0,172(sp)
    6e88:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    6e8e:	2c40           	movea.l d0,a6
    6e90:	222f 00b4      	move.l 180(sp),d1
    6e94:	242f 00b0      	move.l 176(sp),d2
    6e98:	262f 00ac      	move.l 172(sp),d3
    6e9c:	4eae ffd0      	jsr -48(a6)
    6ea0:	2f40 00a8      	move.l d0,168(sp)
  for(int i=0;i<21;i++) {
    6ea4:	52af 00d0      	addq.l #1,208(sp)
    6ea8:	7214           	moveq #20,d1
    6eaa:	b2af 00d0      	cmp.l 208(sp),d1
    6eae:	6c00 ff26      	bge.w 6dd6 <TestRow+0x36>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    6eb2:	206f 00d8      	movea.l 216(sp),a0
    6eb6:	3010           	move.w (a0),d0
    6eb8:	322f 0016      	move.w 22(sp),d1
    6ebc:	b141           	eor.w d0,d1
    6ebe:	206f 00dc      	movea.l 220(sp),a0
    6ec2:	3010           	move.w (a0),d0
    6ec4:	b340           	eor.w d1,d0
    6ec6:	3000           	move.w d0,d0
    6ec8:	0280 0000 ffff 	andi.l #65535,d0
    6ece:	0280 0000 ff00 	andi.l #65280,d0
    6ed4:	4a80           	tst.l d0
    6ed6:	6700 00cc      	beq.w 6fa4 <TestRow+0x204>
    data[0] = 21;
    6eda:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    6ee0:	2f7c 0001 824f 	move.l #98895,164(sp)
    6ee6:	00a4 
    6ee8:	742b           	moveq #43,d2
    6eea:	4602           	not.b d2
    6eec:	d48f           	add.l sp,d2
    6eee:	0682 ffff ff44 	addi.l #-188,d2
    6ef4:	2f42 00a0      	move.l d2,160(sp)
    6ef8:	2f7c 0000 729c 	move.l #29340,156(sp)
    6efe:	009c 
    6f00:	702b           	moveq #43,d0
    6f02:	4600           	not.b d0
    6f04:	d08f           	add.l sp,d0
    6f06:	0680 ffff ff48 	addi.l #-184,d0
    6f0c:	2f40 0098      	move.l d0,152(sp)
    6f10:	2039 0001 ba7c 	move.l 1ba7c <_edata>,d0
    6f16:	2c40           	movea.l d0,a6
    6f18:	206f 00a4      	movea.l 164(sp),a0
    6f1c:	226f 00a0      	movea.l 160(sp),a1
    6f20:	246f 009c      	movea.l 156(sp),a2
    6f24:	266f 0098      	movea.l 152(sp),a3
    6f28:	4eae fdf6      	jsr -522(a6)
    6f2c:	2f40 0094      	move.l d0,148(sp)
                                                                           str);
    Write(  Output(), str, 100);
    6f30:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    6f36:	2c40           	movea.l d0,a6
    6f38:	4eae ffc4      	jsr -60(a6)
    6f3c:	2f40 0090      	move.l d0,144(sp)
    6f40:	202f 0090      	move.l 144(sp),d0
    6f44:	2f40 008c      	move.l d0,140(sp)
    6f48:	722b           	moveq #43,d1
    6f4a:	4601           	not.b d1
    6f4c:	d28f           	add.l sp,d1
    6f4e:	0681 ffff ff48 	addi.l #-184,d1
    6f54:	2f41 0088      	move.l d1,136(sp)
    6f58:	7464           	moveq #100,d2
    6f5a:	2f42 0084      	move.l d2,132(sp)
    6f5e:	2039 0001 ba80 	move.l 1ba80 <DOSBase>,d0
    6f64:	2c40           	movea.l d0,a6
    6f66:	222f 008c      	move.l 140(sp),d1
    6f6a:	242f 0088      	move.l 136(sp),d2
    6f6e:	262f 0084      	move.l 132(sp),d3
    6f72:	4eae ffd0      	jsr -48(a6)
    6f76:	2f40 0080      	move.l d0,128(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6f7a:	206f 00dc      	movea.l 220(sp),a0
    6f7e:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6f80:	7200           	moveq #0,d1
    6f82:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6f84:	206f 00d8      	movea.l 216(sp),a0
    6f88:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6f8a:	3000           	move.w d0,d0
    6f8c:	0280 0000 ffff 	andi.l #65535,d0
    6f92:	2f01           	move.l d1,-(sp)
    6f94:	2f00           	move.l d0,-(sp)
    6f96:	4879 0001 827f 	pea 1827f <incbin_swfont_end+0x699>
    6f9c:	4eba 0010      	jsr 6fae <KPrintF>(pc)
    6fa0:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6fa4:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6fa8:	4fef 00c0      	lea 192(sp),sp
    6fac:	4e75           	rts

00006fae <KPrintF>:
{
    6fae:	4fef ff80      	lea -128(sp),sp
    6fb2:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    6fb6:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee3d8f>
    6fbc:	6734           	beq.s 6ff2 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    6fbe:	2c79 0001 ba7c 	movea.l 1ba7c <_edata>,a6
    6fc4:	206f 0090      	movea.l 144(sp),a0
    6fc8:	43ef 0094      	lea 148(sp),a1
    6fcc:	45f9 0000 729c 	lea 729c <PutChar>,a2
    6fd2:	47ef 000c      	lea 12(sp),a3
    6fd6:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6fda:	2f0b           	move.l a3,-(sp)
    6fdc:	4878 0056      	pea 56 <GetVBR+0x4e>
    6fe0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee3d8f>
    6fe6:	508f           	addq.l #8,sp
}
    6fe8:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    6fec:	4fef 0080      	lea 128(sp),sp
    6ff0:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    6ff2:	2c79 0001 ba7c 	movea.l 1ba7c <_edata>,a6
    6ff8:	206f 0090      	movea.l 144(sp),a0
    6ffc:	43ef 0094      	lea 148(sp),a1
    7000:	45f9 0000 728e 	lea 728e <KPutCharX>,a2
    7006:	97cb           	suba.l a3,a3
    7008:	4eae fdf6      	jsr -522(a6)
}
    700c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    7010:	4fef 0080      	lea 128(sp),sp
    7014:	4e75           	rts

00007016 <RunTests>:
#include "runtests.h"
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    7016:	4eba ba86      	jsr 2a9e <TestCopperList>(pc)
    ZoomTest();
    701a:	6000 c112      	bra.w 312e <ZoomTest>

0000701e <memcpy>:
{
    701e:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    7022:	202f 0014      	move.l 20(sp),d0
    7026:	226f 0018      	movea.l 24(sp),a1
    702a:	222f 001c      	move.l 28(sp),d1
	while(len--)
    702e:	2601           	move.l d1,d3
    7030:	5383           	subq.l #1,d3
    7032:	4a81           	tst.l d1
    7034:	6762           	beq.s 7098 <memcpy+0x7a>
    7036:	2040           	movea.l d0,a0
    7038:	5888           	addq.l #4,a0
    703a:	b1c9           	cmpa.l a1,a0
    703c:	53c2           	sl.s d2
    703e:	4402           	neg.b d2
    7040:	41e9 0004      	lea 4(a1),a0
    7044:	b1c0           	cmpa.l d0,a0
    7046:	53c4           	sl.s d4
    7048:	4404           	neg.b d4
    704a:	8404           	or.b d4,d2
    704c:	7808           	moveq #8,d4
    704e:	b883           	cmp.l d3,d4
    7050:	55c4           	sc.s d4
    7052:	4404           	neg.b d4
    7054:	c404           	and.b d4,d2
    7056:	6746           	beq.s 709e <memcpy+0x80>
    7058:	2409           	move.l a1,d2
    705a:	8480           	or.l d0,d2
    705c:	7803           	moveq #3,d4
    705e:	c484           	and.l d4,d2
    7060:	663c           	bne.s 709e <memcpy+0x80>
    7062:	2049           	movea.l a1,a0
    7064:	2440           	movea.l d0,a2
    7066:	74fc           	moveq #-4,d2
    7068:	c481           	and.l d1,d2
    706a:	d489           	add.l a1,d2
		*d++ = *s++;
    706c:	24d8           	move.l (a0)+,(a2)+
    706e:	b488           	cmp.l a0,d2
    7070:	66fa           	bne.s 706c <memcpy+0x4e>
    7072:	74fc           	moveq #-4,d2
    7074:	c481           	and.l d1,d2
    7076:	2040           	movea.l d0,a0
    7078:	d1c2           	adda.l d2,a0
    707a:	d3c2           	adda.l d2,a1
    707c:	9682           	sub.l d2,d3
    707e:	b481           	cmp.l d1,d2
    7080:	6716           	beq.s 7098 <memcpy+0x7a>
    7082:	1091           	move.b (a1),(a0)
	while(len--)
    7084:	4a83           	tst.l d3
    7086:	6710           	beq.s 7098 <memcpy+0x7a>
		*d++ = *s++;
    7088:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    708e:	5383           	subq.l #1,d3
    7090:	6706           	beq.s 7098 <memcpy+0x7a>
		*d++ = *s++;
    7092:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    7098:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    709c:	4e75           	rts
    709e:	2040           	movea.l d0,a0
    70a0:	d289           	add.l a1,d1
		*d++ = *s++;
    70a2:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    70a4:	b289           	cmp.l a1,d1
    70a6:	67f0           	beq.s 7098 <memcpy+0x7a>
		*d++ = *s++;
    70a8:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    70aa:	b289           	cmp.l a1,d1
    70ac:	66f4           	bne.s 70a2 <memcpy+0x84>
    70ae:	60e8           	bra.s 7098 <memcpy+0x7a>

000070b0 <memset>:
{
    70b0:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    70b4:	202f 0024      	move.l 36(sp),d0
    70b8:	2a2f 0028      	move.l 40(sp),d5
    70bc:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    70c0:	2809           	move.l a1,d4
    70c2:	5384           	subq.l #1,d4
    70c4:	b2fc 0000      	cmpa.w #0,a1
    70c8:	6f00 00b0      	ble.w 717a <memset+0xca>
    70cc:	1e05           	move.b d5,d7
    70ce:	2200           	move.l d0,d1
    70d0:	4481           	neg.l d1
    70d2:	7403           	moveq #3,d2
    70d4:	c282           	and.l d2,d1
    70d6:	7c05           	moveq #5,d6
		*ptr++ = val;
    70d8:	2440           	movea.l d0,a2
    70da:	bc84           	cmp.l d4,d6
    70dc:	646a           	bcc.s 7148 <memset+0x98>
    70de:	4a81           	tst.l d1
    70e0:	6724           	beq.s 7106 <memset+0x56>
    70e2:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    70e4:	5384           	subq.l #1,d4
    70e6:	7401           	moveq #1,d2
    70e8:	b481           	cmp.l d1,d2
    70ea:	671a           	beq.s 7106 <memset+0x56>
		*ptr++ = val;
    70ec:	2440           	movea.l d0,a2
    70ee:	548a           	addq.l #2,a2
    70f0:	2040           	movea.l d0,a0
    70f2:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    70f6:	5384           	subq.l #1,d4
    70f8:	7403           	moveq #3,d2
    70fa:	b481           	cmp.l d1,d2
    70fc:	6608           	bne.s 7106 <memset+0x56>
		*ptr++ = val;
    70fe:	528a           	addq.l #1,a2
    7100:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    7104:	5384           	subq.l #1,d4
    7106:	2609           	move.l a1,d3
    7108:	9681           	sub.l d1,d3
    710a:	7c00           	moveq #0,d6
    710c:	1c05           	move.b d5,d6
    710e:	2406           	move.l d6,d2
    7110:	4842           	swap d2
    7112:	4242           	clr.w d2
    7114:	2042           	movea.l d2,a0
    7116:	2406           	move.l d6,d2
    7118:	e14a           	lsl.w #8,d2
    711a:	4842           	swap d2
    711c:	4242           	clr.w d2
    711e:	e18e           	lsl.l #8,d6
    7120:	2646           	movea.l d6,a3
    7122:	2c08           	move.l a0,d6
    7124:	8486           	or.l d6,d2
    7126:	2c0b           	move.l a3,d6
    7128:	8486           	or.l d6,d2
    712a:	1407           	move.b d7,d2
    712c:	2040           	movea.l d0,a0
    712e:	d1c1           	adda.l d1,a0
    7130:	72fc           	moveq #-4,d1
    7132:	c283           	and.l d3,d1
    7134:	d288           	add.l a0,d1
		*ptr++ = val;
    7136:	20c2           	move.l d2,(a0)+
    7138:	b1c1           	cmpa.l d1,a0
    713a:	66fa           	bne.s 7136 <memset+0x86>
    713c:	72fc           	moveq #-4,d1
    713e:	c283           	and.l d3,d1
    7140:	d5c1           	adda.l d1,a2
    7142:	9881           	sub.l d1,d4
    7144:	b283           	cmp.l d3,d1
    7146:	6732           	beq.s 717a <memset+0xca>
    7148:	1485           	move.b d5,(a2)
	while(len-- > 0)
    714a:	4a84           	tst.l d4
    714c:	6f2c           	ble.s 717a <memset+0xca>
		*ptr++ = val;
    714e:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    7152:	7201           	moveq #1,d1
    7154:	b284           	cmp.l d4,d1
    7156:	6c22           	bge.s 717a <memset+0xca>
		*ptr++ = val;
    7158:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    715c:	7402           	moveq #2,d2
    715e:	b484           	cmp.l d4,d2
    7160:	6c18           	bge.s 717a <memset+0xca>
		*ptr++ = val;
    7162:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    7166:	7c03           	moveq #3,d6
    7168:	bc84           	cmp.l d4,d6
    716a:	6c0e           	bge.s 717a <memset+0xca>
		*ptr++ = val;
    716c:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    7170:	7204           	moveq #4,d1
    7172:	b284           	cmp.l d4,d1
    7174:	6c04           	bge.s 717a <memset+0xca>
		*ptr++ = val;
    7176:	1545 0005      	move.b d5,5(a2)
}
    717a:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    717e:	4e75           	rts

00007180 <strlen>:
{
    7180:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    7184:	7000           	moveq #0,d0
	while(*s++)
    7186:	4a10           	tst.b (a0)
    7188:	6708           	beq.s 7192 <strlen+0x12>
		t++;
    718a:	5280           	addq.l #1,d0
	while(*s++)
    718c:	4a30 0800      	tst.b (0,a0,d0.l)
    7190:	66f8           	bne.s 718a <strlen+0xa>
}
    7192:	4e75           	rts

00007194 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    7194:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    7198:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    719c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    71a0:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    71a4:	d041           	add.w d1,d0
	swap	d0
    71a6:	4840           	swap d0
	clrw	d0
    71a8:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    71aa:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    71ae:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    71b2:	d081           	add.l d1,d0

	rts
    71b4:	4e75           	rts

000071b6 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    71b6:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    71b8:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    71bc:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    71c0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    71c6:	6416           	bcc.s 71de <__udivsi3+0x28>
	movel	d0, d2
    71c8:	2400           	move.l d0,d2
	clrw	d2
    71ca:	4242           	clr.w d2
	swap	d2
    71cc:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    71ce:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    71d0:	3002           	move.w d2,d0
	swap	d0
    71d2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    71d4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    71d8:	84c1           	divu.w d1,d2
	movew	d2, d0
    71da:	3002           	move.w d2,d0
	jra	6f
    71dc:	6030           	bra.s 720e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    71de:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    71e0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    71e2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    71e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    71ea:	64f4           	bcc.s 71e0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    71ec:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    71ee:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    71f4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    71f6:	c2c0           	mulu.w d0,d1
	swap	d2
    71f8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    71fa:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    71fc:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    71fe:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    7200:	660a           	bne.s 720c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    7202:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    7204:	6506           	bcs.s 720c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    7206:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    720a:	6302           	bls.s 720e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    720c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    720e:	241f           	move.l (sp)+,d2
	rts
    7210:	4e75           	rts

00007212 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    7212:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    7214:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    7216:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    721a:	6a04           	bpl.s 7220 <__divsi3+0xe>
	negl	d1
    721c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    721e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    7220:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    7224:	6a04           	bpl.s 722a <__divsi3+0x18>
	negl	d0
    7226:	4480           	neg.l d0
	negb	d2
    7228:	4402           	neg.b d2

2:	movel	d1, sp@-
    722a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    722c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    722e:	6186           	bsr.s 71b6 <__udivsi3>
	addql	IMM (8), sp
    7230:	508f           	addq.l #8,sp

	tstb	d2
    7232:	4a02           	tst.b d2
	jpl	3f
    7234:	6a02           	bpl.s 7238 <__divsi3+0x26>
	negl	d0
    7236:	4480           	neg.l d0

3:	movel	sp@+, d2
    7238:	241f           	move.l (sp)+,d2
	rts
    723a:	4e75           	rts

0000723c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    723c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7240:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    7244:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7246:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    7248:	61c8           	bsr.s 7212 <__divsi3>
	addql	IMM (8), sp
    724a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    724c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    7250:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    7252:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    7254:	6100 ff3e      	bsr.w 7194 <__mulsi3>
	addql	IMM (8), sp
    7258:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    725a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    725e:	9280           	sub.l d0,d1
	movel	d1, d0
    7260:	2001           	move.l d1,d0
	rts
    7262:	4e75           	rts

00007264 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    7264:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    7268:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    726c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    726e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    7270:	6100 ff44      	bsr.w 71b6 <__udivsi3>
	addql	IMM (8), sp
    7274:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    7276:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    727a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    727c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    727e:	6100 ff14      	bsr.w 7194 <__mulsi3>
	addql	IMM (8), sp
    7282:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    7284:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    7288:	9280           	sub.l d0,d1
	movel	d1, d0
    728a:	2001           	move.l d1,d0
	rts
    728c:	4e75           	rts

0000728e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    728e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    7290:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    7294:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    7298:	2c5f           	movea.l (sp)+,a6
    rts
    729a:	4e75           	rts

0000729c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    729c:	16c0           	move.b d0,(a3)+
	rts
    729e:	4e75           	rts

000072a0 <saveregs>:
	...

000072dc <font2distance>:
    72dc:	0505           	btst d2,d5
    72de:	0505           	btst d2,d5
    72e0:	0505           	btst d2,d5
    72e2:	0505           	btst d2,d5
    72e4:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    72e6:	0505           	btst d2,d5
    72e8:	0505           	btst d2,d5
    72ea:	0005 0505      	ori.b #5,d5
    72ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    72f0:	0505           	btst d2,d5
    72f2:	0505           	btst d2,d5
    72f4:	0505           	btst d2,d5
    72f6:	0505           	btst d2,d5
    72f8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    72fa:	0505           	btst d2,d5
    72fc:	0505           	btst d2,d5
    72fe:	0505           	btst d2,d5
    7300:	0505           	btst d2,d5
    7302:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    7304:	0500           	btst d2,d0
    7306:	0505           	btst d2,d5
    7308:	0505           	btst d2,d5
    730a:	0505           	btst d2,d5
    730c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    730e:	0505           	btst d2,d5
    7310:	0505           	btst d2,d5
    7312:	0505           	btst d2,d5
    7314:	0505           	btst d2,d5
    7316:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    7318:	0505           	btst d2,d5
    731a:	0505           	btst d2,d5
    731c:	0503           	btst d2,d3
    731e:	0505           	btst d2,d5
    7320:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    7322:	0505           	btst d2,d5
    7324:	0500           	btst d2,d0
    7326:	0505           	btst d2,d5
    7328:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    732c:	0505           	btst d2,d5
    732e:	0503           	btst d2,d3
    7330:	0205 0507      	andi.b #7,d5
    7334:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    7336:	0505           	btst d2,d5
    7338:	0505           	btst d2,d5
    733a:	0505           	btst d2,d5
    733c:	0505           	btst d2,d5
    733e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    7340:	0505           	btst d2,d5
    7342:	0505           	btst d2,d5
    7344:	0505           	btst d2,d5
    7346:	0505           	btst d2,d5
    7348:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    734a:	0505           	btst d2,d5
    734c:	0505           	btst d2,d5
    734e:	0505           	btst d2,d5
    7350:	0505           	btst d2,d5
    7352:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    7354:	0505           	btst d2,d5
    7356:	0505           	btst d2,d5
    7358:	0505           	btst d2,d5
    735a:	0505           	btst d2,d5
    735c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    735e:	0505           	btst d2,d5
    7360:	0505           	btst d2,d5
    7362:	0505           	btst d2,d5
    7364:	0505           	btst d2,d5
    7366:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    7368:	0505           	btst d2,d5
    736a:	0505           	btst d2,d5
    736c:	0505           	btst d2,d5
    736e:	0505           	btst d2,d5
    7370:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    7372:	0505           	btst d2,d5
    7374:	0505           	btst d2,d5
    7376:	0505           	btst d2,d5
    7378:	0505           	btst d2,d5
    737a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    737c:	0505           	btst d2,d5
    737e:	0505           	btst d2,d5
    7380:	0505           	btst d2,d5
    7382:	0505           	btst d2,d5
    7384:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    7386:	0505           	btst d2,d5
    7388:	0505           	btst d2,d5
    738a:	0505           	btst d2,d5
    738c:	0505           	btst d2,d5
    738e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    7390:	0505           	btst d2,d5
    7392:	0505           	btst d2,d5
    7394:	0505           	btst d2,d5
    7396:	0505           	btst d2,d5
    7398:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    739a:	0505           	btst d2,d5
    739c:	0505           	btst d2,d5
    739e:	0505           	btst d2,d5
    73a0:	0505           	btst d2,d5
    73a2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    73a4:	0505           	btst d2,d5
    73a6:	0505           	btst d2,d5
    73a8:	0505           	btst d2,d5
    73aa:	0505           	btst d2,d5
    73ac:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    73ae:	0505           	btst d2,d5
    73b0:	0505           	btst d2,d5
    73b2:	0505           	btst d2,d5
    73b4:	0505           	btst d2,d5
    73b6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    73b8:	0505           	btst d2,d5
    73ba:	0505           	btst d2,d5
    73bc:	0505           	btst d2,d5
    73be:	0505           	btst d2,d5
    73c0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    73c2:	0505           	btst d2,d5
    73c4:	0505           	btst d2,d5
    73c6:	0505           	btst d2,d5
    73c8:	0505           	btst d2,d5
    73ca:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    73cc:	0505           	btst d2,d5
    73ce:	0505           	btst d2,d5
    73d0:	0505           	btst d2,d5
    73d2:	0505           	btst d2,d5
    73d4:	0505           	btst d2,d5

000073d6 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    73d6:	16c0           	move.b d0,(a3)+
  RTS
    73d8:	4e75           	rts

000073da <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    73da:	48f9 7fff 0000 	movem.l d0-a6,72a0 <saveregs>
    73e0:	72a0 
  lea 0xdff000,a5
    73e2:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd2e2f>,a5
  move.l sp@(4),a0  //Fontlocation
    73e8:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    73ec:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    73f0:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    73f4:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    73f6:	082d 0006 0002 	btst #6,2(a5)

000073fc <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    73fc:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    7402:	66f8           	bne.s 73fc <st2wblit>

00007404 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    7404:	7019           	moveq #25,d0
	sub.l d5,d5      
    7406:	9a85           	sub.l d5,d5

00007408 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    7408:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    740a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    740c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    7410:	9dce           	suba.l a6,a6
	move.l d2, a6
    7412:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    7414:	ddfc 0000 72dc 	adda.l #29404,a6

	LSL  	#4,d2 	    //Fetch next char
    741a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    741c:	2842           	movea.l d2,a4


	move.l  #0,d4
    741e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    7420:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    7422:	3814           	move.w (a4),d4
	swap	d4
    7424:	4844           	swap d4
	lsr.l	d5, d4
    7426:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    7428:	8993           	or.l d4,(a3)
	clr.l	d4
    742a:	4284           	clr.l d4
	move.w  2(a4), d4
    742c:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    7430:	4844           	swap d4
	lsr.l	d5, d4
    7432:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    7434:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    7438:	4284           	clr.l d4
	move.w  4(a4), d4
    743a:	382c 0004      	move.w 4(a4),d4
	swap	d4
    743e:	4844           	swap d4
	lsr.l	d5, d4
    7440:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    7442:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    7446:	4284           	clr.l d4
	move.w  6(a4), d4
    7448:	382c 0006      	move.w 6(a4),d4
	swap	d4
    744c:	4844           	swap d4
	lsr.l	d5, d4
    744e:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    7450:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    7454:	4284           	clr.l d4
	move.w  8(a4), d4
    7456:	382c 0008      	move.w 8(a4),d4
	swap	d4
    745a:	4844           	swap d4
	lsr.l	d5, d4
    745c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    745e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    7462:	4284           	clr.l d4
	move.w  10(a4), d4
    7464:	382c 000a      	move.w 10(a4),d4
	swap	d4
    7468:	4844           	swap d4
	lsr.l	d5, d4
    746a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    746c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    7470:	4284           	clr.l d4
	move.w  12(a4), d4
    7472:	382c 000c      	move.w 12(a4),d4
	swap	d4
    7476:	4844           	swap d4
	lsr.l	d5, d4
    7478:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    747a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    747e:	4284           	clr.l d4
	move.w  14(a4), d4
    7480:	382c 000e      	move.w 14(a4),d4
	swap	d4
    7484:	4844           	swap d4
	lsr.l	d5, d4
    7486:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    7488:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    748c:	4284           	clr.l d4

	add.b   (a6), d5
    748e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    7490:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    7494:	6500 0006      	bcs.w 749c <noadditionalchar>
	addq.w  #1, a3
    7498:	524b           	addq.w #1,a3
	sub.w   #8,d5
    749a:	5145           	subq.w #8,d5

0000749c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    749c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    749e:	51c8 ff68      	dbf d0,7408 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    74a2:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    74a6:	51cb ff5c      	dbf d3,7404 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    74aa:	4cfa 7fff fdf2 	movem.l 72a0 <saveregs>(pc),d0-a6

	RTS
    74b0:	4e75           	rts
