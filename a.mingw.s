
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
  10:	23ce 0000 27e6 	move.l a6,27e6 <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,27e2 <hw>
  1c:	0000 27e2 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 076d 	lea 76d <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 27de 	move.l d0,27de <GfxBase>
	if (!GfxBase)
  32:	6700 0248      	beq.w 27c <main+0x276>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
  3c:	43f9 0000 077e 	lea 77e <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 27da 	move.l d0,27da <DOSBase>
	if (!DOSBase)
  4e:	6700 0220      	beq.w 270 <main+0x26a>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 078a 	pea 78a <incbin_colors_end+0x66>
  58:	4eb9 0000 0372 	jsr 372 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 27da 	movea.l 27da <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 27da 	movea.l 27da <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 07a6 	move.l #1958,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
  7c:	2c79 0000 27da 	movea.l 27da <DOSBase>,a6
  82:	7232           	moveq #50,d1
  84:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
  88:	247c 00f0 ff60 	movea.l #15794016,a2
  8e:	588f           	addq.l #4,sp
  90:	4a92           	tst.l (a2)
  92:	6718           	beq.s ac <main+0xa6>
  94:	4878 0001      	pea 1 <_start+0x1>
  98:	47f9 0000 02d0 	lea 2d0 <warpmode.part.0>,a3
  9e:	4e93           	jsr (a3)
  a0:	588f           	addq.l #4,sp
  a2:	4a92           	tst.l (a2)
  a4:	6706           	beq.s ac <main+0xa6>
  a6:	42a7           	clr.l -(sp)
  a8:	4e93           	jsr (a3)
  aa:	588f           	addq.l #4,sp
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
}

void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
  ac:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
  b2:	23ee 0022 0000 	move.l 34(a6),27c8 <ActiView>
  b8:	27c8 
	OwnBlitter();
  ba:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
  be:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
  c4:	4eae ff1c      	jsr -228(a6)
	Disable();
  c8:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
  ce:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
  d2:	2479 0000 27e2 	movea.l 27e2 <hw>,a2
  d8:	302a 0010      	move.w 16(a2),d0
  dc:	33c0 0000 27cc 	move.w d0,27cc <SystemADKCON>
	SystemInts=hw->intenar;
  e2:	302a 001c      	move.w 28(a2),d0
  e6:	33c0 0000 27d0 	move.w d0,27d0 <SystemInts>
	SystemDMA=hw->dmaconr;
  ec:	302a 0002      	move.w 2(a2),d0
  f0:	33c0 0000 27ce 	move.w d0,27ce <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
  f6:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
  fc:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 102:	47f9 0000 03da 	lea 3da <WaitVbl>,a3
 108:	4e93           	jsr (a3)
	WaitVbl();
 10a:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 10c:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 112:	7000           	moveq #0,d0
		hw->color[a]=0;
 114:	2200           	move.l d0,d1
 116:	0681 0000 00c0 	addi.l #192,d1
 11c:	d281           	add.l d1,d1
 11e:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 124:	5280           	addq.l #1,d0
 126:	7220           	moveq #32,d1
 128:	b280           	cmp.l d0,d1
 12a:	66e8           	bne.s 114 <main+0x10e>

	LoadView(0);
 12c:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 132:	93c9           	suba.l a1,a1
 134:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 138:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 13e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 142:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 148:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 14c:	4e93           	jsr (a3)
	WaitVbl();
 14e:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 150:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 156:	3f7c 0801 001c 	move.w #2049,28(sp)
 15c:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 162:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 168:	082e 0000 0129 	btst #0,297(a6)
 16e:	6700 0136      	beq.w 2a6 <main+0x2a0>
		vbr = (APTR)Supervisor((void*)getvbr);
 172:	7e1a           	moveq #26,d7
 174:	de8f           	add.l sp,d7
 176:	cf8d           	exg d7,a5
 178:	4eae ffe2      	jsr -30(a6)
 17c:	cf8d           	exg d7,a5

	VBR=GetVBR();
 17e:	23c0 0000 27d2 	move.l d0,27d2 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 184:	2079 0000 27d2 	movea.l 27d2 <VBR.lto_priv.0>,a0
 18a:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 18e:	23ca 0000 27d6 	move.l a2,27d6 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 194:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 196:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 198:	2079 0000 27e2 	movea.l 27e2 <hw>,a0
 19e:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 1a2:	3028 0002      	move.w 2(a0),d0
 1a6:	0800 000e      	btst #14,d0
 1aa:	66f6           	bne.s 1a2 <main+0x19c>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 1ac:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 1b2:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 1b8:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 1be:	2279 0000 27d2 	movea.l 27d2 <VBR.lto_priv.0>,a1
 1c4:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 1c8:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 1ce:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 1d4:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 1da:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 1e0:	3039 0000 27d0 	move.w 27d0 <SystemInts>,d0
 1e6:	0040 8000      	ori.w #-32768,d0
 1ea:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 1ee:	3039 0000 27ce 	move.w 27ce <SystemDMA>,d0
 1f4:	0040 8000      	ori.w #-32768,d0
 1f8:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 1fc:	3039 0000 27cc 	move.w 27cc <SystemADKCON>,d0
 202:	0040 8000      	ori.w #-32768,d0
 206:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 20a:	2279 0000 27c8 	movea.l 27c8 <ActiView>,a1
 210:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 214:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 21a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 21e:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 224:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 228:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 22e:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 232:	2c79 0000 27de 	movea.l 27de <GfxBase>,a6
 238:	4eae fe32      	jsr -462(a6)
	Enable();
 23c:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 242:	4eae ff82      	jsr -126(a6)
	RunTests();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 246:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 24c:	2279 0000 27da 	movea.l 27da <DOSBase>,a1
 252:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 256:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 25c:	2279 0000 27de 	movea.l 27de <GfxBase>,a1
 262:	4eae fe62      	jsr -414(a6)
}
 266:	7000           	moveq #0,d0
 268:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 26c:	508f           	addq.l #8,sp
 26e:	4e75           	rts
		Exit(0);
 270:	9dce           	suba.l a6,a6
 272:	7200           	moveq #0,d1
 274:	4eae ff70      	jsr -144(a6)
 278:	6000 fdd8      	bra.w 52 <main+0x4c>
		Exit(0);
 27c:	2c79 0000 27da 	movea.l 27da <DOSBase>,a6
 282:	7200           	moveq #0,d1
 284:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 288:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 28e:	43f9 0000 077e 	lea 77e <incbin_colors_end+0x5a>,a1
 294:	7000           	moveq #0,d0
 296:	4eae fdd8      	jsr -552(a6)
 29a:	23c0 0000 27da 	move.l d0,27da <DOSBase>
	if (!DOSBase)
 2a0:	6600 fdb0      	bne.w 52 <main+0x4c>
 2a4:	60ca           	bra.s 270 <main+0x26a>
	APTR vbr = 0;
 2a6:	7000           	moveq #0,d0
	VBR=GetVBR();
 2a8:	23c0 0000 27d2 	move.l d0,27d2 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 2ae:	2079 0000 27d2 	movea.l 27d2 <VBR.lto_priv.0>,a0
 2b4:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 2b8:	23ca 0000 27d6 	move.l a2,27d6 <SystemIrq>
	WaitVbl();
 2be:	4e93           	jsr (a3)
	WaitVbl();
 2c0:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 2c2:	2079 0000 27e2 	movea.l 27e2 <hw>,a0
 2c8:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 2cc:	6000 fed4      	bra.w 1a2 <main+0x19c>

000002d0 <warpmode.part.0>:
void warpmode(int on) 
 2d0:	598f           	subq.l #4,sp
 2d2:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 2d4:	4aaf 000c      	tst.l 12(sp)
 2d8:	674c           	beq.s 326 <warpmode.part.0+0x56>
 2da:	4878 0001      	pea 1 <_start+0x1>
 2de:	740b           	moveq #11,d2
 2e0:	d48f           	add.l sp,d2
 2e2:	2f02           	move.l d2,-(sp)
 2e4:	42a7           	clr.l -(sp)
 2e6:	4879 0000 0758 	pea 758 <incbin_colors_end+0x34>
 2ec:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff24bd>
 2f0:	4878 0052      	pea 52 <main+0x4c>
 2f4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0241e>
 2fa:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 2fe:	203c 0000 073e 	move.l #1854,d0
 304:	4878 0001      	pea 1 <_start+0x1>
 308:	2f02           	move.l d2,-(sp)
 30a:	42a7           	clr.l -(sp)
 30c:	2f00           	move.l d0,-(sp)
 30e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff24bd>
 312:	4878 0052      	pea 52 <main+0x4c>
 316:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0241e>
	}
}
 31c:	4fef 0018      	lea 24(sp),sp
 320:	241f           	move.l (sp)+,d2
 322:	588f           	addq.l #4,sp
 324:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 326:	4878 0001      	pea 1 <_start+0x1>
 32a:	740b           	moveq #11,d2
 32c:	d48f           	add.l sp,d2
 32e:	2f02           	move.l d2,-(sp)
 330:	42a7           	clr.l -(sp)
 332:	4879 0000 0762 	pea 762 <incbin_colors_end+0x3e>
 338:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff24bd>
 33c:	4878 0052      	pea 52 <main+0x4c>
 340:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0241e>
 346:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 34a:	203c 0000 0725 	move.l #1829,d0
 350:	4878 0001      	pea 1 <_start+0x1>
 354:	2f02           	move.l d2,-(sp)
 356:	42a7           	clr.l -(sp)
 358:	2f00           	move.l d0,-(sp)
 35a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff24bd>
 35e:	4878 0052      	pea 52 <main+0x4c>
 362:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0241e>
}
 368:	4fef 0018      	lea 24(sp),sp
 36c:	241f           	move.l (sp)+,d2
 36e:	588f           	addq.l #4,sp
 370:	4e75           	rts

00000372 <KPrintF>:
{
 372:	4fef ff80      	lea -128(sp),sp
 376:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 37a:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf0241e>
 380:	6734           	beq.s 3b6 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 382:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 388:	206f 0090      	movea.l 144(sp),a0
 38c:	43ef 0094      	lea 148(sp),a1
 390:	45f9 0000 06a0 	lea 6a0 <PutChar>,a2
 396:	47ef 000c      	lea 12(sp),a3
 39a:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 39e:	2f0b           	move.l a3,-(sp)
 3a0:	4878 0056      	pea 56 <main+0x50>
 3a4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf0241e>
 3aa:	508f           	addq.l #8,sp
}
 3ac:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 3b0:	4fef 0080      	lea 128(sp),sp
 3b4:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 3b6:	2c79 0000 27e6 	movea.l 27e6 <SysBase>,a6
 3bc:	206f 0090      	movea.l 144(sp),a0
 3c0:	43ef 0094      	lea 148(sp),a1
 3c4:	45f9 0000 0692 	lea 692 <KPutCharX>,a2
 3ca:	97cb           	suba.l a3,a3
 3cc:	4eae fdf6      	jsr -522(a6)
}
 3d0:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 3d4:	4fef 0080      	lea 128(sp),sp
 3d8:	4e75           	rts

000003da <WaitVbl>:
void WaitVbl() {
 3da:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 3dc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf14c2>,d0
 3e2:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 3e4:	2017           	move.l (sp),d0
 3e6:	0280 0001 ff00 	andi.l #130816,d0
 3ec:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 3ee:	2017           	move.l (sp),d0
 3f0:	0c80 0001 3700 	cmpi.l #79616,d0
 3f6:	67e4           	beq.s 3dc <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 3f8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf14c2>,d0
 3fe:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 402:	202f 0004      	move.l 4(sp),d0
 406:	0280 0001 ff00 	andi.l #130816,d0
 40c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 410:	202f 0004      	move.l 4(sp),d0
 414:	0c80 0001 3700 	cmpi.l #79616,d0
 41a:	66dc           	bne.s 3f8 <WaitVbl+0x1e>
}
 41c:	508f           	addq.l #8,sp
 41e:	4e75           	rts

00000420 <memcpy>:
{
 420:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 424:	202f 0014      	move.l 20(sp),d0
 428:	226f 0018      	movea.l 24(sp),a1
 42c:	222f 001c      	move.l 28(sp),d1
	while(len--)
 430:	2601           	move.l d1,d3
 432:	5383           	subq.l #1,d3
 434:	4a81           	tst.l d1
 436:	6762           	beq.s 49a <memcpy+0x7a>
 438:	2040           	movea.l d0,a0
 43a:	5888           	addq.l #4,a0
 43c:	b1c9           	cmpa.l a1,a0
 43e:	53c2           	sl.s d2
 440:	4402           	neg.b d2
 442:	41e9 0004      	lea 4(a1),a0
 446:	b1c0           	cmpa.l d0,a0
 448:	53c4           	sl.s d4
 44a:	4404           	neg.b d4
 44c:	8404           	or.b d4,d2
 44e:	7808           	moveq #8,d4
 450:	b883           	cmp.l d3,d4
 452:	55c4           	sc.s d4
 454:	4404           	neg.b d4
 456:	c404           	and.b d4,d2
 458:	6746           	beq.s 4a0 <memcpy+0x80>
 45a:	2409           	move.l a1,d2
 45c:	8480           	or.l d0,d2
 45e:	7803           	moveq #3,d4
 460:	c484           	and.l d4,d2
 462:	663c           	bne.s 4a0 <memcpy+0x80>
 464:	2049           	movea.l a1,a0
 466:	2440           	movea.l d0,a2
 468:	74fc           	moveq #-4,d2
 46a:	c481           	and.l d1,d2
 46c:	d489           	add.l a1,d2
		*d++ = *s++;
 46e:	24d8           	move.l (a0)+,(a2)+
 470:	b488           	cmp.l a0,d2
 472:	66fa           	bne.s 46e <memcpy+0x4e>
 474:	74fc           	moveq #-4,d2
 476:	c481           	and.l d1,d2
 478:	2040           	movea.l d0,a0
 47a:	d1c2           	adda.l d2,a0
 47c:	d3c2           	adda.l d2,a1
 47e:	9682           	sub.l d2,d3
 480:	b481           	cmp.l d1,d2
 482:	6716           	beq.s 49a <memcpy+0x7a>
 484:	1091           	move.b (a1),(a0)
	while(len--)
 486:	4a83           	tst.l d3
 488:	6710           	beq.s 49a <memcpy+0x7a>
		*d++ = *s++;
 48a:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 490:	5383           	subq.l #1,d3
 492:	6706           	beq.s 49a <memcpy+0x7a>
		*d++ = *s++;
 494:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 49a:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 49e:	4e75           	rts
 4a0:	2040           	movea.l d0,a0
 4a2:	d289           	add.l a1,d1
		*d++ = *s++;
 4a4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 4a6:	b289           	cmp.l a1,d1
 4a8:	67f0           	beq.s 49a <memcpy+0x7a>
		*d++ = *s++;
 4aa:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 4ac:	b289           	cmp.l a1,d1
 4ae:	66f4           	bne.s 4a4 <memcpy+0x84>
 4b0:	60e8           	bra.s 49a <memcpy+0x7a>

000004b2 <memset>:
{
 4b2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 4b6:	202f 0024      	move.l 36(sp),d0
 4ba:	2a2f 0028      	move.l 40(sp),d5
 4be:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 4c2:	2809           	move.l a1,d4
 4c4:	5384           	subq.l #1,d4
 4c6:	b2fc 0000      	cmpa.w #0,a1
 4ca:	6f00 00b0      	ble.w 57c <memset+0xca>
 4ce:	1e05           	move.b d5,d7
 4d0:	2200           	move.l d0,d1
 4d2:	4481           	neg.l d1
 4d4:	7403           	moveq #3,d2
 4d6:	c282           	and.l d2,d1
 4d8:	7c05           	moveq #5,d6
		*ptr++ = val;
 4da:	2440           	movea.l d0,a2
 4dc:	bc84           	cmp.l d4,d6
 4de:	646a           	bcc.s 54a <memset+0x98>
 4e0:	4a81           	tst.l d1
 4e2:	6724           	beq.s 508 <memset+0x56>
 4e4:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 4e6:	5384           	subq.l #1,d4
 4e8:	7401           	moveq #1,d2
 4ea:	b481           	cmp.l d1,d2
 4ec:	671a           	beq.s 508 <memset+0x56>
		*ptr++ = val;
 4ee:	2440           	movea.l d0,a2
 4f0:	548a           	addq.l #2,a2
 4f2:	2040           	movea.l d0,a0
 4f4:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 4f8:	5384           	subq.l #1,d4
 4fa:	7403           	moveq #3,d2
 4fc:	b481           	cmp.l d1,d2
 4fe:	6608           	bne.s 508 <memset+0x56>
		*ptr++ = val;
 500:	528a           	addq.l #1,a2
 502:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 506:	5384           	subq.l #1,d4
 508:	2609           	move.l a1,d3
 50a:	9681           	sub.l d1,d3
 50c:	7c00           	moveq #0,d6
 50e:	1c05           	move.b d5,d6
 510:	2406           	move.l d6,d2
 512:	4842           	swap d2
 514:	4242           	clr.w d2
 516:	2042           	movea.l d2,a0
 518:	2406           	move.l d6,d2
 51a:	e14a           	lsl.w #8,d2
 51c:	4842           	swap d2
 51e:	4242           	clr.w d2
 520:	e18e           	lsl.l #8,d6
 522:	2646           	movea.l d6,a3
 524:	2c08           	move.l a0,d6
 526:	8486           	or.l d6,d2
 528:	2c0b           	move.l a3,d6
 52a:	8486           	or.l d6,d2
 52c:	1407           	move.b d7,d2
 52e:	2040           	movea.l d0,a0
 530:	d1c1           	adda.l d1,a0
 532:	72fc           	moveq #-4,d1
 534:	c283           	and.l d3,d1
 536:	d288           	add.l a0,d1
		*ptr++ = val;
 538:	20c2           	move.l d2,(a0)+
 53a:	b1c1           	cmpa.l d1,a0
 53c:	66fa           	bne.s 538 <memset+0x86>
 53e:	72fc           	moveq #-4,d1
 540:	c283           	and.l d3,d1
 542:	d5c1           	adda.l d1,a2
 544:	9881           	sub.l d1,d4
 546:	b283           	cmp.l d3,d1
 548:	6732           	beq.s 57c <memset+0xca>
 54a:	1485           	move.b d5,(a2)
	while(len-- > 0)
 54c:	4a84           	tst.l d4
 54e:	6f2c           	ble.s 57c <memset+0xca>
		*ptr++ = val;
 550:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 554:	7201           	moveq #1,d1
 556:	b284           	cmp.l d4,d1
 558:	6c22           	bge.s 57c <memset+0xca>
		*ptr++ = val;
 55a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 55e:	7402           	moveq #2,d2
 560:	b484           	cmp.l d4,d2
 562:	6c18           	bge.s 57c <memset+0xca>
		*ptr++ = val;
 564:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 568:	7c03           	moveq #3,d6
 56a:	bc84           	cmp.l d4,d6
 56c:	6c0e           	bge.s 57c <memset+0xca>
		*ptr++ = val;
 56e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 572:	7204           	moveq #4,d1
 574:	b284           	cmp.l d4,d1
 576:	6c04           	bge.s 57c <memset+0xca>
		*ptr++ = val;
 578:	1545 0005      	move.b d5,5(a2)
}
 57c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 580:	4e75           	rts

00000582 <strlen>:
{
 582:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 586:	7000           	moveq #0,d0
	while(*s++)
 588:	4a10           	tst.b (a0)
 58a:	6708           	beq.s 594 <strlen+0x12>
		t++;
 58c:	5280           	addq.l #1,d0
	while(*s++)
 58e:	4a30 0800      	tst.b (0,a0,d0.l)
 592:	66f8           	bne.s 58c <strlen+0xa>
}
 594:	4e75           	rts
 596:	4e71           	nop

00000598 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 598:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 59c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 5a0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 5a4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 5a8:	d041           	add.w d1,d0
	swap	d0
 5aa:	4840           	swap d0
	clrw	d0
 5ac:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 5ae:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 5b2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 5b6:	d081           	add.l d1,d0

	rts
 5b8:	4e75           	rts

000005ba <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 5ba:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 5bc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 5c0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 5c4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 5ca:	6416           	bcc.s 5e2 <__udivsi3+0x28>
	movel	d0, d2
 5cc:	2400           	move.l d0,d2
	clrw	d2
 5ce:	4242           	clr.w d2
	swap	d2
 5d0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 5d2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 5d4:	3002           	move.w d2,d0
	swap	d0
 5d6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 5d8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 5dc:	84c1           	divu.w d1,d2
	movew	d2, d0
 5de:	3002           	move.w d2,d0
	jra	6f
 5e0:	6030           	bra.s 612 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 5e2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 5e4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 5e6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 5e8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 5ee:	64f4           	bcc.s 5e4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 5f0:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 5f2:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 5f8:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 5fa:	c2c0           	mulu.w d0,d1
	swap	d2
 5fc:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 5fe:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 600:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 602:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 604:	660a           	bne.s 610 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 606:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 608:	6506           	bcs.s 610 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 60a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 60e:	6302           	bls.s 612 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 610:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 612:	241f           	move.l (sp)+,d2
	rts
 614:	4e75           	rts

00000616 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 616:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 618:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 61a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 61e:	6a04           	bpl.s 624 <__divsi3+0xe>
	negl	d1
 620:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 622:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 624:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 628:	6a04           	bpl.s 62e <__divsi3+0x18>
	negl	d0
 62a:	4480           	neg.l d0
	negb	d2
 62c:	4402           	neg.b d2

2:	movel	d1, sp@-
 62e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 630:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 632:	6186           	bsr.s 5ba <__udivsi3>
	addql	IMM (8), sp
 634:	508f           	addq.l #8,sp

	tstb	d2
 636:	4a02           	tst.b d2
	jpl	3f
 638:	6a02           	bpl.s 63c <__divsi3+0x26>
	negl	d0
 63a:	4480           	neg.l d0

3:	movel	sp@+, d2
 63c:	241f           	move.l (sp)+,d2
	rts
 63e:	4e75           	rts

00000640 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 640:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 644:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 648:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 64a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 64c:	61c8           	bsr.s 616 <__divsi3>
	addql	IMM (8), sp
 64e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 650:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 654:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 656:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 658:	6100 ff3e      	bsr.w 598 <__mulsi3>
	addql	IMM (8), sp
 65c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 65e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 662:	9280           	sub.l d0,d1
	movel	d1, d0
 664:	2001           	move.l d1,d0
	rts
 666:	4e75           	rts

00000668 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 668:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 66c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 670:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 672:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 674:	6100 ff44      	bsr.w 5ba <__udivsi3>
	addql	IMM (8), sp
 678:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 67a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 67e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 680:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 682:	6100 ff14      	bsr.w 598 <__mulsi3>
	addql	IMM (8), sp
 686:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 688:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 68c:	9280           	sub.l d0,d1
	movel	d1, d0
 68e:	2001           	move.l d1,d0
	rts
 690:	4e75           	rts

00000692 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 692:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 694:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 698:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 69c:	2c5f           	movea.l (sp)+,a6
    rts
 69e:	4e75           	rts

000006a0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 6a0:	16c0           	move.b d0,(a3)+
	rts
 6a2:	4e75           	rts
