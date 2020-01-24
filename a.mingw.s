
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
       6:	4e55 ffb4      	link.w a5,#-76
       a:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       e:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      12:	23ce 0000 473a 	move.l a6,473a <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,4712 <hw>
      1e:	0000 4712 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 21b3 	lea 21b3 <incbin_swfont_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 470e 	move.l d0,470e <GfxBase>
	if (!GfxBase)
      34:	6700 0a6a      	beq.w aa0 <main+0xa9a>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
      3e:	43f9 0000 21c4 	lea 21c4 <incbin_swfont_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 472a 	move.l d0,472a <DOSBase>
	if (!DOSBase)
      50:	6700 0a42      	beq.w a94 <main+0xa8e>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 21d0 	pea 21d0 <incbin_swfont_end+0xda>
      5a:	4eb9 0000 0d28 	jsr d28 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 21ec 	move.l #8684,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 4712 	movea.l 4712 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 21fc 	move.l #8700,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 0f66 	lea f66 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 4736 	move.l d0,4736 <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 4722 	move.l d0,4722 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 4732 	move.l d0,4732 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 4716 	move.l d0,4716 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 467c 	cmp.l 467c <ClsSprites>,d0
      d2:	6600 0930      	bne.w a04 <main+0x9fe>
      d6:	202a 0004      	move.l 4(a2),d0
      da:	b0b9 0000 4680 	cmp.l 4680 <ClsSprites+0x4>,d0
      e0:	6600 0922      	bne.w a04 <main+0x9fe>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 4684 	cmp.l 4684 <ClsSprites+0x8>,d0
      ee:	6600 0914      	bne.w a04 <main+0x9fe>
      f2:	202a 000c      	move.l 12(a2),d0
      f6:	b0b9 0000 4688 	cmp.l 4688 <ClsSprites+0xc>,d0
      fc:	6600 0906      	bne.w a04 <main+0x9fe>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 468c 	cmp.l 468c <ClsSprites+0x10>,d0
     10a:	6600 08f8      	bne.w a04 <main+0x9fe>
     10e:	202a 0014      	move.l 20(a2),d0
     112:	b0b9 0000 4690 	cmp.l 4690 <ClsSprites+0x14>,d0
     118:	6600 08ea      	bne.w a04 <main+0x9fe>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 4694 	cmp.l 4694 <ClsSprites+0x18>,d0
     126:	6600 08dc      	bne.w a04 <main+0x9fe>
     12a:	202a 001c      	move.l 28(a2),d0
     12e:	b0b9 0000 4698 	cmp.l 4698 <ClsSprites+0x1c>,d0
     134:	6600 08ce      	bne.w a04 <main+0x9fe>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 469c 	cmp.l 469c <ClsSprites+0x20>,d0
     142:	6600 08c0      	bne.w a04 <main+0x9fe>
     146:	202a 0024      	move.l 36(a2),d0
     14a:	b0b9 0000 46a0 	cmp.l 46a0 <ClsSprites+0x24>,d0
     150:	6600 08b2      	bne.w a04 <main+0x9fe>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 46a4 	cmp.l 46a4 <ClsSprites+0x28>,d0
     15e:	6600 08a4      	bne.w a04 <main+0x9fe>
     162:	202a 002c      	move.l 44(a2),d0
     166:	b0b9 0000 46a8 	cmp.l 46a8 <ClsSprites+0x2c>,d0
     16c:	6600 0896      	bne.w a04 <main+0x9fe>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 46ac 	cmp.l 46ac <ClsSprites+0x30>,d0
     17a:	6600 0888      	bne.w a04 <main+0x9fe>
     17e:	202a 0034      	move.l 52(a2),d0
     182:	b0b9 0000 46b0 	cmp.l 46b0 <ClsSprites+0x34>,d0
     188:	6600 087a      	bne.w a04 <main+0x9fe>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 46b4 	cmp.l 46b4 <ClsSprites+0x38>,d0
     196:	6600 086c      	bne.w a04 <main+0x9fe>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 46b8 	cmpa.l 46b8 <ClsSprites+0x3c>,a2
     1a4:	6600 085e      	bne.w a04 <main+0x9fe>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 4736 	movea.l 4736 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 464c 	move.l 464c <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 086c      	bne.w a26 <main+0xa20>
     1bc:	2039 0000 4650 	move.l 4650 <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 085e      	bne.w a26 <main+0xa20>
     1ca:	2039 0000 4654 	move.l 4654 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 0850      	bne.w a26 <main+0xa20>
     1d8:	2039 0000 4658 	move.l 4658 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 0842      	bne.w a26 <main+0xa20>
     1e6:	2039 0000 465c 	move.l 465c <ClScreen+0x10>,d0
     1ec:	b0a8 0050      	cmp.l 80(a0),d0
     1f0:	6600 0834      	bne.w a26 <main+0xa20>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 4660 	cmp.l 4660 <ClScreen+0x14>,d0
     1fe:	6600 0826      	bne.w a26 <main+0xa20>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 4664 	cmp.l 4664 <ClScreen+0x18>,d0
     20c:	6600 0818      	bne.w a26 <main+0xa20>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 4668 	cmp.l 4668 <ClScreen+0x1c>,d0
     21a:	6600 080a      	bne.w a26 <main+0xa20>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 466c 	cmp.l 466c <ClScreen+0x20>,d0
     228:	6600 07fc      	bne.w a26 <main+0xa20>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 4670 	cmp.l 4670 <ClScreen+0x24>,d0
     236:	6600 07ee      	bne.w a26 <main+0xa20>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 4674 	cmp.l 4674 <ClScreen+0x28>,d0
     244:	6600 07e0      	bne.w a26 <main+0xa20>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 4678 	cmpa.l 4678 <ClScreen+0x2c>,a0
     252:	6600 07d2      	bne.w a26 <main+0xa20>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,4726 <DrawBuffer>
     25c:	0000 4726 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,471a <ViewBuffer>
     266:	0000 471a 
  SetBplPointers();
     26a:	45f9 0000 1494 	lea 1494 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,4726 <DrawBuffer>
     278:	0000 4726 
     27c:	6700 091c      	beq.w b9a <main+0xb94>
    Write( Output(), 
     280:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 21ff 	move.l #8703,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  int test1 = instructions[pos];
     29e:	2079 0000 4736 	movea.l 4736 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 223b 	move.l #8763,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 4736 	movea.l 4736 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 2278 	move.l #8824,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 4736 	movea.l 4736 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 4644 	cmp.l 4644 <ClColor>,d0
     30a:	6600 08be      	bne.w bca <main+0xbc4>
     30e:	2039 0000 4648 	move.l 4648 <ClColor+0x4>,d0
     314:	b0a8 007c      	cmp.l 124(a0),d0
     318:	6600 08b0      	bne.w bca <main+0xbc4>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 22d7 	move.l #8919,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 146e 	lea 146e <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2039 0000 4722 	move.l 4722 <DrawCopper>,d0
     350:	b0b9 0000 4732 	cmp.l 4732 <Copperlist2>,d0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 22fa 	move.l #8954,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 14c0 	lea 14c0 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 4726 	move.l 4726 <DrawBuffer>,d0
     384:	b0b9 0000 472e 	cmp.l 472e <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 2310 	move.l #8976,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2039 0000 4722 	move.l 4722 <DrawCopper>,d0
     3b0:	b0b9 0000 4736 	cmp.l 4736 <Copperlist1>,d0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 2348 	move.l #9032,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 471a 	move.l 471a <ViewBuffer>,d0
     3de:	b0b9 0000 471e 	cmp.l 471e <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 2382 	move.l #9090,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2039 0000 4716 	move.l 4716 <ViewCopper>,d0
     40a:	b0b9 0000 4732 	cmp.l 4732 <Copperlist2>,d0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 23bb 	move.l #9147,d2
     42a:	763a           	moveq #58,d3
     42c:	4eae ffd0      	jsr -48(a6)
	}
	SetInterruptHandler((APTR)interruptHandler);
}

void RunFrame() {
  SwapCl();
     430:	4e93           	jsr (a3)
  SetBplPointers();
     432:	4e92           	jsr (a2)
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
     434:	2079 0000 4716 	movea.l 4716 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 471e 	cmp.l 471e <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 23f6 	move.l #9206,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 4716 	movea.l 4716 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 472e 	cmp.l 472e <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 243f 	move.l #9279,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 4716 	movea.l 4716 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 471e 	cmp.l 471e <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 2489 	move.l #9353,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fc:	4878 0084      	pea 84 <main+0x7e>
     500:	49f9 0000 15fe 	lea 15fe <FreeDisplay>,a4
     506:	4e94           	jsr (a4)
  return retval;
}

 int PrepareDisplayZoom() {

  Copperlist1 = ClbuildZoom();
     508:	4df9 0000 11c4 	lea 11c4 <ClbuildZoom>,a6
     50e:	4e96           	jsr (a6)
     510:	23c0 0000 4736 	move.l d0,4736 <Copperlist1>
  Copperlist2 = ClbuildZoom();
     516:	4e96           	jsr (a6)
     518:	23c0 0000 4732 	move.l d0,4732 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     51e:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     524:	203c 0000 6400 	move.l #25600,d0
     52a:	7202           	moveq #2,d1
     52c:	4eae ff3a      	jsr -198(a6)
     530:	23c0 0000 472e 	move.l d0,472e <Bitplane1>
  if(Bitplane1 == 0) {
     536:	508f           	addq.l #8,sp
     538:	6700 0600      	beq.w b3a <main+0xb34>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  DrawBuffer = Bitplane1;
     53c:	23c0 0000 4726 	move.l d0,4726 <DrawBuffer>
  DrawCopper = Copperlist1;
     542:	23f9 0000 4736 	move.l 4736 <Copperlist1>,4722 <DrawCopper>
     548:	0000 4722 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     54c:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     552:	203c 0000 6400 	move.l #25600,d0
     558:	7202           	moveq #2,d1
     55a:	4eae ff3a      	jsr -198(a6)
     55e:	23c0 0000 471e 	move.l d0,471e <Bitplane2>
  if(Bitplane2 == 0) {
     564:	6700 0564      	beq.w aca <main+0xac4>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;
     568:	23c0 0000 471a 	move.l d0,471a <ViewBuffer>
  ViewCopper = Copperlist2;
     56e:	23f9 0000 4732 	move.l 4732 <Copperlist2>,4716 <ViewCopper>
     574:	0000 4716 
  SwapCl();
     578:	4e93           	jsr (a3)
  SetBplPointers();
     57a:	4e92           	jsr (a2)
  SwapCl();
     57c:	4e93           	jsr (a3)
  SetBplPointers();
     57e:	4e92           	jsr (a2)

void ZoomTest() {

  PrepareDisplayZoom();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     580:	4878 0010      	pea 10 <main+0xa>
     584:	4879 0000 467c 	pea 467c <ClsSprites>
     58a:	42a7           	clr.l -(sp)
     58c:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     592:	45f9 0000 0d90 	lea d90 <TestCopperlistBatch>,a2
     598:	4e92           	jsr (a2)
     59a:	4fef 0010      	lea 16(sp),sp
     59e:	4a80           	tst.l d0
     5a0:	661e           	bne.s 5c0 <main+0x5ba>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     5a2:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     5a8:	4eae ffc4      	jsr -60(a6)
     5ac:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     5b2:	2200           	move.l d0,d1
     5b4:	243c 0000 24d2 	move.l #9426,d2
     5ba:	762c           	moveq #44,d3
     5bc:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     5c0:	4878 000c      	pea c <main+0x6>
     5c4:	4879 0000 4614 	pea 4614 <ClScreenZoom>
     5ca:	4878 0010      	pea 10 <main+0xa>
     5ce:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     5d4:	4e92           	jsr (a2)
     5d6:	4fef 0010      	lea 16(sp),sp
     5da:	4a80           	tst.l d0
     5dc:	661e           	bne.s 5fc <main+0x5f6>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     5de:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     5e4:	4eae ffc4      	jsr -60(a6)
     5e8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     5ee:	2200           	move.l d0,d1
     5f0:	243c 0000 2508 	move.l #9480,d2
     5f6:	7636           	moveq #54,d3
     5f8:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     5fc:	4878 0002      	pea 2 <_start+0x2>
     600:	4879 0000 4644 	pea 4644 <ClColor>
     606:	4878 001e      	pea 1e <main+0x18>
     60a:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     610:	4e92           	jsr (a2)
     612:	4fef 0010      	lea 16(sp),sp
     616:	4a80           	tst.l d0
     618:	661e           	bne.s 638 <main+0x632>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     61a:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     620:	4eae ffc4      	jsr -60(a6)
     624:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     62a:	2200           	move.l d0,d1
     62c:	243c 0000 22b5 	move.l #8885,d2
     632:	7621           	moveq #33,d3
     634:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     638:	7ec0           	moveq #-64,d7
     63a:	de8d           	add.l a5,d7
     63c:	4878 0040      	pea 40 <main+0x3a>
     640:	4879 0000 25d2 	pea 25d2 <incbin_swfont_end+0x4dc>
     646:	2f07           	move.l d7,-(sp)
     648:	4eb9 0000 16b6 	jsr 16b6 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 32, clpart1, 16) == 0)
     64e:	4878 0010      	pea 10 <main+0xa>
     652:	2f07           	move.l d7,-(sp)
     654:	4878 0020      	pea 20 <main+0x1a>
     658:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     65e:	4e92           	jsr (a2)
     660:	4fef 001c      	lea 28(sp),sp
     664:	4a80           	tst.l d0
     666:	661e           	bne.s 686 <main+0x680>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     668:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     66e:	4eae ffc4      	jsr -60(a6)
     672:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     678:	2200           	move.l d0,d1
     67a:	243c 0000 253f 	move.l #9535,d2
     680:	7621           	moveq #33,d3
     682:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     686:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     68c:	ffb4 
     68e:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     694:	ffb8 
     696:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     69c:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 73, clpart2, 3) == 0)
     69e:	4878 0003      	pea 3 <_start+0x3>
     6a2:	486d ffb4      	pea -76(a5)
     6a6:	4878 0049      	pea 49 <main+0x43>
     6aa:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     6b0:	4e92           	jsr (a2)
     6b2:	4fef 0010      	lea 16(sp),sp
     6b6:	4a80           	tst.l d0
     6b8:	661e           	bne.s 6d8 <main+0x6d2>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     6ba:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     6c0:	4eae ffc4      	jsr -60(a6)
     6c4:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     6ca:	2200           	move.l d0,d1
     6cc:	243c 0000 2561 	move.l #9569,d2
     6d2:	762c           	moveq #44,d3
     6d4:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10528, 0xfffffffe) == 0)
     6d8:	4878 2920      	pea 2920 <incbin_swfont_end+0x82a>
     6dc:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     6e2:	47f9 0000 0c6a 	lea c6a <TestCopperlistPos.constprop.0>,a3
     6e8:	4e93           	jsr (a3)
     6ea:	508f           	addq.l #8,sp
     6ec:	4a80           	tst.l d0
     6ee:	661e           	bne.s 70e <main+0x708>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     6f0:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     6f6:	4eae ffc4      	jsr -60(a6)
     6fa:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     700:	2200           	move.l d0,d1
     702:	243c 0000 22d7 	move.l #8919,d2
     708:	7622           	moveq #34,d3
     70a:	4eae ffd0      	jsr -48(a6)
 
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     70e:	4878 6400      	pea 6400 <_end+0x1cc0>
     712:	2f3c 0000 a484 	move.l #42116,-(sp)
     718:	4e94           	jsr (a4)
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
     71a:	4eb9 0000 14c0 	jsr 14c0 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     720:	4878 0010      	pea 10 <main+0xa>
     724:	4879 0000 467c 	pea 467c <ClsSprites>
     72a:	42a7           	clr.l -(sp)
     72c:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     732:	4e92           	jsr (a2)
     734:	4fef 0018      	lea 24(sp),sp
     738:	4a80           	tst.l d0
     73a:	661e           	bne.s 75a <main+0x754>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     73c:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     742:	4eae ffc4      	jsr -60(a6)
     746:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     74c:	2200           	move.l d0,d1
     74e:	243c 0000 24d2 	move.l #9426,d2
     754:	762c           	moveq #44,d3
     756:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     75a:	4878 000c      	pea c <main+0x6>
     75e:	4879 0000 464c 	pea 464c <ClScreen>
     764:	4878 0010      	pea 10 <main+0xa>
     768:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     76e:	4e92           	jsr (a2)
     770:	4fef 0010      	lea 16(sp),sp
     774:	4a80           	tst.l d0
     776:	661e           	bne.s 796 <main+0x790>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     778:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     77e:	4eae ffc4      	jsr -60(a6)
     782:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     788:	2200           	move.l d0,d1
     78a:	243c 0000 2508 	move.l #9480,d2
     790:	7636           	moveq #54,d3
     792:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     796:	4878 0002      	pea 2 <_start+0x2>
     79a:	4879 0000 4644 	pea 4644 <ClColor>
     7a0:	4878 001e      	pea 1e <main+0x18>
     7a4:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     7aa:	4e92           	jsr (a2)
     7ac:	4fef 0010      	lea 16(sp),sp
     7b0:	4a80           	tst.l d0
     7b2:	661e           	bne.s 7d2 <main+0x7cc>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     7b4:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     7ba:	4eae ffc4      	jsr -60(a6)
     7be:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     7c4:	2200           	move.l d0,d1
     7c6:	243c 0000 22b5 	move.l #8885,d2
     7cc:	7621           	moveq #33,d3
     7ce:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
     7d2:	4878 0020      	pea 20 <main+0x1a>
     7d6:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     7dc:	4e93           	jsr (a3)
     7de:	508f           	addq.l #8,sp
     7e0:	4a80           	tst.l d0
     7e2:	6700 028e      	beq.w a72 <main+0xa6c>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
     7e6:	2479 0000 4726 	movea.l 4726 <DrawBuffer>,a2
     7ec:	4879 0000 258e 	pea 258e <incbin_swfont_end+0x498>
     7f2:	2f0a           	move.l a2,-(sp)
     7f4:	4eb9 0000 0c1c 	jsr c1c <WriteFont.constprop.1>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
     7fa:	508f           	addq.l #8,sp
     7fc:	0c52 ff00      	cmpi.w #-256,(a2)
     800:	671e           	beq.s 820 <main+0x81a>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
     802:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     808:	4eae ffc4      	jsr -60(a6)
     80c:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     812:	2200           	move.l d0,d1
     814:	243c 0000 259f 	move.l #9631,d2
     81a:	7631           	moveq #49,d3
     81c:	4eae ffd0      	jsr -48(a6)



  FreeDisplay( SWCPSIZE, SWBPLSIZE);
     820:	2f3c 0000 c800 	move.l #51200,-(sp)
     826:	4878 0084      	pea 84 <main+0x7e>
     82a:	4e94           	jsr (a4)
  RunTests();
	Delay(50);
     82c:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     832:	7232           	moveq #50,d1
     834:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     838:	247c 00f0 ff60 	movea.l #15794016,a2
     83e:	508f           	addq.l #8,sp
     840:	4a92           	tst.l (a2)
     842:	6718           	beq.s 85c <main+0x856>
     844:	4878 0001      	pea 1 <_start+0x1>
     848:	47f9 0000 0c86 	lea c86 <warpmode.part.0>,a3
     84e:	4e93           	jsr (a3)
     850:	588f           	addq.l #4,sp
     852:	4a92           	tst.l (a2)
     854:	6706           	beq.s 85c <main+0x856>
     856:	42a7           	clr.l -(sp)
     858:	4e93           	jsr (a3)
     85a:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     85c:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     862:	23ee 0022 0000 	move.l 34(a6),46fc <ActiView>
     868:	46fc 
	OwnBlitter();
     86a:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     86e:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     874:	4eae ff1c      	jsr -228(a6)
	Disable();
     878:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     87e:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     882:	2679 0000 4712 	movea.l 4712 <hw>,a3
     888:	302b 0010      	move.w 16(a3),d0
     88c:	33c0 0000 4700 	move.w d0,4700 <SystemADKCON>
	SystemInts=hw->intenar;
     892:	302b 001c      	move.w 28(a3),d0
     896:	33c0 0000 4704 	move.w d0,4704 <SystemInts>
	SystemDMA=hw->dmaconr;
     89c:	302b 0002      	move.w 2(a3),d0
     8a0:	33c0 0000 4702 	move.w d0,4702 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     8a6:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     8ac:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     8b2:	45f9 0000 1670 	lea 1670 <WaitVbl>,a2
     8b8:	4e92           	jsr (a2)
	WaitVbl();
     8ba:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     8bc:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     8c2:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     8c8:	93c9           	suba.l a1,a1
     8ca:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     8ce:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     8d4:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     8d8:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     8de:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     8e2:	4e92           	jsr (a2)
	WaitVbl();
     8e4:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     8e6:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     8ec:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     8f2:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     8f8:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     8fe:	082e 0000 0129 	btst #0,297(a6)
     904:	6700 02ec      	beq.w bf2 <main+0xbec>
		vbr = (APTR)Supervisor((void*)getvbr);
     908:	cf8d           	exg d7,a5
     90a:	4eae ffe2      	jsr -30(a6)
     90e:	cf8d           	exg d7,a5

	VBR=GetVBR();
     910:	23c0 0000 4706 	move.l d0,4706 <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     916:	2079 0000 4706 	movea.l 4706 <VBR.lto_priv.2>,a0
     91c:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     920:	23c7 0000 470a 	move.l d7,470a <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     926:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     928:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     92a:	2079 0000 4712 	movea.l 4712 <hw>,a0
     930:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     934:	3028 0002      	move.w 2(a0),d0
     938:	0800 000e      	btst #14,d0
     93c:	66f6           	bne.s 934 <main+0x92e>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     93e:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     944:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     94a:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     950:	2279 0000 4706 	movea.l 4706 <VBR.lto_priv.2>,a1
     956:	2347 006c      	move.l d7,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     95a:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     960:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     966:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     96c:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     972:	3039 0000 4704 	move.w 4704 <SystemInts>,d0
     978:	0040 8000      	ori.w #-32768,d0
     97c:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     980:	3039 0000 4702 	move.w 4702 <SystemDMA>,d0
     986:	0040 8000      	ori.w #-32768,d0
     98a:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     98e:	3039 0000 4700 	move.w 4700 <SystemADKCON>,d0
     994:	0040 8000      	ori.w #-32768,d0
     998:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     99c:	2279 0000 46fc 	movea.l 46fc <ActiView>,a1
     9a2:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     9a6:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     9ac:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     9b0:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     9b6:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     9ba:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     9c0:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     9c4:	2c79 0000 470e 	movea.l 470e <GfxBase>,a6
     9ca:	4eae fe32      	jsr -462(a6)
	Enable();
     9ce:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     9d4:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     9d8:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     9de:	2279 0000 472a 	movea.l 472a <DOSBase>,a1
     9e4:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     9e8:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     9ee:	2279 0000 470e 	movea.l 470e <GfxBase>,a1
     9f4:	4eae fe62      	jsr -414(a6)
}
     9f8:	7000           	moveq #0,d0
     9fa:	4ced 5c8c ff98 	movem.l -104(a5),d2-d3/d7/a2-a4/a6
     a00:	4e5d           	unlk a5
     a02:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     a04:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     a0a:	4eae ffc4      	jsr -60(a6)
     a0e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     a14:	2200           	move.l d0,d1
     a16:	243c 0000 24d2 	move.l #9426,d2
     a1c:	762c           	moveq #44,d3
     a1e:	4eae ffd0      	jsr -48(a6)
     a22:	6000 f784      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     a26:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     a2c:	4eae ffc4      	jsr -60(a6)
     a30:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     a36:	2200           	move.l d0,d1
     a38:	243c 0000 2508 	move.l #9480,d2
     a3e:	7636           	moveq #54,d3
     a40:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     a44:	23fc 0004 0000 	move.l #262144,4726 <DrawBuffer>
     a4a:	0000 4726 
  ViewBuffer = 0x50000;
     a4e:	23fc 0005 0000 	move.l #327680,471a <ViewBuffer>
     a54:	0000 471a 
  SetBplPointers();
     a58:	45f9 0000 1494 	lea 1494 <SetBplPointers>,a2
     a5e:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     a60:	0cb9 0005 0000 	cmpi.l #327680,4726 <DrawBuffer>
     a66:	0000 4726 
     a6a:	6600 f814      	bne.w 280 <main+0x27a>
     a6e:	6000 012a      	bra.w b9a <main+0xb94>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     a72:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     a78:	4eae ffc4      	jsr -60(a6)
     a7c:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     a82:	2200           	move.l d0,d1
     a84:	243c 0000 22d7 	move.l #8919,d2
     a8a:	7622           	moveq #34,d3
     a8c:	4eae ffd0      	jsr -48(a6)
     a90:	6000 fd54      	bra.w 7e6 <main+0x7e0>
		Exit(0);
     a94:	9dce           	suba.l a6,a6
     a96:	7200           	moveq #0,d1
     a98:	4eae ff70      	jsr -144(a6)
     a9c:	6000 f5b6      	bra.w 54 <main+0x4e>
		Exit(0);
     aa0:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     aa6:	7200           	moveq #0,d1
     aa8:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     aac:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     ab2:	43f9 0000 21c4 	lea 21c4 <incbin_swfont_end+0xce>,a1
     ab8:	7000           	moveq #0,d0
     aba:	4eae fdd8      	jsr -552(a6)
     abe:	23c0 0000 472a 	move.l d0,472a <DOSBase>
	if (!DOSBase)
     ac4:	6600 f58e      	bne.w 54 <main+0x4e>
     ac8:	60ca           	bra.s a94 <main+0xa8e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     aca:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     ad0:	4eae ffc4      	jsr -60(a6)
     ad4:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     ada:	2200           	move.l d0,d1
     adc:	243c 0000 218c 	move.l #8588,d2
     ae2:	7626           	moveq #38,d3
     ae4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     ae8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     aee:	7201           	moveq #1,d1
     af0:	4eae ff70      	jsr -144(a6)
     af4:	2039 0000 471e 	move.l 471e <Bitplane2>,d0
  ViewBuffer = Bitplane2;
     afa:	23c0 0000 471a 	move.l d0,471a <ViewBuffer>
  ViewCopper = Copperlist2;
     b00:	23f9 0000 4732 	move.l 4732 <Copperlist2>,4716 <ViewCopper>
     b06:	0000 4716 
  SwapCl();
     b0a:	4e93           	jsr (a3)
  SetBplPointers();
     b0c:	4e92           	jsr (a2)
  SwapCl();
     b0e:	4e93           	jsr (a3)
  SetBplPointers();
     b10:	4e92           	jsr (a2)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     b12:	4878 0010      	pea 10 <main+0xa>
     b16:	4879 0000 467c 	pea 467c <ClsSprites>
     b1c:	42a7           	clr.l -(sp)
     b1e:	2f39 0000 4736 	move.l 4736 <Copperlist1>,-(sp)
     b24:	45f9 0000 0d90 	lea d90 <TestCopperlistBatch>,a2
     b2a:	4e92           	jsr (a2)
     b2c:	4fef 0010      	lea 16(sp),sp
     b30:	4a80           	tst.l d0
     b32:	6600 fa8c      	bne.w 5c0 <main+0x5ba>
     b36:	6000 fa6a      	bra.w 5a2 <main+0x59c>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     b3a:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     b40:	4eae ffc4      	jsr -60(a6)
     b44:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     b4a:	2200           	move.l d0,d1
     b4c:	243c 0000 2165 	move.l #8549,d2
     b52:	7626           	moveq #38,d3
     b54:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     b58:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     b5e:	7201           	moveq #1,d1
     b60:	4eae ff70      	jsr -144(a6)
     b64:	2039 0000 472e 	move.l 472e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
     b6a:	23c0 0000 4726 	move.l d0,4726 <DrawBuffer>
  DrawCopper = Copperlist1;
     b70:	23f9 0000 4736 	move.l 4736 <Copperlist1>,4722 <DrawCopper>
     b76:	0000 4722 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
     b7a:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     b80:	203c 0000 6400 	move.l #25600,d0
     b86:	7202           	moveq #2,d1
     b88:	4eae ff3a      	jsr -198(a6)
     b8c:	23c0 0000 471e 	move.l d0,471e <Bitplane2>
  if(Bitplane2 == 0) {
     b92:	6600 f9d4      	bne.w 568 <main+0x562>
     b96:	6000 ff32      	bra.w aca <main+0xac4>
     b9a:	0cb9 0004 0000 	cmpi.l #262144,471a <ViewBuffer>
     ba0:	0000 471a 
     ba4:	6700 f6f8      	beq.w 29e <main+0x298>
    Write( Output(), 
     ba8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     bae:	4eae ffc4      	jsr -60(a6)
     bb2:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     bb8:	2200           	move.l d0,d1
     bba:	243c 0000 21ff 	move.l #8703,d2
     bc0:	763b           	moveq #59,d3
     bc2:	4eae ffd0      	jsr -48(a6)
     bc6:	6000 f6d6      	bra.w 29e <main+0x298>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     bca:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     bd0:	4eae ffc4      	jsr -60(a6)
     bd4:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
     bda:	2200           	move.l d0,d1
     bdc:	243c 0000 22b5 	move.l #8885,d2
     be2:	7621           	moveq #33,d3
     be4:	4eae ffd0      	jsr -48(a6)
     be8:	2079 0000 4736 	movea.l 4736 <Copperlist1>,a0
     bee:	6000 f72c      	bra.w 31c <main+0x316>
	APTR vbr = 0;
     bf2:	7000           	moveq #0,d0
	VBR=GetVBR();
     bf4:	23c0 0000 4706 	move.l d0,4706 <VBR.lto_priv.2>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     bfa:	2079 0000 4706 	movea.l 4706 <VBR.lto_priv.2>,a0
     c00:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     c04:	23c7 0000 470a 	move.l d7,470a <SystemIrq>
	WaitVbl();
     c0a:	4e92           	jsr (a2)
	WaitVbl();
     c0c:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     c0e:	2079 0000 4712 	movea.l 4712 <hw>,a0
     c14:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     c18:	6000 fd1a      	bra.w 934 <main+0x92e>

00000c1c <WriteFont.constprop.1>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
     c1c:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
     c20:	206f 0008      	movea.l 8(sp),a0
     c24:	1010           	move.b (a0),d0
     c26:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
     c2a:	4880           	ext.w d0
     c2c:	48c0           	ext.l d0
     c2e:	e788           	lsl.l #3,d0
  fntptr += charpos;
     c30:	4880           	ext.w d0
     c32:	3040           	movea.w d0,a0
     c34:	d1c8           	adda.l a0,a0
     c36:	d1fc 0000 46bc 	adda.l #18108,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
     c3c:	3290           	move.w (a0),(a1)
     c3e:	3368 0002 0050 	move.w 2(a0),80(a1)
     c44:	3368 0004 00a0 	move.w 4(a0),160(a1)
     c4a:	3368 0006 00f0 	move.w 6(a0),240(a1)
     c50:	3368 0008 0140 	move.w 8(a0),320(a1)
     c56:	3368 000a 0190 	move.w 10(a0),400(a1)
     c5c:	3368 000c 01e0 	move.w 12(a0),480(a1)
     c62:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
     c68:	4e75           	rts

00000c6a <TestCopperlistPos.constprop.0>:
  int test1 = instructions[pos];
     c6a:	202f 0008      	move.l 8(sp),d0
     c6e:	d080           	add.l d0,d0
     c70:	d080           	add.l d0,d0
  if( instructions[pos] == value ) 
     c72:	206f 0004      	movea.l 4(sp),a0
     c76:	72fe           	moveq #-2,d1
     c78:	b2b0 0800      	cmp.l (0,a0,d0.l),d1
     c7c:	57c0           	seq d0
     c7e:	4880           	ext.w d0
     c80:	48c0           	ext.l d0
}
     c82:	4480           	neg.l d0
     c84:	4e75           	rts

00000c86 <warpmode.part.0>:
void warpmode(int on) 
     c86:	598f           	subq.l #4,sp
     c88:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     c8a:	4aaf 000c      	tst.l 12(sp)
     c8e:	674c           	beq.s cdc <warpmode.part.0+0x56>
     c90:	4878 0001      	pea 1 <_start+0x1>
     c94:	740b           	moveq #11,d2
     c96:	d48f           	add.l sp,d2
     c98:	2f02           	move.l d2,-(sp)
     c9a:	42a7           	clr.l -(sp)
     c9c:	4879 0000 212a 	pea 212a <incbin_swfont_end+0x34>
     ca2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdf4c3>
     ca6:	4878 0052      	pea 52 <main+0x4c>
     caa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeef424>
     cb0:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     cb4:	203c 0000 2110 	move.l #8464,d0
     cba:	4878 0001      	pea 1 <_start+0x1>
     cbe:	2f02           	move.l d2,-(sp)
     cc0:	42a7           	clr.l -(sp)
     cc2:	2f00           	move.l d0,-(sp)
     cc4:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdf4c3>
     cc8:	4878 0052      	pea 52 <main+0x4c>
     ccc:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeef424>
	}
}
     cd2:	4fef 0018      	lea 24(sp),sp
     cd6:	241f           	move.l (sp)+,d2
     cd8:	588f           	addq.l #4,sp
     cda:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     cdc:	4878 0001      	pea 1 <_start+0x1>
     ce0:	740b           	moveq #11,d2
     ce2:	d48f           	add.l sp,d2
     ce4:	2f02           	move.l d2,-(sp)
     ce6:	42a7           	clr.l -(sp)
     ce8:	4879 0000 2134 	pea 2134 <incbin_swfont_end+0x3e>
     cee:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdf4c3>
     cf2:	4878 0052      	pea 52 <main+0x4c>
     cf6:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeef424>
     cfc:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     d00:	203c 0000 20f7 	move.l #8439,d0
     d06:	4878 0001      	pea 1 <_start+0x1>
     d0a:	2f02           	move.l d2,-(sp)
     d0c:	42a7           	clr.l -(sp)
     d0e:	2f00           	move.l d0,-(sp)
     d10:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdf4c3>
     d14:	4878 0052      	pea 52 <main+0x4c>
     d18:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeef424>
}
     d1e:	4fef 0018      	lea 24(sp),sp
     d22:	241f           	move.l (sp)+,d2
     d24:	588f           	addq.l #4,sp
     d26:	4e75           	rts

00000d28 <KPrintF>:
{
     d28:	4fef ff80      	lea -128(sp),sp
     d2c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     d30:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeef424>
     d36:	6734           	beq.s d6c <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     d38:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     d3e:	206f 0090      	movea.l 144(sp),a0
     d42:	43ef 0094      	lea 148(sp),a1
     d46:	45f9 0000 1934 	lea 1934 <PutChar>,a2
     d4c:	47ef 000c      	lea 12(sp),a3
     d50:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     d54:	2f0b           	move.l a3,-(sp)
     d56:	4878 0056      	pea 56 <main+0x50>
     d5a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeef424>
     d60:	508f           	addq.l #8,sp
}
     d62:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     d66:	4fef 0080      	lea 128(sp),sp
     d6a:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     d6c:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     d72:	206f 0090      	movea.l 144(sp),a0
     d76:	43ef 0094      	lea 148(sp),a1
     d7a:	45f9 0000 1926 	lea 1926 <KPutCharX>,a2
     d80:	97cb           	suba.l a3,a3
     d82:	4eae fdf6      	jsr -522(a6)
}
     d86:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     d8a:	4fef 0080      	lea 128(sp),sp
     d8e:	4e75           	rts

00000d90 <TestCopperlistBatch>:
                                                                  long length) {
     d90:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     d94:	246f 0010      	movea.l 16(sp),a2
     d98:	206f 0014      	movea.l 20(sp),a0
     d9c:	226f 0018      	movea.l 24(sp),a1
     da0:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     da4:	2008           	move.l a0,d0
     da6:	d088           	add.l a0,d0
     da8:	d080           	add.l d0,d0
     daa:	2411           	move.l (a1),d2
     dac:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     db0:	6600 01ac      	bne.w f5e <TestCopperlistBatch+0x1ce>
     db4:	2008           	move.l a0,d0
     db6:	5280           	addq.l #1,d0
     db8:	d080           	add.l d0,d0
     dba:	d080           	add.l d0,d0
     dbc:	2032 0800      	move.l (0,a2,d0.l),d0
     dc0:	b0a9 0004      	cmp.l 4(a1),d0
     dc4:	6600 0198      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     dc8:	7002           	moveq #2,d0
     dca:	b081           	cmp.l d1,d0
     dcc:	6700 0188      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     dd0:	2008           	move.l a0,d0
     dd2:	5480           	addq.l #2,d0
     dd4:	d080           	add.l d0,d0
     dd6:	d080           	add.l d0,d0
     dd8:	2032 0800      	move.l (0,a2,d0.l),d0
     ddc:	b0a9 0008      	cmp.l 8(a1),d0
     de0:	6600 017c      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     de4:	7403           	moveq #3,d2
     de6:	b481           	cmp.l d1,d2
     de8:	6700 016c      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     dec:	2008           	move.l a0,d0
     dee:	5680           	addq.l #3,d0
     df0:	d080           	add.l d0,d0
     df2:	d080           	add.l d0,d0
     df4:	2032 0800      	move.l (0,a2,d0.l),d0
     df8:	b0a9 000c      	cmp.l 12(a1),d0
     dfc:	6600 0160      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e00:	7004           	moveq #4,d0
     e02:	b081           	cmp.l d1,d0
     e04:	6700 0150      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e08:	2008           	move.l a0,d0
     e0a:	5880           	addq.l #4,d0
     e0c:	d080           	add.l d0,d0
     e0e:	d080           	add.l d0,d0
     e10:	2032 0800      	move.l (0,a2,d0.l),d0
     e14:	b0a9 0010      	cmp.l 16(a1),d0
     e18:	6600 0144      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e1c:	7405           	moveq #5,d2
     e1e:	b481           	cmp.l d1,d2
     e20:	6700 0134      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e24:	2008           	move.l a0,d0
     e26:	5a80           	addq.l #5,d0
     e28:	d080           	add.l d0,d0
     e2a:	d080           	add.l d0,d0
     e2c:	2032 0800      	move.l (0,a2,d0.l),d0
     e30:	b0a9 0014      	cmp.l 20(a1),d0
     e34:	6600 0128      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e38:	7006           	moveq #6,d0
     e3a:	b081           	cmp.l d1,d0
     e3c:	6700 0118      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e40:	2008           	move.l a0,d0
     e42:	5c80           	addq.l #6,d0
     e44:	d080           	add.l d0,d0
     e46:	d080           	add.l d0,d0
     e48:	2032 0800      	move.l (0,a2,d0.l),d0
     e4c:	b0a9 0018      	cmp.l 24(a1),d0
     e50:	6600 010c      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e54:	7407           	moveq #7,d2
     e56:	b481           	cmp.l d1,d2
     e58:	6700 00fc      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e5c:	2008           	move.l a0,d0
     e5e:	5e80           	addq.l #7,d0
     e60:	d080           	add.l d0,d0
     e62:	d080           	add.l d0,d0
     e64:	2032 0800      	move.l (0,a2,d0.l),d0
     e68:	b0a9 001c      	cmp.l 28(a1),d0
     e6c:	6600 00f0      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e70:	7008           	moveq #8,d0
     e72:	b081           	cmp.l d1,d0
     e74:	6700 00e0      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e78:	2008           	move.l a0,d0
     e7a:	5080           	addq.l #8,d0
     e7c:	d080           	add.l d0,d0
     e7e:	d080           	add.l d0,d0
     e80:	2032 0800      	move.l (0,a2,d0.l),d0
     e84:	b0a9 0020      	cmp.l 32(a1),d0
     e88:	6600 00d4      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     e8c:	7409           	moveq #9,d2
     e8e:	b481           	cmp.l d1,d2
     e90:	6700 00c4      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     e94:	47e8 0009      	lea 9(a0),a3
     e98:	200b           	move.l a3,d0
     e9a:	d08b           	add.l a3,d0
     e9c:	d080           	add.l d0,d0
     e9e:	2032 0800      	move.l (0,a2,d0.l),d0
     ea2:	b0a9 0024      	cmp.l 36(a1),d0
     ea6:	6600 00b6      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     eaa:	700a           	moveq #10,d0
     eac:	b081           	cmp.l d1,d0
     eae:	6700 00a6      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     eb2:	47e8 000a      	lea 10(a0),a3
     eb6:	200b           	move.l a3,d0
     eb8:	d08b           	add.l a3,d0
     eba:	d080           	add.l d0,d0
     ebc:	2032 0800      	move.l (0,a2,d0.l),d0
     ec0:	b0a9 0028      	cmp.l 40(a1),d0
     ec4:	6600 0098      	bne.w f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ec8:	740b           	moveq #11,d2
     eca:	b481           	cmp.l d1,d2
     ecc:	6700 0088      	beq.w f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ed0:	47e8 000b      	lea 11(a0),a3
     ed4:	200b           	move.l a3,d0
     ed6:	d08b           	add.l a3,d0
     ed8:	d080           	add.l d0,d0
     eda:	2032 0800      	move.l (0,a2,d0.l),d0
     ede:	b0a9 002c      	cmp.l 44(a1),d0
     ee2:	667a           	bne.s f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     ee4:	700c           	moveq #12,d0
     ee6:	b081           	cmp.l d1,d0
     ee8:	676c           	beq.s f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     eea:	47e8 000c      	lea 12(a0),a3
     eee:	200b           	move.l a3,d0
     ef0:	d08b           	add.l a3,d0
     ef2:	d080           	add.l d0,d0
     ef4:	2032 0800      	move.l (0,a2,d0.l),d0
     ef8:	b0a9 0030      	cmp.l 48(a1),d0
     efc:	6660           	bne.s f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     efe:	740d           	moveq #13,d2
     f00:	b481           	cmp.l d1,d2
     f02:	6752           	beq.s f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f04:	47e8 000d      	lea 13(a0),a3
     f08:	200b           	move.l a3,d0
     f0a:	d08b           	add.l a3,d0
     f0c:	d080           	add.l d0,d0
     f0e:	2032 0800      	move.l (0,a2,d0.l),d0
     f12:	b0a9 0034      	cmp.l 52(a1),d0
     f16:	6646           	bne.s f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f18:	700e           	moveq #14,d0
     f1a:	b081           	cmp.l d1,d0
     f1c:	6738           	beq.s f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f1e:	47e8 000e      	lea 14(a0),a3
     f22:	200b           	move.l a3,d0
     f24:	d08b           	add.l a3,d0
     f26:	d080           	add.l d0,d0
     f28:	2032 0800      	move.l (0,a2,d0.l),d0
     f2c:	b0a9 0038      	cmp.l 56(a1),d0
     f30:	662c           	bne.s f5e <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     f32:	7410           	moveq #16,d2
     f34:	b481           	cmp.l d1,d2
     f36:	661e           	bne.s f56 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     f38:	41e8 000f      	lea 15(a0),a0
     f3c:	d1c8           	adda.l a0,a0
     f3e:	d1c8           	adda.l a0,a0
     f40:	2070 a800      	movea.l (0,a0,a2.l),a0
     f44:	b1e9 003c      	cmpa.l 60(a1),a0
     f48:	57c0           	seq d0
     f4a:	4880           	ext.w d0
     f4c:	48c0           	ext.l d0
     f4e:	4480           	neg.l d0
}
     f50:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     f54:	4e75           	rts
  return 1;
     f56:	7001           	moveq #1,d0
}
     f58:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     f5c:	4e75           	rts
      return 0;
     f5e:	7000           	moveq #0,d0
}
     f60:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     f64:	4e75           	rts

00000f66 <ClBuild>:
ULONG * ClbuildSW() {
     f66:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
     f6a:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
     f70:	707b           	moveq #123,d0
     f72:	4600           	not.b d0
     f74:	7202           	moveq #2,d1
     f76:	4eae ff3a      	jsr -198(a6)
     f7a:	2440           	movea.l d0,a2
  if( retval == 0) {
     f7c:	4a80           	tst.l d0
     f7e:	6700 010e      	beq.w 108e <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     f82:	24b9 0000 467c 	move.l 467c <ClsSprites>,(a2)
     f88:	2579 0000 4680 	move.l 4680 <ClsSprites+0x4>,4(a2)
     f8e:	0004 
     f90:	2579 0000 4684 	move.l 4684 <ClsSprites+0x8>,8(a2)
     f96:	0008 
     f98:	2579 0000 4688 	move.l 4688 <ClsSprites+0xc>,12(a2)
     f9e:	000c 
     fa0:	2579 0000 468c 	move.l 468c <ClsSprites+0x10>,16(a2)
     fa6:	0010 
     fa8:	2579 0000 4690 	move.l 4690 <ClsSprites+0x14>,20(a2)
     fae:	0014 
     fb0:	2579 0000 4694 	move.l 4694 <ClsSprites+0x18>,24(a2)
     fb6:	0018 
     fb8:	2579 0000 4698 	move.l 4698 <ClsSprites+0x1c>,28(a2)
     fbe:	001c 
     fc0:	2579 0000 469c 	move.l 469c <ClsSprites+0x20>,32(a2)
     fc6:	0020 
     fc8:	2579 0000 46a0 	move.l 46a0 <ClsSprites+0x24>,36(a2)
     fce:	0024 
     fd0:	2579 0000 46a4 	move.l 46a4 <ClsSprites+0x28>,40(a2)
     fd6:	0028 
     fd8:	2579 0000 46a8 	move.l 46a8 <ClsSprites+0x2c>,44(a2)
     fde:	002c 
     fe0:	2579 0000 46ac 	move.l 46ac <ClsSprites+0x30>,48(a2)
     fe6:	0030 
     fe8:	2579 0000 46b0 	move.l 46b0 <ClsSprites+0x34>,52(a2)
     fee:	0034 
     ff0:	2579 0000 46b4 	move.l 46b4 <ClsSprites+0x38>,56(a2)
     ff6:	0038 
     ff8:	2579 0000 46b8 	move.l 46b8 <ClsSprites+0x3c>,60(a2)
     ffe:	003c 
    *cl++ = *clpartinstruction++;
    1000:	2579 0000 464c 	move.l 464c <ClScreen>,64(a2)
    1006:	0040 
    1008:	2579 0000 4650 	move.l 4650 <ClScreen+0x4>,68(a2)
    100e:	0044 
    1010:	2579 0000 4654 	move.l 4654 <ClScreen+0x8>,72(a2)
    1016:	0048 
    1018:	2579 0000 4658 	move.l 4658 <ClScreen+0xc>,76(a2)
    101e:	004c 
    1020:	2579 0000 465c 	move.l 465c <ClScreen+0x10>,80(a2)
    1026:	0050 
    1028:	2579 0000 4660 	move.l 4660 <ClScreen+0x14>,84(a2)
    102e:	0054 
    1030:	2579 0000 4664 	move.l 4664 <ClScreen+0x18>,88(a2)
    1036:	0058 
    1038:	2579 0000 4668 	move.l 4668 <ClScreen+0x1c>,92(a2)
    103e:	005c 
    1040:	2579 0000 466c 	move.l 466c <ClScreen+0x20>,96(a2)
    1046:	0060 
    1048:	2579 0000 4670 	move.l 4670 <ClScreen+0x24>,100(a2)
    104e:	0064 
    1050:	2579 0000 4674 	move.l 4674 <ClScreen+0x28>,104(a2)
    1056:	0068 
    1058:	2579 0000 4678 	move.l 4678 <ClScreen+0x2c>,108(a2)
    105e:	006c 
  *cl++ = 0x00e00000;
    1060:	257c 00e0 0000 	move.l #14680064,112(a2)
    1066:	0070 
  *cl++ = 0x00e20000;
    1068:	257c 00e2 0000 	move.l #14811136,116(a2)
    106e:	0074 
    *cl++ = *clpartinstruction++;
    1070:	2579 0000 4644 	move.l 4644 <ClColor>,120(a2)
    1076:	0078 
    1078:	2579 0000 4648 	move.l 4648 <ClColor+0x4>,124(a2)
    107e:	007c 
  *cl = 0xfffffffe;
    1080:	70fe           	moveq #-2,d0
    1082:	2540 0080      	move.l d0,128(a2)
}
    1086:	200a           	move.l a2,d0
    1088:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    108c:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    108e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    1094:	4eae ffc4      	jsr -60(a6)
    1098:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    109e:	2200           	move.l d0,d1
    10a0:	243c 0000 213f 	move.l #8511,d2
    10a6:	7628           	moveq #40,d3
    10a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    10ac:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    10b2:	7201           	moveq #1,d1
    10b4:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    10b8:	24b9 0000 467c 	move.l 467c <ClsSprites>,(a2)
    10be:	2579 0000 4680 	move.l 4680 <ClsSprites+0x4>,4(a2)
    10c4:	0004 
    10c6:	2579 0000 4684 	move.l 4684 <ClsSprites+0x8>,8(a2)
    10cc:	0008 
    10ce:	2579 0000 4688 	move.l 4688 <ClsSprites+0xc>,12(a2)
    10d4:	000c 
    10d6:	2579 0000 468c 	move.l 468c <ClsSprites+0x10>,16(a2)
    10dc:	0010 
    10de:	2579 0000 4690 	move.l 4690 <ClsSprites+0x14>,20(a2)
    10e4:	0014 
    10e6:	2579 0000 4694 	move.l 4694 <ClsSprites+0x18>,24(a2)
    10ec:	0018 
    10ee:	2579 0000 4698 	move.l 4698 <ClsSprites+0x1c>,28(a2)
    10f4:	001c 
    10f6:	2579 0000 469c 	move.l 469c <ClsSprites+0x20>,32(a2)
    10fc:	0020 
    10fe:	2579 0000 46a0 	move.l 46a0 <ClsSprites+0x24>,36(a2)
    1104:	0024 
    1106:	2579 0000 46a4 	move.l 46a4 <ClsSprites+0x28>,40(a2)
    110c:	0028 
    110e:	2579 0000 46a8 	move.l 46a8 <ClsSprites+0x2c>,44(a2)
    1114:	002c 
    1116:	2579 0000 46ac 	move.l 46ac <ClsSprites+0x30>,48(a2)
    111c:	0030 
    111e:	2579 0000 46b0 	move.l 46b0 <ClsSprites+0x34>,52(a2)
    1124:	0034 
    1126:	2579 0000 46b4 	move.l 46b4 <ClsSprites+0x38>,56(a2)
    112c:	0038 
    112e:	2579 0000 46b8 	move.l 46b8 <ClsSprites+0x3c>,60(a2)
    1134:	003c 
    *cl++ = *clpartinstruction++;
    1136:	2579 0000 464c 	move.l 464c <ClScreen>,64(a2)
    113c:	0040 
    113e:	2579 0000 4650 	move.l 4650 <ClScreen+0x4>,68(a2)
    1144:	0044 
    1146:	2579 0000 4654 	move.l 4654 <ClScreen+0x8>,72(a2)
    114c:	0048 
    114e:	2579 0000 4658 	move.l 4658 <ClScreen+0xc>,76(a2)
    1154:	004c 
    1156:	2579 0000 465c 	move.l 465c <ClScreen+0x10>,80(a2)
    115c:	0050 
    115e:	2579 0000 4660 	move.l 4660 <ClScreen+0x14>,84(a2)
    1164:	0054 
    1166:	2579 0000 4664 	move.l 4664 <ClScreen+0x18>,88(a2)
    116c:	0058 
    116e:	2579 0000 4668 	move.l 4668 <ClScreen+0x1c>,92(a2)
    1174:	005c 
    1176:	2579 0000 466c 	move.l 466c <ClScreen+0x20>,96(a2)
    117c:	0060 
    117e:	2579 0000 4670 	move.l 4670 <ClScreen+0x24>,100(a2)
    1184:	0064 
    1186:	2579 0000 4674 	move.l 4674 <ClScreen+0x28>,104(a2)
    118c:	0068 
    118e:	2579 0000 4678 	move.l 4678 <ClScreen+0x2c>,108(a2)
    1194:	006c 
  *cl++ = 0x00e00000;
    1196:	257c 00e0 0000 	move.l #14680064,112(a2)
    119c:	0070 
  *cl++ = 0x00e20000;
    119e:	257c 00e2 0000 	move.l #14811136,116(a2)
    11a4:	0074 
    *cl++ = *clpartinstruction++;
    11a6:	2579 0000 4644 	move.l 4644 <ClColor>,120(a2)
    11ac:	0078 
    11ae:	2579 0000 4648 	move.l 4648 <ClColor+0x4>,124(a2)
    11b4:	007c 
  *cl = 0xfffffffe;
    11b6:	70fe           	moveq #-2,d0
    11b8:	2540 0080      	move.l d0,128(a2)
}
    11bc:	200a           	move.l a2,d0
    11be:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    11c2:	4e75           	rts

000011c4 <ClbuildZoom>:
ULONG * ClbuildZoom() {
    11c4:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    11c8:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    11ce:	203c 0000 a484 	move.l #42116,d0
    11d4:	7202           	moveq #2,d1
    11d6:	4eae ff3a      	jsr -198(a6)
    11da:	2440           	movea.l d0,a2
  if( retval == 0) {
    11dc:	4a80           	tst.l d0
    11de:	6700 0150      	beq.w 1330 <ClbuildZoom+0x16c>
    *cl++ = *clpartinstruction++;
    11e2:	24b9 0000 467c 	move.l 467c <ClsSprites>,(a2)
    11e8:	2579 0000 4680 	move.l 4680 <ClsSprites+0x4>,4(a2)
    11ee:	0004 
    11f0:	2579 0000 4684 	move.l 4684 <ClsSprites+0x8>,8(a2)
    11f6:	0008 
    11f8:	2579 0000 4688 	move.l 4688 <ClsSprites+0xc>,12(a2)
    11fe:	000c 
    1200:	2579 0000 468c 	move.l 468c <ClsSprites+0x10>,16(a2)
    1206:	0010 
    1208:	2579 0000 4690 	move.l 4690 <ClsSprites+0x14>,20(a2)
    120e:	0014 
    1210:	2579 0000 4694 	move.l 4694 <ClsSprites+0x18>,24(a2)
    1216:	0018 
    1218:	2579 0000 4698 	move.l 4698 <ClsSprites+0x1c>,28(a2)
    121e:	001c 
    1220:	2579 0000 469c 	move.l 469c <ClsSprites+0x20>,32(a2)
    1226:	0020 
    1228:	2579 0000 46a0 	move.l 46a0 <ClsSprites+0x24>,36(a2)
    122e:	0024 
    1230:	2579 0000 46a4 	move.l 46a4 <ClsSprites+0x28>,40(a2)
    1236:	0028 
    1238:	2579 0000 46a8 	move.l 46a8 <ClsSprites+0x2c>,44(a2)
    123e:	002c 
    1240:	2579 0000 46ac 	move.l 46ac <ClsSprites+0x30>,48(a2)
    1246:	0030 
    1248:	2579 0000 46b0 	move.l 46b0 <ClsSprites+0x34>,52(a2)
    124e:	0034 
    1250:	2579 0000 46b4 	move.l 46b4 <ClsSprites+0x38>,56(a2)
    1256:	0038 
    1258:	2579 0000 46b8 	move.l 46b8 <ClsSprites+0x3c>,60(a2)
    125e:	003c 
    *cl++ = *clpartinstruction++;
    1260:	2579 0000 4614 	move.l 4614 <ClScreenZoom>,64(a2)
    1266:	0040 
    1268:	2579 0000 4618 	move.l 4618 <ClScreenZoom+0x4>,68(a2)
    126e:	0044 
    1270:	2579 0000 461c 	move.l 461c <ClScreenZoom+0x8>,72(a2)
    1276:	0048 
    1278:	2579 0000 4620 	move.l 4620 <ClScreenZoom+0xc>,76(a2)
    127e:	004c 
    1280:	2579 0000 4624 	move.l 4624 <ClScreenZoom+0x10>,80(a2)
    1286:	0050 
    1288:	2579 0000 4628 	move.l 4628 <ClScreenZoom+0x14>,84(a2)
    128e:	0054 
    1290:	2579 0000 462c 	move.l 462c <ClScreenZoom+0x18>,88(a2)
    1296:	0058 
    1298:	2579 0000 4630 	move.l 4630 <ClScreenZoom+0x1c>,92(a2)
    129e:	005c 
    12a0:	2579 0000 4634 	move.l 4634 <ClScreenZoom+0x20>,96(a2)
    12a6:	0060 
    12a8:	2579 0000 4638 	move.l 4638 <ClScreenZoom+0x24>,100(a2)
    12ae:	0064 
    12b0:	2579 0000 463c 	move.l 463c <ClScreenZoom+0x28>,104(a2)
    12b6:	0068 
    12b8:	2579 0000 4640 	move.l 4640 <ClScreenZoom+0x2c>,108(a2)
    12be:	006c 
  *cl++ = 0x00e00000;
    12c0:	257c 00e0 0000 	move.l #14680064,112(a2)
    12c6:	0070 
  *cl++ = 0x00e20000;
    12c8:	257c 00e2 0000 	move.l #14811136,116(a2)
    12ce:	0074 
    *cl++ = *clpartinstruction++;
    12d0:	2579 0000 4644 	move.l 4644 <ClColor>,120(a2)
    12d6:	0078 
    12d8:	2579 0000 4648 	move.l 4648 <ClColor+0x4>,124(a2)
    12de:	007c 
    12e0:	43ea 0124      	lea 292(a2),a1
    12e4:	220a           	move.l a2,d1
    12e6:	0681 0000 a524 	addi.l #42276,d1
    12ec:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    12f2:	41e9 ff60      	lea -160(a1),a0
    12f6:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    12fa:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    1300:	5088           	addq.l #8,a0
    1302:	217c 0182 0f00 	move.l #25300736,-4(a0)
    1308:	fffc 
    for(int i2=0;i2<20;i2++) {
    130a:	b3c8           	cmpa.l a0,a1
    130c:	66ec           	bne.s 12fa <ClbuildZoom+0x136>
    130e:	43e8 00a4      	lea 164(a0),a1
    1312:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    1318:	b3c1           	cmpa.l d1,a1
    131a:	66d6           	bne.s 12f2 <ClbuildZoom+0x12e>
   *cl = 0xfffffffe;
    131c:	203c 0000 a480 	move.l #42112,d0
    1322:	72fe           	moveq #-2,d1
    1324:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    1328:	200a           	move.l a2,d0
    132a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    132e:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1330:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    1336:	4eae ffc4      	jsr -60(a6)
    133a:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    1340:	2200           	move.l d0,d1
    1342:	243c 0000 213f 	move.l #8511,d2
    1348:	7628           	moveq #40,d3
    134a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    134e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    1354:	7201           	moveq #1,d1
    1356:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    135a:	24b9 0000 467c 	move.l 467c <ClsSprites>,(a2)
    1360:	2579 0000 4680 	move.l 4680 <ClsSprites+0x4>,4(a2)
    1366:	0004 
    1368:	2579 0000 4684 	move.l 4684 <ClsSprites+0x8>,8(a2)
    136e:	0008 
    1370:	2579 0000 4688 	move.l 4688 <ClsSprites+0xc>,12(a2)
    1376:	000c 
    1378:	2579 0000 468c 	move.l 468c <ClsSprites+0x10>,16(a2)
    137e:	0010 
    1380:	2579 0000 4690 	move.l 4690 <ClsSprites+0x14>,20(a2)
    1386:	0014 
    1388:	2579 0000 4694 	move.l 4694 <ClsSprites+0x18>,24(a2)
    138e:	0018 
    1390:	2579 0000 4698 	move.l 4698 <ClsSprites+0x1c>,28(a2)
    1396:	001c 
    1398:	2579 0000 469c 	move.l 469c <ClsSprites+0x20>,32(a2)
    139e:	0020 
    13a0:	2579 0000 46a0 	move.l 46a0 <ClsSprites+0x24>,36(a2)
    13a6:	0024 
    13a8:	2579 0000 46a4 	move.l 46a4 <ClsSprites+0x28>,40(a2)
    13ae:	0028 
    13b0:	2579 0000 46a8 	move.l 46a8 <ClsSprites+0x2c>,44(a2)
    13b6:	002c 
    13b8:	2579 0000 46ac 	move.l 46ac <ClsSprites+0x30>,48(a2)
    13be:	0030 
    13c0:	2579 0000 46b0 	move.l 46b0 <ClsSprites+0x34>,52(a2)
    13c6:	0034 
    13c8:	2579 0000 46b4 	move.l 46b4 <ClsSprites+0x38>,56(a2)
    13ce:	0038 
    13d0:	2579 0000 46b8 	move.l 46b8 <ClsSprites+0x3c>,60(a2)
    13d6:	003c 
    *cl++ = *clpartinstruction++;
    13d8:	2579 0000 4614 	move.l 4614 <ClScreenZoom>,64(a2)
    13de:	0040 
    13e0:	2579 0000 4618 	move.l 4618 <ClScreenZoom+0x4>,68(a2)
    13e6:	0044 
    13e8:	2579 0000 461c 	move.l 461c <ClScreenZoom+0x8>,72(a2)
    13ee:	0048 
    13f0:	2579 0000 4620 	move.l 4620 <ClScreenZoom+0xc>,76(a2)
    13f6:	004c 
    13f8:	2579 0000 4624 	move.l 4624 <ClScreenZoom+0x10>,80(a2)
    13fe:	0050 
    1400:	2579 0000 4628 	move.l 4628 <ClScreenZoom+0x14>,84(a2)
    1406:	0054 
    1408:	2579 0000 462c 	move.l 462c <ClScreenZoom+0x18>,88(a2)
    140e:	0058 
    1410:	2579 0000 4630 	move.l 4630 <ClScreenZoom+0x1c>,92(a2)
    1416:	005c 
    1418:	2579 0000 4634 	move.l 4634 <ClScreenZoom+0x20>,96(a2)
    141e:	0060 
    1420:	2579 0000 4638 	move.l 4638 <ClScreenZoom+0x24>,100(a2)
    1426:	0064 
    1428:	2579 0000 463c 	move.l 463c <ClScreenZoom+0x28>,104(a2)
    142e:	0068 
    1430:	2579 0000 4640 	move.l 4640 <ClScreenZoom+0x2c>,108(a2)
    1436:	006c 
  *cl++ = 0x00e00000;
    1438:	257c 00e0 0000 	move.l #14680064,112(a2)
    143e:	0070 
  *cl++ = 0x00e20000;
    1440:	257c 00e2 0000 	move.l #14811136,116(a2)
    1446:	0074 
    *cl++ = *clpartinstruction++;
    1448:	2579 0000 4644 	move.l 4644 <ClColor>,120(a2)
    144e:	0078 
    1450:	2579 0000 4648 	move.l 4648 <ClColor+0x4>,124(a2)
    1456:	007c 
    1458:	43ea 0124      	lea 292(a2),a1
    145c:	220a           	move.l a2,d1
    145e:	0681 0000 a524 	addi.l #42276,d1
    1464:	203c 2c07 fffe 	move.l #738721790,d0
    146a:	6000 fe86      	bra.w 12f2 <ClbuildZoom+0x12e>

0000146e <SwapCl>:
  ULONG tmp = DrawCopper;
    146e:	2039 0000 4722 	move.l 4722 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1474:	23f9 0000 4716 	move.l 4716 <ViewCopper>,4722 <DrawCopper>
    147a:	0000 4722 
  ViewCopper = tmp;
    147e:	23c0 0000 4716 	move.l d0,4716 <ViewCopper>
  hw->cop1lc = ViewCopper;
    1484:	2079 0000 4712 	movea.l 4712 <hw>,a0
    148a:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    148e:	3140 0088      	move.w d0,136(a0)
}
    1492:	4e75           	rts

00001494 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1494:	2039 0000 4726 	move.l 4726 <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
    149a:	2079 0000 4722 	movea.l 4722 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    14a0:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    14a4:	2200           	move.l d0,d1
    14a6:	4241           	clr.w d1
    14a8:	4841           	swap d1
    14aa:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    14ae:	23f9 0000 471a 	move.l 471a <ViewBuffer>,4726 <DrawBuffer>
    14b4:	0000 4726 
  ViewBuffer = tmp;
    14b8:	23c0 0000 471a 	move.l d0,471a <ViewBuffer>
}
    14be:	4e75           	rts

000014c0 <PrepareDisplay>:
 int PrepareDisplaySW() {
    14c0:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    14c4:	45fa faa0      	lea f66 <ClBuild>(pc),a2
    14c8:	4e92           	jsr (a2)
    14ca:	23c0 0000 4736 	move.l d0,4736 <Copperlist1>
  Copperlist2 = ClbuildSW();
    14d0:	4e92           	jsr (a2)
    14d2:	23c0 0000 4732 	move.l d0,4732 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    14d8:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    14de:	203c 0000 c800 	move.l #51200,d0
    14e4:	7202           	moveq #2,d1
    14e6:	4eae ff3a      	jsr -198(a6)
    14ea:	23c0 0000 472e 	move.l d0,472e <Bitplane1>
  if(Bitplane1 == 0) {
    14f0:	6700 00ac      	beq.w 159e <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    14f4:	23c0 0000 4726 	move.l d0,4726 <DrawBuffer>
  DrawCopper = Copperlist1;
    14fa:	23f9 0000 4736 	move.l 4736 <Copperlist1>,4722 <DrawCopper>
    1500:	0000 4722 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    1504:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    150a:	203c 0000 c800 	move.l #51200,d0
    1510:	7202           	moveq #2,d1
    1512:	4eae ff3a      	jsr -198(a6)
    1516:	23c0 0000 471e 	move.l d0,471e <Bitplane2>
  if(Bitplane2 == 0) {
    151c:	6728           	beq.s 1546 <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    151e:	23c0 0000 471a 	move.l d0,471a <ViewBuffer>
  ViewCopper = Copperlist2;
    1524:	23f9 0000 4732 	move.l 4732 <Copperlist2>,4716 <ViewCopper>
    152a:	0000 4716 
  SwapCl();
    152e:	47fa ff3e      	lea 146e <SwapCl>(pc),a3
    1532:	4e93           	jsr (a3)
  SetBplPointers();
    1534:	45fa ff5e      	lea 1494 <SetBplPointers>(pc),a2
    1538:	4e92           	jsr (a2)
  SwapCl();
    153a:	4e93           	jsr (a3)
  SetBplPointers();
    153c:	4e92           	jsr (a2)
}
    153e:	7000           	moveq #0,d0
    1540:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1544:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1546:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    154c:	4eae ffc4      	jsr -60(a6)
    1550:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    1556:	2200           	move.l d0,d1
    1558:	243c 0000 218c 	move.l #8588,d2
    155e:	7626           	moveq #38,d3
    1560:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1564:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    156a:	7201           	moveq #1,d1
    156c:	4eae ff70      	jsr -144(a6)
    1570:	2039 0000 471e 	move.l 471e <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1576:	23c0 0000 471a 	move.l d0,471a <ViewBuffer>
  ViewCopper = Copperlist2;
    157c:	23f9 0000 4732 	move.l 4732 <Copperlist2>,4716 <ViewCopper>
    1582:	0000 4716 
  SwapCl();
    1586:	47fa fee6      	lea 146e <SwapCl>(pc),a3
    158a:	4e93           	jsr (a3)
  SetBplPointers();
    158c:	45fa ff06      	lea 1494 <SetBplPointers>(pc),a2
    1590:	4e92           	jsr (a2)
  SwapCl();
    1592:	4e93           	jsr (a3)
  SetBplPointers();
    1594:	4e92           	jsr (a2)
}
    1596:	7000           	moveq #0,d0
    1598:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    159c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    159e:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    15a4:	4eae ffc4      	jsr -60(a6)
    15a8:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    15ae:	2200           	move.l d0,d1
    15b0:	243c 0000 2165 	move.l #8549,d2
    15b6:	7626           	moveq #38,d3
    15b8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    15bc:	2c79 0000 472a 	movea.l 472a <DOSBase>,a6
    15c2:	7201           	moveq #1,d1
    15c4:	4eae ff70      	jsr -144(a6)
    15c8:	2039 0000 472e 	move.l 472e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    15ce:	23c0 0000 4726 	move.l d0,4726 <DrawBuffer>
  DrawCopper = Copperlist1;
    15d4:	23f9 0000 4736 	move.l 4736 <Copperlist1>,4722 <DrawCopper>
    15da:	0000 4722 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    15de:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    15e4:	203c 0000 c800 	move.l #51200,d0
    15ea:	7202           	moveq #2,d1
    15ec:	4eae ff3a      	jsr -198(a6)
    15f0:	23c0 0000 471e 	move.l d0,471e <Bitplane2>
  if(Bitplane2 == 0) {
    15f6:	6600 ff26      	bne.w 151e <PrepareDisplay+0x5e>
    15fa:	6000 ff4a      	bra.w 1546 <PrepareDisplay+0x86>

000015fe <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    15fe:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    1602:	262f 0010      	move.l 16(sp),d3
    1606:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    160a:	2279 0000 4736 	movea.l 4736 <Copperlist1>,a1
    1610:	b2fc 0000      	cmpa.w #0,a1
    1614:	670c           	beq.s 1622 <FreeDisplay+0x24>
    1616:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    161c:	2003           	move.l d3,d0
    161e:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    1622:	2279 0000 4732 	movea.l 4732 <Copperlist2>,a1
    1628:	b2fc 0000      	cmpa.w #0,a1
    162c:	670c           	beq.s 163a <FreeDisplay+0x3c>
    162e:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    1634:	2003           	move.l d3,d0
    1636:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    163a:	2279 0000 472e 	movea.l 472e <Bitplane1>,a1
    1640:	b2fc 0000      	cmpa.w #0,a1
    1644:	670c           	beq.s 1652 <FreeDisplay+0x54>
    1646:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    164c:	2002           	move.l d2,d0
    164e:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    1652:	2279 0000 471e 	movea.l 471e <Bitplane2>,a1
    1658:	b2fc 0000      	cmpa.w #0,a1
    165c:	670c           	beq.s 166a <FreeDisplay+0x6c>
    165e:	2c79 0000 473a 	movea.l 473a <SysBase>,a6
    1664:	2002           	move.l d2,d0
    1666:	4eae ff2e      	jsr -210(a6)
}
    166a:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    166e:	4e75           	rts

00001670 <WaitVbl>:
void WaitVbl() {
    1670:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1672:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdde4c8>,d0
    1678:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    167a:	2017           	move.l (sp),d0
    167c:	0280 0001 ff00 	andi.l #130816,d0
    1682:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1684:	2017           	move.l (sp),d0
    1686:	0c80 0001 3700 	cmpi.l #79616,d0
    168c:	67e4           	beq.s 1672 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    168e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdde4c8>,d0
    1694:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1698:	202f 0004      	move.l 4(sp),d0
    169c:	0280 0001 ff00 	andi.l #130816,d0
    16a2:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    16a6:	202f 0004      	move.l 4(sp),d0
    16aa:	0c80 0001 3700 	cmpi.l #79616,d0
    16b0:	66dc           	bne.s 168e <WaitVbl+0x1e>
}
    16b2:	508f           	addq.l #8,sp
    16b4:	4e75           	rts

000016b6 <memcpy>:
{
    16b6:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    16ba:	202f 0014      	move.l 20(sp),d0
    16be:	226f 0018      	movea.l 24(sp),a1
    16c2:	222f 001c      	move.l 28(sp),d1
	while(len--)
    16c6:	2601           	move.l d1,d3
    16c8:	5383           	subq.l #1,d3
    16ca:	4a81           	tst.l d1
    16cc:	6762           	beq.s 1730 <memcpy+0x7a>
    16ce:	2040           	movea.l d0,a0
    16d0:	5888           	addq.l #4,a0
    16d2:	b1c9           	cmpa.l a1,a0
    16d4:	53c2           	sl.s d2
    16d6:	4402           	neg.b d2
    16d8:	41e9 0004      	lea 4(a1),a0
    16dc:	b1c0           	cmpa.l d0,a0
    16de:	53c4           	sl.s d4
    16e0:	4404           	neg.b d4
    16e2:	8404           	or.b d4,d2
    16e4:	7808           	moveq #8,d4
    16e6:	b883           	cmp.l d3,d4
    16e8:	55c4           	sc.s d4
    16ea:	4404           	neg.b d4
    16ec:	c404           	and.b d4,d2
    16ee:	6746           	beq.s 1736 <memcpy+0x80>
    16f0:	2409           	move.l a1,d2
    16f2:	8480           	or.l d0,d2
    16f4:	7803           	moveq #3,d4
    16f6:	c484           	and.l d4,d2
    16f8:	663c           	bne.s 1736 <memcpy+0x80>
    16fa:	2049           	movea.l a1,a0
    16fc:	2440           	movea.l d0,a2
    16fe:	74fc           	moveq #-4,d2
    1700:	c481           	and.l d1,d2
    1702:	d489           	add.l a1,d2
		*d++ = *s++;
    1704:	24d8           	move.l (a0)+,(a2)+
    1706:	b488           	cmp.l a0,d2
    1708:	66fa           	bne.s 1704 <memcpy+0x4e>
    170a:	74fc           	moveq #-4,d2
    170c:	c481           	and.l d1,d2
    170e:	2040           	movea.l d0,a0
    1710:	d1c2           	adda.l d2,a0
    1712:	d3c2           	adda.l d2,a1
    1714:	9682           	sub.l d2,d3
    1716:	b481           	cmp.l d1,d2
    1718:	6716           	beq.s 1730 <memcpy+0x7a>
    171a:	1091           	move.b (a1),(a0)
	while(len--)
    171c:	4a83           	tst.l d3
    171e:	6710           	beq.s 1730 <memcpy+0x7a>
		*d++ = *s++;
    1720:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1726:	5383           	subq.l #1,d3
    1728:	6706           	beq.s 1730 <memcpy+0x7a>
		*d++ = *s++;
    172a:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    1730:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    1734:	4e75           	rts
    1736:	2040           	movea.l d0,a0
    1738:	d289           	add.l a1,d1
		*d++ = *s++;
    173a:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    173c:	b289           	cmp.l a1,d1
    173e:	67f0           	beq.s 1730 <memcpy+0x7a>
		*d++ = *s++;
    1740:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    1742:	b289           	cmp.l a1,d1
    1744:	66f4           	bne.s 173a <memcpy+0x84>
    1746:	60e8           	bra.s 1730 <memcpy+0x7a>

00001748 <memset>:
{
    1748:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    174c:	202f 0024      	move.l 36(sp),d0
    1750:	2a2f 0028      	move.l 40(sp),d5
    1754:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    1758:	2809           	move.l a1,d4
    175a:	5384           	subq.l #1,d4
    175c:	b2fc 0000      	cmpa.w #0,a1
    1760:	6f00 00b0      	ble.w 1812 <memset+0xca>
    1764:	1e05           	move.b d5,d7
    1766:	2200           	move.l d0,d1
    1768:	4481           	neg.l d1
    176a:	7403           	moveq #3,d2
    176c:	c282           	and.l d2,d1
    176e:	7c05           	moveq #5,d6
		*ptr++ = val;
    1770:	2440           	movea.l d0,a2
    1772:	bc84           	cmp.l d4,d6
    1774:	646a           	bcc.s 17e0 <memset+0x98>
    1776:	4a81           	tst.l d1
    1778:	6724           	beq.s 179e <memset+0x56>
    177a:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    177c:	5384           	subq.l #1,d4
    177e:	7401           	moveq #1,d2
    1780:	b481           	cmp.l d1,d2
    1782:	671a           	beq.s 179e <memset+0x56>
		*ptr++ = val;
    1784:	2440           	movea.l d0,a2
    1786:	548a           	addq.l #2,a2
    1788:	2040           	movea.l d0,a0
    178a:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    178e:	5384           	subq.l #1,d4
    1790:	7403           	moveq #3,d2
    1792:	b481           	cmp.l d1,d2
    1794:	6608           	bne.s 179e <memset+0x56>
		*ptr++ = val;
    1796:	528a           	addq.l #1,a2
    1798:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    179c:	5384           	subq.l #1,d4
    179e:	2609           	move.l a1,d3
    17a0:	9681           	sub.l d1,d3
    17a2:	7c00           	moveq #0,d6
    17a4:	1c05           	move.b d5,d6
    17a6:	2406           	move.l d6,d2
    17a8:	4842           	swap d2
    17aa:	4242           	clr.w d2
    17ac:	2042           	movea.l d2,a0
    17ae:	2406           	move.l d6,d2
    17b0:	e14a           	lsl.w #8,d2
    17b2:	4842           	swap d2
    17b4:	4242           	clr.w d2
    17b6:	e18e           	lsl.l #8,d6
    17b8:	2646           	movea.l d6,a3
    17ba:	2c08           	move.l a0,d6
    17bc:	8486           	or.l d6,d2
    17be:	2c0b           	move.l a3,d6
    17c0:	8486           	or.l d6,d2
    17c2:	1407           	move.b d7,d2
    17c4:	2040           	movea.l d0,a0
    17c6:	d1c1           	adda.l d1,a0
    17c8:	72fc           	moveq #-4,d1
    17ca:	c283           	and.l d3,d1
    17cc:	d288           	add.l a0,d1
		*ptr++ = val;
    17ce:	20c2           	move.l d2,(a0)+
    17d0:	b1c1           	cmpa.l d1,a0
    17d2:	66fa           	bne.s 17ce <memset+0x86>
    17d4:	72fc           	moveq #-4,d1
    17d6:	c283           	and.l d3,d1
    17d8:	d5c1           	adda.l d1,a2
    17da:	9881           	sub.l d1,d4
    17dc:	b283           	cmp.l d3,d1
    17de:	6732           	beq.s 1812 <memset+0xca>
    17e0:	1485           	move.b d5,(a2)
	while(len-- > 0)
    17e2:	4a84           	tst.l d4
    17e4:	6f2c           	ble.s 1812 <memset+0xca>
		*ptr++ = val;
    17e6:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    17ea:	7201           	moveq #1,d1
    17ec:	b284           	cmp.l d4,d1
    17ee:	6c22           	bge.s 1812 <memset+0xca>
		*ptr++ = val;
    17f0:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    17f4:	7402           	moveq #2,d2
    17f6:	b484           	cmp.l d4,d2
    17f8:	6c18           	bge.s 1812 <memset+0xca>
		*ptr++ = val;
    17fa:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    17fe:	7c03           	moveq #3,d6
    1800:	bc84           	cmp.l d4,d6
    1802:	6c0e           	bge.s 1812 <memset+0xca>
		*ptr++ = val;
    1804:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1808:	7204           	moveq #4,d1
    180a:	b284           	cmp.l d4,d1
    180c:	6c04           	bge.s 1812 <memset+0xca>
		*ptr++ = val;
    180e:	1545 0005      	move.b d5,5(a2)
}
    1812:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1816:	4e75           	rts

00001818 <strlen>:
{
    1818:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    181c:	7000           	moveq #0,d0
	while(*s++)
    181e:	4a10           	tst.b (a0)
    1820:	6708           	beq.s 182a <strlen+0x12>
		t++;
    1822:	5280           	addq.l #1,d0
	while(*s++)
    1824:	4a30 0800      	tst.b (0,a0,d0.l)
    1828:	66f8           	bne.s 1822 <strlen+0xa>
}
    182a:	4e75           	rts

0000182c <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    182c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1830:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1834:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1838:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    183c:	d041           	add.w d1,d0
	swap	d0
    183e:	4840           	swap d0
	clrw	d0
    1840:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    1842:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    1846:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    184a:	d081           	add.l d1,d0

	rts
    184c:	4e75           	rts

0000184e <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    184e:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    1850:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    1854:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1858:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    185e:	6416           	bcc.s 1876 <__udivsi3+0x28>
	movel	d0, d2
    1860:	2400           	move.l d0,d2
	clrw	d2
    1862:	4242           	clr.w d2
	swap	d2
    1864:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    1866:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1868:	3002           	move.w d2,d0
	swap	d0
    186a:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    186c:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1870:	84c1           	divu.w d1,d2
	movew	d2, d0
    1872:	3002           	move.w d2,d0
	jra	6f
    1874:	6030           	bra.s 18a6 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    1876:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    1878:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    187a:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    187c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    1882:	64f4           	bcc.s 1878 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    1884:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    1886:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    188c:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    188e:	c2c0           	mulu.w d0,d1
	swap	d2
    1890:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1892:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1894:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1896:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1898:	660a           	bne.s 18a4 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    189a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    189c:	6506           	bcs.s 18a4 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    189e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    18a2:	6302           	bls.s 18a6 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    18a4:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    18a6:	241f           	move.l (sp)+,d2
	rts
    18a8:	4e75           	rts

000018aa <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    18aa:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    18ac:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    18ae:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    18b2:	6a04           	bpl.s 18b8 <__divsi3+0xe>
	negl	d1
    18b4:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    18b6:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    18b8:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    18bc:	6a04           	bpl.s 18c2 <__divsi3+0x18>
	negl	d0
    18be:	4480           	neg.l d0
	negb	d2
    18c0:	4402           	neg.b d2

2:	movel	d1, sp@-
    18c2:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    18c4:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    18c6:	6186           	bsr.s 184e <__udivsi3>
	addql	IMM (8), sp
    18c8:	508f           	addq.l #8,sp

	tstb	d2
    18ca:	4a02           	tst.b d2
	jpl	3f
    18cc:	6a02           	bpl.s 18d0 <__divsi3+0x26>
	negl	d0
    18ce:	4480           	neg.l d0

3:	movel	sp@+, d2
    18d0:	241f           	move.l (sp)+,d2
	rts
    18d2:	4e75           	rts

000018d4 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    18d4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    18d8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    18dc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    18de:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    18e0:	61c8           	bsr.s 18aa <__divsi3>
	addql	IMM (8), sp
    18e2:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    18e4:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    18e8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    18ea:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    18ec:	6100 ff3e      	bsr.w 182c <__mulsi3>
	addql	IMM (8), sp
    18f0:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    18f2:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    18f6:	9280           	sub.l d0,d1
	movel	d1, d0
    18f8:	2001           	move.l d1,d0
	rts
    18fa:	4e75           	rts

000018fc <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    18fc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1900:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1904:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1906:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1908:	6100 ff44      	bsr.w 184e <__udivsi3>
	addql	IMM (8), sp
    190c:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    190e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1912:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1914:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1916:	6100 ff14      	bsr.w 182c <__mulsi3>
	addql	IMM (8), sp
    191a:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    191c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1920:	9280           	sub.l d0,d1
	movel	d1, d0
    1922:	2001           	move.l d1,d0
	rts
    1924:	4e75           	rts

00001926 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1926:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1928:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    192c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1930:	2c5f           	movea.l (sp)+,a6
    rts
    1932:	4e75           	rts

00001934 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    1934:	16c0           	move.b d0,(a3)+
	rts
    1936:	4e75           	rts

00001938 <saveregs>:
	...

00001974 <font2distance>:
    1974:	0505           	btst d2,d5
    1976:	0505           	btst d2,d5
    1978:	0505           	btst d2,d5
    197a:	0505           	btst d2,d5
    197c:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    197e:	0505           	btst d2,d5
    1980:	0505           	btst d2,d5
    1982:	0005 0505      	ori.b #5,d5
    1986:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    1988:	0505           	btst d2,d5
    198a:	0505           	btst d2,d5
    198c:	0505           	btst d2,d5
    198e:	0505           	btst d2,d5
    1990:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    1992:	0505           	btst d2,d5
    1994:	0505           	btst d2,d5
    1996:	0505           	btst d2,d5
    1998:	0505           	btst d2,d5
    199a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    199c:	0500           	btst d2,d0
    199e:	0505           	btst d2,d5
    19a0:	0505           	btst d2,d5
    19a2:	0505           	btst d2,d5
    19a4:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    19a6:	0505           	btst d2,d5
    19a8:	0505           	btst d2,d5
    19aa:	0505           	btst d2,d5
    19ac:	0505           	btst d2,d5
    19ae:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    19b0:	0505           	btst d2,d5
    19b2:	0505           	btst d2,d5
    19b4:	0503           	btst d2,d3
    19b6:	0505           	btst d2,d5
    19b8:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    19ba:	0505           	btst d2,d5
    19bc:	0500           	btst d2,d0
    19be:	0505           	btst d2,d5
    19c0:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    19c4:	0505           	btst d2,d5
    19c6:	0503           	btst d2,d3
    19c8:	0205 0507      	andi.b #7,d5
    19cc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    19ce:	0505           	btst d2,d5
    19d0:	0505           	btst d2,d5
    19d2:	0505           	btst d2,d5
    19d4:	0505           	btst d2,d5
    19d6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    19d8:	0505           	btst d2,d5
    19da:	0505           	btst d2,d5
    19dc:	0505           	btst d2,d5
    19de:	0505           	btst d2,d5
    19e0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    19e2:	0505           	btst d2,d5
    19e4:	0505           	btst d2,d5
    19e6:	0505           	btst d2,d5
    19e8:	0505           	btst d2,d5
    19ea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    19ec:	0505           	btst d2,d5
    19ee:	0505           	btst d2,d5
    19f0:	0505           	btst d2,d5
    19f2:	0505           	btst d2,d5
    19f4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    19f6:	0505           	btst d2,d5
    19f8:	0505           	btst d2,d5
    19fa:	0505           	btst d2,d5
    19fc:	0505           	btst d2,d5
    19fe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a00:	0505           	btst d2,d5
    1a02:	0505           	btst d2,d5
    1a04:	0505           	btst d2,d5
    1a06:	0505           	btst d2,d5
    1a08:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a0a:	0505           	btst d2,d5
    1a0c:	0505           	btst d2,d5
    1a0e:	0505           	btst d2,d5
    1a10:	0505           	btst d2,d5
    1a12:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a14:	0505           	btst d2,d5
    1a16:	0505           	btst d2,d5
    1a18:	0505           	btst d2,d5
    1a1a:	0505           	btst d2,d5
    1a1c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a1e:	0505           	btst d2,d5
    1a20:	0505           	btst d2,d5
    1a22:	0505           	btst d2,d5
    1a24:	0505           	btst d2,d5
    1a26:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a28:	0505           	btst d2,d5
    1a2a:	0505           	btst d2,d5
    1a2c:	0505           	btst d2,d5
    1a2e:	0505           	btst d2,d5
    1a30:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a32:	0505           	btst d2,d5
    1a34:	0505           	btst d2,d5
    1a36:	0505           	btst d2,d5
    1a38:	0505           	btst d2,d5
    1a3a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a3c:	0505           	btst d2,d5
    1a3e:	0505           	btst d2,d5
    1a40:	0505           	btst d2,d5
    1a42:	0505           	btst d2,d5
    1a44:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a46:	0505           	btst d2,d5
    1a48:	0505           	btst d2,d5
    1a4a:	0505           	btst d2,d5
    1a4c:	0505           	btst d2,d5
    1a4e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a50:	0505           	btst d2,d5
    1a52:	0505           	btst d2,d5
    1a54:	0505           	btst d2,d5
    1a56:	0505           	btst d2,d5
    1a58:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a5a:	0505           	btst d2,d5
    1a5c:	0505           	btst d2,d5
    1a5e:	0505           	btst d2,d5
    1a60:	0505           	btst d2,d5
    1a62:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    1a64:	0505           	btst d2,d5
    1a66:	0505           	btst d2,d5
    1a68:	0505           	btst d2,d5
    1a6a:	0505           	btst d2,d5
    1a6c:	0505           	btst d2,d5

00001a6e <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    1a6e:	48f9 7fff 0000 	movem.l d0-a6,1938 <saveregs>
    1a74:	1938 
  lea 0xdff000,a5
    1a76:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdde4c4>,a5
  move.l sp@(4),a0  //Fontlocation
    1a7c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    1a80:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    1a84:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    1a88:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    1a8a:	082d 0006 0002 	btst #6,2(a5)

00001a90 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    1a90:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    1a96:	66f8           	bne.s 1a90 <st2wblit>

00001a98 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    1a98:	7019           	moveq #25,d0
	sub.l d5,d5      
    1a9a:	9a85           	sub.l d5,d5

00001a9c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    1a9c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    1a9e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    1aa0:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    1aa4:	9dce           	suba.l a6,a6
	move.l d2, a6
    1aa6:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    1aa8:	ddfc 0000 1974 	adda.l #6516,a6

	LSL  	#4,d2 	    //Fetch next char
    1aae:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    1ab0:	2842           	movea.l d2,a4


	move.l  #0,d4
    1ab2:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    1ab4:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    1ab6:	3814           	move.w (a4),d4
	swap	d4
    1ab8:	4844           	swap d4
	lsr.l	d5, d4
    1aba:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    1abc:	8993           	or.l d4,(a3)
	clr.l	d4
    1abe:	4284           	clr.l d4
	move.w  2(a4), d4
    1ac0:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    1ac4:	4844           	swap d4
	lsr.l	d5, d4
    1ac6:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    1ac8:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    1acc:	4284           	clr.l d4
	move.w  4(a4), d4
    1ace:	382c 0004      	move.w 4(a4),d4
	swap	d4
    1ad2:	4844           	swap d4
	lsr.l	d5, d4
    1ad4:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    1ad6:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    1ada:	4284           	clr.l d4
	move.w  6(a4), d4
    1adc:	382c 0006      	move.w 6(a4),d4
	swap	d4
    1ae0:	4844           	swap d4
	lsr.l	d5, d4
    1ae2:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    1ae4:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    1ae8:	4284           	clr.l d4
	move.w  8(a4), d4
    1aea:	382c 0008      	move.w 8(a4),d4
	swap	d4
    1aee:	4844           	swap d4
	lsr.l	d5, d4
    1af0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    1af2:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    1af6:	4284           	clr.l d4
	move.w  10(a4), d4
    1af8:	382c 000a      	move.w 10(a4),d4
	swap	d4
    1afc:	4844           	swap d4
	lsr.l	d5, d4
    1afe:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    1b00:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    1b04:	4284           	clr.l d4
	move.w  12(a4), d4
    1b06:	382c 000c      	move.w 12(a4),d4
	swap	d4
    1b0a:	4844           	swap d4
	lsr.l	d5, d4
    1b0c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    1b0e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    1b12:	4284           	clr.l d4
	move.w  14(a4), d4
    1b14:	382c 000e      	move.w 14(a4),d4
	swap	d4
    1b18:	4844           	swap d4
	lsr.l	d5, d4
    1b1a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    1b1c:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    1b20:	4284           	clr.l d4

	add.b   (a6), d5
    1b22:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    1b24:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    1b28:	6500 0006      	bcs.w 1b30 <noadditionalchar>
	addq.w  #1, a3
    1b2c:	524b           	addq.w #1,a3
	sub.w   #8,d5
    1b2e:	5145           	subq.w #8,d5

00001b30 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    1b30:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    1b32:	51c8 ff68      	dbf d0,1a9c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    1b36:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    1b3a:	51cb ff5c      	dbf d3,1a98 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    1b3e:	4cfa 7fff fdf6 	movem.l 1938 <saveregs>(pc),d0-a6

	RTS
    1b44:	4e75           	rts
