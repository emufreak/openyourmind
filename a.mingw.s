
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
  10:	23ce 0000 2e16 	move.l a6,2e16 <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,2e12 <hw>
  1c:	0000 2e12 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0b01 	lea b01 <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 2e0e 	move.l d0,2e0e <GfxBase>
	if (!GfxBase)
  32:	6700 05dc      	beq.w 610 <main+0x60a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
  3c:	43f9 0000 0b12 	lea b12 <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 2e0a 	move.l d0,2e0a <DOSBase>
	if (!DOSBase)
  4e:	6700 05b4      	beq.w 604 <main+0x5fe>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0b1e 	pea b1e <incbin_colors_end+0x66>
  58:	4eb9 0000 0706 	jsr 706 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0b3a 	move.l #2874,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  DrawCopper = Copperlist1;
  7c:	23fc 0000 2d78 	move.l #11640,2df4 <DrawCopper>
  82:	0000 2df4 
void ClBuild() {
  ULONG *clinstruction;
  clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
  86:	47f9 0000 2c9c 	lea 2c9c <ClsSprites>,a3
  8c:	4df9 0000 2d78 	lea 2d78 <Copperlist1>,a6
  92:	4878 0040      	pea 40 <main+0x3a>
  96:	2f0b           	move.l a3,-(sp)
  98:	2f0e           	move.l a6,-(sp)
  9a:	4eb9 0000 07b4 	jsr 7b4 <memcpy>
  a0:	45f9 0000 2c6c 	lea 2c6c <ClScreen>,a2
  a6:	23d2 0000 2db8 	move.l (a2),2db8 <Copperlist1+0x40>
  ac:	23f9 0000 2c70 	move.l 2c70 <ClScreen+0x4>,2dbc <Copperlist1+0x44>
  b2:	0000 2dbc 
  b6:	23f9 0000 2c74 	move.l 2c74 <ClScreen+0x8>,2dc0 <Copperlist1+0x48>
  bc:	0000 2dc0 
  c0:	23f9 0000 2c78 	move.l 2c78 <ClScreen+0xc>,2dc4 <Copperlist1+0x4c>
  c6:	0000 2dc4 
  ca:	23f9 0000 2c7c 	move.l 2c7c <ClScreen+0x10>,2dc8 <Copperlist1+0x50>
  d0:	0000 2dc8 
  d4:	23f9 0000 2c80 	move.l 2c80 <ClScreen+0x14>,2dcc <Copperlist1+0x54>
  da:	0000 2dcc 
  de:	23f9 0000 2c84 	move.l 2c84 <ClScreen+0x18>,2dd0 <Copperlist1+0x58>
  e4:	0000 2dd0 
  e8:	23f9 0000 2c88 	move.l 2c88 <ClScreen+0x1c>,2dd4 <Copperlist1+0x5c>
  ee:	0000 2dd4 
  f2:	23f9 0000 2c8c 	move.l 2c8c <ClScreen+0x20>,2dd8 <Copperlist1+0x60>
  f8:	0000 2dd8 
  fc:	23f9 0000 2c90 	move.l 2c90 <ClScreen+0x24>,2ddc <Copperlist1+0x64>
 102:	0000 2ddc 
 106:	23f9 0000 2c94 	move.l 2c94 <ClScreen+0x28>,2de0 <Copperlist1+0x68>
 10c:	0000 2de0 
 110:	23f9 0000 2c98 	move.l 2c98 <ClScreen+0x2c>,2de4 <Copperlist1+0x6c>
 116:	0000 2de4 
    *clinstruction++ = *clpartinstruction++;
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *clinstruction++ = *clpartinstruction++;
  CopBpl1High = (long) clinstruction + 2;
 11a:	23fc 0000 2dea 	move.l #11754,2cec <CopBpl1High>
 120:	0000 2cec 
  *clinstruction++ = 0x00e00000;
 124:	23fc 00e0 0000 	move.l #14680064,2de8 <Copperlist1+0x70>
 12a:	0000 2de8 
  CopBpl1Low = (long) clinstruction + 2;
 12e:	23fc 0000 2dee 	move.l #11758,2cf0 <CopBpl1Low>
 134:	0000 2cf0 
  *clinstruction++ = 0x00e20000;
 138:	23fc 00e2 0000 	move.l #14811136,2dec <Copperlist1+0x74>
 13e:	0000 2dec 
  *clinstruction = 0xfffffffe;
 142:	70fe           	moveq #-2,d0
 144:	23c0 0000 2df0 	move.l d0,2df0 <Copperlist1+0x78>
    if( instructions[ pos+i] != batch[ i])
 14a:	4fef 0010      	lea 16(sp),sp
 14e:	2c56           	movea.l (a6),a6
 150:	bdd3           	cmpa.l (a3),a6
 152:	6600 046c      	bne.w 5c0 <main+0x5ba>
 156:	2239 0000 2d7c 	move.l 2d7c <Copperlist1+0x4>,d1
 15c:	b2b9 0000 2ca0 	cmp.l 2ca0 <ClsSprites+0x4>,d1
 162:	6600 045c      	bne.w 5c0 <main+0x5ba>
 166:	2039 0000 2d80 	move.l 2d80 <Copperlist1+0x8>,d0
 16c:	b0b9 0000 2ca4 	cmp.l 2ca4 <ClsSprites+0x8>,d0
 172:	6600 044c      	bne.w 5c0 <main+0x5ba>
 176:	2239 0000 2d84 	move.l 2d84 <Copperlist1+0xc>,d1
 17c:	b2b9 0000 2ca8 	cmp.l 2ca8 <ClsSprites+0xc>,d1
 182:	6600 043c      	bne.w 5c0 <main+0x5ba>
 186:	2039 0000 2d88 	move.l 2d88 <Copperlist1+0x10>,d0
 18c:	b0b9 0000 2cac 	cmp.l 2cac <ClsSprites+0x10>,d0
 192:	6600 042c      	bne.w 5c0 <main+0x5ba>
 196:	2239 0000 2d8c 	move.l 2d8c <Copperlist1+0x14>,d1
 19c:	b2b9 0000 2cb0 	cmp.l 2cb0 <ClsSprites+0x14>,d1
 1a2:	6600 041c      	bne.w 5c0 <main+0x5ba>
 1a6:	2039 0000 2d90 	move.l 2d90 <Copperlist1+0x18>,d0
 1ac:	b0b9 0000 2cb4 	cmp.l 2cb4 <ClsSprites+0x18>,d0
 1b2:	6600 040c      	bne.w 5c0 <main+0x5ba>
 1b6:	2239 0000 2d94 	move.l 2d94 <Copperlist1+0x1c>,d1
 1bc:	b2b9 0000 2cb8 	cmp.l 2cb8 <ClsSprites+0x1c>,d1
 1c2:	6600 03fc      	bne.w 5c0 <main+0x5ba>
 1c6:	2039 0000 2d98 	move.l 2d98 <Copperlist1+0x20>,d0
 1cc:	b0b9 0000 2cbc 	cmp.l 2cbc <ClsSprites+0x20>,d0
 1d2:	6600 03ec      	bne.w 5c0 <main+0x5ba>
 1d6:	2239 0000 2d9c 	move.l 2d9c <Copperlist1+0x24>,d1
 1dc:	b2b9 0000 2cc0 	cmp.l 2cc0 <ClsSprites+0x24>,d1
 1e2:	6600 03dc      	bne.w 5c0 <main+0x5ba>
 1e6:	2039 0000 2da0 	move.l 2da0 <Copperlist1+0x28>,d0
 1ec:	b0b9 0000 2cc4 	cmp.l 2cc4 <ClsSprites+0x28>,d0
 1f2:	6600 03cc      	bne.w 5c0 <main+0x5ba>
 1f6:	2239 0000 2da4 	move.l 2da4 <Copperlist1+0x2c>,d1
 1fc:	b2b9 0000 2cc8 	cmp.l 2cc8 <ClsSprites+0x2c>,d1
 202:	6600 03bc      	bne.w 5c0 <main+0x5ba>
 206:	2039 0000 2da8 	move.l 2da8 <Copperlist1+0x30>,d0
 20c:	b0b9 0000 2ccc 	cmp.l 2ccc <ClsSprites+0x30>,d0
 212:	6600 03ac      	bne.w 5c0 <main+0x5ba>
 216:	2239 0000 2dac 	move.l 2dac <Copperlist1+0x34>,d1
 21c:	b2b9 0000 2cd0 	cmp.l 2cd0 <ClsSprites+0x34>,d1
 222:	6600 039c      	bne.w 5c0 <main+0x5ba>
 226:	2039 0000 2db0 	move.l 2db0 <Copperlist1+0x38>,d0
 22c:	b0b9 0000 2cd4 	cmp.l 2cd4 <ClsSprites+0x38>,d0
 232:	6600 038c      	bne.w 5c0 <main+0x5ba>
 236:	2239 0000 2db4 	move.l 2db4 <Copperlist1+0x3c>,d1
 23c:	b2b9 0000 2cd8 	cmp.l 2cd8 <ClsSprites+0x3c>,d1
 242:	6600 037c      	bne.w 5c0 <main+0x5ba>
 246:	2039 0000 2db8 	move.l 2db8 <Copperlist1+0x40>,d0
 24c:	b092           	cmp.l (a2),d0
 24e:	6600 0392      	bne.w 5e2 <main+0x5dc>
 252:	2239 0000 2dbc 	move.l 2dbc <Copperlist1+0x44>,d1
 258:	b2b9 0000 2c70 	cmp.l 2c70 <ClScreen+0x4>,d1
 25e:	6600 0382      	bne.w 5e2 <main+0x5dc>
 262:	2039 0000 2c74 	move.l 2c74 <ClScreen+0x8>,d0
 268:	b0b9 0000 2dc0 	cmp.l 2dc0 <Copperlist1+0x48>,d0
 26e:	6600 0372      	bne.w 5e2 <main+0x5dc>
 272:	2239 0000 2c78 	move.l 2c78 <ClScreen+0xc>,d1
 278:	b2b9 0000 2dc4 	cmp.l 2dc4 <Copperlist1+0x4c>,d1
 27e:	6600 0362      	bne.w 5e2 <main+0x5dc>
 282:	2039 0000 2dc8 	move.l 2dc8 <Copperlist1+0x50>,d0
 288:	b0b9 0000 2c7c 	cmp.l 2c7c <ClScreen+0x10>,d0
 28e:	6600 0352      	bne.w 5e2 <main+0x5dc>
 292:	2239 0000 2c80 	move.l 2c80 <ClScreen+0x14>,d1
 298:	b2b9 0000 2dcc 	cmp.l 2dcc <Copperlist1+0x54>,d1
 29e:	6600 0342      	bne.w 5e2 <main+0x5dc>
 2a2:	2039 0000 2dd0 	move.l 2dd0 <Copperlist1+0x58>,d0
 2a8:	b0b9 0000 2c84 	cmp.l 2c84 <ClScreen+0x18>,d0
 2ae:	6600 0332      	bne.w 5e2 <main+0x5dc>
 2b2:	2239 0000 2dd4 	move.l 2dd4 <Copperlist1+0x5c>,d1
 2b8:	b2b9 0000 2c88 	cmp.l 2c88 <ClScreen+0x1c>,d1
 2be:	6600 0322      	bne.w 5e2 <main+0x5dc>
 2c2:	2039 0000 2dd8 	move.l 2dd8 <Copperlist1+0x60>,d0
 2c8:	b0b9 0000 2c8c 	cmp.l 2c8c <ClScreen+0x20>,d0
 2ce:	6600 0312      	bne.w 5e2 <main+0x5dc>
 2d2:	2239 0000 2ddc 	move.l 2ddc <Copperlist1+0x64>,d1
 2d8:	b2b9 0000 2c90 	cmp.l 2c90 <ClScreen+0x24>,d1
 2de:	6600 0302      	bne.w 5e2 <main+0x5dc>
 2e2:	2039 0000 2de0 	move.l 2de0 <Copperlist1+0x68>,d0
 2e8:	b0b9 0000 2c94 	cmp.l 2c94 <ClScreen+0x28>,d0
 2ee:	6600 02f2      	bne.w 5e2 <main+0x5dc>
 2f2:	2239 0000 2de4 	move.l 2de4 <Copperlist1+0x6c>,d1
 2f8:	b2b9 0000 2c98 	cmp.l 2c98 <ClScreen+0x2c>,d1
 2fe:	6600 02e2      	bne.w 5e2 <main+0x5dc>

void SetBplPointers() {
  UWORD highword = DrawBuffer >> 16;
  UWORD lowword = DrawBuffer & 0xffff;
  
  *CopBpl1Low = lowword;
 302:	2079 0000 2cf0 	movea.l 2cf0 <CopBpl1Low>,a0
 308:	4250           	clr.w (a0)
  *CopBpl1High = highword;
 30a:	2079 0000 2cec 	movea.l 2cec <CopBpl1High>,a0
 310:	30bc 0004      	move.w #4,(a0)
  
  ULONG tmp = DrawBuffer;
  DrawBuffer = ViewBuffer;
 314:	23fc 0005 0000 	move.l #327680,2cf8 <DrawBuffer>
 31a:	0000 2cf8 
  ViewBuffer = tmp;
 31e:	23fc 0004 0000 	move.l #262144,2cf4 <ViewBuffer>
 324:	0000 2cf4 
  if( instructions[pos] == value ) 
 328:	0cb9 00e0 0004 	cmpi.l #14680068,2de8 <Copperlist1+0x70>
 32e:	0000 2de8 
 332:	671e           	beq.s 352 <main+0x34c>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
 334:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 33a:	4eae ffc4      	jsr -60(a6)
 33e:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 344:	2200           	move.l d0,d1
 346:	243c 0000 0b4a 	move.l #2890,d2
 34c:	763c           	moveq #60,d3
 34e:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 352:	0cb9 00e2 0000 	cmpi.l #14811136,2dec <Copperlist1+0x74>
 358:	0000 2dec 
 35c:	671e           	beq.s 37c <main+0x376>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
 35e:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 364:	4eae ffc4      	jsr -60(a6)
 368:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 36e:	2200           	move.l d0,d1
 370:	243c 0000 0b87 	move.l #2951,d2
 376:	763c           	moveq #60,d3
 378:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 37c:	70fe           	moveq #-2,d0
 37e:	b0b9 0000 2df0 	cmp.l 2df0 <Copperlist1+0x78>,d0
 384:	671e           	beq.s 3a4 <main+0x39e>
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if( TestCopperlistPos( Copperlist1, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 386:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 38c:	4eae ffc4      	jsr -60(a6)
 390:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 396:	2200           	move.l d0,d1
 398:	243c 0000 0bc4 	move.l #3012,d2
 39e:	761f           	moveq #31,d3
 3a0:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
  if( DrawCopper != &Copperlist2)
 3a4:	0cb9 0000 2cfc 	cmpi.l #11516,2df4 <DrawCopper>
 3aa:	0000 2df4 
 3ae:	671e           	beq.s 3ce <main+0x3c8>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
 3b0:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 3b6:	4eae ffc4      	jsr -60(a6)
 3ba:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 3c0:	2200           	move.l d0,d1
 3c2:	243c 0000 0be6 	move.l #3046,d2
 3c8:	7615           	moveq #21,d3
 3ca:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 3ce:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 3d4:	7232           	moveq #50,d1
 3d6:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 3da:	247c 00f0 ff60 	movea.l #15794016,a2
 3e0:	4a92           	tst.l (a2)
 3e2:	6718           	beq.s 3fc <main+0x3f6>
 3e4:	4878 0001      	pea 1 <_start+0x1>
 3e8:	47f9 0000 0664 	lea 664 <warpmode.part.0>,a3
 3ee:	4e93           	jsr (a3)
 3f0:	588f           	addq.l #4,sp
 3f2:	4a92           	tst.l (a2)
 3f4:	6706           	beq.s 3fc <main+0x3f6>
 3f6:	42a7           	clr.l -(sp)
 3f8:	4e93           	jsr (a3)
 3fa:	588f           	addq.l #4,sp
  /*ULONG tmp = DrawCopper;
  DrawCopper = ViewCopper;
  ViewCopper = tmp;*/
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 3fc:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 402:	23ee 0022 0000 	move.l 34(a6),2df8 <ActiView>
 408:	2df8 
	OwnBlitter();
 40a:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 40e:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 414:	4eae ff1c      	jsr -228(a6)
	Disable();
 418:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 41e:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 422:	2479 0000 2e12 	movea.l 2e12 <hw>,a2
 428:	302a 0010      	move.w 16(a2),d0
 42c:	33c0 0000 2dfc 	move.w d0,2dfc <SystemADKCON>
	SystemInts=hw->intenar;
 432:	302a 001c      	move.w 28(a2),d0
 436:	33c0 0000 2e00 	move.w d0,2e00 <SystemInts>
	SystemDMA=hw->dmaconr;
 43c:	302a 0002      	move.w 2(a2),d0
 440:	33c0 0000 2dfe 	move.w d0,2dfe <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 446:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 44c:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 452:	47f9 0000 076e 	lea 76e <WaitVbl>,a3
 458:	4e93           	jsr (a3)
	WaitVbl();
 45a:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 45c:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 462:	7000           	moveq #0,d0
		hw->color[a]=0;
 464:	2200           	move.l d0,d1
 466:	0681 0000 00c0 	addi.l #192,d1
 46c:	d281           	add.l d1,d1
 46e:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 474:	5280           	addq.l #1,d0
 476:	7220           	moveq #32,d1
 478:	b280           	cmp.l d0,d1
 47a:	66e8           	bne.s 464 <main+0x45e>

	LoadView(0);
 47c:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 482:	93c9           	suba.l a1,a1
 484:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 488:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 48e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 492:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 498:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 49c:	4e93           	jsr (a3)
	WaitVbl();
 49e:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 4a0:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 4a6:	3f7c 0801 001c 	move.w #2049,28(sp)
 4ac:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 4b2:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 4b8:	082e 0000 0129 	btst #0,297(a6)
 4be:	6700 017a      	beq.w 63a <main+0x634>
		vbr = (APTR)Supervisor((void*)getvbr);
 4c2:	7e1a           	moveq #26,d7
 4c4:	de8f           	add.l sp,d7
 4c6:	cf8d           	exg d7,a5
 4c8:	4eae ffe2      	jsr -30(a6)
 4cc:	cf8d           	exg d7,a5

	VBR=GetVBR();
 4ce:	23c0 0000 2e02 	move.l d0,2e02 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 4d4:	2079 0000 2e02 	movea.l 2e02 <VBR.lto_priv.0>,a0
 4da:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 4de:	23ca 0000 2e06 	move.l a2,2e06 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 4e4:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 4e6:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 4e8:	2079 0000 2e12 	movea.l 2e12 <hw>,a0
 4ee:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 4f2:	3028 0002      	move.w 2(a0),d0
 4f6:	0800 000e      	btst #14,d0
 4fa:	66f6           	bne.s 4f2 <main+0x4ec>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 4fc:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 502:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 508:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 50e:	2279 0000 2e02 	movea.l 2e02 <VBR.lto_priv.0>,a1
 514:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 518:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 51e:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 524:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 52a:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 530:	3039 0000 2e00 	move.w 2e00 <SystemInts>,d0
 536:	0040 8000      	ori.w #-32768,d0
 53a:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 53e:	3039 0000 2dfe 	move.w 2dfe <SystemDMA>,d0
 544:	0040 8000      	ori.w #-32768,d0
 548:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 54c:	3039 0000 2dfc 	move.w 2dfc <SystemADKCON>,d0
 552:	0040 8000      	ori.w #-32768,d0
 556:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 55a:	2279 0000 2df8 	movea.l 2df8 <ActiView>,a1
 560:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 564:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 56a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 56e:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 574:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 578:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 57e:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 582:	2c79 0000 2e0e 	movea.l 2e0e <GfxBase>,a6
 588:	4eae fe32      	jsr -462(a6)
	Enable();
 58c:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 592:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 596:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 59c:	2279 0000 2e0a 	movea.l 2e0a <DOSBase>,a1
 5a2:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 5a6:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 5ac:	2279 0000 2e0e 	movea.l 2e0e <GfxBase>,a1
 5b2:	4eae fe62      	jsr -414(a6)
}
 5b6:	7000           	moveq #0,d0
 5b8:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 5bc:	508f           	addq.l #8,sp
 5be:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 5c0:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 5c6:	4eae ffc4      	jsr -60(a6)
 5ca:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 5d0:	2200           	move.l d0,d1
 5d2:	243c 0000 0c33 	move.l #3123,d2
 5d8:	762c           	moveq #44,d3
 5da:	4eae ffd0      	jsr -48(a6)
 5de:	6000 fc66      	bra.w 246 <main+0x240>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 5e2:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 5e8:	4eae ffc4      	jsr -60(a6)
 5ec:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 5f2:	2200           	move.l d0,d1
 5f4:	243c 0000 0bfc 	move.l #3068,d2
 5fa:	7636           	moveq #54,d3
 5fc:	4eae ffd0      	jsr -48(a6)
 600:	6000 fd00      	bra.w 302 <main+0x2fc>
		Exit(0);
 604:	9dce           	suba.l a6,a6
 606:	7200           	moveq #0,d1
 608:	4eae ff70      	jsr -144(a6)
 60c:	6000 fa44      	bra.w 52 <main+0x4c>
		Exit(0);
 610:	2c79 0000 2e0a 	movea.l 2e0a <DOSBase>,a6
 616:	7200           	moveq #0,d1
 618:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 61c:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 622:	43f9 0000 0b12 	lea b12 <incbin_colors_end+0x5a>,a1
 628:	7000           	moveq #0,d0
 62a:	4eae fdd8      	jsr -552(a6)
 62e:	23c0 0000 2e0a 	move.l d0,2e0a <DOSBase>
	if (!DOSBase)
 634:	6600 fa1c      	bne.w 52 <main+0x4c>
 638:	60ca           	bra.s 604 <main+0x5fe>
	APTR vbr = 0;
 63a:	7000           	moveq #0,d0
	VBR=GetVBR();
 63c:	23c0 0000 2e02 	move.l d0,2e02 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 642:	2079 0000 2e02 	movea.l 2e02 <VBR.lto_priv.0>,a0
 648:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 64c:	23ca 0000 2e06 	move.l a2,2e06 <SystemIrq>
	WaitVbl();
 652:	4e93           	jsr (a3)
	WaitVbl();
 654:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 656:	2079 0000 2e12 	movea.l 2e12 <hw>,a0
 65c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 660:	6000 fe90      	bra.w 4f2 <main+0x4ec>

00000664 <warpmode.part.0>:
void warpmode(int on) 
 664:	598f           	subq.l #4,sp
 666:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 668:	4aaf 000c      	tst.l 12(sp)
 66c:	674c           	beq.s 6ba <warpmode.part.0+0x56>
 66e:	4878 0001      	pea 1 <_start+0x1>
 672:	740b           	moveq #11,d2
 674:	d48f           	add.l sp,d2
 676:	2f02           	move.l d2,-(sp)
 678:	42a7           	clr.l -(sp)
 67a:	4879 0000 0aec 	pea aec <incbin_colors_end+0x34>
 680:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1a05>
 684:	4878 0052      	pea 52 <main+0x4c>
 688:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01966>
 68e:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 692:	203c 0000 0ad2 	move.l #2770,d0
 698:	4878 0001      	pea 1 <_start+0x1>
 69c:	2f02           	move.l d2,-(sp)
 69e:	42a7           	clr.l -(sp)
 6a0:	2f00           	move.l d0,-(sp)
 6a2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1a05>
 6a6:	4878 0052      	pea 52 <main+0x4c>
 6aa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01966>
	}
}
 6b0:	4fef 0018      	lea 24(sp),sp
 6b4:	241f           	move.l (sp)+,d2
 6b6:	588f           	addq.l #4,sp
 6b8:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 6ba:	4878 0001      	pea 1 <_start+0x1>
 6be:	740b           	moveq #11,d2
 6c0:	d48f           	add.l sp,d2
 6c2:	2f02           	move.l d2,-(sp)
 6c4:	42a7           	clr.l -(sp)
 6c6:	4879 0000 0af6 	pea af6 <incbin_colors_end+0x3e>
 6cc:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1a05>
 6d0:	4878 0052      	pea 52 <main+0x4c>
 6d4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01966>
 6da:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 6de:	203c 0000 0ab9 	move.l #2745,d0
 6e4:	4878 0001      	pea 1 <_start+0x1>
 6e8:	2f02           	move.l d2,-(sp)
 6ea:	42a7           	clr.l -(sp)
 6ec:	2f00           	move.l d0,-(sp)
 6ee:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1a05>
 6f2:	4878 0052      	pea 52 <main+0x4c>
 6f6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01966>
}
 6fc:	4fef 0018      	lea 24(sp),sp
 700:	241f           	move.l (sp)+,d2
 702:	588f           	addq.l #4,sp
 704:	4e75           	rts

00000706 <KPrintF>:
{
 706:	4fef ff80      	lea -128(sp),sp
 70a:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 70e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf01966>
 714:	6734           	beq.s 74a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 716:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 71c:	206f 0090      	movea.l 144(sp),a0
 720:	43ef 0094      	lea 148(sp),a1
 724:	45f9 0000 0a34 	lea a34 <PutChar>,a2
 72a:	47ef 000c      	lea 12(sp),a3
 72e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 732:	2f0b           	move.l a3,-(sp)
 734:	4878 0056      	pea 56 <main+0x50>
 738:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01966>
 73e:	508f           	addq.l #8,sp
}
 740:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 744:	4fef 0080      	lea 128(sp),sp
 748:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 74a:	2c79 0000 2e16 	movea.l 2e16 <SysBase>,a6
 750:	206f 0090      	movea.l 144(sp),a0
 754:	43ef 0094      	lea 148(sp),a1
 758:	45f9 0000 0a26 	lea a26 <KPutCharX>,a2
 75e:	97cb           	suba.l a3,a3
 760:	4eae fdf6      	jsr -522(a6)
}
 764:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 768:	4fef 0080      	lea 128(sp),sp
 76c:	4e75           	rts

0000076e <WaitVbl>:
void WaitVbl() {
 76e:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 770:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf0a0a>,d0
 776:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 778:	2017           	move.l (sp),d0
 77a:	0280 0001 ff00 	andi.l #130816,d0
 780:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 782:	2017           	move.l (sp),d0
 784:	0c80 0001 3700 	cmpi.l #79616,d0
 78a:	67e4           	beq.s 770 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 78c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf0a0a>,d0
 792:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 796:	202f 0004      	move.l 4(sp),d0
 79a:	0280 0001 ff00 	andi.l #130816,d0
 7a0:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 7a4:	202f 0004      	move.l 4(sp),d0
 7a8:	0c80 0001 3700 	cmpi.l #79616,d0
 7ae:	66dc           	bne.s 78c <WaitVbl+0x1e>
}
 7b0:	508f           	addq.l #8,sp
 7b2:	4e75           	rts

000007b4 <memcpy>:
{
 7b4:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 7b8:	202f 0014      	move.l 20(sp),d0
 7bc:	226f 0018      	movea.l 24(sp),a1
 7c0:	222f 001c      	move.l 28(sp),d1
	while(len--)
 7c4:	2601           	move.l d1,d3
 7c6:	5383           	subq.l #1,d3
 7c8:	4a81           	tst.l d1
 7ca:	6762           	beq.s 82e <memcpy+0x7a>
 7cc:	2040           	movea.l d0,a0
 7ce:	5888           	addq.l #4,a0
 7d0:	b1c9           	cmpa.l a1,a0
 7d2:	53c2           	sl.s d2
 7d4:	4402           	neg.b d2
 7d6:	41e9 0004      	lea 4(a1),a0
 7da:	b1c0           	cmpa.l d0,a0
 7dc:	53c4           	sl.s d4
 7de:	4404           	neg.b d4
 7e0:	8404           	or.b d4,d2
 7e2:	7808           	moveq #8,d4
 7e4:	b883           	cmp.l d3,d4
 7e6:	55c4           	sc.s d4
 7e8:	4404           	neg.b d4
 7ea:	c404           	and.b d4,d2
 7ec:	6746           	beq.s 834 <memcpy+0x80>
 7ee:	2409           	move.l a1,d2
 7f0:	8480           	or.l d0,d2
 7f2:	7803           	moveq #3,d4
 7f4:	c484           	and.l d4,d2
 7f6:	663c           	bne.s 834 <memcpy+0x80>
 7f8:	2049           	movea.l a1,a0
 7fa:	2440           	movea.l d0,a2
 7fc:	74fc           	moveq #-4,d2
 7fe:	c481           	and.l d1,d2
 800:	d489           	add.l a1,d2
		*d++ = *s++;
 802:	24d8           	move.l (a0)+,(a2)+
 804:	b488           	cmp.l a0,d2
 806:	66fa           	bne.s 802 <memcpy+0x4e>
 808:	74fc           	moveq #-4,d2
 80a:	c481           	and.l d1,d2
 80c:	2040           	movea.l d0,a0
 80e:	d1c2           	adda.l d2,a0
 810:	d3c2           	adda.l d2,a1
 812:	9682           	sub.l d2,d3
 814:	b481           	cmp.l d1,d2
 816:	6716           	beq.s 82e <memcpy+0x7a>
 818:	1091           	move.b (a1),(a0)
	while(len--)
 81a:	4a83           	tst.l d3
 81c:	6710           	beq.s 82e <memcpy+0x7a>
		*d++ = *s++;
 81e:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 824:	5383           	subq.l #1,d3
 826:	6706           	beq.s 82e <memcpy+0x7a>
		*d++ = *s++;
 828:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 82e:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 832:	4e75           	rts
 834:	2040           	movea.l d0,a0
 836:	d289           	add.l a1,d1
		*d++ = *s++;
 838:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 83a:	b289           	cmp.l a1,d1
 83c:	67f0           	beq.s 82e <memcpy+0x7a>
		*d++ = *s++;
 83e:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 840:	b289           	cmp.l a1,d1
 842:	66f4           	bne.s 838 <memcpy+0x84>
 844:	60e8           	bra.s 82e <memcpy+0x7a>

00000846 <memset>:
{
 846:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 84a:	202f 0024      	move.l 36(sp),d0
 84e:	2a2f 0028      	move.l 40(sp),d5
 852:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 856:	2809           	move.l a1,d4
 858:	5384           	subq.l #1,d4
 85a:	b2fc 0000      	cmpa.w #0,a1
 85e:	6f00 00b0      	ble.w 910 <memset+0xca>
 862:	1e05           	move.b d5,d7
 864:	2200           	move.l d0,d1
 866:	4481           	neg.l d1
 868:	7403           	moveq #3,d2
 86a:	c282           	and.l d2,d1
 86c:	7c05           	moveq #5,d6
		*ptr++ = val;
 86e:	2440           	movea.l d0,a2
 870:	bc84           	cmp.l d4,d6
 872:	646a           	bcc.s 8de <memset+0x98>
 874:	4a81           	tst.l d1
 876:	6724           	beq.s 89c <memset+0x56>
 878:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 87a:	5384           	subq.l #1,d4
 87c:	7401           	moveq #1,d2
 87e:	b481           	cmp.l d1,d2
 880:	671a           	beq.s 89c <memset+0x56>
		*ptr++ = val;
 882:	2440           	movea.l d0,a2
 884:	548a           	addq.l #2,a2
 886:	2040           	movea.l d0,a0
 888:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 88c:	5384           	subq.l #1,d4
 88e:	7403           	moveq #3,d2
 890:	b481           	cmp.l d1,d2
 892:	6608           	bne.s 89c <memset+0x56>
		*ptr++ = val;
 894:	528a           	addq.l #1,a2
 896:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 89a:	5384           	subq.l #1,d4
 89c:	2609           	move.l a1,d3
 89e:	9681           	sub.l d1,d3
 8a0:	7c00           	moveq #0,d6
 8a2:	1c05           	move.b d5,d6
 8a4:	2406           	move.l d6,d2
 8a6:	4842           	swap d2
 8a8:	4242           	clr.w d2
 8aa:	2042           	movea.l d2,a0
 8ac:	2406           	move.l d6,d2
 8ae:	e14a           	lsl.w #8,d2
 8b0:	4842           	swap d2
 8b2:	4242           	clr.w d2
 8b4:	e18e           	lsl.l #8,d6
 8b6:	2646           	movea.l d6,a3
 8b8:	2c08           	move.l a0,d6
 8ba:	8486           	or.l d6,d2
 8bc:	2c0b           	move.l a3,d6
 8be:	8486           	or.l d6,d2
 8c0:	1407           	move.b d7,d2
 8c2:	2040           	movea.l d0,a0
 8c4:	d1c1           	adda.l d1,a0
 8c6:	72fc           	moveq #-4,d1
 8c8:	c283           	and.l d3,d1
 8ca:	d288           	add.l a0,d1
		*ptr++ = val;
 8cc:	20c2           	move.l d2,(a0)+
 8ce:	b1c1           	cmpa.l d1,a0
 8d0:	66fa           	bne.s 8cc <memset+0x86>
 8d2:	72fc           	moveq #-4,d1
 8d4:	c283           	and.l d3,d1
 8d6:	d5c1           	adda.l d1,a2
 8d8:	9881           	sub.l d1,d4
 8da:	b283           	cmp.l d3,d1
 8dc:	6732           	beq.s 910 <memset+0xca>
 8de:	1485           	move.b d5,(a2)
	while(len-- > 0)
 8e0:	4a84           	tst.l d4
 8e2:	6f2c           	ble.s 910 <memset+0xca>
		*ptr++ = val;
 8e4:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 8e8:	7201           	moveq #1,d1
 8ea:	b284           	cmp.l d4,d1
 8ec:	6c22           	bge.s 910 <memset+0xca>
		*ptr++ = val;
 8ee:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 8f2:	7402           	moveq #2,d2
 8f4:	b484           	cmp.l d4,d2
 8f6:	6c18           	bge.s 910 <memset+0xca>
		*ptr++ = val;
 8f8:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 8fc:	7c03           	moveq #3,d6
 8fe:	bc84           	cmp.l d4,d6
 900:	6c0e           	bge.s 910 <memset+0xca>
		*ptr++ = val;
 902:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 906:	7204           	moveq #4,d1
 908:	b284           	cmp.l d4,d1
 90a:	6c04           	bge.s 910 <memset+0xca>
		*ptr++ = val;
 90c:	1545 0005      	move.b d5,5(a2)
}
 910:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 914:	4e75           	rts

00000916 <strlen>:
{
 916:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 91a:	7000           	moveq #0,d0
	while(*s++)
 91c:	4a10           	tst.b (a0)
 91e:	6708           	beq.s 928 <strlen+0x12>
		t++;
 920:	5280           	addq.l #1,d0
	while(*s++)
 922:	4a30 0800      	tst.b (0,a0,d0.l)
 926:	66f8           	bne.s 920 <strlen+0xa>
}
 928:	4e75           	rts
 92a:	4e71           	nop

0000092c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 92c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 930:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 934:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 938:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 93c:	d041           	add.w d1,d0
	swap	d0
 93e:	4840           	swap d0
	clrw	d0
 940:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 942:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 946:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 94a:	d081           	add.l d1,d0

	rts
 94c:	4e75           	rts

0000094e <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 94e:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 950:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 954:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 958:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 95e:	6416           	bcc.s 976 <__udivsi3+0x28>
	movel	d0, d2
 960:	2400           	move.l d0,d2
	clrw	d2
 962:	4242           	clr.w d2
	swap	d2
 964:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 966:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 968:	3002           	move.w d2,d0
	swap	d0
 96a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 96c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 970:	84c1           	divu.w d1,d2
	movew	d2, d0
 972:	3002           	move.w d2,d0
	jra	6f
 974:	6030           	bra.s 9a6 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 976:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 978:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 97a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 97c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 982:	64f4           	bcc.s 978 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 984:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 986:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 98c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 98e:	c2c0           	mulu.w d0,d1
	swap	d2
 990:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 992:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 994:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 996:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 998:	660a           	bne.s 9a4 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 99a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 99c:	6506           	bcs.s 9a4 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 99e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 9a2:	6302           	bls.s 9a6 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 9a4:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 9a6:	241f           	move.l (sp)+,d2
	rts
 9a8:	4e75           	rts

000009aa <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 9aa:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 9ac:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 9ae:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 9b2:	6a04           	bpl.s 9b8 <__divsi3+0xe>
	negl	d1
 9b4:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 9b6:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 9b8:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 9bc:	6a04           	bpl.s 9c2 <__divsi3+0x18>
	negl	d0
 9be:	4480           	neg.l d0
	negb	d2
 9c0:	4402           	neg.b d2

2:	movel	d1, sp@-
 9c2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9c4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 9c6:	6186           	bsr.s 94e <__udivsi3>
	addql	IMM (8), sp
 9c8:	508f           	addq.l #8,sp

	tstb	d2
 9ca:	4a02           	tst.b d2
	jpl	3f
 9cc:	6a02           	bpl.s 9d0 <__divsi3+0x26>
	negl	d0
 9ce:	4480           	neg.l d0

3:	movel	sp@+, d2
 9d0:	241f           	move.l (sp)+,d2
	rts
 9d2:	4e75           	rts

000009d4 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 9d4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 9d8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 9dc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9de:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 9e0:	61c8           	bsr.s 9aa <__divsi3>
	addql	IMM (8), sp
 9e2:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 9e4:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 9e8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 9ea:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 9ec:	6100 ff3e      	bsr.w 92c <__mulsi3>
	addql	IMM (8), sp
 9f0:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 9f2:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 9f6:	9280           	sub.l d0,d1
	movel	d1, d0
 9f8:	2001           	move.l d1,d0
	rts
 9fa:	4e75           	rts

000009fc <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 9fc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 a00:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 a04:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a06:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 a08:	6100 ff44      	bsr.w 94e <__udivsi3>
	addql	IMM (8), sp
 a0c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 a0e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 a12:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a14:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 a16:	6100 ff14      	bsr.w 92c <__mulsi3>
	addql	IMM (8), sp
 a1a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 a1c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 a20:	9280           	sub.l d0,d1
	movel	d1, d0
 a22:	2001           	move.l d1,d0
	rts
 a24:	4e75           	rts

00000a26 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 a26:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 a28:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 a2c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 a30:	2c5f           	movea.l (sp)+,a6
    rts
 a32:	4e75           	rts

00000a34 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 a34:	16c0           	move.b d0,(a3)+
	rts
 a36:	4e75           	rts
