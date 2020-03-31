
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
       6:	4e55 ff68      	link.w a5,#-152
       a:	48e7 3f3a      	movem.l d2-d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 7646 	move.l a6,7646 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,761a <hw>
      1e:	0000 761a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 4ba9 	lea 4ba9 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 761e 	move.l d0,761e <GfxBase>
	if (!GfxBase)
      34:	6700 2df6      	beq.w 2e2c <main+0x2e26>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
      3e:	43f9 0000 4bba 	lea 4bba <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 7642 	move.l d0,7642 <DOSBase>
	if (!DOSBase)
      50:	6700 2dce      	beq.w 2e20 <main+0x2e1a>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 4bc6 	pea 4bc6 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 3010 	jsr 3010 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 4be2 	move.l #19426,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
      84:	7232           	moveq #50,d1
      86:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      8a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
      90:	4eae ffc4      	jsr -60(a6)
      94:	2079 0000 761a 	movea.l 761a <hw>,a0
      9a:	2628 0080      	move.l 128(a0),d3
      9e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
      a4:	2200           	move.l d0,d1
      a6:	243c 0000 4bf2 	move.l #19442,d2
      ac:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      b0:	47f9 0000 3382 	lea 3382 <ClBuild>,a3
      b6:	4e93           	jsr (a3)
      b8:	2440           	movea.l d0,a2
      ba:	23c0 0000 763e 	move.l d0,763e <Copperlist1>
  DrawCopper = Copperlist1;
      c0:	23c0 0000 762e 	move.l d0,762e <DrawCopper>
  Copperlist2 = ClBuild();
      c6:	4e93           	jsr (a3)
      c8:	23c0 0000 763a 	move.l d0,763a <Copperlist2>
  ViewCopper = Copperlist2;
      ce:	23c0 0000 7622 	move.l d0,7622 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d4:	588f           	addq.l #4,sp
      d6:	2039 0000 7580 	move.l 7580 <ClsSprites>,d0
      dc:	b092           	cmp.l (a2),d0
      de:	6600 26ba      	bne.w 279a <main+0x2794>
      e2:	2079 0000 7584 	movea.l 7584 <ClsSprites+0x4>,a0
      e8:	b1ea 0004      	cmpa.l 4(a2),a0
      ec:	6600 26ac      	bne.w 279a <main+0x2794>
      f0:	2039 0000 7588 	move.l 7588 <ClsSprites+0x8>,d0
      f6:	b0aa 0008      	cmp.l 8(a2),d0
      fa:	6600 269e      	bne.w 279a <main+0x2794>
      fe:	2079 0000 758c 	movea.l 758c <ClsSprites+0xc>,a0
     104:	b1ea 000c      	cmpa.l 12(a2),a0
     108:	6600 2690      	bne.w 279a <main+0x2794>
     10c:	2039 0000 7590 	move.l 7590 <ClsSprites+0x10>,d0
     112:	b0aa 0010      	cmp.l 16(a2),d0
     116:	6600 2682      	bne.w 279a <main+0x2794>
     11a:	2079 0000 7594 	movea.l 7594 <ClsSprites+0x14>,a0
     120:	b1ea 0014      	cmpa.l 20(a2),a0
     124:	6600 2674      	bne.w 279a <main+0x2794>
     128:	2039 0000 7598 	move.l 7598 <ClsSprites+0x18>,d0
     12e:	b0aa 0018      	cmp.l 24(a2),d0
     132:	6600 2666      	bne.w 279a <main+0x2794>
     136:	2079 0000 759c 	movea.l 759c <ClsSprites+0x1c>,a0
     13c:	b1ea 001c      	cmpa.l 28(a2),a0
     140:	6600 2658      	bne.w 279a <main+0x2794>
     144:	202a 0020      	move.l 32(a2),d0
     148:	b0b9 0000 75a0 	cmp.l 75a0 <ClsSprites+0x20>,d0
     14e:	6600 264a      	bne.w 279a <main+0x2794>
     152:	2079 0000 75a4 	movea.l 75a4 <ClsSprites+0x24>,a0
     158:	b1ea 0024      	cmpa.l 36(a2),a0
     15c:	6600 263c      	bne.w 279a <main+0x2794>
     160:	2039 0000 75a8 	move.l 75a8 <ClsSprites+0x28>,d0
     166:	b0aa 0028      	cmp.l 40(a2),d0
     16a:	6600 262e      	bne.w 279a <main+0x2794>
     16e:	2079 0000 75ac 	movea.l 75ac <ClsSprites+0x2c>,a0
     174:	b1ea 002c      	cmpa.l 44(a2),a0
     178:	6600 2620      	bne.w 279a <main+0x2794>
     17c:	2039 0000 75b0 	move.l 75b0 <ClsSprites+0x30>,d0
     182:	b0aa 0030      	cmp.l 48(a2),d0
     186:	6600 2612      	bne.w 279a <main+0x2794>
     18a:	2079 0000 75b4 	movea.l 75b4 <ClsSprites+0x34>,a0
     190:	b1ea 0034      	cmpa.l 52(a2),a0
     194:	6600 2604      	bne.w 279a <main+0x2794>
     198:	2039 0000 75b8 	move.l 75b8 <ClsSprites+0x38>,d0
     19e:	b0aa 0038      	cmp.l 56(a2),d0
     1a2:	6600 25f6      	bne.w 279a <main+0x2794>
     1a6:	246a 003c      	movea.l 60(a2),a2
     1aa:	b5f9 0000 75bc 	cmpa.l 75bc <ClsSprites+0x3c>,a2
     1b0:	6600 25e8      	bne.w 279a <main+0x2794>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b4:	2079 0000 763e 	movea.l 763e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ba:	2039 0000 7550 	move.l 7550 <ClScreen>,d0
     1c0:	b0a8 0040      	cmp.l 64(a0),d0
     1c4:	6600 261e      	bne.w 27e4 <main+0x27de>
     1c8:	2039 0000 7554 	move.l 7554 <ClScreen+0x4>,d0
     1ce:	b0a8 0044      	cmp.l 68(a0),d0
     1d2:	6600 2610      	bne.w 27e4 <main+0x27de>
     1d6:	2039 0000 7558 	move.l 7558 <ClScreen+0x8>,d0
     1dc:	b0a8 0048      	cmp.l 72(a0),d0
     1e0:	6600 2602      	bne.w 27e4 <main+0x27de>
     1e4:	2039 0000 755c 	move.l 755c <ClScreen+0xc>,d0
     1ea:	b0a8 004c      	cmp.l 76(a0),d0
     1ee:	6600 25f4      	bne.w 27e4 <main+0x27de>
     1f2:	2039 0000 7560 	move.l 7560 <ClScreen+0x10>,d0
     1f8:	b0a8 0050      	cmp.l 80(a0),d0
     1fc:	6600 25e6      	bne.w 27e4 <main+0x27de>
     200:	2039 0000 7564 	move.l 7564 <ClScreen+0x14>,d0
     206:	b0a8 0054      	cmp.l 84(a0),d0
     20a:	6600 25d8      	bne.w 27e4 <main+0x27de>
     20e:	2039 0000 7568 	move.l 7568 <ClScreen+0x18>,d0
     214:	b0a8 0058      	cmp.l 88(a0),d0
     218:	6600 25ca      	bne.w 27e4 <main+0x27de>
     21c:	2039 0000 756c 	move.l 756c <ClScreen+0x1c>,d0
     222:	b0a8 005c      	cmp.l 92(a0),d0
     226:	6600 25bc      	bne.w 27e4 <main+0x27de>
     22a:	2039 0000 7570 	move.l 7570 <ClScreen+0x20>,d0
     230:	b0a8 0060      	cmp.l 96(a0),d0
     234:	6600 25ae      	bne.w 27e4 <main+0x27de>
     238:	2028 0064      	move.l 100(a0),d0
     23c:	b0b9 0000 7574 	cmp.l 7574 <ClScreen+0x24>,d0
     242:	6600 25a0      	bne.w 27e4 <main+0x27de>
     246:	2039 0000 7578 	move.l 7578 <ClScreen+0x28>,d0
     24c:	b0a8 0068      	cmp.l 104(a0),d0
     250:	6600 2592      	bne.w 27e4 <main+0x27de>
     254:	2068 006c      	movea.l 108(a0),a0
     258:	b1f9 0000 757c 	cmpa.l 757c <ClScreen+0x2c>,a0
     25e:	6600 2584      	bne.w 27e4 <main+0x27de>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     262:	23fc 0004 0000 	move.l #262144,7632 <DrawBuffer>
     268:	0000 7632 
  ViewBuffer = (ULONG *)0x50000;
     26c:	23fc 0005 0000 	move.l #327680,7626 <ViewBuffer>
     272:	0000 7626 
  SetBplPointers();
     276:	45f9 0000 3e2e 	lea 3e2e <SetBplPointers>,a2
     27c:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27e:	0cb9 0005 0000 	cmpi.l #327680,7632 <DrawBuffer>
     284:	0000 7632 
     288:	6700 2b66      	beq.w 2df0 <main+0x2dea>
    Write( Output(), 
     28c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     292:	4eae ffc4      	jsr -60(a6)
     296:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     29c:	2200           	move.l d0,d1
     29e:	243c 0000 4bf5 	move.l #19445,d2
     2a4:	763b           	moveq #59,d3
     2a6:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2aa:	2079 0000 763e 	movea.l 763e <Copperlist1>,a0
     2b0:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b6:	0070 
     2b8:	6724           	beq.s 2de <main+0x2d8>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ba:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     2c0:	4eae ffc4      	jsr -60(a6)
     2c4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     2ca:	2200           	move.l d0,d1
     2cc:	243c 0000 4c31 	move.l #19505,d2
     2d2:	763c           	moveq #60,d3
     2d4:	4eae ffd0      	jsr -48(a6)
     2d8:	2079 0000 763e 	movea.l 763e <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2de:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e4:	0074 
     2e6:	6724           	beq.s 30c <main+0x306>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e8:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     2ee:	4eae ffc4      	jsr -60(a6)
     2f2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     2f8:	2200           	move.l d0,d1
     2fa:	243c 0000 4c6e 	move.l #19566,d2
     300:	763c           	moveq #60,d3
     302:	4eae ffd0      	jsr -48(a6)
     306:	2079 0000 763e 	movea.l 763e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30c:	2028 0078      	move.l 120(a0),d0
     310:	b0b9 0000 7548 	cmp.l 7548 <ClColor>,d0
     316:	6600 24a4      	bne.w 27bc <main+0x27b6>
     31a:	2028 007c      	move.l 124(a0),d0
     31e:	b0b9 0000 754c 	cmp.l 754c <ClColor+0x4>,d0
     324:	6600 2496      	bne.w 27bc <main+0x27b6>
  if( instructions[pos] == value ) 
     328:	70fe           	moveq #-2,d0
     32a:	b0a8 0080      	cmp.l 128(a0),d0
     32e:	671e           	beq.s 34e <main+0x348>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     330:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     336:	4eae ffc4      	jsr -60(a6)
     33a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     340:	2200           	move.l d0,d1
     342:	243c 0000 4ccd 	move.l #19661,d2
     348:	7622           	moveq #34,d3
     34a:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34e:	47f9 0000 3c26 	lea 3c26 <SwapCl>,a3
     354:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     356:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
     35c:	b1f9 0000 763a 	cmpa.l 763a <Copperlist2>,a0
     362:	671e           	beq.s 382 <main+0x37c>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     364:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     36a:	4eae ffc4      	jsr -60(a6)
     36e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     374:	2200           	move.l d0,d1
     376:	243c 0000 4cf0 	move.l #19696,d2
     37c:	7615           	moveq #21,d3
     37e:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     382:	49f9 0000 3e5a 	lea 3e5a <PrepareDisplay>,a4
     388:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     38a:	2039 0000 7632 	move.l 7632 <DrawBuffer>,d0
     390:	b0b9 0000 7636 	cmp.l 7636 <Bitplane1>,d0
     396:	671e           	beq.s 3b6 <main+0x3b0>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     398:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     39e:	4eae ffc4      	jsr -60(a6)
     3a2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     3a8:	2200           	move.l d0,d1
     3aa:	243c 0000 4d06 	move.l #19718,d2
     3b0:	7637           	moveq #55,d3
     3b2:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3b6:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
     3bc:	b1f9 0000 763e 	cmpa.l 763e <Copperlist1>,a0
     3c2:	671e           	beq.s 3e2 <main+0x3dc>
    Write( Output(), 
     3c4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     3ca:	4eae ffc4      	jsr -60(a6)
     3ce:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     3d4:	2200           	move.l d0,d1
     3d6:	243c 0000 4d3e 	move.l #19774,d2
     3dc:	7639           	moveq #57,d3
     3de:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3e2:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3e4:	2039 0000 7626 	move.l 7626 <ViewBuffer>,d0
     3ea:	b0b9 0000 762a 	cmp.l 762a <Bitplane2>,d0
     3f0:	671e           	beq.s 410 <main+0x40a>
    Write( Output(), 
     3f2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     3f8:	4eae ffc4      	jsr -60(a6)
     3fc:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     402:	2200           	move.l d0,d1
     404:	243c 0000 4d78 	move.l #19832,d2
     40a:	7638           	moveq #56,d3
     40c:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     410:	2079 0000 7622 	movea.l 7622 <ViewCopper>,a0
     416:	b1f9 0000 763a 	cmpa.l 763a <Copperlist2>,a0
     41c:	671e           	beq.s 43c <main+0x436>
    Write( Output(), 
     41e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     424:	4eae ffc4      	jsr -60(a6)
     428:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     42e:	2200           	move.l d0,d1
     430:	243c 0000 4db1 	move.l #19889,d2
     436:	763a           	moveq #58,d3
     438:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     43c:	4e93           	jsr (a3)
  SetBplPointers();
     43e:	4e92           	jsr (a2)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     440:	2079 0000 7622 	movea.l 7622 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     446:	7000           	moveq #0,d0
     448:	3028 0072      	move.w 114(a0),d0
     44c:	4840           	swap d0
     44e:	4240           	clr.w d0
     450:	7200           	moveq #0,d1
     452:	3228 0076      	move.w 118(a0),d1
     456:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     458:	b0b9 0000 762a 	cmp.l 762a <Bitplane2>,d0
     45e:	671e           	beq.s 47e <main+0x478>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     460:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     466:	4eae ffc4      	jsr -60(a6)
     46a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     470:	2200           	move.l d0,d1
     472:	243c 0000 4dec 	move.l #19948,d2
     478:	7648           	moveq #72,d3
     47a:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     47e:	4e93           	jsr (a3)
  SetBplPointers();
     480:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     482:	2079 0000 7622 	movea.l 7622 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     488:	7000           	moveq #0,d0
     48a:	3028 0072      	move.w 114(a0),d0
     48e:	4840           	swap d0
     490:	4240           	clr.w d0
     492:	7200           	moveq #0,d1
     494:	3228 0076      	move.w 118(a0),d1
     498:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49a:	b0b9 0000 7636 	cmp.l 7636 <Bitplane1>,d0
     4a0:	671e           	beq.s 4c0 <main+0x4ba>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     4a8:	4eae ffc4      	jsr -60(a6)
     4ac:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     4b2:	2200           	move.l d0,d1
     4b4:	243c 0000 4e35 	move.l #20021,d2
     4ba:	7649           	moveq #73,d3
     4bc:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4c0:	4e93           	jsr (a3)
  SetBplPointers();
     4c2:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4c4:	2079 0000 7622 	movea.l 7622 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4ca:	7000           	moveq #0,d0
     4cc:	3028 0072      	move.w 114(a0),d0
     4d0:	4840           	swap d0
     4d2:	4240           	clr.w d0
     4d4:	7200           	moveq #0,d1
     4d6:	3228 0076      	move.w 118(a0),d1
     4da:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4dc:	b0b9 0000 762a 	cmp.l 762a <Bitplane2>,d0
     4e2:	671e           	beq.s 502 <main+0x4fc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     4ea:	4eae ffc4      	jsr -60(a6)
     4ee:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     4f4:	2200           	move.l d0,d1
     4f6:	243c 0000 4e7f 	move.l #20095,d2
     4fc:	7648           	moveq #72,d3
     4fe:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     502:	2f3c 0000 c800 	move.l #51200,-(sp)
     508:	4878 0084      	pea 84 <main+0x7e>
     50c:	4eb9 0000 3f98 	jsr 3f98 <FreeDisplay>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     512:	45f9 0000 3c4c 	lea 3c4c <PrepareDisplayZoom>,a2
     518:	4e92           	jsr (a2)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     51a:	4878 0010      	pea 10 <main+0xa>
     51e:	4879 0000 7580 	pea 7580 <ClsSprites>
     524:	42a7           	clr.l -(sp)
     526:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     52c:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
     532:	4fef 0018      	lea 24(sp),sp
     536:	4a80           	tst.l d0
     538:	661e           	bne.s 558 <main+0x552>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     53a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     540:	4eae ffc4      	jsr -60(a6)
     544:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     54a:	2200           	move.l d0,d1
     54c:	243c 0000 4ec8 	move.l #20168,d2
     552:	762c           	moveq #44,d3
     554:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     558:	4878 000c      	pea c <main+0x6>
     55c:	4879 0000 7518 	pea 7518 <ClScreenZoom>
     562:	4878 0010      	pea 10 <main+0xa>
     566:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     56c:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
     572:	4fef 0010      	lea 16(sp),sp
     576:	4a80           	tst.l d0
     578:	661e           	bne.s 598 <main+0x592>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     57a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     580:	4eae ffc4      	jsr -60(a6)
     584:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     58a:	2200           	move.l d0,d1
     58c:	243c 0000 4efe 	move.l #20222,d2
     592:	7636           	moveq #54,d3
     594:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     598:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     59e:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     5a4:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     5a8:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     5ae:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     5b4:	23fc 0005 0000 	move.l #327680,7632 <DrawBuffer>
     5ba:	0000 7632 
  ViewBuffer = (ULONG *) tmp;
     5be:	23fc 0004 0000 	move.l #262144,7626 <ViewBuffer>
     5c4:	0000 7626 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5c8:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5ce:	4878 001c      	pea 1c <main+0x16>
     5d2:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     5d8:	4eb9 0000 318e 	jsr 318e <TestCopperlistPos>
     5de:	4fef 000c      	lea 12(sp),sp
     5e2:	4a80           	tst.l d0
     5e4:	661e           	bne.s 604 <main+0x5fe>
    Write(Output(), 
     5e6:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     5ec:	4eae ffc4      	jsr -60(a6)
     5f0:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     5f6:	2200           	move.l d0,d1
     5f8:	243c 0000 4c31 	move.l #19505,d2
     5fe:	763c           	moveq #60,d3
     600:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     604:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     60a:	4878 001d      	pea 1d <main+0x17>
     60e:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     614:	4eb9 0000 318e 	jsr 318e <TestCopperlistPos>
     61a:	4fef 000c      	lea 12(sp),sp
     61e:	4a80           	tst.l d0
     620:	661e           	bne.s 640 <main+0x63a>
    Write(Output(), 
     622:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     628:	4eae ffc4      	jsr -60(a6)
     62c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     632:	2200           	move.l d0,d1
     634:	243c 0000 4c6e 	move.l #19566,d2
     63a:	763c           	moveq #60,d3
     63c:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     640:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     646:	4878 001e      	pea 1e <main+0x18>
     64a:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     650:	4eb9 0000 318e 	jsr 318e <TestCopperlistPos>
     656:	4fef 000c      	lea 12(sp),sp
     65a:	4a80           	tst.l d0
     65c:	661e           	bne.s 67c <main+0x676>
    Write(Output(), 
     65e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     664:	4eae ffc4      	jsr -60(a6)
     668:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     66e:	2200           	move.l d0,d1
     670:	243c 0000 4f35 	move.l #20277,d2
     676:	763c           	moveq #60,d3
     678:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     67c:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     682:	4878 001f      	pea 1f <main+0x19>
     686:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     68c:	4eb9 0000 318e 	jsr 318e <TestCopperlistPos>
     692:	4fef 000c      	lea 12(sp),sp
     696:	4a80           	tst.l d0
     698:	661e           	bne.s 6b8 <main+0x6b2>
    Write(Output(), 
     69a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     6a0:	4eae ffc4      	jsr -60(a6)
     6a4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     6aa:	2200           	move.l d0,d1
     6ac:	243c 0000 4f72 	move.l #20338,d2
     6b2:	763c           	moveq #60,d3
     6b4:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6b8:	4878 0002      	pea 2 <_start+0x2>
     6bc:	4879 0000 7548 	pea 7548 <ClColor>
     6c2:	4878 0020      	pea 20 <main+0x1a>
     6c6:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     6cc:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
     6d2:	4fef 0010      	lea 16(sp),sp
     6d6:	4a80           	tst.l d0
     6d8:	661e           	bne.s 6f8 <main+0x6f2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6da:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     6e0:	4eae ffc4      	jsr -60(a6)
     6e4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     6ea:	2200           	move.l d0,d1
     6ec:	243c 0000 4cab 	move.l #19627,d2
     6f2:	7621           	moveq #33,d3
     6f4:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6f8:	4878 0040      	pea 40 <main+0x3a>
     6fc:	4879 0000 51be 	pea 51be <incbin_swfont_end+0x728>
     702:	486d ffc0      	pea -64(a5)
     706:	4eb9 0000 4050 	jsr 4050 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     70c:	4878 0010      	pea 10 <main+0xa>
     710:	486d ffc0      	pea -64(a5)
     714:	4878 0022      	pea 22 <main+0x1c>
     718:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     71e:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
     724:	4fef 001c      	lea 28(sp),sp
     728:	4a80           	tst.l d0
     72a:	661e           	bne.s 74a <main+0x744>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     72c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     732:	4eae ffc4      	jsr -60(a6)
     736:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     73c:	2200           	move.l d0,d1
     73e:	243c 0000 4faf 	move.l #20399,d2
     744:	7621           	moveq #33,d3
     746:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     74a:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     750:	ffb4 
     752:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     758:	ffb8 
     75a:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     760:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     762:	4878 0003      	pea 3 <_start+0x3>
     766:	486d ffb4      	pea -76(a5)
     76a:	4878 004b      	pea 4b <main+0x45>
     76e:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     774:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
     77a:	4fef 0010      	lea 16(sp),sp
     77e:	4a80           	tst.l d0
     780:	661e           	bne.s 7a0 <main+0x79a>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     782:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     788:	4eae ffc4      	jsr -60(a6)
     78c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     792:	2200           	move.l d0,d1
     794:	243c 0000 4fd1 	move.l #20433,d2
     79a:	762c           	moveq #44,d3
     79c:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     7a0:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc5a6>
     7a4:	4878 2922      	pea 2922 <main+0x291c>
     7a8:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
     7ae:	4eb9 0000 318e 	jsr 318e <TestCopperlistPos>
     7b4:	4fef 000c      	lea 12(sp),sp
     7b8:	4a80           	tst.l d0
     7ba:	661e           	bne.s 7da <main+0x7d4>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7bc:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     7c2:	4eae ffc4      	jsr -60(a6)
     7c6:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     7cc:	2200           	move.l d0,d1
     7ce:	243c 0000 4ccd 	move.l #19661,d2
     7d4:	7622           	moveq #34,d3
     7d6:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7da:	2f3c 0001 6800 	move.l #92160,-(sp)
     7e0:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7e6:	4eb9 0000 3f98 	jsr 3f98 <FreeDisplay>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     7ec:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     7f2:	7004           	moveq #4,d0
     7f4:	7202           	moveq #2,d1
     7f6:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
     7fa:	33fc 0010 0000 	move.w #16,7618 <ZoomHorizontal>
     800:	7618 

}

void TestBlitleftOfZoom() {
  Zoom_Init();
  PrepareDisplayZoom();
     802:	4e92           	jsr (a2)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     804:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     80a:	203c 0000 c800 	move.l #51200,d0
     810:	7202           	moveq #2,d1
     812:	4eae ff3a      	jsr -198(a6)
     816:	2040           	movea.l d0,a0
     818:	23c0 0000 7600 	move.l d0,7600 <Zoom_Source>
  if( Zoom_Source == 0) {
     81e:	508f           	addq.l #8,sp
     820:	6700 268e      	beq.w 2eb0 <main+0x2eaa>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     824:	4250           	clr.w (a0)
  *tstsource = 0x0080;
     826:	317c 0080 0002 	move.w #128,2(a0)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     82c:	317c 1000 0030 	move.w #4096,48(a0)
  tstsource++;
  *tstsource = 0x8e88;
     832:	317c 8e88 0032 	move.w #-29048,50(a0)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     838:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
     83c:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
     842:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     848:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     84c:	2479 0000 761a 	movea.l 761a <hw>,a2
     852:	357c ffff 0044 	move.w #-1,68(a2)
  hw->bltalwm = 0xffff;
     858:	357c ffff 0046 	move.w #-1,70(a2)
  hw->bltamod = ZMLINESIZE - 4;
     85e:	357c 002c 0064 	move.w #44,100(a2)
  hw->bltbmod = ZMLINESIZE - 4;
     864:	357c 002c 0062 	move.w #44,98(a2)
  hw->bltdmod = ZMLINESIZE - 4;
     86a:	357c 002c 0066 	move.w #44,102(a2)
    ZoomBlit_Increment4SrcA = 1;
     870:	33fc 0001 0000 	move.w #1,7616 <ZoomBlit_Increment4SrcA>
     876:	7616 
  hw->bltcon1 = shiftb; 
     878:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
     87e:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     884:	357c ff00 0070 	move.w #-256,112(a2)
  Init_Blit();
  Init_ZoomBlit( 7, 16, 0);
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
     88a:	2639 0000 7632 	move.l 7632 <DrawBuffer>,d3
     890:	2439 0000 7600 	move.l 7600 <Zoom_Source>,d2
  WaitBlt();
     896:	4eb9 0000 35e0 	jsr 35e0 <WaitBlt>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     89c:	2002           	move.l d2,d0
     89e:	5480           	addq.l #2,d0
     8a0:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
     8a4:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
     8a8:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
     8ac:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
     8b2:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     8b8:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     8bc:	2479 0000 7632 	movea.l 7632 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     8c2:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8c8:	671e           	beq.s 8e8 <main+0x8e2>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8ca:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     8d0:	4eae ffc4      	jsr -60(a6)
     8d4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     8da:	2200           	move.l d0,d1
     8dc:	243c 0000 5036 	move.l #20534,d2
     8e2:	761c           	moveq #28,d3
     8e4:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8e8:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8ee:	671e           	beq.s 90e <main+0x908>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8f0:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     8f6:	4eae ffc4      	jsr -60(a6)
     8fa:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     900:	2200           	move.l d0,d1
     902:	243c 0000 5053 	move.l #20563,d2
     908:	761c           	moveq #28,d3
     90a:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     90e:	2079 0000 7632 	movea.l 7632 <DrawBuffer>,a0
     914:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     91a:	671e           	beq.s 93a <main+0x934>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     91c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     922:	4eae ffc4      	jsr -60(a6)
     926:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     92c:	2200           	move.l d0,d1
     92e:	243c 0000 5070 	move.l #20592,d2
     934:	761a           	moveq #26,d3
     936:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     93a:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     940:	2279 0000 7600 	movea.l 7600 <Zoom_Source>,a1
     946:	203c 0000 c800 	move.l #51200,d0
     94c:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     950:	2f3c 0001 6800 	move.l #92160,-(sp)
     956:	2f3c 0000 a48c 	move.l #42124,-(sp)
     95c:	4eb9 0000 3f98 	jsr 3f98 <FreeDisplay>
     962:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     964:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     96a:	203c 0000 05a0 	move.l #1440,d0
     970:	7202           	moveq #2,d1
     972:	4eae ff3a      	jsr -198(a6)
     976:	2440           	movea.l d0,a2
  if( source == 0) {
     978:	4a80           	tst.l d0
     97a:	6700 24da      	beq.w 2e56 <main+0x2e50>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     97e:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     984:	203c 0000 05a0 	move.l #1440,d0
     98a:	7202           	moveq #2,d1
     98c:	4eae ff3a      	jsr -198(a6)
     990:	2840           	movea.l d0,a4
  if( destination == 0) {
     992:	4a80           	tst.l d0
     994:	6700 24c0      	beq.w 2e56 <main+0x2e50>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     998:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     99a:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     9a0:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     9a6:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     9aa:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     9ae:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     9b4:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     9ba:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     9be:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     9c2:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     9c8:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     9ce:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     9d2:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     9d6:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     9dc:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     9e2:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     9e6:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     9ea:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     9f0:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     9f6:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     9fa:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     9fe:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     a04:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     a0a:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     a0e:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     a12:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     a18:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     a1e:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     a22:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     a26:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     a2c:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     a32:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     a36:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     a3a:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     a40:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     a46:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     a4a:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     a4e:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     a54:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     a5a:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     a5e:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     a62:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     a68:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     a6e:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     a72:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     a76:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     a7c:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     a82:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     a86:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     a8a:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     a90:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     a96:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     a9a:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     a9e:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     aa4:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     aaa:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     aae:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     ab2:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     ab8:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     abe:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     ac2:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     ac6:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     acc:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     ad2:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     ad6:	4878 05a0      	pea 5a0 <main+0x59a>
     ada:	42a7           	clr.l -(sp)
     adc:	2f00           	move.l d0,-(sp)
     ade:	4eb9 0000 40e2 	jsr 40e2 <memset>
  tmp = destination;
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  WaitBlit();
     ae4:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     aea:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     aee:	2679 0000 761a 	movea.l 761a <hw>,a3
     af4:	377c ffff 0044 	move.w #-1,68(a3)
  hw->bltalwm = 0xffff;
     afa:	377c ffff 0046 	move.w #-1,70(a3)
  hw->bltamod = ZMLINESIZE - 4;
     b00:	377c 002c 0064 	move.w #44,100(a3)
  hw->bltbmod = ZMLINESIZE - 4;
     b06:	377c 002c 0062 	move.w #44,98(a3)
  hw->bltdmod = ZMLINESIZE - 4;
     b0c:	377c 002c 0066 	move.w #44,102(a3)
  WaitBlt();
     b12:	4eb9 0000 35e0 	jsr 35e0 <WaitBlt>
  hw->bltcon1 = 0; 
     b18:	377c 0000 0042 	move.w #0,66(a3)
  hw->bltcon0 = 0x9f0 + shiftright;
     b1e:	377c 39f0 0040 	move.w #14832,64(a3)
  hw->bltapt = (UWORD *) source;
     b24:	200a           	move.l a2,d0
     b26:	5480           	addq.l #2,d0
     b28:	2740 0050      	move.l d0,80(a3)
  hw->bltdpt = (UWORD *) destination;
     b2c:	274c 0054      	move.l a4,84(a3)
  hw->bltsize = height*64+2;
     b30:	377c 0402 0058 	move.w #1026,88(a3)

  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 3, 16);
  WaitBlit();
     b36:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     b3c:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     b40:	4fef 000c      	lea 12(sp),sp
     b44:	0c6c 5555 0002 	cmpi.w #21845,2(a4)
     b4a:	671e           	beq.s b6a <main+0xb64>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     b4c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     b52:	4eae ffc4      	jsr -60(a6)
     b56:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     b5c:	2200           	move.l d0,d1
     b5e:	243c 0000 50c1 	move.l #20673,d2
     b64:	761f           	moveq #31,d3
     b66:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     b6a:	0c6c aaaa 0032 	cmpi.w #-21846,50(a4)
     b70:	671e           	beq.s b90 <main+0xb8a>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     b72:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     b78:	4eae ffc4      	jsr -60(a6)
     b7c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
     b82:	2200           	move.l d0,d1
     b84:	243c 0000 50e1 	move.l #20705,d2
     b8a:	7620           	moveq #32,d3
     b8c:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     b90:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     b96:	224a           	movea.l a2,a1
     b98:	203c 0000 05a0 	move.l #1440,d0
     b9e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     ba2:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     ba8:	224c           	movea.l a4,a1
     baa:	203c 0000 05a0 	move.l #1440,d0
     bb0:	4eae ff2e      	jsr -210(a6)
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */

void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     bb4:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     bba:	203c 0000 3740 	move.l #14144,d0
     bc0:	7202           	moveq #2,d1
     bc2:	4eae ff3a      	jsr -198(a6)
     bc6:	2840           	movea.l d0,a4
  if( source == 0) {
     bc8:	4a80           	tst.l d0
     bca:	6700 22c2      	beq.w 2e8e <main+0x2e88>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     bce:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
     bd4:	203c 0000 3740 	move.l #14144,d0
     bda:	7202           	moveq #2,d1
     bdc:	4eae ff3a      	jsr -198(a6)
     be0:	2640           	movea.l d0,a3
  if( destination == 0) {
     be2:	4a80           	tst.l d0
     be4:	6700 2316      	beq.w 2efc <main+0x2ef6>
     be8:	200c           	move.l a4,d0
     bea:	0680 0000 3300 	addi.l #13056,d0
     bf0:	204c           	movea.l a4,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     bf2:	20bc 5555 5555 	move.l #1431655765,(a0)
     bf8:	217c 5555 5555 	move.l #1431655765,4(a0)
     bfe:	0004 
     c00:	217c 5555 5555 	move.l #1431655765,8(a0)
     c06:	0008 
     c08:	217c 5555 5555 	move.l #1431655765,12(a0)
     c0e:	000c 
     c10:	217c 5555 5555 	move.l #1431655765,16(a0)
     c16:	0010 
     c18:	217c 5555 5555 	move.l #1431655765,20(a0)
     c1e:	0014 
     c20:	217c 5555 5555 	move.l #1431655765,24(a0)
     c26:	0018 
     c28:	217c 5555 5555 	move.l #1431655765,28(a0)
     c2e:	001c 
     c30:	217c 5555 5555 	move.l #1431655765,32(a0)
     c36:	0020 
     c38:	217c 5555 5555 	move.l #1431655765,36(a0)
     c3e:	0024 
     c40:	217c 5555 5555 	move.l #1431655765,40(a0)
     c46:	0028 
     c48:	217c 5555 5555 	move.l #1431655765,44(a0)
     c4e:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     c50:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     c56:	0030 
     c58:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     c5e:	0034 
     c60:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     c66:	0038 
     c68:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     c6e:	003c 
     c70:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     c76:	0040 
     c78:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     c7e:	0044 
     c80:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     c86:	0048 
     c88:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     c8e:	004c 
     c90:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     c96:	0050 
     c98:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     c9e:	0054 
     ca0:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     ca6:	0058 
     ca8:	41e8 0060      	lea 96(a0),a0
     cac:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     cb2:	fffc 
  for(int i=0;i<128+8;i++) {
     cb4:	b1c0           	cmpa.l d0,a0
     cb6:	6600 ff3a      	bne.w bf2 <main+0xbec>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
     cba:	42a7           	clr.l -(sp)
     cbc:	2f0b           	move.l a3,-(sp)
     cbe:	2f0c           	move.l a4,-(sp)
     cc0:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
     cc6:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     ccc:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     cd0:	41eb 0004      	lea 4(a3),a0
     cd4:	2b48 ff7c      	move.l a0,-132(a5)
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0xffff;
  for(int i=0;i<14;i++) {
     cd8:	41eb 0364      	lea 868(a3),a0
     cdc:	2b48 ff78      	move.l a0,-136(a5)
     ce0:	2a08           	move.l a0,d5
     ce2:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     ce6:	3c7c 0012      	movea.w #18,a6
  UWORD mask = 0xffff;
     cea:	74ff           	moveq #-1,d2
     cec:	7600           	moveq #0,d3
     cee:	4643           	not.w d3
     cf0:	45f9 0000 3078 	lea 3078 <TestRow>,a2
     cf6:	280b           	move.l a3,d4
     cf8:	2045           	movea.l d5,a0
     cfa:	41e8 fca0      	lea -864(a0),a0
     cfe:	2b48 ff6c      	move.l a0,-148(a5)
     d02:	47ee ffee      	lea -18(a6),a3
    for(int i2=0;i2<18;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*19);
     d06:	2f0b           	move.l a3,-(sp)
     d08:	2f03           	move.l d3,-(sp)
     d0a:	2f2d ff6c      	move.l -148(a5),-(sp)
     d0e:	4879 0000 74ec 	pea 74ec <destlinezoom1>
     d14:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     d16:	7030           	moveq #48,d0
     d18:	d1ad ff6c      	add.l d0,-148(a5)
      mask = mask ^ 0xffff;
     d1c:	4642           	not.w d2
     d1e:	528b           	addq.l #1,a3
    for(int i2=0;i2<18;i2++) { 
     d20:	4fef 0010      	lea 16(sp),sp
     d24:	baad ff6c      	cmp.l -148(a5),d5
     d28:	6600 1b06      	bne.w 2830 <main+0x282a>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
     d2c:	2f0e           	move.l a6,-(sp)
     d2e:	7600           	moveq #0,d3
     d30:	3602           	move.w d2,d3
     d32:	2f03           	move.l d3,-(sp)
     d34:	2f2d ff6c      	move.l -148(a5),-(sp)
     d38:	4879 0000 74ec 	pea 74ec <destlinezoom1>
     d3e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     d40:	2a2d ff6c      	move.l -148(a5),d5
     d44:	0685 0000 0390 	addi.l #912,d5
     d4a:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<14;i++) {
     d4e:	4fef 0010      	lea 16(sp),sp
     d52:	bcfc 011c      	cmpa.w #284,a6
     d56:	66a0           	bne.s cf8 <main+0xcf2>
     d58:	2644           	movea.l d4,a3
     d5a:	41eb 31e4      	lea 12772(a3),a0
     d5e:	2b48 ff70      	move.l a0,-144(a5)
     d62:	2b48 ff6c      	move.l a0,-148(a5)
     d66:	283c 0000 0109 	move.l #265,d4
  }

  for(int i2=0;i2<4;i2++) { 
    TestRow( valsupposed, valactual, mask, i2+265);
     d6c:	2f04           	move.l d4,-(sp)
     d6e:	2f03           	move.l d3,-(sp)
     d70:	2f2d ff6c      	move.l -148(a5),-(sp)
     d74:	4879 0000 74ec 	pea 74ec <destlinezoom1>
     d7a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     d7c:	7030           	moveq #48,d0
     d7e:	d1ad ff6c      	add.l d0,-148(a5)
    mask = mask ^ 0xffff;
     d82:	4642           	not.w d2
     d84:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
     d86:	4fef 0010      	lea 16(sp),sp
     d8a:	0c84 0000 010d 	cmpi.l #269,d4
     d90:	672a           	beq.s dbc <main+0xdb6>
     d92:	7600           	moveq #0,d3
     d94:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
     d96:	2f04           	move.l d4,-(sp)
     d98:	2f03           	move.l d3,-(sp)
     d9a:	2f2d ff6c      	move.l -148(a5),-(sp)
     d9e:	4879 0000 74ec 	pea 74ec <destlinezoom1>
     da4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     da6:	7030           	moveq #48,d0
     da8:	d1ad ff6c      	add.l d0,-148(a5)
    mask = mask ^ 0xffff;
     dac:	4642           	not.w d2
     dae:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
     db0:	4fef 0010      	lea 16(sp),sp
     db4:	0c84 0000 010d 	cmpi.l #269,d4
     dba:	66d6           	bne.s d92 <main+0xd8c>
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1);
     dbc:	4878 0001      	pea 1 <_start+0x1>
     dc0:	2f0c           	move.l a4,-(sp)
     dc2:	2f0b           	move.l a3,-(sp)
     dc4:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
     dca:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     dd0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     dd4:	41ec 0004      	lea 4(a4),a0
     dd8:	2b48 ff6c      	move.l a0,-148(a5)
     ddc:	4fef 000c      	lea 12(sp),sp
     de0:	2b48 ff74      	move.l a0,-140(a5)
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<11;i2++) { 
     de4:	7600           	moveq #0,d3
  mask = 0x0000;
     de6:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
     de8:	2f03           	move.l d3,-(sp)
     dea:	3f02           	move.w d2,-(sp)
     dec:	4267           	clr.w -(sp)
     dee:	2f2d ff74      	move.l -140(a5),-(sp)
     df2:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     df8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     dfa:	7030           	moveq #48,d0
     dfc:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     e00:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
     e02:	5283           	addq.l #1,d3
     e04:	4fef 0010      	lea 16(sp),sp
     e08:	700b           	moveq #11,d0
     e0a:	b083           	cmp.l d3,d0
     e0c:	66da           	bne.s de8 <main+0xde2>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
     e0e:	4878 0008      	pea 8 <main+0x2>
     e12:	2f3c 0000 ffff 	move.l #65535,-(sp)
     e18:	41ec 0214      	lea 532(a4),a0
     e1c:	2b48 ff94      	move.l a0,-108(a5)
     e20:	2f08           	move.l a0,-(sp)
     e22:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     e28:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
     e2a:	4878 0009      	pea 9 <main+0x3>
     e2e:	2f3c 0000 ffff 	move.l #65535,-(sp)
     e34:	486c 0244      	pea 580(a4)
     e38:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     e3e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
     e40:	4fef 0020      	lea 32(sp),sp
     e44:	4878 000a      	pea a <main+0x4>
     e48:	42a7           	clr.l -(sp)
     e4a:	486c 0274      	pea 628(a4)
     e4e:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     e54:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
     e56:	4878 000b      	pea b <main+0x5>
     e5a:	42a7           	clr.l -(sp)
     e5c:	486c 02a4      	pea 676(a4)
     e60:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     e66:	4e92           	jsr (a2)

  valactual += ZMLINESIZE/2;
  for(int i=0;i<12;i++) {
     e68:	2a0c           	move.l a4,d5
     e6a:	0685 0000 05d4 	addi.l #1492,d5
     e70:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
     e74:	2c05           	move.l d5,d6
     e76:	3c7c 0018      	movea.w #24,a6
     e7a:	7800           	moveq #0,d4
     e7c:	3802           	move.w d2,d4
     e7e:	2e0b           	move.l a3,d7
     e80:	2046           	movea.l d6,a0
     e82:	41e8 fd00      	lea -768(a0),a0
     e86:	2b48 ff74      	move.l a0,-140(a5)
     e8a:	47ee fff3      	lea -13(a6),a3
     e8e:	2604           	move.l d4,d3
    for(int i2=0;i2<16;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
     e90:	2f0b           	move.l a3,-(sp)
     e92:	2f03           	move.l d3,-(sp)
     e94:	2f2d ff74      	move.l -140(a5),-(sp)
     e98:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     e9e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     ea0:	7030           	moveq #48,d0
     ea2:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
     ea6:	4642           	not.w d2
     ea8:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
     eaa:	4fef 0010      	lea 16(sp),sp
     eae:	bcad ff74      	cmp.l -140(a5),d6
     eb2:	6728           	beq.s edc <main+0xed6>
     eb4:	7600           	moveq #0,d3
     eb6:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
     eb8:	2f0b           	move.l a3,-(sp)
     eba:	2f03           	move.l d3,-(sp)
     ebc:	2f2d ff74      	move.l -140(a5),-(sp)
     ec0:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     ec6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     ec8:	7030           	moveq #48,d0
     eca:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
     ece:	4642           	not.w d2
     ed0:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
     ed2:	4fef 0010      	lea 16(sp),sp
     ed6:	bcad ff74      	cmp.l -140(a5),d6
     eda:	66d8           	bne.s eb4 <main+0xeae>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
     edc:	7800           	moveq #0,d4
     ede:	3802           	move.w d2,d4
     ee0:	2f0e           	move.l a6,-(sp)
     ee2:	2f04           	move.l d4,-(sp)
     ee4:	2f2d ff74      	move.l -140(a5),-(sp)
     ee8:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     eee:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
     ef0:	486e 0001      	pea 1(a6)
     ef4:	2f04           	move.l d4,-(sp)
     ef6:	206d ff74      	movea.l -140(a5),a0
     efa:	4868 0030      	pea 48(a0)
     efe:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     f04:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
     f06:	4fef 0020      	lea 32(sp),sp
     f0a:	486e 0002      	pea 2(a6)
     f0e:	2f03           	move.l d3,-(sp)
     f10:	206d ff74      	movea.l -140(a5),a0
     f14:	4868 0060      	pea 96(a0)
     f18:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     f1e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
     f20:	486e 0003      	pea 3(a6)
     f24:	2f03           	move.l d3,-(sp)
     f26:	206d ff74      	movea.l -140(a5),a0
     f2a:	4868 0090      	pea 144(a0)
     f2e:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     f34:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
     f36:	2c2d ff74      	move.l -140(a5),d6
     f3a:	0686 0000 03c0 	addi.l #960,d6
     f40:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<12;i++) {
     f44:	4fef 0020      	lea 32(sp),sp
     f48:	bcfc 00e4      	cmpa.w #228,a6
     f4c:	6600 ff32      	bne.w e80 <main+0xe7a>
     f50:	2647           	movea.l d7,a3
     f52:	41ec 2fd4      	lea 12244(a4),a0
     f56:	2b48 ffa4      	move.l a0,-92(a5)
     f5a:	2b48 ff74      	move.l a0,-140(a5)
    
  }

  for(int i2=0;i2<15;i2++) { 
     f5e:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
     f60:	2f03           	move.l d3,-(sp)
     f62:	2f04           	move.l d4,-(sp)
     f64:	2f2d ff74      	move.l -140(a5),-(sp)
     f68:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     f6e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     f70:	7030           	moveq #48,d0
     f72:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     f76:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
     f78:	5283           	addq.l #1,d3
     f7a:	4fef 0010      	lea 16(sp),sp
     f7e:	700f           	moveq #15,d0
     f80:	b083           	cmp.l d3,d0
     f82:	6728           	beq.s fac <main+0xfa6>
     f84:	7800           	moveq #0,d4
     f86:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2);
     f88:	2f03           	move.l d3,-(sp)
     f8a:	2f04           	move.l d4,-(sp)
     f8c:	2f2d ff74      	move.l -140(a5),-(sp)
     f90:	4879 0000 74c0 	pea 74c0 <destlinezoom2>
     f96:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     f98:	7030           	moveq #48,d0
     f9a:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     f9e:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
     fa0:	5283           	addq.l #1,d3
     fa2:	4fef 0010      	lea 16(sp),sp
     fa6:	700f           	moveq #15,d0
     fa8:	b083           	cmp.l d3,d0
     faa:	66d8           	bne.s f84 <main+0xf7e>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
     fac:	4878 0002      	pea 2 <_start+0x2>
     fb0:	2f0b           	move.l a3,-(sp)
     fb2:	2f0c           	move.l a4,-(sp)
     fb4:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
     fba:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
     fc0:	4eae ff1c      	jsr -228(a6)
     fc4:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
     fc8:	2b6d ff7c ff74 	move.l -132(a5),-140(a5)
  valsupposed = destlinezoom3;
  mask = 0xffff;

  for(int i2=0;i2<4;i2++) { 
     fce:	7400           	moveq #0,d2
  mask = 0xffff;
     fd0:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
     fd2:	2f02           	move.l d2,-(sp)
     fd4:	3f03           	move.w d3,-(sp)
     fd6:	4267           	clr.w -(sp)
     fd8:	2f2d ff74      	move.l -140(a5),-(sp)
     fdc:	4879 0000 7494 	pea 7494 <destlinezoom3>
     fe2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     fe4:	7030           	moveq #48,d0
     fe6:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     fea:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
     fec:	5282           	addq.l #1,d2
     fee:	4fef 0010      	lea 16(sp),sp
     ff2:	7004           	moveq #4,d0
     ff4:	b082           	cmp.l d2,d0
     ff6:	66da           	bne.s fd2 <main+0xfcc>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
     ff8:	4878 0004      	pea 4 <_start+0x4>
     ffc:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1002:	486b 00c4      	pea 196(a3)
    1006:	4879 0000 7494 	pea 7494 <destlinezoom3>
    100c:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    100e:	4878 0005      	pea 5 <_start+0x5>
    1012:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1018:	486b 00f4      	pea 244(a3)
    101c:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1022:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    1024:	4fef 0020      	lea 32(sp),sp
    1028:	4878 0006      	pea 6 <main>
    102c:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    102e:	41eb 0124      	lea 292(a3),a0
    1032:	2b48 ffa8      	move.l a0,-88(a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    1036:	2f08           	move.l a0,-(sp)
    1038:	4879 0000 7494 	pea 7494 <destlinezoom3>
    103e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    1040:	4878 0007      	pea 7 <main+0x1>
    1044:	42a7           	clr.l -(sp)
    1046:	486b 0154      	pea 340(a3)
    104a:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1050:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    1052:	4fef 0020      	lea 32(sp),sp
    1056:	4878 0008      	pea 8 <main+0x2>
    105a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1060:	486b 0184      	pea 388(a3)
    1064:	4879 0000 7494 	pea 7494 <destlinezoom3>
    106a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    106c:	4878 0009      	pea 9 <main+0x3>
    1070:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1076:	486b 01b4      	pea 436(a3)
    107a:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1080:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;

  mask = 0x0000;
  for(int i=0;i<12;i++) {
    1082:	2c0b           	move.l a3,d6
    1084:	0686 0000 04b4 	addi.l #1204,d6
    108a:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    108e:	3c7c 0018      	movea.w #24,a6
    1092:	7800           	moveq #0,d4
    1094:	74ff           	moveq #-1,d2
    1096:	2e0b           	move.l a3,d7
    1098:	2046           	movea.l d6,a0
    109a:	41e8 fd30      	lea -720(a0),a0
    109e:	2b48 ff74      	move.l a0,-140(a5)
    10a2:	47ee fff1      	lea -15(a6),a3
    for(int i2=0;i2<15;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    10a6:	2f0b           	move.l a3,-(sp)
    10a8:	2f04           	move.l d4,-(sp)
    10aa:	2f2d ff74      	move.l -140(a5),-(sp)
    10ae:	4879 0000 7494 	pea 7494 <destlinezoom3>
    10b4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    10b6:	7030           	moveq #48,d0
    10b8:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
    10bc:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    10be:	4fef 0010      	lea 16(sp),sp
    10c2:	bcad ff74      	cmp.l -140(a5),d6
    10c6:	6728           	beq.s 10f0 <main+0x10ea>
    10c8:	7800           	moveq #0,d4
    10ca:	3802           	move.w d2,d4
    10cc:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    10ce:	2f0b           	move.l a3,-(sp)
    10d0:	2f04           	move.l d4,-(sp)
    10d2:	2f2d ff74      	move.l -140(a5),-(sp)
    10d6:	4879 0000 7494 	pea 7494 <destlinezoom3>
    10dc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    10de:	7030           	moveq #48,d0
    10e0:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
    10e4:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    10e6:	4fef 0010      	lea 16(sp),sp
    10ea:	bcad ff74      	cmp.l -140(a5),d6
    10ee:	66d8           	bne.s 10c8 <main+0x10c2>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    10f0:	7600           	moveq #0,d3
    10f2:	3602           	move.w d2,d3
    10f4:	2f0e           	move.l a6,-(sp)
    10f6:	2f03           	move.l d3,-(sp)
    10f8:	2f2d ff74      	move.l -140(a5),-(sp)
    10fc:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1102:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    1104:	486e 0001      	pea 1(a6)
    1108:	2f03           	move.l d3,-(sp)
    110a:	206d ff74      	movea.l -140(a5),a0
    110e:	4868 0030      	pea 48(a0)
    1112:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1118:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    111a:	4fef 0020      	lea 32(sp),sp
    111e:	486e 0002      	pea 2(a6)
    1122:	2f04           	move.l d4,-(sp)
    1124:	206d ff74      	movea.l -140(a5),a0
    1128:	4868 0060      	pea 96(a0)
    112c:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1132:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    1134:	486e 0003      	pea 3(a6)
    1138:	2f04           	move.l d4,-(sp)
    113a:	206d ff74      	movea.l -140(a5),a0
    113e:	4868 0090      	pea 144(a0)
    1142:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1148:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    114a:	4fef 0020      	lea 32(sp),sp
    114e:	486e 0004      	pea 4(a6)
    1152:	2f03           	move.l d3,-(sp)
    1154:	206d ff74      	movea.l -140(a5),a0
    1158:	4868 00c0      	pea 192(a0)
    115c:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1162:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1164:	486e 0005      	pea 5(a6)
    1168:	2f03           	move.l d3,-(sp)
    116a:	206d ff74      	movea.l -140(a5),a0
    116e:	4868 00f0      	pea 240(a0)
    1172:	4879 0000 7494 	pea 7494 <destlinezoom3>
    1178:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    117a:	2c2d ff74      	move.l -140(a5),d6
    117e:	0686 0000 03f0 	addi.l #1008,d6
    1184:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    1188:	4fef 0020      	lea 32(sp),sp
    118c:	bcfc 0114      	cmpa.w #276,a6
    1190:	6600 ff06      	bne.w 1098 <main+0x1092>
    1194:	2647           	movea.l d7,a3
    1196:	41eb 3124      	lea 12580(a3),a0
    119a:	2b48 ff74      	move.l a0,-140(a5)
    119e:	263c 0000 0105 	move.l #261,d3
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    11a4:	2f03           	move.l d3,-(sp)
    11a6:	2f04           	move.l d4,-(sp)
    11a8:	2f2d ff74      	move.l -140(a5),-(sp)
    11ac:	4879 0000 7494 	pea 7494 <destlinezoom3>
    11b2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    11b4:	7030           	moveq #48,d0
    11b6:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
    11ba:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    11bc:	4fef 0010      	lea 16(sp),sp
    11c0:	0c83 0000 010d 	cmpi.l #269,d3
    11c6:	672a           	beq.s 11f2 <main+0x11ec>
    11c8:	7800           	moveq #0,d4
    11ca:	3802           	move.w d2,d4
    11cc:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    11ce:	2f03           	move.l d3,-(sp)
    11d0:	2f04           	move.l d4,-(sp)
    11d2:	2f2d ff74      	move.l -140(a5),-(sp)
    11d6:	4879 0000 7494 	pea 7494 <destlinezoom3>
    11dc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    11de:	7030           	moveq #48,d0
    11e0:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
    11e4:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    11e6:	4fef 0010      	lea 16(sp),sp
    11ea:	0c83 0000 010d 	cmpi.l #269,d3
    11f0:	66d6           	bne.s 11c8 <main+0x11c2>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 3);
    11f2:	4878 0003      	pea 3 <_start+0x3>
    11f6:	2f0c           	move.l a4,-(sp)
    11f8:	2f0b           	move.l a3,-(sp)
    11fa:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1200:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    1206:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    120a:	4878 0007      	pea 7 <main+0x1>
    120e:	42a7           	clr.l -(sp)
    1210:	2f2d ff6c      	move.l -148(a5),-(sp)
    1214:	4879 0000 7468 	pea 7468 <destlinezoom4>
    121a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    121c:	41ec 0034      	lea 52(a4),a0
    1220:	2b48 ff80      	move.l a0,-128(a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    1224:	4878 0008      	pea 8 <main+0x2>
    1228:	2f3c 0000 ffff 	move.l #65535,-(sp)
    122e:	2f08           	move.l a0,-(sp)
    1230:	4879 0000 7468 	pea 7468 <destlinezoom4>
    1236:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1238:	41ec 0064      	lea 100(a4),a0
    123c:	2b48 ff90      	move.l a0,-112(a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    1240:	4fef 002c      	lea 44(sp),sp
    1244:	4878 0009      	pea 9 <main+0x3>
    1248:	2f3c 0000 ffff 	move.l #65535,-(sp)
    124e:	2f08           	move.l a0,-(sp)
    1250:	4879 0000 7468 	pea 7468 <destlinezoom4>
    1256:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1258:	41ec 0094      	lea 148(a4),a0
    125c:	2b48 ff74      	move.l a0,-140(a5)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    1260:	4878 0008      	pea 8 <main+0x2>
    1264:	42a7           	clr.l -(sp)
    1266:	2f08           	move.l a0,-(sp)
    1268:	4879 0000 7468 	pea 7468 <destlinezoom4>
    126e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    1270:	4fef 0020      	lea 32(sp),sp
    1274:	4878 0009      	pea 9 <main+0x3>
    1278:	42a7           	clr.l -(sp)
    127a:	486c 00c4      	pea 196(a4)
    127e:	4879 0000 7468 	pea 7468 <destlinezoom4>
    1284:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1286:	41ec 00f4      	lea 244(a4),a0
    128a:	2b48 ff84      	move.l a0,-124(a5)

  mask = 0xffff;
  for(int i=0;i<12;i++) {
    128e:	2c0c           	move.l a4,d6
    1290:	0686 0000 0394 	addi.l #916,d6
    1296:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    129a:	3c7c 0018      	movea.w #24,a6
  mask = 0xffff;
    129e:	78ff           	moveq #-1,d4
    12a0:	7400           	moveq #0,d2
    12a2:	4642           	not.w d2
    12a4:	2e0b           	move.l a3,d7
    12a6:	2046           	movea.l d6,a0
    12a8:	41e8 fd60      	lea -672(a0),a0
    12ac:	2b48 ff88      	move.l a0,-120(a5)
    12b0:	47ee fff1      	lea -15(a6),a3
    12b4:	2602           	move.l d2,d3
    for(int i2=0;i2<14;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    12b6:	2f0b           	move.l a3,-(sp)
    12b8:	2f03           	move.l d3,-(sp)
    12ba:	2f2d ff88      	move.l -120(a5),-(sp)
    12be:	4879 0000 7468 	pea 7468 <destlinezoom4>
    12c4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    12c6:	7030           	moveq #48,d0
    12c8:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    12cc:	4644           	not.w d4
    12ce:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    12d0:	4fef 0010      	lea 16(sp),sp
    12d4:	bcad ff88      	cmp.l -120(a5),d6
    12d8:	6728           	beq.s 1302 <main+0x12fc>
    12da:	7600           	moveq #0,d3
    12dc:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    12de:	2f0b           	move.l a3,-(sp)
    12e0:	2f03           	move.l d3,-(sp)
    12e2:	2f2d ff88      	move.l -120(a5),-(sp)
    12e6:	4879 0000 7468 	pea 7468 <destlinezoom4>
    12ec:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    12ee:	7030           	moveq #48,d0
    12f0:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    12f4:	4644           	not.w d4
    12f6:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    12f8:	4fef 0010      	lea 16(sp),sp
    12fc:	bcad ff88      	cmp.l -120(a5),d6
    1300:	66d8           	bne.s 12da <main+0x12d4>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    1302:	7400           	moveq #0,d2
    1304:	3404           	move.w d4,d2
    1306:	2f0e           	move.l a6,-(sp)
    1308:	2f02           	move.l d2,-(sp)
    130a:	2f2d ff88      	move.l -120(a5),-(sp)
    130e:	4879 0000 7468 	pea 7468 <destlinezoom4>
    1314:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    1316:	486e 0001      	pea 1(a6)
    131a:	2f02           	move.l d2,-(sp)
    131c:	206d ff88      	movea.l -120(a5),a0
    1320:	4868 0030      	pea 48(a0)
    1324:	4879 0000 7468 	pea 7468 <destlinezoom4>
    132a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    132c:	4fef 0020      	lea 32(sp),sp
    1330:	486e 0002      	pea 2(a6)
    1334:	2f03           	move.l d3,-(sp)
    1336:	206d ff88      	movea.l -120(a5),a0
    133a:	4868 0060      	pea 96(a0)
    133e:	4879 0000 7468 	pea 7468 <destlinezoom4>
    1344:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    1346:	486e 0003      	pea 3(a6)
    134a:	2f03           	move.l d3,-(sp)
    134c:	206d ff88      	movea.l -120(a5),a0
    1350:	4868 0090      	pea 144(a0)
    1354:	4879 0000 7468 	pea 7468 <destlinezoom4>
    135a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    135c:	47ee 0004      	lea 4(a6),a3
    1360:	4fef 001c      	lea 28(sp),sp
    1364:	2e8b           	move.l a3,(sp)
    1366:	2f02           	move.l d2,-(sp)
    1368:	206d ff88      	movea.l -120(a5),a0
    136c:	4868 00c0      	pea 192(a0)
    1370:	4879 0000 7468 	pea 7468 <destlinezoom4>
    1376:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1378:	2c0e           	move.l a6,d6
    137a:	5a86           	addq.l #5,d6
    137c:	2f06           	move.l d6,-(sp)
    137e:	2f02           	move.l d2,-(sp)
    1380:	206d ff88      	movea.l -120(a5),a0
    1384:	4868 00f0      	pea 240(a0)
    1388:	4879 0000 7468 	pea 7468 <destlinezoom4>
    138e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    1390:	4fef 001c      	lea 28(sp),sp
    1394:	2e8b           	move.l a3,(sp)
    1396:	2f03           	move.l d3,-(sp)
    1398:	206d ff88      	movea.l -120(a5),a0
    139c:	4868 0120      	pea 288(a0)
    13a0:	4879 0000 7468 	pea 7468 <destlinezoom4>
    13a6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    13a8:	2f06           	move.l d6,-(sp)
    13aa:	2f03           	move.l d3,-(sp)
    13ac:	206d ff88      	movea.l -120(a5),a0
    13b0:	4868 0150      	pea 336(a0)
    13b4:	4879 0000 7468 	pea 7468 <destlinezoom4>
    13ba:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    13bc:	2c2d ff88      	move.l -120(a5),d6
    13c0:	0686 0000 0420 	addi.l #1056,d6
    13c6:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    13ca:	4fef 0020      	lea 32(sp),sp
    13ce:	bcfc 0114      	cmpa.w #276,a6
    13d2:	6600 fed2      	bne.w 12a6 <main+0x12a0>
    13d6:	2647           	movea.l d7,a3
  }

  TestRow( valsupposed, valactual, mask, 269);
    13d8:	4878 010d      	pea 10d <main+0x107>
    13dc:	2f02           	move.l d2,-(sp)
    13de:	486c 3274      	pea 12916(a4)
    13e2:	4879 0000 7468 	pea 7468 <destlinezoom4>
    13e8:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 4);
    13ea:	4878 0004      	pea 4 <_start+0x4>
    13ee:	2f07           	move.l d7,-(sp)
    13f0:	2f0c           	move.l a4,-(sp)
    13f2:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    13f8:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    13fe:	4eae ff1c      	jsr -228(a6)
    1402:	4fef 001c      	lea 28(sp),sp

  valactual = destination+2; 
    1406:	2c6d ff7c      	movea.l -132(a5),a6
  valsupposed = destlinezoom5;
  mask = 0x0000;

  for(int i2=0;i2<13;i2++) {  
    140a:	42ad ff88      	clr.l -120(a5)
  mask = 0x0000;
    140e:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    1410:	7400           	moveq #0,d2
    1412:	3404           	move.w d4,d2
    1414:	2f2d ff88      	move.l -120(a5),-(sp)
    1418:	2f02           	move.l d2,-(sp)
    141a:	2f0e           	move.l a6,-(sp)
    141c:	4879 0000 743c 	pea 743c <destlinezoom5>
    1422:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1424:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1428:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    142a:	52ad ff88      	addq.l #1,-120(a5)
    142e:	4fef 0010      	lea 16(sp),sp
    1432:	700d           	moveq #13,d0
    1434:	b0ad ff88      	cmp.l -120(a5),d0
    1438:	66d6           	bne.s 1410 <main+0x140a>
    143a:	7600           	moveq #0,d3
    143c:	3604           	move.w d4,d3
  }

  TestRow( valsupposed, valactual, mask, 12);   
    143e:	4878 000c      	pea c <main+0x6>
    1442:	2f03           	move.l d3,-(sp)
    1444:	486b 0274      	pea 628(a3)
    1448:	4879 0000 743c 	pea 743c <destlinezoom5>
    144e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 13);
    1450:	4878 000d      	pea d <main+0x7>
    1454:	2f03           	move.l d3,-(sp)
    1456:	486b 02a4      	pea 676(a3)
    145a:	4879 0000 743c 	pea 743c <destlinezoom5>
    1460:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14);
    1462:	4fef 0020      	lea 32(sp),sp
    1466:	4878 000e      	pea e <main+0x8>
    146a:	2f02           	move.l d2,-(sp)
    146c:	486b 02d4      	pea 724(a3)
    1470:	4879 0000 743c 	pea 743c <destlinezoom5>
    1476:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 15);
    1478:	4878 000f      	pea f <main+0x9>
    147c:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    147e:	41eb 0304      	lea 772(a3),a0
    1482:	2b48 ff8c      	move.l a0,-116(a5)
  TestRow( valsupposed, valactual, mask, 15);
    1486:	2f08           	move.l a0,-(sp)
    1488:	4879 0000 743c 	pea 743c <destlinezoom5>
    148e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 16);
    1490:	4fef 0020      	lea 32(sp),sp
    1494:	4878 0010      	pea 10 <main+0xa>
    1498:	2f03           	move.l d3,-(sp)
    149a:	486b 0334      	pea 820(a3)
    149e:	4879 0000 743c 	pea 743c <destlinezoom5>
    14a4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 17);
    14a6:	4878 0011      	pea 11 <main+0xb>
    14aa:	2f03           	move.l d3,-(sp)
    14ac:	2f2d ff78      	move.l -136(a5),-(sp)
    14b0:	4879 0000 743c 	pea 743c <destlinezoom5>
    14b6:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 18);
    14b8:	4fef 0020      	lea 32(sp),sp
    14bc:	4878 0012      	pea 12 <main+0xc>
    14c0:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    14c2:	41eb 0394      	lea 916(a3),a0
    14c6:	2b48 ffa0      	move.l a0,-96(a5)
  TestRow( valsupposed, valactual, mask, 18);
    14ca:	2f08           	move.l a0,-(sp)
    14cc:	4879 0000 743c 	pea 743c <destlinezoom5>
    14d2:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 19);
    14d4:	4878 0013      	pea 13 <main+0xd>
    14d8:	2f02           	move.l d2,-(sp)
    14da:	486b 03c4      	pea 964(a3)
    14de:	4879 0000 743c 	pea 743c <destlinezoom5>
    14e4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 20);
    14e6:	4fef 0020      	lea 32(sp),sp
    14ea:	4878 0014      	pea 14 <main+0xe>
    14ee:	2f03           	move.l d3,-(sp)
    14f0:	486b 03f4      	pea 1012(a3)
    14f4:	4879 0000 743c 	pea 743c <destlinezoom5>
    14fa:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 21);
    14fc:	4878 0015      	pea 15 <main+0xf>
    1500:	2f03           	move.l d3,-(sp)
    1502:	486b 0424      	pea 1060(a3)
    1506:	4879 0000 743c 	pea 743c <destlinezoom5>
    150c:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;


  for(int i=0;i<10;i++) {
    150e:	2c0b           	move.l a3,d6
    1510:	0686 0000 06c4 	addi.l #1732,d6
    1516:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    151a:	307c 0023      	movea.w #35,a0
    151e:	2b48 ff68      	move.l a0,-152(a5)
    1522:	2e0b           	move.l a3,d7
    1524:	2c46           	movea.l d6,a6
    1526:	4dee fd90      	lea -624(a6),a6
    152a:	367c fff3      	movea.w #-13,a3
    152e:	d7ed ff68      	adda.l -152(a5),a3
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    1532:	2f0b           	move.l a3,-(sp)
    1534:	2f02           	move.l d2,-(sp)
    1536:	2f0e           	move.l a6,-(sp)
    1538:	4879 0000 743c 	pea 743c <destlinezoom5>
    153e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1540:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1544:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1546:	4fef 0010      	lea 16(sp),sp
    154a:	bc8e           	cmp.l a6,d6
    154c:	6722           	beq.s 1570 <main+0x156a>
    154e:	7400           	moveq #0,d2
    1550:	3404           	move.w d4,d2
    1552:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    1554:	2f0b           	move.l a3,-(sp)
    1556:	2f02           	move.l d2,-(sp)
    1558:	2f0e           	move.l a6,-(sp)
    155a:	4879 0000 743c 	pea 743c <destlinezoom5>
    1560:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1562:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1566:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1568:	4fef 0010      	lea 16(sp),sp
    156c:	bc8e           	cmp.l a6,d6
    156e:	66de           	bne.s 154e <main+0x1548>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    1570:	7600           	moveq #0,d3
    1572:	3604           	move.w d4,d3
    1574:	2f2d ff68      	move.l -152(a5),-(sp)
    1578:	2f03           	move.l d3,-(sp)
    157a:	2f0e           	move.l a6,-(sp)
    157c:	4879 0000 743c 	pea 743c <destlinezoom5>
    1582:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    1584:	206d ff68      	movea.l -152(a5),a0
    1588:	4868 0001      	pea 1(a0)
    158c:	2f03           	move.l d3,-(sp)
    158e:	486e 0030      	pea 48(a6)
    1592:	4879 0000 743c 	pea 743c <destlinezoom5>
    1598:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    159a:	4fef 0020      	lea 32(sp),sp
    159e:	206d ff68      	movea.l -152(a5),a0
    15a2:	4868 0002      	pea 2(a0)
    15a6:	2f02           	move.l d2,-(sp)
    15a8:	486e 0060      	pea 96(a6)
    15ac:	4879 0000 743c 	pea 743c <destlinezoom5>
    15b2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    15b4:	206d ff68      	movea.l -152(a5),a0
    15b8:	4868 0003      	pea 3(a0)
    15bc:	2f02           	move.l d2,-(sp)
    15be:	486e 0090      	pea 144(a6)
    15c2:	4879 0000 743c 	pea 743c <destlinezoom5>
    15c8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    15ca:	4fef 0020      	lea 32(sp),sp
    15ce:	206d ff68      	movea.l -152(a5),a0
    15d2:	4868 0004      	pea 4(a0)
    15d6:	2f03           	move.l d3,-(sp)
    15d8:	486e 00c0      	pea 192(a6)
    15dc:	4879 0000 743c 	pea 743c <destlinezoom5>
    15e2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    15e4:	206d ff68      	movea.l -152(a5),a0
    15e8:	4868 0005      	pea 5(a0)
    15ec:	2f03           	move.l d3,-(sp)
    15ee:	486e 00f0      	pea 240(a6)
    15f2:	4879 0000 743c 	pea 743c <destlinezoom5>
    15f8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    15fa:	4fef 0020      	lea 32(sp),sp
    15fe:	206d ff68      	movea.l -152(a5),a0
    1602:	4868 0006      	pea 6(a0)
    1606:	2f02           	move.l d2,-(sp)
    1608:	486e 0120      	pea 288(a6)
    160c:	4879 0000 743c 	pea 743c <destlinezoom5>
    1612:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    1614:	206d ff68      	movea.l -152(a5),a0
    1618:	4868 0007      	pea 7(a0)
    161c:	2f02           	move.l d2,-(sp)
    161e:	486e 0150      	pea 336(a6)
    1622:	4879 0000 743c 	pea 743c <destlinezoom5>
    1628:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    162a:	4fef 0020      	lea 32(sp),sp
    162e:	206d ff68      	movea.l -152(a5),a0
    1632:	4868 0008      	pea 8(a0)
    1636:	2f03           	move.l d3,-(sp)
    1638:	486e 0180      	pea 384(a6)
    163c:	4879 0000 743c 	pea 743c <destlinezoom5>
    1642:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    1644:	206d ff68      	movea.l -152(a5),a0
    1648:	4868 0009      	pea 9(a0)
    164c:	2f03           	move.l d3,-(sp)
    164e:	486e 01b0      	pea 432(a6)
    1652:	4879 0000 743c 	pea 743c <destlinezoom5>
    1658:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    165a:	2c0e           	move.l a6,d6
    165c:	0686 0000 0450 	addi.l #1104,d6
    1662:	7015           	moveq #21,d0
    1664:	d1ad ff68      	add.l d0,-152(a5)
  for(int i=0;i<10;i++) {
    1668:	4fef 0020      	lea 32(sp),sp
    166c:	0cad 0000 00f5 	cmpi.l #245,-152(a5)
    1672:	ff68 
    1674:	6600 feae      	bne.w 1524 <main+0x151e>
    1678:	2647           	movea.l d7,a3
    167a:	4deb 2f74      	lea 12148(a3),a6
    167e:	7c02           	moveq #2,d6
    1680:	4606           	not.b d6
  }

  for(int i2=0;i2<13;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+253);
    1682:	2f06           	move.l d6,-(sp)
    1684:	2f02           	move.l d2,-(sp)
    1686:	2f0e           	move.l a6,-(sp)
    1688:	4879 0000 743c 	pea 743c <destlinezoom5>
    168e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1690:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1694:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    1696:	4fef 0010      	lea 16(sp),sp
    169a:	0c86 0000 010a 	cmpi.l #266,d6
    16a0:	6726           	beq.s 16c8 <main+0x16c2>
    16a2:	7400           	moveq #0,d2
    16a4:	3404           	move.w d4,d2
    16a6:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    16a8:	2f06           	move.l d6,-(sp)
    16aa:	2f02           	move.l d2,-(sp)
    16ac:	2f0e           	move.l a6,-(sp)
    16ae:	4879 0000 743c 	pea 743c <destlinezoom5>
    16b4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    16b6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    16ba:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    16bc:	4fef 0010      	lea 16(sp),sp
    16c0:	0c86 0000 010a 	cmpi.l #266,d6
    16c6:	66da           	bne.s 16a2 <main+0x169c>
    16c8:	0284 0000 ffff 	andi.l #65535,d4
  }

  TestRow( valsupposed, valactual, mask, 266);
    16ce:	2f06           	move.l d6,-(sp)
    16d0:	2f04           	move.l d4,-(sp)
    16d2:	2f2d ff70      	move.l -144(a5),-(sp)
    16d6:	4879 0000 743c 	pea 743c <destlinezoom5>
    16dc:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 267);
    16de:	4878 010b      	pea 10b <main+0x105>
    16e2:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    16e4:	41eb 3214      	lea 12820(a3),a0
    16e8:	2b48 ff98      	move.l a0,-104(a5)
  TestRow( valsupposed, valactual, mask, 267);
    16ec:	2f08           	move.l a0,-(sp)
    16ee:	4879 0000 743c 	pea 743c <destlinezoom5>
    16f4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 268);
    16f6:	4fef 0020      	lea 32(sp),sp
    16fa:	4878 010c      	pea 10c <main+0x106>
    16fe:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    1700:	41eb 3244      	lea 12868(a3),a0
    1704:	2b48 ff9c      	move.l a0,-100(a5)
  TestRow( valsupposed, valactual, mask, 268);
    1708:	2f08           	move.l a0,-(sp)
    170a:	4879 0000 743c 	pea 743c <destlinezoom5>
    1710:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 269);
    1712:	4878 010d      	pea 10d <main+0x107>
    1716:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    1718:	41eb 3274      	lea 12916(a3),a0
    171c:	2b48 ff78      	move.l a0,-136(a5)
  TestRow( valsupposed, valactual, mask, 269);
    1720:	2f08           	move.l a0,-(sp)
    1722:	4879 0000 743c 	pea 743c <destlinezoom5>
    1728:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 5);
    172a:	4fef 0020      	lea 32(sp),sp
    172e:	4878 0005      	pea 5 <_start+0x5>
    1732:	2f0c           	move.l a4,-(sp)
    1734:	2f0b           	move.l a3,-(sp)
    1736:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    173c:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    1742:	4eae ff1c      	jsr -228(a6)
    1746:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    174a:	2c6d ff6c      	movea.l -148(a5),a6
  valsupposed = destlinezoom6;
  mask = 0x0000;
 
  for(int i2=0;i2<7;i2++) {  
    174e:	7400           	moveq #0,d2
  mask = 0x0000;
    1750:	4243           	clr.w d3
    TestRow( valsupposed, valactual, mask, i2);
    1752:	2f02           	move.l d2,-(sp)
    1754:	3f03           	move.w d3,-(sp)
    1756:	4267           	clr.w -(sp)
    1758:	2f0e           	move.l a6,-(sp)
    175a:	4879 0000 7410 	pea 7410 <destlinezoom6>
    1760:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1762:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1766:	4643           	not.w d3
  for(int i2=0;i2<7;i2++) {  
    1768:	5282           	addq.l #1,d2
    176a:	4fef 0010      	lea 16(sp),sp
    176e:	7007           	moveq #7,d0
    1770:	b082           	cmp.l d2,d0
    1772:	66de           	bne.s 1752 <main+0x174c>
    1774:	4dec 0154      	lea 340(a4),a6
    1778:	7407           	moveq #7,d2
    177a:	280b           	move.l a3,d4
    177c:	264e           	movea.l a6,a3
    177e:	2c42           	movea.l d2,a6
  }

  for(int i=0;i<6;i++) {
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    1780:	7400           	moveq #0,d2
    1782:	3403           	move.w d3,d2
    1784:	2f0e           	move.l a6,-(sp)
    1786:	2f02           	move.l d2,-(sp)
    1788:	2f0b           	move.l a3,-(sp)
    178a:	4879 0000 7410 	pea 7410 <destlinezoom6>
    1790:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    1792:	486e 0001      	pea 1(a6)
    1796:	2f02           	move.l d2,-(sp)
    1798:	486b 0030      	pea 48(a3)
    179c:	4879 0000 7410 	pea 7410 <destlinezoom6>
    17a2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    17a4:	4643           	not.w d3
    17a6:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    17a8:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<6;i++) {
    17ac:	4fef 0020      	lea 32(sp),sp
    17b0:	7013           	moveq #19,d0
    17b2:	b08e           	cmp.l a6,d0
    17b4:	66ca           	bne.s 1780 <main+0x177a>
    17b6:	240e           	move.l a6,d2
    17b8:	2c04           	move.l d4,d6
    17ba:	2c45           	movea.l d5,a6
    17bc:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    17c0:	2802           	move.l d2,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    17c2:	2f04           	move.l d4,-(sp)
    17c4:	3f03           	move.w d3,-(sp)
    17c6:	4267           	clr.w -(sp)
    17c8:	2f0e           	move.l a6,-(sp)
    17ca:	4879 0000 7410 	pea 7410 <destlinezoom6>
    17d0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    17d2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    17d6:	4643           	not.w d3
    17d8:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    17da:	4fef 0010      	lea 16(sp),sp
    17de:	ba8e           	cmp.l a6,d5
    17e0:	66e0           	bne.s 17c2 <main+0x17bc>
    17e2:	367c 001f      	movea.w #31,a3
    }
    for(int i=0;i<6;i++) {
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    17e6:	7800           	moveq #0,d4
    17e8:	3803           	move.w d3,d4
    17ea:	2f0b           	move.l a3,-(sp)
    17ec:	2f04           	move.l d4,-(sp)
    17ee:	2f0e           	move.l a6,-(sp)
    17f0:	4879 0000 7410 	pea 7410 <destlinezoom6>
    17f6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*24);
    17f8:	486b 0001      	pea 1(a3)
    17fc:	2f04           	move.l d4,-(sp)
    17fe:	486e 0030      	pea 48(a6)
    1802:	4879 0000 7410 	pea 7410 <destlinezoom6>
    1808:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    180a:	4643           	not.w d3
    180c:	47eb 0018      	lea 24(a3),a3
      valactual += ZMLINESIZE/2;
    1810:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    1814:	4fef 0020      	lea 32(sp),sp
    1818:	b6fc 00af      	cmpa.w #175,a3
    181c:	66c8           	bne.s 17e6 <main+0x17e0>
    181e:	0685 0000 0480 	addi.l #1152,d5
    1824:	7018           	moveq #24,d0
    1826:	d480           	add.l d0,d2
  for(int i=0;i<10;i++) {
    1828:	0c82 0000 0103 	cmpi.l #259,d2
    182e:	668a           	bne.s 17ba <main+0x17b4>
    1830:	2646           	movea.l d6,a3
    1832:	4dec 3094      	lea 12436(a4),a6
    1836:	283c 0000 0102 	move.l #258,d4
    }
  }

  for(int i2=0;i2<11;i2++) {  
    TestRow( valsupposed, valactual, mask, 258+i2);
    183c:	2f04           	move.l d4,-(sp)
    183e:	3f03           	move.w d3,-(sp)
    1840:	4267           	clr.w -(sp)
    1842:	2f0e           	move.l a6,-(sp)
    1844:	4879 0000 7410 	pea 7410 <destlinezoom6>
    184a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    184c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1850:	4643           	not.w d3
    1852:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    1854:	4fef 0010      	lea 16(sp),sp
    1858:	0c84 0000 010d 	cmpi.l #269,d4
    185e:	66dc           	bne.s 183c <main+0x1836>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 6);
    1860:	4878 0006      	pea 6 <main>
    1864:	2f0b           	move.l a3,-(sp)
    1866:	2f0c           	move.l a4,-(sp)
    1868:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    186e:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    1874:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom7;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1878:	42a7           	clr.l -(sp)
    187a:	42a7           	clr.l -(sp)
    187c:	2f2d ff7c      	move.l -132(a5),-(sp)
    1880:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    1886:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1888:	41eb 0034      	lea 52(a3),a0
    188c:	2b48 ff88      	move.l a0,-120(a5)
    1890:	4fef 001c      	lea 28(sp),sp
    1894:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    1898:	7eff           	moveq #-1,d7
    189a:	280b           	move.l a3,d4
    189c:	2648           	movea.l a0,a3
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    189e:	7600           	moveq #0,d3
    18a0:	3607           	move.w d7,d3
    18a2:	2f0e           	move.l a6,-(sp)
    18a4:	2f03           	move.l d3,-(sp)
    18a6:	2f0b           	move.l a3,-(sp)
    18a8:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    18ae:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    18b0:	486e 0001      	pea 1(a6)
    18b4:	2f03           	move.l d3,-(sp)
    18b6:	486b 0030      	pea 48(a3)
    18ba:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    18c0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    18c2:	4647           	not.w d7
    18c4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    18c6:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    18ca:	4fef 0020      	lea 32(sp),sp
    18ce:	700f           	moveq #15,d0
    18d0:	b08e           	cmp.l a6,d0
    18d2:	66ca           	bne.s 189e <main+0x1898>
    18d4:	2604           	move.l d4,d3
    18d6:	0683 0000 04e4 	addi.l #1252,d3
    18dc:	2a0c           	move.l a4,d5
    18de:	2c04           	move.l d4,d6
    18e0:	284e           	movea.l a6,a4
    18e2:	2c43           	movea.l d3,a6
    18e4:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    18e8:	280c           	move.l a4,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<11;i2++) {  
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    18ea:	2f04           	move.l d4,-(sp)
    18ec:	3f07           	move.w d7,-(sp)
    18ee:	4267           	clr.w -(sp)
    18f0:	2f0e           	move.l a6,-(sp)
    18f2:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    18f8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    18fa:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    18fe:	4647           	not.w d7
    1900:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    1902:	4fef 0010      	lea 16(sp),sp
    1906:	b68e           	cmp.l a6,d3
    1908:	66e0           	bne.s 18ea <main+0x18e4>
    190a:	367c 001a      	movea.w #26,a3
    }
    for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    190e:	7800           	moveq #0,d4
    1910:	3807           	move.w d7,d4
    1912:	2f0b           	move.l a3,-(sp)
    1914:	2f04           	move.l d4,-(sp)
    1916:	2f0e           	move.l a6,-(sp)
    1918:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    191e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 26+i*25);
    1920:	2f0b           	move.l a3,-(sp)
    1922:	2f04           	move.l d4,-(sp)
    1924:	486e 0030      	pea 48(a6)
    1928:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    192e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1930:	4647           	not.w d7
    1932:	47eb 0019      	lea 25(a3),a3
      valactual += ZMLINESIZE/2;
    1936:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    193a:	4fef 0020      	lea 32(sp),sp
    193e:	b6fc 00c9      	cmpa.w #201,a3
    1942:	66ca           	bne.s 190e <main+0x1908>
    1944:	0683 0000 04b0 	addi.l #1200,d3
    194a:	49ec 0019      	lea 25(a4),a4
  for(int i=0;i<10;i++) {
    194e:	b8fc 0109      	cmpa.w #265,a4
    1952:	668e           	bne.s 18e2 <main+0x18dc>
    1954:	2845           	movea.l d5,a4
    1956:	2646           	movea.l d6,a3
    1958:	4deb 31b4      	lea 12724(a3),a6
    195c:	263c 0000 0100 	move.l #256,d3
    }
  }

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 256+i2);
    1962:	2f03           	move.l d3,-(sp)
    1964:	3f07           	move.w d7,-(sp)
    1966:	4267           	clr.w -(sp)
    1968:	2f0e           	move.l a6,-(sp)
    196a:	4879 0000 73e4 	pea 73e4 <destlinezoom7>
    1970:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1972:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1976:	4647           	not.w d7
    1978:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    197a:	4fef 0010      	lea 16(sp),sp
    197e:	0c83 0000 0105 	cmpi.l #261,d3
    1984:	66dc           	bne.s 1962 <main+0x195c>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 7);
    1986:	4878 0007      	pea 7 <main+0x1>
    198a:	2f0c           	move.l a4,-(sp)
    198c:	2f0b           	move.l a3,-(sp)
    198e:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1994:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    199a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom8;
  mask = 0xffff;
 
  TestRow( valsupposed, valactual, mask, 0);
    199e:	42a7           	clr.l -(sp)
    19a0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    19a6:	2f2d ff6c      	move.l -148(a5),-(sp)
    19aa:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    19b0:	4e92           	jsr (a2)
    19b2:	4fef 001c      	lea 28(sp),sp
    19b6:	2b6d ff74 ff70 	move.l -140(a5),-144(a5)
  valactual += ZMLINESIZE/2;
    19bc:	2a2d ff80      	move.l -128(a5),d5
  TestRow( valsupposed, valactual, mask, 0);
    19c0:	7601           	moveq #1,d3
  mask = mask ^ 0xffff;
    19c2:	4244           	clr.w d4
    19c4:	2c43           	movea.l d3,a6
    19c6:	2c2d ff70      	move.l -144(a5),d6
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    19ca:	7600           	moveq #0,d3
    19cc:	3604           	move.w d4,d3
    19ce:	2f0e           	move.l a6,-(sp)
    19d0:	2f03           	move.l d3,-(sp)
    19d2:	2f05           	move.l d5,-(sp)
    19d4:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    19da:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    19dc:	486e 0001      	pea 1(a6)
    19e0:	2f03           	move.l d3,-(sp)
    19e2:	2045           	movea.l d5,a0
    19e4:	4868 0030      	pea 48(a0)
    19e8:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    19ee:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    19f0:	4644           	not.w d4
    19f2:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    19f4:	4fef 0020      	lea 32(sp),sp
    19f8:	700b           	moveq #11,d0
    19fa:	b08e           	cmp.l a6,d0
    19fc:	6740           	beq.s 1a3e <main+0x1a38>
    19fe:	2005           	move.l d5,d0
    1a00:	0680 0000 00c0 	addi.l #192,d0
    1a06:	2a06           	move.l d6,d5
    1a08:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1a0a:	7600           	moveq #0,d3
    1a0c:	3604           	move.w d4,d3
    1a0e:	2f0e           	move.l a6,-(sp)
    1a10:	2f03           	move.l d3,-(sp)
    1a12:	2f05           	move.l d5,-(sp)
    1a14:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1a1a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1a1c:	486e 0001      	pea 1(a6)
    1a20:	2f03           	move.l d3,-(sp)
    1a22:	2045           	movea.l d5,a0
    1a24:	4868 0030      	pea 48(a0)
    1a28:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1a2e:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    1a30:	4644           	not.w d4
    1a32:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    1a34:	4fef 0020      	lea 32(sp),sp
    1a38:	700b           	moveq #11,d0
    1a3a:	b08e           	cmp.l a6,d0
    1a3c:	66c0           	bne.s 19fe <main+0x19f8>
    1a3e:	260e           	move.l a6,d3
    1a40:	2b46 ff70      	move.l d6,-144(a5)
    1a44:	0686 0000 01e0 	addi.l #480,d6
    1a4a:	7e15           	moveq #21,d7
    1a4c:	2b4c ffac      	move.l a4,-84(a5)
    1a50:	2b4b ffb0      	move.l a3,-80(a5)
    1a54:	2647           	movea.l d7,a3
    1a56:	2c46           	movea.l d6,a6
    1a58:	4dee fe20      	lea -480(a6),a6
    1a5c:	49eb fff6      	lea -10(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<10;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    1a60:	2f0c           	move.l a4,-(sp)
    1a62:	3f04           	move.w d4,-(sp)
    1a64:	4267           	clr.w -(sp)
    1a66:	2f0e           	move.l a6,-(sp)
    1a68:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1a6e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1a70:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1a74:	4644           	not.w d4
    1a76:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    1a78:	4fef 0010      	lea 16(sp),sp
    1a7c:	bc8e           	cmp.l a6,d6
    1a7e:	66e0           	bne.s 1a60 <main+0x1a5a>
    1a80:	2a0b           	move.l a3,d5
    1a82:	2e0e           	move.l a6,d7
    1a84:	0687 0000 0300 	addi.l #768,d7
    }
    for(int i2=0;i2<8;i2++) {
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    1a8a:	7000           	moveq #0,d0
    1a8c:	3004           	move.w d4,d0
    1a8e:	2840           	movea.l d0,a4
    1a90:	2f05           	move.l d5,-(sp)
    1a92:	2f0c           	move.l a4,-(sp)
    1a94:	2f0e           	move.l a6,-(sp)
    1a96:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1a9c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    1a9e:	2f05           	move.l d5,-(sp)
    1aa0:	2f0c           	move.l a4,-(sp)
    1aa2:	486e 0030      	pea 48(a6)
    1aa6:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1aac:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1aae:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    1ab2:	4644           	not.w d4
    1ab4:	5285           	addq.l #1,d5
    for(int i2=0;i2<8;i2++) {
    1ab6:	4fef 0020      	lea 32(sp),sp
    1aba:	be8e           	cmp.l a6,d7
    1abc:	66cc           	bne.s 1a8a <main+0x1a84>
    1abe:	0686 0000 04e0 	addi.l #1248,d6
    1ac4:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    1ac8:	b6fc 00ff      	cmpa.w #255,a3
    1acc:	6688           	bne.s 1a56 <main+0x1a50>
    1ace:	286d ffac      	movea.l -84(a5),a4
    1ad2:	266d ffb0      	movea.l -80(a5),a3
    1ad6:	2c2d ff70      	move.l -144(a5),d6
    1ada:	0686 0000 2be0 	addi.l #11232,d6
    1ae0:	2a2d ff68      	move.l -152(a5),d5
    1ae4:	2c46           	movea.l d6,a6
    }
  }

  for(int i2=0;i2<10;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1ae6:	2f05           	move.l d5,-(sp)
    1ae8:	3f04           	move.w d4,-(sp)
    1aea:	4267           	clr.w -(sp)
    1aec:	2f0e           	move.l a6,-(sp)
    1aee:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1af4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1af6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1afa:	4644           	not.w d4
    1afc:	5285           	addq.l #1,d5
  for(int i2=0;i2<10;i2++) {  
    1afe:	4fef 0010      	lea 16(sp),sp
    1b02:	0c85 0000 00ff 	cmpi.l #255,d5
    1b08:	66dc           	bne.s 1ae6 <main+0x1ae0>
    1b0a:	2c2d ff70      	move.l -144(a5),d6
    1b0e:	0686 0000 2dc0 	addi.l #11712,d6
    1b14:	2c45           	movea.l d5,a6
    1b16:	2e0b           	move.l a3,d7
    1b18:	2646           	movea.l d6,a3
  }
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    1b1a:	7c00           	moveq #0,d6
    1b1c:	3c04           	move.w d4,d6
    1b1e:	2f0e           	move.l a6,-(sp)
    1b20:	2f06           	move.l d6,-(sp)
    1b22:	2f0b           	move.l a3,-(sp)
    1b24:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1b2a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 256+i*2);
    1b2c:	486e 0001      	pea 1(a6)
    1b30:	2f06           	move.l d6,-(sp)
    1b32:	486b 0030      	pea 48(a3)
    1b36:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1b3c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1b3e:	4644           	not.w d4
    1b40:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1b42:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    1b46:	4fef 0020      	lea 32(sp),sp
    1b4a:	bcfc 010d      	cmpa.w #269,a6
    1b4e:	66ca           	bne.s 1b1a <main+0x1b14>
    1b50:	2647           	movea.l d7,a3
  }
  TestRow( valsupposed, valactual, mask, 269);
    1b52:	2f0e           	move.l a6,-(sp)
    1b54:	3f04           	move.w d4,-(sp)
    1b56:	4267           	clr.w -(sp)
    1b58:	206d ff70      	movea.l -144(a5),a0
    1b5c:	4868 3060      	pea 12384(a0)
    1b60:	4879 0000 73b8 	pea 73b8 <destlinezoom8>
    1b66:	4e92           	jsr (a2)
 
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 8);
    1b68:	4878 0008      	pea 8 <main+0x2>
    1b6c:	2f0b           	move.l a3,-(sp)
    1b6e:	2f0c           	move.l a4,-(sp)
    1b70:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1b76:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    1b7c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom9;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1b80:	42a7           	clr.l -(sp)
    1b82:	42a7           	clr.l -(sp)
    1b84:	2f2d ff7c      	move.l -132(a5),-(sp)
    1b88:	4879 0000 738c 	pea 738c <destlinezoom9>
    1b8e:	4e92           	jsr (a2)
    1b90:	4fef 002c      	lea 44(sp),sp
    1b94:	3c7c 0001      	movea.w #1,a6
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
    1b98:	7cff           	moveq #-1,d6
    1b9a:	2e0b           	move.l a3,d7
    1b9c:	266d ff88      	movea.l -120(a5),a3
  
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1ba0:	7800           	moveq #0,d4
    1ba2:	3806           	move.w d6,d4
    1ba4:	2f0e           	move.l a6,-(sp)
    1ba6:	2f04           	move.l d4,-(sp)
    1ba8:	2f0b           	move.l a3,-(sp)
    1baa:	4879 0000 738c 	pea 738c <destlinezoom9>
    1bb0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1bb2:	486e 0001      	pea 1(a6)
    1bb6:	2f04           	move.l d4,-(sp)
    1bb8:	486b 0030      	pea 48(a3)
    1bbc:	4879 0000 738c 	pea 738c <destlinezoom9>
    1bc2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1bc4:	4646           	not.w d6
    1bc6:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1bc8:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<3;i++) {
    1bcc:	4fef 0020      	lea 32(sp),sp
    1bd0:	7007           	moveq #7,d0
    1bd2:	b08e           	cmp.l a6,d0
    1bd4:	66ca           	bne.s 1ba0 <main+0x1b9a>
    1bd6:	282d ff8c      	move.l -116(a5),d4
    1bda:	307c 0014      	movea.w #20,a0
    1bde:	2b4c ff70      	move.l a4,-144(a5)
    1be2:	2b47 ff88      	move.l d7,-120(a5)
    1be6:	2648           	movea.l a0,a3
    1be8:	2b42 ff8c      	move.l d2,-116(a5)
    1bec:	2c44           	movea.l d4,a6
    1bee:	4dee fe50      	lea -432(a6),a6
    1bf2:	49eb fff7      	lea -9(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<9;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    1bf6:	2f0c           	move.l a4,-(sp)
    1bf8:	3f06           	move.w d6,-(sp)
    1bfa:	4267           	clr.w -(sp)
    1bfc:	2f0e           	move.l a6,-(sp)
    1bfe:	4879 0000 738c 	pea 738c <destlinezoom9>
    1c04:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1c06:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1c0a:	4646           	not.w d6
    1c0c:	528c           	addq.l #1,a4
    for(int i2=0;i2<9;i2++) {  
    1c0e:	4fef 0010      	lea 16(sp),sp
    1c12:	b88e           	cmp.l a6,d4
    1c14:	66e0           	bne.s 1bf6 <main+0x1bf0>
    1c16:	2e0b           	move.l a3,d7
    1c18:	49eb 0009      	lea 9(a3),a4
    }
    
    for(int i2=0;i2<9;i2++) {
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    1c1c:	7400           	moveq #0,d2
    1c1e:	3406           	move.w d6,d2
    1c20:	2f07           	move.l d7,-(sp)
    1c22:	2f02           	move.l d2,-(sp)
    1c24:	2f0e           	move.l a6,-(sp)
    1c26:	4879 0000 738c 	pea 738c <destlinezoom9>
    1c2c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    1c2e:	5287           	addq.l #1,d7
    1c30:	2f07           	move.l d7,-(sp)
    1c32:	2f02           	move.l d2,-(sp)
    1c34:	486e 0030      	pea 48(a6)
    1c38:	4879 0000 738c 	pea 738c <destlinezoom9>
    1c3e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1c40:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    1c42:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    1c46:	4fef 0020      	lea 32(sp),sp
    1c4a:	b9c7           	cmpa.l d7,a4
    1c4c:	66ce           	bne.s 1c1c <main+0x1c16>
    1c4e:	0684 0000 0510 	addi.l #1296,d4
    1c54:	47eb 001b      	lea 27(a3),a3
  for(int i=0;i<9;i++) {
    1c58:	b6fc 0107      	cmpa.w #263,a3
    1c5c:	668e           	bne.s 1bec <main+0x1be6>
    1c5e:	286d ff70      	movea.l -144(a5),a4
    1c62:	266d ff88      	movea.l -120(a5),a3
    1c66:	242d ff8c      	move.l -116(a5),d2
    1c6a:	41eb 2ee4      	lea 12004(a3),a0
    1c6e:	2b48 ff70      	move.l a0,-144(a5)
    1c72:	2c48           	movea.l a0,a6
    }
  }

  for(int i2=0;i2<9;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1c74:	2f2d ff68      	move.l -152(a5),-(sp)
    1c78:	3f06           	move.w d6,-(sp)
    1c7a:	4267           	clr.w -(sp)
    1c7c:	2f0e           	move.l a6,-(sp)
    1c7e:	4879 0000 738c 	pea 738c <destlinezoom9>
    1c84:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1c86:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1c8a:	4646           	not.w d6
    1c8c:	52ad ff68      	addq.l #1,-152(a5)
  for(int i2=0;i2<9;i2++) {  
    1c90:	4fef 0010      	lea 16(sp),sp
    1c94:	0cad 0000 00fe 	cmpi.l #254,-152(a5)
    1c9a:	ff68 
    1c9c:	66d6           	bne.s 1c74 <main+0x1c6e>
    1c9e:	41eb 3094      	lea 12436(a3),a0
    1ca2:	2b48 ff88      	move.l a0,-120(a5)
    1ca6:	2c42           	movea.l d2,a6
  }
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    1ca8:	7400           	moveq #0,d2
    1caa:	3406           	move.w d6,d2
    1cac:	2f0e           	move.l a6,-(sp)
    1cae:	2f02           	move.l d2,-(sp)
    1cb0:	2f2d ff88      	move.l -120(a5),-(sp)
    1cb4:	4879 0000 738c 	pea 738c <destlinezoom9>
    1cba:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 260+i*2);
    1cbc:	486e 0001      	pea 1(a6)
    1cc0:	2f02           	move.l d2,-(sp)
    1cc2:	206d ff88      	movea.l -120(a5),a0
    1cc6:	4868 0030      	pea 48(a0)
    1cca:	4879 0000 738c 	pea 738c <destlinezoom9>
    1cd0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1cd2:	4646           	not.w d6
    1cd4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1cd6:	7060           	moveq #96,d0
    1cd8:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<5;i++) {
    1cdc:	4fef 0020      	lea 32(sp),sp
    1ce0:	bcfc 010d      	cmpa.w #269,a6
    1ce4:	66c2           	bne.s 1ca8 <main+0x1ca2>
  }
  TestRow( valsupposed, valactual, mask, 269);
    1ce6:	2f0e           	move.l a6,-(sp)
    1ce8:	3f06           	move.w d6,-(sp)
    1cea:	4267           	clr.w -(sp)
    1cec:	2f2d ff78      	move.l -136(a5),-(sp)
    1cf0:	4879 0000 738c 	pea 738c <destlinezoom9>
    1cf6:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 9);
    1cf8:	4878 0009      	pea 9 <main+0x3>
    1cfc:	2f0c           	move.l a4,-(sp)
    1cfe:	2f0b           	move.l a3,-(sp)
    1d00:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1d06:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    1d0c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom10;

  mask = 0xffff;
  TestRow( valsupposed, valactual, mask, 0);
    1d10:	42a7           	clr.l -(sp)
    1d12:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1d18:	2f2d ff6c      	move.l -148(a5),-(sp)
    1d1c:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1d22:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 1);   
    1d24:	4fef 002c      	lea 44(sp),sp
    1d28:	4878 0001      	pea 1 <_start+0x1>
    1d2c:	42a7           	clr.l -(sp)
    1d2e:	2f2d ff80      	move.l -128(a5),-(sp)
    1d32:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1d38:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 2);
    1d3a:	4878 0002      	pea 2 <_start+0x2>
    1d3e:	42a7           	clr.l -(sp)
    1d40:	2f2d ff90      	move.l -112(a5),-(sp)
    1d44:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1d4a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i=0;i<9;i++) {
    1d4c:	242d ff94      	move.l -108(a5),d2
    1d50:	4fef 0020      	lea 32(sp),sp
  mask = mask ^ 0xffff;
    1d54:	7eff           	moveq #-1,d7
    1d56:	2c43           	movea.l d3,a6
    1d58:	2042           	movea.l d2,a0
    1d5a:	41e8 fe80      	lea -384(a0),a0
    1d5e:	2b48 ff88      	move.l a0,-120(a5)
    1d62:	260e           	move.l a6,d3
    1d64:	5183           	subq.l #8,d3
    for(int i2=0;i2<8;i2++) {  
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    1d66:	2f03           	move.l d3,-(sp)
    1d68:	3f07           	move.w d7,-(sp)
    1d6a:	4267           	clr.w -(sp)
    1d6c:	2f2d ff88      	move.l -120(a5),-(sp)
    1d70:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1d76:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1d78:	7030           	moveq #48,d0
    1d7a:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    1d7e:	4647           	not.w d7
    1d80:	5283           	addq.l #1,d3
    for(int i2=0;i2<8;i2++) {  
    1d82:	4fef 0010      	lea 16(sp),sp
    1d86:	b4ad ff88      	cmp.l -120(a5),d2
    1d8a:	66da           	bne.s 1d66 <main+0x1d60>
    1d8c:	260e           	move.l a6,d3
    1d8e:	2c2d ff88      	move.l -120(a5),d6
    1d92:	0686 0000 03c0 	addi.l #960,d6
    }
    
    for(int i2=0;i2<10;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    1d98:	7800           	moveq #0,d4
    1d9a:	3807           	move.w d7,d4
    1d9c:	2f03           	move.l d3,-(sp)
    1d9e:	2f04           	move.l d4,-(sp)
    1da0:	2f2d ff88      	move.l -120(a5),-(sp)
    1da4:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1daa:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    1dac:	2f03           	move.l d3,-(sp)
    1dae:	2f04           	move.l d4,-(sp)
    1db0:	206d ff88      	movea.l -120(a5),a0
    1db4:	4868 0030      	pea 48(a0)
    1db8:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1dbe:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1dc0:	7060           	moveq #96,d0
    1dc2:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    1dc6:	4647           	not.w d7
    1dc8:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {
    1dca:	4fef 0020      	lea 32(sp),sp
    1dce:	bcad ff88      	cmp.l -120(a5),d6
    1dd2:	66c4           	bne.s 1d98 <main+0x1d92>
    1dd4:	0682 0000 0540 	addi.l #1344,d2
    1dda:	4dee 001c      	lea 28(a6),a6
  for(int i=0;i<9;i++) {
    1dde:	bcfc 0107      	cmpa.w #263,a6
    1de2:	6600 ff74      	bne.w 1d58 <main+0x1d52>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, 255+i2);
    1de6:	2f05           	move.l d5,-(sp)
    1de8:	3f07           	move.w d7,-(sp)
    1dea:	4267           	clr.w -(sp)
    1dec:	2f2d ffa4      	move.l -92(a5),-(sp)
    1df0:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1df6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1df8:	7030           	moveq #48,d0
    1dfa:	d1ad ffa4      	add.l d0,-92(a5)
    mask = mask ^ 0xffff;
    1dfe:	4647           	not.w d7
    1e00:	5285           	addq.l #1,d5
  for(int i2=0;i2<8;i2++) {  
    1e02:	4fef 0010      	lea 16(sp),sp
    1e06:	0c85 0000 0107 	cmpi.l #263,d5
    1e0c:	66d8           	bne.s 1de6 <main+0x1de0>
    1e0e:	4dec 3154      	lea 12628(a4),a6
    1e12:	2b7c 0000 0108 	move.l #264,-120(a5)
    1e18:	ff88 
  }
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    1e1a:	7400           	moveq #0,d2
    1e1c:	3407           	move.w d7,d2
    1e1e:	206d ff88      	movea.l -120(a5),a0
    1e22:	4868 ffff      	pea -1(a0)
    1e26:	2f02           	move.l d2,-(sp)
    1e28:	2f0e           	move.l a6,-(sp)
    1e2a:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1e30:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 264+i*2);
    1e32:	2f2d ff88      	move.l -120(a5),-(sp)
    1e36:	2f02           	move.l d2,-(sp)
    1e38:	486e 0030      	pea 48(a6)
    1e3c:	4879 0000 7360 	pea 7360 <destlinezoom10>
    1e42:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1e44:	4647           	not.w d7
    1e46:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    1e4a:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    1e4e:	4fef 0020      	lea 32(sp),sp
    1e52:	0cad 0000 010e 	cmpi.l #270,-120(a5)
    1e58:	ff88 
    1e5a:	66be           	bne.s 1e1a <main+0x1e14>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 10);
    1e5c:	4878 000a      	pea a <main+0x4>
    1e60:	2f0b           	move.l a3,-(sp)
    1e62:	2f0c           	move.l a4,-(sp)
    1e64:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1e6a:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    1e70:	4eae ff1c      	jsr -228(a6)
    1e74:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    1e78:	2b6d ff7c ff88 	move.l -132(a5),-120(a5)
  valsupposed = destlinezoom11;

  mask = 0xffff;
 
  for(int i2=0;i2<6;i2++) {  
    1e7e:	7600           	moveq #0,d3
  mask = 0xffff;
    1e80:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    1e82:	2f03           	move.l d3,-(sp)
    1e84:	3f02           	move.w d2,-(sp)
    1e86:	4267           	clr.w -(sp)
    1e88:	2f2d ff88      	move.l -120(a5),-(sp)
    1e8c:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1e92:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1e94:	7030           	moveq #48,d0
    1e96:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    1e9a:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    1e9c:	5283           	addq.l #1,d3
    1e9e:	4fef 0010      	lea 16(sp),sp
    1ea2:	7006           	moveq #6,d0
    1ea4:	b083           	cmp.l d3,d0
    1ea6:	66da           	bne.s 1e82 <main+0x1e7c>
    1ea8:	2c6d ffa8      	movea.l -88(a5),a6
    1eac:	307c 0006      	movea.w #6,a0
    1eb0:	2b48 ff88      	move.l a0,-120(a5)
  }

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    1eb4:	7600           	moveq #0,d3
    1eb6:	3602           	move.w d2,d3
    1eb8:	2f2d ff88      	move.l -120(a5),-(sp)
    1ebc:	2f03           	move.l d3,-(sp)
    1ebe:	2f0e           	move.l a6,-(sp)
    1ec0:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1ec6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    1ec8:	206d ff88      	movea.l -120(a5),a0
    1ecc:	4868 0001      	pea 1(a0)
    1ed0:	2f03           	move.l d3,-(sp)
    1ed2:	486e 0030      	pea 48(a6)
    1ed6:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1edc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1ede:	4642           	not.w d2
    1ee0:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    1ee4:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    1ee8:	4fef 0020      	lea 32(sp),sp
    1eec:	701c           	moveq #28,d0
    1eee:	b0ad ff88      	cmp.l -120(a5),d0
    1ef2:	66c0           	bne.s 1eb4 <main+0x1eae>
    1ef4:	260b           	move.l a3,d3
    1ef6:	0683 0000 0694 	addi.l #1684,d3
    1efc:	307c 0023      	movea.w #35,a0
    1f00:	2b48 ff88      	move.l a0,-120(a5)
    1f04:	2c0b           	move.l a3,d6
    1f06:	2c43           	movea.l d3,a6
    1f08:	4dee feb0      	lea -336(a6),a6
    1f0c:	282d ff88      	move.l -120(a5),d4
    1f10:	5f84           	subq.l #7,d4
  }

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<7;i2++) {  
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    1f12:	2f04           	move.l d4,-(sp)
    1f14:	3f02           	move.w d2,-(sp)
    1f16:	4267           	clr.w -(sp)
    1f18:	2f0e           	move.l a6,-(sp)
    1f1a:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1f20:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1f22:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1f26:	4642           	not.w d2
    1f28:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    1f2a:	4fef 0010      	lea 16(sp),sp
    1f2e:	b68e           	cmp.l a6,d3
    1f30:	66e0           	bne.s 1f12 <main+0x1f0c>
    1f32:	266d ff88      	movea.l -120(a5),a3
    1f36:	2a0e           	move.l a6,d5
    1f38:	0685 0000 0420 	addi.l #1056,d5
    }
    
    for(int i2=0;i2<11;i2++) {
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    1f3e:	7800           	moveq #0,d4
    1f40:	3802           	move.w d2,d4
    1f42:	2f0b           	move.l a3,-(sp)
    1f44:	2f04           	move.l d4,-(sp)
    1f46:	2f0e           	move.l a6,-(sp)
    1f48:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1f4e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    1f50:	486b ffe8      	pea -24(a3)
    1f54:	2f04           	move.l d4,-(sp)
    1f56:	486e 0030      	pea 48(a6)
    1f5a:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1f60:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1f62:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    1f66:	4642           	not.w d2
    1f68:	548b           	addq.l #2,a3
    for(int i2=0;i2<11;i2++) {
    1f6a:	4fef 0020      	lea 32(sp),sp
    1f6e:	ba8e           	cmp.l a6,d5
    1f70:	66cc           	bne.s 1f3e <main+0x1f38>
    1f72:	0683 0000 0570 	addi.l #1392,d3
    1f78:	701d           	moveq #29,d0
    1f7a:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<8;i++) {
    1f7e:	0cad 0000 010b 	cmpi.l #267,-120(a5)
    1f84:	ff88 
    1f86:	6600 ff7e      	bne.w 1f06 <main+0x1f00>
    1f8a:	2646           	movea.l d6,a3
    1f8c:	41eb 30c4      	lea 12484(a3),a0
    1f90:	2b48 ff88      	move.l a0,-120(a5)
    1f94:	283c 0000 0104 	move.l #260,d4
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    1f9a:	7600           	moveq #0,d3
    1f9c:	3602           	move.w d2,d3
    1f9e:	2f04           	move.l d4,-(sp)
    1fa0:	2f03           	move.l d3,-(sp)
    1fa2:	2f2d ff88      	move.l -120(a5),-(sp)
    1fa6:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1fac:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1fae:	7030           	moveq #48,d0
    1fb0:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    1fb4:	4642           	not.w d2
    1fb6:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    1fb8:	4fef 0010      	lea 16(sp),sp
    1fbc:	0c84 0000 010b 	cmpi.l #267,d4
    1fc2:	66d6           	bne.s 1f9a <main+0x1f94>
    1fc4:	0282 0000 ffff 	andi.l #65535,d2
  }
  TestRow( valsupposed, valactual, mask, 267);   
    1fca:	2f04           	move.l d4,-(sp)
    1fcc:	2f02           	move.l d2,-(sp)
    1fce:	2f2d ff98      	move.l -104(a5),-(sp)
    1fd2:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1fd8:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 268);
    1fda:	4878 010c      	pea 10c <main+0x106>
    1fde:	2f02           	move.l d2,-(sp)
    1fe0:	2f2d ff9c      	move.l -100(a5),-(sp)
    1fe4:	4879 0000 7334 	pea 7334 <destlinezoom11>
    1fea:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 269);
    1fec:	4fef 0020      	lea 32(sp),sp
    1ff0:	4878 010d      	pea 10d <main+0x107>
    1ff4:	2f03           	move.l d3,-(sp)
    1ff6:	2f2d ff78      	move.l -136(a5),-(sp)
    1ffa:	4879 0000 7334 	pea 7334 <destlinezoom11>
    2000:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 11);
    2002:	4878 000b      	pea b <main+0x5>
    2006:	2f0c           	move.l a4,-(sp)
    2008:	2f0b           	move.l a3,-(sp)
    200a:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2010:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2016:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom12;

  mask = 0x0;
   
  TestRow( valsupposed, valactual, mask, 0);
    201a:	42a7           	clr.l -(sp)
    201c:	42a7           	clr.l -(sp)
    201e:	2f2d ff6c      	move.l -148(a5),-(sp)
    2022:	4879 0000 7308 	pea 7308 <destlinezoom12>
    2028:	4e92           	jsr (a2)
    202a:	4fef 002c      	lea 44(sp),sp
    202e:	262d ff74      	move.l -140(a5),d3
  valactual += ZMLINESIZE/2;
    2032:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);
    2036:	307c 0001      	movea.w #1,a0
    203a:	2b48 ff78      	move.l a0,-136(a5)
  mask = mask ^ 0xffff;
    203e:	74ff           	moveq #-1,d2

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2040:	7800           	moveq #0,d4
    2042:	3802           	move.w d2,d4
    2044:	2f2d ff78      	move.l -136(a5),-(sp)
    2048:	2f04           	move.l d4,-(sp)
    204a:	2f0e           	move.l a6,-(sp)
    204c:	4879 0000 7308 	pea 7308 <destlinezoom12>
    2052:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2054:	206d ff78      	movea.l -136(a5),a0
    2058:	4868 0001      	pea 1(a0)
    205c:	2f04           	move.l d4,-(sp)
    205e:	486e 0030      	pea 48(a6)
    2062:	4879 0000 7308 	pea 7308 <destlinezoom12>
    2068:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    206a:	4642           	not.w d2
    206c:	54ad ff78      	addq.l #2,-136(a5)
  for(int i2=0;i2<12;i2++) {
    2070:	4fef 0020      	lea 32(sp),sp
    2074:	7019           	moveq #25,d0
    2076:	b0ad ff78      	cmp.l -136(a5),d0
    207a:	6748           	beq.s 20c4 <main+0x20be>
    207c:	200e           	move.l a6,d0
    207e:	0680 0000 00c0 	addi.l #192,d0
    2084:	2c43           	movea.l d3,a6
    2086:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2088:	7800           	moveq #0,d4
    208a:	3802           	move.w d2,d4
    208c:	2f2d ff78      	move.l -136(a5),-(sp)
    2090:	2f04           	move.l d4,-(sp)
    2092:	2f0e           	move.l a6,-(sp)
    2094:	4879 0000 7308 	pea 7308 <destlinezoom12>
    209a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    209c:	206d ff78      	movea.l -136(a5),a0
    20a0:	4868 0001      	pea 1(a0)
    20a4:	2f04           	move.l d4,-(sp)
    20a6:	486e 0030      	pea 48(a6)
    20aa:	4879 0000 7308 	pea 7308 <destlinezoom12>
    20b0:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    20b2:	4642           	not.w d2
    20b4:	54ad ff78      	addq.l #2,-136(a5)
  for(int i2=0;i2<12;i2++) {
    20b8:	4fef 0020      	lea 32(sp),sp
    20bc:	7019           	moveq #25,d0
    20be:	b0ad ff78      	cmp.l -136(a5),d0
    20c2:	66b8           	bne.s 207c <main+0x2076>
    20c4:	2803           	move.l d3,d4
    20c6:	0684 0000 0120 	addi.l #288,d4
    20cc:	307c 001f      	movea.w #31,a0
    20d0:	2b48 ff78      	move.l a0,-136(a5)
    20d4:	2c0b           	move.l a3,d6
    20d6:	2c44           	movea.l d4,a6
    20d8:	4dee fee0      	lea -288(a6),a6
    20dc:	2a2d ff78      	move.l -136(a5),d5
    20e0:	5d85           	subq.l #6,d5
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<6;i2++) {  
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    20e2:	2f05           	move.l d5,-(sp)
    20e4:	3f02           	move.w d2,-(sp)
    20e6:	4267           	clr.w -(sp)
    20e8:	2f0e           	move.l a6,-(sp)
    20ea:	4879 0000 7308 	pea 7308 <destlinezoom12>
    20f0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    20f2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    20f6:	4642           	not.w d2
    20f8:	5285           	addq.l #1,d5
    for(int i2=0;i2<6;i2++) {  
    20fa:	4fef 0010      	lea 16(sp),sp
    20fe:	b88e           	cmp.l a6,d4
    2100:	66e0           	bne.s 20e2 <main+0x20dc>
    2102:	266d ff78      	movea.l -136(a5),a3
    2106:	2e0e           	move.l a6,d7
    2108:	0687 0000 0480 	addi.l #1152,d7
    }
    
    for(int i2=0;i2<12;i2++) {
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    210e:	7a00           	moveq #0,d5
    2110:	3a02           	move.w d2,d5
    2112:	2f0b           	move.l a3,-(sp)
    2114:	2f05           	move.l d5,-(sp)
    2116:	2f0e           	move.l a6,-(sp)
    2118:	4879 0000 7308 	pea 7308 <destlinezoom12>
    211e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    2120:	486b 0001      	pea 1(a3)
    2124:	2f05           	move.l d5,-(sp)
    2126:	486e 0030      	pea 48(a6)
    212a:	4879 0000 7308 	pea 7308 <destlinezoom12>
    2130:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2132:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2136:	4642           	not.w d2
    2138:	548b           	addq.l #2,a3
    for(int i2=0;i2<12;i2++) {
    213a:	4fef 0020      	lea 32(sp),sp
    213e:	be8e           	cmp.l a6,d7
    2140:	66cc           	bne.s 210e <main+0x2108>
    2142:	0684 0000 05a0 	addi.l #1440,d4
    2148:	701e           	moveq #30,d0
    214a:	d1ad ff78      	add.l d0,-136(a5)
  for(int i=0;i<8;i++) {
    214e:	0cad 0000 010f 	cmpi.l #271,-136(a5)
    2154:	ff78 
    2156:	6600 ff7e      	bne.w 20d6 <main+0x20d0>
    215a:	2646           	movea.l d6,a3
    215c:	0683 0000 2d00 	addi.l #11520,d3
    2162:	2b43 ff78      	move.l d3,-136(a5)
    2166:	263c 0000 0104 	move.l #260,d3
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    216c:	2f03           	move.l d3,-(sp)
    216e:	3f02           	move.w d2,-(sp)
    2170:	4267           	clr.w -(sp)
    2172:	2f2d ff78      	move.l -136(a5),-(sp)
    2176:	4879 0000 7308 	pea 7308 <destlinezoom12>
    217c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    217e:	7030           	moveq #48,d0
    2180:	d1ad ff78      	add.l d0,-136(a5)
    mask = mask ^ 0xffff;
    2184:	4642           	not.w d2
    2186:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    2188:	4fef 0010      	lea 16(sp),sp
    218c:	0c83 0000 0109 	cmpi.l #265,d3
    2192:	66d8           	bne.s 216c <main+0x2166>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 12);
    2194:	4878 000c      	pea c <main+0x6>
    2198:	2f0b           	move.l a3,-(sp)
    219a:	2f0c           	move.l a4,-(sp)
    219c:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    21a2:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    21a8:	4eae ff1c      	jsr -228(a6)
    21ac:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    21b0:	2c6d ff7c      	movea.l -132(a5),a6
  WaitBlit();
    21b4:	307c 0001      	movea.w #1,a0
    21b8:	2b48 ff78      	move.l a0,-136(a5)
  valsupposed = destlinezoom13;

  mask = 0xffff;
    21bc:	7cff           	moveq #-1,d6

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    21be:	7400           	moveq #0,d2
    21c0:	3406           	move.w d6,d2
    21c2:	206d ff78      	movea.l -136(a5),a0
    21c6:	4868 ffff      	pea -1(a0)
    21ca:	2f02           	move.l d2,-(sp)
    21cc:	2f0e           	move.l a6,-(sp)
    21ce:	4879 0000 72dc 	pea 72dc <destlinezoom13>
    21d4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    21d6:	2f2d ff78      	move.l -136(a5),-(sp)
    21da:	2f02           	move.l d2,-(sp)
    21dc:	486e 0030      	pea 48(a6)
    21e0:	4879 0000 72dc 	pea 72dc <destlinezoom13>
    21e6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    21e8:	4646           	not.w d6
    21ea:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    21ee:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    21f2:	4fef 0020      	lea 32(sp),sp
    21f6:	7017           	moveq #23,d0
    21f8:	b0ad ff78      	cmp.l -136(a5),d0
    21fc:	66c0           	bne.s 21be <main+0x21b8>
    21fe:	240b           	move.l a3,d2
    2200:	0682 0000 0514 	addi.l #1300,d2
    2206:	781b           	moveq #27,d4
    2208:	2a0b           	move.l a3,d5
    220a:	2644           	movea.l d4,a3
    220c:	280c           	move.l a4,d4
    220e:	2c42           	movea.l d2,a6
    2210:	4dee ff10      	lea -240(a6),a6
    2214:	260b           	move.l a3,d3
    2216:	5b83           	subq.l #5,d3
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<5;i2++) {  
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    2218:	2f03           	move.l d3,-(sp)
    221a:	3f06           	move.w d6,-(sp)
    221c:	4267           	clr.w -(sp)
    221e:	2f0e           	move.l a6,-(sp)
    2220:	4879 0000 72dc 	pea 72dc <destlinezoom13>
    2226:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2228:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    222c:	4646           	not.w d6
    222e:	5283           	addq.l #1,d3
    for(int i2=0;i2<5;i2++) {  
    2230:	4fef 0010      	lea 16(sp),sp
    2234:	b48e           	cmp.l a6,d2
    2236:	66e0           	bne.s 2218 <main+0x2212>
    2238:	284b           	movea.l a3,a4
    223a:	2e0e           	move.l a6,d7
    223c:	0687 0000 04e0 	addi.l #1248,d7
    }
    
    for(int i2=0;i2<13;i2++) {
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    2242:	7600           	moveq #0,d3
    2244:	3606           	move.w d6,d3
    2246:	2f0c           	move.l a4,-(sp)
    2248:	2f03           	move.l d3,-(sp)
    224a:	2f0e           	move.l a6,-(sp)
    224c:	4879 0000 72dc 	pea 72dc <destlinezoom13>
    2252:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    2254:	486c 0001      	pea 1(a4)
    2258:	2f03           	move.l d3,-(sp)
    225a:	486e 0030      	pea 48(a6)
    225e:	4879 0000 72dc 	pea 72dc <destlinezoom13>
    2264:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2266:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    226a:	4646           	not.w d6
    226c:	548c           	addq.l #2,a4
    for(int i2=0;i2<13;i2++) {
    226e:	4fef 0020      	lea 32(sp),sp
    2272:	be8e           	cmp.l a6,d7
    2274:	66cc           	bne.s 2242 <main+0x223c>
    2276:	0682 0000 05d0 	addi.l #1488,d2
    227c:	47eb 001f      	lea 31(a3),a3
  for(int i=0;i<8;i++) {
    2280:	b6fc 0113      	cmpa.w #275,a3
    2284:	6688           	bne.s 220e <main+0x2208>
    2286:	2844           	movea.l d4,a4

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 13);
    2288:	4878 000d      	pea d <main+0x7>
    228c:	2f04           	move.l d4,-(sp)
    228e:	2f05           	move.l d5,-(sp)
    2290:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2296:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    229c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom14;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);   
    22a0:	42a7           	clr.l -(sp)
    22a2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    22a8:	2f2d ff6c      	move.l -148(a5),-(sp)
    22ac:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    22b2:	4e92           	jsr (a2)
    22b4:	4fef 001c      	lea 28(sp),sp
    22b8:	262d ff74      	move.l -140(a5),d3
  valactual += ZMLINESIZE/2; 
    22bc:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);   
    22c0:	7401           	moveq #1,d2
  mask = mask ^ 0xffff; 
    22c2:	4247           	clr.w d7
    22c4:	2805           	move.l d5,d4
    22c6:	264e           	movea.l a6,a3
    22c8:	2c42           	movea.l d2,a6

  for(int i2=0;i2<9;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    22ca:	7400           	moveq #0,d2
    22cc:	3407           	move.w d7,d2
    22ce:	2f0e           	move.l a6,-(sp)
    22d0:	2f02           	move.l d2,-(sp)
    22d2:	2f0b           	move.l a3,-(sp)
    22d4:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    22da:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    22dc:	486e 0001      	pea 1(a6)
    22e0:	2f02           	move.l d2,-(sp)
    22e2:	486b 0030      	pea 48(a3)
    22e6:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    22ec:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    22ee:	4647           	not.w d7
    22f0:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    22f2:	4fef 0020      	lea 32(sp),sp
    22f6:	7013           	moveq #19,d0
    22f8:	b08e           	cmp.l a6,d0
    22fa:	673e           	beq.s 233a <main+0x2334>
    22fc:	200b           	move.l a3,d0
    22fe:	0680 0000 00c0 	addi.l #192,d0
    2304:	2643           	movea.l d3,a3
    2306:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2308:	7400           	moveq #0,d2
    230a:	3407           	move.w d7,d2
    230c:	2f0e           	move.l a6,-(sp)
    230e:	2f02           	move.l d2,-(sp)
    2310:	2f0b           	move.l a3,-(sp)
    2312:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    2318:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    231a:	486e 0001      	pea 1(a6)
    231e:	2f02           	move.l d2,-(sp)
    2320:	486b 0030      	pea 48(a3)
    2324:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    232a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    232c:	4647           	not.w d7
    232e:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    2330:	4fef 0020      	lea 32(sp),sp
    2334:	7013           	moveq #19,d0
    2336:	b08e           	cmp.l a6,d0
    2338:	66c2           	bne.s 22fc <main+0x22f6>
    233a:	2644           	movea.l d4,a3
    233c:	240e           	move.l a6,d2
    233e:	2803           	move.l d3,d4
    2340:	0684 0000 00c0 	addi.l #192,d4
    2346:	2c0b           	move.l a3,d6
    2348:	2b6d ff78 ff88 	move.l -136(a5),-120(a5)
    234e:	2c44           	movea.l d4,a6
    2350:	4dee ff40      	lea -192(a6),a6
    2354:	2a2d ff88      	move.l -120(a5),d5
    2358:	5985           	subq.l #4,d5
  } 

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<4;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    235a:	2f05           	move.l d5,-(sp)
    235c:	3f07           	move.w d7,-(sp)
    235e:	4267           	clr.w -(sp)
    2360:	2f0e           	move.l a6,-(sp)
    2362:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    2368:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    236a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    236e:	4647           	not.w d7
    2370:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    2372:	4fef 0010      	lea 16(sp),sp
    2376:	b88e           	cmp.l a6,d4
    2378:	66e0           	bne.s 235a <main+0x2354>
    237a:	266d ff88      	movea.l -120(a5),a3
    237e:	41ee 0540      	lea 1344(a6),a0
    2382:	2b48 ff78      	move.l a0,-136(a5)
    }
    
    for(int i2=0;i2<14;i2++) {
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    2386:	7a00           	moveq #0,d5
    2388:	3a07           	move.w d7,d5
    238a:	2f0b           	move.l a3,-(sp)
    238c:	2f05           	move.l d5,-(sp)
    238e:	2f0e           	move.l a6,-(sp)
    2390:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    2396:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    2398:	486b 0001      	pea 1(a3)
    239c:	2f05           	move.l d5,-(sp)
    239e:	486e 0030      	pea 48(a6)
    23a2:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    23a8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    23aa:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    23ae:	4647           	not.w d7
    23b0:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    23b2:	4fef 0020      	lea 32(sp),sp
    23b6:	bded ff78      	cmpa.l -136(a5),a6
    23ba:	66ca           	bne.s 2386 <main+0x2380>
    23bc:	0684 0000 0600 	addi.l #1536,d4
    23c2:	7020           	moveq #32,d0
    23c4:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<7;i++) {
    23c8:	0cad 0000 00f7 	cmpi.l #247,-120(a5)
    23ce:	ff88 
    23d0:	6600 ff7c      	bne.w 234e <main+0x2348>
    23d4:	2646           	movea.l d6,a3
    23d6:	2c43           	movea.l d3,a6
    23d8:	4dee 2a00      	lea 10752(a6),a6
    23dc:	2b7c 0000 00f3 	move.l #243,-136(a5)
    23e2:	ff78 
    }
  }

  for(int i2=0;i2<4;i2++) {  
    TestRow( valsupposed, valactual, mask, 243+i2);
    23e4:	2f2d ff78      	move.l -136(a5),-(sp)
    23e8:	3f07           	move.w d7,-(sp)
    23ea:	4267           	clr.w -(sp)
    23ec:	2f0e           	move.l a6,-(sp)
    23ee:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    23f4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    23f6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    23fa:	4647           	not.w d7
    23fc:	52ad ff78      	addq.l #1,-136(a5)
  for(int i2=0;i2<4;i2++) {  
    2400:	4fef 0010      	lea 16(sp),sp
    2404:	0cad 0000 00f7 	cmpi.l #247,-136(a5)
    240a:	ff78 
    240c:	66d6           	bne.s 23e4 <main+0x23de>
    240e:	0683 0000 2ac0 	addi.l #10944,d3
    2414:	2c6d ff78      	movea.l -136(a5),a6
    2418:	280b           	move.l a3,d4
    241a:	2643           	movea.l d3,a3
  }

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    241c:	7600           	moveq #0,d3
    241e:	3607           	move.w d7,d3
    2420:	2f0e           	move.l a6,-(sp)
    2422:	2f03           	move.l d3,-(sp)
    2424:	2f0b           	move.l a3,-(sp)
    2426:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    242c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    242e:	486e 0001      	pea 1(a6)
    2432:	2f03           	move.l d3,-(sp)
    2434:	486b 0030      	pea 48(a3)
    2438:	4879 0000 72b0 	pea 72b0 <destlinezoom14>
    243e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2440:	4647           	not.w d7
    2442:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2444:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<12;i2++) {
    2448:	4fef 0020      	lea 32(sp),sp
    244c:	bcfc 010f      	cmpa.w #271,a6
    2450:	66ca           	bne.s 241c <main+0x2416>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 14);
    2452:	4878 000e      	pea e <main+0x8>
    2456:	2f04           	move.l d4,-(sp)
    2458:	2f0c           	move.l a4,-(sp)
    245a:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2460:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2466:	4eae ff1c      	jsr -228(a6)
    246a:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    246e:	262d ff7c      	move.l -132(a5),d3
  WaitBlit();
    2472:	3c7c 0001      	movea.w #1,a6
  valsupposed = destlinezoom15;

  mask = 0x0000;
    2476:	4246           	clr.w d6
    2478:	2643           	movea.l d3,a3

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    247a:	7600           	moveq #0,d3
    247c:	3606           	move.w d6,d3
    247e:	486e ffff      	pea -1(a6)
    2482:	2f03           	move.l d3,-(sp)
    2484:	2f0b           	move.l a3,-(sp)
    2486:	4879 0000 7284 	pea 7284 <destlinezoom15>
    248c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    248e:	2f0e           	move.l a6,-(sp)
    2490:	2f03           	move.l d3,-(sp)
    2492:	486b 0030      	pea 48(a3)
    2496:	4879 0000 7284 	pea 7284 <destlinezoom15>
    249c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    249e:	4646           	not.w d6
    24a0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    24a2:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    24a6:	4fef 0020      	lea 32(sp),sp
    24aa:	7011           	moveq #17,d0
    24ac:	b08e           	cmp.l a6,d0
    24ae:	66ca           	bne.s 247a <main+0x2474>
    24b0:	262d ffa0      	move.l -96(a5),d3
    24b4:	2a04           	move.l d4,d5
    24b6:	2642           	movea.l d2,a3
    24b8:	2c43           	movea.l d3,a6
    24ba:	4dee ff70      	lea -144(a6),a6
    24be:	240b           	move.l a3,d2
    24c0:	5782           	subq.l #3,d2
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<3;i2++) {  
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    24c2:	2f02           	move.l d2,-(sp)
    24c4:	3f06           	move.w d6,-(sp)
    24c6:	4267           	clr.w -(sp)
    24c8:	2f0e           	move.l a6,-(sp)
    24ca:	4879 0000 7284 	pea 7284 <destlinezoom15>
    24d0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    24d2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    24d6:	4646           	not.w d6
    24d8:	5282           	addq.l #1,d2
    for(int i2=0;i2<3;i2++) {  
    24da:	4fef 0010      	lea 16(sp),sp
    24de:	b68e           	cmp.l a6,d3
    24e0:	66e0           	bne.s 24c2 <main+0x24bc>
    24e2:	240b           	move.l a3,d2
    24e4:	2e0e           	move.l a6,d7
    24e6:	0687 0000 05a0 	addi.l #1440,d7
    }
    
    for(int i2=0;i2<15;i2++) {
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    24ec:	7800           	moveq #0,d4
    24ee:	3806           	move.w d6,d4
    24f0:	2f02           	move.l d2,-(sp)
    24f2:	2f04           	move.l d4,-(sp)
    24f4:	2f0e           	move.l a6,-(sp)
    24f6:	4879 0000 7284 	pea 7284 <destlinezoom15>
    24fc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    24fe:	2f02           	move.l d2,-(sp)
    2500:	2f04           	move.l d4,-(sp)
    2502:	486e 0030      	pea 48(a6)
    2506:	4879 0000 7284 	pea 7284 <destlinezoom15>
    250c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    250e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2512:	4646           	not.w d6
    2514:	5482           	addq.l #2,d2
    for(int i2=0;i2<15;i2++) {
    2516:	4fef 0020      	lea 32(sp),sp
    251a:	be8e           	cmp.l a6,d7
    251c:	66ce           	bne.s 24ec <main+0x24e6>
    251e:	0683 0000 0630 	addi.l #1584,d3
    2524:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    2528:	b6fc 00fa      	cmpa.w #250,a3
    252c:	668a           	bne.s 24b8 <main+0x24b2>
    252e:	2645           	movea.l d5,a3
    2530:	4deb 2e54      	lea 11860(a3),a6
    }
  }

  for(int i2=0;i2<3;i2++) {  
    TestRow( valsupposed, valactual, mask, 247+i2);
    2534:	2f2d ff78      	move.l -136(a5),-(sp)
    2538:	3f06           	move.w d6,-(sp)
    253a:	4267           	clr.w -(sp)
    253c:	2f0e           	move.l a6,-(sp)
    253e:	4879 0000 7284 	pea 7284 <destlinezoom15>
    2544:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2546:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    254a:	4646           	not.w d6
    254c:	52ad ff78      	addq.l #1,-136(a5)
  for(int i2=0;i2<3;i2++) {  
    2550:	4fef 0010      	lea 16(sp),sp
    2554:	0cad 0000 00fa 	cmpi.l #250,-136(a5)
    255a:	ff78 
    255c:	66d6           	bne.s 2534 <main+0x252e>
    255e:	2c6d ff70      	movea.l -144(a5),a6
  }

  for(int i2=0;i2<10;i2++) {
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    2562:	7400           	moveq #0,d2
    2564:	3406           	move.w d6,d2
    2566:	2f2d ff78      	move.l -136(a5),-(sp)
    256a:	2f02           	move.l d2,-(sp)
    256c:	2f0e           	move.l a6,-(sp)
    256e:	4879 0000 7284 	pea 7284 <destlinezoom15>
    2574:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    2576:	206d ff78      	movea.l -136(a5),a0
    257a:	4868 0001      	pea 1(a0)
    257e:	2f02           	move.l d2,-(sp)
    2580:	486e 0030      	pea 48(a6)
    2584:	4879 0000 7284 	pea 7284 <destlinezoom15>
    258a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    258c:	4646           	not.w d6
    258e:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    2592:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<10;i2++) {
    2596:	4fef 0020      	lea 32(sp),sp
    259a:	0cad 0000 010e 	cmpi.l #270,-136(a5)
    25a0:	ff78 
    25a2:	66be           	bne.s 2562 <main+0x255c>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 15);
    25a4:	4878 000f      	pea f <main+0x9>
    25a8:	2f0c           	move.l a4,-(sp)
    25aa:	2f0b           	move.l a3,-(sp)
    25ac:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    25b2:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    25b8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom16;

  mask = 0x0000;

  TestRow( valsupposed, valactual, mask, 0);   
    25bc:	42a7           	clr.l -(sp)
    25be:	42a7           	clr.l -(sp)
    25c0:	2f2d ff6c      	move.l -148(a5),-(sp)
    25c4:	4879 0000 7258 	pea 7258 <destlinezoom16>
    25ca:	4e92           	jsr (a2)
    25cc:	4fef 001c      	lea 28(sp),sp
  valactual += ZMLINESIZE/2;
    25d0:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);   
    25d4:	42ad ff70      	clr.l -144(a5)
  mask = mask ^ 0xffff;
    25d8:	7aff           	moveq #-1,d5
    25da:	262d ff74      	move.l -140(a5),d3
    25de:	282d ff84      	move.l -124(a5),d4
  for(int i2=0;i2<6;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    25e2:	7400           	moveq #0,d2
    25e4:	3405           	move.w d5,d2
    25e6:	2f2d ff70      	move.l -144(a5),-(sp)
    25ea:	2f02           	move.l d2,-(sp)
    25ec:	2f0e           	move.l a6,-(sp)
    25ee:	4879 0000 7258 	pea 7258 <destlinezoom16>
    25f4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    25f6:	206d ff70      	movea.l -144(a5),a0
    25fa:	4868 0001      	pea 1(a0)
    25fe:	2f02           	move.l d2,-(sp)
    2600:	486e 0030      	pea 48(a6)
    2604:	4879 0000 7258 	pea 7258 <destlinezoom16>
    260a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    260c:	4645           	not.w d5
    260e:	2e0e           	move.l a6,d7
    2610:	0687 0000 0120 	addi.l #288,d7
    2616:	54ad ff70      	addq.l #2,-144(a5)
    261a:	2c43           	movea.l d3,a6
  for(int i2=0;i2<6;i2++) {
    261c:	4fef 0020      	lea 32(sp),sp
    2620:	700c           	moveq #12,d0
    2622:	b0ad ff70      	cmp.l -144(a5),d0
    2626:	674a           	beq.s 2672 <main+0x266c>
    2628:	2604           	move.l d4,d3
    262a:	2807           	move.l d7,d4
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    262c:	7400           	moveq #0,d2
    262e:	3405           	move.w d5,d2
    2630:	2f2d ff70      	move.l -144(a5),-(sp)
    2634:	2f02           	move.l d2,-(sp)
    2636:	2f0e           	move.l a6,-(sp)
    2638:	4879 0000 7258 	pea 7258 <destlinezoom16>
    263e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    2640:	206d ff70      	movea.l -144(a5),a0
    2644:	4868 0001      	pea 1(a0)
    2648:	2f02           	move.l d2,-(sp)
    264a:	486e 0030      	pea 48(a6)
    264e:	4879 0000 7258 	pea 7258 <destlinezoom16>
    2654:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2656:	4645           	not.w d5
    2658:	2e0e           	move.l a6,d7
    265a:	0687 0000 0120 	addi.l #288,d7
    2660:	54ad ff70      	addq.l #2,-144(a5)
    2664:	2c43           	movea.l d3,a6
  for(int i2=0;i2<6;i2++) {
    2666:	4fef 0020      	lea 32(sp),sp
    266a:	700c           	moveq #12,d0
    266c:	b0ad ff70      	cmp.l -144(a5),d0
    2670:	66b6           	bne.s 2628 <main+0x2622>
    2672:	2b44 ff84      	move.l d4,-124(a5)
    2676:	307c 000d      	movea.w #13,a0
    267a:	2b48 ff70      	move.l a0,-144(a5)
    267e:	2803           	move.l d3,d4
    2680:	2c07           	move.l d7,d6
    2682:	2e0b           	move.l a3,d7
    2684:	266d ff84      	movea.l -124(a5),a3
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<2;i2++) {  
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2688:	2f2d ff70      	move.l -144(a5),-(sp)
    268c:	7400           	moveq #0,d2
    268e:	3405           	move.w d5,d2
    2690:	2f02           	move.l d2,-(sp)
    2692:	2f04           	move.l d4,-(sp)
    2694:	4879 0000 7258 	pea 7258 <destlinezoom16>
    269a:	4e92           	jsr (a2)
    269c:	206d ff70      	movea.l -144(a5),a0
    26a0:	4868 0001      	pea 1(a0)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    26a4:	3605           	move.w d5,d3
    26a6:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    26a8:	3f03           	move.w d3,-(sp)
    26aa:	4267           	clr.w -(sp)
    26ac:	2044           	movea.l d4,a0
    26ae:	4868 0030      	pea 48(a0)
    26b2:	4879 0000 7258 	pea 7258 <destlinezoom16>
    26b8:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    26ba:	2c6d ff70      	movea.l -144(a5),a6
    26be:	568e           	addq.l #3,a6
    26c0:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    26c4:	2806           	move.l d6,d4
    26c6:	7c23           	moveq #35,d6
    26c8:	dcad ff70      	add.l -144(a5),d6
    }
    
    for(int i2=0;i2<16;i2++) {
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    26cc:	2f0e           	move.l a6,-(sp)
    26ce:	2f02           	move.l d2,-(sp)
    26d0:	2f0b           	move.l a3,-(sp)
    26d2:	4879 0000 7258 	pea 7258 <destlinezoom16>
    26d8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    26da:	486e 0001      	pea 1(a6)
    26de:	2f02           	move.l d2,-(sp)
    26e0:	486b 0030      	pea 48(a3)
    26e4:	4879 0000 7258 	pea 7258 <destlinezoom16>
    26ea:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    26ec:	3a03           	move.w d3,d5
    26ee:	41eb 00c0      	lea 192(a3),a0
    26f2:	548e           	addq.l #2,a6
    for(int i2=0;i2<16;i2++) {
    26f4:	4fef 0020      	lea 32(sp),sp
    26f8:	bc8e           	cmp.l a6,d6
    26fa:	673a           	beq.s 2736 <main+0x2730>
    26fc:	2644           	movea.l d4,a3
    26fe:	2808           	move.l a0,d4
    2700:	7400           	moveq #0,d2
    2702:	3403           	move.w d3,d2
    2704:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    2706:	2f0e           	move.l a6,-(sp)
    2708:	2f02           	move.l d2,-(sp)
    270a:	2f0b           	move.l a3,-(sp)
    270c:	4879 0000 7258 	pea 7258 <destlinezoom16>
    2712:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    2714:	486e 0001      	pea 1(a6)
    2718:	2f02           	move.l d2,-(sp)
    271a:	486b 0030      	pea 48(a3)
    271e:	4879 0000 7258 	pea 7258 <destlinezoom16>
    2724:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2726:	3a03           	move.w d3,d5
    2728:	41eb 00c0      	lea 192(a3),a0
    272c:	548e           	addq.l #2,a6
    for(int i2=0;i2<16;i2++) {
    272e:	4fef 0020      	lea 32(sp),sp
    2732:	bc8e           	cmp.l a6,d6
    2734:	66c6           	bne.s 26fc <main+0x26f6>
    2736:	7022           	moveq #34,d0
    2738:	d1ad ff70      	add.l d0,-144(a5)
  for(int i=0;i<7;i++) {
    273c:	0cad 0000 00fb 	cmpi.l #251,-144(a5)
    2742:	ff70 
    2744:	6700 00f2      	beq.w 2838 <main+0x2832>
    2748:	2c0b           	move.l a3,d6
    274a:	0686 0000 0120 	addi.l #288,d6
    2750:	2648           	movea.l a0,a3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2752:	2f2d ff70      	move.l -144(a5),-(sp)
    2756:	7400           	moveq #0,d2
    2758:	3405           	move.w d5,d2
    275a:	2f02           	move.l d2,-(sp)
    275c:	2f04           	move.l d4,-(sp)
    275e:	4879 0000 7258 	pea 7258 <destlinezoom16>
    2764:	4e92           	jsr (a2)
    2766:	206d ff70      	movea.l -144(a5),a0
    276a:	4868 0001      	pea 1(a0)
      mask = mask ^ 0xffff;
    276e:	3605           	move.w d5,d3
    2770:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2772:	3f03           	move.w d3,-(sp)
    2774:	4267           	clr.w -(sp)
    2776:	2044           	movea.l d4,a0
    2778:	4868 0030      	pea 48(a0)
    277c:	4879 0000 7258 	pea 7258 <destlinezoom16>
    2782:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2784:	2c6d ff70      	movea.l -144(a5),a6
    2788:	568e           	addq.l #3,a6
    278a:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    278e:	2806           	move.l d6,d4
    2790:	7c23           	moveq #35,d6
    2792:	dcad ff70      	add.l -144(a5),d6
    2796:	6000 ff34      	bra.w 26cc <main+0x26c6>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    279a:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    27a0:	4eae ffc4      	jsr -60(a6)
    27a4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    27aa:	2200           	move.l d0,d1
    27ac:	243c 0000 4ec8 	move.l #20168,d2
    27b2:	762c           	moveq #44,d3
    27b4:	4eae ffd0      	jsr -48(a6)
    27b8:	6000 d9fa      	bra.w 1b4 <main+0x1ae>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    27bc:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    27c2:	4eae ffc4      	jsr -60(a6)
    27c6:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    27cc:	2200           	move.l d0,d1
    27ce:	243c 0000 4cab 	move.l #19627,d2
    27d4:	7621           	moveq #33,d3
    27d6:	4eae ffd0      	jsr -48(a6)
    27da:	2079 0000 763e 	movea.l 763e <Copperlist1>,a0
    27e0:	6000 db46      	bra.w 328 <main+0x322>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    27e4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    27ea:	4eae ffc4      	jsr -60(a6)
    27ee:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    27f4:	2200           	move.l d0,d1
    27f6:	243c 0000 4efe 	move.l #20222,d2
    27fc:	7636           	moveq #54,d3
    27fe:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    2802:	23fc 0004 0000 	move.l #262144,7632 <DrawBuffer>
    2808:	0000 7632 
  ViewBuffer = (ULONG *)0x50000;
    280c:	23fc 0005 0000 	move.l #327680,7626 <ViewBuffer>
    2812:	0000 7626 
  SetBplPointers();
    2816:	45f9 0000 3e2e 	lea 3e2e <SetBplPointers>,a2
    281c:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    281e:	0cb9 0005 0000 	cmpi.l #327680,7632 <DrawBuffer>
    2824:	0000 7632 
    2828:	6600 da62      	bne.w 28c <main+0x286>
    282c:	6000 05c2      	bra.w 2df0 <main+0x2dea>
    2830:	7600           	moveq #0,d3
    2832:	3602           	move.w d2,d3
    2834:	6000 e4d0      	bra.w d06 <main+0xd00>
    2838:	2b44 ff74      	move.l d4,-140(a5)
    283c:	2b4b ff84      	move.l a3,-124(a5)
    2840:	2647           	movea.l d7,a3
    2842:	2c48           	movea.l a0,a6
    }
  }

  for(int i2=0;i2<2;i2++) {
    TestRow( valsupposed, valactual, mask, 251+i2);
    2844:	2f2d ff70      	move.l -144(a5),-(sp)
    2848:	7800           	moveq #0,d4
    284a:	3803           	move.w d3,d4
    284c:	2f04           	move.l d4,-(sp)
    284e:	2f2d ff74      	move.l -140(a5),-(sp)
    2852:	4879 0000 7258 	pea 7258 <destlinezoom16>
    2858:	4e92           	jsr (a2)
    285a:	4878 00fc      	pea fc <main+0xf6>
    285e:	2f02           	move.l d2,-(sp)
    2860:	206d ff84      	movea.l -124(a5),a0
    2864:	4868 0090      	pea 144(a0)
    2868:	4879 0000 7258 	pea 7258 <destlinezoom16>
    286e:	4e92           	jsr (a2)
    2870:	4fef 0020      	lea 32(sp),sp
    2874:	2b7c 0000 00fd 	move.l #253,-144(a5)
    287a:	ff70 
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    287c:	2f2d ff70      	move.l -144(a5),-(sp)
    2880:	2f04           	move.l d4,-(sp)
    2882:	2f0e           	move.l a6,-(sp)
    2884:	4879 0000 7258 	pea 7258 <destlinezoom16>
    288a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    288c:	206d ff70      	movea.l -144(a5),a0
    2890:	4868 0001      	pea 1(a0)
    2894:	2f04           	move.l d4,-(sp)
    2896:	486e 0030      	pea 48(a6)
    289a:	4879 0000 7258 	pea 7258 <destlinezoom16>
    28a0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    28a2:	4645           	not.w d5
    28a4:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    28a8:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    28ac:	4fef 0020      	lea 32(sp),sp
    28b0:	0cad 0000 010d 	cmpi.l #269,-144(a5)
    28b6:	ff70 
    28b8:	6742           	beq.s 28fc <main+0x28f6>
    28ba:	7800           	moveq #0,d4
    28bc:	3805           	move.w d5,d4
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    28be:	2f2d ff70      	move.l -144(a5),-(sp)
    28c2:	2f04           	move.l d4,-(sp)
    28c4:	2f0e           	move.l a6,-(sp)
    28c6:	4879 0000 7258 	pea 7258 <destlinezoom16>
    28cc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    28ce:	206d ff70      	movea.l -144(a5),a0
    28d2:	4868 0001      	pea 1(a0)
    28d6:	2f04           	move.l d4,-(sp)
    28d8:	486e 0030      	pea 48(a6)
    28dc:	4879 0000 7258 	pea 7258 <destlinezoom16>
    28e2:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    28e4:	4645           	not.w d5
    28e6:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    28ea:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    28ee:	4fef 0020      	lea 32(sp),sp
    28f2:	0cad 0000 010d 	cmpi.l #269,-144(a5)
    28f8:	ff70 
    28fa:	66be           	bne.s 28ba <main+0x28b4>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 16);
    28fc:	4878 0010      	pea 10 <main+0xa>
    2900:	2f0b           	move.l a3,-(sp)
    2902:	2f0c           	move.l a4,-(sp)
    2904:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    290a:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2910:	4eae ff1c      	jsr -228(a6)
    2914:	4fef 000c      	lea 12(sp),sp
    2918:	307c 0001      	movea.w #1,a0
    291c:	2b48 ff70      	move.l a0,-144(a5)
  valactual = destination+2; 
  valsupposed = destlinezoom17;

  mask = 0xffff;
    2920:	7cff           	moveq #-1,d6
    2922:	2c6d ff7c      	movea.l -132(a5),a6

  for(int i2=0;i2<5;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    2926:	7400           	moveq #0,d2
    2928:	3406           	move.w d6,d2
    292a:	206d ff70      	movea.l -144(a5),a0
    292e:	4868 ffff      	pea -1(a0)
    2932:	2f02           	move.l d2,-(sp)
    2934:	2f0e           	move.l a6,-(sp)
    2936:	4879 0000 722c 	pea 722c <destlinezoom17>
    293c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    293e:	2f2d ff70      	move.l -144(a5),-(sp)
    2942:	2f02           	move.l d2,-(sp)
    2944:	486e 0030      	pea 48(a6)
    2948:	4879 0000 722c 	pea 722c <destlinezoom17>
    294e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2950:	4646           	not.w d6
    2952:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2956:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<5;i2++) {
    295a:	4fef 0020      	lea 32(sp),sp
    295e:	700b           	moveq #11,d0
    2960:	b0ad ff70      	cmp.l -144(a5),d0
    2964:	66c0           	bne.s 2926 <main+0x2920>
    2966:	280b           	move.l a3,d4
    2968:	0684 0000 01e4 	addi.l #484,d4
    296e:	307c 000a      	movea.w #10,a0
    2972:	2b48 ff70      	move.l a0,-144(a5)
    2976:	2a0b           	move.l a3,d5
    2978:	2644           	movea.l d4,a3
    297a:	280c           	move.l a4,d4
  }

  for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 10+i*35);
    297c:	2f2d ff70      	move.l -144(a5),-(sp)
    2980:	3f06           	move.w d6,-(sp)
    2982:	4267           	clr.w -(sp)
    2984:	2f0b           	move.l a3,-(sp)
    2986:	4879 0000 722c 	pea 722c <destlinezoom17>
    298c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    298e:	4deb 0030      	lea 48(a3),a6
      mask = mask ^ 0xffff;
    2992:	3e06           	move.w d6,d7
    2994:	4647           	not.w d7
    
    for(int i2=0;i2<17;i2++) {
    2996:	286d ff70      	movea.l -144(a5),a4
    299a:	528c           	addq.l #1,a4
    299c:	4fef 0010      	lea 16(sp),sp
    29a0:	47eb 0690      	lea 1680(a3),a3
    29a4:	260b           	move.l a3,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    29a6:	7400           	moveq #0,d2
    29a8:	3407           	move.w d7,d2
    29aa:	2f0c           	move.l a4,-(sp)
    29ac:	2f02           	move.l d2,-(sp)
    29ae:	2f0e           	move.l a6,-(sp)
    29b0:	4879 0000 722c 	pea 722c <destlinezoom17>
    29b6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    29b8:	486c 0001      	pea 1(a4)
    29bc:	2f02           	move.l d2,-(sp)
    29be:	486e 0030      	pea 48(a6)
    29c2:	4879 0000 722c 	pea 722c <destlinezoom17>
    29c8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    29ca:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    29ce:	4647           	not.w d7
    29d0:	3c07           	move.w d7,d6
    29d2:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    29d4:	4fef 0020      	lea 32(sp),sp
    29d8:	b68e           	cmp.l a6,d3
    29da:	66ca           	bne.s 29a6 <main+0x29a0>
    29dc:	7023           	moveq #35,d0
    29de:	d1ad ff70      	add.l d0,-144(a5)
  for(int i=0;i<7;i++) {
    29e2:	0cad 0000 00ff 	cmpi.l #255,-144(a5)
    29e8:	ff70 
    29ea:	6690           	bne.s 297c <main+0x2976>
    29ec:	2844           	movea.l d4,a4
    29ee:	2645           	movea.l d5,a3
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    29f0:	2f2d ff70      	move.l -144(a5),-(sp)
    29f4:	3f07           	move.w d7,-(sp)
    29f6:	4267           	clr.w -(sp)
    29f8:	486b 2fd4      	pea 12244(a3)
    29fc:	4879 0000 722c 	pea 722c <destlinezoom17>
    2a02:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2a04:	4deb 3004      	lea 12292(a3),a6
    2a08:	4fef 0010      	lea 16(sp),sp
    2a0c:	2b7c 0000 0100 	move.l #256,-144(a5)
    2a12:	ff70 
  mask = mask ^ 0xffff;

  for(int i2=0;i2<7;i2++) {
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2a14:	2f2d ff70      	move.l -144(a5),-(sp)
    2a18:	2f02           	move.l d2,-(sp)
    2a1a:	2f0e           	move.l a6,-(sp)
    2a1c:	4879 0000 722c 	pea 722c <destlinezoom17>
    2a22:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2a24:	206d ff70      	movea.l -144(a5),a0
    2a28:	4868 0001      	pea 1(a0)
    2a2c:	2f02           	move.l d2,-(sp)
    2a2e:	486e 0030      	pea 48(a6)
    2a32:	4879 0000 722c 	pea 722c <destlinezoom17>
    2a38:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2a3a:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2a3e:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    2a42:	4fef 0020      	lea 32(sp),sp
    2a46:	0cad 0000 010e 	cmpi.l #270,-144(a5)
    2a4c:	ff70 
    2a4e:	6742           	beq.s 2a92 <main+0x2a8c>
    2a50:	7400           	moveq #0,d2
    2a52:	3407           	move.w d7,d2
    2a54:	4647           	not.w d7
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2a56:	2f2d ff70      	move.l -144(a5),-(sp)
    2a5a:	2f02           	move.l d2,-(sp)
    2a5c:	2f0e           	move.l a6,-(sp)
    2a5e:	4879 0000 722c 	pea 722c <destlinezoom17>
    2a64:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2a66:	206d ff70      	movea.l -144(a5),a0
    2a6a:	4868 0001      	pea 1(a0)
    2a6e:	2f02           	move.l d2,-(sp)
    2a70:	486e 0030      	pea 48(a6)
    2a74:	4879 0000 722c 	pea 722c <destlinezoom17>
    2a7a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2a7c:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2a80:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    2a84:	4fef 0020      	lea 32(sp),sp
    2a88:	0cad 0000 010e 	cmpi.l #270,-144(a5)
    2a8e:	ff70 
    2a90:	66be           	bne.s 2a50 <main+0x2a4a>
  tmp = source;
  source = destination;
  destination = tmp;

  UWORD *bp = (UWORD *)0x200;
  *bp = 0;
    2a92:	4278 0200      	clr.w 200 <main+0x1fa>
  Zoom_ZoomIntoPicture( source, destination, 17);
    2a96:	4878 0011      	pea 11 <main+0xb>
    2a9a:	2f0c           	move.l a4,-(sp)
    2a9c:	2f0b           	move.l a3,-(sp)
    2a9e:	4eb9 0000 35f6 	jsr 35f6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2aa4:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2aaa:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom18;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);
    2aae:	42a7           	clr.l -(sp)
    2ab0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2ab6:	2f2d ff6c      	move.l -148(a5),-(sp)
    2aba:	4879 0000 7200 	pea 7200 <destlinezoom18>
    2ac0:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i2=0;i2<5;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2ac2:	4878 0001      	pea 1 <_start+0x1>
    2ac6:	42a7           	clr.l -(sp)
    2ac8:	2f2d ff80      	move.l -128(a5),-(sp)
    2acc:	4879 0000 7200 	pea 7200 <destlinezoom18>
    2ad2:	4e92           	jsr (a2)
    2ad4:	4fef 002c      	lea 44(sp),sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    2ad8:	4eb9 0000 3e5a 	jsr 3e5a <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2ade:	4878 0010      	pea 10 <main+0xa>
    2ae2:	4879 0000 7580 	pea 7580 <ClsSprites>
    2ae8:	42a7           	clr.l -(sp)
    2aea:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
    2af0:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
    2af6:	4fef 0010      	lea 16(sp),sp
    2afa:	4a80           	tst.l d0
    2afc:	661e           	bne.s 2b1c <main+0x2b16>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2afe:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2b04:	4eae ffc4      	jsr -60(a6)
    2b08:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2b0e:	2200           	move.l d0,d1
    2b10:	243c 0000 4ec8 	move.l #20168,d2
    2b16:	762c           	moveq #44,d3
    2b18:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2b1c:	4878 000c      	pea c <main+0x6>
    2b20:	4879 0000 7550 	pea 7550 <ClScreen>
    2b26:	4878 0010      	pea 10 <main+0xa>
    2b2a:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
    2b30:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
    2b36:	4fef 0010      	lea 16(sp),sp
    2b3a:	4a80           	tst.l d0
    2b3c:	661e           	bne.s 2b5c <main+0x2b56>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    2b3e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2b44:	4eae ffc4      	jsr -60(a6)
    2b48:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2b4e:	2200           	move.l d0,d1
    2b50:	243c 0000 4efe 	move.l #20222,d2
    2b56:	7636           	moveq #54,d3
    2b58:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2b5c:	4878 0002      	pea 2 <_start+0x2>
    2b60:	4879 0000 7548 	pea 7548 <ClColor>
    2b66:	4878 001e      	pea 1e <main+0x18>
    2b6a:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
    2b70:	4eb9 0000 31ac 	jsr 31ac <TestCopperlistBatch>
    2b76:	4fef 0010      	lea 16(sp),sp
    2b7a:	4a80           	tst.l d0
    2b7c:	661e           	bne.s 2b9c <main+0x2b96>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2b7e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2b84:	4eae ffc4      	jsr -60(a6)
    2b88:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2b8e:	2200           	move.l d0,d1
    2b90:	243c 0000 4cab 	move.l #19627,d2
    2b96:	7621           	moveq #33,d3
    2b98:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b9c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc5a6>
    2ba0:	4878 0020      	pea 20 <main+0x1a>
    2ba4:	2f39 0000 763e 	move.l 763e <Copperlist1>,-(sp)
    2baa:	4eb9 0000 318e 	jsr 318e <TestCopperlistPos>
    2bb0:	4fef 000c      	lea 12(sp),sp
    2bb4:	4a80           	tst.l d0
    2bb6:	661e           	bne.s 2bd6 <main+0x2bd0>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    2bb8:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2bbe:	4eae ffc4      	jsr -60(a6)
    2bc2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2bc8:	2200           	move.l d0,d1
    2bca:	243c 0000 4ccd 	move.l #19661,d2
    2bd0:	7622           	moveq #34,d3
    2bd2:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    2bd6:	2479 0000 7632 	movea.l 7632 <DrawBuffer>,a2
    2bdc:	4879 0000 517b 	pea 517b <incbin_swfont_end+0x6e5>
    2be2:	2f0a           	move.l a2,-(sp)
    2be4:	4eb9 0000 2f20 	jsr 2f20 <WriteFont.constprop.3>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    2bea:	508f           	addq.l #8,sp
    2bec:	0c52 ff00      	cmpi.w #-256,(a2)
    2bf0:	671e           	beq.s 2c10 <main+0x2c0a>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    2bf2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2bf8:	4eae ffc4      	jsr -60(a6)
    2bfc:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2c02:	2200           	move.l d0,d1
    2c04:	243c 0000 518c 	move.l #20876,d2
    2c0a:	7631           	moveq #49,d3
    2c0c:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    2c10:	2f3c 0000 c800 	move.l #51200,-(sp)
    2c16:	4878 0084      	pea 84 <main+0x7e>
    2c1a:	4eb9 0000 3f98 	jsr 3f98 <FreeDisplay>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    2c20:	247c 00f0 ff60 	movea.l #15794016,a2
    2c26:	508f           	addq.l #8,sp
    2c28:	4a92           	tst.l (a2)
    2c2a:	6718           	beq.s 2c44 <main+0x2c3e>
    2c2c:	4878 0001      	pea 1 <_start+0x1>
    2c30:	47f9 0000 2f6e 	lea 2f6e <warpmode.part.0>,a3
    2c36:	4e93           	jsr (a3)
    2c38:	588f           	addq.l #4,sp
    2c3a:	4a92           	tst.l (a2)
    2c3c:	6706           	beq.s 2c44 <main+0x2c3e>
    2c3e:	42a7           	clr.l -(sp)
    2c40:	4e93           	jsr (a3)
    2c42:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    2c44:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2c4a:	23ee 0022 0000 	move.l 34(a6),7604 <ActiView>
    2c50:	7604 
	OwnBlitter();
    2c52:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    2c56:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2c5c:	4eae ff1c      	jsr -228(a6)
	Disable();
    2c60:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2c66:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    2c6a:	2679 0000 761a 	movea.l 761a <hw>,a3
    2c70:	302b 0010      	move.w 16(a3),d0
    2c74:	33c0 0000 7608 	move.w d0,7608 <SystemADKCON>
	SystemInts=hw->intenar;
    2c7a:	302b 001c      	move.w 28(a3),d0
    2c7e:	33c0 0000 760c 	move.w d0,760c <SystemInts>
	SystemDMA=hw->dmaconr;
    2c84:	302b 0002      	move.w 2(a3),d0
    2c88:	33c0 0000 760a 	move.w d0,760a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    2c8e:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2c94:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    2c9a:	45f9 0000 400a 	lea 400a <WaitVbl>,a2
    2ca0:	4e92           	jsr (a2)
	WaitVbl();
    2ca2:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2ca4:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    2caa:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2cb0:	93c9           	suba.l a1,a1
    2cb2:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2cb6:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2cbc:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2cc0:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2cc6:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    2cca:	4e92           	jsr (a2)
	WaitVbl();
    2ccc:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    2cce:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    2cd4:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    2cda:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    2ce0:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2ce6:	082e 0000 0129 	btst #0,297(a6)
    2cec:	6700 01e4      	beq.w 2ed2 <main+0x2ecc>
		vbr = (APTR)Supervisor((void*)getvbr);
    2cf0:	7ec0           	moveq #-64,d7
    2cf2:	de8d           	add.l a5,d7
    2cf4:	cf8d           	exg d7,a5
    2cf6:	4eae ffe2      	jsr -30(a6)
    2cfa:	cf8d           	exg d7,a5

	VBR=GetVBR();
    2cfc:	23c0 0000 760e 	move.l d0,760e <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2d02:	2079 0000 760e 	movea.l 760e <VBR.lto_priv.4>,a0
    2d08:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    2d0c:	23c2 0000 7612 	move.l d2,7612 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    2d12:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    2d14:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    2d16:	2079 0000 761a 	movea.l 761a <hw>,a0
    2d1c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    2d20:	3028 0002      	move.w 2(a0),d0
    2d24:	0800 000e      	btst #14,d0
    2d28:	66f6           	bne.s 2d20 <main+0x2d1a>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    2d2a:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2d30:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2d36:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    2d3c:	2279 0000 760e 	movea.l 760e <VBR.lto_priv.4>,a1
    2d42:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    2d46:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2d4c:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    2d52:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    2d58:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    2d5e:	3039 0000 760c 	move.w 760c <SystemInts>,d0
    2d64:	0040 8000      	ori.w #-32768,d0
    2d68:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    2d6c:	3039 0000 760a 	move.w 760a <SystemDMA>,d0
    2d72:	0040 8000      	ori.w #-32768,d0
    2d76:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    2d7a:	3039 0000 7608 	move.w 7608 <SystemADKCON>,d0
    2d80:	0040 8000      	ori.w #-32768,d0
    2d84:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    2d88:	2279 0000 7604 	movea.l 7604 <ActiView>,a1
    2d8e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2d92:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2d98:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2d9c:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2da2:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    2da6:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2dac:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    2db0:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    2db6:	4eae fe32      	jsr -462(a6)
	Enable();
    2dba:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2dc0:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    2dc4:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2dca:	2279 0000 7642 	movea.l 7642 <DOSBase>,a1
    2dd0:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    2dd4:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2dda:	2279 0000 761e 	movea.l 761e <GfxBase>,a1
    2de0:	4eae fe62      	jsr -414(a6)
}
    2de4:	7000           	moveq #0,d0
    2de6:	4ced 5cfc ff40 	movem.l -192(a5),d2-d7/a2-a4/a6
    2dec:	4e5d           	unlk a5
    2dee:	4e75           	rts
    2df0:	0cb9 0004 0000 	cmpi.l #262144,7626 <ViewBuffer>
    2df6:	0000 7626 
    2dfa:	6700 d4ae      	beq.w 2aa <main+0x2a4>
    Write( Output(), 
    2dfe:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e04:	4eae ffc4      	jsr -60(a6)
    2e08:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e0e:	2200           	move.l d0,d1
    2e10:	243c 0000 4bf5 	move.l #19445,d2
    2e16:	763b           	moveq #59,d3
    2e18:	4eae ffd0      	jsr -48(a6)
    2e1c:	6000 d48c      	bra.w 2aa <main+0x2a4>
		Exit(0);
    2e20:	9dce           	suba.l a6,a6
    2e22:	7200           	moveq #0,d1
    2e24:	4eae ff70      	jsr -144(a6)
    2e28:	6000 d22a      	bra.w 54 <main+0x4e>
		Exit(0);
    2e2c:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e32:	7200           	moveq #0,d1
    2e34:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    2e38:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2e3e:	43f9 0000 4bba 	lea 4bba <incbin_swfont_end+0x124>,a1
    2e44:	7000           	moveq #0,d0
    2e46:	4eae fdd8      	jsr -552(a6)
    2e4a:	23c0 0000 7642 	move.l d0,7642 <DOSBase>
	if (!DOSBase)
    2e50:	6600 d202      	bne.w 54 <main+0x4e>
    2e54:	60ca           	bra.s 2e20 <main+0x2e1a>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    2e56:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e5c:	4eae ffc4      	jsr -60(a6)
    2e60:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e66:	2200           	move.l d0,d1
    2e68:	243c 0000 508b 	move.l #20619,d2
    2e6e:	7635           	moveq #53,d3
    2e70:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2e74:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    2e7a:	203c 0000 3740 	move.l #14144,d0
    2e80:	7202           	moveq #2,d1
    2e82:	4eae ff3a      	jsr -198(a6)
    2e86:	2840           	movea.l d0,a4
  if( source == 0) {
    2e88:	4a80           	tst.l d0
    2e8a:	6600 dd42      	bne.w bce <main+0xbc8>
    Write(  Output(), 
    2e8e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e94:	4eae ffc4      	jsr -60(a6)
    2e98:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2e9e:	2200           	move.l d0,d1
    2ea0:	243c 0000 5102 	move.l #20738,d2
    2ea6:	7639           	moveq #57,d3
    2ea8:	4eae ffd0      	jsr -48(a6)
    return;
    2eac:	6000 fc2a      	bra.w 2ad8 <main+0x2ad2>
    Write(  Output(), 
    2eb0:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2eb6:	4eae ffc4      	jsr -60(a6)
    2eba:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2ec0:	2200           	move.l d0,d1
    2ec2:	243c 0000 4ffe 	move.l #20478,d2
    2ec8:	7636           	moveq #54,d3
    2eca:	4eae ffd0      	jsr -48(a6)
    return;
    2ece:	6000 da94      	bra.w 964 <main+0x95e>
	APTR vbr = 0;
    2ed2:	7000           	moveq #0,d0
	VBR=GetVBR();
    2ed4:	23c0 0000 760e 	move.l d0,760e <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2eda:	2079 0000 760e 	movea.l 760e <VBR.lto_priv.4>,a0
    2ee0:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    2ee4:	23c2 0000 7612 	move.l d2,7612 <SystemIrq>
	WaitVbl();
    2eea:	4e92           	jsr (a2)
	WaitVbl();
    2eec:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    2eee:	2079 0000 761a 	movea.l 761a <hw>,a0
    2ef4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    2ef8:	6000 fe26      	bra.w 2d20 <main+0x2d1a>
    Write(  Output(), 
    2efc:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2f02:	4eae ffc4      	jsr -60(a6)
    2f06:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    2f0c:	2200           	move.l d0,d1
    2f0e:	243c 0000 513c 	move.l #20796,d2
    2f14:	763d           	moveq #61,d3
    2f16:	4eae ffd0      	jsr -48(a6)
    return;
    2f1a:	6000 fbbc      	bra.w 2ad8 <main+0x2ad2>
    2f1e:	4e71           	nop

00002f20 <WriteFont.constprop.3>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    2f20:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    2f24:	206f 0008      	movea.l 8(sp),a0
    2f28:	1010           	move.b (a0),d0
    2f2a:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    2f2e:	4880           	ext.w d0
    2f30:	48c0           	ext.l d0
    2f32:	e788           	lsl.l #3,d0
  fntptr += charpos;
    2f34:	4880           	ext.w d0
    2f36:	3040           	movea.w d0,a0
    2f38:	d1c8           	adda.l a0,a0
    2f3a:	d1fc 0000 75c0 	adda.l #30144,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    2f40:	3290           	move.w (a0),(a1)
    2f42:	3368 0002 0050 	move.w 2(a0),80(a1)
    2f48:	3368 0004 00a0 	move.w 4(a0),160(a1)
    2f4e:	3368 0006 00f0 	move.w 6(a0),240(a1)
    2f54:	3368 0008 0140 	move.w 8(a0),320(a1)
    2f5a:	3368 000a 0190 	move.w 10(a0),400(a1)
    2f60:	3368 000c 01e0 	move.w 12(a0),480(a1)
    2f66:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    2f6c:	4e75           	rts

00002f6e <warpmode.part.0>:
void warpmode(int on) 
    2f6e:	598f           	subq.l #4,sp
    2f70:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    2f72:	4aaf 000c      	tst.l 12(sp)
    2f76:	674c           	beq.s 2fc4 <warpmode.part.0+0x56>
    2f78:	4878 0001      	pea 1 <_start+0x1>
    2f7c:	740b           	moveq #11,d2
    2f7e:	d48f           	add.l sp,d2
    2f80:	2f02           	move.l d2,-(sp)
    2f82:	42a7           	clr.l -(sp)
    2f84:	4879 0000 4aca 	pea 4aca <incbin_swfont_end+0x34>
    2f8a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc5a7>
    2f8e:	4878 0052      	pea 52 <main+0x4c>
    2f92:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec508>
    2f98:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    2f9c:	203c 0000 4ab0 	move.l #19120,d0
    2fa2:	4878 0001      	pea 1 <_start+0x1>
    2fa6:	2f02           	move.l d2,-(sp)
    2fa8:	42a7           	clr.l -(sp)
    2faa:	2f00           	move.l d0,-(sp)
    2fac:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc5a7>
    2fb0:	4878 0052      	pea 52 <main+0x4c>
    2fb4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec508>
	}
}
    2fba:	4fef 0018      	lea 24(sp),sp
    2fbe:	241f           	move.l (sp)+,d2
    2fc0:	588f           	addq.l #4,sp
    2fc2:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    2fc4:	4878 0001      	pea 1 <_start+0x1>
    2fc8:	740b           	moveq #11,d2
    2fca:	d48f           	add.l sp,d2
    2fcc:	2f02           	move.l d2,-(sp)
    2fce:	42a7           	clr.l -(sp)
    2fd0:	4879 0000 4ad4 	pea 4ad4 <incbin_swfont_end+0x3e>
    2fd6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc5a7>
    2fda:	4878 0052      	pea 52 <main+0x4c>
    2fde:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec508>
    2fe4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    2fe8:	203c 0000 4a97 	move.l #19095,d0
    2fee:	4878 0001      	pea 1 <_start+0x1>
    2ff2:	2f02           	move.l d2,-(sp)
    2ff4:	42a7           	clr.l -(sp)
    2ff6:	2f00           	move.l d0,-(sp)
    2ff8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc5a7>
    2ffc:	4878 0052      	pea 52 <main+0x4c>
    3000:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec508>
}
    3006:	4fef 0018      	lea 24(sp),sp
    300a:	241f           	move.l (sp)+,d2
    300c:	588f           	addq.l #4,sp
    300e:	4e75           	rts

00003010 <KPrintF>:
{
    3010:	4fef ff80      	lea -128(sp),sp
    3014:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    3018:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec508>
    301e:	6734           	beq.s 3054 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    3020:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3026:	206f 0090      	movea.l 144(sp),a0
    302a:	43ef 0094      	lea 148(sp),a1
    302e:	45f9 0000 42d0 	lea 42d0 <PutChar>,a2
    3034:	47ef 000c      	lea 12(sp),a3
    3038:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    303c:	2f0b           	move.l a3,-(sp)
    303e:	4878 0056      	pea 56 <main+0x50>
    3042:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec508>
    3048:	508f           	addq.l #8,sp
}
    304a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    304e:	4fef 0080      	lea 128(sp),sp
    3052:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    3054:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    305a:	206f 0090      	movea.l 144(sp),a0
    305e:	43ef 0094      	lea 148(sp),a1
    3062:	45f9 0000 42c2 	lea 42c2 <KPutCharX>,a2
    3068:	97cb           	suba.l a3,a3
    306a:	4eae fdf6      	jsr -522(a6)
}
    306e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    3072:	4fef 0080      	lea 128(sp),sp
    3076:	4e75           	rts

00003078 <TestRow>:
    mask = mask ^ 0xffff;
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    3078:	4fef ff94      	lea -108(sp),sp
    307c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    3080:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
    3086:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
    308a:	7a34           	moveq #52,d5
    308c:	da8f           	add.l sp,d5
    308e:	4878 0064      	pea 64 <main+0x5e>
    3092:	42a7           	clr.l -(sp)
    3094:	2f05           	move.l d5,-(sp)
    3096:	4eba 104a      	jsr 40e2 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    309a:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
    30a0:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    30a4:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
    30a8:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
    30ac:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    30ae:	2e3c 0000 4adf 	move.l #19167,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    30b4:	301c           	move.w (a4)+,d0
    30b6:	bd40           	eor.w d6,d0
    30b8:	b05d           	cmp.w (a5)+,d0
    30ba:	6736           	beq.s 30f2 <TestRow+0x7a>
      data[0] = i;
    30bc:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    30c0:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    30c6:	2047           	movea.l d7,a0
    30c8:	43ef 0030      	lea 48(sp),a1
    30cc:	45f9 0000 42d0 	lea 42d0 <PutChar>,a2
    30d2:	2645           	movea.l d5,a3
    30d4:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    30d8:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    30de:	4eae ffc4      	jsr -60(a6)
    30e2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    30e8:	2200           	move.l d0,d1
    30ea:	2405           	move.l d5,d2
    30ec:	7664           	moveq #100,d3
    30ee:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    30f2:	5284           	addq.l #1,d4
    30f4:	7015           	moveq #21,d0
    30f6:	b084           	cmp.l d4,d0
    30f8:	66ba           	bne.s 30b4 <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    30fa:	206f 00a0      	movea.l 160(sp),a0
    30fe:	3028 002a      	move.w 42(a0),d0
    3102:	322f 002e      	move.w 46(sp),d1
    3106:	b340           	eor.w d1,d0
    3108:	206f 009c      	movea.l 156(sp),a0
    310c:	3228 002a      	move.w 42(a0),d1
    3110:	b340           	eor.w d1,d0
    3112:	0240 ff00      	andi.w #-256,d0
    3116:	660a           	bne.s 3122 <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    3118:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    311c:	4fef 006c      	lea 108(sp),sp
    3120:	4e75           	rts
    data[0] = 21;
    3122:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    3128:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    312e:	41f9 0000 4adf 	lea 4adf <incbin_swfont_end+0x49>,a0
    3134:	43ef 0030      	lea 48(sp),a1
    3138:	45f9 0000 42d0 	lea 42d0 <PutChar>,a2
    313e:	47ef 0034      	lea 52(sp),a3
    3142:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    3146:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    314c:	4eae ffc4      	jsr -60(a6)
    3150:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3156:	2200           	move.l d0,d1
    3158:	240b           	move.l a3,d2
    315a:	7664           	moveq #100,d3
    315c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    3160:	206f 00a0      	movea.l 160(sp),a0
    3164:	7000           	moveq #0,d0
    3166:	3028 002a      	move.w 42(a0),d0
    316a:	2f00           	move.l d0,-(sp)
    316c:	206f 00a0      	movea.l 160(sp),a0
    3170:	3028 002a      	move.w 42(a0),d0
    3174:	2f00           	move.l d0,-(sp)
    3176:	4879 0000 4b0f 	pea 4b0f <incbin_swfont_end+0x79>
    317c:	4eba fe92      	jsr 3010 <KPrintF>(pc)
    3180:	4fef 000c      	lea 12(sp),sp
}
    3184:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3188:	4fef 006c      	lea 108(sp),sp
    318c:	4e75           	rts

0000318e <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    318e:	202f 0008      	move.l 8(sp),d0
    3192:	d080           	add.l d0,d0
    3194:	d080           	add.l d0,d0
    3196:	206f 0004      	movea.l 4(sp),a0
    319a:	2030 0800      	move.l (0,a0,d0.l),d0
    319e:	b0af 000c      	cmp.l 12(sp),d0
    31a2:	57c0           	seq d0
    31a4:	4880           	ext.w d0
    31a6:	48c0           	ext.l d0
}
    31a8:	4480           	neg.l d0
    31aa:	4e75           	rts

000031ac <TestCopperlistBatch>:
                                                                  long length) {
    31ac:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    31b0:	246f 0010      	movea.l 16(sp),a2
    31b4:	206f 0014      	movea.l 20(sp),a0
    31b8:	226f 0018      	movea.l 24(sp),a1
    31bc:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    31c0:	2008           	move.l a0,d0
    31c2:	d088           	add.l a0,d0
    31c4:	d080           	add.l d0,d0
    31c6:	2411           	move.l (a1),d2
    31c8:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    31cc:	6600 01ac      	bne.w 337a <TestCopperlistBatch+0x1ce>
    31d0:	2008           	move.l a0,d0
    31d2:	5280           	addq.l #1,d0
    31d4:	d080           	add.l d0,d0
    31d6:	d080           	add.l d0,d0
    31d8:	2032 0800      	move.l (0,a2,d0.l),d0
    31dc:	b0a9 0004      	cmp.l 4(a1),d0
    31e0:	6600 0198      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    31e4:	7002           	moveq #2,d0
    31e6:	b081           	cmp.l d1,d0
    31e8:	6700 0188      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    31ec:	2008           	move.l a0,d0
    31ee:	5480           	addq.l #2,d0
    31f0:	d080           	add.l d0,d0
    31f2:	d080           	add.l d0,d0
    31f4:	2032 0800      	move.l (0,a2,d0.l),d0
    31f8:	b0a9 0008      	cmp.l 8(a1),d0
    31fc:	6600 017c      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3200:	7403           	moveq #3,d2
    3202:	b481           	cmp.l d1,d2
    3204:	6700 016c      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3208:	2008           	move.l a0,d0
    320a:	5680           	addq.l #3,d0
    320c:	d080           	add.l d0,d0
    320e:	d080           	add.l d0,d0
    3210:	2032 0800      	move.l (0,a2,d0.l),d0
    3214:	b0a9 000c      	cmp.l 12(a1),d0
    3218:	6600 0160      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    321c:	7004           	moveq #4,d0
    321e:	b081           	cmp.l d1,d0
    3220:	6700 0150      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3224:	2008           	move.l a0,d0
    3226:	5880           	addq.l #4,d0
    3228:	d080           	add.l d0,d0
    322a:	d080           	add.l d0,d0
    322c:	2032 0800      	move.l (0,a2,d0.l),d0
    3230:	b0a9 0010      	cmp.l 16(a1),d0
    3234:	6600 0144      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3238:	7405           	moveq #5,d2
    323a:	b481           	cmp.l d1,d2
    323c:	6700 0134      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3240:	2008           	move.l a0,d0
    3242:	5a80           	addq.l #5,d0
    3244:	d080           	add.l d0,d0
    3246:	d080           	add.l d0,d0
    3248:	2032 0800      	move.l (0,a2,d0.l),d0
    324c:	b0a9 0014      	cmp.l 20(a1),d0
    3250:	6600 0128      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3254:	7006           	moveq #6,d0
    3256:	b081           	cmp.l d1,d0
    3258:	6700 0118      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    325c:	2008           	move.l a0,d0
    325e:	5c80           	addq.l #6,d0
    3260:	d080           	add.l d0,d0
    3262:	d080           	add.l d0,d0
    3264:	2032 0800      	move.l (0,a2,d0.l),d0
    3268:	b0a9 0018      	cmp.l 24(a1),d0
    326c:	6600 010c      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3270:	7407           	moveq #7,d2
    3272:	b481           	cmp.l d1,d2
    3274:	6700 00fc      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3278:	2008           	move.l a0,d0
    327a:	5e80           	addq.l #7,d0
    327c:	d080           	add.l d0,d0
    327e:	d080           	add.l d0,d0
    3280:	2032 0800      	move.l (0,a2,d0.l),d0
    3284:	b0a9 001c      	cmp.l 28(a1),d0
    3288:	6600 00f0      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    328c:	7008           	moveq #8,d0
    328e:	b081           	cmp.l d1,d0
    3290:	6700 00e0      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3294:	2008           	move.l a0,d0
    3296:	5080           	addq.l #8,d0
    3298:	d080           	add.l d0,d0
    329a:	d080           	add.l d0,d0
    329c:	2032 0800      	move.l (0,a2,d0.l),d0
    32a0:	b0a9 0020      	cmp.l 32(a1),d0
    32a4:	6600 00d4      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    32a8:	7409           	moveq #9,d2
    32aa:	b481           	cmp.l d1,d2
    32ac:	6700 00c4      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32b0:	47e8 0009      	lea 9(a0),a3
    32b4:	200b           	move.l a3,d0
    32b6:	d08b           	add.l a3,d0
    32b8:	d080           	add.l d0,d0
    32ba:	2032 0800      	move.l (0,a2,d0.l),d0
    32be:	b0a9 0024      	cmp.l 36(a1),d0
    32c2:	6600 00b6      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    32c6:	700a           	moveq #10,d0
    32c8:	b081           	cmp.l d1,d0
    32ca:	6700 00a6      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32ce:	47e8 000a      	lea 10(a0),a3
    32d2:	200b           	move.l a3,d0
    32d4:	d08b           	add.l a3,d0
    32d6:	d080           	add.l d0,d0
    32d8:	2032 0800      	move.l (0,a2,d0.l),d0
    32dc:	b0a9 0028      	cmp.l 40(a1),d0
    32e0:	6600 0098      	bne.w 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    32e4:	740b           	moveq #11,d2
    32e6:	b481           	cmp.l d1,d2
    32e8:	6700 0088      	beq.w 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32ec:	47e8 000b      	lea 11(a0),a3
    32f0:	200b           	move.l a3,d0
    32f2:	d08b           	add.l a3,d0
    32f4:	d080           	add.l d0,d0
    32f6:	2032 0800      	move.l (0,a2,d0.l),d0
    32fa:	b0a9 002c      	cmp.l 44(a1),d0
    32fe:	667a           	bne.s 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3300:	700c           	moveq #12,d0
    3302:	b081           	cmp.l d1,d0
    3304:	676c           	beq.s 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3306:	47e8 000c      	lea 12(a0),a3
    330a:	200b           	move.l a3,d0
    330c:	d08b           	add.l a3,d0
    330e:	d080           	add.l d0,d0
    3310:	2032 0800      	move.l (0,a2,d0.l),d0
    3314:	b0a9 0030      	cmp.l 48(a1),d0
    3318:	6660           	bne.s 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    331a:	740d           	moveq #13,d2
    331c:	b481           	cmp.l d1,d2
    331e:	6752           	beq.s 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3320:	47e8 000d      	lea 13(a0),a3
    3324:	200b           	move.l a3,d0
    3326:	d08b           	add.l a3,d0
    3328:	d080           	add.l d0,d0
    332a:	2032 0800      	move.l (0,a2,d0.l),d0
    332e:	b0a9 0034      	cmp.l 52(a1),d0
    3332:	6646           	bne.s 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3334:	700e           	moveq #14,d0
    3336:	b081           	cmp.l d1,d0
    3338:	6738           	beq.s 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    333a:	47e8 000e      	lea 14(a0),a3
    333e:	200b           	move.l a3,d0
    3340:	d08b           	add.l a3,d0
    3342:	d080           	add.l d0,d0
    3344:	2032 0800      	move.l (0,a2,d0.l),d0
    3348:	b0a9 0038      	cmp.l 56(a1),d0
    334c:	662c           	bne.s 337a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    334e:	7410           	moveq #16,d2
    3350:	b481           	cmp.l d1,d2
    3352:	661e           	bne.s 3372 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3354:	41e8 000f      	lea 15(a0),a0
    3358:	d1c8           	adda.l a0,a0
    335a:	d1c8           	adda.l a0,a0
    335c:	2070 a800      	movea.l (0,a0,a2.l),a0
    3360:	b1e9 003c      	cmpa.l 60(a1),a0
    3364:	57c0           	seq d0
    3366:	4880           	ext.w d0
    3368:	48c0           	ext.l d0
    336a:	4480           	neg.l d0
}
    336c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3370:	4e75           	rts
  return 1;
    3372:	7001           	moveq #1,d0
}
    3374:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3378:	4e75           	rts
      return 0;
    337a:	7000           	moveq #0,d0
}
    337c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3380:	4e75           	rts

00003382 <ClBuild>:
ULONG * ClbuildSW() {
    3382:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    3386:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    338c:	707b           	moveq #123,d0
    338e:	4600           	not.b d0
    3390:	7202           	moveq #2,d1
    3392:	4eae ff3a      	jsr -198(a6)
    3396:	2440           	movea.l d0,a2
  if( retval == 0) {
    3398:	4a80           	tst.l d0
    339a:	6700 010e      	beq.w 34aa <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    339e:	24b9 0000 7580 	move.l 7580 <ClsSprites>,(a2)
    33a4:	2579 0000 7584 	move.l 7584 <ClsSprites+0x4>,4(a2)
    33aa:	0004 
    33ac:	2579 0000 7588 	move.l 7588 <ClsSprites+0x8>,8(a2)
    33b2:	0008 
    33b4:	2579 0000 758c 	move.l 758c <ClsSprites+0xc>,12(a2)
    33ba:	000c 
    33bc:	2579 0000 7590 	move.l 7590 <ClsSprites+0x10>,16(a2)
    33c2:	0010 
    33c4:	2579 0000 7594 	move.l 7594 <ClsSprites+0x14>,20(a2)
    33ca:	0014 
    33cc:	2579 0000 7598 	move.l 7598 <ClsSprites+0x18>,24(a2)
    33d2:	0018 
    33d4:	2579 0000 759c 	move.l 759c <ClsSprites+0x1c>,28(a2)
    33da:	001c 
    33dc:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x20>,32(a2)
    33e2:	0020 
    33e4:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x24>,36(a2)
    33ea:	0024 
    33ec:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x28>,40(a2)
    33f2:	0028 
    33f4:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x2c>,44(a2)
    33fa:	002c 
    33fc:	2579 0000 75b0 	move.l 75b0 <ClsSprites+0x30>,48(a2)
    3402:	0030 
    3404:	2579 0000 75b4 	move.l 75b4 <ClsSprites+0x34>,52(a2)
    340a:	0034 
    340c:	2579 0000 75b8 	move.l 75b8 <ClsSprites+0x38>,56(a2)
    3412:	0038 
    3414:	2579 0000 75bc 	move.l 75bc <ClsSprites+0x3c>,60(a2)
    341a:	003c 
    *cl++ = *clpartinstruction++;
    341c:	2579 0000 7550 	move.l 7550 <ClScreen>,64(a2)
    3422:	0040 
    3424:	2579 0000 7554 	move.l 7554 <ClScreen+0x4>,68(a2)
    342a:	0044 
    342c:	2579 0000 7558 	move.l 7558 <ClScreen+0x8>,72(a2)
    3432:	0048 
    3434:	2579 0000 755c 	move.l 755c <ClScreen+0xc>,76(a2)
    343a:	004c 
    343c:	2579 0000 7560 	move.l 7560 <ClScreen+0x10>,80(a2)
    3442:	0050 
    3444:	2579 0000 7564 	move.l 7564 <ClScreen+0x14>,84(a2)
    344a:	0054 
    344c:	2579 0000 7568 	move.l 7568 <ClScreen+0x18>,88(a2)
    3452:	0058 
    3454:	2579 0000 756c 	move.l 756c <ClScreen+0x1c>,92(a2)
    345a:	005c 
    345c:	2579 0000 7570 	move.l 7570 <ClScreen+0x20>,96(a2)
    3462:	0060 
    3464:	2579 0000 7574 	move.l 7574 <ClScreen+0x24>,100(a2)
    346a:	0064 
    346c:	2579 0000 7578 	move.l 7578 <ClScreen+0x28>,104(a2)
    3472:	0068 
    3474:	2579 0000 757c 	move.l 757c <ClScreen+0x2c>,108(a2)
    347a:	006c 
  *cl++ = 0x00e00000;
    347c:	257c 00e0 0000 	move.l #14680064,112(a2)
    3482:	0070 
  *cl++ = 0x00e20000;
    3484:	257c 00e2 0000 	move.l #14811136,116(a2)
    348a:	0074 
    *cl++ = *clpartinstruction++;
    348c:	2579 0000 7548 	move.l 7548 <ClColor>,120(a2)
    3492:	0078 
    3494:	2579 0000 754c 	move.l 754c <ClColor+0x4>,124(a2)
    349a:	007c 
  *cl = 0xfffffffe;
    349c:	70fe           	moveq #-2,d0
    349e:	2540 0080      	move.l d0,128(a2)
}
    34a2:	200a           	move.l a2,d0
    34a4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    34a8:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    34aa:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    34b0:	4eae ffc4      	jsr -60(a6)
    34b4:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    34ba:	2200           	move.l d0,d1
    34bc:	243c 0000 4b35 	move.l #19253,d2
    34c2:	7628           	moveq #40,d3
    34c4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    34c8:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    34ce:	7201           	moveq #1,d1
    34d0:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    34d4:	24b9 0000 7580 	move.l 7580 <ClsSprites>,(a2)
    34da:	2579 0000 7584 	move.l 7584 <ClsSprites+0x4>,4(a2)
    34e0:	0004 
    34e2:	2579 0000 7588 	move.l 7588 <ClsSprites+0x8>,8(a2)
    34e8:	0008 
    34ea:	2579 0000 758c 	move.l 758c <ClsSprites+0xc>,12(a2)
    34f0:	000c 
    34f2:	2579 0000 7590 	move.l 7590 <ClsSprites+0x10>,16(a2)
    34f8:	0010 
    34fa:	2579 0000 7594 	move.l 7594 <ClsSprites+0x14>,20(a2)
    3500:	0014 
    3502:	2579 0000 7598 	move.l 7598 <ClsSprites+0x18>,24(a2)
    3508:	0018 
    350a:	2579 0000 759c 	move.l 759c <ClsSprites+0x1c>,28(a2)
    3510:	001c 
    3512:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x20>,32(a2)
    3518:	0020 
    351a:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x24>,36(a2)
    3520:	0024 
    3522:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x28>,40(a2)
    3528:	0028 
    352a:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x2c>,44(a2)
    3530:	002c 
    3532:	2579 0000 75b0 	move.l 75b0 <ClsSprites+0x30>,48(a2)
    3538:	0030 
    353a:	2579 0000 75b4 	move.l 75b4 <ClsSprites+0x34>,52(a2)
    3540:	0034 
    3542:	2579 0000 75b8 	move.l 75b8 <ClsSprites+0x38>,56(a2)
    3548:	0038 
    354a:	2579 0000 75bc 	move.l 75bc <ClsSprites+0x3c>,60(a2)
    3550:	003c 
    *cl++ = *clpartinstruction++;
    3552:	2579 0000 7550 	move.l 7550 <ClScreen>,64(a2)
    3558:	0040 
    355a:	2579 0000 7554 	move.l 7554 <ClScreen+0x4>,68(a2)
    3560:	0044 
    3562:	2579 0000 7558 	move.l 7558 <ClScreen+0x8>,72(a2)
    3568:	0048 
    356a:	2579 0000 755c 	move.l 755c <ClScreen+0xc>,76(a2)
    3570:	004c 
    3572:	2579 0000 7560 	move.l 7560 <ClScreen+0x10>,80(a2)
    3578:	0050 
    357a:	2579 0000 7564 	move.l 7564 <ClScreen+0x14>,84(a2)
    3580:	0054 
    3582:	2579 0000 7568 	move.l 7568 <ClScreen+0x18>,88(a2)
    3588:	0058 
    358a:	2579 0000 756c 	move.l 756c <ClScreen+0x1c>,92(a2)
    3590:	005c 
    3592:	2579 0000 7570 	move.l 7570 <ClScreen+0x20>,96(a2)
    3598:	0060 
    359a:	2579 0000 7574 	move.l 7574 <ClScreen+0x24>,100(a2)
    35a0:	0064 
    35a2:	2579 0000 7578 	move.l 7578 <ClScreen+0x28>,104(a2)
    35a8:	0068 
    35aa:	2579 0000 757c 	move.l 757c <ClScreen+0x2c>,108(a2)
    35b0:	006c 
  *cl++ = 0x00e00000;
    35b2:	257c 00e0 0000 	move.l #14680064,112(a2)
    35b8:	0070 
  *cl++ = 0x00e20000;
    35ba:	257c 00e2 0000 	move.l #14811136,116(a2)
    35c0:	0074 
    *cl++ = *clpartinstruction++;
    35c2:	2579 0000 7548 	move.l 7548 <ClColor>,120(a2)
    35c8:	0078 
    35ca:	2579 0000 754c 	move.l 754c <ClColor+0x4>,124(a2)
    35d0:	007c 
  *cl = 0xfffffffe;
    35d2:	70fe           	moveq #-2,d0
    35d4:	2540 0080      	move.l d0,128(a2)
}
    35d8:	200a           	move.l a2,d0
    35da:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    35de:	4e75           	rts

000035e0 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    35e0:	2079 0000 761a 	movea.l 761a <hw>,a0
    35e6:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    35ea:	3028 0002      	move.w 2(a0),d0
    35ee:	0800 000e      	btst #14,d0
    35f2:	66f6           	bne.s 35ea <WaitBlt+0xa>
}
    35f4:	4e75           	rts

000035f6 <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    35f6:	4fef ffec      	lea -20(sp),sp
    35fa:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    35fe:	262f 004c      	move.l 76(sp),d3
    3602:	3403           	move.w d3,d2
  WaitBlit();
    3604:	2c79 0000 761e 	movea.l 761e <GfxBase>,a6
    360a:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
    360e:	2079 0000 761a 	movea.l 761a <hw>,a0
    3614:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    361a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    3620:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    3626:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    362c:	317c 002c 0066 	move.w #44,102(a0)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    3632:	3843           	movea.w d3,a4
    3634:	d8c3           	adda.w d3,a4
    3636:	320c           	move.w a4,d1
    3638:	d24c           	add.w a4,d1
    363a:	d243           	add.w d3,d1
    363c:	3001           	move.w d1,d0
    363e:	d041           	add.w d1,d0
    3640:	0640 014c      	addi.w #332,d0
    3644:	3f40 0036      	move.w d0,54(sp)
  WORD shiftright = 9;
    3648:	7809           	moveq #9,d4
  while( nextzoom > 22 * 16) {
    364a:	0c40 0160      	cmpi.w #352,d0
    364e:	6312           	bls.s 3662 <Zoom_ZoomIntoPicture+0x6c>
    nextzoom -= (19 + zoomnr);
    3650:	0640 ffed      	addi.w #-19,d0
    3654:	9042           	sub.w d2,d0
    shiftright--;
    3656:	5344           	subq.w #1,d4
  while( nextzoom > 22 * 16) {
    3658:	0c40 0160      	cmpi.w #352,d0
    365c:	62f2           	bhi.s 3650 <Zoom_ZoomIntoPicture+0x5a>
    365e:	3f40 0036      	move.w d0,54(sp)
  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    3662:	7012           	moveq #18,d0
    3664:	9041           	sub.w d1,d0
    3666:	3f40 003a      	move.w d0,58(sp)
  while( ZoomHorizontalStart < 0) {
    366a:	6c00 02aa      	bge.w 3916 <Zoom_ZoomIntoPicture+0x320>
    366e:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
    3670:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    3672:	0641 0013      	addi.w #19,d1
    3676:	d242           	add.w d2,d1
      shifthoriz--;
    3678:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
    367a:	4a41           	tst.w d1
    367c:	6df4           	blt.s 3672 <Zoom_ZoomIntoPicture+0x7c>
    367e:	3f41 003a      	move.w d1,58(sp)
    3682:	3f79 0000 7616 	move.w 7616 <ZoomBlit_Increment4SrcA>,60(sp)
    3688:	003c 
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    368a:	98c3           	suba.w d3,a4
    368c:	49ec 0012      	lea 18(a4),a4
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    3690:	0280 0000 ffff 	andi.l #65535,d0
    3696:	5280           	addq.l #1,d0
    3698:	2200           	move.l d0,d1
    369a:	d280           	add.l d0,d1
    369c:	d081           	add.l d1,d0
    369e:	e988           	lsl.l #4,d0
    36a0:	226f 0044      	movea.l 68(sp),a1
    36a4:	4df1 08fc      	lea (-4,a1,d0.l),a6
    36a8:	722c           	moveq #44,d1
    36aa:	d2af 0048      	add.l 72(sp),d1
    36ae:	2f41 0032      	move.l d1,50(sp)
  UWORD shifttoleft = 0;
    36b2:	426f 0038      	clr.w 56(sp)
  UWORD startofword = 21*16;
    36b6:	3a7c 0150      	movea.w #336,a5
      nextzoom -= (19 + zoomnr);
    36ba:	70ed           	moveq #-19,d0
    36bc:	9042           	sub.w d2,d0
    36be:	3f40 003e      	move.w d0,62(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    36c2:	260e           	move.l a6,d3
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    36c4:	226f 0032      	movea.l 50(sp),a1
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    36c8:	7e00           	moveq #0,d7
    36ca:	3e2f 0038      	move.w 56(sp),d7
    36ce:	de87           	add.l d7,d7
    36d0:	3f44 002e      	move.w d4,46(sp)
    36d4:	3a04           	move.w d4,d5
    36d6:	720c           	moveq #12,d1
    36d8:	e36d           	lsl.w d1,d5
    36da:	7000           	moveq #0,d0
    36dc:	300d           	move.w a5,d0
    36de:	346f 0036      	movea.w 54(sp),a2
    36e2:	b5c0           	cmpa.l d0,a2
    36e4:	6e00 00da      	bgt.w 37c0 <Zoom_ZoomIntoPicture+0x1ca>
  hw->bltcon0 = 0x9f0 + shiftright;
    36e8:	0645 09f0      	addi.w #2544,d5
    ZoomHorizontal = ZoomHorizontalStart;
    36ec:	346f 003a      	movea.w 58(sp),a2
    WORD linesleft = 272;
    36f0:	303c 0110      	move.w #272,d0
    36f4:	220e           	move.l a6,d1
    36f6:	d287           	add.l d7,d1
    36f8:	2f47 002e      	move.l d7,46(sp)
    36fc:	2641           	movea.l d1,a3
        if( linesleft >= ZoomHorizontal+1) {
    36fe:	3400           	move.w d0,d2
    3700:	b04a           	cmp.w a2,d0
    3702:	6f00 00b0      	ble.w 37b4 <Zoom_ZoomIntoPicture+0x1be>
          linesleft -= ZoomHorizontal;
    3706:	3c00           	move.w d0,d6
    3708:	9c4a           	sub.w a2,d6
    370a:	3206           	move.w d6,d1
    370c:	300a           	move.w a2,d0
    370e:	340a           	move.w a2,d2
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3710:	3468 0002      	movea.w 2(a0),a2
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3714:	3e28 0002      	move.w 2(a0),d7
    3718:	0807 000e      	btst #14,d7
    371c:	66f6           	bne.s 3714 <Zoom_ZoomIntoPicture+0x11e>
  hw->bltcon1 = 0; 
    371e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    3724:	3145 0040      	move.w d5,64(a0)
  hw->bltapt = (UWORD *) source;
    3728:	214b 0050      	move.l a3,80(a0)
  hw->bltdpt = (UWORD *) destination;
    372c:	2149 0054      	move.l a1,84(a0)
  hw->bltsize = height*64+2;
    3730:	ed4a           	lsl.w #6,d2
    3732:	5442           	addq.w #2,d2
    3734:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3738:	3440           	movea.w d0,a2
    373a:	200a           	move.l a2,d0
    373c:	d08a           	add.l a2,d0
    373e:	d08a           	add.l a2,d0
    3740:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    3742:	d3c0           	adda.l d0,a1
        if( linesleft>0) {
    3744:	4a41           	tst.w d1
    3746:	6e2a           	bgt.s 3772 <Zoom_ZoomIntoPicture+0x17c>
    startofword -= 16;
    3748:	4bed fff0      	lea -16(a5),a5
    374c:	558e           	subq.l #2,a6
    374e:	55af 0032      	subq.l #2,50(sp)
  for(int i=0;i<22;i++) {
    3752:	72f0           	moveq #-16,d1
    3754:	b24d           	cmp.w a5,d1
    3756:	6600 ff6a      	bne.w 36c2 <Zoom_ZoomIntoPicture+0xcc>
    375a:	33cc 0000 7618 	move.w a4,7618 <ZoomHorizontal>
    3760:	33ef 003c 0000 	move.w 60(sp),7616 <ZoomBlit_Increment4SrcA>
    3766:	7616 
}
    3768:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    376c:	4fef 0014      	lea 20(sp),sp
    3770:	4e75           	rts
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3772:	d680           	add.l d0,d3
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, shiftright, 1);
    3774:	266f 002e      	movea.l 46(sp),a3
    3778:	d7c3           	adda.l d3,a3
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    377a:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    377e:	3028 0002      	move.w 2(a0),d0
    3782:	0800 000e      	btst #14,d0
    3786:	66f6           	bne.s 377e <Zoom_ZoomIntoPicture+0x188>
  hw->bltcon1 = 0; 
    3788:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0x9f0 + shiftright;
    378e:	3145 0040      	move.w d5,64(a0)
  hw->bltapt = (UWORD *) source;
    3792:	214b 0050      	move.l a3,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3796:	2149 0054      	move.l a1,84(a0)
  hw->bltsize = height*64+2;
    379a:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    37a0:	3006           	move.w d6,d0
    37a2:	5340           	subq.w #1,d0
          pos4dest += ZMLINESIZE/2;
    37a4:	43e9 0030      	lea 48(a1),a1
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    37a8:	344c           	movea.w a4,a2
      while(linesleft > 0) {
    37aa:	679c           	beq.s 3748 <Zoom_ZoomIntoPicture+0x152>
        if( linesleft >= ZoomHorizontal+1) {
    37ac:	3400           	move.w d0,d2
    37ae:	b04a           	cmp.w a2,d0
    37b0:	6e00 ff54      	bgt.w 3706 <Zoom_ZoomIntoPicture+0x110>
    37b4:	4246           	clr.w d6
          linesleft = 0;
    37b6:	4241           	clr.w d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    37b8:	3468 0002      	movea.w 2(a0),a2
    37bc:	6000 ff56      	bra.w 3714 <Zoom_ZoomIntoPicture+0x11e>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    37c0:	302f 0036      	move.w 54(sp),d0
    37c4:	904d           	sub.w a5,d0
    37c6:	5340           	subq.w #1,d0
  if( shiftright == 0) {
    37c8:	5344           	subq.w #1,d4
    37ca:	4a6f 002e      	tst.w 46(sp)
    37ce:	6700 0102      	beq.w 38d2 <Zoom_ZoomIntoPicture+0x2dc>
    shifta = (shiftright - 1) << 12;
    37d2:	3204           	move.w d4,d1
    37d4:	740c           	moveq #12,d2
    37d6:	e569           	lsl.w d2,d1
    37d8:	0641 0de4      	addi.w #3556,d1
    37dc:	95ca           	suba.l a2,a2
  ZoomBlit_Increment4SrcA = 0;
    37de:	426f 003c      	clr.w 60(sp)
  hw->bltcon1 = shiftb; 
    37e2:	3145 0042      	move.w d5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    37e6:	3141 0040      	move.w d1,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    37ea:	0280 0000 ffff 	andi.l #65535,d0
    37f0:	7210           	moveq #16,d1
    37f2:	9280           	sub.l d0,d1
    37f4:	7400           	moveq #0,d2
    37f6:	4642           	not.w d2
    37f8:	e3aa           	lsl.l d1,d2
    37fa:	3142 0070      	move.w d2,112(a0)
      nextzoom -= (19 + zoomnr);
    37fe:	302f 003e      	move.w 62(sp),d0
    3802:	d16f 0036      	add.w d0,54(sp)
    ZoomHorizontal = ZoomHorizontalStart;
    3806:	3c2f 003a      	move.w 58(sp),d6
    WORD linesleft = 272;
    380a:	303c 0110      	move.w #272,d0
    380e:	220e           	move.l a6,d1
    3810:	d287           	add.l d7,d1
    3812:	2641           	movea.l d1,a3
        if( linesleft >= ZoomHorizontal+1) {
    3814:	3400           	move.w d0,d2
    3816:	b046           	cmp.w d6,d0
    3818:	6f00 00ac      	ble.w 38c6 <Zoom_ZoomIntoPicture+0x2d0>
          linesleft -= ZoomHorizontal;
    381c:	3a00           	move.w d0,d5
    381e:	9a46           	sub.w d6,d5
    3820:	3205           	move.w d5,d1
    3822:	3006           	move.w d6,d0
    3824:	3406           	move.w d6,d2
    3826:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    382a:	3c28 0002      	move.w 2(a0),d6
    382e:	0806 000e      	btst #14,d6
    3832:	66f6           	bne.s 382a <Zoom_ZoomIntoPicture+0x234>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    3834:	2c0b           	move.l a3,d6
    3836:	dc8a           	add.l a2,d6
    3838:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    383c:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
    3840:	2149 0054      	move.l a1,84(a0)
  hw->bltsize = height*64+2;
    3844:	ed4a           	lsl.w #6,d2
    3846:	5442           	addq.w #2,d2
    3848:	3142 0058      	move.w d2,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    384c:	3640           	movea.w d0,a3
    384e:	200b           	move.l a3,d0
    3850:	d08b           	add.l a3,d0
    3852:	d08b           	add.l a3,d0
    3854:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    3856:	d3c0           	adda.l d0,a1
        if( linesleft>0) {
    3858:	4a41           	tst.w d1
    385a:	6e2a           	bgt.s 3886 <Zoom_ZoomIntoPicture+0x290>
      if(shiftright < 0) {
    385c:	4a44           	tst.w d4
    385e:	6c00 fee8      	bge.w 3748 <Zoom_ZoomIntoPicture+0x152>
        shiftright += 16;
    3862:	382f 002e      	move.w 46(sp),d4
    3866:	0644 000f      	addi.w #15,d4
        shifttoleft = 1;
    386a:	3f7c 0001 0038 	move.w #1,56(sp)
    startofword -= 16;
    3870:	4bed fff0      	lea -16(a5),a5
    3874:	558e           	subq.l #2,a6
    3876:	55af 0032      	subq.l #2,50(sp)
  for(int i=0;i<22;i++) {
    387a:	72f0           	moveq #-16,d1
    387c:	b24d           	cmp.w a5,d1
    387e:	6600 fe42      	bne.w 36c2 <Zoom_ZoomIntoPicture+0xcc>
    3882:	6000 fed6      	bra.w 375a <Zoom_ZoomIntoPicture+0x164>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3886:	d680           	add.l d0,d3
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, 1);
    3888:	2643           	movea.l d3,a3
    388a:	d7c7           	adda.l d7,a3
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    388c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3890:	3028 0002      	move.w 2(a0),d0
    3894:	0800 000e      	btst #14,d0
    3898:	66f6           	bne.s 3890 <Zoom_ZoomIntoPicture+0x29a>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    389a:	200b           	move.l a3,d0
    389c:	d08a           	add.l a2,d0
    389e:	2140 0050      	move.l d0,80(a0)
  hw->bltbpt = source;
    38a2:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
    38a6:	2149 0054      	move.l a1,84(a0)
  hw->bltsize = height*64+2;
    38aa:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    38b0:	43e9 0030      	lea 48(a1),a1
          linesleft--;
    38b4:	3005           	move.w d5,d0
    38b6:	5340           	subq.w #1,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    38b8:	3c0c           	move.w a4,d6
      while( linesleft > 0) {
    38ba:	4a40           	tst.w d0
    38bc:	679e           	beq.s 385c <Zoom_ZoomIntoPicture+0x266>
        if( linesleft >= ZoomHorizontal+1) {
    38be:	3400           	move.w d0,d2
    38c0:	b046           	cmp.w d6,d0
    38c2:	6e00 ff58      	bgt.w 381c <Zoom_ZoomIntoPicture+0x226>
    38c6:	4245           	clr.w d5
          linesleft = 0;
    38c8:	4241           	clr.w d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    38ca:	3c28 0002      	move.w 2(a0),d6
    38ce:	6000 ff5a      	bra.w 382a <Zoom_ZoomIntoPicture+0x234>
  if( shiftright == 0) {
    38d2:	347c 0002      	movea.w #2,a2
    38d6:	323c fde4      	move.w #-540,d1
    ZoomBlit_Increment4SrcA = 1;
    38da:	3f7c 0001 003c 	move.w #1,60(sp)
  hw->bltcon1 = shiftb; 
    38e0:	3145 0042      	move.w d5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    38e4:	3141 0040      	move.w d1,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    38e8:	0280 0000 ffff 	andi.l #65535,d0
    38ee:	7210           	moveq #16,d1
    38f0:	9280           	sub.l d0,d1
    38f2:	7400           	moveq #0,d2
    38f4:	4642           	not.w d2
    38f6:	e3aa           	lsl.l d1,d2
    38f8:	3142 0070      	move.w d2,112(a0)
      nextzoom -= (19 + zoomnr);
    38fc:	302f 003e      	move.w 62(sp),d0
    3900:	d16f 0036      	add.w d0,54(sp)
    ZoomHorizontal = ZoomHorizontalStart;
    3904:	3c2f 003a      	move.w 58(sp),d6
    WORD linesleft = 272;
    3908:	303c 0110      	move.w #272,d0
    390c:	220e           	move.l a6,d1
    390e:	d287           	add.l d7,d1
    3910:	2641           	movea.l d1,a3
    3912:	6000 ff00      	bra.w 3814 <Zoom_ZoomIntoPicture+0x21e>
  UWORD shifthoriz = 7;
    3916:	7007           	moveq #7,d0
    3918:	3f79 0000 7616 	move.w 7616 <ZoomBlit_Increment4SrcA>,60(sp)
    391e:	003c 
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3920:	98c3           	suba.w d3,a4
    3922:	49ec 0012      	lea 18(a4),a4
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    3926:	0280 0000 ffff 	andi.l #65535,d0
    392c:	5280           	addq.l #1,d0
    392e:	2200           	move.l d0,d1
    3930:	d280           	add.l d0,d1
    3932:	d081           	add.l d1,d0
    3934:	e988           	lsl.l #4,d0
    3936:	226f 0044      	movea.l 68(sp),a1
    393a:	4df1 08fc      	lea (-4,a1,d0.l),a6
    393e:	722c           	moveq #44,d1
    3940:	d2af 0048      	add.l 72(sp),d1
    3944:	2f41 0032      	move.l d1,50(sp)
  UWORD shifttoleft = 0;
    3948:	426f 0038      	clr.w 56(sp)
  UWORD startofword = 21*16;
    394c:	3a7c 0150      	movea.w #336,a5
      nextzoom -= (19 + zoomnr);
    3950:	70ed           	moveq #-19,d0
    3952:	9042           	sub.w d2,d0
    3954:	3f40 003e      	move.w d0,62(sp)
    3958:	6000 fd68      	bra.w 36c2 <Zoom_ZoomIntoPicture+0xcc>

0000395c <ClbuildZoom>:
ULONG * ClbuildZoom() {
    395c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    3960:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3966:	203c 0000 a48c 	move.l #42124,d0
    396c:	7202           	moveq #2,d1
    396e:	4eae ff3a      	jsr -198(a6)
    3972:	2440           	movea.l d0,a2
  if( retval == 0) {
    3974:	4a80           	tst.l d0
    3976:	6700 0160      	beq.w 3ad8 <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    397a:	24b9 0000 7580 	move.l 7580 <ClsSprites>,(a2)
    3980:	2579 0000 7584 	move.l 7584 <ClsSprites+0x4>,4(a2)
    3986:	0004 
    3988:	2579 0000 7588 	move.l 7588 <ClsSprites+0x8>,8(a2)
    398e:	0008 
    3990:	2579 0000 758c 	move.l 758c <ClsSprites+0xc>,12(a2)
    3996:	000c 
    3998:	2579 0000 7590 	move.l 7590 <ClsSprites+0x10>,16(a2)
    399e:	0010 
    39a0:	2579 0000 7594 	move.l 7594 <ClsSprites+0x14>,20(a2)
    39a6:	0014 
    39a8:	2579 0000 7598 	move.l 7598 <ClsSprites+0x18>,24(a2)
    39ae:	0018 
    39b0:	2579 0000 759c 	move.l 759c <ClsSprites+0x1c>,28(a2)
    39b6:	001c 
    39b8:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x20>,32(a2)
    39be:	0020 
    39c0:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x24>,36(a2)
    39c6:	0024 
    39c8:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x28>,40(a2)
    39ce:	0028 
    39d0:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x2c>,44(a2)
    39d6:	002c 
    39d8:	2579 0000 75b0 	move.l 75b0 <ClsSprites+0x30>,48(a2)
    39de:	0030 
    39e0:	2579 0000 75b4 	move.l 75b4 <ClsSprites+0x34>,52(a2)
    39e6:	0034 
    39e8:	2579 0000 75b8 	move.l 75b8 <ClsSprites+0x38>,56(a2)
    39ee:	0038 
    39f0:	2579 0000 75bc 	move.l 75bc <ClsSprites+0x3c>,60(a2)
    39f6:	003c 
    *cl++ = *clpartinstruction++;
    39f8:	2579 0000 7518 	move.l 7518 <ClScreenZoom>,64(a2)
    39fe:	0040 
    3a00:	2579 0000 751c 	move.l 751c <ClScreenZoom+0x4>,68(a2)
    3a06:	0044 
    3a08:	2579 0000 7520 	move.l 7520 <ClScreenZoom+0x8>,72(a2)
    3a0e:	0048 
    3a10:	2579 0000 7524 	move.l 7524 <ClScreenZoom+0xc>,76(a2)
    3a16:	004c 
    3a18:	2579 0000 7528 	move.l 7528 <ClScreenZoom+0x10>,80(a2)
    3a1e:	0050 
    3a20:	2579 0000 752c 	move.l 752c <ClScreenZoom+0x14>,84(a2)
    3a26:	0054 
    3a28:	2579 0000 7530 	move.l 7530 <ClScreenZoom+0x18>,88(a2)
    3a2e:	0058 
    3a30:	2579 0000 7534 	move.l 7534 <ClScreenZoom+0x1c>,92(a2)
    3a36:	005c 
    3a38:	2579 0000 7538 	move.l 7538 <ClScreenZoom+0x20>,96(a2)
    3a3e:	0060 
    3a40:	2579 0000 753c 	move.l 753c <ClScreenZoom+0x24>,100(a2)
    3a46:	0064 
    3a48:	2579 0000 7540 	move.l 7540 <ClScreenZoom+0x28>,104(a2)
    3a4e:	0068 
    3a50:	2579 0000 7544 	move.l 7544 <ClScreenZoom+0x2c>,108(a2)
    3a56:	006c 
  *cl++ = 0x00e00000;
    3a58:	257c 00e0 0000 	move.l #14680064,112(a2)
    3a5e:	0070 
  *cl++ = 0x00e20000;
    3a60:	257c 00e2 0000 	move.l #14811136,116(a2)
    3a66:	0074 
  *cl++ = 0x00e40000;
    3a68:	257c 00e4 0000 	move.l #14942208,120(a2)
    3a6e:	0078 
  *cl++ = 0x00e60000;
    3a70:	257c 00e6 0000 	move.l #15073280,124(a2)
    3a76:	007c 
    *cl++ = *clpartinstruction++;
    3a78:	2579 0000 7548 	move.l 7548 <ClColor>,128(a2)
    3a7e:	0080 
    3a80:	2579 0000 754c 	move.l 754c <ClColor+0x4>,132(a2)
    3a86:	0084 
    3a88:	43ea 012c      	lea 300(a2),a1
    3a8c:	220a           	move.l a2,d1
    3a8e:	0681 0000 a52c 	addi.l #42284,d1
    3a94:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    3a9a:	41e9 ff60      	lea -160(a1),a0
    3a9e:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    3aa2:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    3aa8:	5088           	addq.l #8,a0
    3aaa:	217c 0182 0f00 	move.l #25300736,-4(a0)
    3ab0:	fffc 
    for(int i2=0;i2<20;i2++) {
    3ab2:	b3c8           	cmpa.l a0,a1
    3ab4:	66ec           	bne.s 3aa2 <ClbuildZoom+0x146>
    3ab6:	43e8 00a4      	lea 164(a0),a1
    3aba:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    3ac0:	b3c1           	cmpa.l d1,a1
    3ac2:	66d6           	bne.s 3a9a <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    3ac4:	203c 0000 a488 	move.l #42120,d0
    3aca:	72fe           	moveq #-2,d1
    3acc:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    3ad0:	200a           	move.l a2,d0
    3ad2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3ad6:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    3ad8:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3ade:	4eae ffc4      	jsr -60(a6)
    3ae2:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3ae8:	2200           	move.l d0,d1
    3aea:	243c 0000 4b35 	move.l #19253,d2
    3af0:	7628           	moveq #40,d3
    3af2:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3af6:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3afc:	7201           	moveq #1,d1
    3afe:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    3b02:	24b9 0000 7580 	move.l 7580 <ClsSprites>,(a2)
    3b08:	2579 0000 7584 	move.l 7584 <ClsSprites+0x4>,4(a2)
    3b0e:	0004 
    3b10:	2579 0000 7588 	move.l 7588 <ClsSprites+0x8>,8(a2)
    3b16:	0008 
    3b18:	2579 0000 758c 	move.l 758c <ClsSprites+0xc>,12(a2)
    3b1e:	000c 
    3b20:	2579 0000 7590 	move.l 7590 <ClsSprites+0x10>,16(a2)
    3b26:	0010 
    3b28:	2579 0000 7594 	move.l 7594 <ClsSprites+0x14>,20(a2)
    3b2e:	0014 
    3b30:	2579 0000 7598 	move.l 7598 <ClsSprites+0x18>,24(a2)
    3b36:	0018 
    3b38:	2579 0000 759c 	move.l 759c <ClsSprites+0x1c>,28(a2)
    3b3e:	001c 
    3b40:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x20>,32(a2)
    3b46:	0020 
    3b48:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x24>,36(a2)
    3b4e:	0024 
    3b50:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x28>,40(a2)
    3b56:	0028 
    3b58:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x2c>,44(a2)
    3b5e:	002c 
    3b60:	2579 0000 75b0 	move.l 75b0 <ClsSprites+0x30>,48(a2)
    3b66:	0030 
    3b68:	2579 0000 75b4 	move.l 75b4 <ClsSprites+0x34>,52(a2)
    3b6e:	0034 
    3b70:	2579 0000 75b8 	move.l 75b8 <ClsSprites+0x38>,56(a2)
    3b76:	0038 
    3b78:	2579 0000 75bc 	move.l 75bc <ClsSprites+0x3c>,60(a2)
    3b7e:	003c 
    *cl++ = *clpartinstruction++;
    3b80:	2579 0000 7518 	move.l 7518 <ClScreenZoom>,64(a2)
    3b86:	0040 
    3b88:	2579 0000 751c 	move.l 751c <ClScreenZoom+0x4>,68(a2)
    3b8e:	0044 
    3b90:	2579 0000 7520 	move.l 7520 <ClScreenZoom+0x8>,72(a2)
    3b96:	0048 
    3b98:	2579 0000 7524 	move.l 7524 <ClScreenZoom+0xc>,76(a2)
    3b9e:	004c 
    3ba0:	2579 0000 7528 	move.l 7528 <ClScreenZoom+0x10>,80(a2)
    3ba6:	0050 
    3ba8:	2579 0000 752c 	move.l 752c <ClScreenZoom+0x14>,84(a2)
    3bae:	0054 
    3bb0:	2579 0000 7530 	move.l 7530 <ClScreenZoom+0x18>,88(a2)
    3bb6:	0058 
    3bb8:	2579 0000 7534 	move.l 7534 <ClScreenZoom+0x1c>,92(a2)
    3bbe:	005c 
    3bc0:	2579 0000 7538 	move.l 7538 <ClScreenZoom+0x20>,96(a2)
    3bc6:	0060 
    3bc8:	2579 0000 753c 	move.l 753c <ClScreenZoom+0x24>,100(a2)
    3bce:	0064 
    3bd0:	2579 0000 7540 	move.l 7540 <ClScreenZoom+0x28>,104(a2)
    3bd6:	0068 
    3bd8:	2579 0000 7544 	move.l 7544 <ClScreenZoom+0x2c>,108(a2)
    3bde:	006c 
  *cl++ = 0x00e00000;
    3be0:	257c 00e0 0000 	move.l #14680064,112(a2)
    3be6:	0070 
  *cl++ = 0x00e20000;
    3be8:	257c 00e2 0000 	move.l #14811136,116(a2)
    3bee:	0074 
  *cl++ = 0x00e40000;
    3bf0:	257c 00e4 0000 	move.l #14942208,120(a2)
    3bf6:	0078 
  *cl++ = 0x00e60000;
    3bf8:	257c 00e6 0000 	move.l #15073280,124(a2)
    3bfe:	007c 
    *cl++ = *clpartinstruction++;
    3c00:	2579 0000 7548 	move.l 7548 <ClColor>,128(a2)
    3c06:	0080 
    3c08:	2579 0000 754c 	move.l 754c <ClColor+0x4>,132(a2)
    3c0e:	0084 
    3c10:	43ea 012c      	lea 300(a2),a1
    3c14:	220a           	move.l a2,d1
    3c16:	0681 0000 a52c 	addi.l #42284,d1
    3c1c:	203c 2c07 fffe 	move.l #738721790,d0
    3c22:	6000 fe76      	bra.w 3a9a <ClbuildZoom+0x13e>

00003c26 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    3c26:	2039 0000 762e 	move.l 762e <DrawCopper>,d0
  DrawCopper = ViewCopper;
    3c2c:	23f9 0000 7622 	move.l 7622 <ViewCopper>,762e <DrawCopper>
    3c32:	0000 762e 
  ViewCopper = (ULONG *)tmp;
    3c36:	23c0 0000 7622 	move.l d0,7622 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    3c3c:	2079 0000 761a 	movea.l 761a <hw>,a0
    3c42:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    3c46:	3140 0088      	move.w d0,136(a0)
}
    3c4a:	4e75           	rts

00003c4c <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    3c4c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    3c50:	45fa fd0a      	lea 395c <ClbuildZoom>(pc),a2
    3c54:	4e92           	jsr (a2)
    3c56:	23c0 0000 763e 	move.l d0,763e <Copperlist1>
  Copperlist2 = ClbuildZoom();
    3c5c:	4e92           	jsr (a2)
    3c5e:	23c0 0000 763a 	move.l d0,763a <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3c64:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3c6a:	203c 0001 6800 	move.l #92160,d0
    3c70:	7202           	moveq #2,d1
    3c72:	4eae ff3a      	jsr -198(a6)
    3c76:	23c0 0000 7636 	move.l d0,7636 <Bitplane1>
  if(Bitplane1 == 0) {
    3c7c:	6700 014e      	beq.w 3dcc <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    3c80:	23c0 0000 7632 	move.l d0,7632 <DrawBuffer>
  DrawCopper = Copperlist1;
    3c86:	23f9 0000 763e 	move.l 763e <Copperlist1>,762e <DrawCopper>
    3c8c:	0000 762e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3c90:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3c96:	203c 0001 6800 	move.l #92160,d0
    3c9c:	7202           	moveq #2,d1
    3c9e:	4eae ff3a      	jsr -198(a6)
    3ca2:	2400           	move.l d0,d2
    3ca4:	23c0 0000 762a 	move.l d0,762a <Bitplane2>
  if(Bitplane2 == 0) {
    3caa:	6778           	beq.s 3d24 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    3cac:	23f9 0000 763a 	move.l 763a <Copperlist2>,7622 <ViewCopper>
    3cb2:	0000 7622 
  SwapCl();
    3cb6:	45fa ff6e      	lea 3c26 <SwapCl>(pc),a2
    3cba:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    3cbc:	2039 0000 7632 	move.l 7632 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3cc2:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3cc8:	2200           	move.l d0,d1
    3cca:	4241           	clr.w d1
    3ccc:	4841           	swap d1
    3cce:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    3cd2:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    3cd6:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3cdc:	2200           	move.l d0,d1
    3cde:	4241           	clr.w d1
    3ce0:	4841           	swap d1
    3ce2:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3ce6:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    3cea:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    3cec:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3cf2:	2002           	move.l d2,d0
    3cf4:	4240           	clr.w d0
    3cf6:	4840           	swap d0
    3cf8:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    3cfc:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    3d00:	2002           	move.l d2,d0
    3d02:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3d08:	2200           	move.l d0,d1
    3d0a:	4241           	clr.w d1
    3d0c:	4841           	swap d1
    3d0e:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3d12:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    3d16:	23c2 0000 7626 	move.l d2,7626 <ViewBuffer>
}
    3d1c:	7000           	moveq #0,d0
    3d1e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3d22:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    3d24:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3d2a:	4eae ffc4      	jsr -60(a6)
    3d2e:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3d34:	2200           	move.l d0,d1
    3d36:	243c 0000 4b82 	move.l #19330,d2
    3d3c:	7626           	moveq #38,d3
    3d3e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3d42:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3d48:	7201           	moveq #1,d1
    3d4a:	4eae ff70      	jsr -144(a6)
    3d4e:	2439 0000 762a 	move.l 762a <Bitplane2>,d2
  ViewCopper = Copperlist2;
    3d54:	23f9 0000 763a 	move.l 763a <Copperlist2>,7622 <ViewCopper>
    3d5a:	0000 7622 
  SwapCl();
    3d5e:	45fa fec6      	lea 3c26 <SwapCl>(pc),a2
    3d62:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    3d64:	2039 0000 7632 	move.l 7632 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3d6a:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3d70:	2200           	move.l d0,d1
    3d72:	4241           	clr.w d1
    3d74:	4841           	swap d1
    3d76:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    3d7a:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    3d7e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3d84:	2200           	move.l d0,d1
    3d86:	4241           	clr.w d1
    3d88:	4841           	swap d1
    3d8a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3d8e:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    3d92:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    3d94:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3d9a:	2002           	move.l d2,d0
    3d9c:	4240           	clr.w d0
    3d9e:	4840           	swap d0
    3da0:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    3da4:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    3da8:	2002           	move.l d2,d0
    3daa:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3db0:	2200           	move.l d0,d1
    3db2:	4241           	clr.w d1
    3db4:	4841           	swap d1
    3db6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3dba:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    3dbe:	23c2 0000 7626 	move.l d2,7626 <ViewBuffer>
}
    3dc4:	7000           	moveq #0,d0
    3dc6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3dca:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    3dcc:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3dd2:	4eae ffc4      	jsr -60(a6)
    3dd6:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3ddc:	2200           	move.l d0,d1
    3dde:	243c 0000 4b5b 	move.l #19291,d2
    3de4:	7626           	moveq #38,d3
    3de6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3dea:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3df0:	7201           	moveq #1,d1
    3df2:	4eae ff70      	jsr -144(a6)
    3df6:	2039 0000 7636 	move.l 7636 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    3dfc:	23c0 0000 7632 	move.l d0,7632 <DrawBuffer>
  DrawCopper = Copperlist1;
    3e02:	23f9 0000 763e 	move.l 763e <Copperlist1>,762e <DrawCopper>
    3e08:	0000 762e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3e0c:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3e12:	203c 0001 6800 	move.l #92160,d0
    3e18:	7202           	moveq #2,d1
    3e1a:	4eae ff3a      	jsr -198(a6)
    3e1e:	2400           	move.l d0,d2
    3e20:	23c0 0000 762a 	move.l d0,762a <Bitplane2>
  if(Bitplane2 == 0) {
    3e26:	6600 fe84      	bne.w 3cac <PrepareDisplayZoom+0x60>
    3e2a:	6000 fef8      	bra.w 3d24 <PrepareDisplayZoom+0xd8>

00003e2e <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    3e2e:	2039 0000 7632 	move.l 7632 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3e34:	2079 0000 762e 	movea.l 762e <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    3e3a:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    3e3e:	2200           	move.l d0,d1
    3e40:	4241           	clr.w d1
    3e42:	4841           	swap d1
    3e44:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    3e48:	23f9 0000 7626 	move.l 7626 <ViewBuffer>,7632 <DrawBuffer>
    3e4e:	0000 7632 
  ViewBuffer = (ULONG *) tmp;
    3e52:	23c0 0000 7626 	move.l d0,7626 <ViewBuffer>
}
    3e58:	4e75           	rts

00003e5a <PrepareDisplay>:
 int PrepareDisplaySW() {
    3e5a:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    3e5e:	45fa f522      	lea 3382 <ClBuild>(pc),a2
    3e62:	4e92           	jsr (a2)
    3e64:	23c0 0000 763e 	move.l d0,763e <Copperlist1>
  Copperlist2 = ClbuildSW();
    3e6a:	4e92           	jsr (a2)
    3e6c:	23c0 0000 763a 	move.l d0,763a <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3e72:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3e78:	203c 0000 c800 	move.l #51200,d0
    3e7e:	7202           	moveq #2,d1
    3e80:	4eae ff3a      	jsr -198(a6)
    3e84:	23c0 0000 7636 	move.l d0,7636 <Bitplane1>
  if(Bitplane1 == 0) {
    3e8a:	6700 00ac      	beq.w 3f38 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    3e8e:	23c0 0000 7632 	move.l d0,7632 <DrawBuffer>
  DrawCopper = Copperlist1;
    3e94:	23f9 0000 763e 	move.l 763e <Copperlist1>,762e <DrawCopper>
    3e9a:	0000 762e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3e9e:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3ea4:	203c 0000 c800 	move.l #51200,d0
    3eaa:	7202           	moveq #2,d1
    3eac:	4eae ff3a      	jsr -198(a6)
    3eb0:	23c0 0000 762a 	move.l d0,762a <Bitplane2>
  if(Bitplane2 == 0) {
    3eb6:	6728           	beq.s 3ee0 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    3eb8:	23c0 0000 7626 	move.l d0,7626 <ViewBuffer>
  ViewCopper = Copperlist2;
    3ebe:	23f9 0000 763a 	move.l 763a <Copperlist2>,7622 <ViewCopper>
    3ec4:	0000 7622 
  SwapCl();
    3ec8:	47fa fd5c      	lea 3c26 <SwapCl>(pc),a3
    3ecc:	4e93           	jsr (a3)
  SetBplPointers();
    3ece:	45fa ff5e      	lea 3e2e <SetBplPointers>(pc),a2
    3ed2:	4e92           	jsr (a2)
  SwapCl();
    3ed4:	4e93           	jsr (a3)
  SetBplPointers();
    3ed6:	4e92           	jsr (a2)
}
    3ed8:	7000           	moveq #0,d0
    3eda:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    3ede:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    3ee0:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3ee6:	4eae ffc4      	jsr -60(a6)
    3eea:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3ef0:	2200           	move.l d0,d1
    3ef2:	243c 0000 4b82 	move.l #19330,d2
    3ef8:	7626           	moveq #38,d3
    3efa:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3efe:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3f04:	7201           	moveq #1,d1
    3f06:	4eae ff70      	jsr -144(a6)
    3f0a:	2039 0000 762a 	move.l 762a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    3f10:	23c0 0000 7626 	move.l d0,7626 <ViewBuffer>
  ViewCopper = Copperlist2;
    3f16:	23f9 0000 763a 	move.l 763a <Copperlist2>,7622 <ViewCopper>
    3f1c:	0000 7622 
  SwapCl();
    3f20:	47fa fd04      	lea 3c26 <SwapCl>(pc),a3
    3f24:	4e93           	jsr (a3)
  SetBplPointers();
    3f26:	45fa ff06      	lea 3e2e <SetBplPointers>(pc),a2
    3f2a:	4e92           	jsr (a2)
  SwapCl();
    3f2c:	4e93           	jsr (a3)
  SetBplPointers();
    3f2e:	4e92           	jsr (a2)
}
    3f30:	7000           	moveq #0,d0
    3f32:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    3f36:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    3f38:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3f3e:	4eae ffc4      	jsr -60(a6)
    3f42:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3f48:	2200           	move.l d0,d1
    3f4a:	243c 0000 4b5b 	move.l #19291,d2
    3f50:	7626           	moveq #38,d3
    3f52:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3f56:	2c79 0000 7642 	movea.l 7642 <DOSBase>,a6
    3f5c:	7201           	moveq #1,d1
    3f5e:	4eae ff70      	jsr -144(a6)
    3f62:	2039 0000 7636 	move.l 7636 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    3f68:	23c0 0000 7632 	move.l d0,7632 <DrawBuffer>
  DrawCopper = Copperlist1;
    3f6e:	23f9 0000 763e 	move.l 763e <Copperlist1>,762e <DrawCopper>
    3f74:	0000 762e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3f78:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3f7e:	203c 0000 c800 	move.l #51200,d0
    3f84:	7202           	moveq #2,d1
    3f86:	4eae ff3a      	jsr -198(a6)
    3f8a:	23c0 0000 762a 	move.l d0,762a <Bitplane2>
  if(Bitplane2 == 0) {
    3f90:	6600 ff26      	bne.w 3eb8 <PrepareDisplay+0x5e>
    3f94:	6000 ff4a      	bra.w 3ee0 <PrepareDisplay+0x86>

00003f98 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    3f98:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    3f9c:	262f 0010      	move.l 16(sp),d3
    3fa0:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    3fa4:	2279 0000 763e 	movea.l 763e <Copperlist1>,a1
    3faa:	b2fc 0000      	cmpa.w #0,a1
    3fae:	670c           	beq.s 3fbc <FreeDisplay+0x24>
    3fb0:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3fb6:	2003           	move.l d3,d0
    3fb8:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    3fbc:	2279 0000 763a 	movea.l 763a <Copperlist2>,a1
    3fc2:	b2fc 0000      	cmpa.w #0,a1
    3fc6:	670c           	beq.s 3fd4 <FreeDisplay+0x3c>
    3fc8:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3fce:	2003           	move.l d3,d0
    3fd0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    3fd4:	2279 0000 7636 	movea.l 7636 <Bitplane1>,a1
    3fda:	b2fc 0000      	cmpa.w #0,a1
    3fde:	670c           	beq.s 3fec <FreeDisplay+0x54>
    3fe0:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3fe6:	2002           	move.l d2,d0
    3fe8:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    3fec:	2279 0000 762a 	movea.l 762a <Bitplane2>,a1
    3ff2:	b2fc 0000      	cmpa.w #0,a1
    3ff6:	670c           	beq.s 4004 <FreeDisplay+0x6c>
    3ff8:	2c79 0000 7646 	movea.l 7646 <SysBase>,a6
    3ffe:	2002           	move.l d2,d0
    4000:	4eae ff2e      	jsr -210(a6)
}
    4004:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    4008:	4e75           	rts

0000400a <WaitVbl>:
void WaitVbl() {
    400a:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    400c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb5ac>,d0
    4012:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    4014:	2017           	move.l (sp),d0
    4016:	0280 0001 ff00 	andi.l #130816,d0
    401c:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    401e:	2017           	move.l (sp),d0
    4020:	0c80 0001 3700 	cmpi.l #79616,d0
    4026:	67e4           	beq.s 400c <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    4028:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb5ac>,d0
    402e:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    4032:	202f 0004      	move.l 4(sp),d0
    4036:	0280 0001 ff00 	andi.l #130816,d0
    403c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    4040:	202f 0004      	move.l 4(sp),d0
    4044:	0c80 0001 3700 	cmpi.l #79616,d0
    404a:	66dc           	bne.s 4028 <WaitVbl+0x1e>
}
    404c:	508f           	addq.l #8,sp
    404e:	4e75           	rts

00004050 <memcpy>:
{
    4050:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4054:	202f 0014      	move.l 20(sp),d0
    4058:	226f 0018      	movea.l 24(sp),a1
    405c:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4060:	2601           	move.l d1,d3
    4062:	5383           	subq.l #1,d3
    4064:	4a81           	tst.l d1
    4066:	6762           	beq.s 40ca <memcpy+0x7a>
    4068:	2040           	movea.l d0,a0
    406a:	5888           	addq.l #4,a0
    406c:	b1c9           	cmpa.l a1,a0
    406e:	53c2           	sl.s d2
    4070:	4402           	neg.b d2
    4072:	41e9 0004      	lea 4(a1),a0
    4076:	b1c0           	cmpa.l d0,a0
    4078:	53c4           	sl.s d4
    407a:	4404           	neg.b d4
    407c:	8404           	or.b d4,d2
    407e:	7808           	moveq #8,d4
    4080:	b883           	cmp.l d3,d4
    4082:	55c4           	sc.s d4
    4084:	4404           	neg.b d4
    4086:	c404           	and.b d4,d2
    4088:	6746           	beq.s 40d0 <memcpy+0x80>
    408a:	2409           	move.l a1,d2
    408c:	8480           	or.l d0,d2
    408e:	7803           	moveq #3,d4
    4090:	c484           	and.l d4,d2
    4092:	663c           	bne.s 40d0 <memcpy+0x80>
    4094:	2049           	movea.l a1,a0
    4096:	2440           	movea.l d0,a2
    4098:	74fc           	moveq #-4,d2
    409a:	c481           	and.l d1,d2
    409c:	d489           	add.l a1,d2
		*d++ = *s++;
    409e:	24d8           	move.l (a0)+,(a2)+
    40a0:	b488           	cmp.l a0,d2
    40a2:	66fa           	bne.s 409e <memcpy+0x4e>
    40a4:	74fc           	moveq #-4,d2
    40a6:	c481           	and.l d1,d2
    40a8:	2040           	movea.l d0,a0
    40aa:	d1c2           	adda.l d2,a0
    40ac:	d3c2           	adda.l d2,a1
    40ae:	9682           	sub.l d2,d3
    40b0:	b481           	cmp.l d1,d2
    40b2:	6716           	beq.s 40ca <memcpy+0x7a>
    40b4:	1091           	move.b (a1),(a0)
	while(len--)
    40b6:	4a83           	tst.l d3
    40b8:	6710           	beq.s 40ca <memcpy+0x7a>
		*d++ = *s++;
    40ba:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    40c0:	5383           	subq.l #1,d3
    40c2:	6706           	beq.s 40ca <memcpy+0x7a>
		*d++ = *s++;
    40c4:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    40ca:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    40ce:	4e75           	rts
    40d0:	2040           	movea.l d0,a0
    40d2:	d289           	add.l a1,d1
		*d++ = *s++;
    40d4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    40d6:	b289           	cmp.l a1,d1
    40d8:	67f0           	beq.s 40ca <memcpy+0x7a>
		*d++ = *s++;
    40da:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    40dc:	b289           	cmp.l a1,d1
    40de:	66f4           	bne.s 40d4 <memcpy+0x84>
    40e0:	60e8           	bra.s 40ca <memcpy+0x7a>

000040e2 <memset>:
{
    40e2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    40e6:	202f 0024      	move.l 36(sp),d0
    40ea:	2a2f 0028      	move.l 40(sp),d5
    40ee:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    40f2:	2809           	move.l a1,d4
    40f4:	5384           	subq.l #1,d4
    40f6:	b2fc 0000      	cmpa.w #0,a1
    40fa:	6f00 00b0      	ble.w 41ac <memset+0xca>
    40fe:	1e05           	move.b d5,d7
    4100:	2200           	move.l d0,d1
    4102:	4481           	neg.l d1
    4104:	7403           	moveq #3,d2
    4106:	c282           	and.l d2,d1
    4108:	7c05           	moveq #5,d6
		*ptr++ = val;
    410a:	2440           	movea.l d0,a2
    410c:	bc84           	cmp.l d4,d6
    410e:	646a           	bcc.s 417a <memset+0x98>
    4110:	4a81           	tst.l d1
    4112:	6724           	beq.s 4138 <memset+0x56>
    4114:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4116:	5384           	subq.l #1,d4
    4118:	7401           	moveq #1,d2
    411a:	b481           	cmp.l d1,d2
    411c:	671a           	beq.s 4138 <memset+0x56>
		*ptr++ = val;
    411e:	2440           	movea.l d0,a2
    4120:	548a           	addq.l #2,a2
    4122:	2040           	movea.l d0,a0
    4124:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4128:	5384           	subq.l #1,d4
    412a:	7403           	moveq #3,d2
    412c:	b481           	cmp.l d1,d2
    412e:	6608           	bne.s 4138 <memset+0x56>
		*ptr++ = val;
    4130:	528a           	addq.l #1,a2
    4132:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4136:	5384           	subq.l #1,d4
    4138:	2609           	move.l a1,d3
    413a:	9681           	sub.l d1,d3
    413c:	7c00           	moveq #0,d6
    413e:	1c05           	move.b d5,d6
    4140:	2406           	move.l d6,d2
    4142:	4842           	swap d2
    4144:	4242           	clr.w d2
    4146:	2042           	movea.l d2,a0
    4148:	2406           	move.l d6,d2
    414a:	e14a           	lsl.w #8,d2
    414c:	4842           	swap d2
    414e:	4242           	clr.w d2
    4150:	e18e           	lsl.l #8,d6
    4152:	2646           	movea.l d6,a3
    4154:	2c08           	move.l a0,d6
    4156:	8486           	or.l d6,d2
    4158:	2c0b           	move.l a3,d6
    415a:	8486           	or.l d6,d2
    415c:	1407           	move.b d7,d2
    415e:	2040           	movea.l d0,a0
    4160:	d1c1           	adda.l d1,a0
    4162:	72fc           	moveq #-4,d1
    4164:	c283           	and.l d3,d1
    4166:	d288           	add.l a0,d1
		*ptr++ = val;
    4168:	20c2           	move.l d2,(a0)+
    416a:	b1c1           	cmpa.l d1,a0
    416c:	66fa           	bne.s 4168 <memset+0x86>
    416e:	72fc           	moveq #-4,d1
    4170:	c283           	and.l d3,d1
    4172:	d5c1           	adda.l d1,a2
    4174:	9881           	sub.l d1,d4
    4176:	b283           	cmp.l d3,d1
    4178:	6732           	beq.s 41ac <memset+0xca>
    417a:	1485           	move.b d5,(a2)
	while(len-- > 0)
    417c:	4a84           	tst.l d4
    417e:	6f2c           	ble.s 41ac <memset+0xca>
		*ptr++ = val;
    4180:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4184:	7201           	moveq #1,d1
    4186:	b284           	cmp.l d4,d1
    4188:	6c22           	bge.s 41ac <memset+0xca>
		*ptr++ = val;
    418a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    418e:	7402           	moveq #2,d2
    4190:	b484           	cmp.l d4,d2
    4192:	6c18           	bge.s 41ac <memset+0xca>
		*ptr++ = val;
    4194:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    4198:	7c03           	moveq #3,d6
    419a:	bc84           	cmp.l d4,d6
    419c:	6c0e           	bge.s 41ac <memset+0xca>
		*ptr++ = val;
    419e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    41a2:	7204           	moveq #4,d1
    41a4:	b284           	cmp.l d4,d1
    41a6:	6c04           	bge.s 41ac <memset+0xca>
		*ptr++ = val;
    41a8:	1545 0005      	move.b d5,5(a2)
}
    41ac:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    41b0:	4e75           	rts

000041b2 <strlen>:
{
    41b2:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    41b6:	7000           	moveq #0,d0
	while(*s++)
    41b8:	4a10           	tst.b (a0)
    41ba:	6708           	beq.s 41c4 <strlen+0x12>
		t++;
    41bc:	5280           	addq.l #1,d0
	while(*s++)
    41be:	4a30 0800      	tst.b (0,a0,d0.l)
    41c2:	66f8           	bne.s 41bc <strlen+0xa>
}
    41c4:	4e75           	rts
    41c6:	4e71           	nop

000041c8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    41c8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    41cc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    41d0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    41d4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    41d8:	d041           	add.w d1,d0
	swap	d0
    41da:	4840           	swap d0
	clrw	d0
    41dc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    41de:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    41e2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    41e6:	d081           	add.l d1,d0

	rts
    41e8:	4e75           	rts

000041ea <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    41ea:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    41ec:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    41f0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    41f4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    41fa:	6416           	bcc.s 4212 <__udivsi3+0x28>
	movel	d0, d2
    41fc:	2400           	move.l d0,d2
	clrw	d2
    41fe:	4242           	clr.w d2
	swap	d2
    4200:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    4202:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4204:	3002           	move.w d2,d0
	swap	d0
    4206:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4208:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    420c:	84c1           	divu.w d1,d2
	movew	d2, d0
    420e:	3002           	move.w d2,d0
	jra	6f
    4210:	6030           	bra.s 4242 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4212:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4214:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4216:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4218:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    421e:	64f4           	bcc.s 4214 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4220:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    4222:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4228:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    422a:	c2c0           	mulu.w d0,d1
	swap	d2
    422c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    422e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4230:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    4232:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4234:	660a           	bne.s 4240 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4236:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4238:	6506           	bcs.s 4240 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    423a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    423e:	6302           	bls.s 4242 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4240:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    4242:	241f           	move.l (sp)+,d2
	rts
    4244:	4e75           	rts

00004246 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    4246:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4248:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    424a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    424e:	6a04           	bpl.s 4254 <__divsi3+0xe>
	negl	d1
    4250:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    4252:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4254:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4258:	6a04           	bpl.s 425e <__divsi3+0x18>
	negl	d0
    425a:	4480           	neg.l d0
	negb	d2
    425c:	4402           	neg.b d2

2:	movel	d1, sp@-
    425e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4260:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    4262:	6186           	bsr.s 41ea <__udivsi3>
	addql	IMM (8), sp
    4264:	508f           	addq.l #8,sp

	tstb	d2
    4266:	4a02           	tst.b d2
	jpl	3f
    4268:	6a02           	bpl.s 426c <__divsi3+0x26>
	negl	d0
    426a:	4480           	neg.l d0

3:	movel	sp@+, d2
    426c:	241f           	move.l (sp)+,d2
	rts
    426e:	4e75           	rts

00004270 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4270:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4274:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4278:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    427a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    427c:	61c8           	bsr.s 4246 <__divsi3>
	addql	IMM (8), sp
    427e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4280:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4284:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4286:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4288:	6100 ff3e      	bsr.w 41c8 <__mulsi3>
	addql	IMM (8), sp
    428c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    428e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4292:	9280           	sub.l d0,d1
	movel	d1, d0
    4294:	2001           	move.l d1,d0
	rts
    4296:	4e75           	rts

00004298 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4298:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    429c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    42a0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    42a2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    42a4:	6100 ff44      	bsr.w 41ea <__udivsi3>
	addql	IMM (8), sp
    42a8:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    42aa:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    42ae:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    42b0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    42b2:	6100 ff14      	bsr.w 41c8 <__mulsi3>
	addql	IMM (8), sp
    42b6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    42b8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    42bc:	9280           	sub.l d0,d1
	movel	d1, d0
    42be:	2001           	move.l d1,d0
	rts
    42c0:	4e75           	rts

000042c2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    42c2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    42c4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    42c8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    42cc:	2c5f           	movea.l (sp)+,a6
    rts
    42ce:	4e75           	rts

000042d0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    42d0:	16c0           	move.b d0,(a3)+
	rts
    42d2:	4e75           	rts

000042d4 <saveregs>:
	...

00004310 <font2distance>:
    4310:	0505           	btst d2,d5
    4312:	0505           	btst d2,d5
    4314:	0505           	btst d2,d5
    4316:	0505           	btst d2,d5
    4318:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    431a:	0505           	btst d2,d5
    431c:	0505           	btst d2,d5
    431e:	0005 0505      	ori.b #5,d5
    4322:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4324:	0505           	btst d2,d5
    4326:	0505           	btst d2,d5
    4328:	0505           	btst d2,d5
    432a:	0505           	btst d2,d5
    432c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    432e:	0505           	btst d2,d5
    4330:	0505           	btst d2,d5
    4332:	0505           	btst d2,d5
    4334:	0505           	btst d2,d5
    4336:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4338:	0500           	btst d2,d0
    433a:	0505           	btst d2,d5
    433c:	0505           	btst d2,d5
    433e:	0505           	btst d2,d5
    4340:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    4342:	0505           	btst d2,d5
    4344:	0505           	btst d2,d5
    4346:	0505           	btst d2,d5
    4348:	0505           	btst d2,d5
    434a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    434c:	0505           	btst d2,d5
    434e:	0505           	btst d2,d5
    4350:	0503           	btst d2,d3
    4352:	0505           	btst d2,d5
    4354:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    4356:	0505           	btst d2,d5
    4358:	0500           	btst d2,d0
    435a:	0505           	btst d2,d5
    435c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4360:	0505           	btst d2,d5
    4362:	0503           	btst d2,d3
    4364:	0205 0507      	andi.b #7,d5
    4368:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    436a:	0505           	btst d2,d5
    436c:	0505           	btst d2,d5
    436e:	0505           	btst d2,d5
    4370:	0505           	btst d2,d5
    4372:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4374:	0505           	btst d2,d5
    4376:	0505           	btst d2,d5
    4378:	0505           	btst d2,d5
    437a:	0505           	btst d2,d5
    437c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    437e:	0505           	btst d2,d5
    4380:	0505           	btst d2,d5
    4382:	0505           	btst d2,d5
    4384:	0505           	btst d2,d5
    4386:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4388:	0505           	btst d2,d5
    438a:	0505           	btst d2,d5
    438c:	0505           	btst d2,d5
    438e:	0505           	btst d2,d5
    4390:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4392:	0505           	btst d2,d5
    4394:	0505           	btst d2,d5
    4396:	0505           	btst d2,d5
    4398:	0505           	btst d2,d5
    439a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    439c:	0505           	btst d2,d5
    439e:	0505           	btst d2,d5
    43a0:	0505           	btst d2,d5
    43a2:	0505           	btst d2,d5
    43a4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43a6:	0505           	btst d2,d5
    43a8:	0505           	btst d2,d5
    43aa:	0505           	btst d2,d5
    43ac:	0505           	btst d2,d5
    43ae:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43b0:	0505           	btst d2,d5
    43b2:	0505           	btst d2,d5
    43b4:	0505           	btst d2,d5
    43b6:	0505           	btst d2,d5
    43b8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43ba:	0505           	btst d2,d5
    43bc:	0505           	btst d2,d5
    43be:	0505           	btst d2,d5
    43c0:	0505           	btst d2,d5
    43c2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43c4:	0505           	btst d2,d5
    43c6:	0505           	btst d2,d5
    43c8:	0505           	btst d2,d5
    43ca:	0505           	btst d2,d5
    43cc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43ce:	0505           	btst d2,d5
    43d0:	0505           	btst d2,d5
    43d2:	0505           	btst d2,d5
    43d4:	0505           	btst d2,d5
    43d6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43d8:	0505           	btst d2,d5
    43da:	0505           	btst d2,d5
    43dc:	0505           	btst d2,d5
    43de:	0505           	btst d2,d5
    43e0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43e2:	0505           	btst d2,d5
    43e4:	0505           	btst d2,d5
    43e6:	0505           	btst d2,d5
    43e8:	0505           	btst d2,d5
    43ea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43ec:	0505           	btst d2,d5
    43ee:	0505           	btst d2,d5
    43f0:	0505           	btst d2,d5
    43f2:	0505           	btst d2,d5
    43f4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43f6:	0505           	btst d2,d5
    43f8:	0505           	btst d2,d5
    43fa:	0505           	btst d2,d5
    43fc:	0505           	btst d2,d5
    43fe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4400:	0505           	btst d2,d5
    4402:	0505           	btst d2,d5
    4404:	0505           	btst d2,d5
    4406:	0505           	btst d2,d5
    4408:	0505           	btst d2,d5

0000440a <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    440a:	16c0           	move.b d0,(a3)+
  RTS
    440c:	4e75           	rts

0000440e <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    440e:	48f9 7fff 0000 	movem.l d0-a6,42d4 <saveregs>
    4414:	42d4 
  lea 0xdff000,a5
    4416:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb5a8>,a5
  move.l sp@(4),a0  //Fontlocation
    441c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4420:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4424:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4428:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    442a:	082d 0006 0002 	btst #6,2(a5)

00004430 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4430:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    4436:	66f8           	bne.s 4430 <st2wblit>

00004438 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4438:	7019           	moveq #25,d0
	sub.l d5,d5      
    443a:	9a85           	sub.l d5,d5

0000443c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    443c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    443e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4440:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4444:	9dce           	suba.l a6,a6
	move.l d2, a6
    4446:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4448:	ddfc 0000 4310 	adda.l #17168,a6

	LSL  	#4,d2 	    //Fetch next char
    444e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4450:	2842           	movea.l d2,a4


	move.l  #0,d4
    4452:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    4454:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    4456:	3814           	move.w (a4),d4
	swap	d4
    4458:	4844           	swap d4
	lsr.l	d5, d4
    445a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    445c:	8993           	or.l d4,(a3)
	clr.l	d4
    445e:	4284           	clr.l d4
	move.w  2(a4), d4
    4460:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4464:	4844           	swap d4
	lsr.l	d5, d4
    4466:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4468:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    446c:	4284           	clr.l d4
	move.w  4(a4), d4
    446e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    4472:	4844           	swap d4
	lsr.l	d5, d4
    4474:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4476:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    447a:	4284           	clr.l d4
	move.w  6(a4), d4
    447c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4480:	4844           	swap d4
	lsr.l	d5, d4
    4482:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4484:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4488:	4284           	clr.l d4
	move.w  8(a4), d4
    448a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    448e:	4844           	swap d4
	lsr.l	d5, d4
    4490:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    4492:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4496:	4284           	clr.l d4
	move.w  10(a4), d4
    4498:	382c 000a      	move.w 10(a4),d4
	swap	d4
    449c:	4844           	swap d4
	lsr.l	d5, d4
    449e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    44a0:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    44a4:	4284           	clr.l d4
	move.w  12(a4), d4
    44a6:	382c 000c      	move.w 12(a4),d4
	swap	d4
    44aa:	4844           	swap d4
	lsr.l	d5, d4
    44ac:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    44ae:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    44b2:	4284           	clr.l d4
	move.w  14(a4), d4
    44b4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    44b8:	4844           	swap d4
	lsr.l	d5, d4
    44ba:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    44bc:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    44c0:	4284           	clr.l d4

	add.b   (a6), d5
    44c2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    44c4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    44c8:	6500 0006      	bcs.w 44d0 <noadditionalchar>
	addq.w  #1, a3
    44cc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    44ce:	5145           	subq.w #8,d5

000044d0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    44d0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    44d2:	51c8 ff68      	dbf d0,443c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    44d6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    44da:	51cb ff5c      	dbf d3,4438 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    44de:	4cfa 7fff fdf2 	movem.l 42d4 <saveregs>(pc),d0-a6

	RTS
    44e4:	4e75           	rts
