
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
      12:	23ce 0000 7636 	move.l a6,7636 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,760a <hw>
      1e:	0000 760a 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 4b99 	lea 4b99 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 760e 	move.l d0,760e <GfxBase>
	if (!GfxBase)
      34:	6700 2de6      	beq.w 2e1c <main+0x2e16>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
      3e:	43f9 0000 4baa 	lea 4baa <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 7632 	move.l d0,7632 <DOSBase>
	if (!DOSBase)
      50:	6700 2dbe      	beq.w 2e10 <main+0x2e0a>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 4bb6 	pea 4bb6 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 3000 	jsr 3000 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 4bd2 	move.l #19410,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
      84:	7232           	moveq #50,d1
      86:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      8a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
      90:	4eae ffc4      	jsr -60(a6)
      94:	2079 0000 760a 	movea.l 760a <hw>,a0
      9a:	2628 0080      	move.l 128(a0),d3
      9e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
      a4:	2200           	move.l d0,d1
      a6:	243c 0000 4be2 	move.l #19426,d2
      ac:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      b0:	47f9 0000 3372 	lea 3372 <ClBuild>,a3
      b6:	4e93           	jsr (a3)
      b8:	2440           	movea.l d0,a2
      ba:	23c0 0000 762e 	move.l d0,762e <Copperlist1>
  DrawCopper = Copperlist1;
      c0:	23c0 0000 761e 	move.l d0,761e <DrawCopper>
  Copperlist2 = ClBuild();
      c6:	4e93           	jsr (a3)
      c8:	23c0 0000 762a 	move.l d0,762a <Copperlist2>
  ViewCopper = Copperlist2;
      ce:	23c0 0000 7612 	move.l d0,7612 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d4:	588f           	addq.l #4,sp
      d6:	2039 0000 7570 	move.l 7570 <ClsSprites>,d0
      dc:	b092           	cmp.l (a2),d0
      de:	6600 26aa      	bne.w 278a <main+0x2784>
      e2:	2079 0000 7574 	movea.l 7574 <ClsSprites+0x4>,a0
      e8:	b1ea 0004      	cmpa.l 4(a2),a0
      ec:	6600 269c      	bne.w 278a <main+0x2784>
      f0:	2039 0000 7578 	move.l 7578 <ClsSprites+0x8>,d0
      f6:	b0aa 0008      	cmp.l 8(a2),d0
      fa:	6600 268e      	bne.w 278a <main+0x2784>
      fe:	2079 0000 757c 	movea.l 757c <ClsSprites+0xc>,a0
     104:	b1ea 000c      	cmpa.l 12(a2),a0
     108:	6600 2680      	bne.w 278a <main+0x2784>
     10c:	202a 0010      	move.l 16(a2),d0
     110:	b0b9 0000 7580 	cmp.l 7580 <ClsSprites+0x10>,d0
     116:	6600 2672      	bne.w 278a <main+0x2784>
     11a:	2079 0000 7584 	movea.l 7584 <ClsSprites+0x14>,a0
     120:	b1ea 0014      	cmpa.l 20(a2),a0
     124:	6600 2664      	bne.w 278a <main+0x2784>
     128:	2039 0000 7588 	move.l 7588 <ClsSprites+0x18>,d0
     12e:	b0aa 0018      	cmp.l 24(a2),d0
     132:	6600 2656      	bne.w 278a <main+0x2784>
     136:	2079 0000 758c 	movea.l 758c <ClsSprites+0x1c>,a0
     13c:	b1ea 001c      	cmpa.l 28(a2),a0
     140:	6600 2648      	bne.w 278a <main+0x2784>
     144:	2039 0000 7590 	move.l 7590 <ClsSprites+0x20>,d0
     14a:	b0aa 0020      	cmp.l 32(a2),d0
     14e:	6600 263a      	bne.w 278a <main+0x2784>
     152:	206a 0024      	movea.l 36(a2),a0
     156:	b1f9 0000 7594 	cmpa.l 7594 <ClsSprites+0x24>,a0
     15c:	6600 262c      	bne.w 278a <main+0x2784>
     160:	2039 0000 7598 	move.l 7598 <ClsSprites+0x28>,d0
     166:	b0aa 0028      	cmp.l 40(a2),d0
     16a:	6600 261e      	bne.w 278a <main+0x2784>
     16e:	2079 0000 759c 	movea.l 759c <ClsSprites+0x2c>,a0
     174:	b1ea 002c      	cmpa.l 44(a2),a0
     178:	6600 2610      	bne.w 278a <main+0x2784>
     17c:	2039 0000 75a0 	move.l 75a0 <ClsSprites+0x30>,d0
     182:	b0aa 0030      	cmp.l 48(a2),d0
     186:	6600 2602      	bne.w 278a <main+0x2784>
     18a:	2079 0000 75a4 	movea.l 75a4 <ClsSprites+0x34>,a0
     190:	b1ea 0034      	cmpa.l 52(a2),a0
     194:	6600 25f4      	bne.w 278a <main+0x2784>
     198:	2039 0000 75a8 	move.l 75a8 <ClsSprites+0x38>,d0
     19e:	b0aa 0038      	cmp.l 56(a2),d0
     1a2:	6600 25e6      	bne.w 278a <main+0x2784>
     1a6:	246a 003c      	movea.l 60(a2),a2
     1aa:	b5f9 0000 75ac 	cmpa.l 75ac <ClsSprites+0x3c>,a2
     1b0:	6600 25d8      	bne.w 278a <main+0x2784>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b4:	2079 0000 762e 	movea.l 762e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ba:	2039 0000 7540 	move.l 7540 <ClScreen>,d0
     1c0:	b0a8 0040      	cmp.l 64(a0),d0
     1c4:	6600 260e      	bne.w 27d4 <main+0x27ce>
     1c8:	2039 0000 7544 	move.l 7544 <ClScreen+0x4>,d0
     1ce:	b0a8 0044      	cmp.l 68(a0),d0
     1d2:	6600 2600      	bne.w 27d4 <main+0x27ce>
     1d6:	2039 0000 7548 	move.l 7548 <ClScreen+0x8>,d0
     1dc:	b0a8 0048      	cmp.l 72(a0),d0
     1e0:	6600 25f2      	bne.w 27d4 <main+0x27ce>
     1e4:	2039 0000 754c 	move.l 754c <ClScreen+0xc>,d0
     1ea:	b0a8 004c      	cmp.l 76(a0),d0
     1ee:	6600 25e4      	bne.w 27d4 <main+0x27ce>
     1f2:	2039 0000 7550 	move.l 7550 <ClScreen+0x10>,d0
     1f8:	b0a8 0050      	cmp.l 80(a0),d0
     1fc:	6600 25d6      	bne.w 27d4 <main+0x27ce>
     200:	2039 0000 7554 	move.l 7554 <ClScreen+0x14>,d0
     206:	b0a8 0054      	cmp.l 84(a0),d0
     20a:	6600 25c8      	bne.w 27d4 <main+0x27ce>
     20e:	2039 0000 7558 	move.l 7558 <ClScreen+0x18>,d0
     214:	b0a8 0058      	cmp.l 88(a0),d0
     218:	6600 25ba      	bne.w 27d4 <main+0x27ce>
     21c:	2039 0000 755c 	move.l 755c <ClScreen+0x1c>,d0
     222:	b0a8 005c      	cmp.l 92(a0),d0
     226:	6600 25ac      	bne.w 27d4 <main+0x27ce>
     22a:	2039 0000 7560 	move.l 7560 <ClScreen+0x20>,d0
     230:	b0a8 0060      	cmp.l 96(a0),d0
     234:	6600 259e      	bne.w 27d4 <main+0x27ce>
     238:	2028 0064      	move.l 100(a0),d0
     23c:	b0b9 0000 7564 	cmp.l 7564 <ClScreen+0x24>,d0
     242:	6600 2590      	bne.w 27d4 <main+0x27ce>
     246:	2039 0000 7568 	move.l 7568 <ClScreen+0x28>,d0
     24c:	b0a8 0068      	cmp.l 104(a0),d0
     250:	6600 2582      	bne.w 27d4 <main+0x27ce>
     254:	2068 006c      	movea.l 108(a0),a0
     258:	b1f9 0000 756c 	cmpa.l 756c <ClScreen+0x2c>,a0
     25e:	6600 2574      	bne.w 27d4 <main+0x27ce>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     262:	23fc 0004 0000 	move.l #262144,7622 <DrawBuffer>
     268:	0000 7622 
  ViewBuffer = (ULONG *)0x50000;
     26c:	23fc 0005 0000 	move.l #327680,7616 <ViewBuffer>
     272:	0000 7616 
  SetBplPointers();
     276:	45f9 0000 3e1e 	lea 3e1e <SetBplPointers>,a2
     27c:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27e:	0cb9 0005 0000 	cmpi.l #327680,7622 <DrawBuffer>
     284:	0000 7622 
     288:	6700 2b56      	beq.w 2de0 <main+0x2dda>
    Write( Output(), 
     28c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     292:	4eae ffc4      	jsr -60(a6)
     296:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     29c:	2200           	move.l d0,d1
     29e:	243c 0000 4be5 	move.l #19429,d2
     2a4:	763b           	moveq #59,d3
     2a6:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2aa:	2079 0000 762e 	movea.l 762e <Copperlist1>,a0
     2b0:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b6:	0070 
     2b8:	6724           	beq.s 2de <main+0x2d8>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ba:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     2c0:	4eae ffc4      	jsr -60(a6)
     2c4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     2ca:	2200           	move.l d0,d1
     2cc:	243c 0000 4c21 	move.l #19489,d2
     2d2:	763c           	moveq #60,d3
     2d4:	4eae ffd0      	jsr -48(a6)
     2d8:	2079 0000 762e 	movea.l 762e <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2de:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e4:	0074 
     2e6:	6724           	beq.s 30c <main+0x306>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e8:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     2ee:	4eae ffc4      	jsr -60(a6)
     2f2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     2f8:	2200           	move.l d0,d1
     2fa:	243c 0000 4c5e 	move.l #19550,d2
     300:	763c           	moveq #60,d3
     302:	4eae ffd0      	jsr -48(a6)
     306:	2079 0000 762e 	movea.l 762e <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30c:	2028 0078      	move.l 120(a0),d0
     310:	b0b9 0000 7538 	cmp.l 7538 <ClColor>,d0
     316:	6600 2494      	bne.w 27ac <main+0x27a6>
     31a:	2028 007c      	move.l 124(a0),d0
     31e:	b0b9 0000 753c 	cmp.l 753c <ClColor+0x4>,d0
     324:	6600 2486      	bne.w 27ac <main+0x27a6>
  if( instructions[pos] == value ) 
     328:	70fe           	moveq #-2,d0
     32a:	b0a8 0080      	cmp.l 128(a0),d0
     32e:	671e           	beq.s 34e <main+0x348>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     330:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     336:	4eae ffc4      	jsr -60(a6)
     33a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     340:	2200           	move.l d0,d1
     342:	243c 0000 4cbd 	move.l #19645,d2
     348:	7622           	moveq #34,d3
     34a:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34e:	47f9 0000 3c16 	lea 3c16 <SwapCl>,a3
     354:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     356:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
     35c:	b1f9 0000 762a 	cmpa.l 762a <Copperlist2>,a0
     362:	671e           	beq.s 382 <main+0x37c>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     364:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     36a:	4eae ffc4      	jsr -60(a6)
     36e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     374:	2200           	move.l d0,d1
     376:	243c 0000 4ce0 	move.l #19680,d2
     37c:	7615           	moveq #21,d3
     37e:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     382:	49f9 0000 3e4a 	lea 3e4a <PrepareDisplay>,a4
     388:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     38a:	2039 0000 7622 	move.l 7622 <DrawBuffer>,d0
     390:	b0b9 0000 7626 	cmp.l 7626 <Bitplane1>,d0
     396:	671e           	beq.s 3b6 <main+0x3b0>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     398:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     39e:	4eae ffc4      	jsr -60(a6)
     3a2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     3a8:	2200           	move.l d0,d1
     3aa:	243c 0000 4cf6 	move.l #19702,d2
     3b0:	7637           	moveq #55,d3
     3b2:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3b6:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
     3bc:	b1f9 0000 762e 	cmpa.l 762e <Copperlist1>,a0
     3c2:	671e           	beq.s 3e2 <main+0x3dc>
    Write( Output(), 
     3c4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     3ca:	4eae ffc4      	jsr -60(a6)
     3ce:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     3d4:	2200           	move.l d0,d1
     3d6:	243c 0000 4d2e 	move.l #19758,d2
     3dc:	7639           	moveq #57,d3
     3de:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3e2:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3e4:	2039 0000 7616 	move.l 7616 <ViewBuffer>,d0
     3ea:	b0b9 0000 761a 	cmp.l 761a <Bitplane2>,d0
     3f0:	671e           	beq.s 410 <main+0x40a>
    Write( Output(), 
     3f2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     3f8:	4eae ffc4      	jsr -60(a6)
     3fc:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     402:	2200           	move.l d0,d1
     404:	243c 0000 4d68 	move.l #19816,d2
     40a:	7638           	moveq #56,d3
     40c:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     410:	2079 0000 7612 	movea.l 7612 <ViewCopper>,a0
     416:	b1f9 0000 762a 	cmpa.l 762a <Copperlist2>,a0
     41c:	671e           	beq.s 43c <main+0x436>
    Write( Output(), 
     41e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     424:	4eae ffc4      	jsr -60(a6)
     428:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     42e:	2200           	move.l d0,d1
     430:	243c 0000 4da1 	move.l #19873,d2
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
     440:	2079 0000 7612 	movea.l 7612 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     446:	7000           	moveq #0,d0
     448:	3028 0072      	move.w 114(a0),d0
     44c:	4840           	swap d0
     44e:	4240           	clr.w d0
     450:	7200           	moveq #0,d1
     452:	3228 0076      	move.w 118(a0),d1
     456:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     458:	b0b9 0000 761a 	cmp.l 761a <Bitplane2>,d0
     45e:	671e           	beq.s 47e <main+0x478>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     460:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     466:	4eae ffc4      	jsr -60(a6)
     46a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     470:	2200           	move.l d0,d1
     472:	243c 0000 4ddc 	move.l #19932,d2
     478:	7648           	moveq #72,d3
     47a:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     47e:	4e93           	jsr (a3)
  SetBplPointers();
     480:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     482:	2079 0000 7612 	movea.l 7612 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     488:	7000           	moveq #0,d0
     48a:	3028 0072      	move.w 114(a0),d0
     48e:	4840           	swap d0
     490:	4240           	clr.w d0
     492:	7200           	moveq #0,d1
     494:	3228 0076      	move.w 118(a0),d1
     498:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49a:	b0b9 0000 7626 	cmp.l 7626 <Bitplane1>,d0
     4a0:	671e           	beq.s 4c0 <main+0x4ba>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     4a8:	4eae ffc4      	jsr -60(a6)
     4ac:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     4b2:	2200           	move.l d0,d1
     4b4:	243c 0000 4e25 	move.l #20005,d2
     4ba:	7649           	moveq #73,d3
     4bc:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4c0:	4e93           	jsr (a3)
  SetBplPointers();
     4c2:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4c4:	2079 0000 7612 	movea.l 7612 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4ca:	7000           	moveq #0,d0
     4cc:	3028 0072      	move.w 114(a0),d0
     4d0:	4840           	swap d0
     4d2:	4240           	clr.w d0
     4d4:	7200           	moveq #0,d1
     4d6:	3228 0076      	move.w 118(a0),d1
     4da:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4dc:	b0b9 0000 761a 	cmp.l 761a <Bitplane2>,d0
     4e2:	671e           	beq.s 502 <main+0x4fc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     4ea:	4eae ffc4      	jsr -60(a6)
     4ee:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     4f4:	2200           	move.l d0,d1
     4f6:	243c 0000 4e6f 	move.l #20079,d2
     4fc:	7648           	moveq #72,d3
     4fe:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     502:	2f3c 0000 c800 	move.l #51200,-(sp)
     508:	4878 0084      	pea 84 <main+0x7e>
     50c:	4eb9 0000 3f88 	jsr 3f88 <FreeDisplay>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     512:	45f9 0000 3c3c 	lea 3c3c <PrepareDisplayZoom>,a2
     518:	4e92           	jsr (a2)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     51a:	4878 0010      	pea 10 <main+0xa>
     51e:	4879 0000 7570 	pea 7570 <ClsSprites>
     524:	42a7           	clr.l -(sp)
     526:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     52c:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
     532:	4fef 0018      	lea 24(sp),sp
     536:	4a80           	tst.l d0
     538:	661e           	bne.s 558 <main+0x552>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     53a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     540:	4eae ffc4      	jsr -60(a6)
     544:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     54a:	2200           	move.l d0,d1
     54c:	243c 0000 4eb8 	move.l #20152,d2
     552:	762c           	moveq #44,d3
     554:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     558:	4878 000c      	pea c <main+0x6>
     55c:	4879 0000 7508 	pea 7508 <ClScreenZoom>
     562:	4878 0010      	pea 10 <main+0xa>
     566:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     56c:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
     572:	4fef 0010      	lea 16(sp),sp
     576:	4a80           	tst.l d0
     578:	661e           	bne.s 598 <main+0x592>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     57a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     580:	4eae ffc4      	jsr -60(a6)
     584:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     58a:	2200           	move.l d0,d1
     58c:	243c 0000 4eee 	move.l #20206,d2
     592:	7636           	moveq #54,d3
     594:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     598:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
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
     5b4:	23fc 0005 0000 	move.l #327680,7622 <DrawBuffer>
     5ba:	0000 7622 
  ViewBuffer = (ULONG *) tmp;
     5be:	23fc 0004 0000 	move.l #262144,7616 <ViewBuffer>
     5c4:	0000 7616 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     5c8:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     5ce:	4878 001c      	pea 1c <main+0x16>
     5d2:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     5d8:	4eb9 0000 317e 	jsr 317e <TestCopperlistPos>
     5de:	4fef 000c      	lea 12(sp),sp
     5e2:	4a80           	tst.l d0
     5e4:	661e           	bne.s 604 <main+0x5fe>
    Write(Output(), 
     5e6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     5ec:	4eae ffc4      	jsr -60(a6)
     5f0:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     5f6:	2200           	move.l d0,d1
     5f8:	243c 0000 4c21 	move.l #19489,d2
     5fe:	763c           	moveq #60,d3
     600:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     604:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     60a:	4878 001d      	pea 1d <main+0x17>
     60e:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     614:	4eb9 0000 317e 	jsr 317e <TestCopperlistPos>
     61a:	4fef 000c      	lea 12(sp),sp
     61e:	4a80           	tst.l d0
     620:	661e           	bne.s 640 <main+0x63a>
    Write(Output(), 
     622:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     628:	4eae ffc4      	jsr -60(a6)
     62c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     632:	2200           	move.l d0,d1
     634:	243c 0000 4c5e 	move.l #19550,d2
     63a:	763c           	moveq #60,d3
     63c:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     640:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     646:	4878 001e      	pea 1e <main+0x18>
     64a:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     650:	4eb9 0000 317e 	jsr 317e <TestCopperlistPos>
     656:	4fef 000c      	lea 12(sp),sp
     65a:	4a80           	tst.l d0
     65c:	661e           	bne.s 67c <main+0x676>
    Write(Output(), 
     65e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     664:	4eae ffc4      	jsr -60(a6)
     668:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     66e:	2200           	move.l d0,d1
     670:	243c 0000 4f25 	move.l #20261,d2
     676:	763c           	moveq #60,d3
     678:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     67c:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     682:	4878 001f      	pea 1f <main+0x19>
     686:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     68c:	4eb9 0000 317e 	jsr 317e <TestCopperlistPos>
     692:	4fef 000c      	lea 12(sp),sp
     696:	4a80           	tst.l d0
     698:	661e           	bne.s 6b8 <main+0x6b2>
    Write(Output(), 
     69a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     6a0:	4eae ffc4      	jsr -60(a6)
     6a4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     6aa:	2200           	move.l d0,d1
     6ac:	243c 0000 4f62 	move.l #20322,d2
     6b2:	763c           	moveq #60,d3
     6b4:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     6b8:	4878 0002      	pea 2 <_start+0x2>
     6bc:	4879 0000 7538 	pea 7538 <ClColor>
     6c2:	4878 0020      	pea 20 <main+0x1a>
     6c6:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     6cc:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
     6d2:	4fef 0010      	lea 16(sp),sp
     6d6:	4a80           	tst.l d0
     6d8:	661e           	bne.s 6f8 <main+0x6f2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6da:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     6e0:	4eae ffc4      	jsr -60(a6)
     6e4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     6ea:	2200           	move.l d0,d1
     6ec:	243c 0000 4c9b 	move.l #19611,d2
     6f2:	7621           	moveq #33,d3
     6f4:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     6f8:	4878 0040      	pea 40 <main+0x3a>
     6fc:	4879 0000 51ae 	pea 51ae <incbin_swfont_end+0x728>
     702:	486d ffc0      	pea -64(a5)
     706:	4eb9 0000 4040 	jsr 4040 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     70c:	4878 0010      	pea 10 <main+0xa>
     710:	486d ffc0      	pea -64(a5)
     714:	4878 0022      	pea 22 <main+0x1c>
     718:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     71e:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
     724:	4fef 001c      	lea 28(sp),sp
     728:	4a80           	tst.l d0
     72a:	661e           	bne.s 74a <main+0x744>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     72c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     732:	4eae ffc4      	jsr -60(a6)
     736:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     73c:	2200           	move.l d0,d1
     73e:	243c 0000 4f9f 	move.l #20383,d2
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
     76e:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     774:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
     77a:	4fef 0010      	lea 16(sp),sp
     77e:	4a80           	tst.l d0
     780:	661e           	bne.s 7a0 <main+0x79a>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     782:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     788:	4eae ffc4      	jsr -60(a6)
     78c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     792:	2200           	move.l d0,d1
     794:	243c 0000 4fc1 	move.l #20417,d2
     79a:	762c           	moveq #44,d3
     79c:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     7a0:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc521>
     7a4:	4878 2922      	pea 2922 <main+0x291c>
     7a8:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
     7ae:	4eb9 0000 317e 	jsr 317e <TestCopperlistPos>
     7b4:	4fef 000c      	lea 12(sp),sp
     7b8:	4a80           	tst.l d0
     7ba:	661e           	bne.s 7da <main+0x7d4>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     7bc:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     7c2:	4eae ffc4      	jsr -60(a6)
     7c6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     7cc:	2200           	move.l d0,d1
     7ce:	243c 0000 4cbd 	move.l #19645,d2
     7d4:	7622           	moveq #34,d3
     7d6:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     7da:	2f3c 0001 6800 	move.l #92160,-(sp)
     7e0:	2f3c 0000 a48c 	move.l #42124,-(sp)
     7e6:	4eb9 0000 3f88 	jsr 3f88 <FreeDisplay>

}

void TestBlitleftOfZoom() {
  Zoom_Init();
     7ec:	47f9 0000 3bfa 	lea 3bfa <Zoom_Init>,a3
     7f2:	4e93           	jsr (a3)
  PrepareDisplayZoom();
     7f4:	4e92           	jsr (a2)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     7f6:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     7fc:	203c 0000 c800 	move.l #51200,d0
     802:	7202           	moveq #2,d1
     804:	4eae ff3a      	jsr -198(a6)
     808:	2040           	movea.l d0,a0
     80a:	23c0 0000 75f0 	move.l d0,75f0 <Zoom_Source>
  if( Zoom_Source == 0) {
     810:	508f           	addq.l #8,sp
     812:	6700 268c      	beq.w 2ea0 <main+0x2e9a>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     816:	4250           	clr.w (a0)
  *tstsource = 0x0080;
     818:	317c 0080 0002 	move.w #128,2(a0)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     81e:	317c 1000 0030 	move.w #4096,48(a0)
  tstsource++;
  *tstsource = 0x8e88;
     824:	317c 8e88 0032 	move.w #-29048,50(a0)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     82a:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
     82e:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
     834:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     83a:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     83e:	2079 0000 760a 	movea.l 760a <hw>,a0
     844:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     84a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     850:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     856:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     85c:	317c 002c 0066 	move.w #44,102(a0)
  WaitBlit();
     862:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     868:	4eae ff1c      	jsr -228(a6)
    ZoomBlit_Increment4SrcA = 1;
     86c:	33fc 0001 0000 	move.w #1,7606 <ZoomBlit_Increment4SrcA>
     872:	7606 
  hw->bltcon1 = shiftb; 
     874:	2479 0000 760a 	movea.l 760a <hw>,a2
     87a:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
     880:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     886:	357c ff00 0070 	move.w #-256,112(a2)
  Init_Blit();
  Init_ZoomBlit( 7, 16, 0);
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
     88c:	2639 0000 7622 	move.l 7622 <DrawBuffer>,d3
     892:	2439 0000 75f0 	move.l 75f0 <Zoom_Source>,d2
  WaitBlt();
     898:	4eb9 0000 35d0 	jsr 35d0 <WaitBlt>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     89e:	2002           	move.l d2,d0
     8a0:	5480           	addq.l #2,d0
     8a2:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
     8a6:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
     8aa:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
     8ae:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
     8b4:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     8ba:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     8be:	2479 0000 7622 	movea.l 7622 <DrawBuffer>,a2
  if( *destination != 0x0180) {
     8c4:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     8ca:	671e           	beq.s 8ea <main+0x8e4>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     8cc:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     8d2:	4eae ffc4      	jsr -60(a6)
     8d6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     8dc:	2200           	move.l d0,d1
     8de:	243c 0000 5026 	move.l #20518,d2
     8e4:	761c           	moveq #28,d3
     8e6:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     8ea:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     8f0:	671e           	beq.s 910 <main+0x90a>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     8f2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     8f8:	4eae ffc4      	jsr -60(a6)
     8fc:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     902:	2200           	move.l d0,d1
     904:	243c 0000 5043 	move.l #20547,d2
     90a:	761c           	moveq #28,d3
     90c:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     910:	2079 0000 7622 	movea.l 7622 <DrawBuffer>,a0
     916:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     91c:	671e           	beq.s 93c <main+0x936>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     91e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     924:	4eae ffc4      	jsr -60(a6)
     928:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     92e:	2200           	move.l d0,d1
     930:	243c 0000 5060 	move.l #20576,d2
     936:	761a           	moveq #26,d3
     938:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     93c:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     942:	2279 0000 75f0 	movea.l 75f0 <Zoom_Source>,a1
     948:	203c 0000 c800 	move.l #51200,d0
     94e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     952:	2f3c 0001 6800 	move.l #92160,-(sp)
     958:	2f3c 0000 a48c 	move.l #42124,-(sp)
     95e:	4eb9 0000 3f88 	jsr 3f88 <FreeDisplay>
     964:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     966:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     96c:	203c 0000 05a0 	move.l #1440,d0
     972:	7202           	moveq #2,d1
     974:	4eae ff3a      	jsr -198(a6)
     978:	2440           	movea.l d0,a2
  if( source == 0) {
     97a:	4a80           	tst.l d0
     97c:	6700 24c8      	beq.w 2e46 <main+0x2e40>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     980:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     986:	203c 0000 05a0 	move.l #1440,d0
     98c:	7202           	moveq #2,d1
     98e:	4eae ff3a      	jsr -198(a6)
     992:	2840           	movea.l d0,a4
  if( destination == 0) {
     994:	4a80           	tst.l d0
     996:	6700 24ae      	beq.w 2e46 <main+0x2e40>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     99a:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     99c:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     9a2:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     9a8:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     9ac:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     9b0:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     9b6:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     9bc:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     9c0:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     9c4:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     9ca:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     9d0:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     9d4:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     9d8:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     9de:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     9e4:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     9e8:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     9ec:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     9f2:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     9f8:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     9fc:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     a00:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     a06:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     a0c:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     a10:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     a14:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     a1a:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     a20:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     a24:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     a28:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     a2e:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     a34:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     a38:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     a3c:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     a42:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     a48:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     a4c:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     a50:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     a56:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     a5c:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     a60:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     a64:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     a6a:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     a70:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     a74:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     a78:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     a7e:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     a84:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     a88:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     a8c:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     a92:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     a98:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     a9c:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     aa0:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     aa6:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     aac:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     ab0:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     ab4:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     aba:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     ac0:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     ac4:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     ac8:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     ace:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     ad4:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     ad8:	4878 05a0      	pea 5a0 <main+0x59a>
     adc:	42a7           	clr.l -(sp)
     ade:	2f00           	move.l d0,-(sp)
     ae0:	4eb9 0000 40d2 	jsr 40d2 <memset>
  tmp = destination;
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  WaitBlit();
     ae6:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     aec:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
     af0:	4e93           	jsr (a3)
  WaitBlit();
     af2:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     af8:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     afc:	2679 0000 760a 	movea.l 760a <hw>,a3
     b02:	377c 39f0 0040 	move.w #14832,64(a3)
  hw->bltcon1 = 0;
     b08:	377c 0000 0042 	move.w #0,66(a3)
  WaitBlt();
     b0e:	4eb9 0000 35d0 	jsr 35d0 <WaitBlt>
  hw->bltapt = (UWORD *) source;
     b14:	200a           	move.l a2,d0
     b16:	5480           	addq.l #2,d0
     b18:	2740 0050      	move.l d0,80(a3)
  hw->bltdpt = (UWORD *) destination;
     b1c:	274c 0054      	move.l a4,84(a3)
  hw->bltsize = height*64+2;
     b20:	377c 0402 0058 	move.w #1026,88(a3)
  Init_Copy( 3);
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
  WaitBlit();
     b26:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     b2c:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     b30:	4fef 000c      	lea 12(sp),sp
     b34:	0c6c 5555 0002 	cmpi.w #21845,2(a4)
     b3a:	671e           	beq.s b5a <main+0xb54>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     b3c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     b42:	4eae ffc4      	jsr -60(a6)
     b46:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     b4c:	2200           	move.l d0,d1
     b4e:	243c 0000 50b1 	move.l #20657,d2
     b54:	761f           	moveq #31,d3
     b56:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     b5a:	0c6c aaaa 0032 	cmpi.w #-21846,50(a4)
     b60:	671e           	beq.s b80 <main+0xb7a>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     b62:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     b68:	4eae ffc4      	jsr -60(a6)
     b6c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
     b72:	2200           	move.l d0,d1
     b74:	243c 0000 50d1 	move.l #20689,d2
     b7a:	7620           	moveq #32,d3
     b7c:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     b80:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     b86:	224a           	movea.l a2,a1
     b88:	203c 0000 05a0 	move.l #1440,d0
     b8e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     b92:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     b98:	224c           	movea.l a4,a1
     b9a:	203c 0000 05a0 	move.l #1440,d0
     ba0:	4eae ff2e      	jsr -210(a6)
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */

void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     ba4:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     baa:	203c 0000 3740 	move.l #14144,d0
     bb0:	7202           	moveq #2,d1
     bb2:	4eae ff3a      	jsr -198(a6)
     bb6:	2840           	movea.l d0,a4
  if( source == 0) {
     bb8:	4a80           	tst.l d0
     bba:	6700 22c2      	beq.w 2e7e <main+0x2e78>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     bbe:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
     bc4:	203c 0000 3740 	move.l #14144,d0
     bca:	7202           	moveq #2,d1
     bcc:	4eae ff3a      	jsr -198(a6)
     bd0:	2640           	movea.l d0,a3
  if( destination == 0) {
     bd2:	4a80           	tst.l d0
     bd4:	6700 2316      	beq.w 2eec <main+0x2ee6>
     bd8:	200c           	move.l a4,d0
     bda:	0680 0000 3300 	addi.l #13056,d0
     be0:	204c           	movea.l a4,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     be2:	20bc 5555 5555 	move.l #1431655765,(a0)
     be8:	217c 5555 5555 	move.l #1431655765,4(a0)
     bee:	0004 
     bf0:	217c 5555 5555 	move.l #1431655765,8(a0)
     bf6:	0008 
     bf8:	217c 5555 5555 	move.l #1431655765,12(a0)
     bfe:	000c 
     c00:	217c 5555 5555 	move.l #1431655765,16(a0)
     c06:	0010 
     c08:	217c 5555 5555 	move.l #1431655765,20(a0)
     c0e:	0014 
     c10:	217c 5555 5555 	move.l #1431655765,24(a0)
     c16:	0018 
     c18:	217c 5555 5555 	move.l #1431655765,28(a0)
     c1e:	001c 
     c20:	217c 5555 5555 	move.l #1431655765,32(a0)
     c26:	0020 
     c28:	217c 5555 5555 	move.l #1431655765,36(a0)
     c2e:	0024 
     c30:	217c 5555 5555 	move.l #1431655765,40(a0)
     c36:	0028 
     c38:	217c 5555 5555 	move.l #1431655765,44(a0)
     c3e:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     c40:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     c46:	0030 
     c48:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     c4e:	0034 
     c50:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     c56:	0038 
     c58:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     c5e:	003c 
     c60:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     c66:	0040 
     c68:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     c6e:	0044 
     c70:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     c76:	0048 
     c78:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     c7e:	004c 
     c80:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     c86:	0050 
     c88:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     c8e:	0054 
     c90:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     c96:	0058 
     c98:	41e8 0060      	lea 96(a0),a0
     c9c:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     ca2:	fffc 
  for(int i=0;i<128+8;i++) {
     ca4:	b1c0           	cmpa.l d0,a0
     ca6:	6600 ff3a      	bne.w be2 <main+0xbdc>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
     caa:	42a7           	clr.l -(sp)
     cac:	2f0b           	move.l a3,-(sp)
     cae:	2f0c           	move.l a4,-(sp)
     cb0:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
     cb6:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     cbc:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     cc0:	41eb 0004      	lea 4(a3),a0
     cc4:	2b48 ff7c      	move.l a0,-132(a5)
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0xffff;
  for(int i=0;i<14;i++) {
     cc8:	41eb 0364      	lea 868(a3),a0
     ccc:	2b48 ff78      	move.l a0,-136(a5)
     cd0:	2a08           	move.l a0,d5
     cd2:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     cd6:	3c7c 0012      	movea.w #18,a6
  UWORD mask = 0xffff;
     cda:	74ff           	moveq #-1,d2
     cdc:	7600           	moveq #0,d3
     cde:	4643           	not.w d3
     ce0:	45f9 0000 3068 	lea 3068 <TestRow>,a2
     ce6:	280b           	move.l a3,d4
     ce8:	2045           	movea.l d5,a0
     cea:	41e8 fca0      	lea -864(a0),a0
     cee:	2b48 ff6c      	move.l a0,-148(a5)
     cf2:	47ee ffee      	lea -18(a6),a3
    for(int i2=0;i2<18;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*19);
     cf6:	2f0b           	move.l a3,-(sp)
     cf8:	2f03           	move.l d3,-(sp)
     cfa:	2f2d ff6c      	move.l -148(a5),-(sp)
     cfe:	4879 0000 74dc 	pea 74dc <destlinezoom1>
     d04:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     d06:	7030           	moveq #48,d0
     d08:	d1ad ff6c      	add.l d0,-148(a5)
      mask = mask ^ 0xffff;
     d0c:	4642           	not.w d2
     d0e:	528b           	addq.l #1,a3
    for(int i2=0;i2<18;i2++) { 
     d10:	4fef 0010      	lea 16(sp),sp
     d14:	baad ff6c      	cmp.l -148(a5),d5
     d18:	6600 1b06      	bne.w 2820 <main+0x281a>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
     d1c:	2f0e           	move.l a6,-(sp)
     d1e:	7600           	moveq #0,d3
     d20:	3602           	move.w d2,d3
     d22:	2f03           	move.l d3,-(sp)
     d24:	2f2d ff6c      	move.l -148(a5),-(sp)
     d28:	4879 0000 74dc 	pea 74dc <destlinezoom1>
     d2e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     d30:	2a2d ff6c      	move.l -148(a5),d5
     d34:	0685 0000 0390 	addi.l #912,d5
     d3a:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<14;i++) {
     d3e:	4fef 0010      	lea 16(sp),sp
     d42:	bcfc 011c      	cmpa.w #284,a6
     d46:	66a0           	bne.s ce8 <main+0xce2>
     d48:	2644           	movea.l d4,a3
     d4a:	41eb 31e4      	lea 12772(a3),a0
     d4e:	2b48 ff70      	move.l a0,-144(a5)
     d52:	2b48 ff6c      	move.l a0,-148(a5)
     d56:	283c 0000 0109 	move.l #265,d4
  }

  for(int i2=0;i2<4;i2++) { 
    TestRow( valsupposed, valactual, mask, i2+265);
     d5c:	2f04           	move.l d4,-(sp)
     d5e:	2f03           	move.l d3,-(sp)
     d60:	2f2d ff6c      	move.l -148(a5),-(sp)
     d64:	4879 0000 74dc 	pea 74dc <destlinezoom1>
     d6a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     d6c:	7030           	moveq #48,d0
     d6e:	d1ad ff6c      	add.l d0,-148(a5)
    mask = mask ^ 0xffff;
     d72:	4642           	not.w d2
     d74:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
     d76:	4fef 0010      	lea 16(sp),sp
     d7a:	0c84 0000 010d 	cmpi.l #269,d4
     d80:	672a           	beq.s dac <main+0xda6>
     d82:	7600           	moveq #0,d3
     d84:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
     d86:	2f04           	move.l d4,-(sp)
     d88:	2f03           	move.l d3,-(sp)
     d8a:	2f2d ff6c      	move.l -148(a5),-(sp)
     d8e:	4879 0000 74dc 	pea 74dc <destlinezoom1>
     d94:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     d96:	7030           	moveq #48,d0
     d98:	d1ad ff6c      	add.l d0,-148(a5)
    mask = mask ^ 0xffff;
     d9c:	4642           	not.w d2
     d9e:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
     da0:	4fef 0010      	lea 16(sp),sp
     da4:	0c84 0000 010d 	cmpi.l #269,d4
     daa:	66d6           	bne.s d82 <main+0xd7c>
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1);
     dac:	4878 0001      	pea 1 <_start+0x1>
     db0:	2f0c           	move.l a4,-(sp)
     db2:	2f0b           	move.l a3,-(sp)
     db4:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
     dba:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     dc0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
     dc4:	41ec 0004      	lea 4(a4),a0
     dc8:	2b48 ff6c      	move.l a0,-148(a5)
     dcc:	4fef 000c      	lea 12(sp),sp
     dd0:	2b48 ff74      	move.l a0,-140(a5)
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<11;i2++) { 
     dd4:	7600           	moveq #0,d3
  mask = 0x0000;
     dd6:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
     dd8:	2f03           	move.l d3,-(sp)
     dda:	3f02           	move.w d2,-(sp)
     ddc:	4267           	clr.w -(sp)
     dde:	2f2d ff74      	move.l -140(a5),-(sp)
     de2:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     de8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     dea:	7030           	moveq #48,d0
     dec:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     df0:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
     df2:	5283           	addq.l #1,d3
     df4:	4fef 0010      	lea 16(sp),sp
     df8:	700b           	moveq #11,d0
     dfa:	b083           	cmp.l d3,d0
     dfc:	66da           	bne.s dd8 <main+0xdd2>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
     dfe:	4878 0008      	pea 8 <main+0x2>
     e02:	2f3c 0000 ffff 	move.l #65535,-(sp)
     e08:	41ec 0214      	lea 532(a4),a0
     e0c:	2b48 ff94      	move.l a0,-108(a5)
     e10:	2f08           	move.l a0,-(sp)
     e12:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     e18:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
     e1a:	4878 0009      	pea 9 <main+0x3>
     e1e:	2f3c 0000 ffff 	move.l #65535,-(sp)
     e24:	486c 0244      	pea 580(a4)
     e28:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     e2e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
     e30:	4fef 0020      	lea 32(sp),sp
     e34:	4878 000a      	pea a <main+0x4>
     e38:	42a7           	clr.l -(sp)
     e3a:	486c 0274      	pea 628(a4)
     e3e:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     e44:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
     e46:	4878 000b      	pea b <main+0x5>
     e4a:	42a7           	clr.l -(sp)
     e4c:	486c 02a4      	pea 676(a4)
     e50:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     e56:	4e92           	jsr (a2)

  valactual += ZMLINESIZE/2;
  for(int i=0;i<12;i++) {
     e58:	2a0c           	move.l a4,d5
     e5a:	0685 0000 05d4 	addi.l #1492,d5
     e60:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
     e64:	2c05           	move.l d5,d6
     e66:	3c7c 0018      	movea.w #24,a6
     e6a:	7800           	moveq #0,d4
     e6c:	3802           	move.w d2,d4
     e6e:	2e0b           	move.l a3,d7
     e70:	2046           	movea.l d6,a0
     e72:	41e8 fd00      	lea -768(a0),a0
     e76:	2b48 ff74      	move.l a0,-140(a5)
     e7a:	47ee fff3      	lea -13(a6),a3
     e7e:	2604           	move.l d4,d3
    for(int i2=0;i2<16;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
     e80:	2f0b           	move.l a3,-(sp)
     e82:	2f03           	move.l d3,-(sp)
     e84:	2f2d ff74      	move.l -140(a5),-(sp)
     e88:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     e8e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     e90:	7030           	moveq #48,d0
     e92:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
     e96:	4642           	not.w d2
     e98:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
     e9a:	4fef 0010      	lea 16(sp),sp
     e9e:	bcad ff74      	cmp.l -140(a5),d6
     ea2:	6728           	beq.s ecc <main+0xec6>
     ea4:	7600           	moveq #0,d3
     ea6:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
     ea8:	2f0b           	move.l a3,-(sp)
     eaa:	2f03           	move.l d3,-(sp)
     eac:	2f2d ff74      	move.l -140(a5),-(sp)
     eb0:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     eb6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     eb8:	7030           	moveq #48,d0
     eba:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
     ebe:	4642           	not.w d2
     ec0:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
     ec2:	4fef 0010      	lea 16(sp),sp
     ec6:	bcad ff74      	cmp.l -140(a5),d6
     eca:	66d8           	bne.s ea4 <main+0xe9e>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
     ecc:	7800           	moveq #0,d4
     ece:	3802           	move.w d2,d4
     ed0:	2f0e           	move.l a6,-(sp)
     ed2:	2f04           	move.l d4,-(sp)
     ed4:	2f2d ff74      	move.l -140(a5),-(sp)
     ed8:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     ede:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
     ee0:	486e 0001      	pea 1(a6)
     ee4:	2f04           	move.l d4,-(sp)
     ee6:	206d ff74      	movea.l -140(a5),a0
     eea:	4868 0030      	pea 48(a0)
     eee:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     ef4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
     ef6:	4fef 0020      	lea 32(sp),sp
     efa:	486e 0002      	pea 2(a6)
     efe:	2f03           	move.l d3,-(sp)
     f00:	206d ff74      	movea.l -140(a5),a0
     f04:	4868 0060      	pea 96(a0)
     f08:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     f0e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
     f10:	486e 0003      	pea 3(a6)
     f14:	2f03           	move.l d3,-(sp)
     f16:	206d ff74      	movea.l -140(a5),a0
     f1a:	4868 0090      	pea 144(a0)
     f1e:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     f24:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
     f26:	2c2d ff74      	move.l -140(a5),d6
     f2a:	0686 0000 03c0 	addi.l #960,d6
     f30:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<12;i++) {
     f34:	4fef 0020      	lea 32(sp),sp
     f38:	bcfc 00e4      	cmpa.w #228,a6
     f3c:	6600 ff32      	bne.w e70 <main+0xe6a>
     f40:	2647           	movea.l d7,a3
     f42:	41ec 2fd4      	lea 12244(a4),a0
     f46:	2b48 ffa4      	move.l a0,-92(a5)
     f4a:	2b48 ff74      	move.l a0,-140(a5)
    
  }

  for(int i2=0;i2<15;i2++) { 
     f4e:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
     f50:	2f03           	move.l d3,-(sp)
     f52:	2f04           	move.l d4,-(sp)
     f54:	2f2d ff74      	move.l -140(a5),-(sp)
     f58:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     f5e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     f60:	7030           	moveq #48,d0
     f62:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     f66:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
     f68:	5283           	addq.l #1,d3
     f6a:	4fef 0010      	lea 16(sp),sp
     f6e:	700f           	moveq #15,d0
     f70:	b083           	cmp.l d3,d0
     f72:	6728           	beq.s f9c <main+0xf96>
     f74:	7800           	moveq #0,d4
     f76:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2);
     f78:	2f03           	move.l d3,-(sp)
     f7a:	2f04           	move.l d4,-(sp)
     f7c:	2f2d ff74      	move.l -140(a5),-(sp)
     f80:	4879 0000 74b0 	pea 74b0 <destlinezoom2>
     f86:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     f88:	7030           	moveq #48,d0
     f8a:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     f8e:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
     f90:	5283           	addq.l #1,d3
     f92:	4fef 0010      	lea 16(sp),sp
     f96:	700f           	moveq #15,d0
     f98:	b083           	cmp.l d3,d0
     f9a:	66d8           	bne.s f74 <main+0xf6e>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
     f9c:	4878 0002      	pea 2 <_start+0x2>
     fa0:	2f0b           	move.l a3,-(sp)
     fa2:	2f0c           	move.l a4,-(sp)
     fa4:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
     faa:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
     fb0:	4eae ff1c      	jsr -228(a6)
     fb4:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
     fb8:	2b6d ff7c ff74 	move.l -132(a5),-140(a5)
  valsupposed = destlinezoom3;
  mask = 0xffff;

  for(int i2=0;i2<4;i2++) { 
     fbe:	7400           	moveq #0,d2
  mask = 0xffff;
     fc0:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
     fc2:	2f02           	move.l d2,-(sp)
     fc4:	3f03           	move.w d3,-(sp)
     fc6:	4267           	clr.w -(sp)
     fc8:	2f2d ff74      	move.l -140(a5),-(sp)
     fcc:	4879 0000 7484 	pea 7484 <destlinezoom3>
     fd2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
     fd4:	7030           	moveq #48,d0
     fd6:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
     fda:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
     fdc:	5282           	addq.l #1,d2
     fde:	4fef 0010      	lea 16(sp),sp
     fe2:	7004           	moveq #4,d0
     fe4:	b082           	cmp.l d2,d0
     fe6:	66da           	bne.s fc2 <main+0xfbc>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
     fe8:	4878 0004      	pea 4 <_start+0x4>
     fec:	2f3c 0000 ffff 	move.l #65535,-(sp)
     ff2:	486b 00c4      	pea 196(a3)
     ff6:	4879 0000 7484 	pea 7484 <destlinezoom3>
     ffc:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+4);
     ffe:	4878 0005      	pea 5 <_start+0x5>
    1002:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1008:	486b 00f4      	pea 244(a3)
    100c:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1012:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    1014:	4fef 0020      	lea 32(sp),sp
    1018:	4878 0006      	pea 6 <main>
    101c:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    101e:	41eb 0124      	lea 292(a3),a0
    1022:	2b48 ffa8      	move.l a0,-88(a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    1026:	2f08           	move.l a0,-(sp)
    1028:	4879 0000 7484 	pea 7484 <destlinezoom3>
    102e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    1030:	4878 0007      	pea 7 <main+0x1>
    1034:	42a7           	clr.l -(sp)
    1036:	486b 0154      	pea 340(a3)
    103a:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1040:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    1042:	4fef 0020      	lea 32(sp),sp
    1046:	4878 0008      	pea 8 <main+0x2>
    104a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1050:	486b 0184      	pea 388(a3)
    1054:	4879 0000 7484 	pea 7484 <destlinezoom3>
    105a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    105c:	4878 0009      	pea 9 <main+0x3>
    1060:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1066:	486b 01b4      	pea 436(a3)
    106a:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1070:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;

  mask = 0x0000;
  for(int i=0;i<12;i++) {
    1072:	2c0b           	move.l a3,d6
    1074:	0686 0000 04b4 	addi.l #1204,d6
    107a:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    107e:	3c7c 0018      	movea.w #24,a6
    1082:	7800           	moveq #0,d4
    1084:	74ff           	moveq #-1,d2
    1086:	2e0b           	move.l a3,d7
    1088:	2046           	movea.l d6,a0
    108a:	41e8 fd30      	lea -720(a0),a0
    108e:	2b48 ff74      	move.l a0,-140(a5)
    1092:	47ee fff1      	lea -15(a6),a3
    for(int i2=0;i2<15;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    1096:	2f0b           	move.l a3,-(sp)
    1098:	2f04           	move.l d4,-(sp)
    109a:	2f2d ff74      	move.l -140(a5),-(sp)
    109e:	4879 0000 7484 	pea 7484 <destlinezoom3>
    10a4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    10a6:	7030           	moveq #48,d0
    10a8:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
    10ac:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    10ae:	4fef 0010      	lea 16(sp),sp
    10b2:	bcad ff74      	cmp.l -140(a5),d6
    10b6:	6728           	beq.s 10e0 <main+0x10da>
    10b8:	7800           	moveq #0,d4
    10ba:	3802           	move.w d2,d4
    10bc:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    10be:	2f0b           	move.l a3,-(sp)
    10c0:	2f04           	move.l d4,-(sp)
    10c2:	2f2d ff74      	move.l -140(a5),-(sp)
    10c6:	4879 0000 7484 	pea 7484 <destlinezoom3>
    10cc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    10ce:	7030           	moveq #48,d0
    10d0:	d1ad ff74      	add.l d0,-140(a5)
      mask = mask ^ 0xffff;
    10d4:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    10d6:	4fef 0010      	lea 16(sp),sp
    10da:	bcad ff74      	cmp.l -140(a5),d6
    10de:	66d8           	bne.s 10b8 <main+0x10b2>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    10e0:	7600           	moveq #0,d3
    10e2:	3602           	move.w d2,d3
    10e4:	2f0e           	move.l a6,-(sp)
    10e6:	2f03           	move.l d3,-(sp)
    10e8:	2f2d ff74      	move.l -140(a5),-(sp)
    10ec:	4879 0000 7484 	pea 7484 <destlinezoom3>
    10f2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    10f4:	486e 0001      	pea 1(a6)
    10f8:	2f03           	move.l d3,-(sp)
    10fa:	206d ff74      	movea.l -140(a5),a0
    10fe:	4868 0030      	pea 48(a0)
    1102:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1108:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    110a:	4fef 0020      	lea 32(sp),sp
    110e:	486e 0002      	pea 2(a6)
    1112:	2f04           	move.l d4,-(sp)
    1114:	206d ff74      	movea.l -140(a5),a0
    1118:	4868 0060      	pea 96(a0)
    111c:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1122:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    1124:	486e 0003      	pea 3(a6)
    1128:	2f04           	move.l d4,-(sp)
    112a:	206d ff74      	movea.l -140(a5),a0
    112e:	4868 0090      	pea 144(a0)
    1132:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1138:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    113a:	4fef 0020      	lea 32(sp),sp
    113e:	486e 0004      	pea 4(a6)
    1142:	2f03           	move.l d3,-(sp)
    1144:	206d ff74      	movea.l -140(a5),a0
    1148:	4868 00c0      	pea 192(a0)
    114c:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1152:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1154:	486e 0005      	pea 5(a6)
    1158:	2f03           	move.l d3,-(sp)
    115a:	206d ff74      	movea.l -140(a5),a0
    115e:	4868 00f0      	pea 240(a0)
    1162:	4879 0000 7484 	pea 7484 <destlinezoom3>
    1168:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    116a:	2c2d ff74      	move.l -140(a5),d6
    116e:	0686 0000 03f0 	addi.l #1008,d6
    1174:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    1178:	4fef 0020      	lea 32(sp),sp
    117c:	bcfc 0114      	cmpa.w #276,a6
    1180:	6600 ff06      	bne.w 1088 <main+0x1082>
    1184:	2647           	movea.l d7,a3
    1186:	41eb 3124      	lea 12580(a3),a0
    118a:	2b48 ff74      	move.l a0,-140(a5)
    118e:	263c 0000 0105 	move.l #261,d3
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    1194:	2f03           	move.l d3,-(sp)
    1196:	2f04           	move.l d4,-(sp)
    1198:	2f2d ff74      	move.l -140(a5),-(sp)
    119c:	4879 0000 7484 	pea 7484 <destlinezoom3>
    11a2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    11a4:	7030           	moveq #48,d0
    11a6:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
    11aa:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    11ac:	4fef 0010      	lea 16(sp),sp
    11b0:	0c83 0000 010d 	cmpi.l #269,d3
    11b6:	672a           	beq.s 11e2 <main+0x11dc>
    11b8:	7800           	moveq #0,d4
    11ba:	3802           	move.w d2,d4
    11bc:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    11be:	2f03           	move.l d3,-(sp)
    11c0:	2f04           	move.l d4,-(sp)
    11c2:	2f2d ff74      	move.l -140(a5),-(sp)
    11c6:	4879 0000 7484 	pea 7484 <destlinezoom3>
    11cc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    11ce:	7030           	moveq #48,d0
    11d0:	d1ad ff74      	add.l d0,-140(a5)
    mask = mask ^ 0xffff;
    11d4:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    11d6:	4fef 0010      	lea 16(sp),sp
    11da:	0c83 0000 010d 	cmpi.l #269,d3
    11e0:	66d6           	bne.s 11b8 <main+0x11b2>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 3);
    11e2:	4878 0003      	pea 3 <_start+0x3>
    11e6:	2f0c           	move.l a4,-(sp)
    11e8:	2f0b           	move.l a3,-(sp)
    11ea:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    11f0:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    11f6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    11fa:	4878 0007      	pea 7 <main+0x1>
    11fe:	42a7           	clr.l -(sp)
    1200:	2f2d ff6c      	move.l -148(a5),-(sp)
    1204:	4879 0000 7458 	pea 7458 <destlinezoom4>
    120a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    120c:	41ec 0034      	lea 52(a4),a0
    1210:	2b48 ff80      	move.l a0,-128(a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    1214:	4878 0008      	pea 8 <main+0x2>
    1218:	2f3c 0000 ffff 	move.l #65535,-(sp)
    121e:	2f08           	move.l a0,-(sp)
    1220:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1226:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1228:	41ec 0064      	lea 100(a4),a0
    122c:	2b48 ff90      	move.l a0,-112(a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    1230:	4fef 002c      	lea 44(sp),sp
    1234:	4878 0009      	pea 9 <main+0x3>
    1238:	2f3c 0000 ffff 	move.l #65535,-(sp)
    123e:	2f08           	move.l a0,-(sp)
    1240:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1246:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1248:	41ec 0094      	lea 148(a4),a0
    124c:	2b48 ff74      	move.l a0,-140(a5)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    1250:	4878 0008      	pea 8 <main+0x2>
    1254:	42a7           	clr.l -(sp)
    1256:	2f08           	move.l a0,-(sp)
    1258:	4879 0000 7458 	pea 7458 <destlinezoom4>
    125e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    1260:	4fef 0020      	lea 32(sp),sp
    1264:	4878 0009      	pea 9 <main+0x3>
    1268:	42a7           	clr.l -(sp)
    126a:	486c 00c4      	pea 196(a4)
    126e:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1274:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1276:	41ec 00f4      	lea 244(a4),a0
    127a:	2b48 ff84      	move.l a0,-124(a5)

  mask = 0xffff;
  for(int i=0;i<12;i++) {
    127e:	2c0c           	move.l a4,d6
    1280:	0686 0000 0394 	addi.l #916,d6
    1286:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    128a:	3c7c 0018      	movea.w #24,a6
  mask = 0xffff;
    128e:	78ff           	moveq #-1,d4
    1290:	7400           	moveq #0,d2
    1292:	4642           	not.w d2
    1294:	2e0b           	move.l a3,d7
    1296:	2046           	movea.l d6,a0
    1298:	41e8 fd60      	lea -672(a0),a0
    129c:	2b48 ff88      	move.l a0,-120(a5)
    12a0:	47ee fff1      	lea -15(a6),a3
    12a4:	2602           	move.l d2,d3
    for(int i2=0;i2<14;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    12a6:	2f0b           	move.l a3,-(sp)
    12a8:	2f03           	move.l d3,-(sp)
    12aa:	2f2d ff88      	move.l -120(a5),-(sp)
    12ae:	4879 0000 7458 	pea 7458 <destlinezoom4>
    12b4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    12b6:	7030           	moveq #48,d0
    12b8:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    12bc:	4644           	not.w d4
    12be:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    12c0:	4fef 0010      	lea 16(sp),sp
    12c4:	bcad ff88      	cmp.l -120(a5),d6
    12c8:	6728           	beq.s 12f2 <main+0x12ec>
    12ca:	7600           	moveq #0,d3
    12cc:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    12ce:	2f0b           	move.l a3,-(sp)
    12d0:	2f03           	move.l d3,-(sp)
    12d2:	2f2d ff88      	move.l -120(a5),-(sp)
    12d6:	4879 0000 7458 	pea 7458 <destlinezoom4>
    12dc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    12de:	7030           	moveq #48,d0
    12e0:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    12e4:	4644           	not.w d4
    12e6:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    12e8:	4fef 0010      	lea 16(sp),sp
    12ec:	bcad ff88      	cmp.l -120(a5),d6
    12f0:	66d8           	bne.s 12ca <main+0x12c4>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    12f2:	7400           	moveq #0,d2
    12f4:	3404           	move.w d4,d2
    12f6:	2f0e           	move.l a6,-(sp)
    12f8:	2f02           	move.l d2,-(sp)
    12fa:	2f2d ff88      	move.l -120(a5),-(sp)
    12fe:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1304:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    1306:	486e 0001      	pea 1(a6)
    130a:	2f02           	move.l d2,-(sp)
    130c:	206d ff88      	movea.l -120(a5),a0
    1310:	4868 0030      	pea 48(a0)
    1314:	4879 0000 7458 	pea 7458 <destlinezoom4>
    131a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    131c:	4fef 0020      	lea 32(sp),sp
    1320:	486e 0002      	pea 2(a6)
    1324:	2f03           	move.l d3,-(sp)
    1326:	206d ff88      	movea.l -120(a5),a0
    132a:	4868 0060      	pea 96(a0)
    132e:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1334:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    1336:	486e 0003      	pea 3(a6)
    133a:	2f03           	move.l d3,-(sp)
    133c:	206d ff88      	movea.l -120(a5),a0
    1340:	4868 0090      	pea 144(a0)
    1344:	4879 0000 7458 	pea 7458 <destlinezoom4>
    134a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    134c:	47ee 0004      	lea 4(a6),a3
    1350:	4fef 001c      	lea 28(sp),sp
    1354:	2e8b           	move.l a3,(sp)
    1356:	2f02           	move.l d2,-(sp)
    1358:	206d ff88      	movea.l -120(a5),a0
    135c:	4868 00c0      	pea 192(a0)
    1360:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1366:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1368:	2c0e           	move.l a6,d6
    136a:	5a86           	addq.l #5,d6
    136c:	2f06           	move.l d6,-(sp)
    136e:	2f02           	move.l d2,-(sp)
    1370:	206d ff88      	movea.l -120(a5),a0
    1374:	4868 00f0      	pea 240(a0)
    1378:	4879 0000 7458 	pea 7458 <destlinezoom4>
    137e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    1380:	4fef 001c      	lea 28(sp),sp
    1384:	2e8b           	move.l a3,(sp)
    1386:	2f03           	move.l d3,-(sp)
    1388:	206d ff88      	movea.l -120(a5),a0
    138c:	4868 0120      	pea 288(a0)
    1390:	4879 0000 7458 	pea 7458 <destlinezoom4>
    1396:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1398:	2f06           	move.l d6,-(sp)
    139a:	2f03           	move.l d3,-(sp)
    139c:	206d ff88      	movea.l -120(a5),a0
    13a0:	4868 0150      	pea 336(a0)
    13a4:	4879 0000 7458 	pea 7458 <destlinezoom4>
    13aa:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    13ac:	2c2d ff88      	move.l -120(a5),d6
    13b0:	0686 0000 0420 	addi.l #1056,d6
    13b6:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    13ba:	4fef 0020      	lea 32(sp),sp
    13be:	bcfc 0114      	cmpa.w #276,a6
    13c2:	6600 fed2      	bne.w 1296 <main+0x1290>
    13c6:	2647           	movea.l d7,a3
  }

  TestRow( valsupposed, valactual, mask, 269);
    13c8:	4878 010d      	pea 10d <main+0x107>
    13cc:	2f02           	move.l d2,-(sp)
    13ce:	486c 3274      	pea 12916(a4)
    13d2:	4879 0000 7458 	pea 7458 <destlinezoom4>
    13d8:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 4);
    13da:	4878 0004      	pea 4 <_start+0x4>
    13de:	2f07           	move.l d7,-(sp)
    13e0:	2f0c           	move.l a4,-(sp)
    13e2:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    13e8:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    13ee:	4eae ff1c      	jsr -228(a6)
    13f2:	4fef 001c      	lea 28(sp),sp

  valactual = destination+2; 
    13f6:	2c6d ff7c      	movea.l -132(a5),a6
  valsupposed = destlinezoom5;
  mask = 0x0000;

  for(int i2=0;i2<13;i2++) {  
    13fa:	42ad ff88      	clr.l -120(a5)
  mask = 0x0000;
    13fe:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    1400:	7400           	moveq #0,d2
    1402:	3404           	move.w d4,d2
    1404:	2f2d ff88      	move.l -120(a5),-(sp)
    1408:	2f02           	move.l d2,-(sp)
    140a:	2f0e           	move.l a6,-(sp)
    140c:	4879 0000 742c 	pea 742c <destlinezoom5>
    1412:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1414:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1418:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    141a:	52ad ff88      	addq.l #1,-120(a5)
    141e:	4fef 0010      	lea 16(sp),sp
    1422:	700d           	moveq #13,d0
    1424:	b0ad ff88      	cmp.l -120(a5),d0
    1428:	66d6           	bne.s 1400 <main+0x13fa>
    142a:	7600           	moveq #0,d3
    142c:	3604           	move.w d4,d3
  }

  TestRow( valsupposed, valactual, mask, 12);   
    142e:	4878 000c      	pea c <main+0x6>
    1432:	2f03           	move.l d3,-(sp)
    1434:	486b 0274      	pea 628(a3)
    1438:	4879 0000 742c 	pea 742c <destlinezoom5>
    143e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 13);
    1440:	4878 000d      	pea d <main+0x7>
    1444:	2f03           	move.l d3,-(sp)
    1446:	486b 02a4      	pea 676(a3)
    144a:	4879 0000 742c 	pea 742c <destlinezoom5>
    1450:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14);
    1452:	4fef 0020      	lea 32(sp),sp
    1456:	4878 000e      	pea e <main+0x8>
    145a:	2f02           	move.l d2,-(sp)
    145c:	486b 02d4      	pea 724(a3)
    1460:	4879 0000 742c 	pea 742c <destlinezoom5>
    1466:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 15);
    1468:	4878 000f      	pea f <main+0x9>
    146c:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    146e:	41eb 0304      	lea 772(a3),a0
    1472:	2b48 ff8c      	move.l a0,-116(a5)
  TestRow( valsupposed, valactual, mask, 15);
    1476:	2f08           	move.l a0,-(sp)
    1478:	4879 0000 742c 	pea 742c <destlinezoom5>
    147e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 16);
    1480:	4fef 0020      	lea 32(sp),sp
    1484:	4878 0010      	pea 10 <main+0xa>
    1488:	2f03           	move.l d3,-(sp)
    148a:	486b 0334      	pea 820(a3)
    148e:	4879 0000 742c 	pea 742c <destlinezoom5>
    1494:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 17);
    1496:	4878 0011      	pea 11 <main+0xb>
    149a:	2f03           	move.l d3,-(sp)
    149c:	2f2d ff78      	move.l -136(a5),-(sp)
    14a0:	4879 0000 742c 	pea 742c <destlinezoom5>
    14a6:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 18);
    14a8:	4fef 0020      	lea 32(sp),sp
    14ac:	4878 0012      	pea 12 <main+0xc>
    14b0:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    14b2:	41eb 0394      	lea 916(a3),a0
    14b6:	2b48 ffa0      	move.l a0,-96(a5)
  TestRow( valsupposed, valactual, mask, 18);
    14ba:	2f08           	move.l a0,-(sp)
    14bc:	4879 0000 742c 	pea 742c <destlinezoom5>
    14c2:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 19);
    14c4:	4878 0013      	pea 13 <main+0xd>
    14c8:	2f02           	move.l d2,-(sp)
    14ca:	486b 03c4      	pea 964(a3)
    14ce:	4879 0000 742c 	pea 742c <destlinezoom5>
    14d4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 20);
    14d6:	4fef 0020      	lea 32(sp),sp
    14da:	4878 0014      	pea 14 <main+0xe>
    14de:	2f03           	move.l d3,-(sp)
    14e0:	486b 03f4      	pea 1012(a3)
    14e4:	4879 0000 742c 	pea 742c <destlinezoom5>
    14ea:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 21);
    14ec:	4878 0015      	pea 15 <main+0xf>
    14f0:	2f03           	move.l d3,-(sp)
    14f2:	486b 0424      	pea 1060(a3)
    14f6:	4879 0000 742c 	pea 742c <destlinezoom5>
    14fc:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;


  for(int i=0;i<10;i++) {
    14fe:	2c0b           	move.l a3,d6
    1500:	0686 0000 06c4 	addi.l #1732,d6
    1506:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    150a:	307c 0023      	movea.w #35,a0
    150e:	2b48 ff68      	move.l a0,-152(a5)
    1512:	2e0b           	move.l a3,d7
    1514:	2c46           	movea.l d6,a6
    1516:	4dee fd90      	lea -624(a6),a6
    151a:	367c fff3      	movea.w #-13,a3
    151e:	d7ed ff68      	adda.l -152(a5),a3
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    1522:	2f0b           	move.l a3,-(sp)
    1524:	2f02           	move.l d2,-(sp)
    1526:	2f0e           	move.l a6,-(sp)
    1528:	4879 0000 742c 	pea 742c <destlinezoom5>
    152e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1530:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1534:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1536:	4fef 0010      	lea 16(sp),sp
    153a:	bc8e           	cmp.l a6,d6
    153c:	6722           	beq.s 1560 <main+0x155a>
    153e:	7400           	moveq #0,d2
    1540:	3404           	move.w d4,d2
    1542:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    1544:	2f0b           	move.l a3,-(sp)
    1546:	2f02           	move.l d2,-(sp)
    1548:	2f0e           	move.l a6,-(sp)
    154a:	4879 0000 742c 	pea 742c <destlinezoom5>
    1550:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1552:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1556:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1558:	4fef 0010      	lea 16(sp),sp
    155c:	bc8e           	cmp.l a6,d6
    155e:	66de           	bne.s 153e <main+0x1538>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    1560:	7600           	moveq #0,d3
    1562:	3604           	move.w d4,d3
    1564:	2f2d ff68      	move.l -152(a5),-(sp)
    1568:	2f03           	move.l d3,-(sp)
    156a:	2f0e           	move.l a6,-(sp)
    156c:	4879 0000 742c 	pea 742c <destlinezoom5>
    1572:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    1574:	206d ff68      	movea.l -152(a5),a0
    1578:	4868 0001      	pea 1(a0)
    157c:	2f03           	move.l d3,-(sp)
    157e:	486e 0030      	pea 48(a6)
    1582:	4879 0000 742c 	pea 742c <destlinezoom5>
    1588:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    158a:	4fef 0020      	lea 32(sp),sp
    158e:	206d ff68      	movea.l -152(a5),a0
    1592:	4868 0002      	pea 2(a0)
    1596:	2f02           	move.l d2,-(sp)
    1598:	486e 0060      	pea 96(a6)
    159c:	4879 0000 742c 	pea 742c <destlinezoom5>
    15a2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    15a4:	206d ff68      	movea.l -152(a5),a0
    15a8:	4868 0003      	pea 3(a0)
    15ac:	2f02           	move.l d2,-(sp)
    15ae:	486e 0090      	pea 144(a6)
    15b2:	4879 0000 742c 	pea 742c <destlinezoom5>
    15b8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    15ba:	4fef 0020      	lea 32(sp),sp
    15be:	206d ff68      	movea.l -152(a5),a0
    15c2:	4868 0004      	pea 4(a0)
    15c6:	2f03           	move.l d3,-(sp)
    15c8:	486e 00c0      	pea 192(a6)
    15cc:	4879 0000 742c 	pea 742c <destlinezoom5>
    15d2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    15d4:	206d ff68      	movea.l -152(a5),a0
    15d8:	4868 0005      	pea 5(a0)
    15dc:	2f03           	move.l d3,-(sp)
    15de:	486e 00f0      	pea 240(a6)
    15e2:	4879 0000 742c 	pea 742c <destlinezoom5>
    15e8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    15ea:	4fef 0020      	lea 32(sp),sp
    15ee:	206d ff68      	movea.l -152(a5),a0
    15f2:	4868 0006      	pea 6(a0)
    15f6:	2f02           	move.l d2,-(sp)
    15f8:	486e 0120      	pea 288(a6)
    15fc:	4879 0000 742c 	pea 742c <destlinezoom5>
    1602:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    1604:	206d ff68      	movea.l -152(a5),a0
    1608:	4868 0007      	pea 7(a0)
    160c:	2f02           	move.l d2,-(sp)
    160e:	486e 0150      	pea 336(a6)
    1612:	4879 0000 742c 	pea 742c <destlinezoom5>
    1618:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    161a:	4fef 0020      	lea 32(sp),sp
    161e:	206d ff68      	movea.l -152(a5),a0
    1622:	4868 0008      	pea 8(a0)
    1626:	2f03           	move.l d3,-(sp)
    1628:	486e 0180      	pea 384(a6)
    162c:	4879 0000 742c 	pea 742c <destlinezoom5>
    1632:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    1634:	206d ff68      	movea.l -152(a5),a0
    1638:	4868 0009      	pea 9(a0)
    163c:	2f03           	move.l d3,-(sp)
    163e:	486e 01b0      	pea 432(a6)
    1642:	4879 0000 742c 	pea 742c <destlinezoom5>
    1648:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    164a:	2c0e           	move.l a6,d6
    164c:	0686 0000 0450 	addi.l #1104,d6
    1652:	7015           	moveq #21,d0
    1654:	d1ad ff68      	add.l d0,-152(a5)
  for(int i=0;i<10;i++) {
    1658:	4fef 0020      	lea 32(sp),sp
    165c:	0cad 0000 00f5 	cmpi.l #245,-152(a5)
    1662:	ff68 
    1664:	6600 feae      	bne.w 1514 <main+0x150e>
    1668:	2647           	movea.l d7,a3
    166a:	4deb 2f74      	lea 12148(a3),a6
    166e:	7c02           	moveq #2,d6
    1670:	4606           	not.b d6
  }

  for(int i2=0;i2<13;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+253);
    1672:	2f06           	move.l d6,-(sp)
    1674:	2f02           	move.l d2,-(sp)
    1676:	2f0e           	move.l a6,-(sp)
    1678:	4879 0000 742c 	pea 742c <destlinezoom5>
    167e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1680:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1684:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    1686:	4fef 0010      	lea 16(sp),sp
    168a:	0c86 0000 010a 	cmpi.l #266,d6
    1690:	6726           	beq.s 16b8 <main+0x16b2>
    1692:	7400           	moveq #0,d2
    1694:	3404           	move.w d4,d2
    1696:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    1698:	2f06           	move.l d6,-(sp)
    169a:	2f02           	move.l d2,-(sp)
    169c:	2f0e           	move.l a6,-(sp)
    169e:	4879 0000 742c 	pea 742c <destlinezoom5>
    16a4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    16a6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    16aa:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    16ac:	4fef 0010      	lea 16(sp),sp
    16b0:	0c86 0000 010a 	cmpi.l #266,d6
    16b6:	66da           	bne.s 1692 <main+0x168c>
    16b8:	0284 0000 ffff 	andi.l #65535,d4
  }

  TestRow( valsupposed, valactual, mask, 266);
    16be:	2f06           	move.l d6,-(sp)
    16c0:	2f04           	move.l d4,-(sp)
    16c2:	2f2d ff70      	move.l -144(a5),-(sp)
    16c6:	4879 0000 742c 	pea 742c <destlinezoom5>
    16cc:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 267);
    16ce:	4878 010b      	pea 10b <main+0x105>
    16d2:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    16d4:	41eb 3214      	lea 12820(a3),a0
    16d8:	2b48 ff98      	move.l a0,-104(a5)
  TestRow( valsupposed, valactual, mask, 267);
    16dc:	2f08           	move.l a0,-(sp)
    16de:	4879 0000 742c 	pea 742c <destlinezoom5>
    16e4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 268);
    16e6:	4fef 0020      	lea 32(sp),sp
    16ea:	4878 010c      	pea 10c <main+0x106>
    16ee:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    16f0:	41eb 3244      	lea 12868(a3),a0
    16f4:	2b48 ff9c      	move.l a0,-100(a5)
  TestRow( valsupposed, valactual, mask, 268);
    16f8:	2f08           	move.l a0,-(sp)
    16fa:	4879 0000 742c 	pea 742c <destlinezoom5>
    1700:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 269);
    1702:	4878 010d      	pea 10d <main+0x107>
    1706:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    1708:	41eb 3274      	lea 12916(a3),a0
    170c:	2b48 ff78      	move.l a0,-136(a5)
  TestRow( valsupposed, valactual, mask, 269);
    1710:	2f08           	move.l a0,-(sp)
    1712:	4879 0000 742c 	pea 742c <destlinezoom5>
    1718:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 5);
    171a:	4fef 0020      	lea 32(sp),sp
    171e:	4878 0005      	pea 5 <_start+0x5>
    1722:	2f0c           	move.l a4,-(sp)
    1724:	2f0b           	move.l a3,-(sp)
    1726:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    172c:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    1732:	4eae ff1c      	jsr -228(a6)
    1736:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    173a:	2c6d ff6c      	movea.l -148(a5),a6
  valsupposed = destlinezoom6;
  mask = 0x0000;
 
  for(int i2=0;i2<7;i2++) {  
    173e:	7400           	moveq #0,d2
  mask = 0x0000;
    1740:	4243           	clr.w d3
    TestRow( valsupposed, valactual, mask, i2);
    1742:	2f02           	move.l d2,-(sp)
    1744:	3f03           	move.w d3,-(sp)
    1746:	4267           	clr.w -(sp)
    1748:	2f0e           	move.l a6,-(sp)
    174a:	4879 0000 7400 	pea 7400 <destlinezoom6>
    1750:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1752:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1756:	4643           	not.w d3
  for(int i2=0;i2<7;i2++) {  
    1758:	5282           	addq.l #1,d2
    175a:	4fef 0010      	lea 16(sp),sp
    175e:	7007           	moveq #7,d0
    1760:	b082           	cmp.l d2,d0
    1762:	66de           	bne.s 1742 <main+0x173c>
    1764:	4dec 0154      	lea 340(a4),a6
    1768:	7407           	moveq #7,d2
    176a:	280b           	move.l a3,d4
    176c:	264e           	movea.l a6,a3
    176e:	2c42           	movea.l d2,a6
  }

  for(int i=0;i<6;i++) {
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    1770:	7400           	moveq #0,d2
    1772:	3403           	move.w d3,d2
    1774:	2f0e           	move.l a6,-(sp)
    1776:	2f02           	move.l d2,-(sp)
    1778:	2f0b           	move.l a3,-(sp)
    177a:	4879 0000 7400 	pea 7400 <destlinezoom6>
    1780:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    1782:	486e 0001      	pea 1(a6)
    1786:	2f02           	move.l d2,-(sp)
    1788:	486b 0030      	pea 48(a3)
    178c:	4879 0000 7400 	pea 7400 <destlinezoom6>
    1792:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1794:	4643           	not.w d3
    1796:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1798:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<6;i++) {
    179c:	4fef 0020      	lea 32(sp),sp
    17a0:	7013           	moveq #19,d0
    17a2:	b08e           	cmp.l a6,d0
    17a4:	66ca           	bne.s 1770 <main+0x176a>
    17a6:	240e           	move.l a6,d2
    17a8:	2c04           	move.l d4,d6
    17aa:	2c45           	movea.l d5,a6
    17ac:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    17b0:	2802           	move.l d2,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    17b2:	2f04           	move.l d4,-(sp)
    17b4:	3f03           	move.w d3,-(sp)
    17b6:	4267           	clr.w -(sp)
    17b8:	2f0e           	move.l a6,-(sp)
    17ba:	4879 0000 7400 	pea 7400 <destlinezoom6>
    17c0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    17c2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    17c6:	4643           	not.w d3
    17c8:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    17ca:	4fef 0010      	lea 16(sp),sp
    17ce:	ba8e           	cmp.l a6,d5
    17d0:	66e0           	bne.s 17b2 <main+0x17ac>
    17d2:	367c 001f      	movea.w #31,a3
    }
    for(int i=0;i<6;i++) {
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    17d6:	7800           	moveq #0,d4
    17d8:	3803           	move.w d3,d4
    17da:	2f0b           	move.l a3,-(sp)
    17dc:	2f04           	move.l d4,-(sp)
    17de:	2f0e           	move.l a6,-(sp)
    17e0:	4879 0000 7400 	pea 7400 <destlinezoom6>
    17e6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*24);
    17e8:	486b 0001      	pea 1(a3)
    17ec:	2f04           	move.l d4,-(sp)
    17ee:	486e 0030      	pea 48(a6)
    17f2:	4879 0000 7400 	pea 7400 <destlinezoom6>
    17f8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    17fa:	4643           	not.w d3
    17fc:	47eb 0018      	lea 24(a3),a3
      valactual += ZMLINESIZE/2;
    1800:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    1804:	4fef 0020      	lea 32(sp),sp
    1808:	b6fc 00af      	cmpa.w #175,a3
    180c:	66c8           	bne.s 17d6 <main+0x17d0>
    180e:	0685 0000 0480 	addi.l #1152,d5
    1814:	7018           	moveq #24,d0
    1816:	d480           	add.l d0,d2
  for(int i=0;i<10;i++) {
    1818:	0c82 0000 0103 	cmpi.l #259,d2
    181e:	668a           	bne.s 17aa <main+0x17a4>
    1820:	2646           	movea.l d6,a3
    1822:	4dec 3094      	lea 12436(a4),a6
    1826:	283c 0000 0102 	move.l #258,d4
    }
  }

  for(int i2=0;i2<11;i2++) {  
    TestRow( valsupposed, valactual, mask, 258+i2);
    182c:	2f04           	move.l d4,-(sp)
    182e:	3f03           	move.w d3,-(sp)
    1830:	4267           	clr.w -(sp)
    1832:	2f0e           	move.l a6,-(sp)
    1834:	4879 0000 7400 	pea 7400 <destlinezoom6>
    183a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    183c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1840:	4643           	not.w d3
    1842:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    1844:	4fef 0010      	lea 16(sp),sp
    1848:	0c84 0000 010d 	cmpi.l #269,d4
    184e:	66dc           	bne.s 182c <main+0x1826>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 6);
    1850:	4878 0006      	pea 6 <main>
    1854:	2f0b           	move.l a3,-(sp)
    1856:	2f0c           	move.l a4,-(sp)
    1858:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    185e:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    1864:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom7;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1868:	42a7           	clr.l -(sp)
    186a:	42a7           	clr.l -(sp)
    186c:	2f2d ff7c      	move.l -132(a5),-(sp)
    1870:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    1876:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1878:	41eb 0034      	lea 52(a3),a0
    187c:	2b48 ff88      	move.l a0,-120(a5)
    1880:	4fef 001c      	lea 28(sp),sp
    1884:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    1888:	7eff           	moveq #-1,d7
    188a:	280b           	move.l a3,d4
    188c:	2648           	movea.l a0,a3
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    188e:	7600           	moveq #0,d3
    1890:	3607           	move.w d7,d3
    1892:	2f0e           	move.l a6,-(sp)
    1894:	2f03           	move.l d3,-(sp)
    1896:	2f0b           	move.l a3,-(sp)
    1898:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    189e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    18a0:	486e 0001      	pea 1(a6)
    18a4:	2f03           	move.l d3,-(sp)
    18a6:	486b 0030      	pea 48(a3)
    18aa:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    18b0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    18b2:	4647           	not.w d7
    18b4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    18b6:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    18ba:	4fef 0020      	lea 32(sp),sp
    18be:	700f           	moveq #15,d0
    18c0:	b08e           	cmp.l a6,d0
    18c2:	66ca           	bne.s 188e <main+0x1888>
    18c4:	2604           	move.l d4,d3
    18c6:	0683 0000 04e4 	addi.l #1252,d3
    18cc:	2a0c           	move.l a4,d5
    18ce:	2c04           	move.l d4,d6
    18d0:	284e           	movea.l a6,a4
    18d2:	2c43           	movea.l d3,a6
    18d4:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    18d8:	280c           	move.l a4,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<11;i2++) {  
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    18da:	2f04           	move.l d4,-(sp)
    18dc:	3f07           	move.w d7,-(sp)
    18de:	4267           	clr.w -(sp)
    18e0:	2f0e           	move.l a6,-(sp)
    18e2:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    18e8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    18ea:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    18ee:	4647           	not.w d7
    18f0:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    18f2:	4fef 0010      	lea 16(sp),sp
    18f6:	b68e           	cmp.l a6,d3
    18f8:	66e0           	bne.s 18da <main+0x18d4>
    18fa:	367c 001a      	movea.w #26,a3
    }
    for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    18fe:	7800           	moveq #0,d4
    1900:	3807           	move.w d7,d4
    1902:	2f0b           	move.l a3,-(sp)
    1904:	2f04           	move.l d4,-(sp)
    1906:	2f0e           	move.l a6,-(sp)
    1908:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    190e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 26+i*25);
    1910:	2f0b           	move.l a3,-(sp)
    1912:	2f04           	move.l d4,-(sp)
    1914:	486e 0030      	pea 48(a6)
    1918:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    191e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1920:	4647           	not.w d7
    1922:	47eb 0019      	lea 25(a3),a3
      valactual += ZMLINESIZE/2;
    1926:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    192a:	4fef 0020      	lea 32(sp),sp
    192e:	b6fc 00c9      	cmpa.w #201,a3
    1932:	66ca           	bne.s 18fe <main+0x18f8>
    1934:	0683 0000 04b0 	addi.l #1200,d3
    193a:	49ec 0019      	lea 25(a4),a4
  for(int i=0;i<10;i++) {
    193e:	b8fc 0109      	cmpa.w #265,a4
    1942:	668e           	bne.s 18d2 <main+0x18cc>
    1944:	2845           	movea.l d5,a4
    1946:	2646           	movea.l d6,a3
    1948:	4deb 31b4      	lea 12724(a3),a6
    194c:	263c 0000 0100 	move.l #256,d3
    }
  }

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 256+i2);
    1952:	2f03           	move.l d3,-(sp)
    1954:	3f07           	move.w d7,-(sp)
    1956:	4267           	clr.w -(sp)
    1958:	2f0e           	move.l a6,-(sp)
    195a:	4879 0000 73d4 	pea 73d4 <destlinezoom7>
    1960:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1962:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1966:	4647           	not.w d7
    1968:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    196a:	4fef 0010      	lea 16(sp),sp
    196e:	0c83 0000 0105 	cmpi.l #261,d3
    1974:	66dc           	bne.s 1952 <main+0x194c>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 7);
    1976:	4878 0007      	pea 7 <main+0x1>
    197a:	2f0c           	move.l a4,-(sp)
    197c:	2f0b           	move.l a3,-(sp)
    197e:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1984:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    198a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom8;
  mask = 0xffff;
 
  TestRow( valsupposed, valactual, mask, 0);
    198e:	42a7           	clr.l -(sp)
    1990:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1996:	2f2d ff6c      	move.l -148(a5),-(sp)
    199a:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    19a0:	4e92           	jsr (a2)
    19a2:	4fef 001c      	lea 28(sp),sp
    19a6:	2b6d ff74 ff70 	move.l -140(a5),-144(a5)
  valactual += ZMLINESIZE/2;
    19ac:	2a2d ff80      	move.l -128(a5),d5
  TestRow( valsupposed, valactual, mask, 0);
    19b0:	7601           	moveq #1,d3
  mask = mask ^ 0xffff;
    19b2:	4244           	clr.w d4
    19b4:	2c43           	movea.l d3,a6
    19b6:	2c2d ff70      	move.l -144(a5),d6
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    19ba:	7600           	moveq #0,d3
    19bc:	3604           	move.w d4,d3
    19be:	2f0e           	move.l a6,-(sp)
    19c0:	2f03           	move.l d3,-(sp)
    19c2:	2f05           	move.l d5,-(sp)
    19c4:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    19ca:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    19cc:	486e 0001      	pea 1(a6)
    19d0:	2f03           	move.l d3,-(sp)
    19d2:	2045           	movea.l d5,a0
    19d4:	4868 0030      	pea 48(a0)
    19d8:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    19de:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    19e0:	4644           	not.w d4
    19e2:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    19e4:	4fef 0020      	lea 32(sp),sp
    19e8:	700b           	moveq #11,d0
    19ea:	b08e           	cmp.l a6,d0
    19ec:	6740           	beq.s 1a2e <main+0x1a28>
    19ee:	2005           	move.l d5,d0
    19f0:	0680 0000 00c0 	addi.l #192,d0
    19f6:	2a06           	move.l d6,d5
    19f8:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    19fa:	7600           	moveq #0,d3
    19fc:	3604           	move.w d4,d3
    19fe:	2f0e           	move.l a6,-(sp)
    1a00:	2f03           	move.l d3,-(sp)
    1a02:	2f05           	move.l d5,-(sp)
    1a04:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1a0a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1a0c:	486e 0001      	pea 1(a6)
    1a10:	2f03           	move.l d3,-(sp)
    1a12:	2045           	movea.l d5,a0
    1a14:	4868 0030      	pea 48(a0)
    1a18:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1a1e:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    1a20:	4644           	not.w d4
    1a22:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    1a24:	4fef 0020      	lea 32(sp),sp
    1a28:	700b           	moveq #11,d0
    1a2a:	b08e           	cmp.l a6,d0
    1a2c:	66c0           	bne.s 19ee <main+0x19e8>
    1a2e:	260e           	move.l a6,d3
    1a30:	2b46 ff70      	move.l d6,-144(a5)
    1a34:	0686 0000 01e0 	addi.l #480,d6
    1a3a:	7e15           	moveq #21,d7
    1a3c:	2b4c ffac      	move.l a4,-84(a5)
    1a40:	2b4b ffb0      	move.l a3,-80(a5)
    1a44:	2647           	movea.l d7,a3
    1a46:	2c46           	movea.l d6,a6
    1a48:	4dee fe20      	lea -480(a6),a6
    1a4c:	49eb fff6      	lea -10(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<10;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    1a50:	2f0c           	move.l a4,-(sp)
    1a52:	3f04           	move.w d4,-(sp)
    1a54:	4267           	clr.w -(sp)
    1a56:	2f0e           	move.l a6,-(sp)
    1a58:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1a5e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1a60:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1a64:	4644           	not.w d4
    1a66:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    1a68:	4fef 0010      	lea 16(sp),sp
    1a6c:	bc8e           	cmp.l a6,d6
    1a6e:	66e0           	bne.s 1a50 <main+0x1a4a>
    1a70:	2a0b           	move.l a3,d5
    1a72:	2e0e           	move.l a6,d7
    1a74:	0687 0000 0300 	addi.l #768,d7
    }
    for(int i2=0;i2<8;i2++) {
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    1a7a:	7000           	moveq #0,d0
    1a7c:	3004           	move.w d4,d0
    1a7e:	2840           	movea.l d0,a4
    1a80:	2f05           	move.l d5,-(sp)
    1a82:	2f0c           	move.l a4,-(sp)
    1a84:	2f0e           	move.l a6,-(sp)
    1a86:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1a8c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    1a8e:	2f05           	move.l d5,-(sp)
    1a90:	2f0c           	move.l a4,-(sp)
    1a92:	486e 0030      	pea 48(a6)
    1a96:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1a9c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1a9e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    1aa2:	4644           	not.w d4
    1aa4:	5285           	addq.l #1,d5
    for(int i2=0;i2<8;i2++) {
    1aa6:	4fef 0020      	lea 32(sp),sp
    1aaa:	be8e           	cmp.l a6,d7
    1aac:	66cc           	bne.s 1a7a <main+0x1a74>
    1aae:	0686 0000 04e0 	addi.l #1248,d6
    1ab4:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    1ab8:	b6fc 00ff      	cmpa.w #255,a3
    1abc:	6688           	bne.s 1a46 <main+0x1a40>
    1abe:	286d ffac      	movea.l -84(a5),a4
    1ac2:	266d ffb0      	movea.l -80(a5),a3
    1ac6:	2c2d ff70      	move.l -144(a5),d6
    1aca:	0686 0000 2be0 	addi.l #11232,d6
    1ad0:	2a2d ff68      	move.l -152(a5),d5
    1ad4:	2c46           	movea.l d6,a6
    }
  }

  for(int i2=0;i2<10;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1ad6:	2f05           	move.l d5,-(sp)
    1ad8:	3f04           	move.w d4,-(sp)
    1ada:	4267           	clr.w -(sp)
    1adc:	2f0e           	move.l a6,-(sp)
    1ade:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1ae4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1ae6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1aea:	4644           	not.w d4
    1aec:	5285           	addq.l #1,d5
  for(int i2=0;i2<10;i2++) {  
    1aee:	4fef 0010      	lea 16(sp),sp
    1af2:	0c85 0000 00ff 	cmpi.l #255,d5
    1af8:	66dc           	bne.s 1ad6 <main+0x1ad0>
    1afa:	2c2d ff70      	move.l -144(a5),d6
    1afe:	0686 0000 2dc0 	addi.l #11712,d6
    1b04:	2c45           	movea.l d5,a6
    1b06:	2e0b           	move.l a3,d7
    1b08:	2646           	movea.l d6,a3
  }
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    1b0a:	7c00           	moveq #0,d6
    1b0c:	3c04           	move.w d4,d6
    1b0e:	2f0e           	move.l a6,-(sp)
    1b10:	2f06           	move.l d6,-(sp)
    1b12:	2f0b           	move.l a3,-(sp)
    1b14:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1b1a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 256+i*2);
    1b1c:	486e 0001      	pea 1(a6)
    1b20:	2f06           	move.l d6,-(sp)
    1b22:	486b 0030      	pea 48(a3)
    1b26:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1b2c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1b2e:	4644           	not.w d4
    1b30:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1b32:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    1b36:	4fef 0020      	lea 32(sp),sp
    1b3a:	bcfc 010d      	cmpa.w #269,a6
    1b3e:	66ca           	bne.s 1b0a <main+0x1b04>
    1b40:	2647           	movea.l d7,a3
  }
  TestRow( valsupposed, valactual, mask, 269);
    1b42:	2f0e           	move.l a6,-(sp)
    1b44:	3f04           	move.w d4,-(sp)
    1b46:	4267           	clr.w -(sp)
    1b48:	206d ff70      	movea.l -144(a5),a0
    1b4c:	4868 3060      	pea 12384(a0)
    1b50:	4879 0000 73a8 	pea 73a8 <destlinezoom8>
    1b56:	4e92           	jsr (a2)
 
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 8);
    1b58:	4878 0008      	pea 8 <main+0x2>
    1b5c:	2f0b           	move.l a3,-(sp)
    1b5e:	2f0c           	move.l a4,-(sp)
    1b60:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1b66:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    1b6c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom9;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1b70:	42a7           	clr.l -(sp)
    1b72:	42a7           	clr.l -(sp)
    1b74:	2f2d ff7c      	move.l -132(a5),-(sp)
    1b78:	4879 0000 737c 	pea 737c <destlinezoom9>
    1b7e:	4e92           	jsr (a2)
    1b80:	4fef 002c      	lea 44(sp),sp
    1b84:	3c7c 0001      	movea.w #1,a6
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
    1b88:	7cff           	moveq #-1,d6
    1b8a:	2e0b           	move.l a3,d7
    1b8c:	266d ff88      	movea.l -120(a5),a3
  
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1b90:	7800           	moveq #0,d4
    1b92:	3806           	move.w d6,d4
    1b94:	2f0e           	move.l a6,-(sp)
    1b96:	2f04           	move.l d4,-(sp)
    1b98:	2f0b           	move.l a3,-(sp)
    1b9a:	4879 0000 737c 	pea 737c <destlinezoom9>
    1ba0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1ba2:	486e 0001      	pea 1(a6)
    1ba6:	2f04           	move.l d4,-(sp)
    1ba8:	486b 0030      	pea 48(a3)
    1bac:	4879 0000 737c 	pea 737c <destlinezoom9>
    1bb2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1bb4:	4646           	not.w d6
    1bb6:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1bb8:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<3;i++) {
    1bbc:	4fef 0020      	lea 32(sp),sp
    1bc0:	7007           	moveq #7,d0
    1bc2:	b08e           	cmp.l a6,d0
    1bc4:	66ca           	bne.s 1b90 <main+0x1b8a>
    1bc6:	282d ff8c      	move.l -116(a5),d4
    1bca:	307c 0014      	movea.w #20,a0
    1bce:	2b4c ff70      	move.l a4,-144(a5)
    1bd2:	2b47 ff88      	move.l d7,-120(a5)
    1bd6:	2648           	movea.l a0,a3
    1bd8:	2b42 ff8c      	move.l d2,-116(a5)
    1bdc:	2c44           	movea.l d4,a6
    1bde:	4dee fe50      	lea -432(a6),a6
    1be2:	49eb fff7      	lea -9(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<9;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    1be6:	2f0c           	move.l a4,-(sp)
    1be8:	3f06           	move.w d6,-(sp)
    1bea:	4267           	clr.w -(sp)
    1bec:	2f0e           	move.l a6,-(sp)
    1bee:	4879 0000 737c 	pea 737c <destlinezoom9>
    1bf4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1bf6:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1bfa:	4646           	not.w d6
    1bfc:	528c           	addq.l #1,a4
    for(int i2=0;i2<9;i2++) {  
    1bfe:	4fef 0010      	lea 16(sp),sp
    1c02:	b88e           	cmp.l a6,d4
    1c04:	66e0           	bne.s 1be6 <main+0x1be0>
    1c06:	2e0b           	move.l a3,d7
    1c08:	49eb 0009      	lea 9(a3),a4
    }
    
    for(int i2=0;i2<9;i2++) {
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    1c0c:	7400           	moveq #0,d2
    1c0e:	3406           	move.w d6,d2
    1c10:	2f07           	move.l d7,-(sp)
    1c12:	2f02           	move.l d2,-(sp)
    1c14:	2f0e           	move.l a6,-(sp)
    1c16:	4879 0000 737c 	pea 737c <destlinezoom9>
    1c1c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    1c1e:	5287           	addq.l #1,d7
    1c20:	2f07           	move.l d7,-(sp)
    1c22:	2f02           	move.l d2,-(sp)
    1c24:	486e 0030      	pea 48(a6)
    1c28:	4879 0000 737c 	pea 737c <destlinezoom9>
    1c2e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1c30:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    1c32:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    1c36:	4fef 0020      	lea 32(sp),sp
    1c3a:	b9c7           	cmpa.l d7,a4
    1c3c:	66ce           	bne.s 1c0c <main+0x1c06>
    1c3e:	0684 0000 0510 	addi.l #1296,d4
    1c44:	47eb 001b      	lea 27(a3),a3
  for(int i=0;i<9;i++) {
    1c48:	b6fc 0107      	cmpa.w #263,a3
    1c4c:	668e           	bne.s 1bdc <main+0x1bd6>
    1c4e:	286d ff70      	movea.l -144(a5),a4
    1c52:	266d ff88      	movea.l -120(a5),a3
    1c56:	242d ff8c      	move.l -116(a5),d2
    1c5a:	41eb 2ee4      	lea 12004(a3),a0
    1c5e:	2b48 ff70      	move.l a0,-144(a5)
    1c62:	2c48           	movea.l a0,a6
    }
  }

  for(int i2=0;i2<9;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1c64:	2f2d ff68      	move.l -152(a5),-(sp)
    1c68:	3f06           	move.w d6,-(sp)
    1c6a:	4267           	clr.w -(sp)
    1c6c:	2f0e           	move.l a6,-(sp)
    1c6e:	4879 0000 737c 	pea 737c <destlinezoom9>
    1c74:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1c76:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1c7a:	4646           	not.w d6
    1c7c:	52ad ff68      	addq.l #1,-152(a5)
  for(int i2=0;i2<9;i2++) {  
    1c80:	4fef 0010      	lea 16(sp),sp
    1c84:	0cad 0000 00fe 	cmpi.l #254,-152(a5)
    1c8a:	ff68 
    1c8c:	66d6           	bne.s 1c64 <main+0x1c5e>
    1c8e:	41eb 3094      	lea 12436(a3),a0
    1c92:	2b48 ff88      	move.l a0,-120(a5)
    1c96:	2c42           	movea.l d2,a6
  }
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    1c98:	7400           	moveq #0,d2
    1c9a:	3406           	move.w d6,d2
    1c9c:	2f0e           	move.l a6,-(sp)
    1c9e:	2f02           	move.l d2,-(sp)
    1ca0:	2f2d ff88      	move.l -120(a5),-(sp)
    1ca4:	4879 0000 737c 	pea 737c <destlinezoom9>
    1caa:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 260+i*2);
    1cac:	486e 0001      	pea 1(a6)
    1cb0:	2f02           	move.l d2,-(sp)
    1cb2:	206d ff88      	movea.l -120(a5),a0
    1cb6:	4868 0030      	pea 48(a0)
    1cba:	4879 0000 737c 	pea 737c <destlinezoom9>
    1cc0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1cc2:	4646           	not.w d6
    1cc4:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1cc6:	7060           	moveq #96,d0
    1cc8:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<5;i++) {
    1ccc:	4fef 0020      	lea 32(sp),sp
    1cd0:	bcfc 010d      	cmpa.w #269,a6
    1cd4:	66c2           	bne.s 1c98 <main+0x1c92>
  }
  TestRow( valsupposed, valactual, mask, 269);
    1cd6:	2f0e           	move.l a6,-(sp)
    1cd8:	3f06           	move.w d6,-(sp)
    1cda:	4267           	clr.w -(sp)
    1cdc:	2f2d ff78      	move.l -136(a5),-(sp)
    1ce0:	4879 0000 737c 	pea 737c <destlinezoom9>
    1ce6:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 9);
    1ce8:	4878 0009      	pea 9 <main+0x3>
    1cec:	2f0c           	move.l a4,-(sp)
    1cee:	2f0b           	move.l a3,-(sp)
    1cf0:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1cf6:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    1cfc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom10;

  mask = 0xffff;
  TestRow( valsupposed, valactual, mask, 0);
    1d00:	42a7           	clr.l -(sp)
    1d02:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1d08:	2f2d ff6c      	move.l -148(a5),-(sp)
    1d0c:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1d12:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 1);   
    1d14:	4fef 002c      	lea 44(sp),sp
    1d18:	4878 0001      	pea 1 <_start+0x1>
    1d1c:	42a7           	clr.l -(sp)
    1d1e:	2f2d ff80      	move.l -128(a5),-(sp)
    1d22:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1d28:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 2);
    1d2a:	4878 0002      	pea 2 <_start+0x2>
    1d2e:	42a7           	clr.l -(sp)
    1d30:	2f2d ff90      	move.l -112(a5),-(sp)
    1d34:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1d3a:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i=0;i<9;i++) {
    1d3c:	242d ff94      	move.l -108(a5),d2
    1d40:	4fef 0020      	lea 32(sp),sp
  mask = mask ^ 0xffff;
    1d44:	7eff           	moveq #-1,d7
    1d46:	2c43           	movea.l d3,a6
    1d48:	2042           	movea.l d2,a0
    1d4a:	41e8 fe80      	lea -384(a0),a0
    1d4e:	2b48 ff88      	move.l a0,-120(a5)
    1d52:	260e           	move.l a6,d3
    1d54:	5183           	subq.l #8,d3
    for(int i2=0;i2<8;i2++) {  
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    1d56:	2f03           	move.l d3,-(sp)
    1d58:	3f07           	move.w d7,-(sp)
    1d5a:	4267           	clr.w -(sp)
    1d5c:	2f2d ff88      	move.l -120(a5),-(sp)
    1d60:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1d66:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1d68:	7030           	moveq #48,d0
    1d6a:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    1d6e:	4647           	not.w d7
    1d70:	5283           	addq.l #1,d3
    for(int i2=0;i2<8;i2++) {  
    1d72:	4fef 0010      	lea 16(sp),sp
    1d76:	b4ad ff88      	cmp.l -120(a5),d2
    1d7a:	66da           	bne.s 1d56 <main+0x1d50>
    1d7c:	260e           	move.l a6,d3
    1d7e:	2c2d ff88      	move.l -120(a5),d6
    1d82:	0686 0000 03c0 	addi.l #960,d6
    }
    
    for(int i2=0;i2<10;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    1d88:	7800           	moveq #0,d4
    1d8a:	3807           	move.w d7,d4
    1d8c:	2f03           	move.l d3,-(sp)
    1d8e:	2f04           	move.l d4,-(sp)
    1d90:	2f2d ff88      	move.l -120(a5),-(sp)
    1d94:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1d9a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    1d9c:	2f03           	move.l d3,-(sp)
    1d9e:	2f04           	move.l d4,-(sp)
    1da0:	206d ff88      	movea.l -120(a5),a0
    1da4:	4868 0030      	pea 48(a0)
    1da8:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1dae:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1db0:	7060           	moveq #96,d0
    1db2:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    1db6:	4647           	not.w d7
    1db8:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {
    1dba:	4fef 0020      	lea 32(sp),sp
    1dbe:	bcad ff88      	cmp.l -120(a5),d6
    1dc2:	66c4           	bne.s 1d88 <main+0x1d82>
    1dc4:	0682 0000 0540 	addi.l #1344,d2
    1dca:	4dee 001c      	lea 28(a6),a6
  for(int i=0;i<9;i++) {
    1dce:	bcfc 0107      	cmpa.w #263,a6
    1dd2:	6600 ff74      	bne.w 1d48 <main+0x1d42>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, 255+i2);
    1dd6:	2f05           	move.l d5,-(sp)
    1dd8:	3f07           	move.w d7,-(sp)
    1dda:	4267           	clr.w -(sp)
    1ddc:	2f2d ffa4      	move.l -92(a5),-(sp)
    1de0:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1de6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1de8:	7030           	moveq #48,d0
    1dea:	d1ad ffa4      	add.l d0,-92(a5)
    mask = mask ^ 0xffff;
    1dee:	4647           	not.w d7
    1df0:	5285           	addq.l #1,d5
  for(int i2=0;i2<8;i2++) {  
    1df2:	4fef 0010      	lea 16(sp),sp
    1df6:	0c85 0000 0107 	cmpi.l #263,d5
    1dfc:	66d8           	bne.s 1dd6 <main+0x1dd0>
    1dfe:	4dec 3154      	lea 12628(a4),a6
    1e02:	2b7c 0000 0108 	move.l #264,-120(a5)
    1e08:	ff88 
  }
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    1e0a:	7400           	moveq #0,d2
    1e0c:	3407           	move.w d7,d2
    1e0e:	206d ff88      	movea.l -120(a5),a0
    1e12:	4868 ffff      	pea -1(a0)
    1e16:	2f02           	move.l d2,-(sp)
    1e18:	2f0e           	move.l a6,-(sp)
    1e1a:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1e20:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 264+i*2);
    1e22:	2f2d ff88      	move.l -120(a5),-(sp)
    1e26:	2f02           	move.l d2,-(sp)
    1e28:	486e 0030      	pea 48(a6)
    1e2c:	4879 0000 7350 	pea 7350 <destlinezoom10>
    1e32:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1e34:	4647           	not.w d7
    1e36:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    1e3a:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    1e3e:	4fef 0020      	lea 32(sp),sp
    1e42:	0cad 0000 010e 	cmpi.l #270,-120(a5)
    1e48:	ff88 
    1e4a:	66be           	bne.s 1e0a <main+0x1e04>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 10);
    1e4c:	4878 000a      	pea a <main+0x4>
    1e50:	2f0b           	move.l a3,-(sp)
    1e52:	2f0c           	move.l a4,-(sp)
    1e54:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    1e5a:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    1e60:	4eae ff1c      	jsr -228(a6)
    1e64:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    1e68:	2b6d ff7c ff88 	move.l -132(a5),-120(a5)
  valsupposed = destlinezoom11;

  mask = 0xffff;
 
  for(int i2=0;i2<6;i2++) {  
    1e6e:	7600           	moveq #0,d3
  mask = 0xffff;
    1e70:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    1e72:	2f03           	move.l d3,-(sp)
    1e74:	3f02           	move.w d2,-(sp)
    1e76:	4267           	clr.w -(sp)
    1e78:	2f2d ff88      	move.l -120(a5),-(sp)
    1e7c:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1e82:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1e84:	7030           	moveq #48,d0
    1e86:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    1e8a:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    1e8c:	5283           	addq.l #1,d3
    1e8e:	4fef 0010      	lea 16(sp),sp
    1e92:	7006           	moveq #6,d0
    1e94:	b083           	cmp.l d3,d0
    1e96:	66da           	bne.s 1e72 <main+0x1e6c>
    1e98:	2c6d ffa8      	movea.l -88(a5),a6
    1e9c:	307c 0006      	movea.w #6,a0
    1ea0:	2b48 ff88      	move.l a0,-120(a5)
  }

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    1ea4:	7600           	moveq #0,d3
    1ea6:	3602           	move.w d2,d3
    1ea8:	2f2d ff88      	move.l -120(a5),-(sp)
    1eac:	2f03           	move.l d3,-(sp)
    1eae:	2f0e           	move.l a6,-(sp)
    1eb0:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1eb6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    1eb8:	206d ff88      	movea.l -120(a5),a0
    1ebc:	4868 0001      	pea 1(a0)
    1ec0:	2f03           	move.l d3,-(sp)
    1ec2:	486e 0030      	pea 48(a6)
    1ec6:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1ecc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1ece:	4642           	not.w d2
    1ed0:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    1ed4:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    1ed8:	4fef 0020      	lea 32(sp),sp
    1edc:	701c           	moveq #28,d0
    1ede:	b0ad ff88      	cmp.l -120(a5),d0
    1ee2:	66c0           	bne.s 1ea4 <main+0x1e9e>
    1ee4:	260b           	move.l a3,d3
    1ee6:	0683 0000 0694 	addi.l #1684,d3
    1eec:	307c 0023      	movea.w #35,a0
    1ef0:	2b48 ff88      	move.l a0,-120(a5)
    1ef4:	2c0b           	move.l a3,d6
    1ef6:	2c43           	movea.l d3,a6
    1ef8:	4dee feb0      	lea -336(a6),a6
    1efc:	282d ff88      	move.l -120(a5),d4
    1f00:	5f84           	subq.l #7,d4
  }

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<7;i2++) {  
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    1f02:	2f04           	move.l d4,-(sp)
    1f04:	3f02           	move.w d2,-(sp)
    1f06:	4267           	clr.w -(sp)
    1f08:	2f0e           	move.l a6,-(sp)
    1f0a:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1f10:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1f12:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1f16:	4642           	not.w d2
    1f18:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    1f1a:	4fef 0010      	lea 16(sp),sp
    1f1e:	b68e           	cmp.l a6,d3
    1f20:	66e0           	bne.s 1f02 <main+0x1efc>
    1f22:	266d ff88      	movea.l -120(a5),a3
    1f26:	2a0e           	move.l a6,d5
    1f28:	0685 0000 0420 	addi.l #1056,d5
    }
    
    for(int i2=0;i2<11;i2++) {
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    1f2e:	7800           	moveq #0,d4
    1f30:	3802           	move.w d2,d4
    1f32:	2f0b           	move.l a3,-(sp)
    1f34:	2f04           	move.l d4,-(sp)
    1f36:	2f0e           	move.l a6,-(sp)
    1f38:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1f3e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    1f40:	486b ffe8      	pea -24(a3)
    1f44:	2f04           	move.l d4,-(sp)
    1f46:	486e 0030      	pea 48(a6)
    1f4a:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1f50:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1f52:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    1f56:	4642           	not.w d2
    1f58:	548b           	addq.l #2,a3
    for(int i2=0;i2<11;i2++) {
    1f5a:	4fef 0020      	lea 32(sp),sp
    1f5e:	ba8e           	cmp.l a6,d5
    1f60:	66cc           	bne.s 1f2e <main+0x1f28>
    1f62:	0683 0000 0570 	addi.l #1392,d3
    1f68:	701d           	moveq #29,d0
    1f6a:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<8;i++) {
    1f6e:	0cad 0000 010b 	cmpi.l #267,-120(a5)
    1f74:	ff88 
    1f76:	6600 ff7e      	bne.w 1ef6 <main+0x1ef0>
    1f7a:	2646           	movea.l d6,a3
    1f7c:	41eb 30c4      	lea 12484(a3),a0
    1f80:	2b48 ff88      	move.l a0,-120(a5)
    1f84:	283c 0000 0104 	move.l #260,d4
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    1f8a:	7600           	moveq #0,d3
    1f8c:	3602           	move.w d2,d3
    1f8e:	2f04           	move.l d4,-(sp)
    1f90:	2f03           	move.l d3,-(sp)
    1f92:	2f2d ff88      	move.l -120(a5),-(sp)
    1f96:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1f9c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1f9e:	7030           	moveq #48,d0
    1fa0:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    1fa4:	4642           	not.w d2
    1fa6:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    1fa8:	4fef 0010      	lea 16(sp),sp
    1fac:	0c84 0000 010b 	cmpi.l #267,d4
    1fb2:	66d6           	bne.s 1f8a <main+0x1f84>
    1fb4:	0282 0000 ffff 	andi.l #65535,d2
  }
  TestRow( valsupposed, valactual, mask, 267);   
    1fba:	2f04           	move.l d4,-(sp)
    1fbc:	2f02           	move.l d2,-(sp)
    1fbe:	2f2d ff98      	move.l -104(a5),-(sp)
    1fc2:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1fc8:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 268);
    1fca:	4878 010c      	pea 10c <main+0x106>
    1fce:	2f02           	move.l d2,-(sp)
    1fd0:	2f2d ff9c      	move.l -100(a5),-(sp)
    1fd4:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1fda:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 269);
    1fdc:	4fef 0020      	lea 32(sp),sp
    1fe0:	4878 010d      	pea 10d <main+0x107>
    1fe4:	2f03           	move.l d3,-(sp)
    1fe6:	2f2d ff78      	move.l -136(a5),-(sp)
    1fea:	4879 0000 7324 	pea 7324 <destlinezoom11>
    1ff0:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 11);
    1ff2:	4878 000b      	pea b <main+0x5>
    1ff6:	2f0c           	move.l a4,-(sp)
    1ff8:	2f0b           	move.l a3,-(sp)
    1ffa:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2000:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2006:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom12;

  mask = 0x0;
   
  TestRow( valsupposed, valactual, mask, 0);
    200a:	42a7           	clr.l -(sp)
    200c:	42a7           	clr.l -(sp)
    200e:	2f2d ff6c      	move.l -148(a5),-(sp)
    2012:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    2018:	4e92           	jsr (a2)
    201a:	4fef 002c      	lea 44(sp),sp
    201e:	262d ff74      	move.l -140(a5),d3
  valactual += ZMLINESIZE/2;
    2022:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);
    2026:	307c 0001      	movea.w #1,a0
    202a:	2b48 ff78      	move.l a0,-136(a5)
  mask = mask ^ 0xffff;
    202e:	74ff           	moveq #-1,d2

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2030:	7800           	moveq #0,d4
    2032:	3802           	move.w d2,d4
    2034:	2f2d ff78      	move.l -136(a5),-(sp)
    2038:	2f04           	move.l d4,-(sp)
    203a:	2f0e           	move.l a6,-(sp)
    203c:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    2042:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2044:	206d ff78      	movea.l -136(a5),a0
    2048:	4868 0001      	pea 1(a0)
    204c:	2f04           	move.l d4,-(sp)
    204e:	486e 0030      	pea 48(a6)
    2052:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    2058:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    205a:	4642           	not.w d2
    205c:	54ad ff78      	addq.l #2,-136(a5)
  for(int i2=0;i2<12;i2++) {
    2060:	4fef 0020      	lea 32(sp),sp
    2064:	7019           	moveq #25,d0
    2066:	b0ad ff78      	cmp.l -136(a5),d0
    206a:	6748           	beq.s 20b4 <main+0x20ae>
    206c:	200e           	move.l a6,d0
    206e:	0680 0000 00c0 	addi.l #192,d0
    2074:	2c43           	movea.l d3,a6
    2076:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2078:	7800           	moveq #0,d4
    207a:	3802           	move.w d2,d4
    207c:	2f2d ff78      	move.l -136(a5),-(sp)
    2080:	2f04           	move.l d4,-(sp)
    2082:	2f0e           	move.l a6,-(sp)
    2084:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    208a:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    208c:	206d ff78      	movea.l -136(a5),a0
    2090:	4868 0001      	pea 1(a0)
    2094:	2f04           	move.l d4,-(sp)
    2096:	486e 0030      	pea 48(a6)
    209a:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    20a0:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    20a2:	4642           	not.w d2
    20a4:	54ad ff78      	addq.l #2,-136(a5)
  for(int i2=0;i2<12;i2++) {
    20a8:	4fef 0020      	lea 32(sp),sp
    20ac:	7019           	moveq #25,d0
    20ae:	b0ad ff78      	cmp.l -136(a5),d0
    20b2:	66b8           	bne.s 206c <main+0x2066>
    20b4:	2803           	move.l d3,d4
    20b6:	0684 0000 0120 	addi.l #288,d4
    20bc:	307c 001f      	movea.w #31,a0
    20c0:	2b48 ff78      	move.l a0,-136(a5)
    20c4:	2c0b           	move.l a3,d6
    20c6:	2c44           	movea.l d4,a6
    20c8:	4dee fee0      	lea -288(a6),a6
    20cc:	2a2d ff78      	move.l -136(a5),d5
    20d0:	5d85           	subq.l #6,d5
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<6;i2++) {  
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    20d2:	2f05           	move.l d5,-(sp)
    20d4:	3f02           	move.w d2,-(sp)
    20d6:	4267           	clr.w -(sp)
    20d8:	2f0e           	move.l a6,-(sp)
    20da:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    20e0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    20e2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    20e6:	4642           	not.w d2
    20e8:	5285           	addq.l #1,d5
    for(int i2=0;i2<6;i2++) {  
    20ea:	4fef 0010      	lea 16(sp),sp
    20ee:	b88e           	cmp.l a6,d4
    20f0:	66e0           	bne.s 20d2 <main+0x20cc>
    20f2:	266d ff78      	movea.l -136(a5),a3
    20f6:	2e0e           	move.l a6,d7
    20f8:	0687 0000 0480 	addi.l #1152,d7
    }
    
    for(int i2=0;i2<12;i2++) {
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    20fe:	7a00           	moveq #0,d5
    2100:	3a02           	move.w d2,d5
    2102:	2f0b           	move.l a3,-(sp)
    2104:	2f05           	move.l d5,-(sp)
    2106:	2f0e           	move.l a6,-(sp)
    2108:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    210e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    2110:	486b 0001      	pea 1(a3)
    2114:	2f05           	move.l d5,-(sp)
    2116:	486e 0030      	pea 48(a6)
    211a:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    2120:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2122:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2126:	4642           	not.w d2
    2128:	548b           	addq.l #2,a3
    for(int i2=0;i2<12;i2++) {
    212a:	4fef 0020      	lea 32(sp),sp
    212e:	be8e           	cmp.l a6,d7
    2130:	66cc           	bne.s 20fe <main+0x20f8>
    2132:	0684 0000 05a0 	addi.l #1440,d4
    2138:	701e           	moveq #30,d0
    213a:	d1ad ff78      	add.l d0,-136(a5)
  for(int i=0;i<8;i++) {
    213e:	0cad 0000 010f 	cmpi.l #271,-136(a5)
    2144:	ff78 
    2146:	6600 ff7e      	bne.w 20c6 <main+0x20c0>
    214a:	2646           	movea.l d6,a3
    214c:	0683 0000 2d00 	addi.l #11520,d3
    2152:	2b43 ff78      	move.l d3,-136(a5)
    2156:	263c 0000 0104 	move.l #260,d3
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    215c:	2f03           	move.l d3,-(sp)
    215e:	3f02           	move.w d2,-(sp)
    2160:	4267           	clr.w -(sp)
    2162:	2f2d ff78      	move.l -136(a5),-(sp)
    2166:	4879 0000 72f8 	pea 72f8 <destlinezoom12>
    216c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    216e:	7030           	moveq #48,d0
    2170:	d1ad ff78      	add.l d0,-136(a5)
    mask = mask ^ 0xffff;
    2174:	4642           	not.w d2
    2176:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    2178:	4fef 0010      	lea 16(sp),sp
    217c:	0c83 0000 0109 	cmpi.l #265,d3
    2182:	66d8           	bne.s 215c <main+0x2156>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 12);
    2184:	4878 000c      	pea c <main+0x6>
    2188:	2f0b           	move.l a3,-(sp)
    218a:	2f0c           	move.l a4,-(sp)
    218c:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2192:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2198:	4eae ff1c      	jsr -228(a6)
    219c:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    21a0:	2c6d ff7c      	movea.l -132(a5),a6
  WaitBlit();
    21a4:	307c 0001      	movea.w #1,a0
    21a8:	2b48 ff78      	move.l a0,-136(a5)
  valsupposed = destlinezoom13;

  mask = 0xffff;
    21ac:	7cff           	moveq #-1,d6

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    21ae:	7400           	moveq #0,d2
    21b0:	3406           	move.w d6,d2
    21b2:	206d ff78      	movea.l -136(a5),a0
    21b6:	4868 ffff      	pea -1(a0)
    21ba:	2f02           	move.l d2,-(sp)
    21bc:	2f0e           	move.l a6,-(sp)
    21be:	4879 0000 72cc 	pea 72cc <destlinezoom13>
    21c4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    21c6:	2f2d ff78      	move.l -136(a5),-(sp)
    21ca:	2f02           	move.l d2,-(sp)
    21cc:	486e 0030      	pea 48(a6)
    21d0:	4879 0000 72cc 	pea 72cc <destlinezoom13>
    21d6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    21d8:	4646           	not.w d6
    21da:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    21de:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    21e2:	4fef 0020      	lea 32(sp),sp
    21e6:	7017           	moveq #23,d0
    21e8:	b0ad ff78      	cmp.l -136(a5),d0
    21ec:	66c0           	bne.s 21ae <main+0x21a8>
    21ee:	240b           	move.l a3,d2
    21f0:	0682 0000 0514 	addi.l #1300,d2
    21f6:	781b           	moveq #27,d4
    21f8:	2a0b           	move.l a3,d5
    21fa:	2644           	movea.l d4,a3
    21fc:	280c           	move.l a4,d4
    21fe:	2c42           	movea.l d2,a6
    2200:	4dee ff10      	lea -240(a6),a6
    2204:	260b           	move.l a3,d3
    2206:	5b83           	subq.l #5,d3
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<5;i2++) {  
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    2208:	2f03           	move.l d3,-(sp)
    220a:	3f06           	move.w d6,-(sp)
    220c:	4267           	clr.w -(sp)
    220e:	2f0e           	move.l a6,-(sp)
    2210:	4879 0000 72cc 	pea 72cc <destlinezoom13>
    2216:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2218:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    221c:	4646           	not.w d6
    221e:	5283           	addq.l #1,d3
    for(int i2=0;i2<5;i2++) {  
    2220:	4fef 0010      	lea 16(sp),sp
    2224:	b48e           	cmp.l a6,d2
    2226:	66e0           	bne.s 2208 <main+0x2202>
    2228:	284b           	movea.l a3,a4
    222a:	2e0e           	move.l a6,d7
    222c:	0687 0000 04e0 	addi.l #1248,d7
    }
    
    for(int i2=0;i2<13;i2++) {
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    2232:	7600           	moveq #0,d3
    2234:	3606           	move.w d6,d3
    2236:	2f0c           	move.l a4,-(sp)
    2238:	2f03           	move.l d3,-(sp)
    223a:	2f0e           	move.l a6,-(sp)
    223c:	4879 0000 72cc 	pea 72cc <destlinezoom13>
    2242:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    2244:	486c 0001      	pea 1(a4)
    2248:	2f03           	move.l d3,-(sp)
    224a:	486e 0030      	pea 48(a6)
    224e:	4879 0000 72cc 	pea 72cc <destlinezoom13>
    2254:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2256:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    225a:	4646           	not.w d6
    225c:	548c           	addq.l #2,a4
    for(int i2=0;i2<13;i2++) {
    225e:	4fef 0020      	lea 32(sp),sp
    2262:	be8e           	cmp.l a6,d7
    2264:	66cc           	bne.s 2232 <main+0x222c>
    2266:	0682 0000 05d0 	addi.l #1488,d2
    226c:	47eb 001f      	lea 31(a3),a3
  for(int i=0;i<8;i++) {
    2270:	b6fc 0113      	cmpa.w #275,a3
    2274:	6688           	bne.s 21fe <main+0x21f8>
    2276:	2844           	movea.l d4,a4

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 13);
    2278:	4878 000d      	pea d <main+0x7>
    227c:	2f04           	move.l d4,-(sp)
    227e:	2f05           	move.l d5,-(sp)
    2280:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2286:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    228c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom14;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);   
    2290:	42a7           	clr.l -(sp)
    2292:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2298:	2f2d ff6c      	move.l -148(a5),-(sp)
    229c:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    22a2:	4e92           	jsr (a2)
    22a4:	4fef 001c      	lea 28(sp),sp
    22a8:	262d ff74      	move.l -140(a5),d3
  valactual += ZMLINESIZE/2; 
    22ac:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);   
    22b0:	7401           	moveq #1,d2
  mask = mask ^ 0xffff; 
    22b2:	4247           	clr.w d7
    22b4:	2805           	move.l d5,d4
    22b6:	264e           	movea.l a6,a3
    22b8:	2c42           	movea.l d2,a6

  for(int i2=0;i2<9;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    22ba:	7400           	moveq #0,d2
    22bc:	3407           	move.w d7,d2
    22be:	2f0e           	move.l a6,-(sp)
    22c0:	2f02           	move.l d2,-(sp)
    22c2:	2f0b           	move.l a3,-(sp)
    22c4:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    22ca:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    22cc:	486e 0001      	pea 1(a6)
    22d0:	2f02           	move.l d2,-(sp)
    22d2:	486b 0030      	pea 48(a3)
    22d6:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    22dc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    22de:	4647           	not.w d7
    22e0:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    22e2:	4fef 0020      	lea 32(sp),sp
    22e6:	7013           	moveq #19,d0
    22e8:	b08e           	cmp.l a6,d0
    22ea:	673e           	beq.s 232a <main+0x2324>
    22ec:	200b           	move.l a3,d0
    22ee:	0680 0000 00c0 	addi.l #192,d0
    22f4:	2643           	movea.l d3,a3
    22f6:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    22f8:	7400           	moveq #0,d2
    22fa:	3407           	move.w d7,d2
    22fc:	2f0e           	move.l a6,-(sp)
    22fe:	2f02           	move.l d2,-(sp)
    2300:	2f0b           	move.l a3,-(sp)
    2302:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    2308:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    230a:	486e 0001      	pea 1(a6)
    230e:	2f02           	move.l d2,-(sp)
    2310:	486b 0030      	pea 48(a3)
    2314:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    231a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    231c:	4647           	not.w d7
    231e:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    2320:	4fef 0020      	lea 32(sp),sp
    2324:	7013           	moveq #19,d0
    2326:	b08e           	cmp.l a6,d0
    2328:	66c2           	bne.s 22ec <main+0x22e6>
    232a:	2644           	movea.l d4,a3
    232c:	240e           	move.l a6,d2
    232e:	2803           	move.l d3,d4
    2330:	0684 0000 00c0 	addi.l #192,d4
    2336:	2c0b           	move.l a3,d6
    2338:	2b6d ff78 ff88 	move.l -136(a5),-120(a5)
    233e:	2c44           	movea.l d4,a6
    2340:	4dee ff40      	lea -192(a6),a6
    2344:	2a2d ff88      	move.l -120(a5),d5
    2348:	5985           	subq.l #4,d5
  } 

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<4;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    234a:	2f05           	move.l d5,-(sp)
    234c:	3f07           	move.w d7,-(sp)
    234e:	4267           	clr.w -(sp)
    2350:	2f0e           	move.l a6,-(sp)
    2352:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    2358:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    235a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    235e:	4647           	not.w d7
    2360:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    2362:	4fef 0010      	lea 16(sp),sp
    2366:	b88e           	cmp.l a6,d4
    2368:	66e0           	bne.s 234a <main+0x2344>
    236a:	266d ff88      	movea.l -120(a5),a3
    236e:	41ee 0540      	lea 1344(a6),a0
    2372:	2b48 ff78      	move.l a0,-136(a5)
    }
    
    for(int i2=0;i2<14;i2++) {
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    2376:	7a00           	moveq #0,d5
    2378:	3a07           	move.w d7,d5
    237a:	2f0b           	move.l a3,-(sp)
    237c:	2f05           	move.l d5,-(sp)
    237e:	2f0e           	move.l a6,-(sp)
    2380:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    2386:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    2388:	486b 0001      	pea 1(a3)
    238c:	2f05           	move.l d5,-(sp)
    238e:	486e 0030      	pea 48(a6)
    2392:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    2398:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    239a:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    239e:	4647           	not.w d7
    23a0:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    23a2:	4fef 0020      	lea 32(sp),sp
    23a6:	bded ff78      	cmpa.l -136(a5),a6
    23aa:	66ca           	bne.s 2376 <main+0x2370>
    23ac:	0684 0000 0600 	addi.l #1536,d4
    23b2:	7020           	moveq #32,d0
    23b4:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<7;i++) {
    23b8:	0cad 0000 00f7 	cmpi.l #247,-120(a5)
    23be:	ff88 
    23c0:	6600 ff7c      	bne.w 233e <main+0x2338>
    23c4:	2646           	movea.l d6,a3
    23c6:	2c43           	movea.l d3,a6
    23c8:	4dee 2a00      	lea 10752(a6),a6
    23cc:	2b7c 0000 00f3 	move.l #243,-136(a5)
    23d2:	ff78 
    }
  }

  for(int i2=0;i2<4;i2++) {  
    TestRow( valsupposed, valactual, mask, 243+i2);
    23d4:	2f2d ff78      	move.l -136(a5),-(sp)
    23d8:	3f07           	move.w d7,-(sp)
    23da:	4267           	clr.w -(sp)
    23dc:	2f0e           	move.l a6,-(sp)
    23de:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    23e4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    23e6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    23ea:	4647           	not.w d7
    23ec:	52ad ff78      	addq.l #1,-136(a5)
  for(int i2=0;i2<4;i2++) {  
    23f0:	4fef 0010      	lea 16(sp),sp
    23f4:	0cad 0000 00f7 	cmpi.l #247,-136(a5)
    23fa:	ff78 
    23fc:	66d6           	bne.s 23d4 <main+0x23ce>
    23fe:	0683 0000 2ac0 	addi.l #10944,d3
    2404:	2c6d ff78      	movea.l -136(a5),a6
    2408:	280b           	move.l a3,d4
    240a:	2643           	movea.l d3,a3
  }

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    240c:	7600           	moveq #0,d3
    240e:	3607           	move.w d7,d3
    2410:	2f0e           	move.l a6,-(sp)
    2412:	2f03           	move.l d3,-(sp)
    2414:	2f0b           	move.l a3,-(sp)
    2416:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    241c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    241e:	486e 0001      	pea 1(a6)
    2422:	2f03           	move.l d3,-(sp)
    2424:	486b 0030      	pea 48(a3)
    2428:	4879 0000 72a0 	pea 72a0 <destlinezoom14>
    242e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2430:	4647           	not.w d7
    2432:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2434:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<12;i2++) {
    2438:	4fef 0020      	lea 32(sp),sp
    243c:	bcfc 010f      	cmpa.w #271,a6
    2440:	66ca           	bne.s 240c <main+0x2406>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 14);
    2442:	4878 000e      	pea e <main+0x8>
    2446:	2f04           	move.l d4,-(sp)
    2448:	2f0c           	move.l a4,-(sp)
    244a:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2450:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2456:	4eae ff1c      	jsr -228(a6)
    245a:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    245e:	262d ff7c      	move.l -132(a5),d3
  WaitBlit();
    2462:	3c7c 0001      	movea.w #1,a6
  valsupposed = destlinezoom15;

  mask = 0x0000;
    2466:	4246           	clr.w d6
    2468:	2643           	movea.l d3,a3

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    246a:	7600           	moveq #0,d3
    246c:	3606           	move.w d6,d3
    246e:	486e ffff      	pea -1(a6)
    2472:	2f03           	move.l d3,-(sp)
    2474:	2f0b           	move.l a3,-(sp)
    2476:	4879 0000 7274 	pea 7274 <destlinezoom15>
    247c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    247e:	2f0e           	move.l a6,-(sp)
    2480:	2f03           	move.l d3,-(sp)
    2482:	486b 0030      	pea 48(a3)
    2486:	4879 0000 7274 	pea 7274 <destlinezoom15>
    248c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    248e:	4646           	not.w d6
    2490:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2492:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    2496:	4fef 0020      	lea 32(sp),sp
    249a:	7011           	moveq #17,d0
    249c:	b08e           	cmp.l a6,d0
    249e:	66ca           	bne.s 246a <main+0x2464>
    24a0:	262d ffa0      	move.l -96(a5),d3
    24a4:	2a04           	move.l d4,d5
    24a6:	2642           	movea.l d2,a3
    24a8:	2c43           	movea.l d3,a6
    24aa:	4dee ff70      	lea -144(a6),a6
    24ae:	240b           	move.l a3,d2
    24b0:	5782           	subq.l #3,d2
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<3;i2++) {  
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    24b2:	2f02           	move.l d2,-(sp)
    24b4:	3f06           	move.w d6,-(sp)
    24b6:	4267           	clr.w -(sp)
    24b8:	2f0e           	move.l a6,-(sp)
    24ba:	4879 0000 7274 	pea 7274 <destlinezoom15>
    24c0:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    24c2:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    24c6:	4646           	not.w d6
    24c8:	5282           	addq.l #1,d2
    for(int i2=0;i2<3;i2++) {  
    24ca:	4fef 0010      	lea 16(sp),sp
    24ce:	b68e           	cmp.l a6,d3
    24d0:	66e0           	bne.s 24b2 <main+0x24ac>
    24d2:	240b           	move.l a3,d2
    24d4:	2e0e           	move.l a6,d7
    24d6:	0687 0000 05a0 	addi.l #1440,d7
    }
    
    for(int i2=0;i2<15;i2++) {
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    24dc:	7800           	moveq #0,d4
    24de:	3806           	move.w d6,d4
    24e0:	2f02           	move.l d2,-(sp)
    24e2:	2f04           	move.l d4,-(sp)
    24e4:	2f0e           	move.l a6,-(sp)
    24e6:	4879 0000 7274 	pea 7274 <destlinezoom15>
    24ec:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    24ee:	2f02           	move.l d2,-(sp)
    24f0:	2f04           	move.l d4,-(sp)
    24f2:	486e 0030      	pea 48(a6)
    24f6:	4879 0000 7274 	pea 7274 <destlinezoom15>
    24fc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    24fe:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2502:	4646           	not.w d6
    2504:	5482           	addq.l #2,d2
    for(int i2=0;i2<15;i2++) {
    2506:	4fef 0020      	lea 32(sp),sp
    250a:	be8e           	cmp.l a6,d7
    250c:	66ce           	bne.s 24dc <main+0x24d6>
    250e:	0683 0000 0630 	addi.l #1584,d3
    2514:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    2518:	b6fc 00fa      	cmpa.w #250,a3
    251c:	668a           	bne.s 24a8 <main+0x24a2>
    251e:	2645           	movea.l d5,a3
    2520:	4deb 2e54      	lea 11860(a3),a6
    }
  }

  for(int i2=0;i2<3;i2++) {  
    TestRow( valsupposed, valactual, mask, 247+i2);
    2524:	2f2d ff78      	move.l -136(a5),-(sp)
    2528:	3f06           	move.w d6,-(sp)
    252a:	4267           	clr.w -(sp)
    252c:	2f0e           	move.l a6,-(sp)
    252e:	4879 0000 7274 	pea 7274 <destlinezoom15>
    2534:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2536:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    253a:	4646           	not.w d6
    253c:	52ad ff78      	addq.l #1,-136(a5)
  for(int i2=0;i2<3;i2++) {  
    2540:	4fef 0010      	lea 16(sp),sp
    2544:	0cad 0000 00fa 	cmpi.l #250,-136(a5)
    254a:	ff78 
    254c:	66d6           	bne.s 2524 <main+0x251e>
    254e:	2c6d ff70      	movea.l -144(a5),a6
  }

  for(int i2=0;i2<10;i2++) {
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    2552:	7400           	moveq #0,d2
    2554:	3406           	move.w d6,d2
    2556:	2f2d ff78      	move.l -136(a5),-(sp)
    255a:	2f02           	move.l d2,-(sp)
    255c:	2f0e           	move.l a6,-(sp)
    255e:	4879 0000 7274 	pea 7274 <destlinezoom15>
    2564:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    2566:	206d ff78      	movea.l -136(a5),a0
    256a:	4868 0001      	pea 1(a0)
    256e:	2f02           	move.l d2,-(sp)
    2570:	486e 0030      	pea 48(a6)
    2574:	4879 0000 7274 	pea 7274 <destlinezoom15>
    257a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    257c:	4646           	not.w d6
    257e:	54ad ff78      	addq.l #2,-136(a5)
    valactual += ZMLINESIZE/2;
    2582:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<10;i2++) {
    2586:	4fef 0020      	lea 32(sp),sp
    258a:	0cad 0000 010e 	cmpi.l #270,-136(a5)
    2590:	ff78 
    2592:	66be           	bne.s 2552 <main+0x254c>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 15);
    2594:	4878 000f      	pea f <main+0x9>
    2598:	2f0c           	move.l a4,-(sp)
    259a:	2f0b           	move.l a3,-(sp)
    259c:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    25a2:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    25a8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom16;

  mask = 0x0000;

  TestRow( valsupposed, valactual, mask, 0);   
    25ac:	42a7           	clr.l -(sp)
    25ae:	42a7           	clr.l -(sp)
    25b0:	2f2d ff6c      	move.l -148(a5),-(sp)
    25b4:	4879 0000 7248 	pea 7248 <destlinezoom16>
    25ba:	4e92           	jsr (a2)
    25bc:	4fef 001c      	lea 28(sp),sp
  valactual += ZMLINESIZE/2;
    25c0:	2c6d ff80      	movea.l -128(a5),a6
  TestRow( valsupposed, valactual, mask, 0);   
    25c4:	42ad ff70      	clr.l -144(a5)
  mask = mask ^ 0xffff;
    25c8:	7aff           	moveq #-1,d5
    25ca:	262d ff74      	move.l -140(a5),d3
    25ce:	282d ff84      	move.l -124(a5),d4
  for(int i2=0;i2<6;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    25d2:	7400           	moveq #0,d2
    25d4:	3405           	move.w d5,d2
    25d6:	2f2d ff70      	move.l -144(a5),-(sp)
    25da:	2f02           	move.l d2,-(sp)
    25dc:	2f0e           	move.l a6,-(sp)
    25de:	4879 0000 7248 	pea 7248 <destlinezoom16>
    25e4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    25e6:	206d ff70      	movea.l -144(a5),a0
    25ea:	4868 0001      	pea 1(a0)
    25ee:	2f02           	move.l d2,-(sp)
    25f0:	486e 0030      	pea 48(a6)
    25f4:	4879 0000 7248 	pea 7248 <destlinezoom16>
    25fa:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    25fc:	4645           	not.w d5
    25fe:	2e0e           	move.l a6,d7
    2600:	0687 0000 0120 	addi.l #288,d7
    2606:	54ad ff70      	addq.l #2,-144(a5)
    260a:	2c43           	movea.l d3,a6
  for(int i2=0;i2<6;i2++) {
    260c:	4fef 0020      	lea 32(sp),sp
    2610:	700c           	moveq #12,d0
    2612:	b0ad ff70      	cmp.l -144(a5),d0
    2616:	674a           	beq.s 2662 <main+0x265c>
    2618:	2604           	move.l d4,d3
    261a:	2807           	move.l d7,d4
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    261c:	7400           	moveq #0,d2
    261e:	3405           	move.w d5,d2
    2620:	2f2d ff70      	move.l -144(a5),-(sp)
    2624:	2f02           	move.l d2,-(sp)
    2626:	2f0e           	move.l a6,-(sp)
    2628:	4879 0000 7248 	pea 7248 <destlinezoom16>
    262e:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    2630:	206d ff70      	movea.l -144(a5),a0
    2634:	4868 0001      	pea 1(a0)
    2638:	2f02           	move.l d2,-(sp)
    263a:	486e 0030      	pea 48(a6)
    263e:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2644:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2646:	4645           	not.w d5
    2648:	2e0e           	move.l a6,d7
    264a:	0687 0000 0120 	addi.l #288,d7
    2650:	54ad ff70      	addq.l #2,-144(a5)
    2654:	2c43           	movea.l d3,a6
  for(int i2=0;i2<6;i2++) {
    2656:	4fef 0020      	lea 32(sp),sp
    265a:	700c           	moveq #12,d0
    265c:	b0ad ff70      	cmp.l -144(a5),d0
    2660:	66b6           	bne.s 2618 <main+0x2612>
    2662:	2b44 ff84      	move.l d4,-124(a5)
    2666:	307c 000d      	movea.w #13,a0
    266a:	2b48 ff70      	move.l a0,-144(a5)
    266e:	2803           	move.l d3,d4
    2670:	2c07           	move.l d7,d6
    2672:	2e0b           	move.l a3,d7
    2674:	266d ff84      	movea.l -124(a5),a3
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<2;i2++) {  
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2678:	2f2d ff70      	move.l -144(a5),-(sp)
    267c:	7400           	moveq #0,d2
    267e:	3405           	move.w d5,d2
    2680:	2f02           	move.l d2,-(sp)
    2682:	2f04           	move.l d4,-(sp)
    2684:	4879 0000 7248 	pea 7248 <destlinezoom16>
    268a:	4e92           	jsr (a2)
    268c:	206d ff70      	movea.l -144(a5),a0
    2690:	4868 0001      	pea 1(a0)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    2694:	3605           	move.w d5,d3
    2696:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2698:	3f03           	move.w d3,-(sp)
    269a:	4267           	clr.w -(sp)
    269c:	2044           	movea.l d4,a0
    269e:	4868 0030      	pea 48(a0)
    26a2:	4879 0000 7248 	pea 7248 <destlinezoom16>
    26a8:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    26aa:	2c6d ff70      	movea.l -144(a5),a6
    26ae:	568e           	addq.l #3,a6
    26b0:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    26b4:	2806           	move.l d6,d4
    26b6:	7c23           	moveq #35,d6
    26b8:	dcad ff70      	add.l -144(a5),d6
    }
    
    for(int i2=0;i2<16;i2++) {
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    26bc:	2f0e           	move.l a6,-(sp)
    26be:	2f02           	move.l d2,-(sp)
    26c0:	2f0b           	move.l a3,-(sp)
    26c2:	4879 0000 7248 	pea 7248 <destlinezoom16>
    26c8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    26ca:	486e 0001      	pea 1(a6)
    26ce:	2f02           	move.l d2,-(sp)
    26d0:	486b 0030      	pea 48(a3)
    26d4:	4879 0000 7248 	pea 7248 <destlinezoom16>
    26da:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    26dc:	3a03           	move.w d3,d5
    26de:	41eb 00c0      	lea 192(a3),a0
    26e2:	548e           	addq.l #2,a6
    for(int i2=0;i2<16;i2++) {
    26e4:	4fef 0020      	lea 32(sp),sp
    26e8:	bc8e           	cmp.l a6,d6
    26ea:	673a           	beq.s 2726 <main+0x2720>
    26ec:	2644           	movea.l d4,a3
    26ee:	2808           	move.l a0,d4
    26f0:	7400           	moveq #0,d2
    26f2:	3403           	move.w d3,d2
    26f4:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    26f6:	2f0e           	move.l a6,-(sp)
    26f8:	2f02           	move.l d2,-(sp)
    26fa:	2f0b           	move.l a3,-(sp)
    26fc:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2702:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    2704:	486e 0001      	pea 1(a6)
    2708:	2f02           	move.l d2,-(sp)
    270a:	486b 0030      	pea 48(a3)
    270e:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2714:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2716:	3a03           	move.w d3,d5
    2718:	41eb 00c0      	lea 192(a3),a0
    271c:	548e           	addq.l #2,a6
    for(int i2=0;i2<16;i2++) {
    271e:	4fef 0020      	lea 32(sp),sp
    2722:	bc8e           	cmp.l a6,d6
    2724:	66c6           	bne.s 26ec <main+0x26e6>
    2726:	7022           	moveq #34,d0
    2728:	d1ad ff70      	add.l d0,-144(a5)
  for(int i=0;i<7;i++) {
    272c:	0cad 0000 00fb 	cmpi.l #251,-144(a5)
    2732:	ff70 
    2734:	6700 00f2      	beq.w 2828 <main+0x2822>
    2738:	2c0b           	move.l a3,d6
    273a:	0686 0000 0120 	addi.l #288,d6
    2740:	2648           	movea.l a0,a3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2742:	2f2d ff70      	move.l -144(a5),-(sp)
    2746:	7400           	moveq #0,d2
    2748:	3405           	move.w d5,d2
    274a:	2f02           	move.l d2,-(sp)
    274c:	2f04           	move.l d4,-(sp)
    274e:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2754:	4e92           	jsr (a2)
    2756:	206d ff70      	movea.l -144(a5),a0
    275a:	4868 0001      	pea 1(a0)
      mask = mask ^ 0xffff;
    275e:	3605           	move.w d5,d3
    2760:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2762:	3f03           	move.w d3,-(sp)
    2764:	4267           	clr.w -(sp)
    2766:	2044           	movea.l d4,a0
    2768:	4868 0030      	pea 48(a0)
    276c:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2772:	4e92           	jsr (a2)
      mask = mask ^ 0xffff;
    2774:	2c6d ff70      	movea.l -144(a5),a6
    2778:	568e           	addq.l #3,a6
    277a:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    277e:	2806           	move.l d6,d4
    2780:	7c23           	moveq #35,d6
    2782:	dcad ff70      	add.l -144(a5),d6
    2786:	6000 ff34      	bra.w 26bc <main+0x26b6>
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    278a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2790:	4eae ffc4      	jsr -60(a6)
    2794:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    279a:	2200           	move.l d0,d1
    279c:	243c 0000 4eb8 	move.l #20152,d2
    27a2:	762c           	moveq #44,d3
    27a4:	4eae ffd0      	jsr -48(a6)
    27a8:	6000 da0a      	bra.w 1b4 <main+0x1ae>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    27ac:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    27b2:	4eae ffc4      	jsr -60(a6)
    27b6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    27bc:	2200           	move.l d0,d1
    27be:	243c 0000 4c9b 	move.l #19611,d2
    27c4:	7621           	moveq #33,d3
    27c6:	4eae ffd0      	jsr -48(a6)
    27ca:	2079 0000 762e 	movea.l 762e <Copperlist1>,a0
    27d0:	6000 db56      	bra.w 328 <main+0x322>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    27d4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    27da:	4eae ffc4      	jsr -60(a6)
    27de:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    27e4:	2200           	move.l d0,d1
    27e6:	243c 0000 4eee 	move.l #20206,d2
    27ec:	7636           	moveq #54,d3
    27ee:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    27f2:	23fc 0004 0000 	move.l #262144,7622 <DrawBuffer>
    27f8:	0000 7622 
  ViewBuffer = (ULONG *)0x50000;
    27fc:	23fc 0005 0000 	move.l #327680,7616 <ViewBuffer>
    2802:	0000 7616 
  SetBplPointers();
    2806:	45f9 0000 3e1e 	lea 3e1e <SetBplPointers>,a2
    280c:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    280e:	0cb9 0005 0000 	cmpi.l #327680,7622 <DrawBuffer>
    2814:	0000 7622 
    2818:	6600 da72      	bne.w 28c <main+0x286>
    281c:	6000 05c2      	bra.w 2de0 <main+0x2dda>
    2820:	7600           	moveq #0,d3
    2822:	3602           	move.w d2,d3
    2824:	6000 e4d0      	bra.w cf6 <main+0xcf0>
    2828:	2b44 ff74      	move.l d4,-140(a5)
    282c:	2b4b ff84      	move.l a3,-124(a5)
    2830:	2647           	movea.l d7,a3
    2832:	2c48           	movea.l a0,a6
    }
  }

  for(int i2=0;i2<2;i2++) {
    TestRow( valsupposed, valactual, mask, 251+i2);
    2834:	2f2d ff70      	move.l -144(a5),-(sp)
    2838:	7800           	moveq #0,d4
    283a:	3803           	move.w d3,d4
    283c:	2f04           	move.l d4,-(sp)
    283e:	2f2d ff74      	move.l -140(a5),-(sp)
    2842:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2848:	4e92           	jsr (a2)
    284a:	4878 00fc      	pea fc <main+0xf6>
    284e:	2f02           	move.l d2,-(sp)
    2850:	206d ff84      	movea.l -124(a5),a0
    2854:	4868 0090      	pea 144(a0)
    2858:	4879 0000 7248 	pea 7248 <destlinezoom16>
    285e:	4e92           	jsr (a2)
    2860:	4fef 0020      	lea 32(sp),sp
    2864:	2b7c 0000 00fd 	move.l #253,-144(a5)
    286a:	ff70 
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    286c:	2f2d ff70      	move.l -144(a5),-(sp)
    2870:	2f04           	move.l d4,-(sp)
    2872:	2f0e           	move.l a6,-(sp)
    2874:	4879 0000 7248 	pea 7248 <destlinezoom16>
    287a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    287c:	206d ff70      	movea.l -144(a5),a0
    2880:	4868 0001      	pea 1(a0)
    2884:	2f04           	move.l d4,-(sp)
    2886:	486e 0030      	pea 48(a6)
    288a:	4879 0000 7248 	pea 7248 <destlinezoom16>
    2890:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2892:	4645           	not.w d5
    2894:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2898:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    289c:	4fef 0020      	lea 32(sp),sp
    28a0:	0cad 0000 010d 	cmpi.l #269,-144(a5)
    28a6:	ff70 
    28a8:	6742           	beq.s 28ec <main+0x28e6>
    28aa:	7800           	moveq #0,d4
    28ac:	3805           	move.w d5,d4
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    28ae:	2f2d ff70      	move.l -144(a5),-(sp)
    28b2:	2f04           	move.l d4,-(sp)
    28b4:	2f0e           	move.l a6,-(sp)
    28b6:	4879 0000 7248 	pea 7248 <destlinezoom16>
    28bc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    28be:	206d ff70      	movea.l -144(a5),a0
    28c2:	4868 0001      	pea 1(a0)
    28c6:	2f04           	move.l d4,-(sp)
    28c8:	486e 0030      	pea 48(a6)
    28cc:	4879 0000 7248 	pea 7248 <destlinezoom16>
    28d2:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    28d4:	4645           	not.w d5
    28d6:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    28da:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<8;i2++) {
    28de:	4fef 0020      	lea 32(sp),sp
    28e2:	0cad 0000 010d 	cmpi.l #269,-144(a5)
    28e8:	ff70 
    28ea:	66be           	bne.s 28aa <main+0x28a4>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 16);
    28ec:	4878 0010      	pea 10 <main+0xa>
    28f0:	2f0b           	move.l a3,-(sp)
    28f2:	2f0c           	move.l a4,-(sp)
    28f4:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    28fa:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2900:	4eae ff1c      	jsr -228(a6)
    2904:	4fef 000c      	lea 12(sp),sp
    2908:	307c 0001      	movea.w #1,a0
    290c:	2b48 ff70      	move.l a0,-144(a5)
  valactual = destination+2; 
  valsupposed = destlinezoom17;

  mask = 0xffff;
    2910:	7cff           	moveq #-1,d6
    2912:	2c6d ff7c      	movea.l -132(a5),a6

  for(int i2=0;i2<5;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    2916:	7400           	moveq #0,d2
    2918:	3406           	move.w d6,d2
    291a:	206d ff70      	movea.l -144(a5),a0
    291e:	4868 ffff      	pea -1(a0)
    2922:	2f02           	move.l d2,-(sp)
    2924:	2f0e           	move.l a6,-(sp)
    2926:	4879 0000 721c 	pea 721c <destlinezoom17>
    292c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    292e:	2f2d ff70      	move.l -144(a5),-(sp)
    2932:	2f02           	move.l d2,-(sp)
    2934:	486e 0030      	pea 48(a6)
    2938:	4879 0000 721c 	pea 721c <destlinezoom17>
    293e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2940:	4646           	not.w d6
    2942:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2946:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<5;i2++) {
    294a:	4fef 0020      	lea 32(sp),sp
    294e:	700b           	moveq #11,d0
    2950:	b0ad ff70      	cmp.l -144(a5),d0
    2954:	66c0           	bne.s 2916 <main+0x2910>
    2956:	280b           	move.l a3,d4
    2958:	0684 0000 01e4 	addi.l #484,d4
    295e:	307c 000a      	movea.w #10,a0
    2962:	2b48 ff70      	move.l a0,-144(a5)
    2966:	2a0b           	move.l a3,d5
    2968:	2644           	movea.l d4,a3
    296a:	280c           	move.l a4,d4
  }

  for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 10+i*35);
    296c:	2f2d ff70      	move.l -144(a5),-(sp)
    2970:	3f06           	move.w d6,-(sp)
    2972:	4267           	clr.w -(sp)
    2974:	2f0b           	move.l a3,-(sp)
    2976:	4879 0000 721c 	pea 721c <destlinezoom17>
    297c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    297e:	4deb 0030      	lea 48(a3),a6
      mask = mask ^ 0xffff;
    2982:	3e06           	move.w d6,d7
    2984:	4647           	not.w d7
    
    for(int i2=0;i2<17;i2++) {
    2986:	286d ff70      	movea.l -144(a5),a4
    298a:	528c           	addq.l #1,a4
    298c:	4fef 0010      	lea 16(sp),sp
    2990:	47eb 0690      	lea 1680(a3),a3
    2994:	260b           	move.l a3,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    2996:	7400           	moveq #0,d2
    2998:	3407           	move.w d7,d2
    299a:	2f0c           	move.l a4,-(sp)
    299c:	2f02           	move.l d2,-(sp)
    299e:	2f0e           	move.l a6,-(sp)
    29a0:	4879 0000 721c 	pea 721c <destlinezoom17>
    29a6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    29a8:	486c 0001      	pea 1(a4)
    29ac:	2f02           	move.l d2,-(sp)
    29ae:	486e 0030      	pea 48(a6)
    29b2:	4879 0000 721c 	pea 721c <destlinezoom17>
    29b8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    29ba:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    29be:	4647           	not.w d7
    29c0:	3c07           	move.w d7,d6
    29c2:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    29c4:	4fef 0020      	lea 32(sp),sp
    29c8:	b68e           	cmp.l a6,d3
    29ca:	66ca           	bne.s 2996 <main+0x2990>
    29cc:	7023           	moveq #35,d0
    29ce:	d1ad ff70      	add.l d0,-144(a5)
  for(int i=0;i<7;i++) {
    29d2:	0cad 0000 00ff 	cmpi.l #255,-144(a5)
    29d8:	ff70 
    29da:	6690           	bne.s 296c <main+0x2966>
    29dc:	2844           	movea.l d4,a4
    29de:	2645           	movea.l d5,a3
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    29e0:	2f2d ff70      	move.l -144(a5),-(sp)
    29e4:	3f07           	move.w d7,-(sp)
    29e6:	4267           	clr.w -(sp)
    29e8:	486b 2fd4      	pea 12244(a3)
    29ec:	4879 0000 721c 	pea 721c <destlinezoom17>
    29f2:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    29f4:	4deb 3004      	lea 12292(a3),a6
    29f8:	4fef 0010      	lea 16(sp),sp
    29fc:	2b7c 0000 0100 	move.l #256,-144(a5)
    2a02:	ff70 
  mask = mask ^ 0xffff;

  for(int i2=0;i2<7;i2++) {
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2a04:	2f2d ff70      	move.l -144(a5),-(sp)
    2a08:	2f02           	move.l d2,-(sp)
    2a0a:	2f0e           	move.l a6,-(sp)
    2a0c:	4879 0000 721c 	pea 721c <destlinezoom17>
    2a12:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2a14:	206d ff70      	movea.l -144(a5),a0
    2a18:	4868 0001      	pea 1(a0)
    2a1c:	2f02           	move.l d2,-(sp)
    2a1e:	486e 0030      	pea 48(a6)
    2a22:	4879 0000 721c 	pea 721c <destlinezoom17>
    2a28:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2a2a:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2a2e:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    2a32:	4fef 0020      	lea 32(sp),sp
    2a36:	0cad 0000 010e 	cmpi.l #270,-144(a5)
    2a3c:	ff70 
    2a3e:	6742           	beq.s 2a82 <main+0x2a7c>
    2a40:	7400           	moveq #0,d2
    2a42:	3407           	move.w d7,d2
    2a44:	4647           	not.w d7
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2a46:	2f2d ff70      	move.l -144(a5),-(sp)
    2a4a:	2f02           	move.l d2,-(sp)
    2a4c:	2f0e           	move.l a6,-(sp)
    2a4e:	4879 0000 721c 	pea 721c <destlinezoom17>
    2a54:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2a56:	206d ff70      	movea.l -144(a5),a0
    2a5a:	4868 0001      	pea 1(a0)
    2a5e:	2f02           	move.l d2,-(sp)
    2a60:	486e 0030      	pea 48(a6)
    2a64:	4879 0000 721c 	pea 721c <destlinezoom17>
    2a6a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2a6c:	54ad ff70      	addq.l #2,-144(a5)
    valactual += ZMLINESIZE/2;
    2a70:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    2a74:	4fef 0020      	lea 32(sp),sp
    2a78:	0cad 0000 010e 	cmpi.l #270,-144(a5)
    2a7e:	ff70 
    2a80:	66be           	bne.s 2a40 <main+0x2a3a>
  tmp = source;
  source = destination;
  destination = tmp;

  UWORD *bp = (UWORD *)0x200;
  *bp = 0;
    2a82:	4278 0200      	clr.w 200 <main+0x1fa>
  Zoom_ZoomIntoPicture( source, destination, 17);
    2a86:	4878 0011      	pea 11 <main+0xb>
    2a8a:	2f0c           	move.l a4,-(sp)
    2a8c:	2f0b           	move.l a3,-(sp)
    2a8e:	4eb9 0000 35e6 	jsr 35e6 <Zoom_ZoomIntoPicture>
  WaitBlit();
    2a94:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2a9a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom18;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);
    2a9e:	42a7           	clr.l -(sp)
    2aa0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2aa6:	2f2d ff6c      	move.l -148(a5),-(sp)
    2aaa:	4879 0000 71f0 	pea 71f0 <destlinezoom18>
    2ab0:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i2=0;i2<5;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2ab2:	4878 0001      	pea 1 <_start+0x1>
    2ab6:	42a7           	clr.l -(sp)
    2ab8:	2f2d ff80      	move.l -128(a5),-(sp)
    2abc:	4879 0000 71f0 	pea 71f0 <destlinezoom18>
    2ac2:	4e92           	jsr (a2)
    2ac4:	4fef 002c      	lea 44(sp),sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    2ac8:	4eb9 0000 3e4a 	jsr 3e4a <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2ace:	4878 0010      	pea 10 <main+0xa>
    2ad2:	4879 0000 7570 	pea 7570 <ClsSprites>
    2ad8:	42a7           	clr.l -(sp)
    2ada:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
    2ae0:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
    2ae6:	4fef 0010      	lea 16(sp),sp
    2aea:	4a80           	tst.l d0
    2aec:	661e           	bne.s 2b0c <main+0x2b06>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2aee:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2af4:	4eae ffc4      	jsr -60(a6)
    2af8:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2afe:	2200           	move.l d0,d1
    2b00:	243c 0000 4eb8 	move.l #20152,d2
    2b06:	762c           	moveq #44,d3
    2b08:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2b0c:	4878 000c      	pea c <main+0x6>
    2b10:	4879 0000 7540 	pea 7540 <ClScreen>
    2b16:	4878 0010      	pea 10 <main+0xa>
    2b1a:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
    2b20:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
    2b26:	4fef 0010      	lea 16(sp),sp
    2b2a:	4a80           	tst.l d0
    2b2c:	661e           	bne.s 2b4c <main+0x2b46>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    2b2e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2b34:	4eae ffc4      	jsr -60(a6)
    2b38:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2b3e:	2200           	move.l d0,d1
    2b40:	243c 0000 4eee 	move.l #20206,d2
    2b46:	7636           	moveq #54,d3
    2b48:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2b4c:	4878 0002      	pea 2 <_start+0x2>
    2b50:	4879 0000 7538 	pea 7538 <ClColor>
    2b56:	4878 001e      	pea 1e <main+0x18>
    2b5a:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
    2b60:	4eb9 0000 319c 	jsr 319c <TestCopperlistBatch>
    2b66:	4fef 0010      	lea 16(sp),sp
    2b6a:	4a80           	tst.l d0
    2b6c:	661e           	bne.s 2b8c <main+0x2b86>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2b6e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2b74:	4eae ffc4      	jsr -60(a6)
    2b78:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2b7e:	2200           	move.l d0,d1
    2b80:	243c 0000 4c9b 	move.l #19611,d2
    2b86:	7621           	moveq #33,d3
    2b88:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2b8c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc521>
    2b90:	4878 0020      	pea 20 <main+0x1a>
    2b94:	2f39 0000 762e 	move.l 762e <Copperlist1>,-(sp)
    2b9a:	4eb9 0000 317e 	jsr 317e <TestCopperlistPos>
    2ba0:	4fef 000c      	lea 12(sp),sp
    2ba4:	4a80           	tst.l d0
    2ba6:	661e           	bne.s 2bc6 <main+0x2bc0>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    2ba8:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2bae:	4eae ffc4      	jsr -60(a6)
    2bb2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2bb8:	2200           	move.l d0,d1
    2bba:	243c 0000 4cbd 	move.l #19645,d2
    2bc0:	7622           	moveq #34,d3
    2bc2:	4eae ffd0      	jsr -48(a6)

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    2bc6:	2479 0000 7622 	movea.l 7622 <DrawBuffer>,a2
    2bcc:	4879 0000 516b 	pea 516b <incbin_swfont_end+0x6e5>
    2bd2:	2f0a           	move.l a2,-(sp)
    2bd4:	4eb9 0000 2f10 	jsr 2f10 <WriteFont.constprop.3>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    2bda:	508f           	addq.l #8,sp
    2bdc:	0c52 ff00      	cmpi.w #-256,(a2)
    2be0:	671e           	beq.s 2c00 <main+0x2bfa>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    2be2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2be8:	4eae ffc4      	jsr -60(a6)
    2bec:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2bf2:	2200           	move.l d0,d1
    2bf4:	243c 0000 517c 	move.l #20860,d2
    2bfa:	7631           	moveq #49,d3
    2bfc:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    2c00:	2f3c 0000 c800 	move.l #51200,-(sp)
    2c06:	4878 0084      	pea 84 <main+0x7e>
    2c0a:	4eb9 0000 3f88 	jsr 3f88 <FreeDisplay>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    2c10:	247c 00f0 ff60 	movea.l #15794016,a2
    2c16:	508f           	addq.l #8,sp
    2c18:	4a92           	tst.l (a2)
    2c1a:	6718           	beq.s 2c34 <main+0x2c2e>
    2c1c:	4878 0001      	pea 1 <_start+0x1>
    2c20:	47f9 0000 2f5e 	lea 2f5e <warpmode.part.0>,a3
    2c26:	4e93           	jsr (a3)
    2c28:	588f           	addq.l #4,sp
    2c2a:	4a92           	tst.l (a2)
    2c2c:	6706           	beq.s 2c34 <main+0x2c2e>
    2c2e:	42a7           	clr.l -(sp)
    2c30:	4e93           	jsr (a3)
    2c32:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    2c34:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2c3a:	23ee 0022 0000 	move.l 34(a6),75f4 <ActiView>
    2c40:	75f4 
	OwnBlitter();
    2c42:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    2c46:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2c4c:	4eae ff1c      	jsr -228(a6)
	Disable();
    2c50:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2c56:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    2c5a:	2679 0000 760a 	movea.l 760a <hw>,a3
    2c60:	302b 0010      	move.w 16(a3),d0
    2c64:	33c0 0000 75f8 	move.w d0,75f8 <SystemADKCON>
	SystemInts=hw->intenar;
    2c6a:	302b 001c      	move.w 28(a3),d0
    2c6e:	33c0 0000 75fc 	move.w d0,75fc <SystemInts>
	SystemDMA=hw->dmaconr;
    2c74:	302b 0002      	move.w 2(a3),d0
    2c78:	33c0 0000 75fa 	move.w d0,75fa <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    2c7e:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2c84:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
    2c8a:	45f9 0000 3ffa 	lea 3ffa <WaitVbl>,a2
    2c90:	4e92           	jsr (a2)
	WaitVbl();
    2c92:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2c94:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    2c9a:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2ca0:	93c9           	suba.l a1,a1
    2ca2:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2ca6:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2cac:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2cb0:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2cb6:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    2cba:	4e92           	jsr (a2)
	WaitVbl();
    2cbc:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    2cbe:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    2cc4:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    2cca:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    2cd0:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2cd6:	082e 0000 0129 	btst #0,297(a6)
    2cdc:	6700 01e4      	beq.w 2ec2 <main+0x2ebc>
		vbr = (APTR)Supervisor((void*)getvbr);
    2ce0:	7ec0           	moveq #-64,d7
    2ce2:	de8d           	add.l a5,d7
    2ce4:	cf8d           	exg d7,a5
    2ce6:	4eae ffe2      	jsr -30(a6)
    2cea:	cf8d           	exg d7,a5

	VBR=GetVBR();
    2cec:	23c0 0000 75fe 	move.l d0,75fe <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2cf2:	2079 0000 75fe 	movea.l 75fe <VBR.lto_priv.4>,a0
    2cf8:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    2cfc:	23c2 0000 7602 	move.l d2,7602 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    2d02:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
    2d04:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    2d06:	2079 0000 760a 	movea.l 760a <hw>,a0
    2d0c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    2d10:	3028 0002      	move.w 2(a0),d0
    2d14:	0800 000e      	btst #14,d0
    2d18:	66f6           	bne.s 2d10 <main+0x2d0a>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    2d1a:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2d20:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2d26:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    2d2c:	2279 0000 75fe 	movea.l 75fe <VBR.lto_priv.4>,a1
    2d32:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    2d36:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2d3c:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    2d42:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    2d48:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    2d4e:	3039 0000 75fc 	move.w 75fc <SystemInts>,d0
    2d54:	0040 8000      	ori.w #-32768,d0
    2d58:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    2d5c:	3039 0000 75fa 	move.w 75fa <SystemDMA>,d0
    2d62:	0040 8000      	ori.w #-32768,d0
    2d66:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    2d6a:	3039 0000 75f8 	move.w 75f8 <SystemADKCON>,d0
    2d70:	0040 8000      	ori.w #-32768,d0
    2d74:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    2d78:	2279 0000 75f4 	movea.l 75f4 <ActiView>,a1
    2d7e:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2d82:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2d88:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2d8c:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2d92:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    2d96:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2d9c:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    2da0:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    2da6:	4eae fe32      	jsr -462(a6)
	Enable();
    2daa:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2db0:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    2db4:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2dba:	2279 0000 7632 	movea.l 7632 <DOSBase>,a1
    2dc0:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    2dc4:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2dca:	2279 0000 760e 	movea.l 760e <GfxBase>,a1
    2dd0:	4eae fe62      	jsr -414(a6)
}
    2dd4:	7000           	moveq #0,d0
    2dd6:	4ced 5cfc ff40 	movem.l -192(a5),d2-d7/a2-a4/a6
    2ddc:	4e5d           	unlk a5
    2dde:	4e75           	rts
    2de0:	0cb9 0004 0000 	cmpi.l #262144,7616 <ViewBuffer>
    2de6:	0000 7616 
    2dea:	6700 d4be      	beq.w 2aa <main+0x2a4>
    Write( Output(), 
    2dee:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2df4:	4eae ffc4      	jsr -60(a6)
    2df8:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2dfe:	2200           	move.l d0,d1
    2e00:	243c 0000 4be5 	move.l #19429,d2
    2e06:	763b           	moveq #59,d3
    2e08:	4eae ffd0      	jsr -48(a6)
    2e0c:	6000 d49c      	bra.w 2aa <main+0x2a4>
		Exit(0);
    2e10:	9dce           	suba.l a6,a6
    2e12:	7200           	moveq #0,d1
    2e14:	4eae ff70      	jsr -144(a6)
    2e18:	6000 d23a      	bra.w 54 <main+0x4e>
		Exit(0);
    2e1c:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2e22:	7200           	moveq #0,d1
    2e24:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    2e28:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2e2e:	43f9 0000 4baa 	lea 4baa <incbin_swfont_end+0x124>,a1
    2e34:	7000           	moveq #0,d0
    2e36:	4eae fdd8      	jsr -552(a6)
    2e3a:	23c0 0000 7632 	move.l d0,7632 <DOSBase>
	if (!DOSBase)
    2e40:	6600 d212      	bne.w 54 <main+0x4e>
    2e44:	60ca           	bra.s 2e10 <main+0x2e0a>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    2e46:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2e4c:	4eae ffc4      	jsr -60(a6)
    2e50:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2e56:	2200           	move.l d0,d1
    2e58:	243c 0000 507b 	move.l #20603,d2
    2e5e:	7635           	moveq #53,d3
    2e60:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2e64:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    2e6a:	203c 0000 3740 	move.l #14144,d0
    2e70:	7202           	moveq #2,d1
    2e72:	4eae ff3a      	jsr -198(a6)
    2e76:	2840           	movea.l d0,a4
  if( source == 0) {
    2e78:	4a80           	tst.l d0
    2e7a:	6600 dd42      	bne.w bbe <main+0xbb8>
    Write(  Output(), 
    2e7e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2e84:	4eae ffc4      	jsr -60(a6)
    2e88:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2e8e:	2200           	move.l d0,d1
    2e90:	243c 0000 50f2 	move.l #20722,d2
    2e96:	7639           	moveq #57,d3
    2e98:	4eae ffd0      	jsr -48(a6)
    return;
    2e9c:	6000 fc2a      	bra.w 2ac8 <main+0x2ac2>
    Write(  Output(), 
    2ea0:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2ea6:	4eae ffc4      	jsr -60(a6)
    2eaa:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2eb0:	2200           	move.l d0,d1
    2eb2:	243c 0000 4fee 	move.l #20462,d2
    2eb8:	7636           	moveq #54,d3
    2eba:	4eae ffd0      	jsr -48(a6)
    return;
    2ebe:	6000 daa6      	bra.w 966 <main+0x960>
	APTR vbr = 0;
    2ec2:	7000           	moveq #0,d0
	VBR=GetVBR();
    2ec4:	23c0 0000 75fe 	move.l d0,75fe <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2eca:	2079 0000 75fe 	movea.l 75fe <VBR.lto_priv.4>,a0
    2ed0:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    2ed4:	23c2 0000 7602 	move.l d2,7602 <SystemIrq>
	WaitVbl();
    2eda:	4e92           	jsr (a2)
	WaitVbl();
    2edc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    2ede:	2079 0000 760a 	movea.l 760a <hw>,a0
    2ee4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    2ee8:	6000 fe26      	bra.w 2d10 <main+0x2d0a>
    Write(  Output(), 
    2eec:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2ef2:	4eae ffc4      	jsr -60(a6)
    2ef6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    2efc:	2200           	move.l d0,d1
    2efe:	243c 0000 512c 	move.l #20780,d2
    2f04:	763d           	moveq #61,d3
    2f06:	4eae ffd0      	jsr -48(a6)
    return;
    2f0a:	6000 fbbc      	bra.w 2ac8 <main+0x2ac2>
    2f0e:	4e71           	nop

00002f10 <WriteFont.constprop.3>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    2f10:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    2f14:	206f 0008      	movea.l 8(sp),a0
    2f18:	1010           	move.b (a0),d0
    2f1a:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    2f1e:	4880           	ext.w d0
    2f20:	48c0           	ext.l d0
    2f22:	e788           	lsl.l #3,d0
  fntptr += charpos;
    2f24:	4880           	ext.w d0
    2f26:	3040           	movea.w d0,a0
    2f28:	d1c8           	adda.l a0,a0
    2f2a:	d1fc 0000 75b0 	adda.l #30128,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    2f30:	3290           	move.w (a0),(a1)
    2f32:	3368 0002 0050 	move.w 2(a0),80(a1)
    2f38:	3368 0004 00a0 	move.w 4(a0),160(a1)
    2f3e:	3368 0006 00f0 	move.w 6(a0),240(a1)
    2f44:	3368 0008 0140 	move.w 8(a0),320(a1)
    2f4a:	3368 000a 0190 	move.w 10(a0),400(a1)
    2f50:	3368 000c 01e0 	move.w 12(a0),480(a1)
    2f56:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    2f5c:	4e75           	rts

00002f5e <warpmode.part.0>:
void warpmode(int on) 
    2f5e:	598f           	subq.l #4,sp
    2f60:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    2f62:	4aaf 000c      	tst.l 12(sp)
    2f66:	674c           	beq.s 2fb4 <warpmode.part.0+0x56>
    2f68:	4878 0001      	pea 1 <_start+0x1>
    2f6c:	740b           	moveq #11,d2
    2f6e:	d48f           	add.l sp,d2
    2f70:	2f02           	move.l d2,-(sp)
    2f72:	42a7           	clr.l -(sp)
    2f74:	4879 0000 4aba 	pea 4aba <incbin_swfont_end+0x34>
    2f7a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc522>
    2f7e:	4878 0052      	pea 52 <main+0x4c>
    2f82:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec483>
    2f88:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    2f8c:	203c 0000 4aa0 	move.l #19104,d0
    2f92:	4878 0001      	pea 1 <_start+0x1>
    2f96:	2f02           	move.l d2,-(sp)
    2f98:	42a7           	clr.l -(sp)
    2f9a:	2f00           	move.l d0,-(sp)
    2f9c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc522>
    2fa0:	4878 0052      	pea 52 <main+0x4c>
    2fa4:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec483>
	}
}
    2faa:	4fef 0018      	lea 24(sp),sp
    2fae:	241f           	move.l (sp)+,d2
    2fb0:	588f           	addq.l #4,sp
    2fb2:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    2fb4:	4878 0001      	pea 1 <_start+0x1>
    2fb8:	740b           	moveq #11,d2
    2fba:	d48f           	add.l sp,d2
    2fbc:	2f02           	move.l d2,-(sp)
    2fbe:	42a7           	clr.l -(sp)
    2fc0:	4879 0000 4ac4 	pea 4ac4 <incbin_swfont_end+0x3e>
    2fc6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc522>
    2fca:	4878 0052      	pea 52 <main+0x4c>
    2fce:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec483>
    2fd4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    2fd8:	203c 0000 4a87 	move.l #19079,d0
    2fde:	4878 0001      	pea 1 <_start+0x1>
    2fe2:	2f02           	move.l d2,-(sp)
    2fe4:	42a7           	clr.l -(sp)
    2fe6:	2f00           	move.l d0,-(sp)
    2fe8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc522>
    2fec:	4878 0052      	pea 52 <main+0x4c>
    2ff0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec483>
}
    2ff6:	4fef 0018      	lea 24(sp),sp
    2ffa:	241f           	move.l (sp)+,d2
    2ffc:	588f           	addq.l #4,sp
    2ffe:	4e75           	rts

00003000 <KPrintF>:
{
    3000:	4fef ff80      	lea -128(sp),sp
    3004:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    3008:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec483>
    300e:	6734           	beq.s 3044 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    3010:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3016:	206f 0090      	movea.l 144(sp),a0
    301a:	43ef 0094      	lea 148(sp),a1
    301e:	45f9 0000 42c0 	lea 42c0 <PutChar>,a2
    3024:	47ef 000c      	lea 12(sp),a3
    3028:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    302c:	2f0b           	move.l a3,-(sp)
    302e:	4878 0056      	pea 56 <main+0x50>
    3032:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec483>
    3038:	508f           	addq.l #8,sp
}
    303a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    303e:	4fef 0080      	lea 128(sp),sp
    3042:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    3044:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    304a:	206f 0090      	movea.l 144(sp),a0
    304e:	43ef 0094      	lea 148(sp),a1
    3052:	45f9 0000 42b2 	lea 42b2 <KPutCharX>,a2
    3058:	97cb           	suba.l a3,a3
    305a:	4eae fdf6      	jsr -522(a6)
}
    305e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    3062:	4fef 0080      	lea 128(sp),sp
    3066:	4e75           	rts

00003068 <TestRow>:
    mask = mask ^ 0xffff;
  }
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    3068:	4fef ff94      	lea -108(sp),sp
    306c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    3070:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
    3076:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
    307a:	7a34           	moveq #52,d5
    307c:	da8f           	add.l sp,d5
    307e:	4878 0064      	pea 64 <main+0x5e>
    3082:	42a7           	clr.l -(sp)
    3084:	2f05           	move.l d5,-(sp)
    3086:	4eba 104a      	jsr 40d2 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    308a:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
    3090:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    3094:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
    3098:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
    309c:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    309e:	2e3c 0000 4acf 	move.l #19151,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    30a4:	301c           	move.w (a4)+,d0
    30a6:	bd40           	eor.w d6,d0
    30a8:	b05d           	cmp.w (a5)+,d0
    30aa:	6736           	beq.s 30e2 <TestRow+0x7a>
      data[0] = i;
    30ac:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    30b0:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    30b6:	2047           	movea.l d7,a0
    30b8:	43ef 0030      	lea 48(sp),a1
    30bc:	45f9 0000 42c0 	lea 42c0 <PutChar>,a2
    30c2:	2645           	movea.l d5,a3
    30c4:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    30c8:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    30ce:	4eae ffc4      	jsr -60(a6)
    30d2:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    30d8:	2200           	move.l d0,d1
    30da:	2405           	move.l d5,d2
    30dc:	7664           	moveq #100,d3
    30de:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    30e2:	5284           	addq.l #1,d4
    30e4:	7015           	moveq #21,d0
    30e6:	b084           	cmp.l d4,d0
    30e8:	66ba           	bne.s 30a4 <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    30ea:	206f 00a0      	movea.l 160(sp),a0
    30ee:	3028 002a      	move.w 42(a0),d0
    30f2:	322f 002e      	move.w 46(sp),d1
    30f6:	b340           	eor.w d1,d0
    30f8:	206f 009c      	movea.l 156(sp),a0
    30fc:	3228 002a      	move.w 42(a0),d1
    3100:	b340           	eor.w d1,d0
    3102:	0240 ff00      	andi.w #-256,d0
    3106:	660a           	bne.s 3112 <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    3108:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    310c:	4fef 006c      	lea 108(sp),sp
    3110:	4e75           	rts
    data[0] = 21;
    3112:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    3118:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    311e:	41f9 0000 4acf 	lea 4acf <incbin_swfont_end+0x49>,a0
    3124:	43ef 0030      	lea 48(sp),a1
    3128:	45f9 0000 42c0 	lea 42c0 <PutChar>,a2
    312e:	47ef 0034      	lea 52(sp),a3
    3132:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    3136:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    313c:	4eae ffc4      	jsr -60(a6)
    3140:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3146:	2200           	move.l d0,d1
    3148:	240b           	move.l a3,d2
    314a:	7664           	moveq #100,d3
    314c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    3150:	206f 00a0      	movea.l 160(sp),a0
    3154:	7000           	moveq #0,d0
    3156:	3028 002a      	move.w 42(a0),d0
    315a:	2f00           	move.l d0,-(sp)
    315c:	206f 00a0      	movea.l 160(sp),a0
    3160:	3028 002a      	move.w 42(a0),d0
    3164:	2f00           	move.l d0,-(sp)
    3166:	4879 0000 4aff 	pea 4aff <incbin_swfont_end+0x79>
    316c:	4eba fe92      	jsr 3000 <KPrintF>(pc)
    3170:	4fef 000c      	lea 12(sp),sp
}
    3174:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3178:	4fef 006c      	lea 108(sp),sp
    317c:	4e75           	rts

0000317e <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    317e:	202f 0008      	move.l 8(sp),d0
    3182:	d080           	add.l d0,d0
    3184:	d080           	add.l d0,d0
    3186:	206f 0004      	movea.l 4(sp),a0
    318a:	2030 0800      	move.l (0,a0,d0.l),d0
    318e:	b0af 000c      	cmp.l 12(sp),d0
    3192:	57c0           	seq d0
    3194:	4880           	ext.w d0
    3196:	48c0           	ext.l d0
}
    3198:	4480           	neg.l d0
    319a:	4e75           	rts

0000319c <TestCopperlistBatch>:
                                                                  long length) {
    319c:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    31a0:	246f 0010      	movea.l 16(sp),a2
    31a4:	206f 0014      	movea.l 20(sp),a0
    31a8:	226f 0018      	movea.l 24(sp),a1
    31ac:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    31b0:	2008           	move.l a0,d0
    31b2:	d088           	add.l a0,d0
    31b4:	d080           	add.l d0,d0
    31b6:	2411           	move.l (a1),d2
    31b8:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    31bc:	6600 01ac      	bne.w 336a <TestCopperlistBatch+0x1ce>
    31c0:	2008           	move.l a0,d0
    31c2:	5280           	addq.l #1,d0
    31c4:	d080           	add.l d0,d0
    31c6:	d080           	add.l d0,d0
    31c8:	2032 0800      	move.l (0,a2,d0.l),d0
    31cc:	b0a9 0004      	cmp.l 4(a1),d0
    31d0:	6600 0198      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    31d4:	7002           	moveq #2,d0
    31d6:	b081           	cmp.l d1,d0
    31d8:	6700 0188      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    31dc:	2008           	move.l a0,d0
    31de:	5480           	addq.l #2,d0
    31e0:	d080           	add.l d0,d0
    31e2:	d080           	add.l d0,d0
    31e4:	2032 0800      	move.l (0,a2,d0.l),d0
    31e8:	b0a9 0008      	cmp.l 8(a1),d0
    31ec:	6600 017c      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    31f0:	7403           	moveq #3,d2
    31f2:	b481           	cmp.l d1,d2
    31f4:	6700 016c      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    31f8:	2008           	move.l a0,d0
    31fa:	5680           	addq.l #3,d0
    31fc:	d080           	add.l d0,d0
    31fe:	d080           	add.l d0,d0
    3200:	2032 0800      	move.l (0,a2,d0.l),d0
    3204:	b0a9 000c      	cmp.l 12(a1),d0
    3208:	6600 0160      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    320c:	7004           	moveq #4,d0
    320e:	b081           	cmp.l d1,d0
    3210:	6700 0150      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3214:	2008           	move.l a0,d0
    3216:	5880           	addq.l #4,d0
    3218:	d080           	add.l d0,d0
    321a:	d080           	add.l d0,d0
    321c:	2032 0800      	move.l (0,a2,d0.l),d0
    3220:	b0a9 0010      	cmp.l 16(a1),d0
    3224:	6600 0144      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3228:	7405           	moveq #5,d2
    322a:	b481           	cmp.l d1,d2
    322c:	6700 0134      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3230:	2008           	move.l a0,d0
    3232:	5a80           	addq.l #5,d0
    3234:	d080           	add.l d0,d0
    3236:	d080           	add.l d0,d0
    3238:	2032 0800      	move.l (0,a2,d0.l),d0
    323c:	b0a9 0014      	cmp.l 20(a1),d0
    3240:	6600 0128      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3244:	7006           	moveq #6,d0
    3246:	b081           	cmp.l d1,d0
    3248:	6700 0118      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    324c:	2008           	move.l a0,d0
    324e:	5c80           	addq.l #6,d0
    3250:	d080           	add.l d0,d0
    3252:	d080           	add.l d0,d0
    3254:	2032 0800      	move.l (0,a2,d0.l),d0
    3258:	b0a9 0018      	cmp.l 24(a1),d0
    325c:	6600 010c      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3260:	7407           	moveq #7,d2
    3262:	b481           	cmp.l d1,d2
    3264:	6700 00fc      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3268:	2008           	move.l a0,d0
    326a:	5e80           	addq.l #7,d0
    326c:	d080           	add.l d0,d0
    326e:	d080           	add.l d0,d0
    3270:	2032 0800      	move.l (0,a2,d0.l),d0
    3274:	b0a9 001c      	cmp.l 28(a1),d0
    3278:	6600 00f0      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    327c:	7008           	moveq #8,d0
    327e:	b081           	cmp.l d1,d0
    3280:	6700 00e0      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3284:	2008           	move.l a0,d0
    3286:	5080           	addq.l #8,d0
    3288:	d080           	add.l d0,d0
    328a:	d080           	add.l d0,d0
    328c:	2032 0800      	move.l (0,a2,d0.l),d0
    3290:	b0a9 0020      	cmp.l 32(a1),d0
    3294:	6600 00d4      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3298:	7409           	moveq #9,d2
    329a:	b481           	cmp.l d1,d2
    329c:	6700 00c4      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32a0:	47e8 0009      	lea 9(a0),a3
    32a4:	200b           	move.l a3,d0
    32a6:	d08b           	add.l a3,d0
    32a8:	d080           	add.l d0,d0
    32aa:	2032 0800      	move.l (0,a2,d0.l),d0
    32ae:	b0a9 0024      	cmp.l 36(a1),d0
    32b2:	6600 00b6      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    32b6:	700a           	moveq #10,d0
    32b8:	b081           	cmp.l d1,d0
    32ba:	6700 00a6      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32be:	47e8 000a      	lea 10(a0),a3
    32c2:	200b           	move.l a3,d0
    32c4:	d08b           	add.l a3,d0
    32c6:	d080           	add.l d0,d0
    32c8:	2032 0800      	move.l (0,a2,d0.l),d0
    32cc:	b0a9 0028      	cmp.l 40(a1),d0
    32d0:	6600 0098      	bne.w 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    32d4:	740b           	moveq #11,d2
    32d6:	b481           	cmp.l d1,d2
    32d8:	6700 0088      	beq.w 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32dc:	47e8 000b      	lea 11(a0),a3
    32e0:	200b           	move.l a3,d0
    32e2:	d08b           	add.l a3,d0
    32e4:	d080           	add.l d0,d0
    32e6:	2032 0800      	move.l (0,a2,d0.l),d0
    32ea:	b0a9 002c      	cmp.l 44(a1),d0
    32ee:	667a           	bne.s 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    32f0:	700c           	moveq #12,d0
    32f2:	b081           	cmp.l d1,d0
    32f4:	676c           	beq.s 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    32f6:	47e8 000c      	lea 12(a0),a3
    32fa:	200b           	move.l a3,d0
    32fc:	d08b           	add.l a3,d0
    32fe:	d080           	add.l d0,d0
    3300:	2032 0800      	move.l (0,a2,d0.l),d0
    3304:	b0a9 0030      	cmp.l 48(a1),d0
    3308:	6660           	bne.s 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    330a:	740d           	moveq #13,d2
    330c:	b481           	cmp.l d1,d2
    330e:	6752           	beq.s 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3310:	47e8 000d      	lea 13(a0),a3
    3314:	200b           	move.l a3,d0
    3316:	d08b           	add.l a3,d0
    3318:	d080           	add.l d0,d0
    331a:	2032 0800      	move.l (0,a2,d0.l),d0
    331e:	b0a9 0034      	cmp.l 52(a1),d0
    3322:	6646           	bne.s 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3324:	700e           	moveq #14,d0
    3326:	b081           	cmp.l d1,d0
    3328:	6738           	beq.s 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    332a:	47e8 000e      	lea 14(a0),a3
    332e:	200b           	move.l a3,d0
    3330:	d08b           	add.l a3,d0
    3332:	d080           	add.l d0,d0
    3334:	2032 0800      	move.l (0,a2,d0.l),d0
    3338:	b0a9 0038      	cmp.l 56(a1),d0
    333c:	662c           	bne.s 336a <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    333e:	7410           	moveq #16,d2
    3340:	b481           	cmp.l d1,d2
    3342:	661e           	bne.s 3362 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3344:	41e8 000f      	lea 15(a0),a0
    3348:	d1c8           	adda.l a0,a0
    334a:	d1c8           	adda.l a0,a0
    334c:	2070 a800      	movea.l (0,a0,a2.l),a0
    3350:	b1e9 003c      	cmpa.l 60(a1),a0
    3354:	57c0           	seq d0
    3356:	4880           	ext.w d0
    3358:	48c0           	ext.l d0
    335a:	4480           	neg.l d0
}
    335c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3360:	4e75           	rts
  return 1;
    3362:	7001           	moveq #1,d0
}
    3364:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3368:	4e75           	rts
      return 0;
    336a:	7000           	moveq #0,d0
}
    336c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3370:	4e75           	rts

00003372 <ClBuild>:
ULONG * ClbuildSW() {
    3372:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    3376:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    337c:	707b           	moveq #123,d0
    337e:	4600           	not.b d0
    3380:	7202           	moveq #2,d1
    3382:	4eae ff3a      	jsr -198(a6)
    3386:	2440           	movea.l d0,a2
  if( retval == 0) {
    3388:	4a80           	tst.l d0
    338a:	6700 010e      	beq.w 349a <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    338e:	24b9 0000 7570 	move.l 7570 <ClsSprites>,(a2)
    3394:	2579 0000 7574 	move.l 7574 <ClsSprites+0x4>,4(a2)
    339a:	0004 
    339c:	2579 0000 7578 	move.l 7578 <ClsSprites+0x8>,8(a2)
    33a2:	0008 
    33a4:	2579 0000 757c 	move.l 757c <ClsSprites+0xc>,12(a2)
    33aa:	000c 
    33ac:	2579 0000 7580 	move.l 7580 <ClsSprites+0x10>,16(a2)
    33b2:	0010 
    33b4:	2579 0000 7584 	move.l 7584 <ClsSprites+0x14>,20(a2)
    33ba:	0014 
    33bc:	2579 0000 7588 	move.l 7588 <ClsSprites+0x18>,24(a2)
    33c2:	0018 
    33c4:	2579 0000 758c 	move.l 758c <ClsSprites+0x1c>,28(a2)
    33ca:	001c 
    33cc:	2579 0000 7590 	move.l 7590 <ClsSprites+0x20>,32(a2)
    33d2:	0020 
    33d4:	2579 0000 7594 	move.l 7594 <ClsSprites+0x24>,36(a2)
    33da:	0024 
    33dc:	2579 0000 7598 	move.l 7598 <ClsSprites+0x28>,40(a2)
    33e2:	0028 
    33e4:	2579 0000 759c 	move.l 759c <ClsSprites+0x2c>,44(a2)
    33ea:	002c 
    33ec:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x30>,48(a2)
    33f2:	0030 
    33f4:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x34>,52(a2)
    33fa:	0034 
    33fc:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x38>,56(a2)
    3402:	0038 
    3404:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x3c>,60(a2)
    340a:	003c 
    *cl++ = *clpartinstruction++;
    340c:	2579 0000 7540 	move.l 7540 <ClScreen>,64(a2)
    3412:	0040 
    3414:	2579 0000 7544 	move.l 7544 <ClScreen+0x4>,68(a2)
    341a:	0044 
    341c:	2579 0000 7548 	move.l 7548 <ClScreen+0x8>,72(a2)
    3422:	0048 
    3424:	2579 0000 754c 	move.l 754c <ClScreen+0xc>,76(a2)
    342a:	004c 
    342c:	2579 0000 7550 	move.l 7550 <ClScreen+0x10>,80(a2)
    3432:	0050 
    3434:	2579 0000 7554 	move.l 7554 <ClScreen+0x14>,84(a2)
    343a:	0054 
    343c:	2579 0000 7558 	move.l 7558 <ClScreen+0x18>,88(a2)
    3442:	0058 
    3444:	2579 0000 755c 	move.l 755c <ClScreen+0x1c>,92(a2)
    344a:	005c 
    344c:	2579 0000 7560 	move.l 7560 <ClScreen+0x20>,96(a2)
    3452:	0060 
    3454:	2579 0000 7564 	move.l 7564 <ClScreen+0x24>,100(a2)
    345a:	0064 
    345c:	2579 0000 7568 	move.l 7568 <ClScreen+0x28>,104(a2)
    3462:	0068 
    3464:	2579 0000 756c 	move.l 756c <ClScreen+0x2c>,108(a2)
    346a:	006c 
  *cl++ = 0x00e00000;
    346c:	257c 00e0 0000 	move.l #14680064,112(a2)
    3472:	0070 
  *cl++ = 0x00e20000;
    3474:	257c 00e2 0000 	move.l #14811136,116(a2)
    347a:	0074 
    *cl++ = *clpartinstruction++;
    347c:	2579 0000 7538 	move.l 7538 <ClColor>,120(a2)
    3482:	0078 
    3484:	2579 0000 753c 	move.l 753c <ClColor+0x4>,124(a2)
    348a:	007c 
  *cl = 0xfffffffe;
    348c:	70fe           	moveq #-2,d0
    348e:	2540 0080      	move.l d0,128(a2)
}
    3492:	200a           	move.l a2,d0
    3494:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3498:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    349a:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    34a0:	4eae ffc4      	jsr -60(a6)
    34a4:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    34aa:	2200           	move.l d0,d1
    34ac:	243c 0000 4b25 	move.l #19237,d2
    34b2:	7628           	moveq #40,d3
    34b4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    34b8:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    34be:	7201           	moveq #1,d1
    34c0:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    34c4:	24b9 0000 7570 	move.l 7570 <ClsSprites>,(a2)
    34ca:	2579 0000 7574 	move.l 7574 <ClsSprites+0x4>,4(a2)
    34d0:	0004 
    34d2:	2579 0000 7578 	move.l 7578 <ClsSprites+0x8>,8(a2)
    34d8:	0008 
    34da:	2579 0000 757c 	move.l 757c <ClsSprites+0xc>,12(a2)
    34e0:	000c 
    34e2:	2579 0000 7580 	move.l 7580 <ClsSprites+0x10>,16(a2)
    34e8:	0010 
    34ea:	2579 0000 7584 	move.l 7584 <ClsSprites+0x14>,20(a2)
    34f0:	0014 
    34f2:	2579 0000 7588 	move.l 7588 <ClsSprites+0x18>,24(a2)
    34f8:	0018 
    34fa:	2579 0000 758c 	move.l 758c <ClsSprites+0x1c>,28(a2)
    3500:	001c 
    3502:	2579 0000 7590 	move.l 7590 <ClsSprites+0x20>,32(a2)
    3508:	0020 
    350a:	2579 0000 7594 	move.l 7594 <ClsSprites+0x24>,36(a2)
    3510:	0024 
    3512:	2579 0000 7598 	move.l 7598 <ClsSprites+0x28>,40(a2)
    3518:	0028 
    351a:	2579 0000 759c 	move.l 759c <ClsSprites+0x2c>,44(a2)
    3520:	002c 
    3522:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x30>,48(a2)
    3528:	0030 
    352a:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x34>,52(a2)
    3530:	0034 
    3532:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x38>,56(a2)
    3538:	0038 
    353a:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x3c>,60(a2)
    3540:	003c 
    *cl++ = *clpartinstruction++;
    3542:	2579 0000 7540 	move.l 7540 <ClScreen>,64(a2)
    3548:	0040 
    354a:	2579 0000 7544 	move.l 7544 <ClScreen+0x4>,68(a2)
    3550:	0044 
    3552:	2579 0000 7548 	move.l 7548 <ClScreen+0x8>,72(a2)
    3558:	0048 
    355a:	2579 0000 754c 	move.l 754c <ClScreen+0xc>,76(a2)
    3560:	004c 
    3562:	2579 0000 7550 	move.l 7550 <ClScreen+0x10>,80(a2)
    3568:	0050 
    356a:	2579 0000 7554 	move.l 7554 <ClScreen+0x14>,84(a2)
    3570:	0054 
    3572:	2579 0000 7558 	move.l 7558 <ClScreen+0x18>,88(a2)
    3578:	0058 
    357a:	2579 0000 755c 	move.l 755c <ClScreen+0x1c>,92(a2)
    3580:	005c 
    3582:	2579 0000 7560 	move.l 7560 <ClScreen+0x20>,96(a2)
    3588:	0060 
    358a:	2579 0000 7564 	move.l 7564 <ClScreen+0x24>,100(a2)
    3590:	0064 
    3592:	2579 0000 7568 	move.l 7568 <ClScreen+0x28>,104(a2)
    3598:	0068 
    359a:	2579 0000 756c 	move.l 756c <ClScreen+0x2c>,108(a2)
    35a0:	006c 
  *cl++ = 0x00e00000;
    35a2:	257c 00e0 0000 	move.l #14680064,112(a2)
    35a8:	0070 
  *cl++ = 0x00e20000;
    35aa:	257c 00e2 0000 	move.l #14811136,116(a2)
    35b0:	0074 
    *cl++ = *clpartinstruction++;
    35b2:	2579 0000 7538 	move.l 7538 <ClColor>,120(a2)
    35b8:	0078 
    35ba:	2579 0000 753c 	move.l 753c <ClColor+0x4>,124(a2)
    35c0:	007c 
  *cl = 0xfffffffe;
    35c2:	70fe           	moveq #-2,d0
    35c4:	2540 0080      	move.l d0,128(a2)
}
    35c8:	200a           	move.l a2,d0
    35ca:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    35ce:	4e75           	rts

000035d0 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    35d0:	2079 0000 760a 	movea.l 760a <hw>,a0
    35d6:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    35da:	3028 0002      	move.w 2(a0),d0
    35de:	0800 000e      	btst #14,d0
    35e2:	66f6           	bne.s 35da <WaitBlt+0xa>
}
    35e4:	4e75           	rts

000035e6 <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    35e6:	4fef fff0      	lea -16(sp),sp
    35ea:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    35ee:	262f 0048      	move.l 72(sp),d3
    35f2:	3403           	move.w d3,d2
  WaitBlit();
    35f4:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    35fa:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
    35fe:	2079 0000 760a 	movea.l 760a <hw>,a0
    3604:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    360a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    3610:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    3616:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    361c:	317c 002c 0066 	move.w #44,102(a0)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    3622:	3803           	move.w d3,d4
    3624:	d843           	add.w d3,d4
    3626:	3204           	move.w d4,d1
    3628:	d244           	add.w d4,d1
    362a:	d243           	add.w d3,d1
    362c:	3001           	move.w d1,d0
    362e:	d041           	add.w d1,d0
    3630:	0640 014c      	addi.w #332,d0
    3634:	3f40 0030      	move.w d0,48(sp)
  WORD shiftright = 9;
    3638:	367c 0009      	movea.w #9,a3
  while( nextzoom > 22 * 16) {
    363c:	0c40 0160      	cmpi.w #352,d0
    3640:	6312           	bls.s 3654 <Zoom_ZoomIntoPicture+0x6e>
    nextzoom -= (19 + zoomnr);
    3642:	0640 ffed      	addi.w #-19,d0
    3646:	9042           	sub.w d2,d0
    shiftright--;
    3648:	534b           	subq.w #1,a3
  while( nextzoom > 22 * 16) {
    364a:	0c40 0160      	cmpi.w #352,d0
    364e:	62f2           	bhi.s 3642 <Zoom_ZoomIntoPicture+0x5c>
    3650:	3f40 0030      	move.w d0,48(sp)
  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    3654:	7a12           	moveq #18,d5
    3656:	9a41           	sub.w d1,d5
    3658:	3f45 0036      	move.w d5,54(sp)
  UWORD shifthoriz = 7;
    365c:	7007           	moveq #7,d0
  while( ZoomHorizontalStart < 0) {
    365e:	4a45           	tst.w d5
    3660:	6c12           	bge.s 3674 <Zoom_ZoomIntoPicture+0x8e>
  UWORD shifthoriz = 7;
    3662:	3205           	move.w d5,d1
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    3664:	0641 0013      	addi.w #19,d1
    3668:	d242           	add.w d2,d1
      shifthoriz--;
    366a:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
    366c:	4a41           	tst.w d1
    366e:	6df4           	blt.s 3664 <Zoom_ZoomIntoPicture+0x7e>
    3670:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3674:	9843           	sub.w d3,d4
    3676:	0644 0012      	addi.w #18,d4
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    367a:	0280 0000 ffff 	andi.l #65535,d0
    3680:	5280           	addq.l #1,d0
    3682:	2200           	move.l d0,d1
    3684:	d280           	add.l d0,d1
    3686:	d081           	add.l d1,d0
    3688:	e988           	lsl.l #4,d0
    368a:	206f 0040      	movea.l 64(sp),a0
    368e:	49f0 08fc      	lea (-4,a0,d0.l),a4
    3692:	7a2c           	moveq #44,d5
    3694:	daaf 0044      	add.l 68(sp),d5
    3698:	2f45 002c      	move.l d5,44(sp)
  UWORD shifttoleft = 0;
    369c:	426f 0034      	clr.w 52(sp)
  UWORD startofword = 21*16;
    36a0:	3c3c 0150      	move.w #336,d6
      nextzoom -= (19 + zoomnr);
    36a4:	7aed           	moveq #-19,d5
    36a6:	9a42           	sub.w d2,d5
    36a8:	3f45 003a      	move.w d5,58(sp)
    ZoomHorizontal = ZoomHorizontalStart;
    36ac:	33ef 0036 0000 	move.w 54(sp),7608 <ZoomHorizontal>
    36b2:	7608 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    36b4:	240c           	move.l a4,d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    36b6:	246f 002c      	movea.l 44(sp),a2
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    36ba:	7600           	moveq #0,d3
    36bc:	362f 0034      	move.w 52(sp),d3
    36c0:	d683           	add.l d3,d3
    36c2:	3f4b 0032      	move.w a3,50(sp)
    36c6:	3e0b           	move.w a3,d7
    36c8:	700c           	moveq #12,d0
    36ca:	e16f           	lsl.w d0,d7
    36cc:	2c79 0000 760e 	movea.l 760e <GfxBase>,a6
    36d2:	7000           	moveq #0,d0
    36d4:	3006           	move.w d6,d0
    36d6:	306f 0030      	movea.w 48(sp),a0
    36da:	b1c0           	cmpa.l d0,a0
    36dc:	6e00 00d0      	bgt.w 37ae <Zoom_ZoomIntoPicture+0x1c8>
  WaitBlit();
    36e0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    36e4:	2079 0000 760a 	movea.l 760a <hw>,a0
    36ea:	0647 09f0      	addi.w #2544,d7
    36ee:	3147 0040      	move.w d7,64(a0)
  hw->bltcon1 = 0;
    36f2:	317c 0000 0042 	move.w #0,66(a0)
    36f8:	3e39 0000 7608 	move.w 7608 <ZoomHorizontal>,d7
    WORD linesleft = 272;
    36fe:	303c 0110      	move.w #272,d0
    3702:	220c           	move.l a4,d1
    3704:	d283           	add.l d3,d1
    3706:	2a41           	movea.l d1,a5
        if( linesleft >= ZoomHorizontal+1) {
    3708:	3a00           	move.w d0,d5
    370a:	b047           	cmp.w d7,d0
    370c:	6f00 0094      	ble.w 37a2 <Zoom_ZoomIntoPicture+0x1bc>
          linesleft -= ZoomHorizontal;
    3710:	3240           	movea.w d0,a1
    3712:	92c7           	suba.w d7,a1
    3714:	3209           	move.w a1,d1
    3716:	3007           	move.w d7,d0
    3718:	3a07           	move.w d7,d5
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    371a:	3e28 0002      	move.w 2(a0),d7
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    371e:	3e28 0002      	move.w 2(a0),d7
    3722:	0807 000e      	btst #14,d7
    3726:	66f6           	bne.s 371e <Zoom_ZoomIntoPicture+0x138>
  hw->bltapt = (UWORD *) source;
    3728:	214d 0050      	move.l a5,80(a0)
  hw->bltdpt = (UWORD *) destination;
    372c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3730:	ed4d           	lsl.w #6,d5
    3732:	5445           	addq.w #2,d5
    3734:	3145 0058      	move.w d5,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3738:	3a40           	movea.w d0,a5
    373a:	200d           	move.l a5,d0
    373c:	d08d           	add.l a5,d0
    373e:	d08d           	add.l a5,d0
    3740:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    3742:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    3744:	4a41           	tst.w d1
    3746:	6e22           	bgt.s 376a <Zoom_ZoomIntoPicture+0x184>
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3748:	33c4 0000 7608 	move.w d4,7608 <ZoomHorizontal>
    startofword -= 16;
    374e:	0646 fff0      	addi.w #-16,d6
    3752:	558c           	subq.l #2,a4
    3754:	55af 002c      	subq.l #2,44(sp)
  for(int i=0;i<22;i++) {
    3758:	0c46 fff0      	cmpi.w #-16,d6
    375c:	6600 ff4e      	bne.w 36ac <Zoom_ZoomIntoPicture+0xc6>
}
    3760:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3764:	4fef 0010      	lea 16(sp),sp
    3768:	4e75           	rts
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    376a:	d480           	add.l d0,d2
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, 1);
    376c:	2a42           	movea.l d2,a5
    376e:	dbc3           	adda.l d3,a5
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3770:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3774:	3028 0002      	move.w 2(a0),d0
    3778:	0800 000e      	btst #14,d0
    377c:	66f6           	bne.s 3774 <Zoom_ZoomIntoPicture+0x18e>
  hw->bltapt = (UWORD *) source;
    377e:	214d 0050      	move.l a5,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3782:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3786:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    378c:	3009           	move.w a1,d0
    378e:	5340           	subq.w #1,d0
          pos4dest += ZMLINESIZE/2;
    3790:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3794:	3e04           	move.w d4,d7
      while(linesleft > 0) {
    3796:	4a40           	tst.w d0
    3798:	67ae           	beq.s 3748 <Zoom_ZoomIntoPicture+0x162>
        if( linesleft >= ZoomHorizontal+1) {
    379a:	3a00           	move.w d0,d5
    379c:	b047           	cmp.w d7,d0
    379e:	6e00 ff70      	bgt.w 3710 <Zoom_ZoomIntoPicture+0x12a>
    37a2:	93c9           	suba.l a1,a1
          linesleft = 0;
    37a4:	4241           	clr.w d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    37a6:	3e28 0002      	move.w 2(a0),d7
    37aa:	6000 ff72      	bra.w 371e <Zoom_ZoomIntoPicture+0x138>
  WaitBlit();
    37ae:	4eae ff1c      	jsr -228(a6)
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    37b2:	302f 0030      	move.w 48(sp),d0
    37b6:	9046           	sub.w d6,d0
    37b8:	5340           	subq.w #1,d0
  if( shiftright == 0) {
    37ba:	3a2f 0032      	move.w 50(sp),d5
    37be:	5345           	subq.w #1,d5
    37c0:	3f45 0038      	move.w d5,56(sp)
    37c4:	4a6f 0032      	tst.w 50(sp)
    37c8:	6600 0114      	bne.w 38de <Zoom_ZoomIntoPicture+0x2f8>
    ZoomBlit_Increment4SrcA = 1;
    37cc:	33fc 0001 0000 	move.w #1,7606 <ZoomBlit_Increment4SrcA>
    37d2:	7606 
    37d4:	323c fde4      	move.w #-540,d1
    37d8:	3a7c 0002      	movea.w #2,a5
  hw->bltcon1 = shiftb; 
    37dc:	2079 0000 760a 	movea.l 760a <hw>,a0
    37e2:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    37e6:	3141 0040      	move.w d1,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    37ea:	0280 0000 ffff 	andi.l #65535,d0
    37f0:	7210           	moveq #16,d1
    37f2:	9280           	sub.l d0,d1
    37f4:	7a00           	moveq #0,d5
    37f6:	4645           	not.w d5
    37f8:	e3ad           	lsl.l d1,d5
    37fa:	3145 0070      	move.w d5,112(a0)
      nextzoom -= (19 + zoomnr);
    37fe:	3a2f 003a      	move.w 58(sp),d5
    3802:	db6f 0030      	add.w d5,48(sp)
      while( linesleft > 0) {
    3806:	3279 0000 7608 	movea.w 7608 <ZoomHorizontal>,a1
    WORD linesleft = 272;
    380c:	303c 0110      	move.w #272,d0
    3810:	220c           	move.l a4,d1
    3812:	d283           	add.l d3,d1
    3814:	2c43           	movea.l d3,a6
    3816:	2641           	movea.l d1,a3
        if( linesleft >= ZoomHorizontal+1) {
    3818:	3a00           	move.w d0,d5
    381a:	b049           	cmp.w a1,d0
    381c:	6f00 00b4      	ble.w 38d2 <Zoom_ZoomIntoPicture+0x2ec>
          linesleft -= ZoomHorizontal;
    3820:	3e00           	move.w d0,d7
    3822:	9e49           	sub.w a1,d7
    3824:	3207           	move.w d7,d1
    3826:	3009           	move.w a1,d0
    3828:	3a09           	move.w a1,d5
    382a:	3268 0002      	movea.w 2(a0),a1
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    382e:	3628 0002      	move.w 2(a0),d3
    3832:	0803 000e      	btst #14,d3
    3836:	66f6           	bne.s 382e <Zoom_ZoomIntoPicture+0x248>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    3838:	43f3 d800      	lea (0,a3,a5.l),a1
    383c:	2149 0050      	move.l a1,80(a0)
  hw->bltbpt = source;
    3840:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
    3844:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3848:	ed4d           	lsl.w #6,d5
    384a:	5445           	addq.w #2,d5
    384c:	3145 0058      	move.w d5,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3850:	3240           	movea.w d0,a1
    3852:	2009           	move.l a1,d0
    3854:	d089           	add.l a1,d0
    3856:	d089           	add.l a1,d0
    3858:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    385a:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    385c:	4a41           	tst.w d1
    385e:	6e34           	bgt.s 3894 <Zoom_ZoomIntoPicture+0x2ae>
    3860:	33c4 0000 7608 	move.w d4,7608 <ZoomHorizontal>
      shiftright--;  
    3866:	366f 0038      	movea.w 56(sp),a3
      if(shiftright < 0) {
    386a:	300b           	move.w a3,d0
    386c:	6c00 fee0      	bge.w 374e <Zoom_ZoomIntoPicture+0x168>
        shiftright += 16;
    3870:	366f 0032      	movea.w 50(sp),a3
    3874:	47eb 000f      	lea 15(a3),a3
        shifttoleft = 1;
    3878:	3f7c 0001 0034 	move.w #1,52(sp)
    startofword -= 16;
    387e:	0646 fff0      	addi.w #-16,d6
    3882:	558c           	subq.l #2,a4
    3884:	55af 002c      	subq.l #2,44(sp)
  for(int i=0;i<22;i++) {
    3888:	0c46 fff0      	cmpi.w #-16,d6
    388c:	6600 fe1e      	bne.w 36ac <Zoom_ZoomIntoPicture+0xc6>
    3890:	6000 fece      	bra.w 3760 <Zoom_ZoomIntoPicture+0x17a>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3894:	d480           	add.l d0,d2
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, 1);
    3896:	47f6 2800      	lea (0,a6,d2.l),a3
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    389a:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    389e:	3028 0002      	move.w 2(a0),d0
    38a2:	0800 000e      	btst #14,d0
    38a6:	66f6           	bne.s 389e <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    38a8:	200b           	move.l a3,d0
    38aa:	d08d           	add.l a5,d0
    38ac:	2140 0050      	move.l d0,80(a0)
  hw->bltbpt = source;
    38b0:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
    38b4:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    38b8:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    38be:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    38c2:	3007           	move.w d7,d0
    38c4:	5340           	subq.w #1,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    38c6:	3244           	movea.w d4,a1
      while( linesleft > 0) {
    38c8:	6796           	beq.s 3860 <Zoom_ZoomIntoPicture+0x27a>
        if( linesleft >= ZoomHorizontal+1) {
    38ca:	3a00           	move.w d0,d5
    38cc:	b049           	cmp.w a1,d0
    38ce:	6e00 ff50      	bgt.w 3820 <Zoom_ZoomIntoPicture+0x23a>
    38d2:	4247           	clr.w d7
          linesleft = 0;
    38d4:	4241           	clr.w d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    38d6:	3268 0002      	movea.w 2(a0),a1
    38da:	6000 ff52      	bra.w 382e <Zoom_ZoomIntoPicture+0x248>
    38de:	3205           	move.w d5,d1
  ZoomBlit_Increment4SrcA = 0;
    38e0:	4279 0000 7606 	clr.w 7606 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    38e6:	7a0c           	moveq #12,d5
    38e8:	eb69           	lsl.w d5,d1
    38ea:	0641 0de4      	addi.w #3556,d1
    38ee:	9bcd           	suba.l a5,a5
  hw->bltcon1 = shiftb; 
    38f0:	2079 0000 760a 	movea.l 760a <hw>,a0
    38f6:	3147 0042      	move.w d7,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    38fa:	3141 0040      	move.w d1,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    38fe:	0280 0000 ffff 	andi.l #65535,d0
    3904:	7210           	moveq #16,d1
    3906:	9280           	sub.l d0,d1
    3908:	7a00           	moveq #0,d5
    390a:	4645           	not.w d5
    390c:	e3ad           	lsl.l d1,d5
    390e:	3145 0070      	move.w d5,112(a0)
      nextzoom -= (19 + zoomnr);
    3912:	3a2f 003a      	move.w 58(sp),d5
    3916:	db6f 0030      	add.w d5,48(sp)
      while( linesleft > 0) {
    391a:	3279 0000 7608 	movea.w 7608 <ZoomHorizontal>,a1
    WORD linesleft = 272;
    3920:	303c 0110      	move.w #272,d0
    3924:	220c           	move.l a4,d1
    3926:	d283           	add.l d3,d1
    3928:	2c43           	movea.l d3,a6
    392a:	2641           	movea.l d1,a3
    392c:	6000 feea      	bra.w 3818 <Zoom_ZoomIntoPicture+0x232>

00003930 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    3930:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    3934:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    393a:	203c 0000 a48c 	move.l #42124,d0
    3940:	7202           	moveq #2,d1
    3942:	4eae ff3a      	jsr -198(a6)
    3946:	2440           	movea.l d0,a2
  if( retval == 0) {
    3948:	4a80           	tst.l d0
    394a:	6700 0160      	beq.w 3aac <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    394e:	24b9 0000 7570 	move.l 7570 <ClsSprites>,(a2)
    3954:	2579 0000 7574 	move.l 7574 <ClsSprites+0x4>,4(a2)
    395a:	0004 
    395c:	2579 0000 7578 	move.l 7578 <ClsSprites+0x8>,8(a2)
    3962:	0008 
    3964:	2579 0000 757c 	move.l 757c <ClsSprites+0xc>,12(a2)
    396a:	000c 
    396c:	2579 0000 7580 	move.l 7580 <ClsSprites+0x10>,16(a2)
    3972:	0010 
    3974:	2579 0000 7584 	move.l 7584 <ClsSprites+0x14>,20(a2)
    397a:	0014 
    397c:	2579 0000 7588 	move.l 7588 <ClsSprites+0x18>,24(a2)
    3982:	0018 
    3984:	2579 0000 758c 	move.l 758c <ClsSprites+0x1c>,28(a2)
    398a:	001c 
    398c:	2579 0000 7590 	move.l 7590 <ClsSprites+0x20>,32(a2)
    3992:	0020 
    3994:	2579 0000 7594 	move.l 7594 <ClsSprites+0x24>,36(a2)
    399a:	0024 
    399c:	2579 0000 7598 	move.l 7598 <ClsSprites+0x28>,40(a2)
    39a2:	0028 
    39a4:	2579 0000 759c 	move.l 759c <ClsSprites+0x2c>,44(a2)
    39aa:	002c 
    39ac:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x30>,48(a2)
    39b2:	0030 
    39b4:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x34>,52(a2)
    39ba:	0034 
    39bc:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x38>,56(a2)
    39c2:	0038 
    39c4:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x3c>,60(a2)
    39ca:	003c 
    *cl++ = *clpartinstruction++;
    39cc:	2579 0000 7508 	move.l 7508 <ClScreenZoom>,64(a2)
    39d2:	0040 
    39d4:	2579 0000 750c 	move.l 750c <ClScreenZoom+0x4>,68(a2)
    39da:	0044 
    39dc:	2579 0000 7510 	move.l 7510 <ClScreenZoom+0x8>,72(a2)
    39e2:	0048 
    39e4:	2579 0000 7514 	move.l 7514 <ClScreenZoom+0xc>,76(a2)
    39ea:	004c 
    39ec:	2579 0000 7518 	move.l 7518 <ClScreenZoom+0x10>,80(a2)
    39f2:	0050 
    39f4:	2579 0000 751c 	move.l 751c <ClScreenZoom+0x14>,84(a2)
    39fa:	0054 
    39fc:	2579 0000 7520 	move.l 7520 <ClScreenZoom+0x18>,88(a2)
    3a02:	0058 
    3a04:	2579 0000 7524 	move.l 7524 <ClScreenZoom+0x1c>,92(a2)
    3a0a:	005c 
    3a0c:	2579 0000 7528 	move.l 7528 <ClScreenZoom+0x20>,96(a2)
    3a12:	0060 
    3a14:	2579 0000 752c 	move.l 752c <ClScreenZoom+0x24>,100(a2)
    3a1a:	0064 
    3a1c:	2579 0000 7530 	move.l 7530 <ClScreenZoom+0x28>,104(a2)
    3a22:	0068 
    3a24:	2579 0000 7534 	move.l 7534 <ClScreenZoom+0x2c>,108(a2)
    3a2a:	006c 
  *cl++ = 0x00e00000;
    3a2c:	257c 00e0 0000 	move.l #14680064,112(a2)
    3a32:	0070 
  *cl++ = 0x00e20000;
    3a34:	257c 00e2 0000 	move.l #14811136,116(a2)
    3a3a:	0074 
  *cl++ = 0x00e40000;
    3a3c:	257c 00e4 0000 	move.l #14942208,120(a2)
    3a42:	0078 
  *cl++ = 0x00e60000;
    3a44:	257c 00e6 0000 	move.l #15073280,124(a2)
    3a4a:	007c 
    *cl++ = *clpartinstruction++;
    3a4c:	2579 0000 7538 	move.l 7538 <ClColor>,128(a2)
    3a52:	0080 
    3a54:	2579 0000 753c 	move.l 753c <ClColor+0x4>,132(a2)
    3a5a:	0084 
    3a5c:	43ea 012c      	lea 300(a2),a1
    3a60:	220a           	move.l a2,d1
    3a62:	0681 0000 a52c 	addi.l #42284,d1
    3a68:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    3a6e:	41e9 ff60      	lea -160(a1),a0
    3a72:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    3a76:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    3a7c:	5088           	addq.l #8,a0
    3a7e:	217c 0182 0f00 	move.l #25300736,-4(a0)
    3a84:	fffc 
    for(int i2=0;i2<20;i2++) {
    3a86:	b3c8           	cmpa.l a0,a1
    3a88:	66ec           	bne.s 3a76 <ClbuildZoom+0x146>
    3a8a:	43e8 00a4      	lea 164(a0),a1
    3a8e:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    3a94:	b3c1           	cmpa.l d1,a1
    3a96:	66d6           	bne.s 3a6e <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    3a98:	203c 0000 a488 	move.l #42120,d0
    3a9e:	72fe           	moveq #-2,d1
    3aa0:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    3aa4:	200a           	move.l a2,d0
    3aa6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3aaa:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    3aac:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3ab2:	4eae ffc4      	jsr -60(a6)
    3ab6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3abc:	2200           	move.l d0,d1
    3abe:	243c 0000 4b25 	move.l #19237,d2
    3ac4:	7628           	moveq #40,d3
    3ac6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3aca:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3ad0:	7201           	moveq #1,d1
    3ad2:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    3ad6:	24b9 0000 7570 	move.l 7570 <ClsSprites>,(a2)
    3adc:	2579 0000 7574 	move.l 7574 <ClsSprites+0x4>,4(a2)
    3ae2:	0004 
    3ae4:	2579 0000 7578 	move.l 7578 <ClsSprites+0x8>,8(a2)
    3aea:	0008 
    3aec:	2579 0000 757c 	move.l 757c <ClsSprites+0xc>,12(a2)
    3af2:	000c 
    3af4:	2579 0000 7580 	move.l 7580 <ClsSprites+0x10>,16(a2)
    3afa:	0010 
    3afc:	2579 0000 7584 	move.l 7584 <ClsSprites+0x14>,20(a2)
    3b02:	0014 
    3b04:	2579 0000 7588 	move.l 7588 <ClsSprites+0x18>,24(a2)
    3b0a:	0018 
    3b0c:	2579 0000 758c 	move.l 758c <ClsSprites+0x1c>,28(a2)
    3b12:	001c 
    3b14:	2579 0000 7590 	move.l 7590 <ClsSprites+0x20>,32(a2)
    3b1a:	0020 
    3b1c:	2579 0000 7594 	move.l 7594 <ClsSprites+0x24>,36(a2)
    3b22:	0024 
    3b24:	2579 0000 7598 	move.l 7598 <ClsSprites+0x28>,40(a2)
    3b2a:	0028 
    3b2c:	2579 0000 759c 	move.l 759c <ClsSprites+0x2c>,44(a2)
    3b32:	002c 
    3b34:	2579 0000 75a0 	move.l 75a0 <ClsSprites+0x30>,48(a2)
    3b3a:	0030 
    3b3c:	2579 0000 75a4 	move.l 75a4 <ClsSprites+0x34>,52(a2)
    3b42:	0034 
    3b44:	2579 0000 75a8 	move.l 75a8 <ClsSprites+0x38>,56(a2)
    3b4a:	0038 
    3b4c:	2579 0000 75ac 	move.l 75ac <ClsSprites+0x3c>,60(a2)
    3b52:	003c 
    *cl++ = *clpartinstruction++;
    3b54:	2579 0000 7508 	move.l 7508 <ClScreenZoom>,64(a2)
    3b5a:	0040 
    3b5c:	2579 0000 750c 	move.l 750c <ClScreenZoom+0x4>,68(a2)
    3b62:	0044 
    3b64:	2579 0000 7510 	move.l 7510 <ClScreenZoom+0x8>,72(a2)
    3b6a:	0048 
    3b6c:	2579 0000 7514 	move.l 7514 <ClScreenZoom+0xc>,76(a2)
    3b72:	004c 
    3b74:	2579 0000 7518 	move.l 7518 <ClScreenZoom+0x10>,80(a2)
    3b7a:	0050 
    3b7c:	2579 0000 751c 	move.l 751c <ClScreenZoom+0x14>,84(a2)
    3b82:	0054 
    3b84:	2579 0000 7520 	move.l 7520 <ClScreenZoom+0x18>,88(a2)
    3b8a:	0058 
    3b8c:	2579 0000 7524 	move.l 7524 <ClScreenZoom+0x1c>,92(a2)
    3b92:	005c 
    3b94:	2579 0000 7528 	move.l 7528 <ClScreenZoom+0x20>,96(a2)
    3b9a:	0060 
    3b9c:	2579 0000 752c 	move.l 752c <ClScreenZoom+0x24>,100(a2)
    3ba2:	0064 
    3ba4:	2579 0000 7530 	move.l 7530 <ClScreenZoom+0x28>,104(a2)
    3baa:	0068 
    3bac:	2579 0000 7534 	move.l 7534 <ClScreenZoom+0x2c>,108(a2)
    3bb2:	006c 
  *cl++ = 0x00e00000;
    3bb4:	257c 00e0 0000 	move.l #14680064,112(a2)
    3bba:	0070 
  *cl++ = 0x00e20000;
    3bbc:	257c 00e2 0000 	move.l #14811136,116(a2)
    3bc2:	0074 
  *cl++ = 0x00e40000;
    3bc4:	257c 00e4 0000 	move.l #14942208,120(a2)
    3bca:	0078 
  *cl++ = 0x00e60000;
    3bcc:	257c 00e6 0000 	move.l #15073280,124(a2)
    3bd2:	007c 
    *cl++ = *clpartinstruction++;
    3bd4:	2579 0000 7538 	move.l 7538 <ClColor>,128(a2)
    3bda:	0080 
    3bdc:	2579 0000 753c 	move.l 753c <ClColor+0x4>,132(a2)
    3be2:	0084 
    3be4:	43ea 012c      	lea 300(a2),a1
    3be8:	220a           	move.l a2,d1
    3bea:	0681 0000 a52c 	addi.l #42284,d1
    3bf0:	203c 2c07 fffe 	move.l #738721790,d0
    3bf6:	6000 fe76      	bra.w 3a6e <ClbuildZoom+0x13e>

00003bfa <Zoom_Init>:
void Zoom_Init() {
    3bfa:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    3bfc:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3c02:	7004           	moveq #4,d0
    3c04:	7202           	moveq #2,d1
    3c06:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    3c0a:	33fc 0010 0000 	move.w #16,7608 <ZoomHorizontal>
    3c10:	7608 
}
    3c12:	2c5f           	movea.l (sp)+,a6
    3c14:	4e75           	rts

00003c16 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    3c16:	2039 0000 761e 	move.l 761e <DrawCopper>,d0
  DrawCopper = ViewCopper;
    3c1c:	23f9 0000 7612 	move.l 7612 <ViewCopper>,761e <DrawCopper>
    3c22:	0000 761e 
  ViewCopper = (ULONG *)tmp;
    3c26:	23c0 0000 7612 	move.l d0,7612 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    3c2c:	2079 0000 760a 	movea.l 760a <hw>,a0
    3c32:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    3c36:	3140 0088      	move.w d0,136(a0)
}
    3c3a:	4e75           	rts

00003c3c <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    3c3c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    3c40:	45fa fcee      	lea 3930 <ClbuildZoom>(pc),a2
    3c44:	4e92           	jsr (a2)
    3c46:	23c0 0000 762e 	move.l d0,762e <Copperlist1>
  Copperlist2 = ClbuildZoom();
    3c4c:	4e92           	jsr (a2)
    3c4e:	23c0 0000 762a 	move.l d0,762a <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3c54:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3c5a:	203c 0001 6800 	move.l #92160,d0
    3c60:	7202           	moveq #2,d1
    3c62:	4eae ff3a      	jsr -198(a6)
    3c66:	23c0 0000 7626 	move.l d0,7626 <Bitplane1>
  if(Bitplane1 == 0) {
    3c6c:	6700 014e      	beq.w 3dbc <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    3c70:	23c0 0000 7622 	move.l d0,7622 <DrawBuffer>
  DrawCopper = Copperlist1;
    3c76:	23f9 0000 762e 	move.l 762e <Copperlist1>,761e <DrawCopper>
    3c7c:	0000 761e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3c80:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3c86:	203c 0001 6800 	move.l #92160,d0
    3c8c:	7202           	moveq #2,d1
    3c8e:	4eae ff3a      	jsr -198(a6)
    3c92:	2400           	move.l d0,d2
    3c94:	23c0 0000 761a 	move.l d0,761a <Bitplane2>
  if(Bitplane2 == 0) {
    3c9a:	6778           	beq.s 3d14 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    3c9c:	23f9 0000 762a 	move.l 762a <Copperlist2>,7612 <ViewCopper>
    3ca2:	0000 7612 
  SwapCl();
    3ca6:	45fa ff6e      	lea 3c16 <SwapCl>(pc),a2
    3caa:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    3cac:	2039 0000 7622 	move.l 7622 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3cb2:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3cb8:	2200           	move.l d0,d1
    3cba:	4241           	clr.w d1
    3cbc:	4841           	swap d1
    3cbe:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    3cc2:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    3cc6:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3ccc:	2200           	move.l d0,d1
    3cce:	4241           	clr.w d1
    3cd0:	4841           	swap d1
    3cd2:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3cd6:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    3cda:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    3cdc:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3ce2:	2002           	move.l d2,d0
    3ce4:	4240           	clr.w d0
    3ce6:	4840           	swap d0
    3ce8:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    3cec:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    3cf0:	2002           	move.l d2,d0
    3cf2:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3cf8:	2200           	move.l d0,d1
    3cfa:	4241           	clr.w d1
    3cfc:	4841           	swap d1
    3cfe:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3d02:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    3d06:	23c2 0000 7616 	move.l d2,7616 <ViewBuffer>
}
    3d0c:	7000           	moveq #0,d0
    3d0e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3d12:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    3d14:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3d1a:	4eae ffc4      	jsr -60(a6)
    3d1e:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3d24:	2200           	move.l d0,d1
    3d26:	243c 0000 4b72 	move.l #19314,d2
    3d2c:	7626           	moveq #38,d3
    3d2e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3d32:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3d38:	7201           	moveq #1,d1
    3d3a:	4eae ff70      	jsr -144(a6)
    3d3e:	2439 0000 761a 	move.l 761a <Bitplane2>,d2
  ViewCopper = Copperlist2;
    3d44:	23f9 0000 762a 	move.l 762a <Copperlist2>,7612 <ViewCopper>
    3d4a:	0000 7612 
  SwapCl();
    3d4e:	45fa fec6      	lea 3c16 <SwapCl>(pc),a2
    3d52:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    3d54:	2039 0000 7622 	move.l 7622 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3d5a:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3d60:	2200           	move.l d0,d1
    3d62:	4241           	clr.w d1
    3d64:	4841           	swap d1
    3d66:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    3d6a:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    3d6e:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3d74:	2200           	move.l d0,d1
    3d76:	4241           	clr.w d1
    3d78:	4841           	swap d1
    3d7a:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3d7e:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    3d82:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    3d84:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    3d8a:	2002           	move.l d2,d0
    3d8c:	4240           	clr.w d0
    3d8e:	4840           	swap d0
    3d90:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    3d94:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    3d98:	2002           	move.l d2,d0
    3d9a:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    3da0:	2200           	move.l d0,d1
    3da2:	4241           	clr.w d1
    3da4:	4841           	swap d1
    3da6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    3daa:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    3dae:	23c2 0000 7616 	move.l d2,7616 <ViewBuffer>
}
    3db4:	7000           	moveq #0,d0
    3db6:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3dba:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    3dbc:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3dc2:	4eae ffc4      	jsr -60(a6)
    3dc6:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3dcc:	2200           	move.l d0,d1
    3dce:	243c 0000 4b4b 	move.l #19275,d2
    3dd4:	7626           	moveq #38,d3
    3dd6:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3dda:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3de0:	7201           	moveq #1,d1
    3de2:	4eae ff70      	jsr -144(a6)
    3de6:	2039 0000 7626 	move.l 7626 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    3dec:	23c0 0000 7622 	move.l d0,7622 <DrawBuffer>
  DrawCopper = Copperlist1;
    3df2:	23f9 0000 762e 	move.l 762e <Copperlist1>,761e <DrawCopper>
    3df8:	0000 761e 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    3dfc:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3e02:	203c 0001 6800 	move.l #92160,d0
    3e08:	7202           	moveq #2,d1
    3e0a:	4eae ff3a      	jsr -198(a6)
    3e0e:	2400           	move.l d0,d2
    3e10:	23c0 0000 761a 	move.l d0,761a <Bitplane2>
  if(Bitplane2 == 0) {
    3e16:	6600 fe84      	bne.w 3c9c <PrepareDisplayZoom+0x60>
    3e1a:	6000 fef8      	bra.w 3d14 <PrepareDisplayZoom+0xd8>

00003e1e <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    3e1e:	2039 0000 7622 	move.l 7622 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    3e24:	2079 0000 761e 	movea.l 761e <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    3e2a:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    3e2e:	2200           	move.l d0,d1
    3e30:	4241           	clr.w d1
    3e32:	4841           	swap d1
    3e34:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    3e38:	23f9 0000 7616 	move.l 7616 <ViewBuffer>,7622 <DrawBuffer>
    3e3e:	0000 7622 
  ViewBuffer = (ULONG *) tmp;
    3e42:	23c0 0000 7616 	move.l d0,7616 <ViewBuffer>
}
    3e48:	4e75           	rts

00003e4a <PrepareDisplay>:
 int PrepareDisplaySW() {
    3e4a:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    3e4e:	45fa f522      	lea 3372 <ClBuild>(pc),a2
    3e52:	4e92           	jsr (a2)
    3e54:	23c0 0000 762e 	move.l d0,762e <Copperlist1>
  Copperlist2 = ClbuildSW();
    3e5a:	4e92           	jsr (a2)
    3e5c:	23c0 0000 762a 	move.l d0,762a <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3e62:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3e68:	203c 0000 c800 	move.l #51200,d0
    3e6e:	7202           	moveq #2,d1
    3e70:	4eae ff3a      	jsr -198(a6)
    3e74:	23c0 0000 7626 	move.l d0,7626 <Bitplane1>
  if(Bitplane1 == 0) {
    3e7a:	6700 00ac      	beq.w 3f28 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    3e7e:	23c0 0000 7622 	move.l d0,7622 <DrawBuffer>
  DrawCopper = Copperlist1;
    3e84:	23f9 0000 762e 	move.l 762e <Copperlist1>,761e <DrawCopper>
    3e8a:	0000 761e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3e8e:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3e94:	203c 0000 c800 	move.l #51200,d0
    3e9a:	7202           	moveq #2,d1
    3e9c:	4eae ff3a      	jsr -198(a6)
    3ea0:	23c0 0000 761a 	move.l d0,761a <Bitplane2>
  if(Bitplane2 == 0) {
    3ea6:	6728           	beq.s 3ed0 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    3ea8:	23c0 0000 7616 	move.l d0,7616 <ViewBuffer>
  ViewCopper = Copperlist2;
    3eae:	23f9 0000 762a 	move.l 762a <Copperlist2>,7612 <ViewCopper>
    3eb4:	0000 7612 
  SwapCl();
    3eb8:	47fa fd5c      	lea 3c16 <SwapCl>(pc),a3
    3ebc:	4e93           	jsr (a3)
  SetBplPointers();
    3ebe:	45fa ff5e      	lea 3e1e <SetBplPointers>(pc),a2
    3ec2:	4e92           	jsr (a2)
  SwapCl();
    3ec4:	4e93           	jsr (a3)
  SetBplPointers();
    3ec6:	4e92           	jsr (a2)
}
    3ec8:	7000           	moveq #0,d0
    3eca:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    3ece:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    3ed0:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3ed6:	4eae ffc4      	jsr -60(a6)
    3eda:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3ee0:	2200           	move.l d0,d1
    3ee2:	243c 0000 4b72 	move.l #19314,d2
    3ee8:	7626           	moveq #38,d3
    3eea:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3eee:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3ef4:	7201           	moveq #1,d1
    3ef6:	4eae ff70      	jsr -144(a6)
    3efa:	2039 0000 761a 	move.l 761a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    3f00:	23c0 0000 7616 	move.l d0,7616 <ViewBuffer>
  ViewCopper = Copperlist2;
    3f06:	23f9 0000 762a 	move.l 762a <Copperlist2>,7612 <ViewCopper>
    3f0c:	0000 7612 
  SwapCl();
    3f10:	47fa fd04      	lea 3c16 <SwapCl>(pc),a3
    3f14:	4e93           	jsr (a3)
  SetBplPointers();
    3f16:	45fa ff06      	lea 3e1e <SetBplPointers>(pc),a2
    3f1a:	4e92           	jsr (a2)
  SwapCl();
    3f1c:	4e93           	jsr (a3)
  SetBplPointers();
    3f1e:	4e92           	jsr (a2)
}
    3f20:	7000           	moveq #0,d0
    3f22:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    3f26:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    3f28:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3f2e:	4eae ffc4      	jsr -60(a6)
    3f32:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3f38:	2200           	move.l d0,d1
    3f3a:	243c 0000 4b4b 	move.l #19275,d2
    3f40:	7626           	moveq #38,d3
    3f42:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3f46:	2c79 0000 7632 	movea.l 7632 <DOSBase>,a6
    3f4c:	7201           	moveq #1,d1
    3f4e:	4eae ff70      	jsr -144(a6)
    3f52:	2039 0000 7626 	move.l 7626 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    3f58:	23c0 0000 7622 	move.l d0,7622 <DrawBuffer>
  DrawCopper = Copperlist1;
    3f5e:	23f9 0000 762e 	move.l 762e <Copperlist1>,761e <DrawCopper>
    3f64:	0000 761e 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    3f68:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3f6e:	203c 0000 c800 	move.l #51200,d0
    3f74:	7202           	moveq #2,d1
    3f76:	4eae ff3a      	jsr -198(a6)
    3f7a:	23c0 0000 761a 	move.l d0,761a <Bitplane2>
  if(Bitplane2 == 0) {
    3f80:	6600 ff26      	bne.w 3ea8 <PrepareDisplay+0x5e>
    3f84:	6000 ff4a      	bra.w 3ed0 <PrepareDisplay+0x86>

00003f88 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    3f88:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    3f8c:	262f 0010      	move.l 16(sp),d3
    3f90:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    3f94:	2279 0000 762e 	movea.l 762e <Copperlist1>,a1
    3f9a:	b2fc 0000      	cmpa.w #0,a1
    3f9e:	670c           	beq.s 3fac <FreeDisplay+0x24>
    3fa0:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3fa6:	2003           	move.l d3,d0
    3fa8:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    3fac:	2279 0000 762a 	movea.l 762a <Copperlist2>,a1
    3fb2:	b2fc 0000      	cmpa.w #0,a1
    3fb6:	670c           	beq.s 3fc4 <FreeDisplay+0x3c>
    3fb8:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3fbe:	2003           	move.l d3,d0
    3fc0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    3fc4:	2279 0000 7626 	movea.l 7626 <Bitplane1>,a1
    3fca:	b2fc 0000      	cmpa.w #0,a1
    3fce:	670c           	beq.s 3fdc <FreeDisplay+0x54>
    3fd0:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3fd6:	2002           	move.l d2,d0
    3fd8:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    3fdc:	2279 0000 761a 	movea.l 761a <Bitplane2>,a1
    3fe2:	b2fc 0000      	cmpa.w #0,a1
    3fe6:	670c           	beq.s 3ff4 <FreeDisplay+0x6c>
    3fe8:	2c79 0000 7636 	movea.l 7636 <SysBase>,a6
    3fee:	2002           	move.l d2,d0
    3ff0:	4eae ff2e      	jsr -210(a6)
}
    3ff4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    3ff8:	4e75           	rts

00003ffa <WaitVbl>:
void WaitVbl() {
    3ffa:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    3ffc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb527>,d0
    4002:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    4004:	2017           	move.l (sp),d0
    4006:	0280 0001 ff00 	andi.l #130816,d0
    400c:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    400e:	2017           	move.l (sp),d0
    4010:	0c80 0001 3700 	cmpi.l #79616,d0
    4016:	67e4           	beq.s 3ffc <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    4018:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb527>,d0
    401e:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    4022:	202f 0004      	move.l 4(sp),d0
    4026:	0280 0001 ff00 	andi.l #130816,d0
    402c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    4030:	202f 0004      	move.l 4(sp),d0
    4034:	0c80 0001 3700 	cmpi.l #79616,d0
    403a:	66dc           	bne.s 4018 <WaitVbl+0x1e>
}
    403c:	508f           	addq.l #8,sp
    403e:	4e75           	rts

00004040 <memcpy>:
{
    4040:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4044:	202f 0014      	move.l 20(sp),d0
    4048:	226f 0018      	movea.l 24(sp),a1
    404c:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4050:	2601           	move.l d1,d3
    4052:	5383           	subq.l #1,d3
    4054:	4a81           	tst.l d1
    4056:	6762           	beq.s 40ba <memcpy+0x7a>
    4058:	2040           	movea.l d0,a0
    405a:	5888           	addq.l #4,a0
    405c:	b1c9           	cmpa.l a1,a0
    405e:	53c2           	sl.s d2
    4060:	4402           	neg.b d2
    4062:	41e9 0004      	lea 4(a1),a0
    4066:	b1c0           	cmpa.l d0,a0
    4068:	53c4           	sl.s d4
    406a:	4404           	neg.b d4
    406c:	8404           	or.b d4,d2
    406e:	7808           	moveq #8,d4
    4070:	b883           	cmp.l d3,d4
    4072:	55c4           	sc.s d4
    4074:	4404           	neg.b d4
    4076:	c404           	and.b d4,d2
    4078:	6746           	beq.s 40c0 <memcpy+0x80>
    407a:	2409           	move.l a1,d2
    407c:	8480           	or.l d0,d2
    407e:	7803           	moveq #3,d4
    4080:	c484           	and.l d4,d2
    4082:	663c           	bne.s 40c0 <memcpy+0x80>
    4084:	2049           	movea.l a1,a0
    4086:	2440           	movea.l d0,a2
    4088:	74fc           	moveq #-4,d2
    408a:	c481           	and.l d1,d2
    408c:	d489           	add.l a1,d2
		*d++ = *s++;
    408e:	24d8           	move.l (a0)+,(a2)+
    4090:	b488           	cmp.l a0,d2
    4092:	66fa           	bne.s 408e <memcpy+0x4e>
    4094:	74fc           	moveq #-4,d2
    4096:	c481           	and.l d1,d2
    4098:	2040           	movea.l d0,a0
    409a:	d1c2           	adda.l d2,a0
    409c:	d3c2           	adda.l d2,a1
    409e:	9682           	sub.l d2,d3
    40a0:	b481           	cmp.l d1,d2
    40a2:	6716           	beq.s 40ba <memcpy+0x7a>
    40a4:	1091           	move.b (a1),(a0)
	while(len--)
    40a6:	4a83           	tst.l d3
    40a8:	6710           	beq.s 40ba <memcpy+0x7a>
		*d++ = *s++;
    40aa:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    40b0:	5383           	subq.l #1,d3
    40b2:	6706           	beq.s 40ba <memcpy+0x7a>
		*d++ = *s++;
    40b4:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    40ba:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    40be:	4e75           	rts
    40c0:	2040           	movea.l d0,a0
    40c2:	d289           	add.l a1,d1
		*d++ = *s++;
    40c4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    40c6:	b289           	cmp.l a1,d1
    40c8:	67f0           	beq.s 40ba <memcpy+0x7a>
		*d++ = *s++;
    40ca:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    40cc:	b289           	cmp.l a1,d1
    40ce:	66f4           	bne.s 40c4 <memcpy+0x84>
    40d0:	60e8           	bra.s 40ba <memcpy+0x7a>

000040d2 <memset>:
{
    40d2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    40d6:	202f 0024      	move.l 36(sp),d0
    40da:	2a2f 0028      	move.l 40(sp),d5
    40de:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    40e2:	2809           	move.l a1,d4
    40e4:	5384           	subq.l #1,d4
    40e6:	b2fc 0000      	cmpa.w #0,a1
    40ea:	6f00 00b0      	ble.w 419c <memset+0xca>
    40ee:	1e05           	move.b d5,d7
    40f0:	2200           	move.l d0,d1
    40f2:	4481           	neg.l d1
    40f4:	7403           	moveq #3,d2
    40f6:	c282           	and.l d2,d1
    40f8:	7c05           	moveq #5,d6
		*ptr++ = val;
    40fa:	2440           	movea.l d0,a2
    40fc:	bc84           	cmp.l d4,d6
    40fe:	646a           	bcc.s 416a <memset+0x98>
    4100:	4a81           	tst.l d1
    4102:	6724           	beq.s 4128 <memset+0x56>
    4104:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4106:	5384           	subq.l #1,d4
    4108:	7401           	moveq #1,d2
    410a:	b481           	cmp.l d1,d2
    410c:	671a           	beq.s 4128 <memset+0x56>
		*ptr++ = val;
    410e:	2440           	movea.l d0,a2
    4110:	548a           	addq.l #2,a2
    4112:	2040           	movea.l d0,a0
    4114:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4118:	5384           	subq.l #1,d4
    411a:	7403           	moveq #3,d2
    411c:	b481           	cmp.l d1,d2
    411e:	6608           	bne.s 4128 <memset+0x56>
		*ptr++ = val;
    4120:	528a           	addq.l #1,a2
    4122:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4126:	5384           	subq.l #1,d4
    4128:	2609           	move.l a1,d3
    412a:	9681           	sub.l d1,d3
    412c:	7c00           	moveq #0,d6
    412e:	1c05           	move.b d5,d6
    4130:	2406           	move.l d6,d2
    4132:	4842           	swap d2
    4134:	4242           	clr.w d2
    4136:	2042           	movea.l d2,a0
    4138:	2406           	move.l d6,d2
    413a:	e14a           	lsl.w #8,d2
    413c:	4842           	swap d2
    413e:	4242           	clr.w d2
    4140:	e18e           	lsl.l #8,d6
    4142:	2646           	movea.l d6,a3
    4144:	2c08           	move.l a0,d6
    4146:	8486           	or.l d6,d2
    4148:	2c0b           	move.l a3,d6
    414a:	8486           	or.l d6,d2
    414c:	1407           	move.b d7,d2
    414e:	2040           	movea.l d0,a0
    4150:	d1c1           	adda.l d1,a0
    4152:	72fc           	moveq #-4,d1
    4154:	c283           	and.l d3,d1
    4156:	d288           	add.l a0,d1
		*ptr++ = val;
    4158:	20c2           	move.l d2,(a0)+
    415a:	b1c1           	cmpa.l d1,a0
    415c:	66fa           	bne.s 4158 <memset+0x86>
    415e:	72fc           	moveq #-4,d1
    4160:	c283           	and.l d3,d1
    4162:	d5c1           	adda.l d1,a2
    4164:	9881           	sub.l d1,d4
    4166:	b283           	cmp.l d3,d1
    4168:	6732           	beq.s 419c <memset+0xca>
    416a:	1485           	move.b d5,(a2)
	while(len-- > 0)
    416c:	4a84           	tst.l d4
    416e:	6f2c           	ble.s 419c <memset+0xca>
		*ptr++ = val;
    4170:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4174:	7201           	moveq #1,d1
    4176:	b284           	cmp.l d4,d1
    4178:	6c22           	bge.s 419c <memset+0xca>
		*ptr++ = val;
    417a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    417e:	7402           	moveq #2,d2
    4180:	b484           	cmp.l d4,d2
    4182:	6c18           	bge.s 419c <memset+0xca>
		*ptr++ = val;
    4184:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    4188:	7c03           	moveq #3,d6
    418a:	bc84           	cmp.l d4,d6
    418c:	6c0e           	bge.s 419c <memset+0xca>
		*ptr++ = val;
    418e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    4192:	7204           	moveq #4,d1
    4194:	b284           	cmp.l d4,d1
    4196:	6c04           	bge.s 419c <memset+0xca>
		*ptr++ = val;
    4198:	1545 0005      	move.b d5,5(a2)
}
    419c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    41a0:	4e75           	rts

000041a2 <strlen>:
{
    41a2:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    41a6:	7000           	moveq #0,d0
	while(*s++)
    41a8:	4a10           	tst.b (a0)
    41aa:	6708           	beq.s 41b4 <strlen+0x12>
		t++;
    41ac:	5280           	addq.l #1,d0
	while(*s++)
    41ae:	4a30 0800      	tst.b (0,a0,d0.l)
    41b2:	66f8           	bne.s 41ac <strlen+0xa>
}
    41b4:	4e75           	rts
    41b6:	4e71           	nop

000041b8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    41b8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    41bc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    41c0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    41c4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    41c8:	d041           	add.w d1,d0
	swap	d0
    41ca:	4840           	swap d0
	clrw	d0
    41cc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    41ce:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    41d2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    41d6:	d081           	add.l d1,d0

	rts
    41d8:	4e75           	rts

000041da <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    41da:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    41dc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    41e0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    41e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    41ea:	6416           	bcc.s 4202 <__udivsi3+0x28>
	movel	d0, d2
    41ec:	2400           	move.l d0,d2
	clrw	d2
    41ee:	4242           	clr.w d2
	swap	d2
    41f0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    41f2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    41f4:	3002           	move.w d2,d0
	swap	d0
    41f6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    41f8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    41fc:	84c1           	divu.w d1,d2
	movew	d2, d0
    41fe:	3002           	move.w d2,d0
	jra	6f
    4200:	6030           	bra.s 4232 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4202:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4204:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4206:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4208:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    420e:	64f4           	bcc.s 4204 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4210:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    4212:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4218:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    421a:	c2c0           	mulu.w d0,d1
	swap	d2
    421c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    421e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4220:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    4222:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4224:	660a           	bne.s 4230 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4226:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4228:	6506           	bcs.s 4230 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    422a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    422e:	6302           	bls.s 4232 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4230:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    4232:	241f           	move.l (sp)+,d2
	rts
    4234:	4e75           	rts

00004236 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    4236:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4238:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    423a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    423e:	6a04           	bpl.s 4244 <__divsi3+0xe>
	negl	d1
    4240:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    4242:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4244:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4248:	6a04           	bpl.s 424e <__divsi3+0x18>
	negl	d0
    424a:	4480           	neg.l d0
	negb	d2
    424c:	4402           	neg.b d2

2:	movel	d1, sp@-
    424e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4250:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    4252:	6186           	bsr.s 41da <__udivsi3>
	addql	IMM (8), sp
    4254:	508f           	addq.l #8,sp

	tstb	d2
    4256:	4a02           	tst.b d2
	jpl	3f
    4258:	6a02           	bpl.s 425c <__divsi3+0x26>
	negl	d0
    425a:	4480           	neg.l d0

3:	movel	sp@+, d2
    425c:	241f           	move.l (sp)+,d2
	rts
    425e:	4e75           	rts

00004260 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4260:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4264:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4268:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    426a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    426c:	61c8           	bsr.s 4236 <__divsi3>
	addql	IMM (8), sp
    426e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4270:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4274:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4276:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4278:	6100 ff3e      	bsr.w 41b8 <__mulsi3>
	addql	IMM (8), sp
    427c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    427e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4282:	9280           	sub.l d0,d1
	movel	d1, d0
    4284:	2001           	move.l d1,d0
	rts
    4286:	4e75           	rts

00004288 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4288:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    428c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4290:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4292:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4294:	6100 ff44      	bsr.w 41da <__udivsi3>
	addql	IMM (8), sp
    4298:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    429a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    429e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    42a0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    42a2:	6100 ff14      	bsr.w 41b8 <__mulsi3>
	addql	IMM (8), sp
    42a6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    42a8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    42ac:	9280           	sub.l d0,d1
	movel	d1, d0
    42ae:	2001           	move.l d1,d0
	rts
    42b0:	4e75           	rts

000042b2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    42b2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    42b4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    42b8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    42bc:	2c5f           	movea.l (sp)+,a6
    rts
    42be:	4e75           	rts

000042c0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    42c0:	16c0           	move.b d0,(a3)+
	rts
    42c2:	4e75           	rts

000042c4 <saveregs>:
	...

00004300 <font2distance>:
    4300:	0505           	btst d2,d5
    4302:	0505           	btst d2,d5
    4304:	0505           	btst d2,d5
    4306:	0505           	btst d2,d5
    4308:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    430a:	0505           	btst d2,d5
    430c:	0505           	btst d2,d5
    430e:	0005 0505      	ori.b #5,d5
    4312:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4314:	0505           	btst d2,d5
    4316:	0505           	btst d2,d5
    4318:	0505           	btst d2,d5
    431a:	0505           	btst d2,d5
    431c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    431e:	0505           	btst d2,d5
    4320:	0505           	btst d2,d5
    4322:	0505           	btst d2,d5
    4324:	0505           	btst d2,d5
    4326:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4328:	0500           	btst d2,d0
    432a:	0505           	btst d2,d5
    432c:	0505           	btst d2,d5
    432e:	0505           	btst d2,d5
    4330:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    4332:	0505           	btst d2,d5
    4334:	0505           	btst d2,d5
    4336:	0505           	btst d2,d5
    4338:	0505           	btst d2,d5
    433a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    433c:	0505           	btst d2,d5
    433e:	0505           	btst d2,d5
    4340:	0503           	btst d2,d3
    4342:	0505           	btst d2,d5
    4344:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    4346:	0505           	btst d2,d5
    4348:	0500           	btst d2,d0
    434a:	0505           	btst d2,d5
    434c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4350:	0505           	btst d2,d5
    4352:	0503           	btst d2,d3
    4354:	0205 0507      	andi.b #7,d5
    4358:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    435a:	0505           	btst d2,d5
    435c:	0505           	btst d2,d5
    435e:	0505           	btst d2,d5
    4360:	0505           	btst d2,d5
    4362:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4364:	0505           	btst d2,d5
    4366:	0505           	btst d2,d5
    4368:	0505           	btst d2,d5
    436a:	0505           	btst d2,d5
    436c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    436e:	0505           	btst d2,d5
    4370:	0505           	btst d2,d5
    4372:	0505           	btst d2,d5
    4374:	0505           	btst d2,d5
    4376:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4378:	0505           	btst d2,d5
    437a:	0505           	btst d2,d5
    437c:	0505           	btst d2,d5
    437e:	0505           	btst d2,d5
    4380:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4382:	0505           	btst d2,d5
    4384:	0505           	btst d2,d5
    4386:	0505           	btst d2,d5
    4388:	0505           	btst d2,d5
    438a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    438c:	0505           	btst d2,d5
    438e:	0505           	btst d2,d5
    4390:	0505           	btst d2,d5
    4392:	0505           	btst d2,d5
    4394:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4396:	0505           	btst d2,d5
    4398:	0505           	btst d2,d5
    439a:	0505           	btst d2,d5
    439c:	0505           	btst d2,d5
    439e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43a0:	0505           	btst d2,d5
    43a2:	0505           	btst d2,d5
    43a4:	0505           	btst d2,d5
    43a6:	0505           	btst d2,d5
    43a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43aa:	0505           	btst d2,d5
    43ac:	0505           	btst d2,d5
    43ae:	0505           	btst d2,d5
    43b0:	0505           	btst d2,d5
    43b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43b4:	0505           	btst d2,d5
    43b6:	0505           	btst d2,d5
    43b8:	0505           	btst d2,d5
    43ba:	0505           	btst d2,d5
    43bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43be:	0505           	btst d2,d5
    43c0:	0505           	btst d2,d5
    43c2:	0505           	btst d2,d5
    43c4:	0505           	btst d2,d5
    43c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43c8:	0505           	btst d2,d5
    43ca:	0505           	btst d2,d5
    43cc:	0505           	btst d2,d5
    43ce:	0505           	btst d2,d5
    43d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43d2:	0505           	btst d2,d5
    43d4:	0505           	btst d2,d5
    43d6:	0505           	btst d2,d5
    43d8:	0505           	btst d2,d5
    43da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43dc:	0505           	btst d2,d5
    43de:	0505           	btst d2,d5
    43e0:	0505           	btst d2,d5
    43e2:	0505           	btst d2,d5
    43e4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43e6:	0505           	btst d2,d5
    43e8:	0505           	btst d2,d5
    43ea:	0505           	btst d2,d5
    43ec:	0505           	btst d2,d5
    43ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    43f0:	0505           	btst d2,d5
    43f2:	0505           	btst d2,d5
    43f4:	0505           	btst d2,d5
    43f6:	0505           	btst d2,d5
    43f8:	0505           	btst d2,d5

000043fa <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    43fa:	16c0           	move.b d0,(a3)+
  RTS
    43fc:	4e75           	rts

000043fe <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    43fe:	48f9 7fff 0000 	movem.l d0-a6,42c4 <saveregs>
    4404:	42c4 
  lea 0xdff000,a5
    4406:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb523>,a5
  move.l sp@(4),a0  //Fontlocation
    440c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4410:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4414:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4418:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    441a:	082d 0006 0002 	btst #6,2(a5)

00004420 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4420:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    4426:	66f8           	bne.s 4420 <st2wblit>

00004428 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4428:	7019           	moveq #25,d0
	sub.l d5,d5      
    442a:	9a85           	sub.l d5,d5

0000442c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    442c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    442e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4430:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4434:	9dce           	suba.l a6,a6
	move.l d2, a6
    4436:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4438:	ddfc 0000 4300 	adda.l #17152,a6

	LSL  	#4,d2 	    //Fetch next char
    443e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4440:	2842           	movea.l d2,a4


	move.l  #0,d4
    4442:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    4444:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    4446:	3814           	move.w (a4),d4
	swap	d4
    4448:	4844           	swap d4
	lsr.l	d5, d4
    444a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    444c:	8993           	or.l d4,(a3)
	clr.l	d4
    444e:	4284           	clr.l d4
	move.w  2(a4), d4
    4450:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4454:	4844           	swap d4
	lsr.l	d5, d4
    4456:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4458:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    445c:	4284           	clr.l d4
	move.w  4(a4), d4
    445e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    4462:	4844           	swap d4
	lsr.l	d5, d4
    4464:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4466:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    446a:	4284           	clr.l d4
	move.w  6(a4), d4
    446c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4470:	4844           	swap d4
	lsr.l	d5, d4
    4472:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4474:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4478:	4284           	clr.l d4
	move.w  8(a4), d4
    447a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    447e:	4844           	swap d4
	lsr.l	d5, d4
    4480:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    4482:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4486:	4284           	clr.l d4
	move.w  10(a4), d4
    4488:	382c 000a      	move.w 10(a4),d4
	swap	d4
    448c:	4844           	swap d4
	lsr.l	d5, d4
    448e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    4490:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4494:	4284           	clr.l d4
	move.w  12(a4), d4
    4496:	382c 000c      	move.w 12(a4),d4
	swap	d4
    449a:	4844           	swap d4
	lsr.l	d5, d4
    449c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    449e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    44a2:	4284           	clr.l d4
	move.w  14(a4), d4
    44a4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    44a8:	4844           	swap d4
	lsr.l	d5, d4
    44aa:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    44ac:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    44b0:	4284           	clr.l d4

	add.b   (a6), d5
    44b2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    44b4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    44b8:	6500 0006      	bcs.w 44c0 <noadditionalchar>
	addq.w  #1, a3
    44bc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    44be:	5145           	subq.w #8,d5

000044c0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    44c0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    44c2:	51c8 ff68      	dbf d0,442c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    44c6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    44ca:	51cb ff5c      	dbf d3,4428 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    44ce:	4cfa 7fff fdf2 	movem.l 42c4 <saveregs>(pc),d0-a6

	RTS
    44d4:	4e75           	rts
