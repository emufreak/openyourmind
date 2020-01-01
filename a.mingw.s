
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
  10:	23ce 0000 2e26 	move.l a6,2e26 <SysBase>
	hw = (struct Custom*)0xdff000;
  16:	23fc 00df f000 	move.l #14675968,2e22 <hw>
  1c:	0000 2e22 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
  20:	43f9 0000 0b6d 	lea b6d <incbin_colors_end+0x49>,a1
  26:	7000           	moveq #0,d0
  28:	4eae fdd8      	jsr -552(a6)
  2c:	23c0 0000 2e1e 	move.l d0,2e1e <GfxBase>
	if (!GfxBase)
  32:	6700 061c      	beq.w 650 <main+0x64a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
  36:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
  3c:	43f9 0000 0b7e 	lea b7e <incbin_colors_end+0x5a>,a1
  42:	7000           	moveq #0,d0
  44:	4eae fdd8      	jsr -552(a6)
  48:	23c0 0000 2e1a 	move.l d0,2e1a <DOSBase>
	if (!DOSBase)
  4e:	6700 05f4      	beq.w 644 <main+0x63e>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
  52:	4879 0000 0b8a 	pea b8a <incbin_colors_end+0x66>
  58:	4eb9 0000 0746 	jsr 746 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
  5e:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
  64:	4eae ffc4      	jsr -60(a6)
  68:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
  6e:	2200           	move.l d0,d1
  70:	243c 0000 0ba6 	move.l #2982,d2
  76:	760f           	moveq #15,d3
  78:	4eae ffd0      	jsr -48(a6)
#include "runtests.h"
#include "coppertests.h"

void RunTests() {
    TestCopperList();
  7c:	47f9 0000 2d2c 	lea 2d2c <ClsSprites>,a3
  82:	4df9 0000 2d8c 	lea 2d8c <Copperlist1>,a6
  88:	4878 0040      	pea 40 <main+0x3a>
  8c:	2f0b           	move.l a3,-(sp)
  8e:	2f0e           	move.l a6,-(sp)
  90:	4eb9 0000 0822 	jsr 822 <memcpy>
  96:	45f9 0000 2cfc 	lea 2cfc <ClScreen>,a2
  9c:	23d2 0000 2dcc 	move.l (a2),2dcc <Copperlist1+0x40>
  a2:	23f9 0000 2d00 	move.l 2d00 <ClScreen+0x4>,2dd0 <Copperlist1+0x44>
  a8:	0000 2dd0 
  ac:	23f9 0000 2d04 	move.l 2d04 <ClScreen+0x8>,2dd4 <Copperlist1+0x48>
  b2:	0000 2dd4 
  b6:	23f9 0000 2d08 	move.l 2d08 <ClScreen+0xc>,2dd8 <Copperlist1+0x4c>
  bc:	0000 2dd8 
  c0:	23f9 0000 2d0c 	move.l 2d0c <ClScreen+0x10>,2ddc <Copperlist1+0x50>
  c6:	0000 2ddc 
  ca:	23f9 0000 2d10 	move.l 2d10 <ClScreen+0x14>,2de0 <Copperlist1+0x54>
  d0:	0000 2de0 
  d4:	23f9 0000 2d14 	move.l 2d14 <ClScreen+0x18>,2de4 <Copperlist1+0x58>
  da:	0000 2de4 
  de:	23f9 0000 2d18 	move.l 2d18 <ClScreen+0x1c>,2de8 <Copperlist1+0x5c>
  e4:	0000 2de8 
  e8:	23f9 0000 2d1c 	move.l 2d1c <ClScreen+0x20>,2dec <Copperlist1+0x60>
  ee:	0000 2dec 
  f2:	23f9 0000 2d20 	move.l 2d20 <ClScreen+0x24>,2df0 <Copperlist1+0x64>
  f8:	0000 2df0 
  fc:	23f9 0000 2d24 	move.l 2d24 <ClScreen+0x28>,2df4 <Copperlist1+0x68>
 102:	0000 2df4 
 106:	23f9 0000 2d28 	move.l 2d28 <ClScreen+0x2c>,2df8 <Copperlist1+0x6c>
 10c:	0000 2df8 
  for(int i=0; i<16;i++)
    *clinstruction++ = *clpartinstruction++;
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *clinstruction++ = *clpartinstruction++;
  CopBpl1High = (long) clinstruction + 2;
 110:	23fc 0000 2dfe 	move.l #11774,2d80 <CopBpl1High>
 116:	0000 2d80 
  *clinstruction++ = 0x00e00000;
 11a:	23fc 00e0 0000 	move.l #14680064,2dfc <Copperlist1+0x70>
 120:	0000 2dfc 
  CopBpl1Low = (long) clinstruction + 2;
 124:	23fc 0000 2e02 	move.l #11778,2d7c <CopBpl1Low>
 12a:	0000 2d7c 
  *clinstruction++ = 0x00e20000;
 12e:	23fc 00e2 0000 	move.l #14811136,2e00 <Copperlist1+0x74>
 134:	0000 2e00 
  *clinstruction = 0xfffffffe;
 138:	70fe           	moveq #-2,d0
 13a:	23c0 0000 2e04 	move.l d0,2e04 <Copperlist1+0x78>

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                 long length) {
  for( int i=0;i<length;i++)
    if( instructions[ pos+i] != batch[ i])
 140:	4fef 0010      	lea 16(sp),sp
 144:	2c56           	movea.l (a6),a6
 146:	bdd3           	cmpa.l (a3),a6
 148:	6600 0462      	bne.w 5ac <main+0x5a6>
 14c:	2239 0000 2d90 	move.l 2d90 <Copperlist1+0x4>,d1
 152:	b2b9 0000 2d30 	cmp.l 2d30 <ClsSprites+0x4>,d1
 158:	6600 0452      	bne.w 5ac <main+0x5a6>
 15c:	2039 0000 2d94 	move.l 2d94 <Copperlist1+0x8>,d0
 162:	b0b9 0000 2d34 	cmp.l 2d34 <ClsSprites+0x8>,d0
 168:	6600 0442      	bne.w 5ac <main+0x5a6>
 16c:	2239 0000 2d98 	move.l 2d98 <Copperlist1+0xc>,d1
 172:	b2b9 0000 2d38 	cmp.l 2d38 <ClsSprites+0xc>,d1
 178:	6600 0432      	bne.w 5ac <main+0x5a6>
 17c:	2039 0000 2d9c 	move.l 2d9c <Copperlist1+0x10>,d0
 182:	b0b9 0000 2d3c 	cmp.l 2d3c <ClsSprites+0x10>,d0
 188:	6600 0422      	bne.w 5ac <main+0x5a6>
 18c:	2239 0000 2da0 	move.l 2da0 <Copperlist1+0x14>,d1
 192:	b2b9 0000 2d40 	cmp.l 2d40 <ClsSprites+0x14>,d1
 198:	6600 0412      	bne.w 5ac <main+0x5a6>
 19c:	2039 0000 2da4 	move.l 2da4 <Copperlist1+0x18>,d0
 1a2:	b0b9 0000 2d44 	cmp.l 2d44 <ClsSprites+0x18>,d0
 1a8:	6600 0402      	bne.w 5ac <main+0x5a6>
 1ac:	2239 0000 2da8 	move.l 2da8 <Copperlist1+0x1c>,d1
 1b2:	b2b9 0000 2d48 	cmp.l 2d48 <ClsSprites+0x1c>,d1
 1b8:	6600 03f2      	bne.w 5ac <main+0x5a6>
 1bc:	2039 0000 2dac 	move.l 2dac <Copperlist1+0x20>,d0
 1c2:	b0b9 0000 2d4c 	cmp.l 2d4c <ClsSprites+0x20>,d0
 1c8:	6600 03e2      	bne.w 5ac <main+0x5a6>
 1cc:	2239 0000 2db0 	move.l 2db0 <Copperlist1+0x24>,d1
 1d2:	b2b9 0000 2d50 	cmp.l 2d50 <ClsSprites+0x24>,d1
 1d8:	6600 03d2      	bne.w 5ac <main+0x5a6>
 1dc:	2039 0000 2db4 	move.l 2db4 <Copperlist1+0x28>,d0
 1e2:	b0b9 0000 2d54 	cmp.l 2d54 <ClsSprites+0x28>,d0
 1e8:	6600 03c2      	bne.w 5ac <main+0x5a6>
 1ec:	2239 0000 2db8 	move.l 2db8 <Copperlist1+0x2c>,d1
 1f2:	b2b9 0000 2d58 	cmp.l 2d58 <ClsSprites+0x2c>,d1
 1f8:	6600 03b2      	bne.w 5ac <main+0x5a6>
 1fc:	2039 0000 2dbc 	move.l 2dbc <Copperlist1+0x30>,d0
 202:	b0b9 0000 2d5c 	cmp.l 2d5c <ClsSprites+0x30>,d0
 208:	6600 03a2      	bne.w 5ac <main+0x5a6>
 20c:	2239 0000 2dc0 	move.l 2dc0 <Copperlist1+0x34>,d1
 212:	b2b9 0000 2d60 	cmp.l 2d60 <ClsSprites+0x34>,d1
 218:	6600 0392      	bne.w 5ac <main+0x5a6>
 21c:	2039 0000 2dc4 	move.l 2dc4 <Copperlist1+0x38>,d0
 222:	b0b9 0000 2d64 	cmp.l 2d64 <ClsSprites+0x38>,d0
 228:	6600 0382      	bne.w 5ac <main+0x5a6>
 22c:	2239 0000 2dc8 	move.l 2dc8 <Copperlist1+0x3c>,d1
 232:	b2b9 0000 2d68 	cmp.l 2d68 <ClsSprites+0x3c>,d1
 238:	6600 0372      	bne.w 5ac <main+0x5a6>
 23c:	2039 0000 2dcc 	move.l 2dcc <Copperlist1+0x40>,d0
 242:	b092           	cmp.l (a2),d0
 244:	6600 0388      	bne.w 5ce <main+0x5c8>
 248:	2239 0000 2dd0 	move.l 2dd0 <Copperlist1+0x44>,d1
 24e:	b2b9 0000 2d00 	cmp.l 2d00 <ClScreen+0x4>,d1
 254:	6600 0378      	bne.w 5ce <main+0x5c8>
 258:	2039 0000 2d04 	move.l 2d04 <ClScreen+0x8>,d0
 25e:	b0b9 0000 2dd4 	cmp.l 2dd4 <Copperlist1+0x48>,d0
 264:	6600 0368      	bne.w 5ce <main+0x5c8>
 268:	2239 0000 2d08 	move.l 2d08 <ClScreen+0xc>,d1
 26e:	b2b9 0000 2dd8 	cmp.l 2dd8 <Copperlist1+0x4c>,d1
 274:	6600 0358      	bne.w 5ce <main+0x5c8>
 278:	2039 0000 2ddc 	move.l 2ddc <Copperlist1+0x50>,d0
 27e:	b0b9 0000 2d0c 	cmp.l 2d0c <ClScreen+0x10>,d0
 284:	6600 0348      	bne.w 5ce <main+0x5c8>
 288:	2239 0000 2d10 	move.l 2d10 <ClScreen+0x14>,d1
 28e:	b2b9 0000 2de0 	cmp.l 2de0 <Copperlist1+0x54>,d1
 294:	6600 0338      	bne.w 5ce <main+0x5c8>
 298:	2039 0000 2de4 	move.l 2de4 <Copperlist1+0x58>,d0
 29e:	b0b9 0000 2d14 	cmp.l 2d14 <ClScreen+0x18>,d0
 2a4:	6600 0328      	bne.w 5ce <main+0x5c8>
 2a8:	2239 0000 2de8 	move.l 2de8 <Copperlist1+0x5c>,d1
 2ae:	b2b9 0000 2d18 	cmp.l 2d18 <ClScreen+0x1c>,d1
 2b4:	6600 0318      	bne.w 5ce <main+0x5c8>
 2b8:	2039 0000 2dec 	move.l 2dec <Copperlist1+0x60>,d0
 2be:	b0b9 0000 2d1c 	cmp.l 2d1c <ClScreen+0x20>,d0
 2c4:	6600 0308      	bne.w 5ce <main+0x5c8>
 2c8:	2239 0000 2df0 	move.l 2df0 <Copperlist1+0x64>,d1
 2ce:	b2b9 0000 2d20 	cmp.l 2d20 <ClScreen+0x24>,d1
 2d4:	6600 02f8      	bne.w 5ce <main+0x5c8>
 2d8:	2039 0000 2df4 	move.l 2df4 <Copperlist1+0x68>,d0
 2de:	b0b9 0000 2d24 	cmp.l 2d24 <ClScreen+0x28>,d0
 2e4:	6600 02e8      	bne.w 5ce <main+0x5c8>
 2e8:	2239 0000 2df8 	move.l 2df8 <Copperlist1+0x6c>,d1
 2ee:	b2b9 0000 2d28 	cmp.l 2d28 <ClScreen+0x2c>,d1
 2f4:	6600 02d8      	bne.w 5ce <main+0x5c8>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                           44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                           54);
  DrawBuffer = 0x40000;
 2f8:	23fc 0004 0000 	move.l #262144,2d88 <DrawBuffer>
 2fe:	0000 2d88 
  ViewBuffer = 0x50000;
 302:	23fc 0005 0000 	move.l #327680,2d84 <ViewBuffer>
 308:	0000 2d84 
  SetBplPointers();
 30c:	4eb9 0000 07ae 	jsr 7ae <SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
 312:	0cb9 0005 0000 	cmpi.l #327680,2d88 <DrawBuffer>
 318:	0000 2d88 
 31c:	6700 02f6      	beq.w 614 <main+0x60e>
    Write( Output(), 
 320:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 326:	4eae ffc4      	jsr -60(a6)
 32a:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 330:	2200           	move.l d0,d1
 332:	243c 0000 0bb6 	move.l #2998,d2
 338:	763b           	moveq #59,d3
 33a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 33e:	0cb9 00e0 0004 	cmpi.l #14680068,2dfc <Copperlist1+0x70>
 344:	0000 2dfc 
 348:	671e           	beq.s 368 <main+0x362>
           "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
 34a:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 350:	4eae ffc4      	jsr -60(a6)
 354:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 35a:	2200           	move.l d0,d1
 35c:	243c 0000 0bf2 	move.l #3058,d2
 362:	763c           	moveq #60,d3
 364:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 368:	0cb9 00e2 0000 	cmpi.l #14811136,2e00 <Copperlist1+0x74>
 36e:	0000 2e00 
 372:	671e           	beq.s 392 <main+0x38c>
          "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
 374:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 37a:	4eae ffc4      	jsr -60(a6)
 37e:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 384:	2200           	move.l d0,d1
 386:	243c 0000 0c2f 	move.l #3119,d2
 38c:	763c           	moveq #60,d3
 38e:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
 392:	70fe           	moveq #-2,d0
 394:	b0b9 0000 2e04 	cmp.l 2e04 <Copperlist1+0x78>,d0
 39a:	671e           	beq.s 3ba <main+0x3b4>
          "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if( TestCopperlistPos( Copperlist1, 30, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
 39c:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 3a2:	4eae ffc4      	jsr -60(a6)
 3a6:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 3ac:	2200           	move.l d0,d1
 3ae:	243c 0000 0c6c 	move.l #3180,d2
 3b4:	761f           	moveq #31,d3
 3b6:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
 3ba:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 3c0:	7232           	moveq #50,d1
 3c2:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
 3c6:	247c 00f0 ff60 	movea.l #15794016,a2
 3cc:	4a92           	tst.l (a2)
 3ce:	6718           	beq.s 3e8 <main+0x3e2>
 3d0:	4878 0001      	pea 1 <_start+0x1>
 3d4:	47f9 0000 06a4 	lea 6a4 <warpmode.part.0>,a3
 3da:	4e93           	jsr (a3)
 3dc:	588f           	addq.l #4,sp
 3de:	4a92           	tst.l (a2)
 3e0:	6706           	beq.s 3e8 <main+0x3e2>
 3e2:	42a7           	clr.l -(sp)
 3e4:	4e93           	jsr (a3)
 3e6:	588f           	addq.l #4,sp
  DrawBuffer = ViewBuffer;
  ViewBuffer = tmp;
}

void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
 3e8:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 3ee:	23ee 0022 0000 	move.l 34(a6),2e08 <ActiView>
 3f4:	2e08 
	OwnBlitter();
 3f6:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
 3fa:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 400:	4eae ff1c      	jsr -228(a6)
	Disable();
 404:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 40a:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
 40e:	2479 0000 2e22 	movea.l 2e22 <hw>,a2
 414:	302a 0010      	move.w 16(a2),d0
 418:	33c0 0000 2e0c 	move.w d0,2e0c <SystemADKCON>
	SystemInts=hw->intenar;
 41e:	302a 001c      	move.w 28(a2),d0
 422:	33c0 0000 2e10 	move.w d0,2e10 <SystemInts>
	SystemDMA=hw->dmaconr;
 428:	302a 0002      	move.w 2(a2),d0
 42c:	33c0 0000 2e0e 	move.w d0,2e0e <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
 432:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 438:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
 43e:	47f9 0000 07dc 	lea 7dc <WaitVbl>,a3
 444:	4e93           	jsr (a3)
	WaitVbl();
 446:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
 448:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	for(int a=0;a<32;a++)
 44e:	7000           	moveq #0,d0
		hw->color[a]=0;
 450:	2200           	move.l d0,d1
 452:	0681 0000 00c0 	addi.l #192,d1
 458:	d281           	add.l d1,d1
 45a:	35bc 0000 1800 	move.w #0,(0,a2,d1.l)
	for(int a=0;a<32;a++)
 460:	5280           	addq.l #1,d0
 462:	7220           	moveq #32,d1
 464:	b280           	cmp.l d0,d1
 466:	66e8           	bne.s 450 <main+0x44a>

	LoadView(0);
 468:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 46e:	93c9           	suba.l a1,a1
 470:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 474:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 47a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 47e:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 484:	4eae fef2      	jsr -270(a6)

	WaitVbl();
 488:	4e93           	jsr (a3)
	WaitVbl();
 48a:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
 48c:	3f7c 4e7a 001a 	move.w #20090,26(sp)
 492:	3f7c 0801 001c 	move.w #2049,28(sp)
 498:	3f7c 4e73 001e 	move.w #20083,30(sp)
	if (SysBase->AttnFlags & AFF_68010) 
 49e:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 4a4:	082e 0000 0129 	btst #0,297(a6)
 4aa:	6700 01ce      	beq.w 67a <main+0x674>
		vbr = (APTR)Supervisor((void*)getvbr);
 4ae:	7e1a           	moveq #26,d7
 4b0:	de8f           	add.l sp,d7
 4b2:	cf8d           	exg d7,a5
 4b4:	4eae ffe2      	jsr -30(a6)
 4b8:	cf8d           	exg d7,a5

	VBR=GetVBR();
 4ba:	23c0 0000 2e12 	move.l d0,2e12 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 4c0:	2079 0000 2e12 	movea.l 2e12 <VBR.lto_priv.0>,a0
 4c6:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 4ca:	23ca 0000 2e16 	move.l a2,2e16 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
 4d0:	4e93           	jsr (a3)
}

void FreeSystem() { 
	WaitVbl();
 4d2:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 4d4:	2079 0000 2e22 	movea.l 2e22 <hw>,a0
 4da:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 4de:	3028 0002      	move.w 2(a0),d0
 4e2:	0800 000e      	btst #14,d0
 4e6:	66f6           	bne.s 4de <main+0x4d8>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
 4e8:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
 4ee:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
 4f4:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
 4fa:	2279 0000 2e12 	movea.l 2e12 <VBR.lto_priv.0>,a1
 500:	234a 006c      	move.l a2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
 504:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 50a:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
 510:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
 516:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
 51c:	3039 0000 2e10 	move.w 2e10 <SystemInts>,d0
 522:	0040 8000      	ori.w #-32768,d0
 526:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
 52a:	3039 0000 2e0e 	move.w 2e0e <SystemDMA>,d0
 530:	0040 8000      	ori.w #-32768,d0
 534:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
 538:	3039 0000 2e0c 	move.w 2e0c <SystemADKCON>,d0
 53e:	0040 8000      	ori.w #-32768,d0
 542:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
 546:	2279 0000 2e08 	movea.l 2e08 <ActiView>,a1
 54c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
 550:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 556:	4eae fef2      	jsr -270(a6)
	WaitTOF();
 55a:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 560:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
 564:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 56a:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
 56e:	2c79 0000 2e1e 	movea.l 2e1e <GfxBase>,a6
 574:	4eae fe32      	jsr -462(a6)
	Enable();
 578:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 57e:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
 582:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 588:	2279 0000 2e1a 	movea.l 2e1a <DOSBase>,a1
 58e:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
 592:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 598:	2279 0000 2e1e 	movea.l 2e1e <GfxBase>,a1
 59e:	4eae fe62      	jsr -414(a6)
}
 5a2:	7000           	moveq #0,d0
 5a4:	4cdf 4c8c      	movem.l (sp)+,d2-d3/d7/a2-a3/a6
 5a8:	508f           	addq.l #8,sp
 5aa:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
 5ac:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 5b2:	4eae ffc4      	jsr -60(a6)
 5b6:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 5bc:	2200           	move.l d0,d1
 5be:	243c 0000 0cc5 	move.l #3269,d2
 5c4:	762c           	moveq #44,d3
 5c6:	4eae ffd0      	jsr -48(a6)
 5ca:	6000 fc70      	bra.w 23c <main+0x236>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
 5ce:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 5d4:	4eae ffc4      	jsr -60(a6)
 5d8:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 5de:	2200           	move.l d0,d1
 5e0:	243c 0000 0c8e 	move.l #3214,d2
 5e6:	7636           	moveq #54,d3
 5e8:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
 5ec:	23fc 0004 0000 	move.l #262144,2d88 <DrawBuffer>
 5f2:	0000 2d88 
  ViewBuffer = 0x50000;
 5f6:	23fc 0005 0000 	move.l #327680,2d84 <ViewBuffer>
 5fc:	0000 2d84 
  SetBplPointers();
 600:	4eb9 0000 07ae 	jsr 7ae <SetBplPointers>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
 606:	0cb9 0005 0000 	cmpi.l #327680,2d88 <DrawBuffer>
 60c:	0000 2d88 
 610:	6600 fd0e      	bne.w 320 <main+0x31a>
 614:	0cb9 0004 0000 	cmpi.l #262144,2d84 <ViewBuffer>
 61a:	0000 2d84 
 61e:	6700 fd1e      	beq.w 33e <main+0x338>
    Write( Output(), 
 622:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 628:	4eae ffc4      	jsr -60(a6)
 62c:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 632:	2200           	move.l d0,d1
 634:	243c 0000 0bb6 	move.l #2998,d2
 63a:	763b           	moveq #59,d3
 63c:	4eae ffd0      	jsr -48(a6)
 640:	6000 fcfc      	bra.w 33e <main+0x338>
		Exit(0);
 644:	9dce           	suba.l a6,a6
 646:	7200           	moveq #0,d1
 648:	4eae ff70      	jsr -144(a6)
 64c:	6000 fa04      	bra.w 52 <main+0x4c>
		Exit(0);
 650:	2c79 0000 2e1a 	movea.l 2e1a <DOSBase>,a6
 656:	7200           	moveq #0,d1
 658:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
 65c:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 662:	43f9 0000 0b7e 	lea b7e <incbin_colors_end+0x5a>,a1
 668:	7000           	moveq #0,d0
 66a:	4eae fdd8      	jsr -552(a6)
 66e:	23c0 0000 2e1a 	move.l d0,2e1a <DOSBase>
	if (!DOSBase)
 674:	6600 f9dc      	bne.w 52 <main+0x4c>
 678:	60ca           	bra.s 644 <main+0x63e>
	APTR vbr = 0;
 67a:	7000           	moveq #0,d0
	VBR=GetVBR();
 67c:	23c0 0000 2e12 	move.l d0,2e12 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
 682:	2079 0000 2e12 	movea.l 2e12 <VBR.lto_priv.0>,a0
 688:	2468 006c      	movea.l 108(a0),a2
	SystemIrq=GetInterruptHandler(); //store interrupt register
 68c:	23ca 0000 2e16 	move.l a2,2e16 <SystemIrq>
	WaitVbl();
 692:	4e93           	jsr (a3)
	WaitVbl();
 694:	4e93           	jsr (a3)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
 696:	2079 0000 2e22 	movea.l 2e22 <hw>,a0
 69c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
 6a0:	6000 fe3c      	bra.w 4de <main+0x4d8>

000006a4 <warpmode.part.0>:
void warpmode(int on) 
 6a4:	598f           	subq.l #4,sp
 6a6:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 6a8:	4aaf 000c      	tst.l 12(sp)
 6ac:	674c           	beq.s 6fa <warpmode.part.0+0x56>
 6ae:	4878 0001      	pea 1 <_start+0x1>
 6b2:	740b           	moveq #11,d2
 6b4:	d48f           	add.l sp,d2
 6b6:	2f02           	move.l d2,-(sp)
 6b8:	42a7           	clr.l -(sp)
 6ba:	4879 0000 0b58 	pea b58 <incbin_colors_end+0x34>
 6c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1adb>
 6c4:	4878 0052      	pea 52 <main+0x4c>
 6c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01a3c>
 6ce:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 6d2:	203c 0000 0b3e 	move.l #2878,d0
 6d8:	4878 0001      	pea 1 <_start+0x1>
 6dc:	2f02           	move.l d2,-(sp)
 6de:	42a7           	clr.l -(sp)
 6e0:	2f00           	move.l d0,-(sp)
 6e2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1adb>
 6e6:	4878 0052      	pea 52 <main+0x4c>
 6ea:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01a3c>
	}
}
 6f0:	4fef 0018      	lea 24(sp),sp
 6f4:	241f           	move.l (sp)+,d2
 6f6:	588f           	addq.l #4,sp
 6f8:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
 6fa:	4878 0001      	pea 1 <_start+0x1>
 6fe:	740b           	moveq #11,d2
 700:	d48f           	add.l sp,d2
 702:	2f02           	move.l d2,-(sp)
 704:	42a7           	clr.l -(sp)
 706:	4879 0000 0b62 	pea b62 <incbin_colors_end+0x3e>
 70c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1adb>
 710:	4878 0052      	pea 52 <main+0x4c>
 714:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01a3c>
 71a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
 71e:	203c 0000 0b25 	move.l #2853,d0
 724:	4878 0001      	pea 1 <_start+0x1>
 728:	2f02           	move.l d2,-(sp)
 72a:	42a7           	clr.l -(sp)
 72c:	2f00           	move.l d0,-(sp)
 72e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xffff1adb>
 732:	4878 0052      	pea 52 <main+0x4c>
 736:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01a3c>
}
 73c:	4fef 0018      	lea 24(sp),sp
 740:	241f           	move.l (sp)+,d2
 742:	588f           	addq.l #4,sp
 744:	4e75           	rts

00000746 <KPrintF>:
{
 746:	4fef ff80      	lea -128(sp),sp
 74a:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
 74e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xf01a3c>
 754:	6734           	beq.s 78a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
 756:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 75c:	206f 0090      	movea.l 144(sp),a0
 760:	43ef 0094      	lea 148(sp),a1
 764:	45f9 0000 0aa0 	lea aa0 <PutChar>,a2
 76a:	47ef 000c      	lea 12(sp),a3
 76e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
 772:	2f0b           	move.l a3,-(sp)
 774:	4878 0056      	pea 56 <main+0x50>
 778:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xf01a3c>
 77e:	508f           	addq.l #8,sp
}
 780:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 784:	4fef 0080      	lea 128(sp),sp
 788:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
 78a:	2c79 0000 2e26 	movea.l 2e26 <SysBase>,a6
 790:	206f 0090      	movea.l 144(sp),a0
 794:	43ef 0094      	lea 148(sp),a1
 798:	45f9 0000 0a92 	lea a92 <KPutCharX>,a2
 79e:	97cb           	suba.l a3,a3
 7a0:	4eae fdf6      	jsr -522(a6)
}
 7a4:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
 7a8:	4fef 0080      	lea 128(sp),sp
 7ac:	4e75           	rts

000007ae <SetBplPointers>:
  UWORD highword = DrawBuffer >> 16;
 7ae:	2039 0000 2d88 	move.l 2d88 <DrawBuffer>,d0
  *CopBpl1Low = lowword;
 7b4:	2079 0000 2d7c 	movea.l 2d7c <CopBpl1Low>,a0
  UWORD lowword = DrawBuffer & 0xffff;
 7ba:	3080           	move.w d0,(a0)
  UWORD highword = DrawBuffer >> 16;
 7bc:	2200           	move.l d0,d1
 7be:	4241           	clr.w d1
 7c0:	4841           	swap d1
 7c2:	2079 0000 2d80 	movea.l 2d80 <CopBpl1High>,a0
 7c8:	3081           	move.w d1,(a0)
  DrawBuffer = ViewBuffer;
 7ca:	23f9 0000 2d84 	move.l 2d84 <ViewBuffer>,2d88 <DrawBuffer>
 7d0:	0000 2d88 
  ViewBuffer = tmp;
 7d4:	23c0 0000 2d84 	move.l d0,2d84 <ViewBuffer>
}
 7da:	4e75           	rts

000007dc <WaitVbl>:
void WaitVbl() {
 7dc:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 7de:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf0ae0>,d0
 7e4:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
 7e6:	2017           	move.l (sp),d0
 7e8:	0280 0001 ff00 	andi.l #130816,d0
 7ee:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
 7f0:	2017           	move.l (sp),d0
 7f2:	0c80 0001 3700 	cmpi.l #79616,d0
 7f8:	67e4           	beq.s 7de <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
 7fa:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdf0ae0>,d0
 800:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
 804:	202f 0004      	move.l 4(sp),d0
 808:	0280 0001 ff00 	andi.l #130816,d0
 80e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
 812:	202f 0004      	move.l 4(sp),d0
 816:	0c80 0001 3700 	cmpi.l #79616,d0
 81c:	66dc           	bne.s 7fa <WaitVbl+0x1e>
}
 81e:	508f           	addq.l #8,sp
 820:	4e75           	rts

00000822 <memcpy>:
{
 822:	48e7 3820      	movem.l d2-d4/a2,-(sp)
 826:	202f 0014      	move.l 20(sp),d0
 82a:	226f 0018      	movea.l 24(sp),a1
 82e:	222f 001c      	move.l 28(sp),d1
	while(len--)
 832:	2601           	move.l d1,d3
 834:	5383           	subq.l #1,d3
 836:	4a81           	tst.l d1
 838:	6762           	beq.s 89c <memcpy+0x7a>
 83a:	2040           	movea.l d0,a0
 83c:	5888           	addq.l #4,a0
 83e:	b1c9           	cmpa.l a1,a0
 840:	53c2           	sl.s d2
 842:	4402           	neg.b d2
 844:	41e9 0004      	lea 4(a1),a0
 848:	b1c0           	cmpa.l d0,a0
 84a:	53c4           	sl.s d4
 84c:	4404           	neg.b d4
 84e:	8404           	or.b d4,d2
 850:	7808           	moveq #8,d4
 852:	b883           	cmp.l d3,d4
 854:	55c4           	sc.s d4
 856:	4404           	neg.b d4
 858:	c404           	and.b d4,d2
 85a:	6746           	beq.s 8a2 <memcpy+0x80>
 85c:	2409           	move.l a1,d2
 85e:	8480           	or.l d0,d2
 860:	7803           	moveq #3,d4
 862:	c484           	and.l d4,d2
 864:	663c           	bne.s 8a2 <memcpy+0x80>
 866:	2049           	movea.l a1,a0
 868:	2440           	movea.l d0,a2
 86a:	74fc           	moveq #-4,d2
 86c:	c481           	and.l d1,d2
 86e:	d489           	add.l a1,d2
		*d++ = *s++;
 870:	24d8           	move.l (a0)+,(a2)+
 872:	b488           	cmp.l a0,d2
 874:	66fa           	bne.s 870 <memcpy+0x4e>
 876:	74fc           	moveq #-4,d2
 878:	c481           	and.l d1,d2
 87a:	2040           	movea.l d0,a0
 87c:	d1c2           	adda.l d2,a0
 87e:	d3c2           	adda.l d2,a1
 880:	9682           	sub.l d2,d3
 882:	b481           	cmp.l d1,d2
 884:	6716           	beq.s 89c <memcpy+0x7a>
 886:	1091           	move.b (a1),(a0)
	while(len--)
 888:	4a83           	tst.l d3
 88a:	6710           	beq.s 89c <memcpy+0x7a>
		*d++ = *s++;
 88c:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
 892:	5383           	subq.l #1,d3
 894:	6706           	beq.s 89c <memcpy+0x7a>
		*d++ = *s++;
 896:	1169 0002 0002 	move.b 2(a1),2(a0)
}
 89c:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
 8a0:	4e75           	rts
 8a2:	2040           	movea.l d0,a0
 8a4:	d289           	add.l a1,d1
		*d++ = *s++;
 8a6:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 8a8:	b289           	cmp.l a1,d1
 8aa:	67f0           	beq.s 89c <memcpy+0x7a>
		*d++ = *s++;
 8ac:	10d9           	move.b (a1)+,(a0)+
	while(len--)
 8ae:	b289           	cmp.l a1,d1
 8b0:	66f4           	bne.s 8a6 <memcpy+0x84>
 8b2:	60e8           	bra.s 89c <memcpy+0x7a>

000008b4 <memset>:
{
 8b4:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
 8b8:	202f 0024      	move.l 36(sp),d0
 8bc:	2a2f 0028      	move.l 40(sp),d5
 8c0:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
 8c4:	2809           	move.l a1,d4
 8c6:	5384           	subq.l #1,d4
 8c8:	b2fc 0000      	cmpa.w #0,a1
 8cc:	6f00 00b0      	ble.w 97e <memset+0xca>
 8d0:	1e05           	move.b d5,d7
 8d2:	2200           	move.l d0,d1
 8d4:	4481           	neg.l d1
 8d6:	7403           	moveq #3,d2
 8d8:	c282           	and.l d2,d1
 8da:	7c05           	moveq #5,d6
		*ptr++ = val;
 8dc:	2440           	movea.l d0,a2
 8de:	bc84           	cmp.l d4,d6
 8e0:	646a           	bcc.s 94c <memset+0x98>
 8e2:	4a81           	tst.l d1
 8e4:	6724           	beq.s 90a <memset+0x56>
 8e6:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
 8e8:	5384           	subq.l #1,d4
 8ea:	7401           	moveq #1,d2
 8ec:	b481           	cmp.l d1,d2
 8ee:	671a           	beq.s 90a <memset+0x56>
		*ptr++ = val;
 8f0:	2440           	movea.l d0,a2
 8f2:	548a           	addq.l #2,a2
 8f4:	2040           	movea.l d0,a0
 8f6:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
 8fa:	5384           	subq.l #1,d4
 8fc:	7403           	moveq #3,d2
 8fe:	b481           	cmp.l d1,d2
 900:	6608           	bne.s 90a <memset+0x56>
		*ptr++ = val;
 902:	528a           	addq.l #1,a2
 904:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
 908:	5384           	subq.l #1,d4
 90a:	2609           	move.l a1,d3
 90c:	9681           	sub.l d1,d3
 90e:	7c00           	moveq #0,d6
 910:	1c05           	move.b d5,d6
 912:	2406           	move.l d6,d2
 914:	4842           	swap d2
 916:	4242           	clr.w d2
 918:	2042           	movea.l d2,a0
 91a:	2406           	move.l d6,d2
 91c:	e14a           	lsl.w #8,d2
 91e:	4842           	swap d2
 920:	4242           	clr.w d2
 922:	e18e           	lsl.l #8,d6
 924:	2646           	movea.l d6,a3
 926:	2c08           	move.l a0,d6
 928:	8486           	or.l d6,d2
 92a:	2c0b           	move.l a3,d6
 92c:	8486           	or.l d6,d2
 92e:	1407           	move.b d7,d2
 930:	2040           	movea.l d0,a0
 932:	d1c1           	adda.l d1,a0
 934:	72fc           	moveq #-4,d1
 936:	c283           	and.l d3,d1
 938:	d288           	add.l a0,d1
		*ptr++ = val;
 93a:	20c2           	move.l d2,(a0)+
 93c:	b1c1           	cmpa.l d1,a0
 93e:	66fa           	bne.s 93a <memset+0x86>
 940:	72fc           	moveq #-4,d1
 942:	c283           	and.l d3,d1
 944:	d5c1           	adda.l d1,a2
 946:	9881           	sub.l d1,d4
 948:	b283           	cmp.l d3,d1
 94a:	6732           	beq.s 97e <memset+0xca>
 94c:	1485           	move.b d5,(a2)
	while(len-- > 0)
 94e:	4a84           	tst.l d4
 950:	6f2c           	ble.s 97e <memset+0xca>
		*ptr++ = val;
 952:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
 956:	7201           	moveq #1,d1
 958:	b284           	cmp.l d4,d1
 95a:	6c22           	bge.s 97e <memset+0xca>
		*ptr++ = val;
 95c:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
 960:	7402           	moveq #2,d2
 962:	b484           	cmp.l d4,d2
 964:	6c18           	bge.s 97e <memset+0xca>
		*ptr++ = val;
 966:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
 96a:	7c03           	moveq #3,d6
 96c:	bc84           	cmp.l d4,d6
 96e:	6c0e           	bge.s 97e <memset+0xca>
		*ptr++ = val;
 970:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
 974:	7204           	moveq #4,d1
 976:	b284           	cmp.l d4,d1
 978:	6c04           	bge.s 97e <memset+0xca>
		*ptr++ = val;
 97a:	1545 0005      	move.b d5,5(a2)
}
 97e:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
 982:	4e75           	rts

00000984 <strlen>:
{
 984:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
 988:	7000           	moveq #0,d0
	while(*s++)
 98a:	4a10           	tst.b (a0)
 98c:	6708           	beq.s 996 <strlen+0x12>
		t++;
 98e:	5280           	addq.l #1,d0
	while(*s++)
 990:	4a30 0800      	tst.b (0,a0,d0.l)
 994:	66f8           	bne.s 98e <strlen+0xa>
}
 996:	4e75           	rts

00000998 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
 998:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
 99c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
 9a0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
 9a4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
 9a8:	d041           	add.w d1,d0
	swap	d0
 9aa:	4840           	swap d0
	clrw	d0
 9ac:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
 9ae:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
 9b2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
 9b6:	d081           	add.l d1,d0

	rts
 9b8:	4e75           	rts

000009ba <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
 9ba:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
 9bc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
 9c0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
 9c4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
 9ca:	6416           	bcc.s 9e2 <__udivsi3+0x28>
	movel	d0, d2
 9cc:	2400           	move.l d0,d2
	clrw	d2
 9ce:	4242           	clr.w d2
	swap	d2
 9d0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
 9d2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
 9d4:	3002           	move.w d2,d0
	swap	d0
 9d6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
 9d8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
 9dc:	84c1           	divu.w d1,d2
	movew	d2, d0
 9de:	3002           	move.w d2,d0
	jra	6f
 9e0:	6030           	bra.s a12 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
 9e2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
 9e4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
 9e6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
 9e8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
 9ee:	64f4           	bcc.s 9e4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
 9f0:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
 9f2:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
 9f8:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
 9fa:	c2c0           	mulu.w d0,d1
	swap	d2
 9fc:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
 9fe:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
 a00:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
 a02:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
 a04:	660a           	bne.s a10 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
 a06:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
 a08:	6506           	bcs.s a10 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
 a0a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
 a0e:	6302           	bls.s a12 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
 a10:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
 a12:	241f           	move.l (sp)+,d2
	rts
 a14:	4e75           	rts

00000a16 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
 a16:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
 a18:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
 a1a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
 a1e:	6a04           	bpl.s a24 <__divsi3+0xe>
	negl	d1
 a20:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
 a22:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
 a24:	202f 0008      	move.l 8(sp),d0
	jpl	2f
 a28:	6a04           	bpl.s a2e <__divsi3+0x18>
	negl	d0
 a2a:	4480           	neg.l d0
	negb	d2
 a2c:	4402           	neg.b d2

2:	movel	d1, sp@-
 a2e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a30:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
 a32:	6186           	bsr.s 9ba <__udivsi3>
	addql	IMM (8), sp
 a34:	508f           	addq.l #8,sp

	tstb	d2
 a36:	4a02           	tst.b d2
	jpl	3f
 a38:	6a02           	bpl.s a3c <__divsi3+0x26>
	negl	d0
 a3a:	4480           	neg.l d0

3:	movel	sp@+, d2
 a3c:	241f           	move.l (sp)+,d2
	rts
 a3e:	4e75           	rts

00000a40 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 a40:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 a44:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 a48:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a4a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
 a4c:	61c8           	bsr.s a16 <__divsi3>
	addql	IMM (8), sp
 a4e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 a50:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 a54:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a56:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 a58:	6100 ff3e      	bsr.w 998 <__mulsi3>
	addql	IMM (8), sp
 a5c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 a5e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 a62:	9280           	sub.l d0,d1
	movel	d1, d0
 a64:	2001           	move.l d1,d0
	rts
 a66:	4e75           	rts

00000a68 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
 a68:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
 a6c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
 a70:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a72:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
 a74:	6100 ff44      	bsr.w 9ba <__udivsi3>
	addql	IMM (8), sp
 a78:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
 a7a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
 a7e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
 a80:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
 a82:	6100 ff14      	bsr.w 998 <__mulsi3>
	addql	IMM (8), sp
 a86:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
 a88:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
 a8c:	9280           	sub.l d0,d1
	movel	d1, d0
 a8e:	2001           	move.l d1,d0
	rts
 a90:	4e75           	rts

00000a92 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
 a92:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
 a94:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
 a98:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
 a9c:	2c5f           	movea.l (sp)+,a6
    rts
 a9e:	4e75           	rts

00000aa0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
 aa0:	16c0           	move.b d0,(a3)+
	rts
 aa2:	4e75           	rts
