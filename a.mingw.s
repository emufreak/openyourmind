
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
      12:	23ce 0000 3cce 	move.l a6,3cce <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,3cc6 <hw>
      1e:	0000 3cc6 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 17e1 	lea 17e1 <incbin_colors_end+0xbd>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 3cc2 	move.l d0,3cc2 <GfxBase>
	if (!GfxBase)
      34:	6700 0938      	beq.w 96e <main+0x968>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
      3e:	43f9 0000 17f2 	lea 17f2 <incbin_colors_end+0xce>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 3cca 	move.l d0,3cca <DOSBase>
	if (!DOSBase)
      50:	6700 08e0      	beq.w 932 <main+0x92c>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 17fe 	pea 17fe <incbin_colors_end+0xda>
      5a:	4eb9 0000 0aa8 	jsr aa8 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 181a 	move.l #6170,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      7e:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
      84:	4eae ffc4      	jsr -60(a6)
      88:	2079 0000 3cc6 	movea.l 3cc6 <hw>,a0
      8e:	2628 0080      	move.l 128(a0),d3
      92:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
      98:	2200           	move.l d0,d1
      9a:	243c 0000 182a 	move.l #6186,d2
      a0:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      a4:	47f9 0000 0fe2 	lea fe2 <ClBuild>,a3
      aa:	4e93           	jsr (a3)
      ac:	2440           	movea.l d0,a2
      ae:	23c0 0000 3cac 	move.l d0,3cac <Copperlist1>
  DrawCopper = Copperlist1;
      b4:	23c0 0000 3ca8 	move.l d0,3ca8 <DrawCopper>
  Copperlist2 = ClBuild();
      ba:	4e93           	jsr (a3)
      bc:	23c0 0000 3ca4 	move.l d0,3ca4 <Copperlist2>
  ViewCopper = Copperlist2;
      c2:	23c0 0000 3ca0 	move.l d0,3ca0 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c8:	588f           	addq.l #4,sp
      ca:	2012           	move.l (a2),d0
      cc:	b0b9 0000 3c38 	cmp.l 3c38 <ClsSprites>,d0
      d2:	6600 07f2      	bne.w 8c6 <main+0x8c0>
      d6:	202a 0004      	move.l 4(a2),d0
      da:	b0b9 0000 3c3c 	cmp.l 3c3c <ClsSprites+0x4>,d0
      e0:	6600 07e4      	bne.w 8c6 <main+0x8c0>
      e4:	202a 0008      	move.l 8(a2),d0
      e8:	b0b9 0000 3c40 	cmp.l 3c40 <ClsSprites+0x8>,d0
      ee:	6600 07d6      	bne.w 8c6 <main+0x8c0>
      f2:	202a 000c      	move.l 12(a2),d0
      f6:	b0b9 0000 3c44 	cmp.l 3c44 <ClsSprites+0xc>,d0
      fc:	6600 07c8      	bne.w 8c6 <main+0x8c0>
     100:	202a 0010      	move.l 16(a2),d0
     104:	b0b9 0000 3c48 	cmp.l 3c48 <ClsSprites+0x10>,d0
     10a:	6600 07ba      	bne.w 8c6 <main+0x8c0>
     10e:	202a 0014      	move.l 20(a2),d0
     112:	b0b9 0000 3c4c 	cmp.l 3c4c <ClsSprites+0x14>,d0
     118:	6600 07ac      	bne.w 8c6 <main+0x8c0>
     11c:	202a 0018      	move.l 24(a2),d0
     120:	b0b9 0000 3c50 	cmp.l 3c50 <ClsSprites+0x18>,d0
     126:	6600 079e      	bne.w 8c6 <main+0x8c0>
     12a:	202a 001c      	move.l 28(a2),d0
     12e:	b0b9 0000 3c54 	cmp.l 3c54 <ClsSprites+0x1c>,d0
     134:	6600 0790      	bne.w 8c6 <main+0x8c0>
     138:	202a 0020      	move.l 32(a2),d0
     13c:	b0b9 0000 3c58 	cmp.l 3c58 <ClsSprites+0x20>,d0
     142:	6600 0782      	bne.w 8c6 <main+0x8c0>
     146:	202a 0024      	move.l 36(a2),d0
     14a:	b0b9 0000 3c5c 	cmp.l 3c5c <ClsSprites+0x24>,d0
     150:	6600 0774      	bne.w 8c6 <main+0x8c0>
     154:	202a 0028      	move.l 40(a2),d0
     158:	b0b9 0000 3c60 	cmp.l 3c60 <ClsSprites+0x28>,d0
     15e:	6600 0766      	bne.w 8c6 <main+0x8c0>
     162:	202a 002c      	move.l 44(a2),d0
     166:	b0b9 0000 3c64 	cmp.l 3c64 <ClsSprites+0x2c>,d0
     16c:	6600 0758      	bne.w 8c6 <main+0x8c0>
     170:	202a 0030      	move.l 48(a2),d0
     174:	b0b9 0000 3c68 	cmp.l 3c68 <ClsSprites+0x30>,d0
     17a:	6600 074a      	bne.w 8c6 <main+0x8c0>
     17e:	202a 0034      	move.l 52(a2),d0
     182:	b0b9 0000 3c6c 	cmp.l 3c6c <ClsSprites+0x34>,d0
     188:	6600 073c      	bne.w 8c6 <main+0x8c0>
     18c:	202a 0038      	move.l 56(a2),d0
     190:	b0b9 0000 3c70 	cmp.l 3c70 <ClsSprites+0x38>,d0
     196:	6600 072e      	bne.w 8c6 <main+0x8c0>
     19a:	246a 003c      	movea.l 60(a2),a2
     19e:	b5f9 0000 3c74 	cmpa.l 3c74 <ClsSprites+0x3c>,a2
     1a4:	6600 0720      	bne.w 8c6 <main+0x8c0>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a8:	2079 0000 3cac 	movea.l 3cac <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ae:	2039 0000 3c08 	move.l 3c08 <ClScreen>,d0
     1b4:	b0a8 0040      	cmp.l 64(a0),d0
     1b8:	6600 072e      	bne.w 8e8 <main+0x8e2>
     1bc:	2039 0000 3c0c 	move.l 3c0c <ClScreen+0x4>,d0
     1c2:	b0a8 0044      	cmp.l 68(a0),d0
     1c6:	6600 0720      	bne.w 8e8 <main+0x8e2>
     1ca:	2039 0000 3c10 	move.l 3c10 <ClScreen+0x8>,d0
     1d0:	b0a8 0048      	cmp.l 72(a0),d0
     1d4:	6600 0712      	bne.w 8e8 <main+0x8e2>
     1d8:	2039 0000 3c14 	move.l 3c14 <ClScreen+0xc>,d0
     1de:	b0a8 004c      	cmp.l 76(a0),d0
     1e2:	6600 0704      	bne.w 8e8 <main+0x8e2>
     1e6:	2028 0050      	move.l 80(a0),d0
     1ea:	b0b9 0000 3c18 	cmp.l 3c18 <ClScreen+0x10>,d0
     1f0:	6600 06f6      	bne.w 8e8 <main+0x8e2>
     1f4:	2028 0054      	move.l 84(a0),d0
     1f8:	b0b9 0000 3c1c 	cmp.l 3c1c <ClScreen+0x14>,d0
     1fe:	6600 06e8      	bne.w 8e8 <main+0x8e2>
     202:	2028 0058      	move.l 88(a0),d0
     206:	b0b9 0000 3c20 	cmp.l 3c20 <ClScreen+0x18>,d0
     20c:	6600 06da      	bne.w 8e8 <main+0x8e2>
     210:	2028 005c      	move.l 92(a0),d0
     214:	b0b9 0000 3c24 	cmp.l 3c24 <ClScreen+0x1c>,d0
     21a:	6600 06cc      	bne.w 8e8 <main+0x8e2>
     21e:	2028 0060      	move.l 96(a0),d0
     222:	b0b9 0000 3c28 	cmp.l 3c28 <ClScreen+0x20>,d0
     228:	6600 06be      	bne.w 8e8 <main+0x8e2>
     22c:	2028 0064      	move.l 100(a0),d0
     230:	b0b9 0000 3c2c 	cmp.l 3c2c <ClScreen+0x24>,d0
     236:	6600 06b0      	bne.w 8e8 <main+0x8e2>
     23a:	2028 0068      	move.l 104(a0),d0
     23e:	b0b9 0000 3c30 	cmp.l 3c30 <ClScreen+0x28>,d0
     244:	6600 06a2      	bne.w 8e8 <main+0x8e2>
     248:	2068 006c      	movea.l 108(a0),a0
     24c:	b1f9 0000 3c34 	cmpa.l 3c34 <ClScreen+0x2c>,a0
     252:	6600 0694      	bne.w 8e8 <main+0x8e2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
     256:	23fc 0004 0000 	move.l #262144,3c9c <DrawBuffer>
     25c:	0000 3c9c 
  ViewBuffer = 0x50000;
     260:	23fc 0005 0000 	move.l #327680,3c98 <ViewBuffer>
     266:	0000 3c98 
  SetBplPointers();
     26a:	45f9 0000 0fb6 	lea fb6 <SetBplPointers>,a2
     270:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     272:	0cb9 0005 0000 	cmpi.l #327680,3c9c <DrawBuffer>
     278:	0000 3c9c 
     27c:	6700 06c0      	beq.w 93e <main+0x938>
    Write( Output(), 
     280:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     286:	4eae ffc4      	jsr -60(a6)
     28a:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     290:	2200           	move.l d0,d1
     292:	243c 0000 182d 	move.l #6189,d2
     298:	763b           	moveq #59,d3
     29a:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     29e:	2079 0000 3cac 	movea.l 3cac <Copperlist1>,a0
     2a4:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2aa:	0070 
     2ac:	6724           	beq.s 2d2 <main+0x2cc>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ae:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     2b4:	4eae ffc4      	jsr -60(a6)
     2b8:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     2be:	2200           	move.l d0,d1
     2c0:	243c 0000 1869 	move.l #6249,d2
     2c6:	763c           	moveq #60,d3
     2c8:	4eae ffd0      	jsr -48(a6)
     2cc:	2079 0000 3cac 	movea.l 3cac <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2d2:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d8:	0074 
     2da:	6724           	beq.s 300 <main+0x2fa>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2dc:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     2e2:	4eae ffc4      	jsr -60(a6)
     2e6:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     2ec:	2200           	move.l d0,d1
     2ee:	243c 0000 18a6 	move.l #6310,d2
     2f4:	763c           	moveq #60,d3
     2f6:	4eae ffd0      	jsr -48(a6)
     2fa:	2079 0000 3cac 	movea.l 3cac <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     300:	2028 0078      	move.l 120(a0),d0
     304:	b0b9 0000 3c00 	cmp.l 3c00 <ClColor>,d0
     30a:	6600 068c      	bne.w 998 <main+0x992>
     30e:	2039 0000 3c04 	move.l 3c04 <ClColor+0x4>,d0
     314:	b0a8 007c      	cmp.l 124(a0),d0
     318:	6600 067e      	bne.w 998 <main+0x992>
  if( instructions[pos] == value ) 
     31c:	70fe           	moveq #-2,d0
     31e:	b0a8 0080      	cmp.l 128(a0),d0
     322:	671e           	beq.s 342 <main+0x33c>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     324:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     32a:	4eae ffc4      	jsr -60(a6)
     32e:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     334:	2200           	move.l d0,d1
     336:	243c 0000 1905 	move.l #6405,d2
     33c:	7622           	moveq #34,d3
     33e:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     342:	47f9 0000 0f90 	lea f90 <SwapCl>,a3
     348:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     34a:	2039 0000 3ca8 	move.l 3ca8 <DrawCopper>,d0
     350:	b0b9 0000 3ca4 	cmp.l 3ca4 <Copperlist2>,d0
     356:	671e           	beq.s 376 <main+0x370>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     358:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     35e:	4eae ffc4      	jsr -60(a6)
     362:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     368:	2200           	move.l d0,d1
     36a:	243c 0000 1928 	move.l #6440,d2
     370:	7615           	moveq #21,d3
     372:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     376:	49f9 0000 1240 	lea 1240 <PrepareDisplay>,a4
     37c:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     37e:	2039 0000 3c9c 	move.l 3c9c <DrawBuffer>,d0
     384:	b0b9 0000 3c94 	cmp.l 3c94 <Bitplane1>,d0
     38a:	671e           	beq.s 3aa <main+0x3a4>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     38c:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     392:	4eae ffc4      	jsr -60(a6)
     396:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     39c:	2200           	move.l d0,d1
     39e:	243c 0000 193e 	move.l #6462,d2
     3a4:	7637           	moveq #55,d3
     3a6:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3aa:	2039 0000 3ca8 	move.l 3ca8 <DrawCopper>,d0
     3b0:	b0b9 0000 3cac 	cmp.l 3cac <Copperlist1>,d0
     3b6:	671e           	beq.s 3d6 <main+0x3d0>
    Write( Output(), 
     3b8:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     3be:	4eae ffc4      	jsr -60(a6)
     3c2:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     3c8:	2200           	move.l d0,d1
     3ca:	243c 0000 1976 	move.l #6518,d2
     3d0:	7639           	moveq #57,d3
     3d2:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3d6:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3d8:	2039 0000 3c98 	move.l 3c98 <ViewBuffer>,d0
     3de:	b0b9 0000 3c90 	cmp.l 3c90 <Bitplane2>,d0
     3e4:	671e           	beq.s 404 <main+0x3fe>
    Write( Output(), 
     3e6:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     3ec:	4eae ffc4      	jsr -60(a6)
     3f0:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     3f6:	2200           	move.l d0,d1
     3f8:	243c 0000 19b0 	move.l #6576,d2
     3fe:	7638           	moveq #56,d3
     400:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     404:	2039 0000 3ca0 	move.l 3ca0 <ViewCopper>,d0
     40a:	b0b9 0000 3ca4 	cmp.l 3ca4 <Copperlist2>,d0
     410:	671e           	beq.s 430 <main+0x42a>
    Write( Output(), 
     412:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     418:	4eae ffc4      	jsr -60(a6)
     41c:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     422:	2200           	move.l d0,d1
     424:	243c 0000 19e9 	move.l #6633,d2
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
     434:	2079 0000 3ca0 	movea.l 3ca0 <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     43a:	7000           	moveq #0,d0
     43c:	3028 0072      	move.w 114(a0),d0
     440:	4840           	swap d0
     442:	4240           	clr.w d0
     444:	7200           	moveq #0,d1
     446:	3228 0076      	move.w 118(a0),d1
     44a:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     44c:	b0b9 0000 3c90 	cmp.l 3c90 <Bitplane2>,d0
     452:	671e           	beq.s 472 <main+0x46c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     454:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     45a:	4eae ffc4      	jsr -60(a6)
     45e:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     464:	2200           	move.l d0,d1
     466:	243c 0000 1a24 	move.l #6692,d2
     46c:	7648           	moveq #72,d3
     46e:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     472:	4e93           	jsr (a3)
  SetBplPointers();
     474:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
     476:	2079 0000 3ca0 	movea.l 3ca0 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     47c:	7000           	moveq #0,d0
     47e:	3028 0072      	move.w 114(a0),d0
     482:	4840           	swap d0
     484:	4240           	clr.w d0
     486:	7200           	moveq #0,d1
     488:	3228 0076      	move.w 118(a0),d1
     48c:	d081           	add.l d1,d0
  if( pointer != Bitplane1) 
     48e:	b0b9 0000 3c94 	cmp.l 3c94 <Bitplane1>,d0
     494:	671e           	beq.s 4b4 <main+0x4ae>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     496:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     49c:	4eae ffc4      	jsr -60(a6)
     4a0:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     4a6:	2200           	move.l d0,d1
     4a8:	243c 0000 1a6d 	move.l #6765,d2
     4ae:	7649           	moveq #73,d3
     4b0:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4b4:	4e93           	jsr (a3)
  SetBplPointers();
     4b6:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
     4b8:	2079 0000 3ca0 	movea.l 3ca0 <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4be:	7000           	moveq #0,d0
     4c0:	3028 0072      	move.w 114(a0),d0
     4c4:	4840           	swap d0
     4c6:	4240           	clr.w d0
     4c8:	7200           	moveq #0,d1
     4ca:	3228 0076      	move.w 118(a0),d1
     4ce:	d081           	add.l d1,d0
  if( pointer != Bitplane2) 
     4d0:	b0b9 0000 3c90 	cmp.l 3c90 <Bitplane2>,d0
     4d6:	671e           	beq.s 4f6 <main+0x4f0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d8:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     4de:	4eae ffc4      	jsr -60(a6)
     4e2:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     4e8:	2200           	move.l d0,d1
     4ea:	243c 0000 1ab7 	move.l #6839,d2
     4f0:	7648           	moveq #72,d3
     4f2:	4eae ffd0      	jsr -48(a6)
  SetBplPointers();
  return 0;
}

void FreeDisplay() {
  if( Copperlist1 != 0) FreeMem( Copperlist1, 33*4);
     4f6:	2279 0000 3cac 	movea.l 3cac <Copperlist1>,a1
     4fc:	b2fc 0000      	cmpa.w #0,a1
     500:	670e           	beq.s 510 <main+0x50a>
     502:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     508:	707b           	moveq #123,d0
     50a:	4600           	not.b d0
     50c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, 33*4);
     510:	2279 0000 3ca4 	movea.l 3ca4 <Copperlist2>,a1
     516:	b2fc 0000      	cmpa.w #0,a1
     51a:	670e           	beq.s 52a <main+0x524>
     51c:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     522:	707b           	moveq #123,d0
     524:	4600           	not.b d0
     526:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, 80*640);
     52a:	2279 0000 3c94 	movea.l 3c94 <Bitplane1>,a1
     530:	b2fc 0000      	cmpa.w #0,a1
     534:	6710           	beq.s 546 <main+0x540>
     536:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     53c:	203c 0000 c800 	move.l #51200,d0
     542:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, 80*640);
     546:	2279 0000 3c90 	movea.l 3c90 <Bitplane2>,a1
     54c:	b2fc 0000      	cmpa.w #0,a1
     550:	6710           	beq.s 562 <main+0x55c>
     552:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     558:	203c 0000 c800 	move.l #51200,d0
     55e:	4eae ff2e      	jsr -210(a6)
#include "swscrollertest.h"
#include "utils.h"

void SwscrollerTest() {

  ClbuildSwscroller();
     562:	4eb9 0000 0ce6 	jsr ce6 <ClbuildSwscroller>

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     568:	4878 0010      	pea 10 <main+0xa>
     56c:	4879 0000 3c38 	pea 3c38 <ClsSprites>
     572:	42a7           	clr.l -(sp)
     574:	2f39 0000 3cac 	move.l 3cac <Copperlist1>,-(sp)
     57a:	45f9 0000 0b10 	lea b10 <TestCopperlistBatch>,a2
     580:	4e92           	jsr (a2)
     582:	4fef 0010      	lea 16(sp),sp
     586:	4a80           	tst.l d0
     588:	661e           	bne.s 5a8 <main+0x5a2>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     58a:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     590:	4eae ffc4      	jsr -60(a6)
     594:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     59a:	2200           	move.l d0,d1
     59c:	243c 0000 1b00 	move.l #6912,d2
     5a2:	762c           	moveq #44,d3
     5a4:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     5a8:	4878 000c      	pea c <main+0x6>
     5ac:	4879 0000 3c08 	pea 3c08 <ClScreen>
     5b2:	4878 0010      	pea 10 <main+0xa>
     5b6:	2f39 0000 3cac 	move.l 3cac <Copperlist1>,-(sp)
     5bc:	4e92           	jsr (a2)
     5be:	4fef 0010      	lea 16(sp),sp
     5c2:	4a80           	tst.l d0
     5c4:	661e           	bne.s 5e4 <main+0x5de>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     5c6:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     5cc:	4eae ffc4      	jsr -60(a6)
     5d0:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     5d6:	2200           	move.l d0,d1
     5d8:	243c 0000 1b36 	move.l #6966,d2
     5de:	7636           	moveq #54,d3
     5e0:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
     5e4:	4878 0002      	pea 2 <_start+0x2>
     5e8:	4879 0000 3c00 	pea 3c00 <ClColor>
     5ee:	4878 001e      	pea 1e <main+0x18>
     5f2:	2f39 0000 3cac 	move.l 3cac <Copperlist1>,-(sp)
     5f8:	4e92           	jsr (a2)
     5fa:	4fef 0010      	lea 16(sp),sp
     5fe:	4a80           	tst.l d0
     600:	661e           	bne.s 620 <main+0x61a>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     602:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     608:	4eae ffc4      	jsr -60(a6)
     60c:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     612:	2200           	move.l d0,d1
     614:	243c 0000 18e3 	move.l #6371,d2
     61a:	7621           	moveq #33,d3
     61c:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     620:	7ec0           	moveq #-64,d7
     622:	de8d           	add.l a5,d7
     624:	4878 0040      	pea 40 <main+0x3a>
     628:	4879 0000 1bc0 	pea 1bc0 <incbin_colors_end+0x49c>
     62e:	2f07           	move.l d7,-(sp)
     630:	4eb9 0000 1420 	jsr 1420 <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 32, clpart1, 16) == 0)
     636:	4878 0010      	pea 10 <main+0xa>
     63a:	2f07           	move.l d7,-(sp)
     63c:	4878 0020      	pea 20 <main+0x1a>
     640:	2f39 0000 3cac 	move.l 3cac <Copperlist1>,-(sp)
     646:	4e92           	jsr (a2)
     648:	4fef 001c      	lea 28(sp),sp
     64c:	4a80           	tst.l d0
     64e:	661e           	bne.s 66e <main+0x668>
    Write( Output(), "Copperlist: Starwars part messed up.\n", 37);
     650:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     656:	4eae ffc4      	jsr -60(a6)
     65a:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     660:	2200           	move.l d0,d1
     662:	243c 0000 1b6d 	move.l #7021,d2
     668:	7625           	moveq #37,d3
     66a:	4eae ffd0      	jsr -48(a6)

 ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     66e:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     674:	ffb4 
     676:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     67c:	ffb8 
     67e:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     684:	ffbc 

 if( TestCopperlistBatch( Copperlist1, 73, clpart2, 3) == 0)
     686:	4878 0003      	pea 3 <_start+0x3>
     68a:	486d ffb4      	pea -76(a5)
     68e:	4878 0049      	pea 49 <main+0x43>
     692:	2f39 0000 3cac 	move.l 3cac <Copperlist1>,-(sp)
     698:	4e92           	jsr (a2)
     69a:	4fef 0010      	lea 16(sp),sp
     69e:	4a80           	tst.l d0
     6a0:	661e           	bne.s 6c0 <main+0x6ba>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     6a2:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     6a8:	4eae ffc4      	jsr -60(a6)
     6ac:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     6b2:	2200           	move.l d0,d1
     6b4:	243c 0000 1b93 	move.l #7059,d2
     6ba:	762c           	moveq #44,d3
     6bc:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10528, 0xfffffffe) == 0)
     6c0:	2f39 0000 3cac 	move.l 3cac <Copperlist1>,-(sp)
     6c6:	4eb9 0000 09ec 	jsr 9ec <TestCopperlistPos.constprop.0>
     6cc:	588f           	addq.l #4,sp
     6ce:	4a80           	tst.l d0
     6d0:	661e           	bne.s 6f0 <main+0x6ea>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
     6d2:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     6d8:	4eae ffc4      	jsr -60(a6)
     6dc:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     6e2:	2200           	move.l d0,d1
     6e4:	243c 0000 1905 	move.l #6405,d2
     6ea:	7622           	moveq #34,d3
     6ec:	4eae ffd0      	jsr -48(a6)
  RunTests();
	Delay(50);
     6f0:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     6f6:	7232           	moveq #50,d1
     6f8:	4eae ff3a      	jsr -198(a6)

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     6fc:	247c 00f0 ff60 	movea.l #15794016,a2
     702:	4a92           	tst.l (a2)
     704:	6718           	beq.s 71e <main+0x718>
     706:	4878 0001      	pea 1 <_start+0x1>
     70a:	47f9 0000 0a06 	lea a06 <warpmode.part.0>,a3
     710:	4e93           	jsr (a3)
     712:	588f           	addq.l #4,sp
     714:	4a92           	tst.l (a2)
     716:	6706           	beq.s 71e <main+0x718>
     718:	42a7           	clr.l -(sp)
     71a:	4e93           	jsr (a3)
     71c:	588f           	addq.l #4,sp
  ViewCopper = tmp;
  hw->cop1lc = ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     71e:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     724:	23ee 0022 0000 	move.l 34(a6),3cb0 <ActiView>
     72a:	3cb0 
	OwnBlitter();
     72c:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     730:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     736:	4eae ff1c      	jsr -228(a6)
	Disable();
     73a:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     740:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     744:	2679 0000 3cc6 	movea.l 3cc6 <hw>,a3
     74a:	302b 0010      	move.w 16(a3),d0
     74e:	33c0 0000 3cb4 	move.w d0,3cb4 <SystemADKCON>
	SystemInts=hw->intenar;
     754:	302b 001c      	move.w 28(a3),d0
     758:	33c0 0000 3cb8 	move.w d0,3cb8 <SystemInts>
	SystemDMA=hw->dmaconr;
     75e:	302b 0002      	move.w 2(a3),d0
     762:	33c0 0000 3cb6 	move.w d0,3cb6 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     768:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     76e:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     774:	45f9 0000 13da 	lea 13da <WaitVbl>,a2
     77a:	4e92           	jsr (a2)
	WaitVbl();
     77c:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     77e:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     784:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     78a:	93c9           	suba.l a1,a1
     78c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     790:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     796:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     79a:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     7a0:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     7a4:	4e92           	jsr (a2)
	WaitVbl();
     7a6:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     7a8:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
     7ae:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
     7b4:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
     7ba:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     7c0:	082e 0000 0129 	btst #0,297(a6)
     7c6:	6700 01f8      	beq.w 9c0 <main+0x9ba>
		vbr = (APTR)Supervisor((void*)getvbr);
     7ca:	cf8d           	exg d7,a5
     7cc:	4eae ffe2      	jsr -30(a6)
     7d0:	cf8d           	exg d7,a5

	VBR=GetVBR();
     7d2:	23c0 0000 3cba 	move.l d0,3cba <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     7d8:	2079 0000 3cba 	movea.l 3cba <VBR.lto_priv.1>,a0
     7de:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     7e2:	23c7 0000 3cbe 	move.l d7,3cbe <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     7e8:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     7ea:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     7ec:	2079 0000 3cc6 	movea.l 3cc6 <hw>,a0
     7f2:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     7f6:	3028 0002      	move.w 2(a0),d0
     7fa:	0800 000e      	btst #14,d0
     7fe:	66f6           	bne.s 7f6 <main+0x7f0>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     800:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     806:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     80c:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     812:	2279 0000 3cba 	movea.l 3cba <VBR.lto_priv.1>,a1
     818:	2347 006c      	move.l d7,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     81c:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     822:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     828:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     82e:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     834:	3039 0000 3cb8 	move.w 3cb8 <SystemInts>,d0
     83a:	0040 8000      	ori.w #-32768,d0
     83e:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     842:	3039 0000 3cb6 	move.w 3cb6 <SystemDMA>,d0
     848:	0040 8000      	ori.w #-32768,d0
     84c:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     850:	3039 0000 3cb4 	move.w 3cb4 <SystemADKCON>,d0
     856:	0040 8000      	ori.w #-32768,d0
     85a:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     85e:	2279 0000 3cb0 	movea.l 3cb0 <ActiView>,a1
     864:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     868:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     86e:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     872:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     878:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     87c:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     882:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     886:	2c79 0000 3cc2 	movea.l 3cc2 <GfxBase>,a6
     88c:	4eae fe32      	jsr -462(a6)
	Enable();
     890:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     896:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     89a:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     8a0:	2279 0000 3cca 	movea.l 3cca <DOSBase>,a1
     8a6:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     8aa:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     8b0:	2279 0000 3cc2 	movea.l 3cc2 <GfxBase>,a1
     8b6:	4eae fe62      	jsr -414(a6)
}
     8ba:	7000           	moveq #0,d0
     8bc:	4ced 5c8c ff98 	movem.l -104(a5),d2-d3/d7/a2-a4/a6
     8c2:	4e5d           	unlk a5
     8c4:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     8c6:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     8cc:	4eae ffc4      	jsr -60(a6)
     8d0:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     8d6:	2200           	move.l d0,d1
     8d8:	243c 0000 1b00 	move.l #6912,d2
     8de:	762c           	moveq #44,d3
     8e0:	4eae ffd0      	jsr -48(a6)
     8e4:	6000 f8c2      	bra.w 1a8 <main+0x1a2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     8e8:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     8ee:	4eae ffc4      	jsr -60(a6)
     8f2:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     8f8:	2200           	move.l d0,d1
     8fa:	243c 0000 1b36 	move.l #6966,d2
     900:	7636           	moveq #54,d3
     902:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = 0x40000;
     906:	23fc 0004 0000 	move.l #262144,3c9c <DrawBuffer>
     90c:	0000 3c9c 
  ViewBuffer = 0x50000;
     910:	23fc 0005 0000 	move.l #327680,3c98 <ViewBuffer>
     916:	0000 3c98 
  SetBplPointers();
     91a:	45f9 0000 0fb6 	lea fb6 <SetBplPointers>,a2
     920:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     922:	0cb9 0005 0000 	cmpi.l #327680,3c9c <DrawBuffer>
     928:	0000 3c9c 
     92c:	6600 f952      	bne.w 280 <main+0x27a>
     930:	600c           	bra.s 93e <main+0x938>
		Exit(0);
     932:	9dce           	suba.l a6,a6
     934:	7200           	moveq #0,d1
     936:	4eae ff70      	jsr -144(a6)
     93a:	6000 f718      	bra.w 54 <main+0x4e>
     93e:	0cb9 0004 0000 	cmpi.l #262144,3c98 <ViewBuffer>
     944:	0000 3c98 
     948:	6700 f954      	beq.w 29e <main+0x298>
    Write( Output(), 
     94c:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     952:	4eae ffc4      	jsr -60(a6)
     956:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     95c:	2200           	move.l d0,d1
     95e:	243c 0000 182d 	move.l #6189,d2
     964:	763b           	moveq #59,d3
     966:	4eae ffd0      	jsr -48(a6)
     96a:	6000 f932      	bra.w 29e <main+0x298>
		Exit(0);
     96e:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     974:	7200           	moveq #0,d1
     976:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     97a:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     980:	43f9 0000 17f2 	lea 17f2 <incbin_colors_end+0xce>,a1
     986:	7000           	moveq #0,d0
     988:	4eae fdd8      	jsr -552(a6)
     98c:	23c0 0000 3cca 	move.l d0,3cca <DOSBase>
	if (!DOSBase)
     992:	6600 f6c0      	bne.w 54 <main+0x4e>
     996:	609a           	bra.s 932 <main+0x92c>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     998:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     99e:	4eae ffc4      	jsr -60(a6)
     9a2:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     9a8:	2200           	move.l d0,d1
     9aa:	243c 0000 18e3 	move.l #6371,d2
     9b0:	7621           	moveq #33,d3
     9b2:	4eae ffd0      	jsr -48(a6)
     9b6:	2079 0000 3cac 	movea.l 3cac <Copperlist1>,a0
     9bc:	6000 f95e      	bra.w 31c <main+0x316>
	APTR vbr = 0;
     9c0:	7000           	moveq #0,d0
	VBR=GetVBR();
     9c2:	23c0 0000 3cba 	move.l d0,3cba <VBR.lto_priv.1>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     9c8:	2079 0000 3cba 	movea.l 3cba <VBR.lto_priv.1>,a0
     9ce:	2e28 006c      	move.l 108(a0),d7
	SystemIrq=GetInterruptHandler(); //store interrupt register
     9d2:	23c7 0000 3cbe 	move.l d7,3cbe <SystemIrq>
	WaitVbl();
     9d8:	4e92           	jsr (a2)
	WaitVbl();
     9da:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     9dc:	2079 0000 3cc6 	movea.l 3cc6 <hw>,a0
     9e2:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     9e6:	6000 fe0e      	bra.w 7f6 <main+0x7f0>
     9ea:	4e71           	nop

000009ec <TestCopperlistPos.constprop.0>:
  if( instructions[pos] == value ) 
     9ec:	206f 0004      	movea.l 4(sp),a0
     9f0:	203c 0000 a480 	move.l #42112,d0
     9f6:	72fe           	moveq #-2,d1
     9f8:	b2b0 0800      	cmp.l (0,a0,d0.l),d1
     9fc:	57c0           	seq d0
     9fe:	4880           	ext.w d0
     a00:	48c0           	ext.l d0
}
     a02:	4480           	neg.l d0
     a04:	4e75           	rts

00000a06 <warpmode.part.0>:
void warpmode(int on) 
     a06:	598f           	subq.l #4,sp
     a08:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     a0a:	4aaf 000c      	tst.l 12(sp)
     a0e:	674c           	beq.s a5c <warpmode.part.0+0x56>
     a10:	4878 0001      	pea 1 <_start+0x1>
     a14:	740b           	moveq #11,d2
     a16:	d48f           	add.l sp,d2
     a18:	2f02           	move.l d2,-(sp)
     a1a:	42a7           	clr.l -(sp)
     a1c:	4879 0000 1758 	pea 1758 <incbin_colors_end+0x34>
     a22:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe9659>
     a26:	4878 0052      	pea 52 <main+0x4c>
     a2a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef95ba>
     a30:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     a34:	203c 0000 173e 	move.l #5950,d0
     a3a:	4878 0001      	pea 1 <_start+0x1>
     a3e:	2f02           	move.l d2,-(sp)
     a40:	42a7           	clr.l -(sp)
     a42:	2f00           	move.l d0,-(sp)
     a44:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe9659>
     a48:	4878 0052      	pea 52 <main+0x4c>
     a4c:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef95ba>
	}
}
     a52:	4fef 0018      	lea 24(sp),sp
     a56:	241f           	move.l (sp)+,d2
     a58:	588f           	addq.l #4,sp
     a5a:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     a5c:	4878 0001      	pea 1 <_start+0x1>
     a60:	740b           	moveq #11,d2
     a62:	d48f           	add.l sp,d2
     a64:	2f02           	move.l d2,-(sp)
     a66:	42a7           	clr.l -(sp)
     a68:	4879 0000 1762 	pea 1762 <incbin_colors_end+0x3e>
     a6e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe9659>
     a72:	4878 0052      	pea 52 <main+0x4c>
     a76:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef95ba>
     a7c:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     a80:	203c 0000 1725 	move.l #5925,d0
     a86:	4878 0001      	pea 1 <_start+0x1>
     a8a:	2f02           	move.l d2,-(sp)
     a8c:	42a7           	clr.l -(sp)
     a8e:	2f00           	move.l d0,-(sp)
     a90:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffe9659>
     a94:	4878 0052      	pea 52 <main+0x4c>
     a98:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef95ba>
}
     a9e:	4fef 0018      	lea 24(sp),sp
     aa2:	241f           	move.l (sp)+,d2
     aa4:	588f           	addq.l #4,sp
     aa6:	4e75           	rts

00000aa8 <KPrintF>:
{
     aa8:	4fef ff80      	lea -128(sp),sp
     aac:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     ab0:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xef95ba>
     ab6:	6734           	beq.s aec <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     ab8:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     abe:	206f 0090      	movea.l 144(sp),a0
     ac2:	43ef 0094      	lea 148(sp),a1
     ac6:	45f9 0000 16a0 	lea 16a0 <PutChar>,a2
     acc:	47ef 000c      	lea 12(sp),a3
     ad0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     ad4:	2f0b           	move.l a3,-(sp)
     ad6:	4878 0056      	pea 56 <main+0x50>
     ada:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xef95ba>
     ae0:	508f           	addq.l #8,sp
}
     ae2:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     ae6:	4fef 0080      	lea 128(sp),sp
     aea:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     aec:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     af2:	206f 0090      	movea.l 144(sp),a0
     af6:	43ef 0094      	lea 148(sp),a1
     afa:	45f9 0000 1692 	lea 1692 <KPutCharX>,a2
     b00:	97cb           	suba.l a3,a3
     b02:	4eae fdf6      	jsr -522(a6)
}
     b06:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     b0a:	4fef 0080      	lea 128(sp),sp
     b0e:	4e75           	rts

00000b10 <TestCopperlistBatch>:
                                                                  long length) {
     b10:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     b14:	246f 0010      	movea.l 16(sp),a2
     b18:	206f 0014      	movea.l 20(sp),a0
     b1c:	226f 0018      	movea.l 24(sp),a1
     b20:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
     b24:	2008           	move.l a0,d0
     b26:	d088           	add.l a0,d0
     b28:	d080           	add.l d0,d0
     b2a:	2411           	move.l (a1),d2
     b2c:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
     b30:	6600 01ac      	bne.w cde <TestCopperlistBatch+0x1ce>
     b34:	2008           	move.l a0,d0
     b36:	5280           	addq.l #1,d0
     b38:	d080           	add.l d0,d0
     b3a:	d080           	add.l d0,d0
     b3c:	2032 0800      	move.l (0,a2,d0.l),d0
     b40:	b0a9 0004      	cmp.l 4(a1),d0
     b44:	6600 0198      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b48:	7002           	moveq #2,d0
     b4a:	b081           	cmp.l d1,d0
     b4c:	6700 0188      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b50:	2008           	move.l a0,d0
     b52:	5480           	addq.l #2,d0
     b54:	d080           	add.l d0,d0
     b56:	d080           	add.l d0,d0
     b58:	2032 0800      	move.l (0,a2,d0.l),d0
     b5c:	b0a9 0008      	cmp.l 8(a1),d0
     b60:	6600 017c      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b64:	7403           	moveq #3,d2
     b66:	b481           	cmp.l d1,d2
     b68:	6700 016c      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b6c:	2008           	move.l a0,d0
     b6e:	5680           	addq.l #3,d0
     b70:	d080           	add.l d0,d0
     b72:	d080           	add.l d0,d0
     b74:	2032 0800      	move.l (0,a2,d0.l),d0
     b78:	b0a9 000c      	cmp.l 12(a1),d0
     b7c:	6600 0160      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b80:	7004           	moveq #4,d0
     b82:	b081           	cmp.l d1,d0
     b84:	6700 0150      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     b88:	2008           	move.l a0,d0
     b8a:	5880           	addq.l #4,d0
     b8c:	d080           	add.l d0,d0
     b8e:	d080           	add.l d0,d0
     b90:	2032 0800      	move.l (0,a2,d0.l),d0
     b94:	b0a9 0010      	cmp.l 16(a1),d0
     b98:	6600 0144      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     b9c:	7405           	moveq #5,d2
     b9e:	b481           	cmp.l d1,d2
     ba0:	6700 0134      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     ba4:	2008           	move.l a0,d0
     ba6:	5a80           	addq.l #5,d0
     ba8:	d080           	add.l d0,d0
     baa:	d080           	add.l d0,d0
     bac:	2032 0800      	move.l (0,a2,d0.l),d0
     bb0:	b0a9 0014      	cmp.l 20(a1),d0
     bb4:	6600 0128      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     bb8:	7006           	moveq #6,d0
     bba:	b081           	cmp.l d1,d0
     bbc:	6700 0118      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     bc0:	2008           	move.l a0,d0
     bc2:	5c80           	addq.l #6,d0
     bc4:	d080           	add.l d0,d0
     bc6:	d080           	add.l d0,d0
     bc8:	2032 0800      	move.l (0,a2,d0.l),d0
     bcc:	b0a9 0018      	cmp.l 24(a1),d0
     bd0:	6600 010c      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     bd4:	7407           	moveq #7,d2
     bd6:	b481           	cmp.l d1,d2
     bd8:	6700 00fc      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     bdc:	2008           	move.l a0,d0
     bde:	5e80           	addq.l #7,d0
     be0:	d080           	add.l d0,d0
     be2:	d080           	add.l d0,d0
     be4:	2032 0800      	move.l (0,a2,d0.l),d0
     be8:	b0a9 001c      	cmp.l 28(a1),d0
     bec:	6600 00f0      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     bf0:	7008           	moveq #8,d0
     bf2:	b081           	cmp.l d1,d0
     bf4:	6700 00e0      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     bf8:	2008           	move.l a0,d0
     bfa:	5080           	addq.l #8,d0
     bfc:	d080           	add.l d0,d0
     bfe:	d080           	add.l d0,d0
     c00:	2032 0800      	move.l (0,a2,d0.l),d0
     c04:	b0a9 0020      	cmp.l 32(a1),d0
     c08:	6600 00d4      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     c0c:	7409           	moveq #9,d2
     c0e:	b481           	cmp.l d1,d2
     c10:	6700 00c4      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     c14:	47e8 0009      	lea 9(a0),a3
     c18:	200b           	move.l a3,d0
     c1a:	d08b           	add.l a3,d0
     c1c:	d080           	add.l d0,d0
     c1e:	2032 0800      	move.l (0,a2,d0.l),d0
     c22:	b0a9 0024      	cmp.l 36(a1),d0
     c26:	6600 00b6      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     c2a:	700a           	moveq #10,d0
     c2c:	b081           	cmp.l d1,d0
     c2e:	6700 00a6      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     c32:	47e8 000a      	lea 10(a0),a3
     c36:	200b           	move.l a3,d0
     c38:	d08b           	add.l a3,d0
     c3a:	d080           	add.l d0,d0
     c3c:	2032 0800      	move.l (0,a2,d0.l),d0
     c40:	b0a9 0028      	cmp.l 40(a1),d0
     c44:	6600 0098      	bne.w cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     c48:	740b           	moveq #11,d2
     c4a:	b481           	cmp.l d1,d2
     c4c:	6700 0088      	beq.w cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     c50:	47e8 000b      	lea 11(a0),a3
     c54:	200b           	move.l a3,d0
     c56:	d08b           	add.l a3,d0
     c58:	d080           	add.l d0,d0
     c5a:	2032 0800      	move.l (0,a2,d0.l),d0
     c5e:	b0a9 002c      	cmp.l 44(a1),d0
     c62:	667a           	bne.s cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     c64:	700c           	moveq #12,d0
     c66:	b081           	cmp.l d1,d0
     c68:	676c           	beq.s cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     c6a:	47e8 000c      	lea 12(a0),a3
     c6e:	200b           	move.l a3,d0
     c70:	d08b           	add.l a3,d0
     c72:	d080           	add.l d0,d0
     c74:	2032 0800      	move.l (0,a2,d0.l),d0
     c78:	b0a9 0030      	cmp.l 48(a1),d0
     c7c:	6660           	bne.s cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     c7e:	740d           	moveq #13,d2
     c80:	b481           	cmp.l d1,d2
     c82:	6752           	beq.s cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     c84:	47e8 000d      	lea 13(a0),a3
     c88:	200b           	move.l a3,d0
     c8a:	d08b           	add.l a3,d0
     c8c:	d080           	add.l d0,d0
     c8e:	2032 0800      	move.l (0,a2,d0.l),d0
     c92:	b0a9 0034      	cmp.l 52(a1),d0
     c96:	6646           	bne.s cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     c98:	700e           	moveq #14,d0
     c9a:	b081           	cmp.l d1,d0
     c9c:	6738           	beq.s cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     c9e:	47e8 000e      	lea 14(a0),a3
     ca2:	200b           	move.l a3,d0
     ca4:	d08b           	add.l a3,d0
     ca6:	d080           	add.l d0,d0
     ca8:	2032 0800      	move.l (0,a2,d0.l),d0
     cac:	b0a9 0038      	cmp.l 56(a1),d0
     cb0:	662c           	bne.s cde <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
     cb2:	7410           	moveq #16,d2
     cb4:	b481           	cmp.l d1,d2
     cb6:	661e           	bne.s cd6 <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
     cb8:	41e8 000f      	lea 15(a0),a0
     cbc:	d1c8           	adda.l a0,a0
     cbe:	d1c8           	adda.l a0,a0
     cc0:	2070 a800      	movea.l (0,a0,a2.l),a0
     cc4:	b1e9 003c      	cmpa.l 60(a1),a0
     cc8:	57c0           	seq d0
     cca:	4880           	ext.w d0
     ccc:	48c0           	ext.l d0
     cce:	4480           	neg.l d0
}
     cd0:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     cd4:	4e75           	rts
  return 1;
     cd6:	7001           	moveq #1,d0
}
     cd8:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     cdc:	4e75           	rts
      return 0;
     cde:	7000           	moveq #0,d0
}
     ce0:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     ce4:	4e75           	rts

00000ce6 <ClbuildSwscroller>:
#include "swscroller.h"
#include "utils.h"

ULONG * ClbuildSwscroller() {
     ce6:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ( 256*41+33)*4, MEMF_CHIP);
     cea:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     cf0:	203c 0000 a484 	move.l #42116,d0
     cf6:	7202           	moveq #2,d1
     cf8:	4eae ff3a      	jsr -198(a6)
     cfc:	2440           	movea.l d0,a2
  
  if( retval == 0) {
     cfe:	4a80           	tst.l d0
     d00:	6700 0150      	beq.w e52 <ClbuildSwscroller+0x16c>
  ULONG *cl = retval;
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
     d04:	24b9 0000 3c38 	move.l 3c38 <ClsSprites>,(a2)
     d0a:	2579 0000 3c3c 	move.l 3c3c <ClsSprites+0x4>,4(a2)
     d10:	0004 
     d12:	2579 0000 3c40 	move.l 3c40 <ClsSprites+0x8>,8(a2)
     d18:	0008 
     d1a:	2579 0000 3c44 	move.l 3c44 <ClsSprites+0xc>,12(a2)
     d20:	000c 
     d22:	2579 0000 3c48 	move.l 3c48 <ClsSprites+0x10>,16(a2)
     d28:	0010 
     d2a:	2579 0000 3c4c 	move.l 3c4c <ClsSprites+0x14>,20(a2)
     d30:	0014 
     d32:	2579 0000 3c50 	move.l 3c50 <ClsSprites+0x18>,24(a2)
     d38:	0018 
     d3a:	2579 0000 3c54 	move.l 3c54 <ClsSprites+0x1c>,28(a2)
     d40:	001c 
     d42:	2579 0000 3c58 	move.l 3c58 <ClsSprites+0x20>,32(a2)
     d48:	0020 
     d4a:	2579 0000 3c5c 	move.l 3c5c <ClsSprites+0x24>,36(a2)
     d50:	0024 
     d52:	2579 0000 3c60 	move.l 3c60 <ClsSprites+0x28>,40(a2)
     d58:	0028 
     d5a:	2579 0000 3c64 	move.l 3c64 <ClsSprites+0x2c>,44(a2)
     d60:	002c 
     d62:	2579 0000 3c68 	move.l 3c68 <ClsSprites+0x30>,48(a2)
     d68:	0030 
     d6a:	2579 0000 3c6c 	move.l 3c6c <ClsSprites+0x34>,52(a2)
     d70:	0034 
     d72:	2579 0000 3c70 	move.l 3c70 <ClsSprites+0x38>,56(a2)
     d78:	0038 
     d7a:	2579 0000 3c74 	move.l 3c74 <ClsSprites+0x3c>,60(a2)
     d80:	003c 
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
     d82:	2579 0000 3c08 	move.l 3c08 <ClScreen>,64(a2)
     d88:	0040 
     d8a:	2579 0000 3c0c 	move.l 3c0c <ClScreen+0x4>,68(a2)
     d90:	0044 
     d92:	2579 0000 3c10 	move.l 3c10 <ClScreen+0x8>,72(a2)
     d98:	0048 
     d9a:	2579 0000 3c14 	move.l 3c14 <ClScreen+0xc>,76(a2)
     da0:	004c 
     da2:	2579 0000 3c18 	move.l 3c18 <ClScreen+0x10>,80(a2)
     da8:	0050 
     daa:	2579 0000 3c1c 	move.l 3c1c <ClScreen+0x14>,84(a2)
     db0:	0054 
     db2:	2579 0000 3c20 	move.l 3c20 <ClScreen+0x18>,88(a2)
     db8:	0058 
     dba:	2579 0000 3c24 	move.l 3c24 <ClScreen+0x1c>,92(a2)
     dc0:	005c 
     dc2:	2579 0000 3c28 	move.l 3c28 <ClScreen+0x20>,96(a2)
     dc8:	0060 
     dca:	2579 0000 3c2c 	move.l 3c2c <ClScreen+0x24>,100(a2)
     dd0:	0064 
     dd2:	2579 0000 3c30 	move.l 3c30 <ClScreen+0x28>,104(a2)
     dd8:	0068 
     dda:	2579 0000 3c34 	move.l 3c34 <ClScreen+0x2c>,108(a2)
     de0:	006c 
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
     de2:	257c 00e0 0000 	move.l #14680064,112(a2)
     de8:	0070 
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
     dea:	257c 00e2 0000 	move.l #14811136,116(a2)
     df0:	0074 

  clpartinstruction = ClColor;
  for(int i=0; i<2;i++)
    *cl++ = *clpartinstruction++;
     df2:	2579 0000 3c00 	move.l 3c00 <ClColor>,120(a2)
     df8:	0078 
     dfa:	2579 0000 3c04 	move.l 3c04 <ClColor+0x4>,124(a2)
     e00:	007c 
     e02:	43ea 0124      	lea 292(a2),a1
     e06:	220a           	move.l a2,d1
     e08:	0681 0000 a524 	addi.l #42276,d1
     e0e:	203c 2c07 fffe 	move.l #738721790,d0

  for(int i=0x2c; i<0x2c+256; i++) {
    *cl++ = (i<<24)+0x07fffe;
     e14:	41e9 ff60      	lea -160(a1),a0
     e18:	2340 ff5c      	move.l d0,-164(a1)
    for(int i2=0;i2<20;i2++) {
      *cl++ = 0x018200f0;
     e1c:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
     e22:	5088           	addq.l #8,a0
     e24:	217c 0182 0f00 	move.l #25300736,-4(a0)
     e2a:	fffc 
    for(int i2=0;i2<20;i2++) {
     e2c:	b3c8           	cmpa.l a0,a1
     e2e:	66ec           	bne.s e1c <ClbuildSwscroller+0x136>
     e30:	43e8 00a4      	lea 164(a0),a1
     e34:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
     e3a:	b3c1           	cmpa.l d1,a1
     e3c:	66d6           	bne.s e14 <ClbuildSwscroller+0x12e>
    }
  }
  
  *cl = 0xfffffffe;
     e3e:	203c 0000 a480 	move.l #42112,d0
     e44:	72fe           	moveq #-2,d1
     e46:	2581 0800      	move.l d1,(0,a2,d0.l)

  return retval;
     e4a:	200a           	move.l a2,d0
     e4c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     e50:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     e52:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     e58:	4eae ffc4      	jsr -60(a6)
     e5c:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     e62:	2200           	move.l d0,d1
     e64:	243c 0000 176d 	move.l #5997,d2
     e6a:	7628           	moveq #40,d3
     e6c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     e70:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
     e76:	7201           	moveq #1,d1
     e78:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     e7c:	24b9 0000 3c38 	move.l 3c38 <ClsSprites>,(a2)
     e82:	2579 0000 3c3c 	move.l 3c3c <ClsSprites+0x4>,4(a2)
     e88:	0004 
     e8a:	2579 0000 3c40 	move.l 3c40 <ClsSprites+0x8>,8(a2)
     e90:	0008 
     e92:	2579 0000 3c44 	move.l 3c44 <ClsSprites+0xc>,12(a2)
     e98:	000c 
     e9a:	2579 0000 3c48 	move.l 3c48 <ClsSprites+0x10>,16(a2)
     ea0:	0010 
     ea2:	2579 0000 3c4c 	move.l 3c4c <ClsSprites+0x14>,20(a2)
     ea8:	0014 
     eaa:	2579 0000 3c50 	move.l 3c50 <ClsSprites+0x18>,24(a2)
     eb0:	0018 
     eb2:	2579 0000 3c54 	move.l 3c54 <ClsSprites+0x1c>,28(a2)
     eb8:	001c 
     eba:	2579 0000 3c58 	move.l 3c58 <ClsSprites+0x20>,32(a2)
     ec0:	0020 
     ec2:	2579 0000 3c5c 	move.l 3c5c <ClsSprites+0x24>,36(a2)
     ec8:	0024 
     eca:	2579 0000 3c60 	move.l 3c60 <ClsSprites+0x28>,40(a2)
     ed0:	0028 
     ed2:	2579 0000 3c64 	move.l 3c64 <ClsSprites+0x2c>,44(a2)
     ed8:	002c 
     eda:	2579 0000 3c68 	move.l 3c68 <ClsSprites+0x30>,48(a2)
     ee0:	0030 
     ee2:	2579 0000 3c6c 	move.l 3c6c <ClsSprites+0x34>,52(a2)
     ee8:	0034 
     eea:	2579 0000 3c70 	move.l 3c70 <ClsSprites+0x38>,56(a2)
     ef0:	0038 
     ef2:	2579 0000 3c74 	move.l 3c74 <ClsSprites+0x3c>,60(a2)
     ef8:	003c 
    *cl++ = *clpartinstruction++;
     efa:	2579 0000 3c08 	move.l 3c08 <ClScreen>,64(a2)
     f00:	0040 
     f02:	2579 0000 3c0c 	move.l 3c0c <ClScreen+0x4>,68(a2)
     f08:	0044 
     f0a:	2579 0000 3c10 	move.l 3c10 <ClScreen+0x8>,72(a2)
     f10:	0048 
     f12:	2579 0000 3c14 	move.l 3c14 <ClScreen+0xc>,76(a2)
     f18:	004c 
     f1a:	2579 0000 3c18 	move.l 3c18 <ClScreen+0x10>,80(a2)
     f20:	0050 
     f22:	2579 0000 3c1c 	move.l 3c1c <ClScreen+0x14>,84(a2)
     f28:	0054 
     f2a:	2579 0000 3c20 	move.l 3c20 <ClScreen+0x18>,88(a2)
     f30:	0058 
     f32:	2579 0000 3c24 	move.l 3c24 <ClScreen+0x1c>,92(a2)
     f38:	005c 
     f3a:	2579 0000 3c28 	move.l 3c28 <ClScreen+0x20>,96(a2)
     f40:	0060 
     f42:	2579 0000 3c2c 	move.l 3c2c <ClScreen+0x24>,100(a2)
     f48:	0064 
     f4a:	2579 0000 3c30 	move.l 3c30 <ClScreen+0x28>,104(a2)
     f50:	0068 
     f52:	2579 0000 3c34 	move.l 3c34 <ClScreen+0x2c>,108(a2)
     f58:	006c 
  *cl++ = 0x00e00000;
     f5a:	257c 00e0 0000 	move.l #14680064,112(a2)
     f60:	0070 
  *cl++ = 0x00e20000;
     f62:	257c 00e2 0000 	move.l #14811136,116(a2)
     f68:	0074 
    *cl++ = *clpartinstruction++;
     f6a:	2579 0000 3c00 	move.l 3c00 <ClColor>,120(a2)
     f70:	0078 
     f72:	2579 0000 3c04 	move.l 3c04 <ClColor+0x4>,124(a2)
     f78:	007c 
     f7a:	43ea 0124      	lea 292(a2),a1
     f7e:	220a           	move.l a2,d1
     f80:	0681 0000 a524 	addi.l #42276,d1
     f86:	203c 2c07 fffe 	move.l #738721790,d0
     f8c:	6000 fe86      	bra.w e14 <ClbuildSwscroller+0x12e>

00000f90 <SwapCl>:
  ULONG tmp = DrawCopper;
     f90:	2039 0000 3ca8 	move.l 3ca8 <DrawCopper>,d0
  DrawCopper = ViewCopper;
     f96:	23f9 0000 3ca0 	move.l 3ca0 <ViewCopper>,3ca8 <DrawCopper>
     f9c:	0000 3ca8 
  ViewCopper = tmp;
     fa0:	23c0 0000 3ca0 	move.l d0,3ca0 <ViewCopper>
  hw->cop1lc = ViewCopper;
     fa6:	2079 0000 3cc6 	movea.l 3cc6 <hw>,a0
     fac:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     fb0:	3140 0088      	move.w d0,136(a0)
}
     fb4:	4e75           	rts

00000fb6 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
     fb6:	2039 0000 3c9c 	move.l 3c9c <DrawBuffer>,d0
  UWORD *copword = DrawCopper;
     fbc:	2079 0000 3ca8 	movea.l 3ca8 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     fc2:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
     fc6:	2200           	move.l d0,d1
     fc8:	4241           	clr.w d1
     fca:	4841           	swap d1
     fcc:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
     fd0:	23f9 0000 3c98 	move.l 3c98 <ViewBuffer>,3c9c <DrawBuffer>
     fd6:	0000 3c9c 
  ViewBuffer = tmp;
     fda:	23c0 0000 3c98 	move.l d0,3c98 <ViewBuffer>
}
     fe0:	4e75           	rts

00000fe2 <ClBuild>:
ULONG * ClBuild() {
     fe2:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     fe6:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
     fec:	707b           	moveq #123,d0
     fee:	4600           	not.b d0
     ff0:	7202           	moveq #2,d1
     ff2:	4eae ff3a      	jsr -198(a6)
     ff6:	2440           	movea.l d0,a2
  if( retval == 0) {
     ff8:	4a80           	tst.l d0
     ffa:	6700 010e      	beq.w 110a <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     ffe:	24b9 0000 3c38 	move.l 3c38 <ClsSprites>,(a2)
    1004:	2579 0000 3c3c 	move.l 3c3c <ClsSprites+0x4>,4(a2)
    100a:	0004 
    100c:	2579 0000 3c40 	move.l 3c40 <ClsSprites+0x8>,8(a2)
    1012:	0008 
    1014:	2579 0000 3c44 	move.l 3c44 <ClsSprites+0xc>,12(a2)
    101a:	000c 
    101c:	2579 0000 3c48 	move.l 3c48 <ClsSprites+0x10>,16(a2)
    1022:	0010 
    1024:	2579 0000 3c4c 	move.l 3c4c <ClsSprites+0x14>,20(a2)
    102a:	0014 
    102c:	2579 0000 3c50 	move.l 3c50 <ClsSprites+0x18>,24(a2)
    1032:	0018 
    1034:	2579 0000 3c54 	move.l 3c54 <ClsSprites+0x1c>,28(a2)
    103a:	001c 
    103c:	2579 0000 3c58 	move.l 3c58 <ClsSprites+0x20>,32(a2)
    1042:	0020 
    1044:	2579 0000 3c5c 	move.l 3c5c <ClsSprites+0x24>,36(a2)
    104a:	0024 
    104c:	2579 0000 3c60 	move.l 3c60 <ClsSprites+0x28>,40(a2)
    1052:	0028 
    1054:	2579 0000 3c64 	move.l 3c64 <ClsSprites+0x2c>,44(a2)
    105a:	002c 
    105c:	2579 0000 3c68 	move.l 3c68 <ClsSprites+0x30>,48(a2)
    1062:	0030 
    1064:	2579 0000 3c6c 	move.l 3c6c <ClsSprites+0x34>,52(a2)
    106a:	0034 
    106c:	2579 0000 3c70 	move.l 3c70 <ClsSprites+0x38>,56(a2)
    1072:	0038 
    1074:	2579 0000 3c74 	move.l 3c74 <ClsSprites+0x3c>,60(a2)
    107a:	003c 
    *cl++ = *clpartinstruction++;
    107c:	2579 0000 3c08 	move.l 3c08 <ClScreen>,64(a2)
    1082:	0040 
    1084:	2579 0000 3c0c 	move.l 3c0c <ClScreen+0x4>,68(a2)
    108a:	0044 
    108c:	2579 0000 3c10 	move.l 3c10 <ClScreen+0x8>,72(a2)
    1092:	0048 
    1094:	2579 0000 3c14 	move.l 3c14 <ClScreen+0xc>,76(a2)
    109a:	004c 
    109c:	2579 0000 3c18 	move.l 3c18 <ClScreen+0x10>,80(a2)
    10a2:	0050 
    10a4:	2579 0000 3c1c 	move.l 3c1c <ClScreen+0x14>,84(a2)
    10aa:	0054 
    10ac:	2579 0000 3c20 	move.l 3c20 <ClScreen+0x18>,88(a2)
    10b2:	0058 
    10b4:	2579 0000 3c24 	move.l 3c24 <ClScreen+0x1c>,92(a2)
    10ba:	005c 
    10bc:	2579 0000 3c28 	move.l 3c28 <ClScreen+0x20>,96(a2)
    10c2:	0060 
    10c4:	2579 0000 3c2c 	move.l 3c2c <ClScreen+0x24>,100(a2)
    10ca:	0064 
    10cc:	2579 0000 3c30 	move.l 3c30 <ClScreen+0x28>,104(a2)
    10d2:	0068 
    10d4:	2579 0000 3c34 	move.l 3c34 <ClScreen+0x2c>,108(a2)
    10da:	006c 
  *cl++ = 0x00e00000;
    10dc:	257c 00e0 0000 	move.l #14680064,112(a2)
    10e2:	0070 
  *cl++ = 0x00e20000;
    10e4:	257c 00e2 0000 	move.l #14811136,116(a2)
    10ea:	0074 
    *cl++ = *clpartinstruction++;
    10ec:	2579 0000 3c00 	move.l 3c00 <ClColor>,120(a2)
    10f2:	0078 
    10f4:	2579 0000 3c04 	move.l 3c04 <ClColor+0x4>,124(a2)
    10fa:	007c 
  *cl = 0xfffffffe;
    10fc:	70fe           	moveq #-2,d0
    10fe:	2540 0080      	move.l d0,128(a2)
}
    1102:	200a           	move.l a2,d0
    1104:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1108:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    110a:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    1110:	4eae ffc4      	jsr -60(a6)
    1114:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    111a:	2200           	move.l d0,d1
    111c:	243c 0000 176d 	move.l #5997,d2
    1122:	7628           	moveq #40,d3
    1124:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1128:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    112e:	7201           	moveq #1,d1
    1130:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1134:	24b9 0000 3c38 	move.l 3c38 <ClsSprites>,(a2)
    113a:	2579 0000 3c3c 	move.l 3c3c <ClsSprites+0x4>,4(a2)
    1140:	0004 
    1142:	2579 0000 3c40 	move.l 3c40 <ClsSprites+0x8>,8(a2)
    1148:	0008 
    114a:	2579 0000 3c44 	move.l 3c44 <ClsSprites+0xc>,12(a2)
    1150:	000c 
    1152:	2579 0000 3c48 	move.l 3c48 <ClsSprites+0x10>,16(a2)
    1158:	0010 
    115a:	2579 0000 3c4c 	move.l 3c4c <ClsSprites+0x14>,20(a2)
    1160:	0014 
    1162:	2579 0000 3c50 	move.l 3c50 <ClsSprites+0x18>,24(a2)
    1168:	0018 
    116a:	2579 0000 3c54 	move.l 3c54 <ClsSprites+0x1c>,28(a2)
    1170:	001c 
    1172:	2579 0000 3c58 	move.l 3c58 <ClsSprites+0x20>,32(a2)
    1178:	0020 
    117a:	2579 0000 3c5c 	move.l 3c5c <ClsSprites+0x24>,36(a2)
    1180:	0024 
    1182:	2579 0000 3c60 	move.l 3c60 <ClsSprites+0x28>,40(a2)
    1188:	0028 
    118a:	2579 0000 3c64 	move.l 3c64 <ClsSprites+0x2c>,44(a2)
    1190:	002c 
    1192:	2579 0000 3c68 	move.l 3c68 <ClsSprites+0x30>,48(a2)
    1198:	0030 
    119a:	2579 0000 3c6c 	move.l 3c6c <ClsSprites+0x34>,52(a2)
    11a0:	0034 
    11a2:	2579 0000 3c70 	move.l 3c70 <ClsSprites+0x38>,56(a2)
    11a8:	0038 
    11aa:	2579 0000 3c74 	move.l 3c74 <ClsSprites+0x3c>,60(a2)
    11b0:	003c 
    *cl++ = *clpartinstruction++;
    11b2:	2579 0000 3c08 	move.l 3c08 <ClScreen>,64(a2)
    11b8:	0040 
    11ba:	2579 0000 3c0c 	move.l 3c0c <ClScreen+0x4>,68(a2)
    11c0:	0044 
    11c2:	2579 0000 3c10 	move.l 3c10 <ClScreen+0x8>,72(a2)
    11c8:	0048 
    11ca:	2579 0000 3c14 	move.l 3c14 <ClScreen+0xc>,76(a2)
    11d0:	004c 
    11d2:	2579 0000 3c18 	move.l 3c18 <ClScreen+0x10>,80(a2)
    11d8:	0050 
    11da:	2579 0000 3c1c 	move.l 3c1c <ClScreen+0x14>,84(a2)
    11e0:	0054 
    11e2:	2579 0000 3c20 	move.l 3c20 <ClScreen+0x18>,88(a2)
    11e8:	0058 
    11ea:	2579 0000 3c24 	move.l 3c24 <ClScreen+0x1c>,92(a2)
    11f0:	005c 
    11f2:	2579 0000 3c28 	move.l 3c28 <ClScreen+0x20>,96(a2)
    11f8:	0060 
    11fa:	2579 0000 3c2c 	move.l 3c2c <ClScreen+0x24>,100(a2)
    1200:	0064 
    1202:	2579 0000 3c30 	move.l 3c30 <ClScreen+0x28>,104(a2)
    1208:	0068 
    120a:	2579 0000 3c34 	move.l 3c34 <ClScreen+0x2c>,108(a2)
    1210:	006c 
  *cl++ = 0x00e00000;
    1212:	257c 00e0 0000 	move.l #14680064,112(a2)
    1218:	0070 
  *cl++ = 0x00e20000;
    121a:	257c 00e2 0000 	move.l #14811136,116(a2)
    1220:	0074 
    *cl++ = *clpartinstruction++;
    1222:	2579 0000 3c00 	move.l 3c00 <ClColor>,120(a2)
    1228:	0078 
    122a:	2579 0000 3c04 	move.l 3c04 <ClColor+0x4>,124(a2)
    1230:	007c 
  *cl = 0xfffffffe;
    1232:	70fe           	moveq #-2,d0
    1234:	2540 0080      	move.l d0,128(a2)
}
    1238:	200a           	move.l a2,d0
    123a:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    123e:	4e75           	rts

00001240 <PrepareDisplay>:
int PrepareDisplay() {
    1240:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClBuild( );
    1244:	45fa fd9c      	lea fe2 <ClBuild>(pc),a2
    1248:	4e92           	jsr (a2)
    124a:	23c0 0000 3cac 	move.l d0,3cac <Copperlist1>
  Copperlist2 = ClBuild( );
    1250:	4e92           	jsr (a2)
    1252:	23c0 0000 3ca4 	move.l d0,3ca4 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
    1258:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
    125e:	203c 0000 c800 	move.l #51200,d0
    1264:	7202           	moveq #2,d1
    1266:	4eae ff3a      	jsr -198(a6)
    126a:	23c0 0000 3c94 	move.l d0,3c94 <Bitplane1>
  if(Bitplane1 == 0) {
    1270:	6700 0108      	beq.w 137a <PrepareDisplay+0x13a>
  DrawBuffer = Bitplane1;
    1274:	23c0 0000 3c9c 	move.l d0,3c9c <DrawBuffer>
  DrawCopper = Copperlist1;
    127a:	23f9 0000 3cac 	move.l 3cac <Copperlist1>,3ca8 <DrawCopper>
    1280:	0000 3ca8 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    1284:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
    128a:	203c 0000 c800 	move.l #51200,d0
    1290:	7202           	moveq #2,d1
    1292:	4eae ff3a      	jsr -198(a6)
    1296:	23c0 0000 3c90 	move.l d0,3c90 <Bitplane2>
  if(Bitplane2 == 0) {
    129c:	6756           	beq.s 12f4 <PrepareDisplay+0xb4>
  ViewCopper = Copperlist2;
    129e:	2079 0000 3ca4 	movea.l 3ca4 <Copperlist2>,a0
  ULONG tmp = DrawCopper;
    12a4:	2279 0000 3ca8 	movea.l 3ca8 <DrawCopper>,a1
  hw->cop1lc = ViewCopper;
    12aa:	2479 0000 3cc6 	movea.l 3cc6 <hw>,a2
    12b0:	2549 0080      	move.l a1,128(a2)
  hw->copjmp1 = tmp;
    12b4:	3549 0088      	move.w a1,136(a2)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    12b8:	2239 0000 3c9c 	move.l 3c9c <DrawBuffer>,d1
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    12be:	3141 0076      	move.w d1,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    12c2:	4241           	clr.w d1
    12c4:	4841           	swap d1
    12c6:	3141 0072      	move.w d1,114(a0)
  ViewCopper = tmp;
    12ca:	23c8 0000 3ca0 	move.l a0,3ca0 <ViewCopper>
  hw->cop1lc = ViewCopper;
    12d0:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
    12d4:	3548 0088      	move.w a0,136(a2)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    12d8:	3340 0076      	move.w d0,118(a1)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    12dc:	2200           	move.l d0,d1
    12de:	4241           	clr.w d1
    12e0:	4841           	swap d1
    12e2:	3341 0072      	move.w d1,114(a1)
  ViewBuffer = tmp;
    12e6:	23c0 0000 3c98 	move.l d0,3c98 <ViewBuffer>
}
    12ec:	7000           	moveq #0,d0
    12ee:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    12f2:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    12f4:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    12fa:	4eae ffc4      	jsr -60(a6)
    12fe:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    1304:	2200           	move.l d0,d1
    1306:	243c 0000 17ba 	move.l #6074,d2
    130c:	7626           	moveq #38,d3
    130e:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1312:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    1318:	7201           	moveq #1,d1
    131a:	4eae ff70      	jsr -144(a6)
    131e:	2039 0000 3c90 	move.l 3c90 <Bitplane2>,d0
  ViewCopper = Copperlist2;
    1324:	2079 0000 3ca4 	movea.l 3ca4 <Copperlist2>,a0
  ULONG tmp = DrawCopper;
    132a:	2279 0000 3ca8 	movea.l 3ca8 <DrawCopper>,a1
  hw->cop1lc = ViewCopper;
    1330:	2479 0000 3cc6 	movea.l 3cc6 <hw>,a2
    1336:	2549 0080      	move.l a1,128(a2)
  hw->copjmp1 = tmp;
    133a:	3549 0088      	move.w a1,136(a2)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    133e:	2239 0000 3c9c 	move.l 3c9c <DrawBuffer>,d1
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1344:	3141 0076      	move.w d1,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1348:	4241           	clr.w d1
    134a:	4841           	swap d1
    134c:	3141 0072      	move.w d1,114(a0)
  ViewCopper = tmp;
    1350:	23c8 0000 3ca0 	move.l a0,3ca0 <ViewCopper>
  hw->cop1lc = ViewCopper;
    1356:	2548 0080      	move.l a0,128(a2)
  hw->copjmp1 = tmp;
    135a:	3548 0088      	move.w a0,136(a2)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    135e:	3340 0076      	move.w d0,118(a1)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1362:	2200           	move.l d0,d1
    1364:	4241           	clr.w d1
    1366:	4841           	swap d1
    1368:	3341 0072      	move.w d1,114(a1)
  ViewBuffer = tmp;
    136c:	23c0 0000 3c98 	move.l d0,3c98 <ViewBuffer>
}
    1372:	7000           	moveq #0,d0
    1374:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1378:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    137a:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    1380:	4eae ffc4      	jsr -60(a6)
    1384:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    138a:	2200           	move.l d0,d1
    138c:	243c 0000 1793 	move.l #6035,d2
    1392:	7626           	moveq #38,d3
    1394:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1398:	2c79 0000 3cca 	movea.l 3cca <DOSBase>,a6
    139e:	7201           	moveq #1,d1
    13a0:	4eae ff70      	jsr -144(a6)
    13a4:	2039 0000 3c94 	move.l 3c94 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    13aa:	23c0 0000 3c9c 	move.l d0,3c9c <DrawBuffer>
  DrawCopper = Copperlist1;
    13b0:	23f9 0000 3cac 	move.l 3cac <Copperlist1>,3ca8 <DrawCopper>
    13b6:	0000 3ca8 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
    13ba:	2c79 0000 3cce 	movea.l 3cce <SysBase>,a6
    13c0:	203c 0000 c800 	move.l #51200,d0
    13c6:	7202           	moveq #2,d1
    13c8:	4eae ff3a      	jsr -198(a6)
    13cc:	23c0 0000 3c90 	move.l d0,3c90 <Bitplane2>
  if(Bitplane2 == 0) {
    13d2:	6600 feca      	bne.w 129e <PrepareDisplay+0x5e>
    13d6:	6000 ff1c      	bra.w 12f4 <PrepareDisplay+0xb4>

000013da <WaitVbl>:
void WaitVbl() {
    13da:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    13dc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xde865e>,d0
    13e2:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    13e4:	2017           	move.l (sp),d0
    13e6:	0280 0001 ff00 	andi.l #130816,d0
    13ec:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    13ee:	2017           	move.l (sp),d0
    13f0:	0c80 0001 3700 	cmpi.l #79616,d0
    13f6:	67e4           	beq.s 13dc <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    13f8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xde865e>,d0
    13fe:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1402:	202f 0004      	move.l 4(sp),d0
    1406:	0280 0001 ff00 	andi.l #130816,d0
    140c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1410:	202f 0004      	move.l 4(sp),d0
    1414:	0c80 0001 3700 	cmpi.l #79616,d0
    141a:	66dc           	bne.s 13f8 <WaitVbl+0x1e>
}
    141c:	508f           	addq.l #8,sp
    141e:	4e75           	rts

00001420 <memcpy>:
{
    1420:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    1424:	202f 0014      	move.l 20(sp),d0
    1428:	226f 0018      	movea.l 24(sp),a1
    142c:	222f 001c      	move.l 28(sp),d1
	while(len--)
    1430:	2601           	move.l d1,d3
    1432:	5383           	subq.l #1,d3
    1434:	4a81           	tst.l d1
    1436:	6762           	beq.s 149a <memcpy+0x7a>
    1438:	2040           	movea.l d0,a0
    143a:	5888           	addq.l #4,a0
    143c:	b1c9           	cmpa.l a1,a0
    143e:	53c2           	sl.s d2
    1440:	4402           	neg.b d2
    1442:	41e9 0004      	lea 4(a1),a0
    1446:	b1c0           	cmpa.l d0,a0
    1448:	53c4           	sl.s d4
    144a:	4404           	neg.b d4
    144c:	8404           	or.b d4,d2
    144e:	7808           	moveq #8,d4
    1450:	b883           	cmp.l d3,d4
    1452:	55c4           	sc.s d4
    1454:	4404           	neg.b d4
    1456:	c404           	and.b d4,d2
    1458:	6746           	beq.s 14a0 <memcpy+0x80>
    145a:	2409           	move.l a1,d2
    145c:	8480           	or.l d0,d2
    145e:	7803           	moveq #3,d4
    1460:	c484           	and.l d4,d2
    1462:	663c           	bne.s 14a0 <memcpy+0x80>
    1464:	2049           	movea.l a1,a0
    1466:	2440           	movea.l d0,a2
    1468:	74fc           	moveq #-4,d2
    146a:	c481           	and.l d1,d2
    146c:	d489           	add.l a1,d2
		*d++ = *s++;
    146e:	24d8           	move.l (a0)+,(a2)+
    1470:	b488           	cmp.l a0,d2
    1472:	66fa           	bne.s 146e <memcpy+0x4e>
    1474:	74fc           	moveq #-4,d2
    1476:	c481           	and.l d1,d2
    1478:	2040           	movea.l d0,a0
    147a:	d1c2           	adda.l d2,a0
    147c:	d3c2           	adda.l d2,a1
    147e:	9682           	sub.l d2,d3
    1480:	b481           	cmp.l d1,d2
    1482:	6716           	beq.s 149a <memcpy+0x7a>
    1484:	1091           	move.b (a1),(a0)
	while(len--)
    1486:	4a83           	tst.l d3
    1488:	6710           	beq.s 149a <memcpy+0x7a>
		*d++ = *s++;
    148a:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    1490:	5383           	subq.l #1,d3
    1492:	6706           	beq.s 149a <memcpy+0x7a>
		*d++ = *s++;
    1494:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    149a:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    149e:	4e75           	rts
    14a0:	2040           	movea.l d0,a0
    14a2:	d289           	add.l a1,d1
		*d++ = *s++;
    14a4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    14a6:	b289           	cmp.l a1,d1
    14a8:	67f0           	beq.s 149a <memcpy+0x7a>
		*d++ = *s++;
    14aa:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    14ac:	b289           	cmp.l a1,d1
    14ae:	66f4           	bne.s 14a4 <memcpy+0x84>
    14b0:	60e8           	bra.s 149a <memcpy+0x7a>

000014b2 <memset>:
{
    14b2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    14b6:	202f 0024      	move.l 36(sp),d0
    14ba:	2a2f 0028      	move.l 40(sp),d5
    14be:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    14c2:	2809           	move.l a1,d4
    14c4:	5384           	subq.l #1,d4
    14c6:	b2fc 0000      	cmpa.w #0,a1
    14ca:	6f00 00b0      	ble.w 157c <memset+0xca>
    14ce:	1e05           	move.b d5,d7
    14d0:	2200           	move.l d0,d1
    14d2:	4481           	neg.l d1
    14d4:	7403           	moveq #3,d2
    14d6:	c282           	and.l d2,d1
    14d8:	7c05           	moveq #5,d6
		*ptr++ = val;
    14da:	2440           	movea.l d0,a2
    14dc:	bc84           	cmp.l d4,d6
    14de:	646a           	bcc.s 154a <memset+0x98>
    14e0:	4a81           	tst.l d1
    14e2:	6724           	beq.s 1508 <memset+0x56>
    14e4:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    14e6:	5384           	subq.l #1,d4
    14e8:	7401           	moveq #1,d2
    14ea:	b481           	cmp.l d1,d2
    14ec:	671a           	beq.s 1508 <memset+0x56>
		*ptr++ = val;
    14ee:	2440           	movea.l d0,a2
    14f0:	548a           	addq.l #2,a2
    14f2:	2040           	movea.l d0,a0
    14f4:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    14f8:	5384           	subq.l #1,d4
    14fa:	7403           	moveq #3,d2
    14fc:	b481           	cmp.l d1,d2
    14fe:	6608           	bne.s 1508 <memset+0x56>
		*ptr++ = val;
    1500:	528a           	addq.l #1,a2
    1502:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    1506:	5384           	subq.l #1,d4
    1508:	2609           	move.l a1,d3
    150a:	9681           	sub.l d1,d3
    150c:	7c00           	moveq #0,d6
    150e:	1c05           	move.b d5,d6
    1510:	2406           	move.l d6,d2
    1512:	4842           	swap d2
    1514:	4242           	clr.w d2
    1516:	2042           	movea.l d2,a0
    1518:	2406           	move.l d6,d2
    151a:	e14a           	lsl.w #8,d2
    151c:	4842           	swap d2
    151e:	4242           	clr.w d2
    1520:	e18e           	lsl.l #8,d6
    1522:	2646           	movea.l d6,a3
    1524:	2c08           	move.l a0,d6
    1526:	8486           	or.l d6,d2
    1528:	2c0b           	move.l a3,d6
    152a:	8486           	or.l d6,d2
    152c:	1407           	move.b d7,d2
    152e:	2040           	movea.l d0,a0
    1530:	d1c1           	adda.l d1,a0
    1532:	72fc           	moveq #-4,d1
    1534:	c283           	and.l d3,d1
    1536:	d288           	add.l a0,d1
		*ptr++ = val;
    1538:	20c2           	move.l d2,(a0)+
    153a:	b1c1           	cmpa.l d1,a0
    153c:	66fa           	bne.s 1538 <memset+0x86>
    153e:	72fc           	moveq #-4,d1
    1540:	c283           	and.l d3,d1
    1542:	d5c1           	adda.l d1,a2
    1544:	9881           	sub.l d1,d4
    1546:	b283           	cmp.l d3,d1
    1548:	6732           	beq.s 157c <memset+0xca>
    154a:	1485           	move.b d5,(a2)
	while(len-- > 0)
    154c:	4a84           	tst.l d4
    154e:	6f2c           	ble.s 157c <memset+0xca>
		*ptr++ = val;
    1550:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    1554:	7201           	moveq #1,d1
    1556:	b284           	cmp.l d4,d1
    1558:	6c22           	bge.s 157c <memset+0xca>
		*ptr++ = val;
    155a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    155e:	7402           	moveq #2,d2
    1560:	b484           	cmp.l d4,d2
    1562:	6c18           	bge.s 157c <memset+0xca>
		*ptr++ = val;
    1564:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    1568:	7c03           	moveq #3,d6
    156a:	bc84           	cmp.l d4,d6
    156c:	6c0e           	bge.s 157c <memset+0xca>
		*ptr++ = val;
    156e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    1572:	7204           	moveq #4,d1
    1574:	b284           	cmp.l d4,d1
    1576:	6c04           	bge.s 157c <memset+0xca>
		*ptr++ = val;
    1578:	1545 0005      	move.b d5,5(a2)
}
    157c:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    1580:	4e75           	rts

00001582 <strlen>:
{
    1582:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    1586:	7000           	moveq #0,d0
	while(*s++)
    1588:	4a10           	tst.b (a0)
    158a:	6708           	beq.s 1594 <strlen+0x12>
		t++;
    158c:	5280           	addq.l #1,d0
	while(*s++)
    158e:	4a30 0800      	tst.b (0,a0,d0.l)
    1592:	66f8           	bne.s 158c <strlen+0xa>
}
    1594:	4e75           	rts
    1596:	4e71           	nop

00001598 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    1598:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    159c:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    15a0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    15a4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    15a8:	d041           	add.w d1,d0
	swap	d0
    15aa:	4840           	swap d0
	clrw	d0
    15ac:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    15ae:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    15b2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    15b6:	d081           	add.l d1,d0

	rts
    15b8:	4e75           	rts

000015ba <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    15ba:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    15bc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    15c0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    15c4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    15ca:	6416           	bcc.s 15e2 <__udivsi3+0x28>
	movel	d0, d2
    15cc:	2400           	move.l d0,d2
	clrw	d2
    15ce:	4242           	clr.w d2
	swap	d2
    15d0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    15d2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    15d4:	3002           	move.w d2,d0
	swap	d0
    15d6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    15d8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    15dc:	84c1           	divu.w d1,d2
	movew	d2, d0
    15de:	3002           	move.w d2,d0
	jra	6f
    15e0:	6030           	bra.s 1612 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    15e2:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    15e4:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    15e6:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    15e8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    15ee:	64f4           	bcc.s 15e4 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    15f0:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    15f2:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    15f8:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    15fa:	c2c0           	mulu.w d0,d1
	swap	d2
    15fc:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    15fe:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1600:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1602:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1604:	660a           	bne.s 1610 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    1606:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    1608:	6506           	bcs.s 1610 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    160a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    160e:	6302           	bls.s 1612 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1610:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1612:	241f           	move.l (sp)+,d2
	rts
    1614:	4e75           	rts

00001616 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    1616:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    1618:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    161a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    161e:	6a04           	bpl.s 1624 <__divsi3+0xe>
	negl	d1
    1620:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1622:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1624:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    1628:	6a04           	bpl.s 162e <__divsi3+0x18>
	negl	d0
    162a:	4480           	neg.l d0
	negb	d2
    162c:	4402           	neg.b d2

2:	movel	d1, sp@-
    162e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1630:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1632:	6186           	bsr.s 15ba <__udivsi3>
	addql	IMM (8), sp
    1634:	508f           	addq.l #8,sp

	tstb	d2
    1636:	4a02           	tst.b d2
	jpl	3f
    1638:	6a02           	bpl.s 163c <__divsi3+0x26>
	negl	d0
    163a:	4480           	neg.l d0

3:	movel	sp@+, d2
    163c:	241f           	move.l (sp)+,d2
	rts
    163e:	4e75           	rts

00001640 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1640:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1644:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1648:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    164a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    164c:	61c8           	bsr.s 1616 <__divsi3>
	addql	IMM (8), sp
    164e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    1650:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1654:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1656:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1658:	6100 ff3e      	bsr.w 1598 <__mulsi3>
	addql	IMM (8), sp
    165c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    165e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1662:	9280           	sub.l d0,d1
	movel	d1, d0
    1664:	2001           	move.l d1,d0
	rts
    1666:	4e75           	rts

00001668 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    1668:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    166c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1670:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1672:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    1674:	6100 ff44      	bsr.w 15ba <__udivsi3>
	addql	IMM (8), sp
    1678:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    167a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    167e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1680:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1682:	6100 ff14      	bsr.w 1598 <__mulsi3>
	addql	IMM (8), sp
    1686:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    1688:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    168c:	9280           	sub.l d0,d1
	movel	d1, d0
    168e:	2001           	move.l d1,d0
	rts
    1690:	4e75           	rts

00001692 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    1692:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    1694:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1698:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    169c:	2c5f           	movea.l (sp)+,a6
    rts
    169e:	4e75           	rts

000016a0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    16a0:	16c0           	move.b d0,(a3)+
	rts
    16a2:	4e75           	rts
