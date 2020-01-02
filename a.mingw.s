
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:


int main();

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
	main();
   0:	4ef9 0000 0006 	jmp 6 <main>

00000006 <main>:
#include "utils.h"
#include "runtests.h"
#include "rundemo.h"

int main() {
   6:	518f           	subq.l #8,sp
   8:	48e7 3132      	movem.l d2-d3/d7/a2-a3/a6,-(sp)

    SysBase = *((struct ExecBase**)4UL);
   c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
  10:	23ce 0000 f6be 	move.l a6,f6be <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,f6ba <hw>
  1c:	0000 f6ba 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0ba5 	lea ba5 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 f6b6 	move.l d0,f6b6 <GfxBase>
	if (!GfxBase)
  32:	6700 0574      	beq.w 5a8 <main+0x5a2>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
  3c:	43f9 0000 0bb6 	lea bb6 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 f6b2 	move.l d0,f6b2 <DOSBase>
	if (!DOSBase)
  4e:	6700 054c      	beq.w 59c <main+0x596>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0bc2 	pea bc2 <incbin_colors_end+0x66>
  58:	4eb9 0000 069e 	jsr 69e <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0bde 	move.l #3038,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  DrawCopper = Copperlist1;
  7c:	23fc 0000 f620 	move.l #63008,f69c <DrawCopper>
  82:	0000 f69c 
  ViewCopper = Copperlist2;
  86:	23fc 0000 f5a0 	move.l #62880,f61c <ViewCopper>
  8c:	0000 f61c 
  ClBuild( Copperlist1);
  90:	4879 0000 f620 	pea f620 <Copperlist1>
  96:	45f9 0000 0706 	lea 706 <ClBuild>,a2
  9c:	4e92           	jsr (a2)
    if( instructions[ pos+i] != batch[ i])
  9e:	508f           	addq.l #8,sp
  a0:	2039 0000 f620 	move.l f620 <Copperlist1>,d0
  a6:	b0b9 0000 2d40 	cmp.l 2d40 <ClsSprites>,d0
  ac:	6600 04aa      	bne.w 558 <main+0x552>
  b0:	2239 0000 f624 	move.l f624 <Copperlist1+0x4>,d1
  b6:	b2b9 0000 2d44 	cmp.l 2d44 <ClsSprites+0x4>,d1
  bc:	6600 049a      	bne.w 558 <main+0x552>
  c0:	2039 0000 f628 	move.l f628 <Copperlist1+0x8>,d0
  c6:	b0b9 0000 2d48 	cmp.l 2d48 <ClsSprites+0x8>,d0
  cc:	6600 048a      	bne.w 558 <main+0x552>
  d0:	2239 0000 f62c 	move.l f62c <Copperlist1+0xc>,d1
  d6:	b2b9 0000 2d4c 	cmp.l 2d4c <ClsSprites+0xc>,d1
  dc:	6600 047a      	bne.w 558 <main+0x552>
  e0:	2039 0000 f630 	move.l f630 <Copperlist1+0x10>,d0
  e6:	b0b9 0000 2d50 	cmp.l 2d50 <ClsSprites+0x10>,d0
  ec:	6600 046a      	bne.w 558 <main+0x552>
  f0:	2239 0000 f634 	move.l f634 <Copperlist1+0x14>,d1
  f6:	b2b9 0000 2d54 	cmp.l 2d54 <ClsSprites+0x14>,d1
  fc:	6600 045a      	bne.w 558 <main+0x552>
 100:	2039 0000 f638 	move.l f638 <Copperlist1+0x18>,d0
 106:	b0b9 0000 2d58 	cmp.l 2d58 <ClsSprites+0x18>,d0
 10c:	6600 044a      	bne.w 558 <main+0x552>
 110:	2239 0000 f63c 	move.l f63c <Copperlist1+0x1c>,d1
 116:	b2b9 0000 2d5c 	cmp.l 2d5c <ClsSprites+0x1c>,d1
 11c:	6600 043a      	bne.w 558 <main+0x552>
 120:	2039 0000 f640 	move.l f640 <Copperlist1+0x20>,d0
 126:	b0b9 0000 2d60 	cmp.l 2d60 <ClsSprites+0x20>,d0
 12c:	6600 042a      	bne.w 558 <main+0x552>
 130:	2239 0000 f644 	move.l f644 <Copperlist1+0x24>,d1
 136:	b2b9 0000 2d64 	cmp.l 2d64 <ClsSprites+0x24>,d1
 13c:	6600 041a      	bne.w 558 <main+0x552>
 140:	2039 0000 f648 	move.l f648 <Copperlist1+0x28>,d0
 146:	b0b9 0000 2d68 	cmp.l 2d68 <ClsSprites+0x28>,d0
 14c:	6600 040a      	bne.w 558 <main+0x552>
 150:	2239 0000 f64c 	move.l f64c <Copperlist1+0x2c>,d1
 156:	b2b9 0000 2d6c 	cmp.l 2d6c <ClsSprites+0x2c>,d1
 15c:	6600 03fa      	bne.w 558 <main+0x552>
 160:	2039 0000 f650 	move.l f650 <Copperlist1+0x30>,d0
 166:	b0b9 0000 2d70 	cmp.l 2d70 <ClsSprites+0x30>,d0
 16c:	6600 03ea      	bne.w 558 <main+0x552>
 170:	2239 0000 f654 	move.l f654 <Copperlist1+0x34>,d1
 176:	b2b9 0000 2d74 	cmp.l 2d74 <ClsSprites+0x34>,d1
 17c:	6600 03da      	bne.w 558 <main+0x552>
 180:	2039 0000 f658 	move.l f658 <Copperlist1+0x38>,d0
 186:	b0b9 0000 2d78 	cmp.l 2d78 <ClsSprites+0x38>,d0
 18c:	6600 03ca      	bne.w 558 <main+0x552>
 190:	2239 0000 f65c 	move.l f65c <Copperlist1+0x3c>,d1
 196:	b2b9 0000 2d7c 	cmp.l 2d7c <ClsSprites+0x3c>,d1
 19c:	6600 03ba      	bne.w 558 <main+0x552>
 1a0:	2039 0000 2d10 	move.l 2d10 <ClScreen>,d0
 1a6:	b0b9 0000 f660 	cmp.l f660 <Copperlist1+0x40>,d0
 1ac:	6600 03cc      	bne.w 57a <main+0x574>
 1b0:	2239 0000 2d14 	move.l 2d14 <ClScreen+0x4>,d1
 1b6:	b2b9 0000 f664 	cmp.l f664 <Copperlist1+0x44>,d1
 1bc:	6600 03bc      	bne.w 57a <main+0x574>
 1c0:	2039 0000 2d18 	move.l 2d18 <ClScreen+0x8>,d0
 1c6:	b0b9 0000 f668 	cmp.l f668 <Copperlist1+0x48>,d0
 1cc:	6600 03ac      	bne.w 57a <main+0x574>
 1d0:	2239 0000 2d1c 	move.l 2d1c <ClScreen+0xc>,d1
 1d6:	b2b9 0000 f66c 	cmp.l f66c <Copperlist1+0x4c>,d1
 1dc:	6600 039c      	bne.w 57a <main+0x574>
 1e0:	2039 0000 f670 	move.l f670 <Copperlist1+0x50>,d0
 1e6:	b0b9 0000 2d20 	cmp.l 2d20 <ClScreen+0x10>,d0
 1ec:	6600 038c      	bne.w 57a <main+0x574>
 1f0:	2239 0000 f674 	move.l f674 <Copperlist1+0x54>,d1
 1f6:	b2b9 0000 2d24 	cmp.l 2d24 <ClScreen+0x14>,d1
 1fc:	6600 037c      	bne.w 57a <main+0x574>
 200:	2039 0000 f678 	move.l f678 <Copperlist1+0x58>,d0
 206:	b0b9 0000 2d28 	cmp.l 2d28 <ClScreen+0x18>,d0
 20c:	6600 036c      	bne.w 57a <main+0x574>
 210:	2239 0000 f67c 	move.l f67c <Copperlist1+0x5c>,d1
 216:	b2b9 0000 2d2c 	cmp.l 2d2c <ClScreen+0x1c>,d1
 21c:	6600 035c      	bne.w 57a <main+0x574>
 220:	2039 0000 f680 	move.l f680 <Copperlist1+0x60>,d0
 226:	b0b9 0000 2d30 	cmp.l 2d30 <ClScreen+0x20>,d0
 22c:	6600 034c      	bne.w 57a <main+0x574>
 230:	2239 0000 f684 	move.l f684 <Copperlist1+0x64>,d1
 236:	b2b9 0000 2d34 	cmp.l 2d34 <ClScreen+0x24>,d1
 23c:	6600 033c      	bne.w 57a <main+0x574>
 240:	2039 0000 f688 	move.l f688 <Copperlist1+0x68>,d0
 246:	b0b9 0000 2d38 	cmp.l 2d38 <ClScreen+0x28>,d0
 24c:	6600 032c      	bne.w 57a <main+0x574>
 250:	2239 0000 f68c 	move.l f68c <Copperlist1+0x6c>,d1
 256:	b2b9 0000 2d3c 	cmp.l 2d3c <ClScreen+0x2c>,d1
 25c:	6600 031c      	bne.w 57a <main+0x574>
}
void SetBplPointers() {
  UWORD highword = (ULONG)DrawBuffer >> 16;
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
  
  *CopBpl1Low = lowword;
 260:	2079 0000 2d94 	movea.l 2d94 <CopBpl1Low>,a0
 266:	4250           	clr.w (a0)
  *CopBpl1High = highword;
 268:	2079 0000 2d90 	movea.l 2d90 <CopBpl1High>,a0
 26e:	30bc 0004      	move.w #4,(a0)
  
  ULONG tmp = DrawBuffer;
  DrawBuffer = ViewBuffer;
 272:	23fc 0005 0000 	move.l #327680,f59c <DrawBuffer>
 278:	0000 f59c 
  ViewBuffer = tmp;
 27c:	23fc 0004 0000 	move.l #262144,f598 <ViewBuffer>
 282:	0000 f598 
  if( instructions[pos] == value ) 
 286:	0cb9 00e0 0004 	cmpi.l #14680068,f690 <Copperlist1+0x70>
 28c:	0000 f690 
 290:	671e           	beq.s 2b0 <main+0x2aa>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
 292:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 298:	4eae ffc4      	jsr -60(a6)
 29c:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 2a2:	2200           	move.l d0,d1
 2a4:	243c 0000 0bee 	move.l #3054,d2
 2aa:	763c           	moveq #60,d3
 2ac:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2b0:	0cb9 00e2 0000 	cmpi.l #14811136,f694 <Copperlist1+0x74>
 2b6:	0000 f694 
 2ba:	671e           	beq.s 2da <main+0x2d4>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
 2bc:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 2c2:	4eae ffc4      	jsr -60(a6)
 2c6:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 2cc:	2200           	move.l d0,d1
 2ce:	243c 0000 0c2b 	move.l #3115,d2
 2d4:	763c           	moveq #60,d3
 2d6:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2da:	70fe           	moveq #-2,d0
 2dc:	b0b9 0000 f698 	cmp.l f698 <Copperlist1+0x78>,d0
 2e2:	671e           	beq.s 302 <main+0x2fc>
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if( TestCopperlistPos( Copperlist1, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 2e4:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 2ea:	4eae ffc4      	jsr -60(a6)
 2ee:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 2f4:	2200           	move.l d0,d1
 2f6:	243c 0000 0c68 	move.l #3176,d2
 2fc:	761f           	moveq #31,d3
 2fe:	4eae ffd0      	jsr -48(a6)
}

void SwapCl() {
  ULONG tmp = DrawCopper;
 302:	2239 0000 f69c 	move.l f69c <DrawCopper>,d1
  DrawCopper = ViewCopper;
 308:	2039 0000 f61c 	move.l f61c <ViewCopper>,d0
 30e:	23c0 0000 f69c 	move.l d0,f69c <DrawCopper>
  ViewCopper = tmp;
 314:	23c1 0000 f61c 	move.l d1,f61c <ViewCopper>
  
  SwapCl();
  if( DrawCopper != &Copperlist2)
 31a:	0c80 0000 f5a0 	cmpi.l #62880,d0
 320:	671e           	beq.s 340 <main+0x33a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
 322:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 328:	4eae ffc4      	jsr -60(a6)
 32c:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 332:	2200           	move.l d0,d1
 334:	243c 0000 0c8a 	move.l #3210,d2
 33a:	7615           	moveq #21,d3
 33c:	4eae ffd0      	jsr -48(a6)
  ClBuild( Copperlist1);
 340:	4879 0000 f620 	pea f620 <Copperlist1>
 346:	4e92           	jsr (a2)
  ClBuild( Copperlist2);
 348:	4879 0000 f5a0 	pea f5a0 <Copperlist2>
 34e:	4e92           	jsr (a2)
  DrawBuffer = Bitplane1;
 350:	23fc 0000 2d98 	move.l #11672,f59c <DrawBuffer>
 356:	0000 f59c 
  DrawCopper = Copperlist1;
 35a:	23fc 0000 f620 	move.l #63008,f69c <DrawCopper>
 360:	0000 f69c 
  RunTests();
	Delay(50);
 364:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 36a:	7232           	moveq #50,d1
 36c:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 370:	247c 00f0 ff60 	movea.l #15794016,a2
 376:	508f           	addq.l #8,sp
 378:	4a92           	tst.l (a2)
 37a:	6718           	beq.s 394 <main+0x38e>
 37c:	4878 0001      	pea 1 <_start+0x1>
 380:	47f9 0000 05fc 	lea 5fc <warpmode.part.0>,a3
 386:	4e93           	jsr (a3)
 388:	588f           	addq.l #4,sp
 38a:	4a92           	tst.l (a2)
 38c:	6706           	beq.s 394 <main+0x38e>
 38e:	42a7           	clr.l -(sp)
 390:	4e93           	jsr (a3)
 392:	588f           	addq.l #4,sp
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 394:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 39a:	23ee 0022 0000 	move.l 34(a6),f6a0 <ActiView>
 3a0:	f6a0 
	OwnBlitter();
 3a2:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 3a6:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 3ac:	4eae ff1c      	jsr -228(a6)
	Disable();
 3b0:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 3b6:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 3ba:	2479 0000 f6ba 	movea.l f6ba <hw>,a2
 3c0:	302a 0010      	move.w 16(a2),d0
 3c4:	33c0 0000 f6a4 	move.w d0,f6a4 <SystemADKCON>
	SystemInts=hw->intenar;
 3ca:	302a 001c      	move.w 28(a2),d0
 3ce:	33c0 0000 f6a8 	move.w d0,f6a8 <SystemInts>
	SystemDMA=hw->dmaconr;
 3d4:	302a 0002      	move.w 2(a2),d0
 3d8:	33c0 0000 f6a6 	move.w d0,f6a6 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 3de:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 3e4:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 3ea:	47f9 0000 0814 	lea 814 <WaitVbl>,a3
 3f0:	4e93           	jsr (a3)
	WaitVbl();
 3f2:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 3f4:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 3fa:	7000           	moveq #0,d0
		hw->color[a]=0;
 3fc:	2200           	move.l d0,d1
 3fe:	0681 0000 00c0 	addi.l #192,d1
 404:	d281           	add.l d1,d1
 406:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 40c:	5280           	addq.l #1,d0
 40e:	7220           	moveq #32,d1
 410:	b280           	cmp.l d0,d1
 412:	66e8           	bne.s 3fc <main+0x3f6>

	LoadView(0);
 414:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 41a:	93c9           	suba.l a1,a1
 41c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 420:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 426:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 42a:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 430:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 434:	4e93           	jsr (a3)
	WaitVbl();
 436:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 438:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 43e:	3f7c 0801 001c 	move.w #2049,28(sp)
 444:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 44a:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 450:	082e 0000 0129 	btst #0,297(a6)
 456:	6700 017a      	beq.w 5d2 <main+0x5cc>
		vbr = (APTR)Supervisor((void*)getvbr);
 45a:	7e1a           	moveq #26,d7
 45c:	de8f           	add.l sp,d7
 45e:	cf8d           	exg d7,a5
 460:	4eae ffe2      	jsr -30(a6)
 464:	cf8d           	exg d7,a5

	VBR=GetVBR();
 466:	23c0 0000 f6aa 	move.l d0,f6aa <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 46c:	2079 0000 f6aa 	movea.l f6aa <VBR.lto_priv.0>,a0
 472:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 476:	23ca 0000 f6ae 	move.l a2,f6ae <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 47c:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 47e:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 480:	2079 0000 f6ba 	movea.l f6ba <hw>,a0
 486:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 48a:	3028 0002      	move.w 2(a0),d0
 48e:	0800 000e      	btst #14,d0
 492:	66f6           	bne.s 48a <main+0x484>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 494:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 49a:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 4a0:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 4a6:	2279 0000 f6aa 	movea.l f6aa <VBR.lto_priv.0>,a1
 4ac:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 4b0:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 4b6:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 4bc:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 4c2:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 4c8:	3039 0000 f6a8 	move.w f6a8 <SystemInts>,d0
 4ce:	0040 8000      	ori.w #-32768,d0
 4d2:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 4d6:	3039 0000 f6a6 	move.w f6a6 <SystemDMA>,d0
 4dc:	0040 8000      	ori.w #-32768,d0
 4e0:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 4e4:	3039 0000 f6a4 	move.w f6a4 <SystemADKCON>,d0
 4ea:	0040 8000      	ori.w #-32768,d0
 4ee:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 4f2:	2279 0000 f6a0 	movea.l f6a0 <ActiView>,a1
 4f8:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 4fc:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 502:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 506:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 50c:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 510:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 516:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 51a:	2c79 0000 f6b6 	movea.l f6b6 <GfxBase>,a6
 520:	4eae fe32      	jsr -462(a6)
	Enable();
 524:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 52a:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 52e:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 534:	2279 0000 f6b2 	movea.l f6b2 <DOSBase>,a1
 53a:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 53e:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 544:	2279 0000 f6b6 	movea.l f6b6 <GfxBase>,a1
 54a:	4eae fe62      	jsr -414(a6)
}
 54e:	7000           	moveq #0,d0
 550:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 554:	508f           	addq.l #8,sp
 556:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 558:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 55e:	4eae ffc4      	jsr -60(a6)
 562:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 568:	2200           	move.l d0,d1
 56a:	243c 0000 0cd7 	move.l #3287,d2
 570:	762c           	moveq #44,d3
 572:	4eae ffd0      	jsr -48(a6)
 576:	6000 fc28      	bra.w 1a0 <main+0x19a>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 57a:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 580:	4eae ffc4      	jsr -60(a6)
 584:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 58a:	2200           	move.l d0,d1
 58c:	243c 0000 0ca0 	move.l #3232,d2
 592:	7636           	moveq #54,d3
 594:	4eae ffd0      	jsr -48(a6)
 598:	6000 fcc6      	bra.w 260 <main+0x25a>
		Exit(0);
 59c:	9dce           	suba.l a6,a6
 59e:	7200           	moveq #0,d1
 5a0:	4eae ff70      	jsr -144(a6)
 5a4:	6000 faac      	bra.w 52 <main+0x4c>
		Exit(0);
 5a8:	2c79 0000 f6b2 	movea.l f6b2 <DOSBase>,a6
 5ae:	7200           	moveq #0,d1
 5b0:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 5b4:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 5ba:	43f9 0000 0bb6 	lea bb6 <incbin_colors_end+0x5a>,a1
 5c0:	7000           	moveq #0,d0
 5c2:	4eae fdd8      	jsr -552(a6)
 5c6:	23c0 0000 f6b2 	move.l d0,f6b2 <DOSBase>
	if (!DOSBase)
 5cc:	6600 fa84      	bne.w 52 <main+0x4c>
 5d0:	60ca           	bra.s 59c <main+0x596>
	APTR vbr = 0;
 5d2:	7000           	moveq #0,d0
	VBR=GetVBR();
 5d4:	23c0 0000 f6aa 	move.l d0,f6aa <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 5da:	2079 0000 f6aa 	movea.l f6aa <VBR.lto_priv.0>,a0
 5e0:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 5e4:	23ca 0000 f6ae 	move.l a2,f6ae <SystemIrq>
	WaitVbl();
 5ea:	4e93           	jsr (a3)
	WaitVbl();
 5ec:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 5ee:	2079 0000 f6ba 	movea.l f6ba <hw>,a0
 5f4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 5f8:	6000 fe90      	bra.w 48a <main+0x484>

000005fc <warpmode.part.0>:
void warpmode(int on) 
 5fc:	598f           	subq.l #4,sp
 5fe:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 600:	4aaf 000c      	tst.l 12(sp)
 604:	674c           	beq.s 652 <warpmode.part.0+0x56>
 606:	4878 0001      	pea 1 <_start+0x1>
 60a:	740b           	moveq #11,d2
 60c:	d48f           	add.l sp,d2
 60e:	2f02           	move.l d2,-(sp)
 610:	42a7           	clr.l -(sp)
 612:	4879 0000 0b90 	pea b90 <incbin_colors_end+0x34>
 618:	4878 ffff      	pea ffffffff <_end+0xffff093b>
 61c:	4878 0052      	pea 52 <main+0x4c>
 620:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xf0089c>
 626:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 62a:	203c 0000 0b76 	move.l #2934,d0
 630:	4878 0001      	pea 1 <_start+0x1>
 634:	2f02           	move.l d2,-(sp)
 636:	42a7           	clr.l -(sp)
 638:	2f00           	move.l d0,-(sp)
 63a:	4878 ffff      	pea ffffffff <_end+0xffff093b>
 63e:	4878 0052      	pea 52 <main+0x4c>
 642:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xf0089c>
	}
}
 648:	4fef 0018      	lea 24(sp),sp
 64c:	241f           	move.l (sp)+,d2
 64e:	588f           	addq.l #4,sp
 650:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 652:	4878 0001      	pea 1 <_start+0x1>
 656:	740b           	moveq #11,d2
 658:	d48f           	add.l sp,d2
 65a:	2f02           	move.l d2,-(sp)
 65c:	42a7           	clr.l -(sp)
 65e:	4879 0000 0b9a 	pea b9a <incbin_colors_end+0x3e>
 664:	4878 ffff      	pea ffffffff <_end+0xffff093b>
 668:	4878 0052      	pea 52 <main+0x4c>
 66c:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xf0089c>
 672:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 676:	203c 0000 0b5d 	move.l #2909,d0
 67c:	4878 0001      	pea 1 <_start+0x1>
 680:	2f02           	move.l d2,-(sp)
 682:	42a7           	clr.l -(sp)
 684:	2f00           	move.l d0,-(sp)
 686:	4878 ffff      	pea ffffffff <_end+0xffff093b>
 68a:	4878 0052      	pea 52 <main+0x4c>
 68e:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xf0089c>
}
 694:	4fef 0018      	lea 24(sp),sp
 698:	241f           	move.l (sp)+,d2
 69a:	588f           	addq.l #4,sp
 69c:	4e75           	rts

0000069e <KPrintF>:
{
 69e:	4fef ff80      	lea -128(sp),sp
 6a2:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 6a6:	4ab9 00f0 ff60 	tst.l f0ff60 <_end+0xf0089c>
 6ac:	6734           	beq.s 6e2 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 6ae:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 6b4:	206f 0090      	movea.l 144(sp),a0
 6b8:	43ef 0094      	lea 148(sp),a1
 6bc:	45f9 0000 0ad8 	lea ad8 <PutChar>,a2
 6c2:	47ef 000c      	lea 12(sp),a3
 6c6:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 6ca:	2f0b           	move.l a3,-(sp)
 6cc:	4878 0056      	pea 56 <main+0x50>
 6d0:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xf0089c>
 6d6:	508f           	addq.l #8,sp
}
 6d8:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 6dc:	4fef 0080      	lea 128(sp),sp
 6e0:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 6e2:	2c79 0000 f6be 	movea.l f6be <SysBase>,a6
 6e8:	206f 0090      	movea.l 144(sp),a0
 6ec:	43ef 0094      	lea 148(sp),a1
 6f0:	45f9 0000 0aca 	lea aca <KPutCharX>,a2
 6f6:	97cb           	suba.l a3,a3
 6f8:	4eae fdf6      	jsr -522(a6)
}
 6fc:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 700:	4fef 0080      	lea 128(sp),sp
 704:	4e75           	rts

00000706 <ClBuild>:
void ClBuild(  ULONG *cl) {
 706:	206f 0004      	movea.l 4(sp),a0
    *cl++ = *clpartinstruction++;
 70a:	20b9 0000 2d40 	move.l 2d40 <ClsSprites>,(a0)
 710:	2179 0000 2d44 	move.l 2d44 <ClsSprites+0x4>,4(a0)
 716:	0004 
 718:	2179 0000 2d48 	move.l 2d48 <ClsSprites+0x8>,8(a0)
 71e:	0008 
 720:	2179 0000 2d4c 	move.l 2d4c <ClsSprites+0xc>,12(a0)
 726:	000c 
 728:	2179 0000 2d50 	move.l 2d50 <ClsSprites+0x10>,16(a0)
 72e:	0010 
 730:	2179 0000 2d54 	move.l 2d54 <ClsSprites+0x14>,20(a0)
 736:	0014 
 738:	2179 0000 2d58 	move.l 2d58 <ClsSprites+0x18>,24(a0)
 73e:	0018 
 740:	2179 0000 2d5c 	move.l 2d5c <ClsSprites+0x1c>,28(a0)
 746:	001c 
 748:	2179 0000 2d60 	move.l 2d60 <ClsSprites+0x20>,32(a0)
 74e:	0020 
 750:	2179 0000 2d64 	move.l 2d64 <ClsSprites+0x24>,36(a0)
 756:	0024 
 758:	2179 0000 2d68 	move.l 2d68 <ClsSprites+0x28>,40(a0)
 75e:	0028 
 760:	2179 0000 2d6c 	move.l 2d6c <ClsSprites+0x2c>,44(a0)
 766:	002c 
 768:	2179 0000 2d70 	move.l 2d70 <ClsSprites+0x30>,48(a0)
 76e:	0030 
 770:	2179 0000 2d74 	move.l 2d74 <ClsSprites+0x34>,52(a0)
 776:	0034 
 778:	2179 0000 2d78 	move.l 2d78 <ClsSprites+0x38>,56(a0)
 77e:	0038 
 780:	2179 0000 2d7c 	move.l 2d7c <ClsSprites+0x3c>,60(a0)
 786:	003c 
    *cl++ = *clpartinstruction++;
 788:	2179 0000 2d10 	move.l 2d10 <ClScreen>,64(a0)
 78e:	0040 
 790:	2179 0000 2d14 	move.l 2d14 <ClScreen+0x4>,68(a0)
 796:	0044 
 798:	2179 0000 2d18 	move.l 2d18 <ClScreen+0x8>,72(a0)
 79e:	0048 
 7a0:	2179 0000 2d1c 	move.l 2d1c <ClScreen+0xc>,76(a0)
 7a6:	004c 
 7a8:	2179 0000 2d20 	move.l 2d20 <ClScreen+0x10>,80(a0)
 7ae:	0050 
 7b0:	2179 0000 2d24 	move.l 2d24 <ClScreen+0x14>,84(a0)
 7b6:	0054 
 7b8:	2179 0000 2d28 	move.l 2d28 <ClScreen+0x18>,88(a0)
 7be:	0058 
 7c0:	2179 0000 2d2c 	move.l 2d2c <ClScreen+0x1c>,92(a0)
 7c6:	005c 
 7c8:	2179 0000 2d30 	move.l 2d30 <ClScreen+0x20>,96(a0)
 7ce:	0060 
 7d0:	2179 0000 2d34 	move.l 2d34 <ClScreen+0x24>,100(a0)
 7d6:	0064 
 7d8:	2179 0000 2d38 	move.l 2d38 <ClScreen+0x28>,104(a0)
 7de:	0068 
 7e0:	2179 0000 2d3c 	move.l 2d3c <ClScreen+0x2c>,108(a0)
 7e6:	006c 
  CopBpl1High = (long) cl + 2;
 7e8:	43e8 0072      	lea 114(a0),a1
 7ec:	23c9 0000 2d90 	move.l a1,2d90 <CopBpl1High>
  *cl++ = 0x00e00000;
 7f2:	217c 00e0 0000 	move.l #14680064,112(a0)
 7f8:	0070 
  CopBpl1Low = (long) cl + 2;
 7fa:	43e8 0076      	lea 118(a0),a1
 7fe:	23c9 0000 2d94 	move.l a1,2d94 <CopBpl1Low>
  *cl++ = 0x00e20000;
 804:	217c 00e2 0000 	move.l #14811136,116(a0)
 80a:	0074 
  *cl = 0xfffffffe;
 80c:	70fe           	moveq #-2,d0
 80e:	2140 0078      	move.l d0,120(a0)
}
 812:	4e75           	rts

00000814 <WaitVbl>:
void WaitVbl() {
 814:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 816:	2039 00df f004 	move.l dff004 <_end+0xdef940>,d0
 81c:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 81e:	2017           	move.l (sp),d0
 820:	0280 0001 ff00 	andi.l #130816,d0
 826:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 828:	2017           	move.l (sp),d0
 82a:	0c80 0001 3700 	cmpi.l #79616,d0
 830:	67e4           	beq.s 816 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 832:	2039 00df f004 	move.l dff004 <_end+0xdef940>,d0
 838:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 83c:	202f 0004      	move.l 4(sp),d0
 840:	0280 0001 ff00 	andi.l #130816,d0
 846:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 84a:	202f 0004      	move.l 4(sp),d0
 84e:	0c80 0001 3700 	cmpi.l #79616,d0
 854:	66dc           	bne.s 832 <WaitVbl+0x1e>
}
 856:	508f           	addq.l #8,sp
 858:	4e75           	rts

0000085a <memcpy>:
{
 85a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 85e:	202f 0014      	move.l 20(sp),d0
 862:	226f 0018      	movea.l 24(sp),a1
 866:	222f 001c      	move.l 28(sp),d1
	while(len--)
 86a:	2601           	move.l d1,d3
 86c:	5383           	subq.l #1,d3
 86e:	4a81           	tst.l d1
 870:	6762           	beq.s 8d4 <memcpy+0x7a>
 872:	2040           	movea.l d0,a0
 874:	5888           	addq.l #4,a0
 876:	b1c9           	cmpa.l a1,a0
 878:	53c2           	sl.s d2
 87a:	4402           	neg.b d2
 87c:	41e9 0004      	lea 4(a1),a0
 880:	b1c0           	cmpa.l d0,a0
 882:	53c4           	sl.s d4
 884:	4404           	neg.b d4
 886:	8404           	or.b d4,d2
 888:	7808           	moveq #8,d4
 88a:	b883           	cmp.l d3,d4
 88c:	55c4           	sc.s d4
 88e:	4404           	neg.b d4
 890:	c404           	and.b d4,d2
 892:	6746           	beq.s 8da <memcpy+0x80>
 894:	2409           	move.l a1,d2
 896:	8480           	or.l d0,d2
 898:	7803           	moveq #3,d4
 89a:	c484           	and.l d4,d2
 89c:	663c           	bne.s 8da <memcpy+0x80>
 89e:	2049           	movea.l a1,a0
 8a0:	2440           	movea.l d0,a2
 8a2:	74fc           	moveq #-4,d2
 8a4:	c481           	and.l d1,d2
 8a6:	d489           	add.l a1,d2
		*d++ = *s++;
 8a8:	24d8           	move.l (a0)+,(a2)+
 8aa:	b488           	cmp.l a0,d2
 8ac:	66fa           	bne.s 8a8 <memcpy+0x4e>
 8ae:	74fc           	moveq #-4,d2
 8b0:	c481           	and.l d1,d2
 8b2:	2040           	movea.l d0,a0
 8b4:	d1c2           	adda.l d2,a0
 8b6:	d3c2           	adda.l d2,a1
 8b8:	9682           	sub.l d2,d3
 8ba:	b481           	cmp.l d1,d2
 8bc:	6716           	beq.s 8d4 <memcpy+0x7a>
 8be:	1091           	move.b (a1),(a0)
	while(len--)
 8c0:	4a83           	tst.l d3
 8c2:	6710           	beq.s 8d4 <memcpy+0x7a>
		*d++ = *s++;
 8c4:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 8ca:	5383           	subq.l #1,d3
 8cc:	6706           	beq.s 8d4 <memcpy+0x7a>
		*d++ = *s++;
 8ce:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 8d4:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 8d8:	4e75           	rts
 8da:	2040           	movea.l d0,a0
 8dc:	d289           	add.l a1,d1
		*d++ = *s++;
 8de:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 8e0:	b289           	cmp.l a1,d1
 8e2:	67f0           	beq.s 8d4 <memcpy+0x7a>
		*d++ = *s++;
 8e4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 8e6:	b289           	cmp.l a1,d1
 8e8:	66f4           	bne.s 8de <memcpy+0x84>
 8ea:	60e8           	bra.s 8d4 <memcpy+0x7a>

000008ec <memset>:
{
 8ec:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 8f0:	202f 0024      	move.l 36(sp),d0
 8f4:	2a2f 0028      	move.l 40(sp),d5
 8f8:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 8fc:	2809           	move.l a1,d4
 8fe:	5384           	subq.l #1,d4
 900:	b2fc 0000      	cmpa.w #0,a1
 904:	6f00 00b0      	ble.w 9b6 <memset+0xca>
 908:	1e05           	move.b d5,d7
 90a:	2200           	move.l d0,d1
 90c:	4481           	neg.l d1
 90e:	7403           	moveq #3,d2
 910:	c282           	and.l d2,d1
 912:	7c05           	moveq #5,d6
		*ptr++ = val;
 914:	2440           	movea.l d0,a2
 916:	bc84           	cmp.l d4,d6
 918:	646a           	bcc.s 984 <memset+0x98>
 91a:	4a81           	tst.l d1
 91c:	6724           	beq.s 942 <memset+0x56>
 91e:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 920:	5384           	subq.l #1,d4
 922:	7401           	moveq #1,d2
 924:	b481           	cmp.l d1,d2
 926:	671a           	beq.s 942 <memset+0x56>
		*ptr++ = val;
 928:	2440           	movea.l d0,a2
 92a:	548a           	addq.l #2,a2
 92c:	2040           	movea.l d0,a0
 92e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 932:	5384           	subq.l #1,d4
 934:	7403           	moveq #3,d2
 936:	b481           	cmp.l d1,d2
 938:	6608           	bne.s 942 <memset+0x56>
		*ptr++ = val;
 93a:	528a           	addq.l #1,a2
 93c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 940:	5384           	subq.l #1,d4
 942:	2609           	move.l a1,d3
 944:	9681           	sub.l d1,d3
 946:	7c00           	moveq #0,d6
 948:	1c05           	move.b d5,d6
 94a:	2406           	move.l d6,d2
 94c:	4842           	swap d2
 94e:	4242           	clr.w d2
 950:	2042           	movea.l d2,a0
 952:	2406           	move.l d6,d2
 954:	e14a           	lsl.w #8,d2
 956:	4842           	swap d2
 958:	4242           	clr.w d2
 95a:	e18e           	lsl.l #8,d6
 95c:	2646           	movea.l d6,a3
 95e:	2c08           	move.l a0,d6
 960:	8486           	or.l d6,d2
 962:	2c0b           	move.l a3,d6
 964:	8486           	or.l d6,d2
 966:	1407           	move.b d7,d2
 968:	2040           	movea.l d0,a0
 96a:	d1c1           	adda.l d1,a0
 96c:	72fc           	moveq #-4,d1
 96e:	c283           	and.l d3,d1
 970:	d288           	add.l a0,d1
		*ptr++ = val;
 972:	20c2           	move.l d2,(a0)+
 974:	b1c1           	cmpa.l d1,a0
 976:	66fa           	bne.s 972 <memset+0x86>
 978:	72fc           	moveq #-4,d1
 97a:	c283           	and.l d3,d1
 97c:	d5c1           	adda.l d1,a2
 97e:	9881           	sub.l d1,d4
 980:	b283           	cmp.l d3,d1
 982:	6732           	beq.s 9b6 <memset+0xca>
 984:	1485           	move.b d5,(a2)
	while(len-- > 0)
 986:	4a84           	tst.l d4
 988:	6f2c           	ble.s 9b6 <memset+0xca>
		*ptr++ = val;
 98a:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 98e:	7201           	moveq #1,d1
 990:	b284           	cmp.l d4,d1
 992:	6c22           	bge.s 9b6 <memset+0xca>
		*ptr++ = val;
 994:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 998:	7402           	moveq #2,d2
 99a:	b484           	cmp.l d4,d2
 99c:	6c18           	bge.s 9b6 <memset+0xca>
		*ptr++ = val;
 99e:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 9a2:	7c03           	moveq #3,d6
 9a4:	bc84           	cmp.l d4,d6
 9a6:	6c0e           	bge.s 9b6 <memset+0xca>
		*ptr++ = val;
 9a8:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 9ac:	7204           	moveq #4,d1
 9ae:	b284           	cmp.l d4,d1
 9b0:	6c04           	bge.s 9b6 <memset+0xca>
		*ptr++ = val;
 9b2:	1545 0005      	move.b d5,5(a2)
}
 9b6:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 9ba:	4e75           	rts

000009bc <strlen>:
{
 9bc:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 9c0:	7000           	moveq #0,d0
	while(*s++)
 9c2:	4a10           	tst.b (a0)
 9c4:	6708           	beq.s 9ce <strlen+0x12>
		t++;
 9c6:	5280           	addq.l #1,d0
	while(*s++)
 9c8:	4a30 0800      	tst.b (0,a0,d0.l)
 9cc:	66f8           	bne.s 9c6 <strlen+0xa>
}
 9ce:	4e75           	rts

000009d0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 9d0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 9d4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 9d8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 9dc:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 9e0:	d041           	add.w d1,d0
	swap	d0
 9e2:	4840           	swap d0
	clrw	d0
 9e4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 9e6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 9ea:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 9ee:	d081           	add.l d1,d0

	rts
 9f0:	4e75           	rts

000009f2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 9f2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 9f4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 9f8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 9fc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 a02:	6416           	bcc.s a1a <__udivsi3+0x28>
	movel	d0, d2
 a04:	2400           	move.l d0,d2
	clrw	d2
 a06:	4242           	clr.w d2
	swap	d2
 a08:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 a0a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 a0c:	3002           	move.w d2,d0
	swap	d0
 a0e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 a10:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 a14:	84c1           	divu.w d1,d2
	movew	d2, d0
 a16:	3002           	move.w d2,d0
	jra	6f
 a18:	6030           	bra.s a4a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 a1a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 a1c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 a1e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 a20:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 a26:	64f4           	bcc.s a1c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 a28:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 a2a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 a30:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 a32:	c2c0           	mulu.w d0,d1
	swap	d2
 a34:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 a36:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 a38:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 a3a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 a3c:	660a           	bne.s a48 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 a3e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 a40:	6506           	bcs.s a48 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 a42:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 a46:	6302           	bls.s a4a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 a48:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 a4a:	241f           	move.l (sp)+,d2
	rts
 a4c:	4e75           	rts

00000a4e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 a4e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 a50:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 a52:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 a56:	6a04           	bpl.s a5c <__divsi3+0xe>
	negl	d1
 a58:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 a5a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 a5c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 a60:	6a04           	bpl.s a66 <__divsi3+0x18>
	negl	d0
 a62:	4480           	neg.l d0
	negb	d2
 a64:	4402           	neg.b d2

2:	movel	d1, sp@-
 a66:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a68:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 a6a:	6186           	bsr.s 9f2 <__udivsi3>
	addql	IMM (8), sp
 a6c:	508f           	addq.l #8,sp

	tstb	d2
 a6e:	4a02           	tst.b d2
	jpl	3f
 a70:	6a02           	bpl.s a74 <__divsi3+0x26>
	negl	d0
 a72:	4480           	neg.l d0

3:	movel	sp@+, d2
 a74:	241f           	move.l (sp)+,d2
	rts
 a76:	4e75           	rts

00000a78 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 a78:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 a7c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 a80:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a82:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 a84:	61c8           	bsr.s a4e <__divsi3>
	addql	IMM (8), sp
 a86:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 a88:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 a8c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a8e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 a90:	6100 ff3e      	bsr.w 9d0 <__mulsi3>
	addql	IMM (8), sp
 a94:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 a96:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 a9a:	9280           	sub.l d0,d1
	movel	d1, d0
 a9c:	2001           	move.l d1,d0
	rts
 a9e:	4e75           	rts

00000aa0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 aa0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 aa4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 aa8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 aaa:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 aac:	6100 ff44      	bsr.w 9f2 <__udivsi3>
	addql	IMM (8), sp
 ab0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 ab2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 ab6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 ab8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 aba:	6100 ff14      	bsr.w 9d0 <__mulsi3>
	addql	IMM (8), sp
 abe:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 ac0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 ac4:	9280           	sub.l d0,d1
	movel	d1, d0
 ac6:	2001           	move.l d1,d0
	rts
 ac8:	4e75           	rts

00000aca <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 aca:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 acc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 ad0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 ad4:	2c5f           	movea.l (sp)+,a6
    rts
 ad6:	4e75           	rts

00000ad8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 ad8:	16c0           	move.b d0,(a3)+
	rts
 ada:	4e75           	rts
