
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
  10:	23ce 0000 2c1a 	move.l a6,2c1a <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,2c16 <hw>
  1c:	0000 2c16 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0a2d 	lea a2d <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 2c12 	move.l d0,2c12 <GfxBase>
	if (!GfxBase)
  32:	6700 0506      	beq.w 53a <main+0x534>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
  3c:	43f9 0000 0a3e 	lea a3e <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 2c0e 	move.l d0,2c0e <DOSBase>
	if (!DOSBase)
  4e:	6700 04de      	beq.w 52e <main+0x528>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0a4a 	pea a4a <incbin_colors_end+0x66>
  58:	4eb9 0000 0632 	jsr 632 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0a66 	move.l #2662,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
#include "runtests.h"
#include "coppertests.h"

void RunTests() {
    TestCopperList();
  7c:	47f9 0000 2b38 	lea 2b38 <clsprites>,a3
  82:	4df9 0000 2b88 	lea 2b88 <copperlist>,a6
  88:	4878 0040      	pea 40 <main+0x3a>
  8c:	2f0b           	move.l a3,-(sp)
  8e:	2f0e           	move.l a6,-(sp)
  90:	4eb9 0000 06e0 	jsr 6e0 <memcpy>
  96:	45f9 0000 2b08 	lea 2b08 <clscreen>,a2
  9c:	23d2 0000 2bc8 	move.l (a2),2bc8 <copperlist+0x40>
  a2:	23f9 0000 2b0c 	move.l 2b0c <clscreen+0x4>,2bcc <copperlist+0x44>
  a8:	0000 2bcc 
  ac:	23f9 0000 2b10 	move.l 2b10 <clscreen+0x8>,2bd0 <copperlist+0x48>
  b2:	0000 2bd0 
  b6:	23f9 0000 2b14 	move.l 2b14 <clscreen+0xc>,2bd4 <copperlist+0x4c>
  bc:	0000 2bd4 
  c0:	23f9 0000 2b18 	move.l 2b18 <clscreen+0x10>,2bd8 <copperlist+0x50>
  c6:	0000 2bd8 
  ca:	23f9 0000 2b1c 	move.l 2b1c <clscreen+0x14>,2bdc <copperlist+0x54>
  d0:	0000 2bdc 
  d4:	23f9 0000 2b20 	move.l 2b20 <clscreen+0x18>,2be0 <copperlist+0x58>
  da:	0000 2be0 
  de:	23f9 0000 2b24 	move.l 2b24 <clscreen+0x1c>,2be4 <copperlist+0x5c>
  e4:	0000 2be4 
  e8:	23f9 0000 2b28 	move.l 2b28 <clscreen+0x20>,2be8 <copperlist+0x60>
  ee:	0000 2be8 
  f2:	23f9 0000 2b2c 	move.l 2b2c <clscreen+0x24>,2bec <copperlist+0x64>
  f8:	0000 2bec 
  fc:	23f9 0000 2b30 	move.l 2b30 <clscreen+0x28>,2bf0 <copperlist+0x68>
 102:	0000 2bf0 
 106:	23f9 0000 2b34 	move.l 2b34 <clscreen+0x2c>,2bf4 <copperlist+0x6c>
 10c:	0000 2bf4 
  for(int i=0; i<16;i++)
    *clinstruction++ = *clpartinstruction++;
  clpartinstruction = clscreen;
  for(int i=0; i<12;i++)
    *clinstruction++ = *clpartinstruction++;
  *clinstruction = 0xfffffffe;
 110:	70fe           	moveq #-2,d0
 112:	23c0 0000 2bf8 	move.l d0,2bf8 <copperlist+0x70>

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                 long length) {
  for( int i=0;i<length;i++)
    if( instructions[ pos+i] != batch[ i])
 118:	4fef 0010      	lea 16(sp),sp
 11c:	2c56           	movea.l (a6),a6
 11e:	bdd3           	cmpa.l (a3),a6
 120:	6600 03c8      	bne.w 4ea <main+0x4e4>
 124:	2239 0000 2b8c 	move.l 2b8c <copperlist+0x4>,d1
 12a:	b2b9 0000 2b3c 	cmp.l 2b3c <clsprites+0x4>,d1
 130:	6600 03b8      	bne.w 4ea <main+0x4e4>
 134:	2039 0000 2b90 	move.l 2b90 <copperlist+0x8>,d0
 13a:	b0b9 0000 2b40 	cmp.l 2b40 <clsprites+0x8>,d0
 140:	6600 03a8      	bne.w 4ea <main+0x4e4>
 144:	2239 0000 2b94 	move.l 2b94 <copperlist+0xc>,d1
 14a:	b2b9 0000 2b44 	cmp.l 2b44 <clsprites+0xc>,d1
 150:	6600 0398      	bne.w 4ea <main+0x4e4>
 154:	2039 0000 2b98 	move.l 2b98 <copperlist+0x10>,d0
 15a:	b0b9 0000 2b48 	cmp.l 2b48 <clsprites+0x10>,d0
 160:	6600 0388      	bne.w 4ea <main+0x4e4>
 164:	2239 0000 2b9c 	move.l 2b9c <copperlist+0x14>,d1
 16a:	b2b9 0000 2b4c 	cmp.l 2b4c <clsprites+0x14>,d1
 170:	6600 0378      	bne.w 4ea <main+0x4e4>
 174:	2039 0000 2ba0 	move.l 2ba0 <copperlist+0x18>,d0
 17a:	b0b9 0000 2b50 	cmp.l 2b50 <clsprites+0x18>,d0
 180:	6600 0368      	bne.w 4ea <main+0x4e4>
 184:	2239 0000 2ba4 	move.l 2ba4 <copperlist+0x1c>,d1
 18a:	b2b9 0000 2b54 	cmp.l 2b54 <clsprites+0x1c>,d1
 190:	6600 0358      	bne.w 4ea <main+0x4e4>
 194:	2039 0000 2ba8 	move.l 2ba8 <copperlist+0x20>,d0
 19a:	b0b9 0000 2b58 	cmp.l 2b58 <clsprites+0x20>,d0
 1a0:	6600 0348      	bne.w 4ea <main+0x4e4>
 1a4:	2239 0000 2bac 	move.l 2bac <copperlist+0x24>,d1
 1aa:	b2b9 0000 2b5c 	cmp.l 2b5c <clsprites+0x24>,d1
 1b0:	6600 0338      	bne.w 4ea <main+0x4e4>
 1b4:	2039 0000 2bb0 	move.l 2bb0 <copperlist+0x28>,d0
 1ba:	b0b9 0000 2b60 	cmp.l 2b60 <clsprites+0x28>,d0
 1c0:	6600 0328      	bne.w 4ea <main+0x4e4>
 1c4:	2239 0000 2bb4 	move.l 2bb4 <copperlist+0x2c>,d1
 1ca:	b2b9 0000 2b64 	cmp.l 2b64 <clsprites+0x2c>,d1
 1d0:	6600 0318      	bne.w 4ea <main+0x4e4>
 1d4:	2039 0000 2bb8 	move.l 2bb8 <copperlist+0x30>,d0
 1da:	b0b9 0000 2b68 	cmp.l 2b68 <clsprites+0x30>,d0
 1e0:	6600 0308      	bne.w 4ea <main+0x4e4>
 1e4:	2239 0000 2bbc 	move.l 2bbc <copperlist+0x34>,d1
 1ea:	b2b9 0000 2b6c 	cmp.l 2b6c <clsprites+0x34>,d1
 1f0:	6600 02f8      	bne.w 4ea <main+0x4e4>
 1f4:	2039 0000 2bc0 	move.l 2bc0 <copperlist+0x38>,d0
 1fa:	b0b9 0000 2b70 	cmp.l 2b70 <clsprites+0x38>,d0
 200:	6600 02e8      	bne.w 4ea <main+0x4e4>
 204:	2239 0000 2bc4 	move.l 2bc4 <copperlist+0x3c>,d1
 20a:	b2b9 0000 2b74 	cmp.l 2b74 <clsprites+0x3c>,d1
 210:	6600 02d8      	bne.w 4ea <main+0x4e4>
 214:	2039 0000 2bc8 	move.l 2bc8 <copperlist+0x40>,d0
 21a:	b092           	cmp.l (a2),d0
 21c:	6600 02ee      	bne.w 50c <main+0x506>
 220:	2239 0000 2bcc 	move.l 2bcc <copperlist+0x44>,d1
 226:	b2b9 0000 2b0c 	cmp.l 2b0c <clscreen+0x4>,d1
 22c:	6600 02de      	bne.w 50c <main+0x506>
 230:	2039 0000 2b10 	move.l 2b10 <clscreen+0x8>,d0
 236:	b0b9 0000 2bd0 	cmp.l 2bd0 <copperlist+0x48>,d0
 23c:	6600 02ce      	bne.w 50c <main+0x506>
 240:	2239 0000 2bd4 	move.l 2bd4 <copperlist+0x4c>,d1
 246:	b2b9 0000 2b14 	cmp.l 2b14 <clscreen+0xc>,d1
 24c:	6600 02be      	bne.w 50c <main+0x506>
 250:	2039 0000 2bd8 	move.l 2bd8 <copperlist+0x50>,d0
 256:	b0b9 0000 2b18 	cmp.l 2b18 <clscreen+0x10>,d0
 25c:	6600 02ae      	bne.w 50c <main+0x506>
 260:	2239 0000 2bdc 	move.l 2bdc <copperlist+0x54>,d1
 266:	b2b9 0000 2b1c 	cmp.l 2b1c <clscreen+0x14>,d1
 26c:	6600 029e      	bne.w 50c <main+0x506>
 270:	2039 0000 2be0 	move.l 2be0 <copperlist+0x58>,d0
 276:	b0b9 0000 2b20 	cmp.l 2b20 <clscreen+0x18>,d0
 27c:	6600 028e      	bne.w 50c <main+0x506>
 280:	2239 0000 2be4 	move.l 2be4 <copperlist+0x5c>,d1
 286:	b2b9 0000 2b24 	cmp.l 2b24 <clscreen+0x1c>,d1
 28c:	6600 027e      	bne.w 50c <main+0x506>
 290:	2039 0000 2be8 	move.l 2be8 <copperlist+0x60>,d0
 296:	b0b9 0000 2b28 	cmp.l 2b28 <clscreen+0x20>,d0
 29c:	6600 026e      	bne.w 50c <main+0x506>
 2a0:	2239 0000 2bec 	move.l 2bec <copperlist+0x64>,d1
 2a6:	b2b9 0000 2b2c 	cmp.l 2b2c <clscreen+0x24>,d1
 2ac:	6600 025e      	bne.w 50c <main+0x506>
 2b0:	2039 0000 2bf0 	move.l 2bf0 <copperlist+0x68>,d0
 2b6:	b0b9 0000 2b30 	cmp.l 2b30 <clscreen+0x28>,d0
 2bc:	6600 024e      	bne.w 50c <main+0x506>
 2c0:	2239 0000 2bf4 	move.l 2bf4 <copperlist+0x6c>,d1
 2c6:	b2b9 0000 2b34 	cmp.l 2b34 <clscreen+0x2c>,d1
 2cc:	6600 023e      	bne.w 50c <main+0x506>
  return 1;
}

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
 2d0:	70fe           	moveq #-2,d0
 2d2:	b0b9 0000 2bf8 	cmp.l 2bf8 <copperlist+0x70>,d0
 2d8:	671e           	beq.s 2f8 <main+0x2f2>
                                                                           44);
  if(  TestCopperlistBatch(  copperlist, 16, clscreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                           54);
  if( TestCopperlistPos( copperlist, 28, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 2da:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 2e0:	4eae ffc4      	jsr -60(a6)
 2e4:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 2ea:	2200           	move.l d0,d1
 2ec:	243c 0000 0a76 	move.l #2678,d2
 2f2:	761f           	moveq #31,d3
 2f4:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 2f8:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 2fe:	7232           	moveq #50,d1
 300:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 304:	247c 00f0 ff60 	movea.l #15794016,a2
 30a:	4a92           	tst.l (a2)
 30c:	6718           	beq.s 326 <main+0x320>
 30e:	4878 0001      	pea 1 <_start+0x1>
 312:	47f9 0000 0590 	lea 590 <warpmode.part.0>,a3
 318:	4e93           	jsr (a3)
 31a:	588f           	addq.l #4,sp
 31c:	4a92           	tst.l (a2)
 31e:	6706           	beq.s 326 <main+0x320>
 320:	42a7           	clr.l -(sp)
 322:	4e93           	jsr (a3)
 324:	588f           	addq.l #4,sp
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
}

void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 326:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 32c:	23ee 0022 0000 	move.l 34(a6),2bfc <ActiView>
 332:	2bfc 
	OwnBlitter();
 334:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 338:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 33e:	4eae ff1c      	jsr -228(a6)
	Disable();
 342:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 348:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 34c:	2479 0000 2c16 	movea.l 2c16 <hw>,a2
 352:	302a 0010      	move.w 16(a2),d0
 356:	33c0 0000 2c00 	move.w d0,2c00 <SystemADKCON>
	SystemInts=hw->intenar;
 35c:	302a 001c      	move.w 28(a2),d0
 360:	33c0 0000 2c04 	move.w d0,2c04 <SystemInts>
	SystemDMA=hw->dmaconr;
 366:	302a 0002      	move.w 2(a2),d0
 36a:	33c0 0000 2c02 	move.w d0,2c02 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 370:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 376:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 37c:	47f9 0000 069a 	lea 69a <WaitVbl>,a3
 382:	4e93           	jsr (a3)
	WaitVbl();
 384:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 386:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 38c:	7000           	moveq #0,d0
		hw->color[a]=0;
 38e:	2200           	move.l d0,d1
 390:	0681 0000 00c0 	addi.l #192,d1
 396:	d281           	add.l d1,d1
 398:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 39e:	5280           	addq.l #1,d0
 3a0:	7220           	moveq #32,d1
 3a2:	b280           	cmp.l d0,d1
 3a4:	66e8           	bne.s 38e <main+0x388>

	LoadView(0);
 3a6:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 3ac:	93c9           	suba.l a1,a1
 3ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 3b2:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 3b8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 3bc:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 3c2:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 3c6:	4e93           	jsr (a3)
	WaitVbl();
 3c8:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 3ca:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 3d0:	3f7c 0801 001c 	move.w #2049,28(sp)
 3d6:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 3dc:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 3e2:	082e 0000 0129 	btst #0,297(a6)
 3e8:	6700 017a      	beq.w 564 <main+0x55e>
		vbr = (APTR)Supervisor((void*)getvbr);
 3ec:	7e1a           	moveq #26,d7
 3ee:	de8f           	add.l sp,d7
 3f0:	cf8d           	exg d7,a5
 3f2:	4eae ffe2      	jsr -30(a6)
 3f6:	cf8d           	exg d7,a5

	VBR=GetVBR();
 3f8:	23c0 0000 2c06 	move.l d0,2c06 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 3fe:	2079 0000 2c06 	movea.l 2c06 <VBR.lto_priv.0>,a0
 404:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 408:	23ca 0000 2c0a 	move.l a2,2c0a <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 40e:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 410:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 412:	2079 0000 2c16 	movea.l 2c16 <hw>,a0
 418:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 41c:	3028 0002      	move.w 2(a0),d0
 420:	0800 000e      	btst #14,d0
 424:	66f6           	bne.s 41c <main+0x416>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 426:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 42c:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 432:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 438:	2279 0000 2c06 	movea.l 2c06 <VBR.lto_priv.0>,a1
 43e:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 442:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 448:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 44e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 454:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 45a:	3039 0000 2c04 	move.w 2c04 <SystemInts>,d0
 460:	0040 8000      	ori.w #-32768,d0
 464:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 468:	3039 0000 2c02 	move.w 2c02 <SystemDMA>,d0
 46e:	0040 8000      	ori.w #-32768,d0
 472:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 476:	3039 0000 2c00 	move.w 2c00 <SystemADKCON>,d0
 47c:	0040 8000      	ori.w #-32768,d0
 480:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 484:	2279 0000 2bfc 	movea.l 2bfc <ActiView>,a1
 48a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 48e:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 494:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 498:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 49e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 4a2:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 4a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 4ac:	2c79 0000 2c12 	movea.l 2c12 <GfxBase>,a6
 4b2:	4eae fe32      	jsr -462(a6)
	Enable();
 4b6:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 4bc:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 4c0:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 4c6:	2279 0000 2c0e 	movea.l 2c0e <DOSBase>,a1
 4cc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 4d0:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 4d6:	2279 0000 2c12 	movea.l 2c12 <GfxBase>,a1
 4dc:	4eae fe62      	jsr -414(a6)
}
 4e0:	7000           	moveq #0,d0
 4e2:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 4e6:	508f           	addq.l #8,sp
 4e8:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 4ea:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 4f0:	4eae ffc4      	jsr -60(a6)
 4f4:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 4fa:	2200           	move.l d0,d1
 4fc:	243c 0000 0acf 	move.l #2767,d2
 502:	762c           	moveq #44,d3
 504:	4eae ffd0      	jsr -48(a6)
 508:	6000 fd0a      	bra.w 214 <main+0x20e>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 50c:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 512:	4eae ffc4      	jsr -60(a6)
 516:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 51c:	2200           	move.l d0,d1
 51e:	243c 0000 0a98 	move.l #2712,d2
 524:	7636           	moveq #54,d3
 526:	4eae ffd0      	jsr -48(a6)
 52a:	6000 fda4      	bra.w 2d0 <main+0x2ca>
		Exit(0);
 52e:	9dce           	suba.l a6,a6
 530:	7200           	moveq #0,d1
 532:	4eae ff70      	jsr -144(a6)
 536:	6000 fb1a      	bra.w 52 <main+0x4c>
		Exit(0);
 53a:	2c79 0000 2c0e 	movea.l 2c0e <DOSBase>,a6
 540:	7200           	moveq #0,d1
 542:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 546:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 54c:	43f9 0000 0a3e 	lea a3e <incbin_colors_end+0x5a>,a1
 552:	7000           	moveq #0,d0
 554:	4eae fdd8      	jsr -552(a6)
 558:	23c0 0000 2c0e 	move.l d0,2c0e <DOSBase>
	if (!DOSBase)
 55e:	6600 faf2      	bne.w 52 <main+0x4c>
 562:	60ca           	bra.s 52e <main+0x528>
	APTR vbr = 0;
 564:	7000           	moveq #0,d0
	VBR=GetVBR();
 566:	23c0 0000 2c06 	move.l d0,2c06 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 56c:	2079 0000 2c06 	movea.l 2c06 <VBR.lto_priv.0>,a0
 572:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 576:	23ca 0000 2c0a 	move.l a2,2c0a <SystemIrq>
	WaitVbl();
 57c:	4e93           	jsr (a3)
	WaitVbl();
 57e:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 580:	2079 0000 2c16 	movea.l 2c16 <hw>,a0
 586:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 58a:	6000 fe90      	bra.w 41c <main+0x416>
 58e:	4e71           	nop

00000590 <warpmode.part.0>:
void warpmode(int on) 
 590:	598f           	subq.l #4,sp
 592:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 594:	4aaf 000c      	tst.l 12(sp)
 598:	674c           	beq.s 5e6 <warpmode.part.0+0x56>
 59a:	4878 0001      	pea 1 <_start+0x1>
 59e:	740b           	moveq #11,d2
 5a0:	d48f           	add.l sp,d2
 5a2:	2f02           	move.l d2,-(sp)
 5a4:	42a7           	clr.l -(sp)
 5a6:	4879 0000 0a18 	pea a18 <incbin_colors_end+0x34>
 5ac:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff20a2>
 5b0:	4878 0052      	pea 52 <main+0x4c>
 5b4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf02003>
 5ba:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 5be:	203c 0000 09fe 	move.l #2558,d0
 5c4:	4878 0001      	pea 1 <_start+0x1>
 5c8:	2f02           	move.l d2,-(sp)
 5ca:	42a7           	clr.l -(sp)
 5cc:	2f00           	move.l d0,-(sp)
 5ce:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff20a2>
 5d2:	4878 0052      	pea 52 <main+0x4c>
 5d6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf02003>
	}
}
 5dc:	4fef 0018      	lea 24(sp),sp
 5e0:	241f           	move.l (sp)+,d2
 5e2:	588f           	addq.l #4,sp
 5e4:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 5e6:	4878 0001      	pea 1 <_start+0x1>
 5ea:	740b           	moveq #11,d2
 5ec:	d48f           	add.l sp,d2
 5ee:	2f02           	move.l d2,-(sp)
 5f0:	42a7           	clr.l -(sp)
 5f2:	4879 0000 0a22 	pea a22 <incbin_colors_end+0x3e>
 5f8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff20a2>
 5fc:	4878 0052      	pea 52 <main+0x4c>
 600:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf02003>
 606:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 60a:	203c 0000 09e5 	move.l #2533,d0
 610:	4878 0001      	pea 1 <_start+0x1>
 614:	2f02           	move.l d2,-(sp)
 616:	42a7           	clr.l -(sp)
 618:	2f00           	move.l d0,-(sp)
 61a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff20a2>
 61e:	4878 0052      	pea 52 <main+0x4c>
 622:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf02003>
}
 628:	4fef 0018      	lea 24(sp),sp
 62c:	241f           	move.l (sp)+,d2
 62e:	588f           	addq.l #4,sp
 630:	4e75           	rts

00000632 <KPrintF>:
{
 632:	4fef ff80      	lea -128(sp),sp
 636:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 63a:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf02003>
 640:	6734           	beq.s 676 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 642:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 648:	206f 0090      	movea.l 144(sp),a0
 64c:	43ef 0094      	lea 148(sp),a1
 650:	45f9 0000 0960 	lea 960 <PutChar>,a2
 656:	47ef 000c      	lea 12(sp),a3
 65a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 65e:	2f0b           	move.l a3,-(sp)
 660:	4878 0056      	pea 56 <main+0x50>
 664:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf02003>
 66a:	508f           	addq.l #8,sp
}
 66c:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 670:	4fef 0080      	lea 128(sp),sp
 674:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 676:	2c79 0000 2c1a 	movea.l 2c1a <SysBase>,a6
 67c:	206f 0090      	movea.l 144(sp),a0
 680:	43ef 0094      	lea 148(sp),a1
 684:	45f9 0000 0952 	lea 952 <KPutCharX>,a2
 68a:	97cb           	suba.l a3,a3
 68c:	4eae fdf6      	jsr -522(a6)
}
 690:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 694:	4fef 0080      	lea 128(sp),sp
 698:	4e75           	rts

0000069a <WaitVbl>:
void WaitVbl() {
 69a:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 69c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf10a7>,d0
 6a2:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 6a4:	2017           	move.l (sp),d0
 6a6:	0280 0001 ff00 	andi.l #130816,d0
 6ac:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 6ae:	2017           	move.l (sp),d0
 6b0:	0c80 0001 3700 	cmpi.l #79616,d0
 6b6:	67e4           	beq.s 69c <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 6b8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf10a7>,d0
 6be:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 6c2:	202f 0004      	move.l 4(sp),d0
 6c6:	0280 0001 ff00 	andi.l #130816,d0
 6cc:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 6d0:	202f 0004      	move.l 4(sp),d0
 6d4:	0c80 0001 3700 	cmpi.l #79616,d0
 6da:	66dc           	bne.s 6b8 <WaitVbl+0x1e>
}
 6dc:	508f           	addq.l #8,sp
 6de:	4e75           	rts

000006e0 <memcpy>:
{
 6e0:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 6e4:	202f 0014      	move.l 20(sp),d0
 6e8:	226f 0018      	movea.l 24(sp),a1
 6ec:	222f 001c      	move.l 28(sp),d1
	while(len--)
 6f0:	2601           	move.l d1,d3
 6f2:	5383           	subq.l #1,d3
 6f4:	4a81           	tst.l d1
 6f6:	6762           	beq.s 75a <memcpy+0x7a>
 6f8:	2040           	movea.l d0,a0
 6fa:	5888           	addq.l #4,a0
 6fc:	b1c9           	cmpa.l a1,a0
 6fe:	53c2           	sl.s d2
 700:	4402           	neg.b d2
 702:	41e9 0004      	lea 4(a1),a0
 706:	b1c0           	cmpa.l d0,a0
 708:	53c4           	sl.s d4
 70a:	4404           	neg.b d4
 70c:	8404           	or.b d4,d2
 70e:	7808           	moveq #8,d4
 710:	b883           	cmp.l d3,d4
 712:	55c4           	sc.s d4
 714:	4404           	neg.b d4
 716:	c404           	and.b d4,d2
 718:	6746           	beq.s 760 <memcpy+0x80>
 71a:	2409           	move.l a1,d2
 71c:	8480           	or.l d0,d2
 71e:	7803           	moveq #3,d4
 720:	c484           	and.l d4,d2
 722:	663c           	bne.s 760 <memcpy+0x80>
 724:	2049           	movea.l a1,a0
 726:	2440           	movea.l d0,a2
 728:	74fc           	moveq #-4,d2
 72a:	c481           	and.l d1,d2
 72c:	d489           	add.l a1,d2
		*d++ = *s++;
 72e:	24d8           	move.l (a0)+,(a2)+
 730:	b488           	cmp.l a0,d2
 732:	66fa           	bne.s 72e <memcpy+0x4e>
 734:	74fc           	moveq #-4,d2
 736:	c481           	and.l d1,d2
 738:	2040           	movea.l d0,a0
 73a:	d1c2           	adda.l d2,a0
 73c:	d3c2           	adda.l d2,a1
 73e:	9682           	sub.l d2,d3
 740:	b481           	cmp.l d1,d2
 742:	6716           	beq.s 75a <memcpy+0x7a>
 744:	1091           	move.b (a1),(a0)
	while(len--)
 746:	4a83           	tst.l d3
 748:	6710           	beq.s 75a <memcpy+0x7a>
		*d++ = *s++;
 74a:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 750:	5383           	subq.l #1,d3
 752:	6706           	beq.s 75a <memcpy+0x7a>
		*d++ = *s++;
 754:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 75a:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 75e:	4e75           	rts
 760:	2040           	movea.l d0,a0
 762:	d289           	add.l a1,d1
		*d++ = *s++;
 764:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 766:	b289           	cmp.l a1,d1
 768:	67f0           	beq.s 75a <memcpy+0x7a>
		*d++ = *s++;
 76a:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 76c:	b289           	cmp.l a1,d1
 76e:	66f4           	bne.s 764 <memcpy+0x84>
 770:	60e8           	bra.s 75a <memcpy+0x7a>

00000772 <memset>:
{
 772:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 776:	202f 0024      	move.l 36(sp),d0
 77a:	2a2f 0028      	move.l 40(sp),d5
 77e:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 782:	2809           	move.l a1,d4
 784:	5384           	subq.l #1,d4
 786:	b2fc 0000      	cmpa.w #0,a1
 78a:	6f00 00b0      	ble.w 83c <memset+0xca>
 78e:	1e05           	move.b d5,d7
 790:	2200           	move.l d0,d1
 792:	4481           	neg.l d1
 794:	7403           	moveq #3,d2
 796:	c282           	and.l d2,d1
 798:	7c05           	moveq #5,d6
		*ptr++ = val;
 79a:	2440           	movea.l d0,a2
 79c:	bc84           	cmp.l d4,d6
 79e:	646a           	bcc.s 80a <memset+0x98>
 7a0:	4a81           	tst.l d1
 7a2:	6724           	beq.s 7c8 <memset+0x56>
 7a4:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 7a6:	5384           	subq.l #1,d4
 7a8:	7401           	moveq #1,d2
 7aa:	b481           	cmp.l d1,d2
 7ac:	671a           	beq.s 7c8 <memset+0x56>
		*ptr++ = val;
 7ae:	2440           	movea.l d0,a2
 7b0:	548a           	addq.l #2,a2
 7b2:	2040           	movea.l d0,a0
 7b4:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 7b8:	5384           	subq.l #1,d4
 7ba:	7403           	moveq #3,d2
 7bc:	b481           	cmp.l d1,d2
 7be:	6608           	bne.s 7c8 <memset+0x56>
		*ptr++ = val;
 7c0:	528a           	addq.l #1,a2
 7c2:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 7c6:	5384           	subq.l #1,d4
 7c8:	2609           	move.l a1,d3
 7ca:	9681           	sub.l d1,d3
 7cc:	7c00           	moveq #0,d6
 7ce:	1c05           	move.b d5,d6
 7d0:	2406           	move.l d6,d2
 7d2:	4842           	swap d2
 7d4:	4242           	clr.w d2
 7d6:	2042           	movea.l d2,a0
 7d8:	2406           	move.l d6,d2
 7da:	e14a           	lsl.w #8,d2
 7dc:	4842           	swap d2
 7de:	4242           	clr.w d2
 7e0:	e18e           	lsl.l #8,d6
 7e2:	2646           	movea.l d6,a3
 7e4:	2c08           	move.l a0,d6
 7e6:	8486           	or.l d6,d2
 7e8:	2c0b           	move.l a3,d6
 7ea:	8486           	or.l d6,d2
 7ec:	1407           	move.b d7,d2
 7ee:	2040           	movea.l d0,a0
 7f0:	d1c1           	adda.l d1,a0
 7f2:	72fc           	moveq #-4,d1
 7f4:	c283           	and.l d3,d1
 7f6:	d288           	add.l a0,d1
		*ptr++ = val;
 7f8:	20c2           	move.l d2,(a0)+
 7fa:	b1c1           	cmpa.l d1,a0
 7fc:	66fa           	bne.s 7f8 <memset+0x86>
 7fe:	72fc           	moveq #-4,d1
 800:	c283           	and.l d3,d1
 802:	d5c1           	adda.l d1,a2
 804:	9881           	sub.l d1,d4
 806:	b283           	cmp.l d3,d1
 808:	6732           	beq.s 83c <memset+0xca>
 80a:	1485           	move.b d5,(a2)
	while(len-- > 0)
 80c:	4a84           	tst.l d4
 80e:	6f2c           	ble.s 83c <memset+0xca>
		*ptr++ = val;
 810:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 814:	7201           	moveq #1,d1
 816:	b284           	cmp.l d4,d1
 818:	6c22           	bge.s 83c <memset+0xca>
		*ptr++ = val;
 81a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 81e:	7402           	moveq #2,d2
 820:	b484           	cmp.l d4,d2
 822:	6c18           	bge.s 83c <memset+0xca>
		*ptr++ = val;
 824:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 828:	7c03           	moveq #3,d6
 82a:	bc84           	cmp.l d4,d6
 82c:	6c0e           	bge.s 83c <memset+0xca>
		*ptr++ = val;
 82e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 832:	7204           	moveq #4,d1
 834:	b284           	cmp.l d4,d1
 836:	6c04           	bge.s 83c <memset+0xca>
		*ptr++ = val;
 838:	1545 0005      	move.b d5,5(a2)
}
 83c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 840:	4e75           	rts

00000842 <strlen>:
{
 842:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 846:	7000           	moveq #0,d0
	while(*s++)
 848:	4a10           	tst.b (a0)
 84a:	6708           	beq.s 854 <strlen+0x12>
		t++;
 84c:	5280           	addq.l #1,d0
	while(*s++)
 84e:	4a30 0800      	tst.b (0,a0,d0.l)
 852:	66f8           	bne.s 84c <strlen+0xa>
}
 854:	4e75           	rts
 856:	4e71           	nop

00000858 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 858:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 85c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 860:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 864:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 868:	d041           	add.w d1,d0
	swap	d0
 86a:	4840           	swap d0
	clrw	d0
 86c:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 86e:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 872:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 876:	d081           	add.l d1,d0

	rts
 878:	4e75           	rts

0000087a <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 87a:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 87c:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 880:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 884:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 88a:	6416           	bcc.s 8a2 <__udivsi3+0x28>
	movel	d0, d2
 88c:	2400           	move.l d0,d2
	clrw	d2
 88e:	4242           	clr.w d2
	swap	d2
 890:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 892:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 894:	3002           	move.w d2,d0
	swap	d0
 896:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 898:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 89c:	84c1           	divu.w d1,d2
	movew	d2, d0
 89e:	3002           	move.w d2,d0
	jra	6f
 8a0:	6030           	bra.s 8d2 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 8a2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 8a4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 8a6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 8a8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 8ae:	64f4           	bcc.s 8a4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 8b0:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 8b2:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 8b8:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 8ba:	c2c0           	mulu.w d0,d1
	swap	d2
 8bc:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 8be:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 8c0:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 8c2:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 8c4:	660a           	bne.s 8d0 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 8c6:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 8c8:	6506           	bcs.s 8d0 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 8ca:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 8ce:	6302           	bls.s 8d2 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 8d0:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 8d2:	241f           	move.l (sp)+,d2
	rts
 8d4:	4e75           	rts

000008d6 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 8d6:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 8d8:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 8da:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 8de:	6a04           	bpl.s 8e4 <__divsi3+0xe>
	negl	d1
 8e0:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 8e2:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 8e4:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 8e8:	6a04           	bpl.s 8ee <__divsi3+0x18>
	negl	d0
 8ea:	4480           	neg.l d0
	negb	d2
 8ec:	4402           	neg.b d2

2:	movel	d1, sp@-
 8ee:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 8f0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 8f2:	6186           	bsr.s 87a <__udivsi3>
	addql	IMM (8), sp
 8f4:	508f           	addq.l #8,sp

	tstb	d2
 8f6:	4a02           	tst.b d2
	jpl	3f
 8f8:	6a02           	bpl.s 8fc <__divsi3+0x26>
	negl	d0
 8fa:	4480           	neg.l d0

3:	movel	sp@+, d2
 8fc:	241f           	move.l (sp)+,d2
	rts
 8fe:	4e75           	rts

00000900 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 900:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 904:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 908:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 90a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 90c:	61c8           	bsr.s 8d6 <__divsi3>
	addql	IMM (8), sp
 90e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 910:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 914:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 916:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 918:	6100 ff3e      	bsr.w 858 <__mulsi3>
	addql	IMM (8), sp
 91c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 91e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 922:	9280           	sub.l d0,d1
	movel	d1, d0
 924:	2001           	move.l d1,d0
	rts
 926:	4e75           	rts

00000928 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 928:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 92c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 930:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 932:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 934:	6100 ff44      	bsr.w 87a <__udivsi3>
	addql	IMM (8), sp
 938:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 93a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 93e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 940:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 942:	6100 ff14      	bsr.w 858 <__mulsi3>
	addql	IMM (8), sp
 946:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 948:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 94c:	9280           	sub.l d0,d1
	movel	d1, d0
 94e:	2001           	move.l d1,d0
	rts
 950:	4e75           	rts

00000952 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 952:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 954:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 958:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 95c:	2c5f           	movea.l (sp)+,a6
    rts
 95e:	4e75           	rts

00000960 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 960:	16c0           	move.b d0,(a3)+
	rts
 962:	4e75           	rts
