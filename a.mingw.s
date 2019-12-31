
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
  10:	23ce 0000 2a22 	move.l a6,2a22 <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,2a1e <hw>
  1c:	0000 2a1e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 08d5 	lea 8d5 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 2a1a 	move.l d0,2a1a <GfxBase>
	if (!GfxBase)
  32:	6700 03b0      	beq.w 3e4 <main+0x3de>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
  3c:	43f9 0000 08e6 	lea 8e6 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 2a16 	move.l d0,2a16 <DOSBase>
	if (!DOSBase)
  4e:	6700 0388      	beq.w 3d8 <main+0x3d2>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 08f2 	pea 8f2 <incbin_colors_end+0x66>
  58:	4eb9 0000 04da 	jsr 4da <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 090e 	move.l #2318,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
#include "runtests.h"
#include "coppertests.h"

void RunTests() {
    TestCopperList();
  7c:	45f9 0000 2970 	lea 2970 <clsprites>,a2
  82:	47f9 0000 29c0 	lea 29c0 <copperlist>,a3
  88:	4878 0040      	pea 40 <main+0x3a>
  8c:	2f0a           	move.l a2,-(sp)
  8e:	2f0b           	move.l a3,-(sp)
  90:	4eb9 0000 0588 	jsr 588 <memcpy>


void BuildCopper() {
  for(int i=0; i<16;i++)
    copperlist[i] = clsprites[i];
  copperlist[16] = 0xfffffffe;
  96:	70fe           	moveq #-2,d0
  98:	23c0 0000 2a00 	move.l d0,2a00 <copperlist+0x40>

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                 long length) {
  for( int i=0;i<length;i++)
    if( instructions[ pos+i] != batch[ i])
  9e:	4fef 0010      	lea 16(sp),sp
  a2:	2653           	movea.l (a3),a3
  a4:	b7d2           	cmpa.l (a2),a3
  a6:	6600 02e4      	bne.w 38c <main+0x386>
  aa:	2239 0000 29c4 	move.l 29c4 <copperlist+0x4>,d1
  b0:	b2b9 0000 2974 	cmp.l 2974 <clsprites+0x4>,d1
  b6:	6600 02d4      	bne.w 38c <main+0x386>
  ba:	2039 0000 29c8 	move.l 29c8 <copperlist+0x8>,d0
  c0:	b0b9 0000 2978 	cmp.l 2978 <clsprites+0x8>,d0
  c6:	6600 02c4      	bne.w 38c <main+0x386>
  ca:	2239 0000 29cc 	move.l 29cc <copperlist+0xc>,d1
  d0:	b2b9 0000 297c 	cmp.l 297c <clsprites+0xc>,d1
  d6:	6600 02b4      	bne.w 38c <main+0x386>
  da:	2039 0000 29d0 	move.l 29d0 <copperlist+0x10>,d0
  e0:	b0b9 0000 2980 	cmp.l 2980 <clsprites+0x10>,d0
  e6:	6600 02a4      	bne.w 38c <main+0x386>
  ea:	2239 0000 29d4 	move.l 29d4 <copperlist+0x14>,d1
  f0:	b2b9 0000 2984 	cmp.l 2984 <clsprites+0x14>,d1
  f6:	6600 0294      	bne.w 38c <main+0x386>
  fa:	2039 0000 29d8 	move.l 29d8 <copperlist+0x18>,d0
 100:	b0b9 0000 2988 	cmp.l 2988 <clsprites+0x18>,d0
 106:	6600 0284      	bne.w 38c <main+0x386>
 10a:	2239 0000 29dc 	move.l 29dc <copperlist+0x1c>,d1
 110:	b2b9 0000 298c 	cmp.l 298c <clsprites+0x1c>,d1
 116:	6600 0274      	bne.w 38c <main+0x386>
 11a:	2039 0000 29e0 	move.l 29e0 <copperlist+0x20>,d0
 120:	b0b9 0000 2990 	cmp.l 2990 <clsprites+0x20>,d0
 126:	6600 0264      	bne.w 38c <main+0x386>
 12a:	2239 0000 29e4 	move.l 29e4 <copperlist+0x24>,d1
 130:	b2b9 0000 2994 	cmp.l 2994 <clsprites+0x24>,d1
 136:	6600 0254      	bne.w 38c <main+0x386>
 13a:	2039 0000 29e8 	move.l 29e8 <copperlist+0x28>,d0
 140:	b0b9 0000 2998 	cmp.l 2998 <clsprites+0x28>,d0
 146:	6600 0244      	bne.w 38c <main+0x386>
 14a:	2239 0000 29ec 	move.l 29ec <copperlist+0x2c>,d1
 150:	b2b9 0000 299c 	cmp.l 299c <clsprites+0x2c>,d1
 156:	6600 0234      	bne.w 38c <main+0x386>
 15a:	2039 0000 29f0 	move.l 29f0 <copperlist+0x30>,d0
 160:	b0b9 0000 29a0 	cmp.l 29a0 <clsprites+0x30>,d0
 166:	6600 0224      	bne.w 38c <main+0x386>
 16a:	2239 0000 29f4 	move.l 29f4 <copperlist+0x34>,d1
 170:	b2b9 0000 29a4 	cmp.l 29a4 <clsprites+0x34>,d1
 176:	6600 0214      	bne.w 38c <main+0x386>
 17a:	2039 0000 29f8 	move.l 29f8 <copperlist+0x38>,d0
 180:	b0b9 0000 29a8 	cmp.l 29a8 <clsprites+0x38>,d0
 186:	6600 0204      	bne.w 38c <main+0x386>
 18a:	2239 0000 29fc 	move.l 29fc <copperlist+0x3c>,d1
 190:	b2b9 0000 29ac 	cmp.l 29ac <clsprites+0x3c>,d1
 196:	6600 01f4      	bne.w 38c <main+0x386>
  RunTests();
	Delay(50);
 19a:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
 1a0:	7232           	moveq #50,d1
 1a2:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 1a6:	247c 00f0 ff60 	movea.l #15794016,a2
 1ac:	4a92           	tst.l (a2)
 1ae:	6718           	beq.s 1c8 <main+0x1c2>
 1b0:	4878 0001      	pea 1 <_start+0x1>
 1b4:	47f9 0000 0438 	lea 438 <warpmode.part.0>,a3
 1ba:	4e93           	jsr (a3)
 1bc:	588f           	addq.l #4,sp
 1be:	4a92           	tst.l (a2)
 1c0:	6706           	beq.s 1c8 <main+0x1c2>
 1c2:	42a7           	clr.l -(sp)
 1c4:	4e93           	jsr (a3)
 1c6:	588f           	addq.l #4,sp
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
}

void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 1c8:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 1ce:	23ee 0022 0000 	move.l 34(a6),2a04 <ActiView>
 1d4:	2a04 
	OwnBlitter();
 1d6:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 1da:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 1e0:	4eae ff1c      	jsr -228(a6)
	Disable();
 1e4:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 1ea:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 1ee:	2479 0000 2a1e 	movea.l 2a1e <hw>,a2
 1f4:	302a 0010      	move.w 16(a2),d0
 1f8:	33c0 0000 2a08 	move.w d0,2a08 <SystemADKCON>
	SystemInts=hw->intenar;
 1fe:	302a 001c      	move.w 28(a2),d0
 202:	33c0 0000 2a0c 	move.w d0,2a0c <SystemInts>
	SystemDMA=hw->dmaconr;
 208:	302a 0002      	move.w 2(a2),d0
 20c:	33c0 0000 2a0a 	move.w d0,2a0a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 212:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 218:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 21e:	47f9 0000 0542 	lea 542 <WaitVbl>,a3
 224:	4e93           	jsr (a3)
	WaitVbl();
 226:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 228:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 22e:	7000           	moveq #0,d0
		hw->color[a]=0;
 230:	2200           	move.l d0,d1
 232:	0681 0000 00c0 	addi.l #192,d1
 238:	d281           	add.l d1,d1
 23a:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 240:	5280           	addq.l #1,d0
 242:	7220           	moveq #32,d1
 244:	b280           	cmp.l d0,d1
 246:	66e8           	bne.s 230 <main+0x22a>

	LoadView(0);
 248:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 24e:	93c9           	suba.l a1,a1
 250:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 254:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 25a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 25e:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 264:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 268:	4e93           	jsr (a3)
	WaitVbl();
 26a:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 26c:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 272:	3f7c 0801 001c 	move.w #2049,28(sp)
 278:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 27e:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 284:	082e 0000 0129 	btst #0,297(a6)
 28a:	6700 0182      	beq.w 40e <main+0x408>
		vbr = (APTR)Supervisor((void*)getvbr);
 28e:	7e1a           	moveq #26,d7
 290:	de8f           	add.l sp,d7
 292:	cf8d           	exg d7,a5
 294:	4eae ffe2      	jsr -30(a6)
 298:	cf8d           	exg d7,a5

	VBR=GetVBR();
 29a:	23c0 0000 2a0e 	move.l d0,2a0e <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 2a0:	2079 0000 2a0e 	movea.l 2a0e <VBR.lto_priv.0>,a0
 2a6:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 2aa:	23ca 0000 2a12 	move.l a2,2a12 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 2b0:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 2b2:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 2b4:	2079 0000 2a1e 	movea.l 2a1e <hw>,a0
 2ba:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 2be:	3028 0002      	move.w 2(a0),d0
 2c2:	0800 000e      	btst #14,d0
 2c6:	66f6           	bne.s 2be <main+0x2b8>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 2c8:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 2ce:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 2d4:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 2da:	2279 0000 2a0e 	movea.l 2a0e <VBR.lto_priv.0>,a1
 2e0:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 2e4:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 2ea:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 2f0:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 2f6:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 2fc:	3039 0000 2a0c 	move.w 2a0c <SystemInts>,d0
 302:	0040 8000      	ori.w #-32768,d0
 306:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 30a:	3039 0000 2a0a 	move.w 2a0a <SystemDMA>,d0
 310:	0040 8000      	ori.w #-32768,d0
 314:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 318:	3039 0000 2a08 	move.w 2a08 <SystemADKCON>,d0
 31e:	0040 8000      	ori.w #-32768,d0
 322:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 326:	2279 0000 2a04 	movea.l 2a04 <ActiView>,a1
 32c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 330:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 336:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 33a:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 340:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 344:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 34a:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 34e:	2c79 0000 2a1a 	movea.l 2a1a <GfxBase>,a6
 354:	4eae fe32      	jsr -462(a6)
	Enable();
 358:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 35e:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 362:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 368:	2279 0000 2a16 	movea.l 2a16 <DOSBase>,a1
 36e:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 372:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 378:	2279 0000 2a1a 	movea.l 2a1a <GfxBase>,a1
 37e:	4eae fe62      	jsr -414(a6)
}
 382:	7000           	moveq #0,d0
 384:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 388:	508f           	addq.l #8,sp
 38a:	4e75           	rts
}

void TestCopperList() {
  BuildCopper();
  if( TestCopperlistBatch(  copperlist, 0, clsprites, 16) == 0)
    Write(Output(), "Sprite section of copper on pos 0 messed up\n", 44);
 38c:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
 392:	4eae ffc4      	jsr -60(a6)
 396:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
 39c:	2200           	move.l d0,d1
 39e:	243c 0000 0940 	move.l #2368,d2
 3a4:	762c           	moveq #44,d3
 3a6:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 3aa:	70fe           	moveq #-2,d0
 3ac:	b0b9 0000 2a00 	cmp.l 2a00 <copperlist+0x40>,d0
 3b2:	6700 fde6      	beq.w 19a <main+0x194>
  if( TestCopperlistPos( copperlist, 16, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 32);
 3b6:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
 3bc:	4eae ffc4      	jsr -60(a6)
 3c0:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
 3c6:	2200           	move.l d0,d1
 3c8:	243c 0000 091e 	move.l #2334,d2
 3ce:	7620           	moveq #32,d3
 3d0:	4eae ffd0      	jsr -48(a6)
 3d4:	6000 fdc4      	bra.w 19a <main+0x194>
		Exit(0);
 3d8:	9dce           	suba.l a6,a6
 3da:	7200           	moveq #0,d1
 3dc:	4eae ff70      	jsr -144(a6)
 3e0:	6000 fc70      	bra.w 52 <main+0x4c>
		Exit(0);
 3e4:	2c79 0000 2a16 	movea.l 2a16 <DOSBase>,a6
 3ea:	7200           	moveq #0,d1
 3ec:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 3f0:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 3f6:	43f9 0000 08e6 	lea 8e6 <incbin_colors_end+0x5a>,a1
 3fc:	7000           	moveq #0,d0
 3fe:	4eae fdd8      	jsr -552(a6)
 402:	23c0 0000 2a16 	move.l d0,2a16 <DOSBase>
	if (!DOSBase)
 408:	6600 fc48      	bne.w 52 <main+0x4c>
 40c:	60ca           	bra.s 3d8 <main+0x3d2>
	APTR vbr = 0;
 40e:	7000           	moveq #0,d0
	VBR=GetVBR();
 410:	23c0 0000 2a0e 	move.l d0,2a0e <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 416:	2079 0000 2a0e 	movea.l 2a0e <VBR.lto_priv.0>,a0
 41c:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 420:	23ca 0000 2a12 	move.l a2,2a12 <SystemIrq>
	WaitVbl();
 426:	4e93           	jsr (a3)
	WaitVbl();
 428:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 42a:	2079 0000 2a1e 	movea.l 2a1e <hw>,a0
 430:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 434:	6000 fe88      	bra.w 2be <main+0x2b8>

00000438 <warpmode.part.0>:
void warpmode(int on) 
 438:	598f           	subq.l #4,sp
 43a:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 43c:	4aaf 000c      	tst.l 12(sp)
 440:	674c           	beq.s 48e <warpmode.part.0+0x56>
 442:	4878 0001      	pea 1 <_start+0x1>
 446:	740b           	moveq #11,d2
 448:	d48f           	add.l sp,d2
 44a:	2f02           	move.l d2,-(sp)
 44c:	42a7           	clr.l -(sp)
 44e:	4879 0000 08c0 	pea 8c0 <incbin_colors_end+0x34>
 454:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff221a>
 458:	4878 0052      	pea 52 <main+0x4c>
 45c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0217b>
 462:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 466:	203c 0000 08a6 	move.l #2214,d0
 46c:	4878 0001      	pea 1 <_start+0x1>
 470:	2f02           	move.l d2,-(sp)
 472:	42a7           	clr.l -(sp)
 474:	2f00           	move.l d0,-(sp)
 476:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff221a>
 47a:	4878 0052      	pea 52 <main+0x4c>
 47e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0217b>
	}
}
 484:	4fef 0018      	lea 24(sp),sp
 488:	241f           	move.l (sp)+,d2
 48a:	588f           	addq.l #4,sp
 48c:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 48e:	4878 0001      	pea 1 <_start+0x1>
 492:	740b           	moveq #11,d2
 494:	d48f           	add.l sp,d2
 496:	2f02           	move.l d2,-(sp)
 498:	42a7           	clr.l -(sp)
 49a:	4879 0000 08ca 	pea 8ca <incbin_colors_end+0x3e>
 4a0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff221a>
 4a4:	4878 0052      	pea 52 <main+0x4c>
 4a8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0217b>
 4ae:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 4b2:	203c 0000 088d 	move.l #2189,d0
 4b8:	4878 0001      	pea 1 <_start+0x1>
 4bc:	2f02           	move.l d2,-(sp)
 4be:	42a7           	clr.l -(sp)
 4c0:	2f00           	move.l d0,-(sp)
 4c2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff221a>
 4c6:	4878 0052      	pea 52 <main+0x4c>
 4ca:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0217b>
}
 4d0:	4fef 0018      	lea 24(sp),sp
 4d4:	241f           	move.l (sp)+,d2
 4d6:	588f           	addq.l #4,sp
 4d8:	4e75           	rts

000004da <KPrintF>:
{
 4da:	4fef ff80      	lea -128(sp),sp
 4de:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 4e2:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf0217b>
 4e8:	6734           	beq.s 51e <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 4ea:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 4f0:	206f 0090      	movea.l 144(sp),a0
 4f4:	43ef 0094      	lea 148(sp),a1
 4f8:	45f9 0000 0808 	lea 808 <PutChar>,a2
 4fe:	47ef 000c      	lea 12(sp),a3
 502:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 506:	2f0b           	move.l a3,-(sp)
 508:	4878 0056      	pea 56 <main+0x50>
 50c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0217b>
 512:	508f           	addq.l #8,sp
}
 514:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 518:	4fef 0080      	lea 128(sp),sp
 51c:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 51e:	2c79 0000 2a22 	movea.l 2a22 <SysBase>,a6
 524:	206f 0090      	movea.l 144(sp),a0
 528:	43ef 0094      	lea 148(sp),a1
 52c:	45f9 0000 07fa 	lea 7fa <KPutCharX>,a2
 532:	97cb           	suba.l a3,a3
 534:	4eae fdf6      	jsr -522(a6)
}
 538:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 53c:	4fef 0080      	lea 128(sp),sp
 540:	4e75           	rts

00000542 <WaitVbl>:
void WaitVbl() {
 542:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 544:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf121f>,d0
 54a:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 54c:	2017           	move.l (sp),d0
 54e:	0280 0001 ff00 	andi.l #130816,d0
 554:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 556:	2017           	move.l (sp),d0
 558:	0c80 0001 3700 	cmpi.l #79616,d0
 55e:	67e4           	beq.s 544 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 560:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf121f>,d0
 566:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 56a:	202f 0004      	move.l 4(sp),d0
 56e:	0280 0001 ff00 	andi.l #130816,d0
 574:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 578:	202f 0004      	move.l 4(sp),d0
 57c:	0c80 0001 3700 	cmpi.l #79616,d0
 582:	66dc           	bne.s 560 <WaitVbl+0x1e>
}
 584:	508f           	addq.l #8,sp
 586:	4e75           	rts

00000588 <memcpy>:
{
 588:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 58c:	202f 0014      	move.l 20(sp),d0
 590:	226f 0018      	movea.l 24(sp),a1
 594:	222f 001c      	move.l 28(sp),d1
	while(len--)
 598:	2601           	move.l d1,d3
 59a:	5383           	subq.l #1,d3
 59c:	4a81           	tst.l d1
 59e:	6762           	beq.s 602 <memcpy+0x7a>
 5a0:	2040           	movea.l d0,a0
 5a2:	5888           	addq.l #4,a0
 5a4:	b1c9           	cmpa.l a1,a0
 5a6:	53c2           	sl.s d2
 5a8:	4402           	neg.b d2
 5aa:	41e9 0004      	lea 4(a1),a0
 5ae:	b1c0           	cmpa.l d0,a0
 5b0:	53c4           	sl.s d4
 5b2:	4404           	neg.b d4
 5b4:	8404           	or.b d4,d2
 5b6:	7808           	moveq #8,d4
 5b8:	b883           	cmp.l d3,d4
 5ba:	55c4           	sc.s d4
 5bc:	4404           	neg.b d4
 5be:	c404           	and.b d4,d2
 5c0:	6746           	beq.s 608 <memcpy+0x80>
 5c2:	2409           	move.l a1,d2
 5c4:	8480           	or.l d0,d2
 5c6:	7803           	moveq #3,d4
 5c8:	c484           	and.l d4,d2
 5ca:	663c           	bne.s 608 <memcpy+0x80>
 5cc:	2049           	movea.l a1,a0
 5ce:	2440           	movea.l d0,a2
 5d0:	74fc           	moveq #-4,d2
 5d2:	c481           	and.l d1,d2
 5d4:	d489           	add.l a1,d2
		*d++ = *s++;
 5d6:	24d8           	move.l (a0)+,(a2)+
 5d8:	b488           	cmp.l a0,d2
 5da:	66fa           	bne.s 5d6 <memcpy+0x4e>
 5dc:	74fc           	moveq #-4,d2
 5de:	c481           	and.l d1,d2
 5e0:	2040           	movea.l d0,a0
 5e2:	d1c2           	adda.l d2,a0
 5e4:	d3c2           	adda.l d2,a1
 5e6:	9682           	sub.l d2,d3
 5e8:	b481           	cmp.l d1,d2
 5ea:	6716           	beq.s 602 <memcpy+0x7a>
 5ec:	1091           	move.b (a1),(a0)
	while(len--)
 5ee:	4a83           	tst.l d3
 5f0:	6710           	beq.s 602 <memcpy+0x7a>
		*d++ = *s++;
 5f2:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 5f8:	5383           	subq.l #1,d3
 5fa:	6706           	beq.s 602 <memcpy+0x7a>
		*d++ = *s++;
 5fc:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 602:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 606:	4e75           	rts
 608:	2040           	movea.l d0,a0
 60a:	d289           	add.l a1,d1
		*d++ = *s++;
 60c:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 60e:	b289           	cmp.l a1,d1
 610:	67f0           	beq.s 602 <memcpy+0x7a>
		*d++ = *s++;
 612:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 614:	b289           	cmp.l a1,d1
 616:	66f4           	bne.s 60c <memcpy+0x84>
 618:	60e8           	bra.s 602 <memcpy+0x7a>

0000061a <memset>:
{
 61a:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 61e:	202f 0024      	move.l 36(sp),d0
 622:	2a2f 0028      	move.l 40(sp),d5
 626:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 62a:	2809           	move.l a1,d4
 62c:	5384           	subq.l #1,d4
 62e:	b2fc 0000      	cmpa.w #0,a1
 632:	6f00 00b0      	ble.w 6e4 <memset+0xca>
 636:	1e05           	move.b d5,d7
 638:	2200           	move.l d0,d1
 63a:	4481           	neg.l d1
 63c:	7403           	moveq #3,d2
 63e:	c282           	and.l d2,d1
 640:	7c05           	moveq #5,d6
		*ptr++ = val;
 642:	2440           	movea.l d0,a2
 644:	bc84           	cmp.l d4,d6
 646:	646a           	bcc.s 6b2 <memset+0x98>
 648:	4a81           	tst.l d1
 64a:	6724           	beq.s 670 <memset+0x56>
 64c:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 64e:	5384           	subq.l #1,d4
 650:	7401           	moveq #1,d2
 652:	b481           	cmp.l d1,d2
 654:	671a           	beq.s 670 <memset+0x56>
		*ptr++ = val;
 656:	2440           	movea.l d0,a2
 658:	548a           	addq.l #2,a2
 65a:	2040           	movea.l d0,a0
 65c:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 660:	5384           	subq.l #1,d4
 662:	7403           	moveq #3,d2
 664:	b481           	cmp.l d1,d2
 666:	6608           	bne.s 670 <memset+0x56>
		*ptr++ = val;
 668:	528a           	addq.l #1,a2
 66a:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 66e:	5384           	subq.l #1,d4
 670:	2609           	move.l a1,d3
 672:	9681           	sub.l d1,d3
 674:	7c00           	moveq #0,d6
 676:	1c05           	move.b d5,d6
 678:	2406           	move.l d6,d2
 67a:	4842           	swap d2
 67c:	4242           	clr.w d2
 67e:	2042           	movea.l d2,a0
 680:	2406           	move.l d6,d2
 682:	e14a           	lsl.w #8,d2
 684:	4842           	swap d2
 686:	4242           	clr.w d2
 688:	e18e           	lsl.l #8,d6
 68a:	2646           	movea.l d6,a3
 68c:	2c08           	move.l a0,d6
 68e:	8486           	or.l d6,d2
 690:	2c0b           	move.l a3,d6
 692:	8486           	or.l d6,d2
 694:	1407           	move.b d7,d2
 696:	2040           	movea.l d0,a0
 698:	d1c1           	adda.l d1,a0
 69a:	72fc           	moveq #-4,d1
 69c:	c283           	and.l d3,d1
 69e:	d288           	add.l a0,d1
		*ptr++ = val;
 6a0:	20c2           	move.l d2,(a0)+
 6a2:	b1c1           	cmpa.l d1,a0
 6a4:	66fa           	bne.s 6a0 <memset+0x86>
 6a6:	72fc           	moveq #-4,d1
 6a8:	c283           	and.l d3,d1
 6aa:	d5c1           	adda.l d1,a2
 6ac:	9881           	sub.l d1,d4
 6ae:	b283           	cmp.l d3,d1
 6b0:	6732           	beq.s 6e4 <memset+0xca>
 6b2:	1485           	move.b d5,(a2)
	while(len-- > 0)
 6b4:	4a84           	tst.l d4
 6b6:	6f2c           	ble.s 6e4 <memset+0xca>
		*ptr++ = val;
 6b8:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 6bc:	7201           	moveq #1,d1
 6be:	b284           	cmp.l d4,d1
 6c0:	6c22           	bge.s 6e4 <memset+0xca>
		*ptr++ = val;
 6c2:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 6c6:	7402           	moveq #2,d2
 6c8:	b484           	cmp.l d4,d2
 6ca:	6c18           	bge.s 6e4 <memset+0xca>
		*ptr++ = val;
 6cc:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 6d0:	7c03           	moveq #3,d6
 6d2:	bc84           	cmp.l d4,d6
 6d4:	6c0e           	bge.s 6e4 <memset+0xca>
		*ptr++ = val;
 6d6:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 6da:	7204           	moveq #4,d1
 6dc:	b284           	cmp.l d4,d1
 6de:	6c04           	bge.s 6e4 <memset+0xca>
		*ptr++ = val;
 6e0:	1545 0005      	move.b d5,5(a2)
}
 6e4:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 6e8:	4e75           	rts

000006ea <strlen>:
{
 6ea:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 6ee:	7000           	moveq #0,d0
	while(*s++)
 6f0:	4a10           	tst.b (a0)
 6f2:	6708           	beq.s 6fc <strlen+0x12>
		t++;
 6f4:	5280           	addq.l #1,d0
	while(*s++)
 6f6:	4a30 0800      	tst.b (0,a0,d0.l)
 6fa:	66f8           	bne.s 6f4 <strlen+0xa>
}
 6fc:	4e75           	rts
 6fe:	4e71           	nop

00000700 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 700:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 704:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 708:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 70c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 710:	d041           	add.w d1,d0
	swap	d0
 712:	4840           	swap d0
	clrw	d0
 714:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 716:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 71a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 71e:	d081           	add.l d1,d0

	rts
 720:	4e75           	rts

00000722 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 722:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 724:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 728:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 72c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 732:	6416           	bcc.s 74a <__udivsi3+0x28>
	movel	d0, d2
 734:	2400           	move.l d0,d2
	clrw	d2
 736:	4242           	clr.w d2
	swap	d2
 738:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 73a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 73c:	3002           	move.w d2,d0
	swap	d0
 73e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 740:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 744:	84c1           	divu.w d1,d2
	movew	d2, d0
 746:	3002           	move.w d2,d0
	jra	6f
 748:	6030           	bra.s 77a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 74a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 74c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 74e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 750:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 756:	64f4           	bcc.s 74c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 758:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 75a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 760:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 762:	c2c0           	mulu.w d0,d1
	swap	d2
 764:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 766:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 768:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 76a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 76c:	660a           	bne.s 778 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 76e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 770:	6506           	bcs.s 778 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 772:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 776:	6302           	bls.s 77a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 778:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 77a:	241f           	move.l (sp)+,d2
	rts
 77c:	4e75           	rts

0000077e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 77e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 780:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 782:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 786:	6a04           	bpl.s 78c <__divsi3+0xe>
	negl	d1
 788:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 78a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 78c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 790:	6a04           	bpl.s 796 <__divsi3+0x18>
	negl	d0
 792:	4480           	neg.l d0
	negb	d2
 794:	4402           	neg.b d2

2:	movel	d1, sp@-
 796:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 798:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 79a:	6186           	bsr.s 722 <__udivsi3>
	addql	IMM (8), sp
 79c:	508f           	addq.l #8,sp

	tstb	d2
 79e:	4a02           	tst.b d2
	jpl	3f
 7a0:	6a02           	bpl.s 7a4 <__divsi3+0x26>
	negl	d0
 7a2:	4480           	neg.l d0

3:	movel	sp@+, d2
 7a4:	241f           	move.l (sp)+,d2
	rts
 7a6:	4e75           	rts

000007a8 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 7a8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 7ac:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 7b0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 7b2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 7b4:	61c8           	bsr.s 77e <__divsi3>
	addql	IMM (8), sp
 7b6:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 7b8:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 7bc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 7be:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 7c0:	6100 ff3e      	bsr.w 700 <__mulsi3>
	addql	IMM (8), sp
 7c4:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 7c6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 7ca:	9280           	sub.l d0,d1
	movel	d1, d0
 7cc:	2001           	move.l d1,d0
	rts
 7ce:	4e75           	rts

000007d0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 7d0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 7d4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 7d8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 7da:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 7dc:	6100 ff44      	bsr.w 722 <__udivsi3>
	addql	IMM (8), sp
 7e0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 7e2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 7e6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 7e8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 7ea:	6100 ff14      	bsr.w 700 <__mulsi3>
	addql	IMM (8), sp
 7ee:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 7f0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 7f4:	9280           	sub.l d0,d1
	movel	d1, d0
 7f6:	2001           	move.l d1,d0
	rts
 7f8:	4e75           	rts

000007fa <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 7fa:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 7fc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 800:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 804:	2c5f           	movea.l (sp)+,a6
    rts
 806:	4e75           	rts

00000808 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 808:	16c0           	move.b d0,(a3)+
	rts
 80a:	4e75           	rts
