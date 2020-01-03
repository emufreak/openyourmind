
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
  10:	23ce 0001 b1ae 	move.l a6,1b1ae <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,1b1aa <hw>
  1c:	0001 b1aa 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0c75 	lea c75 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0001 b1a6 	move.l d0,1b1a6 <GfxBase>
	if (!GfxBase)
  32:	6700 05fe      	beq.w 632 <main+0x62c>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
  3c:	43f9 0000 0c86 	lea c86 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0001 b1a2 	move.l d0,1b1a2 <DOSBase>
	if (!DOSBase)
  4e:	6700 05d6      	beq.w 626 <main+0x620>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0c92 	pea c92 <incbin_colors_end+0x66>
  58:	4eb9 0000 072a 	jsr 72a <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0cae 	move.l #3246,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  DrawCopper = Copperlist1;
  7c:	23fc 0001 b110 	move.l #110864,1b18c <DrawCopper>
  82:	0001 b18c 
  ViewCopper = Copperlist2;
  86:	23fc 0001 b090 	move.l #110736,1b10c <ViewCopper>
  8c:	0001 b10c 
  ClBuild( Copperlist1);
  90:	4879 0001 b110 	pea 1b110 <Copperlist1>
  96:	4eb9 0000 0792 	jsr 792 <ClBuild>
    if( instructions[ pos+i] != batch[ i])
  9c:	508f           	addq.l #8,sp
  9e:	2039 0001 b110 	move.l 1b110 <Copperlist1>,d0
  a4:	b0b9 0000 2030 	cmp.l 2030 <ClsSprites>,d0
  aa:	6600 0536      	bne.w 5e2 <main+0x5dc>
  ae:	2239 0001 b114 	move.l 1b114 <Copperlist1+0x4>,d1
  b4:	b2b9 0000 2034 	cmp.l 2034 <ClsSprites+0x4>,d1
  ba:	6600 0526      	bne.w 5e2 <main+0x5dc>
  be:	2039 0001 b118 	move.l 1b118 <Copperlist1+0x8>,d0
  c4:	b0b9 0000 2038 	cmp.l 2038 <ClsSprites+0x8>,d0
  ca:	6600 0516      	bne.w 5e2 <main+0x5dc>
  ce:	2239 0001 b11c 	move.l 1b11c <Copperlist1+0xc>,d1
  d4:	b2b9 0000 203c 	cmp.l 203c <ClsSprites+0xc>,d1
  da:	6600 0506      	bne.w 5e2 <main+0x5dc>
  de:	2039 0001 b120 	move.l 1b120 <Copperlist1+0x10>,d0
  e4:	b0b9 0000 2040 	cmp.l 2040 <ClsSprites+0x10>,d0
  ea:	6600 04f6      	bne.w 5e2 <main+0x5dc>
  ee:	2239 0001 b124 	move.l 1b124 <Copperlist1+0x14>,d1
  f4:	b2b9 0000 2044 	cmp.l 2044 <ClsSprites+0x14>,d1
  fa:	6600 04e6      	bne.w 5e2 <main+0x5dc>
  fe:	2039 0001 b128 	move.l 1b128 <Copperlist1+0x18>,d0
 104:	b0b9 0000 2048 	cmp.l 2048 <ClsSprites+0x18>,d0
 10a:	6600 04d6      	bne.w 5e2 <main+0x5dc>
 10e:	2239 0001 b12c 	move.l 1b12c <Copperlist1+0x1c>,d1
 114:	b2b9 0000 204c 	cmp.l 204c <ClsSprites+0x1c>,d1
 11a:	6600 04c6      	bne.w 5e2 <main+0x5dc>
 11e:	2039 0001 b130 	move.l 1b130 <Copperlist1+0x20>,d0
 124:	b0b9 0000 2050 	cmp.l 2050 <ClsSprites+0x20>,d0
 12a:	6600 04b6      	bne.w 5e2 <main+0x5dc>
 12e:	2239 0001 b134 	move.l 1b134 <Copperlist1+0x24>,d1
 134:	b2b9 0000 2054 	cmp.l 2054 <ClsSprites+0x24>,d1
 13a:	6600 04a6      	bne.w 5e2 <main+0x5dc>
 13e:	2039 0001 b138 	move.l 1b138 <Copperlist1+0x28>,d0
 144:	b0b9 0000 2058 	cmp.l 2058 <ClsSprites+0x28>,d0
 14a:	6600 0496      	bne.w 5e2 <main+0x5dc>
 14e:	2239 0001 b13c 	move.l 1b13c <Copperlist1+0x2c>,d1
 154:	b2b9 0000 205c 	cmp.l 205c <ClsSprites+0x2c>,d1
 15a:	6600 0486      	bne.w 5e2 <main+0x5dc>
 15e:	2039 0001 b140 	move.l 1b140 <Copperlist1+0x30>,d0
 164:	b0b9 0000 2060 	cmp.l 2060 <ClsSprites+0x30>,d0
 16a:	6600 0476      	bne.w 5e2 <main+0x5dc>
 16e:	2239 0001 b144 	move.l 1b144 <Copperlist1+0x34>,d1
 174:	b2b9 0000 2064 	cmp.l 2064 <ClsSprites+0x34>,d1
 17a:	6600 0466      	bne.w 5e2 <main+0x5dc>
 17e:	2039 0001 b148 	move.l 1b148 <Copperlist1+0x38>,d0
 184:	b0b9 0000 2068 	cmp.l 2068 <ClsSprites+0x38>,d0
 18a:	6600 0456      	bne.w 5e2 <main+0x5dc>
 18e:	2239 0001 b14c 	move.l 1b14c <Copperlist1+0x3c>,d1
 194:	b2b9 0000 206c 	cmp.l 206c <ClsSprites+0x3c>,d1
 19a:	6600 0446      	bne.w 5e2 <main+0x5dc>
 19e:	2039 0000 2000 	move.l 2000 <ClScreen>,d0
 1a4:	b0b9 0001 b150 	cmp.l 1b150 <Copperlist1+0x40>,d0
 1aa:	6600 0458      	bne.w 604 <main+0x5fe>
 1ae:	2239 0000 2004 	move.l 2004 <ClScreen+0x4>,d1
 1b4:	b2b9 0001 b154 	cmp.l 1b154 <Copperlist1+0x44>,d1
 1ba:	6600 0448      	bne.w 604 <main+0x5fe>
 1be:	2039 0001 b158 	move.l 1b158 <Copperlist1+0x48>,d0
 1c4:	b0b9 0000 2008 	cmp.l 2008 <ClScreen+0x8>,d0
 1ca:	6600 0438      	bne.w 604 <main+0x5fe>
 1ce:	2239 0001 b15c 	move.l 1b15c <Copperlist1+0x4c>,d1
 1d4:	b2b9 0000 200c 	cmp.l 200c <ClScreen+0xc>,d1
 1da:	6600 0428      	bne.w 604 <main+0x5fe>
 1de:	2039 0001 b160 	move.l 1b160 <Copperlist1+0x50>,d0
 1e4:	b0b9 0000 2010 	cmp.l 2010 <ClScreen+0x10>,d0
 1ea:	6600 0418      	bne.w 604 <main+0x5fe>
 1ee:	2239 0001 b164 	move.l 1b164 <Copperlist1+0x54>,d1
 1f4:	b2b9 0000 2014 	cmp.l 2014 <ClScreen+0x14>,d1
 1fa:	6600 0408      	bne.w 604 <main+0x5fe>
 1fe:	2039 0001 b168 	move.l 1b168 <Copperlist1+0x58>,d0
 204:	b0b9 0000 2018 	cmp.l 2018 <ClScreen+0x18>,d0
 20a:	6600 03f8      	bne.w 604 <main+0x5fe>
 20e:	2239 0001 b16c 	move.l 1b16c <Copperlist1+0x5c>,d1
 214:	b2b9 0000 201c 	cmp.l 201c <ClScreen+0x1c>,d1
 21a:	6600 03e8      	bne.w 604 <main+0x5fe>
 21e:	2039 0001 b170 	move.l 1b170 <Copperlist1+0x60>,d0
 224:	b0b9 0000 2020 	cmp.l 2020 <ClScreen+0x20>,d0
 22a:	6600 03d8      	bne.w 604 <main+0x5fe>
 22e:	2239 0001 b174 	move.l 1b174 <Copperlist1+0x64>,d1
 234:	b2b9 0000 2024 	cmp.l 2024 <ClScreen+0x24>,d1
 23a:	6600 03c8      	bne.w 604 <main+0x5fe>
 23e:	2039 0001 b178 	move.l 1b178 <Copperlist1+0x68>,d0
 244:	b0b9 0000 2028 	cmp.l 2028 <ClScreen+0x28>,d0
 24a:	6600 03b8      	bne.w 604 <main+0x5fe>
 24e:	2239 0001 b17c 	move.l 1b17c <Copperlist1+0x6c>,d1
 254:	b2b9 0000 202c 	cmp.l 202c <ClScreen+0x2c>,d1
 25a:	6600 03a8      	bne.w 604 <main+0x5fe>
}
void SetBplPointers() {
  UWORD highword = (ULONG)DrawBuffer >> 16;
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
  
  *CopBpl1Low = lowword;
 25e:	2079 0000 2084 	movea.l 2084 <CopBpl1Low>,a0
 264:	4250           	clr.w (a0)
  *CopBpl1High = highword;
 266:	2079 0000 2080 	movea.l 2080 <CopBpl1High>,a0
 26c:	30bc 0004      	move.w #4,(a0)
  
  ULONG tmp = DrawBuffer;
  DrawBuffer = ViewBuffer;
 270:	23fc 0005 0000 	move.l #327680,1b08c <DrawBuffer>
 276:	0001 b08c 
  ViewBuffer = tmp;
 27a:	23fc 0004 0000 	move.l #262144,1b088 <ViewBuffer>
 280:	0001 b088 
  if( instructions[pos] == value ) 
 284:	0cb9 00e0 0004 	cmpi.l #14680068,1b180 <Copperlist1+0x70>
 28a:	0001 b180 
 28e:	671e           	beq.s 2ae <main+0x2a8>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
 290:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 296:	4eae ffc4      	jsr -60(a6)
 29a:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 2a0:	2200           	move.l d0,d1
 2a2:	243c 0000 0cbe 	move.l #3262,d2
 2a8:	763c           	moveq #60,d3
 2aa:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2ae:	0cb9 00e2 0000 	cmpi.l #14811136,1b184 <Copperlist1+0x74>
 2b4:	0001 b184 
 2b8:	671e           	beq.s 2d8 <main+0x2d2>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
 2ba:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 2c0:	4eae ffc4      	jsr -60(a6)
 2c4:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 2ca:	2200           	move.l d0,d1
 2cc:	243c 0000 0cfb 	move.l #3323,d2
 2d2:	763c           	moveq #60,d3
 2d4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 2d8:	70fe           	moveq #-2,d0
 2da:	b0b9 0001 b188 	cmp.l 1b188 <Copperlist1+0x78>,d0
 2e0:	671e           	beq.s 300 <main+0x2fa>
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if( TestCopperlistPos( Copperlist1, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 2e2:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 2e8:	4eae ffc4      	jsr -60(a6)
 2ec:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 2f2:	2200           	move.l d0,d1
 2f4:	243c 0000 0d38 	move.l #3384,d2
 2fa:	761f           	moveq #31,d3
 2fc:	4eae ffd0      	jsr -48(a6)
}

void SwapCl() {
  ULONG tmp = DrawCopper;
 300:	2239 0001 b18c 	move.l 1b18c <DrawCopper>,d1
  DrawCopper = ViewCopper;
 306:	2039 0001 b10c 	move.l 1b10c <ViewCopper>,d0
 30c:	23c0 0001 b18c 	move.l d0,1b18c <DrawCopper>
  ViewCopper = tmp;
 312:	23c1 0001 b10c 	move.l d1,1b10c <ViewCopper>
  
  SwapCl();
  if( DrawCopper != &Copperlist2)
 318:	0c80 0001 b090 	cmpi.l #110736,d0
 31e:	671e           	beq.s 33e <main+0x338>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
 320:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 326:	4eae ffc4      	jsr -60(a6)
 32a:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 330:	2200           	move.l d0,d1
 332:	243c 0000 0d5a 	move.l #3418,d2
 338:	7615           	moveq #21,d3
 33a:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
 33e:	45f9 0000 08a0 	lea 8a0 <PrepareDisplay>,a2
 344:	4e92           	jsr (a2)
  if( DrawBuffer != Bitplane1) 
 346:	0cb9 0000 e888 	cmpi.l #59528,1b08c <DrawBuffer>
 34c:	0001 b08c 
 350:	671e           	beq.s 370 <main+0x36a>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
 352:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 358:	4eae ffc4      	jsr -60(a6)
 35c:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 362:	2200           	move.l d0,d1
 364:	243c 0000 0d70 	move.l #3440,d2
 36a:	7637           	moveq #55,d3
 36c:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
 370:	0cb9 0001 b110 	cmpi.l #110864,1b18c <DrawCopper>
 376:	0001 b18c 
 37a:	671e           	beq.s 39a <main+0x394>
    Write( Output(), 
 37c:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 382:	4eae ffc4      	jsr -60(a6)
 386:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 38c:	2200           	move.l d0,d1
 38e:	243c 0000 0da8 	move.l #3496,d2
 394:	7639           	moveq #57,d3
 396:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
 39a:	4e92           	jsr (a2)
  if( ViewBuffer != Bitplane2) 
 39c:	0cb9 0000 2088 	cmpi.l #8328,1b088 <ViewBuffer>
 3a2:	0001 b088 
 3a6:	671e           	beq.s 3c6 <main+0x3c0>
    Write( Output(), 
 3a8:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 3ae:	4eae ffc4      	jsr -60(a6)
 3b2:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 3b8:	2200           	move.l d0,d1
 3ba:	243c 0000 0de2 	move.l #3554,d2
 3c0:	7638           	moveq #56,d3
 3c2:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
 3c6:	0cb9 0001 b090 	cmpi.l #110736,1b10c <ViewCopper>
 3cc:	0001 b10c 
 3d0:	671e           	beq.s 3f0 <main+0x3ea>
    Write( Output(), 
 3d2:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 3d8:	4eae ffc4      	jsr -60(a6)
 3dc:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 3e2:	2200           	move.l d0,d1
 3e4:	243c 0000 0e1b 	move.l #3611,d2
 3ea:	763a           	moveq #58,d3
 3ec:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 3f0:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 3f6:	7232           	moveq #50,d1
 3f8:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 3fc:	247c 00f0 ff60 	movea.l #15794016,a2
 402:	4a92           	tst.l (a2)
 404:	6718           	beq.s 41e <main+0x418>
 406:	4878 0001      	pea 1 <_start+0x1>
 40a:	47f9 0000 0688 	lea 688 <warpmode.part.0>,a3
 410:	4e93           	jsr (a3)
 412:	588f           	addq.l #4,sp
 414:	4a92           	tst.l (a2)
 416:	6706           	beq.s 41e <main+0x418>
 418:	42a7           	clr.l -(sp)
 41a:	4e93           	jsr (a3)
 41c:	588f           	addq.l #4,sp
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 41e:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 424:	23ee 0022 0001 	move.l 34(a6),1b190 <ActiView>
 42a:	b190 
	OwnBlitter();
 42c:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 430:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 436:	4eae ff1c      	jsr -228(a6)
	Disable();
 43a:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 440:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 444:	2479 0001 b1aa 	movea.l 1b1aa <hw>,a2
 44a:	302a 0010      	move.w 16(a2),d0
 44e:	33c0 0001 b194 	move.w d0,1b194 <SystemADKCON>
	SystemInts=hw->intenar;
 454:	302a 001c      	move.w 28(a2),d0
 458:	33c0 0001 b198 	move.w d0,1b198 <SystemInts>
	SystemDMA=hw->dmaconr;
 45e:	302a 0002      	move.w 2(a2),d0
 462:	33c0 0001 b196 	move.w d0,1b196 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 468:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 46e:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 474:	47f9 0000 08e4 	lea 8e4 <WaitVbl>,a3
 47a:	4e93           	jsr (a3)
	WaitVbl();
 47c:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 47e:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 484:	7000           	moveq #0,d0
		hw->color[a]=0;
 486:	2200           	move.l d0,d1
 488:	0681 0000 00c0 	addi.l #192,d1
 48e:	d281           	add.l d1,d1
 490:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 496:	5280           	addq.l #1,d0
 498:	7220           	moveq #32,d1
 49a:	b280           	cmp.l d0,d1
 49c:	66e8           	bne.s 486 <main+0x480>

	LoadView(0);
 49e:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 4a4:	93c9           	suba.l a1,a1
 4a6:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 4aa:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 4b0:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 4b4:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 4ba:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 4be:	4e93           	jsr (a3)
	WaitVbl();
 4c0:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 4c2:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 4c8:	3f7c 0801 001c 	move.w #2049,28(sp)
 4ce:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 4d4:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 4da:	082e 0000 0129 	btst #0,297(a6)
 4e0:	6700 017a      	beq.w 65c <main+0x656>
		vbr = (APTR)Supervisor((void*)getvbr);
 4e4:	7e1a           	moveq #26,d7
 4e6:	de8f           	add.l sp,d7
 4e8:	cf8d           	exg d7,a5
 4ea:	4eae ffe2      	jsr -30(a6)
 4ee:	cf8d           	exg d7,a5

	VBR=GetVBR();
 4f0:	23c0 0001 b19a 	move.l d0,1b19a <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 4f6:	2079 0001 b19a 	movea.l 1b19a <VBR.lto_priv.0>,a0
 4fc:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 500:	23ca 0001 b19e 	move.l a2,1b19e <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 506:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 508:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 50a:	2079 0001 b1aa 	movea.l 1b1aa <hw>,a0
 510:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 514:	3028 0002      	move.w 2(a0),d0
 518:	0800 000e      	btst #14,d0
 51c:	66f6           	bne.s 514 <main+0x50e>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 51e:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 524:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 52a:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 530:	2279 0001 b19a 	movea.l 1b19a <VBR.lto_priv.0>,a1
 536:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 53a:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 540:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 546:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 54c:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 552:	3039 0001 b198 	move.w 1b198 <SystemInts>,d0
 558:	0040 8000      	ori.w #-32768,d0
 55c:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 560:	3039 0001 b196 	move.w 1b196 <SystemDMA>,d0
 566:	0040 8000      	ori.w #-32768,d0
 56a:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 56e:	3039 0001 b194 	move.w 1b194 <SystemADKCON>,d0
 574:	0040 8000      	ori.w #-32768,d0
 578:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 57c:	2279 0001 b190 	movea.l 1b190 <ActiView>,a1
 582:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 586:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 58c:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 590:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 596:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 59a:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 5a0:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 5a4:	2c79 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a6
 5aa:	4eae fe32      	jsr -462(a6)
	Enable();
 5ae:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 5b4:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 5b8:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 5be:	2279 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a1
 5c4:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 5c8:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 5ce:	2279 0001 b1a6 	movea.l 1b1a6 <GfxBase>,a1
 5d4:	4eae fe62      	jsr -414(a6)
}
 5d8:	7000           	moveq #0,d0
 5da:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 5de:	508f           	addq.l #8,sp
 5e0:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 5e2:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 5e8:	4eae ffc4      	jsr -60(a6)
 5ec:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 5f2:	2200           	move.l d0,d1
 5f4:	243c 0000 0e8d 	move.l #3725,d2
 5fa:	762c           	moveq #44,d3
 5fc:	4eae ffd0      	jsr -48(a6)
 600:	6000 fb9c      	bra.w 19e <main+0x198>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 604:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 60a:	4eae ffc4      	jsr -60(a6)
 60e:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 614:	2200           	move.l d0,d1
 616:	243c 0000 0e56 	move.l #3670,d2
 61c:	7636           	moveq #54,d3
 61e:	4eae ffd0      	jsr -48(a6)
 622:	6000 fc3a      	bra.w 25e <main+0x258>
		Exit(0);
 626:	9dce           	suba.l a6,a6
 628:	7200           	moveq #0,d1
 62a:	4eae ff70      	jsr -144(a6)
 62e:	6000 fa22      	bra.w 52 <main+0x4c>
		Exit(0);
 632:	2c79 0001 b1a2 	movea.l 1b1a2 <DOSBase>,a6
 638:	7200           	moveq #0,d1
 63a:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 63e:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 644:	43f9 0000 0c86 	lea c86 <incbin_colors_end+0x5a>,a1
 64a:	7000           	moveq #0,d0
 64c:	4eae fdd8      	jsr -552(a6)
 650:	23c0 0001 b1a2 	move.l d0,1b1a2 <DOSBase>
	if (!DOSBase)
 656:	6600 f9fa      	bne.w 52 <main+0x4c>
 65a:	60ca           	bra.s 626 <main+0x620>
	APTR vbr = 0;
 65c:	7000           	moveq #0,d0
	VBR=GetVBR();
 65e:	23c0 0001 b19a 	move.l d0,1b19a <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 664:	2079 0001 b19a 	movea.l 1b19a <VBR.lto_priv.0>,a0
 66a:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 66e:	23ca 0001 b19e 	move.l a2,1b19e <SystemIrq>
	WaitVbl();
 674:	4e93           	jsr (a3)
	WaitVbl();
 676:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 678:	2079 0001 b1aa 	movea.l 1b1aa <hw>,a0
 67e:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 682:	6000 fe90      	bra.w 514 <main+0x50e>
 686:	4e71           	nop

00000688 <warpmode.part.0>:
void warpmode(int on) 
 688:	598f           	subq.l #4,sp
 68a:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 68c:	4aaf 000c      	tst.l 12(sp)
 690:	674c           	beq.s 6de <warpmode.part.0+0x56>
 692:	4878 0001      	pea 1 <_start+0x1>
 696:	740b           	moveq #11,d2
 698:	d48f           	add.l sp,d2
 69a:	2f02           	move.l d2,-(sp)
 69c:	42a7           	clr.l -(sp)
 69e:	4879 0000 0c60 	pea c60 <incbin_colors_end+0x34>
 6a4:	4878 ffff      	pea ffffffff <_end+0xfffe4e4b>
 6a8:	4878 0052      	pea 52 <main+0x4c>
 6ac:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4dac>
 6b2:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 6b6:	203c 0000 0c46 	move.l #3142,d0
 6bc:	4878 0001      	pea 1 <_start+0x1>
 6c0:	2f02           	move.l d2,-(sp)
 6c2:	42a7           	clr.l -(sp)
 6c4:	2f00           	move.l d0,-(sp)
 6c6:	4878 ffff      	pea ffffffff <_end+0xfffe4e4b>
 6ca:	4878 0052      	pea 52 <main+0x4c>
 6ce:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4dac>
	}
}
 6d4:	4fef 0018      	lea 24(sp),sp
 6d8:	241f           	move.l (sp)+,d2
 6da:	588f           	addq.l #4,sp
 6dc:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 6de:	4878 0001      	pea 1 <_start+0x1>
 6e2:	740b           	moveq #11,d2
 6e4:	d48f           	add.l sp,d2
 6e6:	2f02           	move.l d2,-(sp)
 6e8:	42a7           	clr.l -(sp)
 6ea:	4879 0000 0c6a 	pea c6a <incbin_colors_end+0x3e>
 6f0:	4878 ffff      	pea ffffffff <_end+0xfffe4e4b>
 6f4:	4878 0052      	pea 52 <main+0x4c>
 6f8:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4dac>
 6fe:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 702:	203c 0000 0c2d 	move.l #3117,d0
 708:	4878 0001      	pea 1 <_start+0x1>
 70c:	2f02           	move.l d2,-(sp)
 70e:	42a7           	clr.l -(sp)
 710:	2f00           	move.l d0,-(sp)
 712:	4878 ffff      	pea ffffffff <_end+0xfffe4e4b>
 716:	4878 0052      	pea 52 <main+0x4c>
 71a:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4dac>
}
 720:	4fef 0018      	lea 24(sp),sp
 724:	241f           	move.l (sp)+,d2
 726:	588f           	addq.l #4,sp
 728:	4e75           	rts

0000072a <KPrintF>:
{
 72a:	4fef ff80      	lea -128(sp),sp
 72e:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 732:	4ab9 00f0 ff60 	tst.l f0ff60 <_end+0xef4dac>
 738:	6734           	beq.s 76e <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 73a:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 740:	206f 0090      	movea.l 144(sp),a0
 744:	43ef 0094      	lea 148(sp),a1
 748:	45f9 0000 0ba8 	lea ba8 <PutChar>,a2
 74e:	47ef 000c      	lea 12(sp),a3
 752:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 756:	2f0b           	move.l a3,-(sp)
 758:	4878 0056      	pea 56 <main+0x50>
 75c:	4eb9 00f0 ff60 	jsr f0ff60 <_end+0xef4dac>
 762:	508f           	addq.l #8,sp
}
 764:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 768:	4fef 0080      	lea 128(sp),sp
 76c:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 76e:	2c79 0001 b1ae 	movea.l 1b1ae <SysBase>,a6
 774:	206f 0090      	movea.l 144(sp),a0
 778:	43ef 0094      	lea 148(sp),a1
 77c:	45f9 0000 0b9a 	lea b9a <KPutCharX>,a2
 782:	97cb           	suba.l a3,a3
 784:	4eae fdf6      	jsr -522(a6)
}
 788:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 78c:	4fef 0080      	lea 128(sp),sp
 790:	4e75           	rts

00000792 <ClBuild>:
void ClBuild(  ULONG *cl) {
 792:	206f 0004      	movea.l 4(sp),a0
    *cl++ = *clpartinstruction++;
 796:	20b9 0000 2030 	move.l 2030 <ClsSprites>,(a0)
 79c:	2179 0000 2034 	move.l 2034 <ClsSprites+0x4>,4(a0)
 7a2:	0004 
 7a4:	2179 0000 2038 	move.l 2038 <ClsSprites+0x8>,8(a0)
 7aa:	0008 
 7ac:	2179 0000 203c 	move.l 203c <ClsSprites+0xc>,12(a0)
 7b2:	000c 
 7b4:	2179 0000 2040 	move.l 2040 <ClsSprites+0x10>,16(a0)
 7ba:	0010 
 7bc:	2179 0000 2044 	move.l 2044 <ClsSprites+0x14>,20(a0)
 7c2:	0014 
 7c4:	2179 0000 2048 	move.l 2048 <ClsSprites+0x18>,24(a0)
 7ca:	0018 
 7cc:	2179 0000 204c 	move.l 204c <ClsSprites+0x1c>,28(a0)
 7d2:	001c 
 7d4:	2179 0000 2050 	move.l 2050 <ClsSprites+0x20>,32(a0)
 7da:	0020 
 7dc:	2179 0000 2054 	move.l 2054 <ClsSprites+0x24>,36(a0)
 7e2:	0024 
 7e4:	2179 0000 2058 	move.l 2058 <ClsSprites+0x28>,40(a0)
 7ea:	0028 
 7ec:	2179 0000 205c 	move.l 205c <ClsSprites+0x2c>,44(a0)
 7f2:	002c 
 7f4:	2179 0000 2060 	move.l 2060 <ClsSprites+0x30>,48(a0)
 7fa:	0030 
 7fc:	2179 0000 2064 	move.l 2064 <ClsSprites+0x34>,52(a0)
 802:	0034 
 804:	2179 0000 2068 	move.l 2068 <ClsSprites+0x38>,56(a0)
 80a:	0038 
 80c:	2179 0000 206c 	move.l 206c <ClsSprites+0x3c>,60(a0)
 812:	003c 
    *cl++ = *clpartinstruction++;
 814:	2179 0000 2000 	move.l 2000 <ClScreen>,64(a0)
 81a:	0040 
 81c:	2179 0000 2004 	move.l 2004 <ClScreen+0x4>,68(a0)
 822:	0044 
 824:	2179 0000 2008 	move.l 2008 <ClScreen+0x8>,72(a0)
 82a:	0048 
 82c:	2179 0000 200c 	move.l 200c <ClScreen+0xc>,76(a0)
 832:	004c 
 834:	2179 0000 2010 	move.l 2010 <ClScreen+0x10>,80(a0)
 83a:	0050 
 83c:	2179 0000 2014 	move.l 2014 <ClScreen+0x14>,84(a0)
 842:	0054 
 844:	2179 0000 2018 	move.l 2018 <ClScreen+0x18>,88(a0)
 84a:	0058 
 84c:	2179 0000 201c 	move.l 201c <ClScreen+0x1c>,92(a0)
 852:	005c 
 854:	2179 0000 2020 	move.l 2020 <ClScreen+0x20>,96(a0)
 85a:	0060 
 85c:	2179 0000 2024 	move.l 2024 <ClScreen+0x24>,100(a0)
 862:	0064 
 864:	2179 0000 2028 	move.l 2028 <ClScreen+0x28>,104(a0)
 86a:	0068 
 86c:	2179 0000 202c 	move.l 202c <ClScreen+0x2c>,108(a0)
 872:	006c 
  CopBpl1High = (long) cl + 2;
 874:	43e8 0072      	lea 114(a0),a1
 878:	23c9 0000 2080 	move.l a1,2080 <CopBpl1High>
  *cl++ = 0x00e00000;
 87e:	217c 00e0 0000 	move.l #14680064,112(a0)
 884:	0070 
  CopBpl1Low = (long) cl + 2;
 886:	43e8 0076      	lea 118(a0),a1
 88a:	23c9 0000 2084 	move.l a1,2084 <CopBpl1Low>
  *cl++ = 0x00e20000;
 890:	217c 00e2 0000 	move.l #14811136,116(a0)
 896:	0074 
  *cl = 0xfffffffe;
 898:	70fe           	moveq #-2,d0
 89a:	2140 0078      	move.l d0,120(a0)
}
 89e:	4e75           	rts

000008a0 <PrepareDisplay>:
void PrepareDisplay() {
 8a0:	2f0a           	move.l a2,-(sp)
  ClBuild( Copperlist1);
 8a2:	4879 0001 b110 	pea 1b110 <Copperlist1>
 8a8:	45fa fee8      	lea 792 <ClBuild>(pc),a2
 8ac:	4e92           	jsr (a2)
  ClBuild( Copperlist2);
 8ae:	4879 0001 b090 	pea 1b090 <Copperlist2>
 8b4:	4e92           	jsr (a2)
  DrawBuffer = Bitplane1;
 8b6:	23fc 0000 e888 	move.l #59528,1b08c <DrawBuffer>
 8bc:	0001 b08c 
  DrawCopper = Copperlist1;
 8c0:	23fc 0001 b110 	move.l #110864,1b18c <DrawCopper>
 8c6:	0001 b18c 
  ViewBuffer = Bitplane2;
 8ca:	23fc 0000 2088 	move.l #8328,1b088 <ViewBuffer>
 8d0:	0001 b088 
  ViewCopper = Copperlist2;
 8d4:	23fc 0001 b090 	move.l #110736,1b10c <ViewCopper>
 8da:	0001 b10c 
 8de:	508f           	addq.l #8,sp
}
 8e0:	245f           	movea.l (sp)+,a2
 8e2:	4e75           	rts

000008e4 <WaitVbl>:
void WaitVbl() {
 8e4:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 8e6:	2039 00df f004 	move.l dff004 <_end+0xde3e50>,d0
 8ec:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 8ee:	2017           	move.l (sp),d0
 8f0:	0280 0001 ff00 	andi.l #130816,d0
 8f6:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 8f8:	2017           	move.l (sp),d0
 8fa:	0c80 0001 3700 	cmpi.l #79616,d0
 900:	67e4           	beq.s 8e6 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 902:	2039 00df f004 	move.l dff004 <_end+0xde3e50>,d0
 908:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 90c:	202f 0004      	move.l 4(sp),d0
 910:	0280 0001 ff00 	andi.l #130816,d0
 916:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 91a:	202f 0004      	move.l 4(sp),d0
 91e:	0c80 0001 3700 	cmpi.l #79616,d0
 924:	66dc           	bne.s 902 <WaitVbl+0x1e>
}
 926:	508f           	addq.l #8,sp
 928:	4e75           	rts

0000092a <memcpy>:
{
 92a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 92e:	202f 0014      	move.l 20(sp),d0
 932:	226f 0018      	movea.l 24(sp),a1
 936:	222f 001c      	move.l 28(sp),d1
	while(len--)
 93a:	2601           	move.l d1,d3
 93c:	5383           	subq.l #1,d3
 93e:	4a81           	tst.l d1
 940:	6762           	beq.s 9a4 <memcpy+0x7a>
 942:	2040           	movea.l d0,a0
 944:	5888           	addq.l #4,a0
 946:	b1c9           	cmpa.l a1,a0
 948:	53c2           	sl.s d2
 94a:	4402           	neg.b d2
 94c:	41e9 0004      	lea 4(a1),a0
 950:	b1c0           	cmpa.l d0,a0
 952:	53c4           	sl.s d4
 954:	4404           	neg.b d4
 956:	8404           	or.b d4,d2
 958:	7808           	moveq #8,d4
 95a:	b883           	cmp.l d3,d4
 95c:	55c4           	sc.s d4
 95e:	4404           	neg.b d4
 960:	c404           	and.b d4,d2
 962:	6746           	beq.s 9aa <memcpy+0x80>
 964:	2409           	move.l a1,d2
 966:	8480           	or.l d0,d2
 968:	7803           	moveq #3,d4
 96a:	c484           	and.l d4,d2
 96c:	663c           	bne.s 9aa <memcpy+0x80>
 96e:	2049           	movea.l a1,a0
 970:	2440           	movea.l d0,a2
 972:	74fc           	moveq #-4,d2
 974:	c481           	and.l d1,d2
 976:	d489           	add.l a1,d2
		*d++ = *s++;
 978:	24d8           	move.l (a0)+,(a2)+
 97a:	b488           	cmp.l a0,d2
 97c:	66fa           	bne.s 978 <memcpy+0x4e>
 97e:	74fc           	moveq #-4,d2
 980:	c481           	and.l d1,d2
 982:	2040           	movea.l d0,a0
 984:	d1c2           	adda.l d2,a0
 986:	d3c2           	adda.l d2,a1
 988:	9682           	sub.l d2,d3
 98a:	b481           	cmp.l d1,d2
 98c:	6716           	beq.s 9a4 <memcpy+0x7a>
 98e:	1091           	move.b (a1),(a0)
	while(len--)
 990:	4a83           	tst.l d3
 992:	6710           	beq.s 9a4 <memcpy+0x7a>
		*d++ = *s++;
 994:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 99a:	5383           	subq.l #1,d3
 99c:	6706           	beq.s 9a4 <memcpy+0x7a>
		*d++ = *s++;
 99e:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 9a4:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 9a8:	4e75           	rts
 9aa:	2040           	movea.l d0,a0
 9ac:	d289           	add.l a1,d1
		*d++ = *s++;
 9ae:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 9b0:	b289           	cmp.l a1,d1
 9b2:	67f0           	beq.s 9a4 <memcpy+0x7a>
		*d++ = *s++;
 9b4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 9b6:	b289           	cmp.l a1,d1
 9b8:	66f4           	bne.s 9ae <memcpy+0x84>
 9ba:	60e8           	bra.s 9a4 <memcpy+0x7a>

000009bc <memset>:
{
 9bc:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 9c0:	202f 0024      	move.l 36(sp),d0
 9c4:	2a2f 0028      	move.l 40(sp),d5
 9c8:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 9cc:	2809           	move.l a1,d4
 9ce:	5384           	subq.l #1,d4
 9d0:	b2fc 0000      	cmpa.w #0,a1
 9d4:	6f00 00b0      	ble.w a86 <memset+0xca>
 9d8:	1e05           	move.b d5,d7
 9da:	2200           	move.l d0,d1
 9dc:	4481           	neg.l d1
 9de:	7403           	moveq #3,d2
 9e0:	c282           	and.l d2,d1
 9e2:	7c05           	moveq #5,d6
		*ptr++ = val;
 9e4:	2440           	movea.l d0,a2
 9e6:	bc84           	cmp.l d4,d6
 9e8:	646a           	bcc.s a54 <memset+0x98>
 9ea:	4a81           	tst.l d1
 9ec:	6724           	beq.s a12 <memset+0x56>
 9ee:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 9f0:	5384           	subq.l #1,d4
 9f2:	7401           	moveq #1,d2
 9f4:	b481           	cmp.l d1,d2
 9f6:	671a           	beq.s a12 <memset+0x56>
		*ptr++ = val;
 9f8:	2440           	movea.l d0,a2
 9fa:	548a           	addq.l #2,a2
 9fc:	2040           	movea.l d0,a0
 9fe:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 a02:	5384           	subq.l #1,d4
 a04:	7403           	moveq #3,d2
 a06:	b481           	cmp.l d1,d2
 a08:	6608           	bne.s a12 <memset+0x56>
		*ptr++ = val;
 a0a:	528a           	addq.l #1,a2
 a0c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 a10:	5384           	subq.l #1,d4
 a12:	2609           	move.l a1,d3
 a14:	9681           	sub.l d1,d3
 a16:	7c00           	moveq #0,d6
 a18:	1c05           	move.b d5,d6
 a1a:	2406           	move.l d6,d2
 a1c:	4842           	swap d2
 a1e:	4242           	clr.w d2
 a20:	2042           	movea.l d2,a0
 a22:	2406           	move.l d6,d2
 a24:	e14a           	lsl.w #8,d2
 a26:	4842           	swap d2
 a28:	4242           	clr.w d2
 a2a:	e18e           	lsl.l #8,d6
 a2c:	2646           	movea.l d6,a3
 a2e:	2c08           	move.l a0,d6
 a30:	8486           	or.l d6,d2
 a32:	2c0b           	move.l a3,d6
 a34:	8486           	or.l d6,d2
 a36:	1407           	move.b d7,d2
 a38:	2040           	movea.l d0,a0
 a3a:	d1c1           	adda.l d1,a0
 a3c:	72fc           	moveq #-4,d1
 a3e:	c283           	and.l d3,d1
 a40:	d288           	add.l a0,d1
		*ptr++ = val;
 a42:	20c2           	move.l d2,(a0)+
 a44:	b1c1           	cmpa.l d1,a0
 a46:	66fa           	bne.s a42 <memset+0x86>
 a48:	72fc           	moveq #-4,d1
 a4a:	c283           	and.l d3,d1
 a4c:	d5c1           	adda.l d1,a2
 a4e:	9881           	sub.l d1,d4
 a50:	b283           	cmp.l d3,d1
 a52:	6732           	beq.s a86 <memset+0xca>
 a54:	1485           	move.b d5,(a2)
	while(len-- > 0)
 a56:	4a84           	tst.l d4
 a58:	6f2c           	ble.s a86 <memset+0xca>
		*ptr++ = val;
 a5a:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 a5e:	7201           	moveq #1,d1
 a60:	b284           	cmp.l d4,d1
 a62:	6c22           	bge.s a86 <memset+0xca>
		*ptr++ = val;
 a64:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 a68:	7402           	moveq #2,d2
 a6a:	b484           	cmp.l d4,d2
 a6c:	6c18           	bge.s a86 <memset+0xca>
		*ptr++ = val;
 a6e:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 a72:	7c03           	moveq #3,d6
 a74:	bc84           	cmp.l d4,d6
 a76:	6c0e           	bge.s a86 <memset+0xca>
		*ptr++ = val;
 a78:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 a7c:	7204           	moveq #4,d1
 a7e:	b284           	cmp.l d4,d1
 a80:	6c04           	bge.s a86 <memset+0xca>
		*ptr++ = val;
 a82:	1545 0005      	move.b d5,5(a2)
}
 a86:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 a8a:	4e75           	rts

00000a8c <strlen>:
{
 a8c:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 a90:	7000           	moveq #0,d0
	while(*s++)
 a92:	4a10           	tst.b (a0)
 a94:	6708           	beq.s a9e <strlen+0x12>
		t++;
 a96:	5280           	addq.l #1,d0
	while(*s++)
 a98:	4a30 0800      	tst.b (0,a0,d0.l)
 a9c:	66f8           	bne.s a96 <strlen+0xa>
}
 a9e:	4e75           	rts

00000aa0 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 aa0:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 aa4:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 aa8:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 aac:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 ab0:	d041           	add.w d1,d0
	swap	d0
 ab2:	4840           	swap d0
	clrw	d0
 ab4:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 ab6:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 aba:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 abe:	d081           	add.l d1,d0

	rts
 ac0:	4e75           	rts

00000ac2 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 ac2:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 ac4:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 ac8:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 acc:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 ad2:	6416           	bcc.s aea <__udivsi3+0x28>
	movel	d0, d2
 ad4:	2400           	move.l d0,d2
	clrw	d2
 ad6:	4242           	clr.w d2
	swap	d2
 ad8:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 ada:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 adc:	3002           	move.w d2,d0
	swap	d0
 ade:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 ae0:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 ae4:	84c1           	divu.w d1,d2
	movew	d2, d0
 ae6:	3002           	move.w d2,d0
	jra	6f
 ae8:	6030           	bra.s b1a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 aea:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 aec:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 aee:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 af0:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 af6:	64f4           	bcc.s aec <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 af8:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 afa:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 b00:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 b02:	c2c0           	mulu.w d0,d1
	swap	d2
 b04:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 b06:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 b08:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 b0a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 b0c:	660a           	bne.s b18 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 b0e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 b10:	6506           	bcs.s b18 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 b12:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 b16:	6302           	bls.s b1a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 b18:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 b1a:	241f           	move.l (sp)+,d2
	rts
 b1c:	4e75           	rts

00000b1e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 b1e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 b20:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 b22:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 b26:	6a04           	bpl.s b2c <__divsi3+0xe>
	negl	d1
 b28:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 b2a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 b2c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 b30:	6a04           	bpl.s b36 <__divsi3+0x18>
	negl	d0
 b32:	4480           	neg.l d0
	negb	d2
 b34:	4402           	neg.b d2

2:	movel	d1, sp@-
 b36:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 b38:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 b3a:	6186           	bsr.s ac2 <__udivsi3>
	addql	IMM (8), sp
 b3c:	508f           	addq.l #8,sp

	tstb	d2
 b3e:	4a02           	tst.b d2
	jpl	3f
 b40:	6a02           	bpl.s b44 <__divsi3+0x26>
	negl	d0
 b42:	4480           	neg.l d0

3:	movel	sp@+, d2
 b44:	241f           	move.l (sp)+,d2
	rts
 b46:	4e75           	rts

00000b48 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 b48:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 b4c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 b50:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 b52:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 b54:	61c8           	bsr.s b1e <__divsi3>
	addql	IMM (8), sp
 b56:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 b58:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 b5c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 b5e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 b60:	6100 ff3e      	bsr.w aa0 <__mulsi3>
	addql	IMM (8), sp
 b64:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 b66:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 b6a:	9280           	sub.l d0,d1
	movel	d1, d0
 b6c:	2001           	move.l d1,d0
	rts
 b6e:	4e75           	rts

00000b70 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 b70:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 b74:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 b78:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 b7a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 b7c:	6100 ff44      	bsr.w ac2 <__udivsi3>
	addql	IMM (8), sp
 b80:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 b82:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 b86:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 b88:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 b8a:	6100 ff14      	bsr.w aa0 <__mulsi3>
	addql	IMM (8), sp
 b8e:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 b90:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 b94:	9280           	sub.l d0,d1
	movel	d1, d0
 b96:	2001           	move.l d1,d0
	rts
 b98:	4e75           	rts

00000b9a <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 b9a:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 b9c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 ba0:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 ba4:	2c5f           	movea.l (sp)+,a6
    rts
 ba6:	4e75           	rts

00000ba8 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 ba8:	16c0           	move.b d0,(a3)+
	rts
 baa:	4e75           	rts
