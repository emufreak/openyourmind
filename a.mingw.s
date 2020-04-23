
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
       8:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       c:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      10:	23ce 0001 77b8 	move.l a6,177b8 <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,177a8 <hw>
      1c:	0001 77a8 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0001 50b8 	lea 150b8 <incbin_startimage_end+0x4e8>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0001 77ac 	move.l d0,177ac <GfxBase>
	if (!GfxBase)
      32:	6700 0702      	beq.w 736 <main+0x730>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
      3c:	43f9 0001 50c9 	lea 150c9 <incbin_startimage_end+0x4f9>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0001 77b4 	move.l d0,177b4 <DOSBase>
	if (!DOSBase)
      4e:	6700 06d4      	beq.w 724 <main+0x71e>
		Exit(0);

	//KPrintF("Hello debugger from Amiga!\n");
	Write(Output(), "Hello console!\n", 15);
      52:	2c40           	movea.l d0,a6
      54:	4eae ffc4      	jsr -60(a6)
      58:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
      5e:	2200           	move.l d0,d1
      60:	243c 0001 50d5 	move.l #86229,d2
      66:	760f           	moveq #15,d3
      68:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      6c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
      72:	7232           	moveq #50,d1
      74:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      78:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
      7e:	4eae ffc4      	jsr -60(a6)
      82:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
      88:	2628 0080      	move.l 128(a0),d3
      8c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
      92:	2200           	move.l d0,d1
      94:	243c 0001 50e5 	move.l #86245,d2
      9a:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      9e:	49f9 0000 0a46 	lea a46 <ClBuild>,a4
      a4:	4e94           	jsr (a4)
      a6:	2440           	movea.l d0,a2
      a8:	23c0 0001 779a 	move.l d0,1779a <Copperlist1>
  DrawCopper = Copperlist1;
      ae:	23c0 0001 7790 	move.l d0,17790 <DrawCopper>
  Copperlist2 = ClBuild();
      b4:	4e94           	jsr (a4)
      b6:	23c0 0001 778a 	move.l d0,1778a <Copperlist2>
  ViewCopper = Copperlist2;
      bc:	23c0 0001 777e 	move.l d0,1777e <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c2:	2012           	move.l (a2),d0
      c4:	b0b9 0001 73f0 	cmp.l 173f0 <ClsSprites>,d0
      ca:	6600 05ea      	bne.w 6b6 <main+0x6b0>
      ce:	202a 0004      	move.l 4(a2),d0
      d2:	b0b9 0001 73f4 	cmp.l 173f4 <ClsSprites+0x4>,d0
      d8:	6600 05dc      	bne.w 6b6 <main+0x6b0>
      dc:	202a 0008      	move.l 8(a2),d0
      e0:	b0b9 0001 73f8 	cmp.l 173f8 <ClsSprites+0x8>,d0
      e6:	6600 05ce      	bne.w 6b6 <main+0x6b0>
      ea:	202a 000c      	move.l 12(a2),d0
      ee:	b0b9 0001 73fc 	cmp.l 173fc <ClsSprites+0xc>,d0
      f4:	6600 05c0      	bne.w 6b6 <main+0x6b0>
      f8:	202a 0010      	move.l 16(a2),d0
      fc:	b0b9 0001 7400 	cmp.l 17400 <ClsSprites+0x10>,d0
     102:	6600 05b2      	bne.w 6b6 <main+0x6b0>
     106:	202a 0014      	move.l 20(a2),d0
     10a:	b0b9 0001 7404 	cmp.l 17404 <ClsSprites+0x14>,d0
     110:	6600 05a4      	bne.w 6b6 <main+0x6b0>
     114:	202a 0018      	move.l 24(a2),d0
     118:	b0b9 0001 7408 	cmp.l 17408 <ClsSprites+0x18>,d0
     11e:	6600 0596      	bne.w 6b6 <main+0x6b0>
     122:	202a 001c      	move.l 28(a2),d0
     126:	b0b9 0001 740c 	cmp.l 1740c <ClsSprites+0x1c>,d0
     12c:	6600 0588      	bne.w 6b6 <main+0x6b0>
     130:	202a 0020      	move.l 32(a2),d0
     134:	b0b9 0001 7410 	cmp.l 17410 <ClsSprites+0x20>,d0
     13a:	6600 057a      	bne.w 6b6 <main+0x6b0>
     13e:	202a 0024      	move.l 36(a2),d0
     142:	b0b9 0001 7414 	cmp.l 17414 <ClsSprites+0x24>,d0
     148:	6600 056c      	bne.w 6b6 <main+0x6b0>
     14c:	202a 0028      	move.l 40(a2),d0
     150:	b0b9 0001 7418 	cmp.l 17418 <ClsSprites+0x28>,d0
     156:	6600 055e      	bne.w 6b6 <main+0x6b0>
     15a:	202a 002c      	move.l 44(a2),d0
     15e:	b0b9 0001 741c 	cmp.l 1741c <ClsSprites+0x2c>,d0
     164:	6600 0550      	bne.w 6b6 <main+0x6b0>
     168:	202a 0030      	move.l 48(a2),d0
     16c:	b0b9 0001 7420 	cmp.l 17420 <ClsSprites+0x30>,d0
     172:	6600 0542      	bne.w 6b6 <main+0x6b0>
     176:	202a 0034      	move.l 52(a2),d0
     17a:	b0b9 0001 7424 	cmp.l 17424 <ClsSprites+0x34>,d0
     180:	6600 0534      	bne.w 6b6 <main+0x6b0>
     184:	202a 0038      	move.l 56(a2),d0
     188:	b0b9 0001 7428 	cmp.l 17428 <ClsSprites+0x38>,d0
     18e:	6600 0526      	bne.w 6b6 <main+0x6b0>
     192:	246a 003c      	movea.l 60(a2),a2
     196:	b5f9 0001 742c 	cmpa.l 1742c <ClsSprites+0x3c>,a2
     19c:	6600 0518      	bne.w 6b6 <main+0x6b0>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1a0:	2079 0001 779a 	movea.l 1779a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1a6:	2039 0001 73c0 	move.l 173c0 <ClScreen>,d0
     1ac:	b0a8 0040      	cmp.l 64(a0),d0
     1b0:	6600 0526      	bne.w 6d8 <main+0x6d2>
     1b4:	2039 0001 73c4 	move.l 173c4 <ClScreen+0x4>,d0
     1ba:	b0a8 0044      	cmp.l 68(a0),d0
     1be:	6600 0518      	bne.w 6d8 <main+0x6d2>
     1c2:	2039 0001 73c8 	move.l 173c8 <ClScreen+0x8>,d0
     1c8:	b0a8 0048      	cmp.l 72(a0),d0
     1cc:	6600 050a      	bne.w 6d8 <main+0x6d2>
     1d0:	2039 0001 73cc 	move.l 173cc <ClScreen+0xc>,d0
     1d6:	b0a8 004c      	cmp.l 76(a0),d0
     1da:	6600 04fc      	bne.w 6d8 <main+0x6d2>
     1de:	2028 0050      	move.l 80(a0),d0
     1e2:	b0b9 0001 73d0 	cmp.l 173d0 <ClScreen+0x10>,d0
     1e8:	6600 04ee      	bne.w 6d8 <main+0x6d2>
     1ec:	2028 0054      	move.l 84(a0),d0
     1f0:	b0b9 0001 73d4 	cmp.l 173d4 <ClScreen+0x14>,d0
     1f6:	6600 04e0      	bne.w 6d8 <main+0x6d2>
     1fa:	2028 0058      	move.l 88(a0),d0
     1fe:	b0b9 0001 73d8 	cmp.l 173d8 <ClScreen+0x18>,d0
     204:	6600 04d2      	bne.w 6d8 <main+0x6d2>
     208:	2028 005c      	move.l 92(a0),d0
     20c:	b0b9 0001 73dc 	cmp.l 173dc <ClScreen+0x1c>,d0
     212:	6600 04c4      	bne.w 6d8 <main+0x6d2>
     216:	2028 0060      	move.l 96(a0),d0
     21a:	b0b9 0001 73e0 	cmp.l 173e0 <ClScreen+0x20>,d0
     220:	6600 04b6      	bne.w 6d8 <main+0x6d2>
     224:	2028 0064      	move.l 100(a0),d0
     228:	b0b9 0001 73e4 	cmp.l 173e4 <ClScreen+0x24>,d0
     22e:	6600 04a8      	bne.w 6d8 <main+0x6d2>
     232:	2028 0068      	move.l 104(a0),d0
     236:	b0b9 0001 73e8 	cmp.l 173e8 <ClScreen+0x28>,d0
     23c:	6600 049a      	bne.w 6d8 <main+0x6d2>
     240:	2068 006c      	movea.l 108(a0),a0
     244:	b1f9 0001 73ec 	cmpa.l 173ec <ClScreen+0x2c>,a0
     24a:	6600 048c      	bne.w 6d8 <main+0x6d2>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     24e:	23fc 0004 0000 	move.l #262144,177a0 <DrawBuffer>
     254:	0001 77a0 
  ViewBuffer = (ULONG *)0x50000;
     258:	23fc 0005 0000 	move.l #327680,17796 <ViewBuffer>
     25e:	0001 7796 
  
  SetBplPointers();
     262:	45f9 0000 169e 	lea 169e <SetBplPointers>,a2
     268:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     26a:	0cb9 0005 0000 	cmpi.l #327680,177a0 <DrawBuffer>
     270:	0001 77a0 
     274:	6700 057e      	beq.w 7f4 <main+0x7ee>
    Write( Output(), 
     278:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     27e:	4eae ffc4      	jsr -60(a6)
     282:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     288:	2200           	move.l d0,d1
     28a:	243c 0001 50e8 	move.l #86248,d2
     290:	763b           	moveq #59,d3
     292:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     296:	2079 0001 779a 	movea.l 1779a <Copperlist1>,a0
     29c:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2a2:	0070 
     2a4:	6724           	beq.s 2ca <main+0x2c4>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2a6:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     2ac:	4eae ffc4      	jsr -60(a6)
     2b0:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     2b6:	2200           	move.l d0,d1
     2b8:	243c 0001 5124 	move.l #86308,d2
     2be:	763c           	moveq #60,d3
     2c0:	4eae ffd0      	jsr -48(a6)
     2c4:	2079 0001 779a 	movea.l 1779a <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2ca:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2d0:	0074 
     2d2:	6724           	beq.s 2f8 <main+0x2f2>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2d4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     2da:	4eae ffc4      	jsr -60(a6)
     2de:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     2e4:	2200           	move.l d0,d1
     2e6:	243c 0001 5161 	move.l #86369,d2
     2ec:	763c           	moveq #60,d3
     2ee:	4eae ffd0      	jsr -48(a6)
     2f2:	2079 0001 779a 	movea.l 1779a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     2f8:	2028 0078      	move.l 120(a0),d0
     2fc:	b0b9 0001 7340 	cmp.l 17340 <ClColor>,d0
     302:	6600 0520      	bne.w 824 <main+0x81e>
     306:	2028 007c      	move.l 124(a0),d0
     30a:	b0b9 0001 7344 	cmp.l 17344 <ClColor+0x4>,d0
     310:	6600 0512      	bne.w 824 <main+0x81e>
  if( instructions[pos] == value ) 
     314:	70fe           	moveq #-2,d0
     316:	b0a8 0080      	cmp.l 128(a0),d0
     31a:	671e           	beq.s 33a <main+0x334>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     31c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     322:	4eae ffc4      	jsr -60(a6)
     326:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     32c:	2200           	move.l d0,d1
     32e:	243c 0001 51c0 	move.l #86464,d2
     334:	7622           	moveq #34,d3
     336:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     33a:	47f9 0000 1678 	lea 1678 <SwapCl>,a3
     340:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     342:	2039 0001 7790 	move.l 17790 <DrawCopper>,d0
     348:	b0b9 0001 778a 	cmp.l 1778a <Copperlist2>,d0
     34e:	671e           	beq.s 36e <main+0x368>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     350:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     356:	4eae ffc4      	jsr -60(a6)
     35a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     360:	2200           	move.l d0,d1
     362:	243c 0001 51e3 	move.l #86499,d2
     368:	7615           	moveq #21,d3
     36a:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     36e:	4e94           	jsr (a4)
     370:	23c0 0001 779a 	move.l d0,1779a <Copperlist1>
  Copperlist2 = ClBuild( );
     376:	4e94           	jsr (a4)
     378:	23c0 0001 778a 	move.l d0,1778a <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     37e:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     384:	203c 0000 c800 	move.l #51200,d0
     38a:	7202           	moveq #2,d1
     38c:	4eae ff3a      	jsr -198(a6)
     390:	23c0 0001 7786 	move.l d0,17786 <Bitplane1>
  if(Bitplane1 == 0) {
     396:	6700 03fc      	beq.w 794 <main+0x78e>
  ViewBuffer = Bitplane1;
     39a:	23c0 0001 7796 	move.l d0,17796 <ViewBuffer>
  ViewCopper = Copperlist1;
     3a0:	23f9 0001 779a 	move.l 1779a <Copperlist1>,1777e <ViewCopper>
     3a6:	0001 777e 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3aa:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     3b0:	203c 0000 c800 	move.l #51200,d0
     3b6:	7202           	moveq #2,d1
     3b8:	4eae ff3a      	jsr -198(a6)
     3bc:	23c0 0001 7782 	move.l d0,17782 <Bitplane2>
  if(Bitplane2 == 0) {
     3c2:	6700 039c      	beq.w 760 <main+0x75a>
  DrawBuffer = Bitplane2;
     3c6:	23c0 0001 77a0 	move.l d0,177a0 <DrawBuffer>
  DrawCopper = Copperlist2;
     3cc:	23f9 0001 778a 	move.l 1778a <Copperlist2>,17790 <DrawCopper>
     3d2:	0001 7790 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3d6:	2039 0001 7796 	move.l 17796 <ViewBuffer>,d0
     3dc:	b0b9 0001 7786 	cmp.l 17786 <Bitplane1>,d0
     3e2:	671e           	beq.s 402 <main+0x3fc>
    Write( Output(), 
     3e4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     3ea:	4eae ffc4      	jsr -60(a6)
     3ee:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     3f4:	2200           	move.l d0,d1
     3f6:	243c 0001 51f9 	move.l #86521,d2
     3fc:	7638           	moveq #56,d3
     3fe:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     402:	2039 0001 777e 	move.l 1777e <ViewCopper>,d0
     408:	b0b9 0001 779a 	cmp.l 1779a <Copperlist1>,d0
     40e:	671e           	beq.s 42e <main+0x428>
    Write( Output(), 
     410:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     416:	4eae ffc4      	jsr -60(a6)
     41a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     420:	2200           	move.l d0,d1
     422:	243c 0001 5232 	move.l #86578,d2
     428:	763a           	moveq #58,d3
     42a:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     42e:	4e92           	jsr (a2)
  SwapCl();
     430:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     432:	2079 0001 777e 	movea.l 1777e <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     438:	7000           	moveq #0,d0
     43a:	3028 0072      	move.w 114(a0),d0
     43e:	4840           	swap d0
     440:	4240           	clr.w d0
     442:	7200           	moveq #0,d1
     444:	3228 0076      	move.w 118(a0),d1
     448:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     44a:	b0b9 0001 7782 	cmp.l 17782 <Bitplane2>,d0
     450:	671e           	beq.s 470 <main+0x46a>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     452:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     458:	4eae ffc4      	jsr -60(a6)
     45c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     462:	2200           	move.l d0,d1
     464:	243c 0001 526d 	move.l #86637,d2
     46a:	7648           	moveq #72,d3
     46c:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     470:	4e92           	jsr (a2)
  SwapCl();
     472:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     474:	2079 0001 777e 	movea.l 1777e <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     47a:	7000           	moveq #0,d0
     47c:	3028 0072      	move.w 114(a0),d0
     480:	4840           	swap d0
     482:	4240           	clr.w d0
     484:	7200           	moveq #0,d1
     486:	3228 0076      	move.w 118(a0),d1
     48a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48c:	b0b9 0001 7786 	cmp.l 17786 <Bitplane1>,d0
     492:	671e           	beq.s 4b2 <main+0x4ac>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     494:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     49a:	4eae ffc4      	jsr -60(a6)
     49e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     4a4:	2200           	move.l d0,d1
     4a6:	243c 0001 52b6 	move.l #86710,d2
     4ac:	7649           	moveq #73,d3
     4ae:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4b2:	4e92           	jsr (a2)
  SwapCl();
     4b4:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4b6:	2079 0001 777e 	movea.l 1777e <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4bc:	7000           	moveq #0,d0
     4be:	3028 0072      	move.w 114(a0),d0
     4c2:	4840           	swap d0
     4c4:	4240           	clr.w d0
     4c6:	7200           	moveq #0,d1
     4c8:	3228 0076      	move.w 118(a0),d1
     4cc:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4ce:	b0b9 0001 7782 	cmp.l 17782 <Bitplane2>,d0
     4d4:	671e           	beq.s 4f4 <main+0x4ee>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d6:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     4dc:	4eae ffc4      	jsr -60(a6)
     4e0:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     4e6:	2200           	move.l d0,d1
     4e8:	243c 0001 5300 	move.l #86784,d2
     4ee:	7648           	moveq #72,d3
     4f0:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f4:	2f3c 0000 c800 	move.l #51200,-(sp)
     4fa:	4878 0084      	pea 84 <main+0x7e>
     4fe:	4eb9 0000 16ca 	jsr 16ca <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     504:	4eb9 0000 1782 	jsr 1782 <ZoomTest>
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     50a:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     510:	23ee 0022 0001 	move.l 34(a6),1776c <ActiView>
     516:	776c 
	OwnBlitter();
     518:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     51c:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     522:	4eae ff1c      	jsr -228(a6)
	Disable();
     526:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     52c:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     530:	2679 0001 77a8 	movea.l 177a8 <hw>,a3
     536:	302b 0010      	move.w 16(a3),d0
     53a:	33c0 0001 7770 	move.w d0,17770 <SystemADKCON>
	SystemInts=hw->intenar;
     540:	302b 001c      	move.w 28(a3),d0
     544:	33c0 0001 7774 	move.w d0,17774 <SystemInts>
	SystemDMA=hw->dmaconr;
     54a:	302b 0002      	move.w 2(a3),d0
     54e:	33c0 0001 7772 	move.w d0,17772 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     554:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     55a:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     560:	45f9 0000 173c 	lea 173c <WaitVbl>,a2
     566:	4e92           	jsr (a2)
	WaitVbl();
     568:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     56a:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     570:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     576:	93c9           	suba.l a1,a1
     578:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     57c:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     582:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     586:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     58c:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     590:	4e92           	jsr (a2)
	WaitVbl();
     592:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     594:	3f7c 4e7a 0026 	move.w #20090,38(sp)
     59a:	3f7c 0801 0028 	move.w #2049,40(sp)
     5a0:	3f7c 4e73 002a 	move.w #20083,42(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     5a6:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     5ac:	508f           	addq.l #8,sp
     5ae:	082e 0000 0129 	btst #0,297(a6)
     5b4:	6700 0296      	beq.w 84c <main+0x846>
		vbr = (APTR)Supervisor((void*)getvbr);
     5b8:	7e1e           	moveq #30,d7
     5ba:	de8f           	add.l sp,d7
     5bc:	cf8d           	exg d7,a5
     5be:	4eae ffe2      	jsr -30(a6)
     5c2:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5c4:	23c0 0001 7776 	move.l d0,17776 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5ca:	2079 0001 7776 	movea.l 17776 <VBR.lto_priv.5>,a0
     5d0:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     5d4:	23cb 0001 777a 	move.l a3,1777a <SystemIrq>
	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
	WaitVbl();
     5da:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     5dc:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     5de:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
     5e4:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     5e8:	3028 0002      	move.w 2(a0),d0
     5ec:	0800 000e      	btst #14,d0
     5f0:	66f6           	bne.s 5e8 <main+0x5e2>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     5f2:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     5f8:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5fe:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     604:	2279 0001 7776 	movea.l 17776 <VBR.lto_priv.5>,a1
     60a:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     60e:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     614:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     61a:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     620:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     626:	3039 0001 7774 	move.w 17774 <SystemInts>,d0
     62c:	0040 8000      	ori.w #-32768,d0
     630:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     634:	3039 0001 7772 	move.w 17772 <SystemDMA>,d0
     63a:	0040 8000      	ori.w #-32768,d0
     63e:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     642:	3039 0001 7770 	move.w 17770 <SystemADKCON>,d0
     648:	0040 8000      	ori.w #-32768,d0
     64c:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     650:	2279 0001 776c 	movea.l 1776c <ActiView>,a1
     656:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     65a:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     660:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     664:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     66a:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     66e:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     674:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     678:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     67e:	4eae fe32      	jsr -462(a6)
	Enable();
     682:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     688:	4eae ff82      	jsr -126(a6)

	//RunDemo();	// END

	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     68c:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     692:	2279 0001 77b4 	movea.l 177b4 <DOSBase>,a1
     698:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     69c:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     6a2:	2279 0001 77ac 	movea.l 177ac <GfxBase>,a1
     6a8:	4eae fe62      	jsr -414(a6)
}
     6ac:	7000           	moveq #0,d0
     6ae:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6b2:	508f           	addq.l #8,sp
     6b4:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6b6:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     6bc:	4eae ffc4      	jsr -60(a6)
     6c0:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     6c6:	2200           	move.l d0,d1
     6c8:	243c 0001 5380 	move.l #86912,d2
     6ce:	762c           	moveq #44,d3
     6d0:	4eae ffd0      	jsr -48(a6)
     6d4:	6000 faca      	bra.w 1a0 <main+0x19a>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     6d8:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     6de:	4eae ffc4      	jsr -60(a6)
     6e2:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     6e8:	2200           	move.l d0,d1
     6ea:	243c 0001 5349 	move.l #86857,d2
     6f0:	7636           	moveq #54,d3
     6f2:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     6f6:	23fc 0004 0000 	move.l #262144,177a0 <DrawBuffer>
     6fc:	0001 77a0 
  ViewBuffer = (ULONG *)0x50000;
     700:	23fc 0005 0000 	move.l #327680,17796 <ViewBuffer>
     706:	0001 7796 
  SetBplPointers();
     70a:	45f9 0000 169e 	lea 169e <SetBplPointers>,a2
     710:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     712:	0cb9 0005 0000 	cmpi.l #327680,177a0 <DrawBuffer>
     718:	0001 77a0 
     71c:	6600 fb5a      	bne.w 278 <main+0x272>
     720:	6000 00d2      	bra.w 7f4 <main+0x7ee>
		Exit(0);
     724:	9dce           	suba.l a6,a6
     726:	7200           	moveq #0,d1
     728:	4eae ff70      	jsr -144(a6)
     72c:	2039 0001 77b4 	move.l 177b4 <DOSBase>,d0
     732:	6000 f91e      	bra.w 52 <main+0x4c>
		Exit(0);
     736:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     73c:	7200           	moveq #0,d1
     73e:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     742:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     748:	43f9 0001 50c9 	lea 150c9 <incbin_startimage_end+0x4f9>,a1
     74e:	7000           	moveq #0,d0
     750:	4eae fdd8      	jsr -552(a6)
     754:	23c0 0001 77b4 	move.l d0,177b4 <DOSBase>
	if (!DOSBase)
     75a:	6600 f8f6      	bne.w 52 <main+0x4c>
     75e:	60c4           	bra.s 724 <main+0x71e>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     760:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     766:	4eae ffc4      	jsr -60(a6)
     76a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     770:	2200           	move.l d0,d1
     772:	243c 0001 4c74 	move.l #85108,d2
     778:	7626           	moveq #38,d3
     77a:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     77e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     784:	7201           	moveq #1,d1
     786:	4eae ff70      	jsr -144(a6)
     78a:	2039 0001 7782 	move.l 17782 <Bitplane2>,d0
     790:	6000 fc34      	bra.w 3c6 <main+0x3c0>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     794:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     79a:	4eae ffc4      	jsr -60(a6)
     79e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     7a4:	2200           	move.l d0,d1
     7a6:	243c 0001 4c4d 	move.l #85069,d2
     7ac:	7626           	moveq #38,d3
     7ae:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7b2:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     7b8:	7201           	moveq #1,d1
     7ba:	4eae ff70      	jsr -144(a6)
     7be:	2039 0001 7786 	move.l 17786 <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7c4:	23c0 0001 7796 	move.l d0,17796 <ViewBuffer>
  ViewCopper = Copperlist1;
     7ca:	23f9 0001 779a 	move.l 1779a <Copperlist1>,1777e <ViewCopper>
     7d0:	0001 777e 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     7d4:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     7da:	203c 0000 c800 	move.l #51200,d0
     7e0:	7202           	moveq #2,d1
     7e2:	4eae ff3a      	jsr -198(a6)
     7e6:	23c0 0001 7782 	move.l d0,17782 <Bitplane2>
  if(Bitplane2 == 0) {
     7ec:	6600 fbd8      	bne.w 3c6 <main+0x3c0>
     7f0:	6000 ff6e      	bra.w 760 <main+0x75a>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     7f4:	0cb9 0004 0000 	cmpi.l #262144,17796 <ViewBuffer>
     7fa:	0001 7796 
     7fe:	6700 fa96      	beq.w 296 <main+0x290>
    Write( Output(), 
     802:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     808:	4eae ffc4      	jsr -60(a6)
     80c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     812:	2200           	move.l d0,d1
     814:	243c 0001 50e8 	move.l #86248,d2
     81a:	763b           	moveq #59,d3
     81c:	4eae ffd0      	jsr -48(a6)
     820:	6000 fa74      	bra.w 296 <main+0x290>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     824:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     82a:	4eae ffc4      	jsr -60(a6)
     82e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     834:	2200           	move.l d0,d1
     836:	243c 0001 519e 	move.l #86430,d2
     83c:	7621           	moveq #33,d3
     83e:	4eae ffd0      	jsr -48(a6)
     842:	2079 0001 779a 	movea.l 1779a <Copperlist1>,a0
     848:	6000 faca      	bra.w 314 <main+0x30e>
	APTR vbr = 0;
     84c:	7000           	moveq #0,d0
	VBR=GetVBR();
     84e:	23c0 0001 7776 	move.l d0,17776 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     854:	2079 0001 7776 	movea.l 17776 <VBR.lto_priv.5>,a0
     85a:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     85e:	23cb 0001 777a 	move.l a3,1777a <SystemIrq>
	WaitVbl();
     864:	4e92           	jsr (a2)
	WaitVbl();
     866:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     868:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
     86e:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     872:	6000 fd74      	bra.w 5e8 <main+0x5e2>
     876:	4e71           	nop

00000878 <KPrintF>:
{
     878:	4fef ff80      	lea -128(sp),sp
     87c:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     880:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee7f96>
     886:	6734           	beq.s 8bc <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     888:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     88e:	206f 0090      	movea.l 144(sp),a0
     892:	43ef 0094      	lea 148(sp),a1
     896:	45f9 0000 4508 	lea 4508 <PutChar>,a2
     89c:	47ef 000c      	lea 12(sp),a3
     8a0:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     8a4:	2f0b           	move.l a3,-(sp)
     8a6:	4878 0056      	pea 56 <main+0x50>
     8aa:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee7f96>
     8b0:	508f           	addq.l #8,sp
}
     8b2:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     8b6:	4fef 0080      	lea 128(sp),sp
     8ba:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     8bc:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     8c2:	206f 0090      	movea.l 144(sp),a0
     8c6:	43ef 0094      	lea 148(sp),a1
     8ca:	45f9 0000 44fa 	lea 44fa <KPutCharX>,a2
     8d0:	97cb           	suba.l a3,a3
     8d2:	4eae fdf6      	jsr -522(a6)
}
     8d6:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     8da:	4fef 0080      	lea 128(sp),sp
     8de:	4e75           	rts

000008e0 <TestRow>:
  FreeMem( source, (ZMLINESIZE+4)*272);
  FreeMem( destination, (ZMLINESIZE+4)*272);
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
     8e0:	4fef ff94      	lea -108(sp),sp
     8e4:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     8e8:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
     8ee:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
     8f2:	7a34           	moveq #52,d5
     8f4:	da8f           	add.l sp,d5
     8f6:	4878 0064      	pea 64 <main+0x5e>
     8fa:	42a7           	clr.l -(sp)
     8fc:	2f05           	move.l d5,-(sp)
     8fe:	4eba 3a1c      	jsr 431c <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
     902:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
     908:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
     90c:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
     910:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
     914:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     916:	2e3c 0001 4bd1 	move.l #84945,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     91c:	301c           	move.w (a4)+,d0
     91e:	bd40           	eor.w d6,d0
     920:	b05d           	cmp.w (a5)+,d0
     922:	6736           	beq.s 95a <TestRow+0x7a>
      data[0] = i;
     924:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     928:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     92e:	2047           	movea.l d7,a0
     930:	43ef 0030      	lea 48(sp),a1
     934:	45f9 0000 4508 	lea 4508 <PutChar>,a2
     93a:	2645           	movea.l d5,a3
     93c:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     940:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     946:	4eae ffc4      	jsr -60(a6)
     94a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     950:	2200           	move.l d0,d1
     952:	2405           	move.l d5,d2
     954:	7664           	moveq #100,d3
     956:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
     95a:	5284           	addq.l #1,d4
     95c:	7015           	moveq #21,d0
     95e:	b084           	cmp.l d4,d0
     960:	66ba           	bne.s 91c <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     962:	206f 00a0      	movea.l 160(sp),a0
     966:	3028 002a      	move.w 42(a0),d0
     96a:	322f 002e      	move.w 46(sp),d1
     96e:	b340           	eor.w d1,d0
     970:	206f 009c      	movea.l 156(sp),a0
     974:	3228 002a      	move.w 42(a0),d1
     978:	b340           	eor.w d1,d0
     97a:	0240 ff00      	andi.w #-256,d0
     97e:	660a           	bne.s 98a <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
     980:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     984:	4fef 006c      	lea 108(sp),sp
     988:	4e75           	rts
    data[0] = 21;
     98a:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
     990:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     996:	41f9 0001 4bd1 	lea 14bd1 <incbin_startimage_end+0x1>,a0
     99c:	43ef 0030      	lea 48(sp),a1
     9a0:	45f9 0000 4508 	lea 4508 <PutChar>,a2
     9a6:	47ef 0034      	lea 52(sp),a3
     9aa:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     9ae:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     9b4:	4eae ffc4      	jsr -60(a6)
     9b8:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     9be:	2200           	move.l d0,d1
     9c0:	240b           	move.l a3,d2
     9c2:	7664           	moveq #100,d3
     9c4:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
     9c8:	206f 00a0      	movea.l 160(sp),a0
     9cc:	7000           	moveq #0,d0
     9ce:	3028 002a      	move.w 42(a0),d0
     9d2:	2f00           	move.l d0,-(sp)
     9d4:	206f 00a0      	movea.l 160(sp),a0
     9d8:	3028 002a      	move.w 42(a0),d0
     9dc:	2f00           	move.l d0,-(sp)
     9de:	4879 0001 4c01 	pea 14c01 <incbin_startimage_end+0x31>
     9e4:	4eba fe92      	jsr 878 <KPrintF>(pc)
     9e8:	4fef 000c      	lea 12(sp),sp
}
     9ec:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     9f0:	4fef 006c      	lea 108(sp),sp
     9f4:	4e75           	rts

000009f6 <Vblankcounter>:
  Counter4Frames++;
     9f6:	52b9 0001 77b0 	addq.l #1,177b0 <Counter4Frames>
}
     9fc:	4e75           	rts

000009fe <TestCopperlistPos>:
  if( instructions[pos] == value ) 
     9fe:	202f 0008      	move.l 8(sp),d0
     a02:	d080           	add.l d0,d0
     a04:	d080           	add.l d0,d0
     a06:	206f 0004      	movea.l 4(sp),a0
     a0a:	2030 0800      	move.l (0,a0,d0.l),d0
     a0e:	b0af 000c      	cmp.l 12(sp),d0
     a12:	57c0           	seq d0
     a14:	4880           	ext.w d0
     a16:	48c0           	ext.l d0
}
     a18:	4480           	neg.l d0
     a1a:	4e75           	rts

00000a1c <TestCopperlistBatch>:
  for( int i=0;i<length;i++)
     a1c:	226f 0008      	movea.l 8(sp),a1
     a20:	d3c9           	adda.l a1,a1
     a22:	d3c9           	adda.l a1,a1
     a24:	d3ef 0004      	adda.l 4(sp),a1
     a28:	206f 000c      	movea.l 12(sp),a0
     a2c:	202f 0010      	move.l 16(sp),d0
     a30:	d080           	add.l d0,d0
     a32:	d080           	add.l d0,d0
     a34:	d088           	add.l a0,d0
    if( instructions[ pos+i] != batch[ i])
     a36:	b388           	cmpm.l (a0)+,(a1)+
     a38:	6608           	bne.s a42 <TestCopperlistBatch+0x26>
  for( int i=0;i<length;i++)
     a3a:	b1c0           	cmpa.l d0,a0
     a3c:	66f8           	bne.s a36 <TestCopperlistBatch+0x1a>
  return 1;
     a3e:	7001           	moveq #1,d0
}
     a40:	4e75           	rts
      return 0;
     a42:	7000           	moveq #0,d0
}
     a44:	4e75           	rts

00000a46 <ClBuild>:
ULONG * ClBuild() {
     a46:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     a4a:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
     a50:	707b           	moveq #123,d0
     a52:	4600           	not.b d0
     a54:	7202           	moveq #2,d1
     a56:	4eae ff3a      	jsr -198(a6)
     a5a:	2440           	movea.l d0,a2
  if( retval == 0) {
     a5c:	4a80           	tst.l d0
     a5e:	6700 010e      	beq.w b6e <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     a62:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
     a68:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
     a6e:	0004 
     a70:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
     a76:	0008 
     a78:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
     a7e:	000c 
     a80:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
     a86:	0010 
     a88:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
     a8e:	0014 
     a90:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
     a96:	0018 
     a98:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
     a9e:	001c 
     aa0:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
     aa6:	0020 
     aa8:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
     aae:	0024 
     ab0:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
     ab6:	0028 
     ab8:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
     abe:	002c 
     ac0:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
     ac6:	0030 
     ac8:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
     ace:	0034 
     ad0:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
     ad6:	0038 
     ad8:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
     ade:	003c 
    *cl++ = *clpartinstruction++;
     ae0:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
     ae6:	0040 
     ae8:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
     aee:	0044 
     af0:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
     af6:	0048 
     af8:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
     afe:	004c 
     b00:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
     b06:	0050 
     b08:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
     b0e:	0054 
     b10:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
     b16:	0058 
     b18:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
     b1e:	005c 
     b20:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
     b26:	0060 
     b28:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
     b2e:	0064 
     b30:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
     b36:	0068 
     b38:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
     b3e:	006c 
  *cl++ = 0x00e00000;
     b40:	257c 00e0 0000 	move.l #14680064,112(a2)
     b46:	0070 
  *cl++ = 0x00e20000;
     b48:	257c 00e2 0000 	move.l #14811136,116(a2)
     b4e:	0074 
    *cl++ = *clpartinstruction++;
     b50:	2579 0001 7340 	move.l 17340 <ClColor>,120(a2)
     b56:	0078 
     b58:	2579 0001 7344 	move.l 17344 <ClColor+0x4>,124(a2)
     b5e:	007c 
  *cl = 0xfffffffe;
     b60:	70fe           	moveq #-2,d0
     b62:	2540 0080      	move.l d0,128(a2)
}
     b66:	200a           	move.l a2,d0
     b68:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     b6c:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     b6e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     b74:	4eae ffc4      	jsr -60(a6)
     b78:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     b7e:	2200           	move.l d0,d1
     b80:	243c 0001 4c27 	move.l #85031,d2
     b86:	7628           	moveq #40,d3
     b88:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     b8c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
     b92:	7201           	moveq #1,d1
     b94:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     b98:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
     b9e:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
     ba4:	0004 
     ba6:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
     bac:	0008 
     bae:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
     bb4:	000c 
     bb6:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
     bbc:	0010 
     bbe:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
     bc4:	0014 
     bc6:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
     bcc:	0018 
     bce:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
     bd4:	001c 
     bd6:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
     bdc:	0020 
     bde:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
     be4:	0024 
     be6:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
     bec:	0028 
     bee:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
     bf4:	002c 
     bf6:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
     bfc:	0030 
     bfe:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
     c04:	0034 
     c06:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
     c0c:	0038 
     c0e:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
     c14:	003c 
    *cl++ = *clpartinstruction++;
     c16:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
     c1c:	0040 
     c1e:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
     c24:	0044 
     c26:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
     c2c:	0048 
     c2e:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
     c34:	004c 
     c36:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
     c3c:	0050 
     c3e:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
     c44:	0054 
     c46:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
     c4c:	0058 
     c4e:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
     c54:	005c 
     c56:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
     c5c:	0060 
     c5e:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
     c64:	0064 
     c66:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
     c6c:	0068 
     c6e:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
     c74:	006c 
  *cl++ = 0x00e00000;
     c76:	257c 00e0 0000 	move.l #14680064,112(a2)
     c7c:	0070 
  *cl++ = 0x00e20000;
     c7e:	257c 00e2 0000 	move.l #14811136,116(a2)
     c84:	0074 
    *cl++ = *clpartinstruction++;
     c86:	2579 0001 7340 	move.l 17340 <ClColor>,120(a2)
     c8c:	0078 
     c8e:	2579 0001 7344 	move.l 17344 <ClColor+0x4>,124(a2)
     c94:	007c 
  *cl = 0xfffffffe;
     c96:	70fe           	moveq #-2,d0
     c98:	2540 0080      	move.l d0,128(a2)
}
     c9c:	200a           	move.l a2,d0
     c9e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     ca2:	4e75           	rts

00000ca4 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     ca4:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
     caa:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     cae:	3028 0002      	move.w 2(a0),d0
     cb2:	0800 000e      	btst #14,d0
     cb6:	66f6           	bne.s cae <WaitBlt+0xa>
}
     cb8:	4e75           	rts

00000cba <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     cba:	4fef ffe0      	lea -32(sp),sp
     cbe:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     cc2:	282f 0058      	move.l 88(sp),d4
     cc6:	262f 005c      	move.l 92(sp),d3
     cca:	3404           	move.w d4,d2
  WaitBlit();
     ccc:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     cd2:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     cd6:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
     cdc:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     ce2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     ce8:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     cee:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     cf4:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     cfa:	3044           	movea.w d4,a0
     cfc:	d0c4           	adda.w d4,a0
     cfe:	3208           	move.w a0,d1
     d00:	d248           	add.w a0,d1
     d02:	d244           	add.w d4,d1
     d04:	3001           	move.w d1,d0
     d06:	d041           	add.w d1,d0
     d08:	0640 014c      	addi.w #332,d0
     d0c:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
     d10:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
     d16:	0c40 0160      	cmpi.w #352,d0
     d1a:	631a           	bls.s d36 <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
     d1c:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
     d20:	0640 ffed      	addi.w #-19,d0
     d24:	9042           	sub.w d2,d0
    shiftright--;
     d26:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
     d28:	0c40 0160      	cmpi.w #352,d0
     d2c:	62f2           	bhi.s d20 <Zoom_ZoomIntoPicture+0x66>
     d2e:	3f49 0032      	move.w a1,50(sp)
     d32:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     d36:	7012           	moveq #18,d0
     d38:	9041           	sub.w d1,d0
     d3a:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
     d3e:	6c00 0346      	bge.w 1086 <Zoom_ZoomIntoPicture+0x3cc>
     d42:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     d44:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     d46:	0641 0013      	addi.w #19,d1
     d4a:	d242           	add.w d2,d1
      shifthoriz--;
     d4c:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     d4e:	4a41           	tst.w d1
     d50:	6df4           	blt.s d46 <Zoom_ZoomIntoPicture+0x8c>
     d52:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     d56:	3203           	move.w d3,d1
     d58:	d243           	add.w d3,d1
     d5a:	d243           	add.w d3,d1
     d5c:	e749           	lsl.w #3,d1
     d5e:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
     d62:	3e03           	move.w d3,d7
     d64:	ed4f           	lsl.w #6,d7
     d66:	3207           	move.w d7,d1
     d68:	5441           	addq.w #2,d1
     d6a:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     d6e:	90c4           	suba.w d4,a0
     d70:	3a48           	movea.w a0,a5
     d72:	4bed 0012      	lea 18(a5),a5
     d76:	7200           	moveq #0,d1
     d78:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     d7c:	c6c0           	mulu.w d0,d3
     d7e:	2003           	move.l d3,d0
     d80:	d083           	add.l d3,d0
     d82:	d083           	add.l d3,d0
     d84:	e988           	lsl.l #4,d0
     d86:	206f 0050      	movea.l 80(sp),a0
     d8a:	41f0 082c      	lea (44,a0,d0.l),a0
     d8e:	2f48 003c      	move.l a0,60(sp)
     d92:	702c           	moveq #44,d0
     d94:	d0af 0054      	add.l 84(sp),d0
     d98:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
     d9c:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
     da0:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
     da6:	70ed           	moveq #-19,d0
     da8:	9042           	sub.w d2,d0
     daa:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     dae:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
     db0:	33ef 0048 0001 	move.w 72(sp),1778e <ZoomHorizontal>
     db6:	778e 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     db8:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     dbc:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     dc0:	7c00           	moveq #0,d6
     dc2:	3c2f 0046      	move.w 70(sp),d6
     dc6:	2a06           	move.l d6,d5
     dc8:	da86           	add.l d6,d5
     dca:	3f6f 0032 002c 	move.w 50(sp),44(sp)
     dd0:	382f 0032      	move.w 50(sp),d4
     dd4:	720c           	moveq #12,d1
     dd6:	e36c           	lsl.w d1,d4
     dd8:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
     dde:	7000           	moveq #0,d0
     de0:	302f 0030      	move.w 48(sp),d0
     de4:	306f 0040      	movea.w 64(sp),a0
     de8:	b1c0           	cmpa.l d0,a0
     dea:	6e00 00e8      	bgt.w ed4 <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
     dee:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     df2:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
     df8:	0644 09f0      	addi.w #2544,d4
     dfc:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
     e00:	317c 0000 0042 	move.w #0,66(a0)
     e06:	3239 0001 778e 	move.w 1778e <ZoomHorizontal>,d1
    WORD linesleft = 272;
     e0c:	383c 0110      	move.w #272,d4
     e10:	2f46 002c      	move.l d6,44(sp)
     e14:	2645           	movea.l d5,a3
     e16:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
     e1a:	b841           	cmp.w d1,d4
     e1c:	6f00 009a      	ble.w eb8 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
     e20:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
     e22:	3001           	move.w d1,d0
     e24:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
     e26:	0280 0000 ffff 	andi.l #65535,d0
     e2c:	2440           	movea.l d0,a2
     e2e:	d5c0           	adda.l d0,a2
     e30:	4a44           	tst.w d4
     e32:	6f2c           	ble.s e60 <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     e34:	226f 002c      	movea.l 44(sp),a1
     e38:	d3c0           	adda.l d0,a1
     e3a:	d3c9           	adda.l a1,a1
     e3c:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
     e3e:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     e42:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     e46:	3a28 0002      	move.w 2(a0),d5
     e4a:	0805 000e      	btst #14,d5
     e4e:	66f6           	bne.s e46 <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
     e50:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     e54:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
     e58:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
     e5e:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     e60:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     e64:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     e68:	3a28 0002      	move.w 2(a0),d5
     e6c:	0805 000e      	btst #14,d5
     e70:	66f6           	bne.s e68 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
     e72:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     e76:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     e7a:	c3c7           	muls.w d7,d1
     e7c:	5441           	addq.w #2,d1
     e7e:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     e82:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
     e84:	d08c           	add.l a4,d0
     e86:	d080           	add.l d0,d0
     e88:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     e8a:	320d           	move.w a5,d1
      while(linesleft > 0) {
     e8c:	4a44           	tst.w d4
     e8e:	6e8a           	bgt.s e1a <Zoom_ZoomIntoPicture+0x160>
     e90:	33cd 0001 778e 	move.w a5,1778e <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     e96:	066f fff0 0030 	addi.w #-16,48(sp)
     e9c:	55af 003c      	subq.l #2,60(sp)
     ea0:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
     ea4:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
     eaa:	6600 ff04      	bne.w db0 <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
     eae:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     eb2:	4fef 0020      	lea 32(sp),sp
     eb6:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
     eb8:	3006           	move.w d6,d0
     eba:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
     ebc:	0280 0000 ffff 	andi.l #65535,d0
     ec2:	2440           	movea.l d0,a2
     ec4:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
     ec6:	3204           	move.w d4,d1
          linesleft = 0;
     ec8:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     eca:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     ece:	3a28 0002      	move.w 2(a0),d5
     ed2:	6094           	bra.s e68 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     ed4:	366f 0040      	movea.w 64(sp),a3
     ed8:	96ef 0030      	suba.w 48(sp),a3
     edc:	534b           	subq.w #1,a3
  if( shiftright == 0) {
     ede:	302f 002c      	move.w 44(sp),d0
     ee2:	5340           	subq.w #1,d0
     ee4:	3f40 0032      	move.w d0,50(sp)
     ee8:	4a6f 002c      	tst.w 44(sp)
     eec:	6600 013c      	bne.w 102a <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
     ef0:	33fc 0001 0001 	move.w #1,1779e <ZoomBlit_Increment4SrcA>
     ef6:	779e 
     ef8:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
     efc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     f00:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
     f06:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     f0a:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     f0e:	7000           	moveq #0,d0
     f10:	300b           	move.w a3,d0
     f12:	7210           	moveq #16,d1
     f14:	9280           	sub.l d0,d1
     f16:	2001           	move.l d1,d0
     f18:	7200           	moveq #0,d1
     f1a:	4641           	not.w d1
     f1c:	e1a9           	lsl.l d0,d1
     f1e:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
     f22:	302f 004a      	move.w 74(sp),d0
     f26:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     f2a:	7000           	moveq #0,d0
     f2c:	3039 0001 779e 	move.w 1779e <ZoomBlit_Increment4SrcA>,d0
     f32:	2c40           	movea.l d0,a6
     f34:	ddc0           	adda.l d0,a6
     f36:	3239 0001 778e 	move.w 1778e <ZoomHorizontal>,d1
    WORD linesleft = 272;
     f3c:	383c 0110      	move.w #272,d4
     f40:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
     f44:	b841           	cmp.w d1,d4
     f46:	6f00 00c2      	ble.w 100a <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
     f4a:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
     f4c:	302f 0034      	move.w 52(sp),d0
     f50:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
     f52:	0280 0000 ffff 	andi.l #65535,d0
     f58:	2440           	movea.l d0,a2
     f5a:	d5c0           	adda.l d0,a2
     f5c:	4a44           	tst.w d4
     f5e:	6f34           	ble.s f94 <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     f60:	226f 0042      	movea.l 66(sp),a1
     f64:	d3c0           	adda.l d0,a1
     f66:	d3c9           	adda.l a1,a1
     f68:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
     f6a:	47f2 3800      	lea (0,a2,d3.l),a3
     f6e:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     f72:	3c28 0002      	move.w 2(a0),d6
     f76:	0806 000e      	btst #14,d6
     f7a:	66f6           	bne.s f72 <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     f7c:	2c09           	move.l a1,d6
     f7e:	dc8e           	add.l a6,d6
     f80:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
     f84:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
     f88:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
     f8c:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
     f92:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     f94:	2242           	movea.l d2,a1
     f96:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f98:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     f9c:	3c28 0002      	move.w 2(a0),d6
     fa0:	0806 000e      	btst #14,d6
     fa4:	66f6           	bne.s f9c <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     fa6:	2c09           	move.l a1,d6
     fa8:	dc8e           	add.l a6,d6
     faa:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
     fae:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
     fb2:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     fb6:	c3c7           	muls.w d7,d1
     fb8:	5441           	addq.w #2,d1
     fba:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     fbe:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
     fc0:	d08c           	add.l a4,d0
     fc2:	d080           	add.l d0,d0
     fc4:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     fc6:	320d           	move.w a5,d1
      while( linesleft > 0) {
     fc8:	4a44           	tst.w d4
     fca:	6e00 ff78      	bgt.w f44 <Zoom_ZoomIntoPicture+0x28a>
     fce:	33cd 0001 778e 	move.w a5,1778e <ZoomHorizontal>
      if(shiftright < 0) {
     fd4:	4a6f 0032      	tst.w 50(sp)
     fd8:	6c00 febc      	bge.w e96 <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
     fdc:	322f 002c      	move.w 44(sp),d1
     fe0:	0641 000f      	addi.w #15,d1
     fe4:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
     fe8:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
     fee:	066f fff0 0030 	addi.w #-16,48(sp)
     ff4:	55af 003c      	subq.l #2,60(sp)
     ff8:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
     ffc:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    1002:	6600 fdac      	bne.w db0 <Zoom_ZoomIntoPicture+0xf6>
    1006:	6000 fea6      	bra.w eae <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    100a:	302f 0034      	move.w 52(sp),d0
    100e:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    1010:	0280 0000 ffff 	andi.l #65535,d0
    1016:	2440           	movea.l d0,a2
    1018:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    101a:	3204           	move.w d4,d1
          linesleft = 0;
    101c:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    101e:	2242           	movea.l d2,a1
    1020:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1022:	3c28 0002      	move.w 2(a0),d6
    1026:	6000 ff74      	bra.w f9c <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    102a:	4279 0001 779e 	clr.w 1779e <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    1030:	720c           	moveq #12,d1
    1032:	e368           	lsl.w d1,d0
    1034:	3440           	movea.w d0,a2
    1036:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    103a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    103e:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
    1044:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1048:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    104c:	7000           	moveq #0,d0
    104e:	300b           	move.w a3,d0
    1050:	7210           	moveq #16,d1
    1052:	9280           	sub.l d0,d1
    1054:	2001           	move.l d1,d0
    1056:	7200           	moveq #0,d1
    1058:	4641           	not.w d1
    105a:	e1a9           	lsl.l d0,d1
    105c:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    1060:	302f 004a      	move.w 74(sp),d0
    1064:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1068:	7000           	moveq #0,d0
    106a:	3039 0001 779e 	move.w 1779e <ZoomBlit_Increment4SrcA>,d0
    1070:	2c40           	movea.l d0,a6
    1072:	ddc0           	adda.l d0,a6
    1074:	3239 0001 778e 	move.w 1778e <ZoomHorizontal>,d1
    WORD linesleft = 272;
    107a:	383c 0110      	move.w #272,d4
    107e:	2f46 0042      	move.l d6,66(sp)
    1082:	6000 fec0      	bra.w f44 <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    1086:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    1088:	3203           	move.w d3,d1
    108a:	d243           	add.w d3,d1
    108c:	d243           	add.w d3,d1
    108e:	e749           	lsl.w #3,d1
    1090:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    1094:	3e03           	move.w d3,d7
    1096:	ed4f           	lsl.w #6,d7
    1098:	3207           	move.w d7,d1
    109a:	5441           	addq.w #2,d1
    109c:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    10a0:	90c4           	suba.w d4,a0
    10a2:	3a48           	movea.w a0,a5
    10a4:	4bed 0012      	lea 18(a5),a5
    10a8:	7200           	moveq #0,d1
    10aa:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    10ae:	c6c0           	mulu.w d0,d3
    10b0:	2003           	move.l d3,d0
    10b2:	d083           	add.l d3,d0
    10b4:	d083           	add.l d3,d0
    10b6:	e988           	lsl.l #4,d0
    10b8:	206f 0050      	movea.l 80(sp),a0
    10bc:	41f0 082c      	lea (44,a0,d0.l),a0
    10c0:	2f48 003c      	move.l a0,60(sp)
    10c4:	702c           	moveq #44,d0
    10c6:	d0af 0054      	add.l 84(sp),d0
    10ca:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    10ce:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    10d2:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    10d8:	70ed           	moveq #-19,d0
    10da:	9042           	sub.w d2,d0
    10dc:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    10e0:	2841           	movea.l d1,a4
    10e2:	6000 fccc      	bra.w db0 <Zoom_ZoomIntoPicture+0xf6>

000010e6 <Init_Blit>:
  hw->bltafwm = 0xffff;
    10e6:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
    10ec:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    10f2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    10f8:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    10fe:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1104:	317c 002c 0066 	move.w #44,102(a0)
}
    110a:	4e75           	rts

0000110c <ClbuildZoom>:
ULONG * ClbuildZoom() {
    110c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1110:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1116:	203c 0000 591c 	move.l #22812,d0
    111c:	7202           	moveq #2,d1
    111e:	4eae ff3a      	jsr -198(a6)
    1122:	2440           	movea.l d0,a2
  if( retval == 0) {
    1124:	4a80           	tst.l d0
    1126:	6700 01ee      	beq.w 1316 <ClbuildZoom+0x20a>
    *cl++ = *clpartinstruction++;
    112a:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
    1130:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
    1136:	0004 
    1138:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
    113e:	0008 
    1140:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
    1146:	000c 
    1148:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
    114e:	0010 
    1150:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
    1156:	0014 
    1158:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
    115e:	0018 
    1160:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
    1166:	001c 
    1168:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
    116e:	0020 
    1170:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
    1176:	0024 
    1178:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
    117e:	0028 
    1180:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
    1186:	002c 
    1188:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
    118e:	0030 
    1190:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
    1196:	0034 
    1198:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
    119e:	0038 
    11a0:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
    11a6:	003c 
    *cl++ = *clpartinstruction++;
    11a8:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
    11ae:	0040 
    11b0:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
    11b6:	0044 
    11b8:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
    11be:	0048 
    11c0:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
    11c6:	004c 
    11c8:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
    11ce:	0050 
    11d0:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
    11d6:	0054 
    11d8:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
    11de:	0058 
    11e0:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
    11e6:	005c 
    11e8:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
    11ee:	0060 
    11f0:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
    11f6:	0064 
    11f8:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
    11fe:	0068 
    1200:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
    1206:	006c 
  *cl++ = 0x00e00000;
    1208:	257c 00e0 0000 	move.l #14680064,112(a2)
    120e:	0070 
  *cl++ = 0x00e20000;
    1210:	257c 00e2 0000 	move.l #14811136,116(a2)
    1216:	0074 
  *cl++ = 0x00e40000;
    1218:	257c 00e4 0000 	move.l #14942208,120(a2)
    121e:	0078 
  *cl++ = 0x00e60000;
    1220:	257c 00e6 0000 	move.l #15073280,124(a2)
    1226:	007c 
  *cl++ = 0x00e80000;
    1228:	257c 00e8 0000 	move.l #15204352,128(a2)
    122e:	0080 
  *cl++ = 0x00ea0000;
    1230:	257c 00ea 0000 	move.l #15335424,132(a2)
    1236:	0084 
  *cl++ = 0x00ec0000;
    1238:	257c 00ec 0000 	move.l #15466496,136(a2)
    123e:	0088 
  *cl++ = 0x00ee0000;
    1240:	257c 00ee 0000 	move.l #15597568,140(a2)
    1246:	008c 
  *cl++ = 0x00f00000;
    1248:	257c 00f0 0000 	move.l #15728640,144(a2)
    124e:	0090 
  *cl++ = 0x00f20000;
    1250:	257c 00f2 0000 	move.l #15859712,148(a2)
    1256:	0094 
  for(int i=0; i<32;i++)
    1258:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    125c:	41f9 0001 7340 	lea 17340 <ClColor>,a0
    *cl++ = *clpartinstruction++;
    1262:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1264:	b1fc 0001 73c0 	cmpa.l #95168,a0
    126a:	66f6           	bne.s 1262 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
    126c:	200a           	move.l a2,d0
    126e:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1274:	2200           	move.l d0,d1
    1276:	4241           	clr.w d1
    1278:	4841           	swap d1
    127a:	0681 0084 0000 	addi.l #8650752,d1
    1280:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    1284:	2200           	move.l d0,d1
    1286:	0281 0000 ffff 	andi.l #65535,d1
    128c:	0681 0086 0000 	addi.l #8781824,d1
    1292:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
    1296:	257c 2c01 ff00 	move.l #738328320,288(a2)
    129c:	0120 
  ULONG cop2br1 = cop2 + ( (33)<<2);
    129e:	2200           	move.l d0,d1
    12a0:	0681 0000 0084 	addi.l #132,d1
  clpartinstruction[31] = 0x00840000 + ( cop2br1 >> 16);
    12a6:	2401           	move.l d1,d2
    12a8:	4242           	clr.w d2
    12aa:	4842           	swap d2
    12ac:	0682 0084 0000 	addi.l #8650752,d2
    12b2:	23c2 0001 607c 	move.l d2,1607c <Cl102ZoomRepeat+0x7c>
  clpartinstruction[32] = 0x00860000 + ( cop2br1 & 0xffff);
    12b8:	0281 0000 ffff 	andi.l #65535,d1
    12be:	0681 0086 0000 	addi.l #8781824,d1
    12c4:	23c1 0001 6080 	move.l d1,16080 <Cl102ZoomRepeat+0x80>
  clpartinstruction[93] = 0x00840000 + ( cop2br2 >> 16);
    12ca:	220a           	move.l a2,d1
    12cc:	0681 0000 02a0 	addi.l #672,d1
    12d2:	2401           	move.l d1,d2
    12d4:	4242           	clr.w d2
    12d6:	4842           	swap d2
    12d8:	0682 0084 0000 	addi.l #8650752,d2
    12de:	23c2 0001 6174 	move.l d2,16174 <Cl102ZoomRepeat+0x174>
  clpartinstruction[94] = 0x00860000 + ( cop2br2 & 0xffff);
    12e4:	0281 0000 ffff 	andi.l #65535,d1
    12ea:	0681 0086 0000 	addi.l #8781824,d1
    12f0:	23c1 0001 6178 	move.l d1,16178 <Cl102ZoomRepeat+0x178>
  for(int i=0;i<26+27+27+26+27+1-8;i++)
    12f6:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
    12f8:	41f9 0001 6000 	lea 16000 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
    12fe:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8;i++)
    1300:	b1fc 0001 61f8 	cmpa.l #90616,a0
    1306:	66f6           	bne.s 12fe <ClbuildZoom+0x1f2>
   *cl++ = 0xfffffffe;
    1308:	70fe           	moveq #-2,d0
    130a:	2540 031c      	move.l d0,796(a2)
}
    130e:	200a           	move.l a2,d0
    1310:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1314:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1316:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    131c:	4eae ffc4      	jsr -60(a6)
    1320:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1326:	2200           	move.l d0,d1
    1328:	243c 0001 4c27 	move.l #85031,d2
    132e:	7628           	moveq #40,d3
    1330:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1334:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    133a:	7201           	moveq #1,d1
    133c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    1340:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
    1346:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
    134c:	0004 
    134e:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
    1354:	0008 
    1356:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
    135c:	000c 
    135e:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
    1364:	0010 
    1366:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
    136c:	0014 
    136e:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
    1374:	0018 
    1376:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
    137c:	001c 
    137e:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
    1384:	0020 
    1386:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
    138c:	0024 
    138e:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
    1394:	0028 
    1396:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
    139c:	002c 
    139e:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
    13a4:	0030 
    13a6:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
    13ac:	0034 
    13ae:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
    13b4:	0038 
    13b6:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
    13bc:	003c 
    *cl++ = *clpartinstruction++;
    13be:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
    13c4:	0040 
    13c6:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
    13cc:	0044 
    13ce:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
    13d4:	0048 
    13d6:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
    13dc:	004c 
    13de:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
    13e4:	0050 
    13e6:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
    13ec:	0054 
    13ee:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
    13f4:	0058 
    13f6:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
    13fc:	005c 
    13fe:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
    1404:	0060 
    1406:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
    140c:	0064 
    140e:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
    1414:	0068 
    1416:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
    141c:	006c 
  *cl++ = 0x00e00000;
    141e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1424:	0070 
  *cl++ = 0x00e20000;
    1426:	257c 00e2 0000 	move.l #14811136,116(a2)
    142c:	0074 
  *cl++ = 0x00e40000;
    142e:	257c 00e4 0000 	move.l #14942208,120(a2)
    1434:	0078 
  *cl++ = 0x00e60000;
    1436:	257c 00e6 0000 	move.l #15073280,124(a2)
    143c:	007c 
  *cl++ = 0x00e80000;
    143e:	257c 00e8 0000 	move.l #15204352,128(a2)
    1444:	0080 
  *cl++ = 0x00ea0000;
    1446:	257c 00ea 0000 	move.l #15335424,132(a2)
    144c:	0084 
  *cl++ = 0x00ec0000;
    144e:	257c 00ec 0000 	move.l #15466496,136(a2)
    1454:	0088 
  *cl++ = 0x00ee0000;
    1456:	257c 00ee 0000 	move.l #15597568,140(a2)
    145c:	008c 
  *cl++ = 0x00f00000;
    145e:	257c 00f0 0000 	move.l #15728640,144(a2)
    1464:	0090 
  *cl++ = 0x00f20000;
    1466:	257c 00f2 0000 	move.l #15859712,148(a2)
    146c:	0094 
  for(int i=0; i<32;i++)
    146e:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    1472:	41f9 0001 7340 	lea 17340 <ClColor>,a0
    1478:	6000 fde8      	bra.w 1262 <ClbuildZoom+0x156>

0000147c <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    147c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1480:	45fa fc8a      	lea 110c <ClbuildZoom>(pc),a2
    1484:	4e92           	jsr (a2)
    1486:	23c0 0001 779a 	move.l d0,1779a <Copperlist1>
  Copperlist2 = ClbuildZoom();
    148c:	4e92           	jsr (a2)
    148e:	23c0 0001 778a 	move.l d0,1778a <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1494:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    149a:	203c 0001 6800 	move.l #92160,d0
    14a0:	7202           	moveq #2,d1
    14a2:	4eae ff3a      	jsr -198(a6)
    14a6:	23c0 0001 7786 	move.l d0,17786 <Bitplane1>
  if(Bitplane1 == 0) {
    14ac:	6700 008c      	beq.w 153a <PrepareDisplayZoom+0xbe>
  DrawBuffer = Bitplane1;
    14b0:	23c0 0001 77a0 	move.l d0,177a0 <DrawBuffer>
  DrawCopper = Copperlist1;
    14b6:	23f9 0001 779a 	move.l 1779a <Copperlist1>,17790 <DrawCopper>
    14bc:	0001 7790 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    14c0:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    14c6:	203c 0001 6800 	move.l #92160,d0
    14cc:	7202           	moveq #2,d1
    14ce:	4eae ff3a      	jsr -198(a6)
    14d2:	23c0 0001 7782 	move.l d0,17782 <Bitplane2>
  if(Bitplane2 == 0) {
    14d8:	6718           	beq.s 14f2 <PrepareDisplayZoom+0x76>
  ViewBuffer = Bitplane2;
    14da:	23c0 0001 7796 	move.l d0,17796 <ViewBuffer>
  ViewCopper = Copperlist2;
    14e0:	23f9 0001 778a 	move.l 1778a <Copperlist2>,1777e <ViewCopper>
    14e6:	0001 777e 
}
    14ea:	7000           	moveq #0,d0
    14ec:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    14f0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    14f2:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    14f8:	4eae ffc4      	jsr -60(a6)
    14fc:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1502:	2200           	move.l d0,d1
    1504:	243c 0001 4c74 	move.l #85108,d2
    150a:	7626           	moveq #38,d3
    150c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1510:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1516:	7201           	moveq #1,d1
    1518:	4eae ff70      	jsr -144(a6)
    151c:	2039 0001 7782 	move.l 17782 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1522:	23c0 0001 7796 	move.l d0,17796 <ViewBuffer>
  ViewCopper = Copperlist2;
    1528:	23f9 0001 778a 	move.l 1778a <Copperlist2>,1777e <ViewCopper>
    152e:	0001 777e 
}
    1532:	7000           	moveq #0,d0
    1534:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1538:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    153a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1540:	4eae ffc4      	jsr -60(a6)
    1544:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    154a:	2200           	move.l d0,d1
    154c:	243c 0001 4c4d 	move.l #85069,d2
    1552:	7626           	moveq #38,d3
    1554:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1558:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    155e:	7201           	moveq #1,d1
    1560:	4eae ff70      	jsr -144(a6)
    1564:	2039 0001 7786 	move.l 17786 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    156a:	23c0 0001 77a0 	move.l d0,177a0 <DrawBuffer>
  DrawCopper = Copperlist1;
    1570:	23f9 0001 779a 	move.l 1779a <Copperlist1>,17790 <DrawCopper>
    1576:	0001 7790 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    157a:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1580:	203c 0001 6800 	move.l #92160,d0
    1586:	7202           	moveq #2,d1
    1588:	4eae ff3a      	jsr -198(a6)
    158c:	23c0 0001 7782 	move.l d0,17782 <Bitplane2>
  if(Bitplane2 == 0) {
    1592:	6600 ff46      	bne.w 14da <PrepareDisplayZoom+0x5e>
    1596:	6000 ff5a      	bra.w 14f2 <PrepareDisplayZoom+0x76>

0000159a <Zoom_Init>:
void Zoom_Init() {
    159a:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    159c:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    15a2:	7004           	moveq #4,d0
    15a4:	7202           	moveq #2,d1
    15a6:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    15aa:	33fc 0010 0001 	move.w #16,1778e <ZoomHorizontal>
    15b0:	778e 
  Zoom_LevelOf102Zoom = 15;
    15b2:	33fc 000f 0001 	move.w #15,17794 <Zoom_LevelOf102Zoom>
    15b8:	7794 
}
    15ba:	2c5f           	movea.l (sp)+,a6
    15bc:	4e75           	rts

000015be <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
    15be:	206f 0004      	movea.l 4(sp),a0
    15c2:	226f 0008      	movea.l 8(sp),a1
  for(int i = 0; i<6;i++) {
    *copperlist = *values4shift++;
    15c6:	3091           	move.w (a1),(a0)
    15c8:	3169 0002 0004 	move.w 2(a1),4(a0)
    15ce:	3169 0004 0008 	move.w 4(a1),8(a0)
    15d4:	3169 0006 000c 	move.w 6(a1),12(a0)
    15da:	3169 0008 0010 	move.w 8(a1),16(a0)
    15e0:	3169 000a 0014 	move.w 10(a1),20(a0)
    copperlist += 2;
  }
  copperlist--;
  *copperlist++ = *values4shift++;
    15e6:	3169 000c 0016 	move.w 12(a1),22(a0)
  *copperlist = *values4shift++;
    15ec:	3169 000e 0018 	move.w 14(a1),24(a0)
  copperlist += 2;
  for(int i = 0; i<10;i++) {
    *copperlist = *values4shift++;
    15f2:	3169 0010 001c 	move.w 16(a1),28(a0)
    15f8:	3169 0012 0020 	move.w 18(a1),32(a0)
    15fe:	3169 0014 0024 	move.w 20(a1),36(a0)
    1604:	3169 0016 0028 	move.w 22(a1),40(a0)
    160a:	3169 0018 002c 	move.w 24(a1),44(a0)
    1610:	3169 001a 0030 	move.w 26(a1),48(a0)
    1616:	3169 001c 0034 	move.w 28(a1),52(a0)
    161c:	3169 001e 0038 	move.w 30(a1),56(a0)
    1622:	3169 0020 003c 	move.w 32(a1),60(a0)
    1628:	3169 0022 0040 	move.w 34(a1),64(a0)
    copperlist += 2;
  }
  copperlist--;
  *copperlist++ = *values4shift++;
    162e:	3169 0024 0042 	move.w 36(a1),66(a0)
  *copperlist = *values4shift++;
    1634:	3169 0026 0044 	move.w 38(a1),68(a0)
  copperlist += 2;
  for(int i = 0; i<10;i++) {
    *copperlist = *values4shift++;
    163a:	3169 0028 0048 	move.w 40(a1),72(a0)
    1640:	3169 002a 004c 	move.w 42(a1),76(a0)
    1646:	3169 002c 0050 	move.w 44(a1),80(a0)
    164c:	3169 002e 0054 	move.w 46(a1),84(a0)
    1652:	3169 0030 0058 	move.w 48(a1),88(a0)
    1658:	3169 0032 005c 	move.w 50(a1),92(a0)
    165e:	3169 0034 0060 	move.w 52(a1),96(a0)
    1664:	3169 0036 0064 	move.w 54(a1),100(a0)
    166a:	3169 0038 0068 	move.w 56(a1),104(a0)
    1670:	3169 003a 006c 	move.w 58(a1),108(a0)
    copperlist += 2;
  }
}
    1676:	4e75           	rts

00001678 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1678:	2039 0001 7790 	move.l 17790 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    167e:	23f9 0001 777e 	move.l 1777e <ViewCopper>,17790 <DrawCopper>
    1684:	0001 7790 
  ViewCopper = (ULONG *)tmp;
    1688:	23c0 0001 777e 	move.l d0,1777e <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    168e:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
    1694:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1698:	3140 0088      	move.w d0,136(a0)
}
    169c:	4e75           	rts

0000169e <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    169e:	2039 0001 77a0 	move.l 177a0 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    16a4:	2079 0001 7790 	movea.l 17790 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    16aa:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    16ae:	2200           	move.l d0,d1
    16b0:	4241           	clr.w d1
    16b2:	4841           	swap d1
    16b4:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    16b8:	23f9 0001 7796 	move.l 17796 <ViewBuffer>,177a0 <DrawBuffer>
    16be:	0001 77a0 
  ViewBuffer = (ULONG *) tmp;
    16c2:	23c0 0001 7796 	move.l d0,17796 <ViewBuffer>
}
    16c8:	4e75           	rts

000016ca <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    16ca:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    16ce:	262f 0010      	move.l 16(sp),d3
    16d2:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    16d6:	2279 0001 779a 	movea.l 1779a <Copperlist1>,a1
    16dc:	b2fc 0000      	cmpa.w #0,a1
    16e0:	670c           	beq.s 16ee <FreeDisplay+0x24>
    16e2:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    16e8:	2003           	move.l d3,d0
    16ea:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    16ee:	2279 0001 778a 	movea.l 1778a <Copperlist2>,a1
    16f4:	b2fc 0000      	cmpa.w #0,a1
    16f8:	670c           	beq.s 1706 <FreeDisplay+0x3c>
    16fa:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1700:	2003           	move.l d3,d0
    1702:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1706:	2279 0001 7786 	movea.l 17786 <Bitplane1>,a1
    170c:	b2fc 0000      	cmpa.w #0,a1
    1710:	670c           	beq.s 171e <FreeDisplay+0x54>
    1712:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1718:	2002           	move.l d2,d0
    171a:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    171e:	2279 0001 7782 	movea.l 17782 <Bitplane2>,a1
    1724:	b2fc 0000      	cmpa.w #0,a1
    1728:	670c           	beq.s 1736 <FreeDisplay+0x6c>
    172a:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1730:	2002           	move.l d2,d0
    1732:	4eae ff2e      	jsr -210(a6)
}
    1736:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    173a:	4e75           	rts

0000173c <WaitVbl>:
void WaitVbl() {
    173c:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    173e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd703a>,d0
    1744:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1746:	2017           	move.l (sp),d0
    1748:	0280 0001 ff00 	andi.l #130816,d0
    174e:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1750:	2017           	move.l (sp),d0
    1752:	0c80 0001 3700 	cmpi.l #79616,d0
    1758:	67e4           	beq.s 173e <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    175a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd703a>,d0
    1760:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1764:	202f 0004      	move.l 4(sp),d0
    1768:	0280 0001 ff00 	andi.l #130816,d0
    176e:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1772:	202f 0004      	move.l 4(sp),d0
    1776:	0c80 0001 3700 	cmpi.l #79616,d0
    177c:	66dc           	bne.s 175a <WaitVbl+0x1e>
}
    177e:	508f           	addq.l #8,sp
    1780:	4e75           	rts

00001782 <ZoomTest>:
void ZoomTest() {
    1782:	4fef ff50      	lea -176(sp),sp
    1786:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    178a:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
    1790:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1796:	42b9 0001 77b0 	clr.l 177b0 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    179c:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    17a2:	7016           	moveq #22,d0
    17a4:	223c 0001 0001 	move.l #65537,d1
    17aa:	4eae ff3a      	jsr -198(a6)
    17ae:	2440           	movea.l d0,a2
    17b0:	4a80           	tst.l d0
    17b2:	671a           	beq.s 17ce <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    17b4:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    17ba:	257c 0001 4c9b 	move.l #85147,10(a2)
    17c0:	000a 
    vbint->is_Data = NULL;
    17c2:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    17c6:	257c 0000 09f6 	move.l #2550,18(a2)
    17cc:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    17ce:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    17d4:	203c 0001 1440 	move.l #70720,d0
    17da:	7202           	moveq #2,d1
    17dc:	4eae ff3a      	jsr -198(a6)
    17e0:	2800           	move.l d0,d4
  if( source == 0) {
    17e2:	6700 2a18      	beq.w 41fc <ZoomTest+0x2a7a>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    17e6:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    17ec:	203c 0001 1440 	move.l #70720,d0
    17f2:	7202           	moveq #2,d1
    17f4:	4eae ff3a      	jsr -198(a6)
    17f8:	2a00           	move.l d0,d5
  if( destination == 0) {
    17fa:	6700 2a4a      	beq.w 4246 <ZoomTest+0x2ac4>
    17fe:	2004           	move.l d4,d0
    1800:	0680 0000 3300 	addi.l #13056,d0
    1806:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    1808:	20bc 5555 5555 	move.l #1431655765,(a0)
    180e:	217c 5555 5555 	move.l #1431655765,4(a0)
    1814:	0004 
    1816:	217c 5555 5555 	move.l #1431655765,8(a0)
    181c:	0008 
    181e:	217c 5555 5555 	move.l #1431655765,12(a0)
    1824:	000c 
    1826:	217c 5555 5555 	move.l #1431655765,16(a0)
    182c:	0010 
    182e:	217c 5555 5555 	move.l #1431655765,20(a0)
    1834:	0014 
    1836:	217c 5555 5555 	move.l #1431655765,24(a0)
    183c:	0018 
    183e:	217c 5555 5555 	move.l #1431655765,28(a0)
    1844:	001c 
    1846:	217c 5555 5555 	move.l #1431655765,32(a0)
    184c:	0020 
    184e:	217c 5555 5555 	move.l #1431655765,36(a0)
    1854:	0024 
    1856:	217c 5555 5555 	move.l #1431655765,40(a0)
    185c:	0028 
    185e:	217c 5555 5555 	move.l #1431655765,44(a0)
    1864:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1866:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    186c:	0030 
    186e:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1874:	0034 
    1876:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    187c:	0038 
    187e:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1884:	003c 
    1886:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    188c:	0040 
    188e:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1894:	0044 
    1896:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    189c:	0048 
    189e:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    18a4:	004c 
    18a6:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    18ac:	0050 
    18ae:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    18b4:	0054 
    18b6:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    18bc:	0058 
    18be:	41e8 0060      	lea 96(a0),a0
    18c2:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    18c8:	fffc 
  for(int i=0;i<128+8;i++) {
    18ca:	b1c0           	cmpa.l d0,a0
    18cc:	6600 ff3a      	bne.w 1808 <ZoomTest+0x86>
  WaitVbl();
    18d0:	4eba fe6a      	jsr 173c <WaitVbl>(pc)
  Init_Blit();
    18d4:	4eba f810      	jsr 10e6 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    18d8:	33fc 0001 0001 	move.w #1,1779e <ZoomBlit_Increment4SrcA>
    18de:	779e 
  WaitBlit(); 
    18e0:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    18e6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    18ea:	2079 0001 77a8 	movea.l 177a8 <hw>,a0
    18f0:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    18f6:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    18fc:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1902:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1908:	7005           	moveq #5,d0
    190a:	224a           	movea.l a2,a1
    190c:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1910:	4878 0005      	pea 5 <_start+0x5>
    1914:	42a7           	clr.l -(sp)
    1916:	2f05           	move.l d5,-(sp)
    1918:	2f04           	move.l d4,-(sp)
    191a:	4eba f39e      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    191e:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1924:	7005           	moveq #5,d0
    1926:	224a           	movea.l a2,a1
    1928:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 7)
    192c:	4fef 0010      	lea 16(sp),sp
    1930:	7007           	moveq #7,d0
    1932:	b0b9 0001 77b0 	cmp.l 177b0 <Counter4Frames>,d0
    1938:	6c1e           	bge.s 1958 <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    193a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1940:	4eae ffc4      	jsr -60(a6)
    1944:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    194a:	2200           	move.l d0,d1
    194c:	243c 0001 4d1c 	move.l #85276,d2
    1952:	761f           	moveq #31,d3
    1954:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1958:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    195e:	2244           	movea.l d4,a1
    1960:	203c 0001 1440 	move.l #70720,d0
    1966:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    196a:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1970:	2245           	movea.l d5,a1
    1972:	203c 0001 1440 	move.l #70720,d0
    1978:	4eae ff2e      	jsr -210(a6)
  Zoom_Init();
    197c:	47fa fc1c      	lea 159a <Zoom_Init>(pc),a3
    1980:	4e93           	jsr (a3)
  PrepareDisplayZoom();
    1982:	49fa faf8      	lea 147c <PrepareDisplayZoom>(pc),a4
    1986:	4e94           	jsr (a4)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1988:	4878 0010      	pea 10 <main+0xa>
    198c:	4879 0001 73f0 	pea 173f0 <ClsSprites>
    1992:	42a7           	clr.l -(sp)
    1994:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    199a:	45fa f080      	lea a1c <TestCopperlistBatch>(pc),a2
    199e:	4e92           	jsr (a2)
    19a0:	4fef 0010      	lea 16(sp),sp
    19a4:	4a80           	tst.l d0
    19a6:	661e           	bne.s 19c6 <ZoomTest+0x244>
    Write( Output(), 
    19a8:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    19ae:	4eae ffc4      	jsr -60(a6)
    19b2:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    19b8:	2200           	move.l d0,d1
    19ba:	243c 0001 4d3c 	move.l #85308,d2
    19c0:	7645           	moveq #69,d3
    19c2:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    19c6:	4878 000c      	pea c <main+0x6>
    19ca:	4879 0001 73c0 	pea 173c0 <ClScreen>
    19d0:	4878 0010      	pea 10 <main+0xa>
    19d4:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    19da:	4e92           	jsr (a2)
    19dc:	4fef 0010      	lea 16(sp),sp
    19e0:	4a80           	tst.l d0
    19e2:	661e           	bne.s 1a02 <ZoomTest+0x280>
    Write( Output(), 
    19e4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    19ea:	4eae ffc4      	jsr -60(a6)
    19ee:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    19f4:	2200           	move.l d0,d1
    19f6:	243c 0001 4d82 	move.l #85378,d2
    19fc:	7646           	moveq #70,d3
    19fe:	4eae ffd0      	jsr -48(a6)

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer+( 8 - (Zoom_LevelOf102Zoom/2))
    1a02:	3239 0001 7794 	move.w 17794 <Zoom_LevelOf102Zoom>,d1
    1a08:	e249           	lsr.w #1,d1
    1a0a:	0281 0000 ffff 	andi.l #65535,d1
    1a10:	7008           	moveq #8,d0
    1a12:	9081           	sub.l d1,d0
    1a14:	2200           	move.l d0,d1
    1a16:	e988           	lsl.l #4,d0
    1a18:	9081           	sub.l d1,d0
    1a1a:	e988           	lsl.l #4,d0
    1a1c:	2040           	movea.l d0,a0
    1a1e:	d1fc 0004 0000 	adda.l #262144,a0
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
    1a24:	2279 0001 7790 	movea.l 17790 <DrawCopper>,a1
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    1a2a:	2008           	move.l a0,d0
    1a2c:	4240           	clr.w d0
    1a2e:	4840           	swap d0
    1a30:	3340 0072      	move.w d0,114(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1a34:	3348 0076      	move.w a0,118(a1)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1a38:	7030           	moveq #48,d0
    1a3a:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1a3c:	2200           	move.l d0,d1
    1a3e:	4241           	clr.w d1
    1a40:	4841           	swap d1
    1a42:	3341 007a      	move.w d1,122(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1a46:	3340 007e      	move.w d0,126(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1a4a:	7060           	moveq #96,d0
    1a4c:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1a4e:	2200           	move.l d0,d1
    1a50:	4241           	clr.w d1
    1a52:	4841           	swap d1
    1a54:	3341 0082      	move.w d1,130(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1a58:	3340 0086      	move.w d0,134(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1a5c:	2008           	move.l a0,d0
    1a5e:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1a64:	2200           	move.l d0,d1
    1a66:	4241           	clr.w d1
    1a68:	4841           	swap d1
    1a6a:	3341 008a      	move.w d1,138(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1a6e:	3340 008e      	move.w d0,142(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1a72:	41e8 00c0      	lea 192(a0),a0
    UWORD highword = (ULONG)plane2set >> 16;
    1a76:	2008           	move.l a0,d0
    1a78:	4240           	clr.w d0
    1a7a:	4840           	swap d0
    1a7c:	3340 0092      	move.w d0,146(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1a80:	3348 0096      	move.w a0,150(a1)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
    1a84:	23fc 0005 0000 	move.l #327680,177a0 <DrawBuffer>
    1a8a:	0001 77a0 
  ViewBuffer = (ULONG *) tmp;
    1a8e:	23fc 0004 0000 	move.l #262144,17796 <ViewBuffer>
    1a94:	0001 7796 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1a98:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1a9e:	4878 001c      	pea 1c <main+0x16>
    1aa2:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    1aa8:	283c 0000 09fe 	move.l #2558,d4
    1aae:	2044           	movea.l d4,a0
    1ab0:	4e90           	jsr (a0)
    1ab2:	4fef 000c      	lea 12(sp),sp
    1ab6:	4a80           	tst.l d0
    1ab8:	661e           	bne.s 1ad8 <ZoomTest+0x356>
    Write(Output(), 
    1aba:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1ac0:	4eae ffc4      	jsr -60(a6)
    1ac4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1aca:	2200           	move.l d0,d1
    1acc:	243c 0001 4dc9 	move.l #85449,d2
    1ad2:	763c           	moveq #60,d3
    1ad4:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f0) == 0)
    1ad8:	2f3c 00e2 00f0 	move.l #14811376,-(sp)
    1ade:	4878 001d      	pea 1d <main+0x17>
    1ae2:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    1ae8:	2044           	movea.l d4,a0
    1aea:	4e90           	jsr (a0)
    1aec:	4fef 000c      	lea 12(sp),sp
    1af0:	4a80           	tst.l d0
    1af2:	661e           	bne.s 1b12 <ZoomTest+0x390>
    Write(Output(), 
    1af4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1afa:	4eae ffc4      	jsr -60(a6)
    1afe:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1b04:	2200           	move.l d0,d1
    1b06:	243c 0001 4e06 	move.l #85510,d2
    1b0c:	763c           	moveq #60,d3
    1b0e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1b12:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1b18:	4878 001e      	pea 1e <main+0x18>
    1b1c:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    1b22:	2044           	movea.l d4,a0
    1b24:	4e90           	jsr (a0)
    1b26:	4fef 000c      	lea 12(sp),sp
    1b2a:	4a80           	tst.l d0
    1b2c:	661e           	bne.s 1b4c <ZoomTest+0x3ca>
    Write(Output(), 
    1b2e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1b34:	4eae ffc4      	jsr -60(a6)
    1b38:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1b3e:	2200           	move.l d0,d1
    1b40:	243c 0001 4e43 	move.l #85571,d2
    1b46:	763c           	moveq #60,d3
    1b48:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60120) == 0)
    1b4c:	2f3c 00e6 0120 	move.l #15073568,-(sp)
    1b52:	4878 001f      	pea 1f <main+0x19>
    1b56:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    1b5c:	2044           	movea.l d4,a0
    1b5e:	4e90           	jsr (a0)
    1b60:	4fef 000c      	lea 12(sp),sp
    1b64:	4a80           	tst.l d0
    1b66:	661e           	bne.s 1b86 <ZoomTest+0x404>
    Write(Output(), 
    1b68:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1b6e:	4eae ffc4      	jsr -60(a6)
    1b72:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1b78:	2200           	move.l d0,d1
    1b7a:	243c 0001 4e80 	move.l #85632,d2
    1b80:	763c           	moveq #60,d3
    1b82:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    1b86:	4878 0020      	pea 20 <main+0x1a>
    1b8a:	4879 0001 7340 	pea 17340 <ClColor>
    1b90:	4878 0026      	pea 26 <main+0x20>
    1b94:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    1b9a:	4e92           	jsr (a2)
    1b9c:	4fef 0010      	lea 16(sp),sp
    1ba0:	4a80           	tst.l d0
    1ba2:	661e           	bne.s 1bc2 <ZoomTest+0x440>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    1ba4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1baa:	4eae ffc4      	jsr -60(a6)
    1bae:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1bb4:	2200           	move.l d0,d1
    1bb6:	243c 0001 4ebd 	move.l #85693,d2
    1bbc:	7625           	moveq #37,d3
    1bbe:	4eae ffd0      	jsr -48(a6)
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    1bc2:	2a79 0001 779a 	movea.l 1779a <Copperlist1>,a5

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
  UWORD *values4shift = Values4Shift+levelofshrink*120;
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
    1bc8:	4879 0001 702c 	pea 1702c <Values4Shift+0xe10>
    1bce:	486d 012a      	pea 298(a5)
    1bd2:	4dfa f9ea      	lea 15be <Zoom_InsertShift>(pc),a6
    1bd6:	4e96           	jsr (a6)
  Zoom_InsertShift( copperlist+69+73*2, values4shift+30);
    1bd8:	4879 0001 7068 	pea 17068 <Values4Shift+0xe4c>
    1bde:	486d 01ae      	pea 430(a5)
    1be2:	4e96           	jsr (a6)
  Zoom_InsertShift( copperlist+131+73*2, values4shift+60);
    1be4:	4879 0001 70a4 	pea 170a4 <Values4Shift+0xe88>
    1bea:	486d 022a      	pea 554(a5)
    1bee:	4e96           	jsr (a6)
  Zoom_InsertShift( copperlist+193+73*2, values4shift+90);
    1bf0:	4879 0001 70e0 	pea 170e0 <Values4Shift+0xec4>
    1bf6:	486d 02a6      	pea 678(a5)
    1bfa:	4e96           	jsr (a6)
  if( TestCopperlistBatch( cl2test, position, template4cl, 31) == 0)
    1bfc:	4fef 0020      	lea 32(sp),sp
    1c00:	4878 001f      	pea 1f <main+0x19>
    1c04:	4879 0001 711c 	pea 1711c <Cl102ZoomTest>
    1c0a:	4878 0049      	pea 49 <main+0x43>
    1c0e:	2f0d           	move.l a5,-(sp)
    1c10:	4e92           	jsr (a2)
    1c12:	4fef 0010      	lea 16(sp),sp
    1c16:	4a80           	tst.l d0
    1c18:	6600 24d0      	bne.w 40ea <ZoomTest+0x2968>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    1c1c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1c22:	4eae ffc4      	jsr -60(a6)
    1c26:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1c2c:	2200           	move.l d0,d1
    1c2e:	243c 0001 4ee3 	move.l #85731,d2
    1c34:	7625           	moveq #37,d3
    1c36:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 73+126, 0xfffffffe) == 0)
    1c3a:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd8034>
    1c3e:	4878 00c7      	pea c7 <main+0xc1>
    1c42:	2f39 0001 779a 	move.l 1779a <Copperlist1>,-(sp)
    1c48:	2044           	movea.l d4,a0
    1c4a:	4e90           	jsr (a0)
    1c4c:	4fef 000c      	lea 12(sp),sp
    1c50:	4a80           	tst.l d0
    1c52:	661e           	bne.s 1c72 <ZoomTest+0x4f0>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    1c54:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1c5a:	4eae ffc4      	jsr -60(a6)
    1c5e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1c64:	2200           	move.l d0,d1
    1c66:	243c 0001 4f08 	move.l #85768,d2
    1c6c:	7632           	moveq #50,d3
    1c6e:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1c72:	2f3c 0001 6800 	move.l #92160,-(sp)
    1c78:	4878 591c      	pea 591c <incbin_startimage_start+0xc4c>
    1c7c:	4bfa fa4c      	lea 16ca <FreeDisplay>(pc),a5
    1c80:	4e95           	jsr (a5)
  Zoom_Init();
    1c82:	4e93           	jsr (a3)
  PrepareDisplayZoom();
    1c84:	4e94           	jsr (a4)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1c86:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1c8c:	203c 0000 c800 	move.l #51200,d0
    1c92:	7202           	moveq #2,d1
    1c94:	4eae ff3a      	jsr -198(a6)
    1c98:	2040           	movea.l d0,a0
    1c9a:	23c0 0001 77a4 	move.l d0,177a4 <Zoom_Source>
  if( Zoom_Source == 0) {
    1ca0:	508f           	addq.l #8,sp
    1ca2:	6700 2536      	beq.w 41da <ZoomTest+0x2a58>
  *tstsource++ = 0x0000;
    1ca6:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1ca8:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1cae:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1cb4:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1cba:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1cbe:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1cc4:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    1cca:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1cce:	4eba f416      	jsr 10e6 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1cd2:	33fc 0001 0001 	move.w #1,1779e <ZoomBlit_Increment4SrcA>
    1cd8:	779e 
  WaitBlit(); 
    1cda:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    1ce0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1ce4:	2479 0001 77a8 	movea.l 177a8 <hw>,a2
    1cea:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1cf0:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1cf6:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1cfc:	2639 0001 77a0 	move.l 177a0 <DrawBuffer>,d3
    1d02:	2439 0001 77a4 	move.l 177a4 <Zoom_Source>,d2
  WaitBlt();
    1d08:	4eba ef9a      	jsr ca4 <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1d0c:	7000           	moveq #0,d0
    1d0e:	3039 0001 779e 	move.w 1779e <ZoomBlit_Increment4SrcA>,d0
    1d14:	d080           	add.l d0,d0
    1d16:	d082           	add.l d2,d0
    1d18:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1d1c:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1d20:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1d24:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1d2a:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    1d30:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1d34:	2479 0001 77a0 	movea.l 177a0 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1d3a:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1d40:	671e           	beq.s 1d60 <ZoomTest+0x5de>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1d42:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1d48:	4eae ffc4      	jsr -60(a6)
    1d4c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1d52:	2200           	move.l d0,d1
    1d54:	243c 0001 4f73 	move.l #85875,d2
    1d5a:	761c           	moveq #28,d3
    1d5c:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1d60:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1d66:	671e           	beq.s 1d86 <ZoomTest+0x604>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1d68:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1d6e:	4eae ffc4      	jsr -60(a6)
    1d72:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1d78:	2200           	move.l d0,d1
    1d7a:	243c 0001 4f90 	move.l #85904,d2
    1d80:	761c           	moveq #28,d3
    1d82:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1d86:	2079 0001 77a0 	movea.l 177a0 <DrawBuffer>,a0
    1d8c:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1d92:	671e           	beq.s 1db2 <ZoomTest+0x630>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1d94:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1d9a:	4eae ffc4      	jsr -60(a6)
    1d9e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1da4:	2200           	move.l d0,d1
    1da6:	243c 0001 4fad 	move.l #85933,d2
    1dac:	761a           	moveq #26,d3
    1dae:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    1db2:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1db8:	2279 0001 77a4 	movea.l 177a4 <Zoom_Source>,a1
    1dbe:	203c 0000 c800 	move.l #51200,d0
    1dc4:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    1dc8:	2f3c 0001 6800 	move.l #92160,-(sp)
    1dce:	4878 591c      	pea 591c <incbin_startimage_start+0xc4c>
    1dd2:	4e95           	jsr (a5)
    1dd4:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    1dd6:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1ddc:	203c 0000 05a0 	move.l #1440,d0
    1de2:	7202           	moveq #2,d1
    1de4:	4eae ff3a      	jsr -198(a6)
    1de8:	2440           	movea.l d0,a2
  if( source == 0) {
    1dea:	4a80           	tst.l d0
    1dec:	6700 2356      	beq.w 4144 <ZoomTest+0x29c2>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    1df0:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1df6:	203c 0000 05a0 	move.l #1440,d0
    1dfc:	7202           	moveq #2,d1
    1dfe:	4eae ff3a      	jsr -198(a6)
    1e02:	2840           	movea.l d0,a4
  if( destination == 0) {
    1e04:	4a80           	tst.l d0
    1e06:	6700 233c      	beq.w 4144 <ZoomTest+0x29c2>
    *tmp++ = 0;
    1e0a:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    1e0c:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    1e12:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    1e18:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    1e1c:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    1e20:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    1e26:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    1e2c:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    1e30:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    1e34:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    1e3a:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    1e40:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    1e44:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    1e48:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    1e4e:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    1e54:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    1e58:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    1e5c:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    1e62:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    1e68:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    1e6c:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    1e70:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    1e76:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    1e7c:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    1e80:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    1e84:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    1e8a:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    1e90:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    1e94:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    1e98:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    1e9e:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    1ea4:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    1ea8:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    1eac:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    1eb2:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    1eb8:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    1ebc:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    1ec0:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    1ec6:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    1ecc:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    1ed0:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    1ed4:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    1eda:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    1ee0:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    1ee4:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    1ee8:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    1eee:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    1ef4:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    1ef8:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    1efc:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    1f02:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    1f08:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    1f0c:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    1f10:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    1f16:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    1f1c:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    1f20:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    1f24:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    1f2a:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    1f30:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    1f34:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    1f38:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    1f3e:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    1f44:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    1f48:	4878 05a0      	pea 5a0 <main+0x59a>
    1f4c:	42a7           	clr.l -(sp)
    1f4e:	2f00           	move.l d0,-(sp)
    1f50:	4eba 23ca      	jsr 431c <memset>(pc)
  WaitBlit();
    1f54:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    1f5a:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    1f5e:	4e93           	jsr (a3)
  WaitBlit();
    1f60:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    1f66:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    1f6a:	2679 0001 77a8 	movea.l 177a8 <hw>,a3
    1f70:	377c 39f0 0040 	move.w #14832,64(a3)
  hw->bltcon1 = 0;
    1f76:	377c 0000 0042 	move.w #0,66(a3)
  WaitBlt();
    1f7c:	4eba ed26      	jsr ca4 <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    1f80:	200a           	move.l a2,d0
    1f82:	5480           	addq.l #2,d0
    1f84:	2740 0050      	move.l d0,80(a3)
  hw->bltdpt = (UWORD *) destination;
    1f88:	274c 0054      	move.l a4,84(a3)
  hw->bltsize = height*64+2;
    1f8c:	377c 0402 0058 	move.w #1026,88(a3)
  WaitBlit();
    1f92:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    1f98:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    1f9c:	4fef 000c      	lea 12(sp),sp
    1fa0:	0c6c 5555 0002 	cmpi.w #21845,2(a4)
    1fa6:	671e           	beq.s 1fc6 <ZoomTest+0x844>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    1fa8:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1fae:	4eae ffc4      	jsr -60(a6)
    1fb2:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1fb8:	2200           	move.l d0,d1
    1fba:	243c 0001 4ffe 	move.l #86014,d2
    1fc0:	761f           	moveq #31,d3
    1fc2:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    1fc6:	0c6c aaaa 0032 	cmpi.w #-21846,50(a4)
    1fcc:	671e           	beq.s 1fec <ZoomTest+0x86a>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    1fce:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1fd4:	4eae ffc4      	jsr -60(a6)
    1fd8:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    1fde:	2200           	move.l d0,d1
    1fe0:	243c 0001 501e 	move.l #86046,d2
    1fe6:	7620           	moveq #32,d3
    1fe8:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    1fec:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    1ff2:	224a           	movea.l a2,a1
    1ff4:	203c 0000 05a0 	move.l #1440,d0
    1ffa:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    1ffe:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    2004:	224c           	movea.l a4,a1
    2006:	203c 0000 05a0 	move.l #1440,d0
    200c:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2010:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    2016:	203c 0000 3740 	move.l #14144,d0
    201c:	7202           	moveq #2,d1
    201e:	4eae ff3a      	jsr -198(a6)
    2022:	2600           	move.l d0,d3
  if( source == 0) {
    2024:	6700 2154      	beq.w 417a <ZoomTest+0x29f8>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2028:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    202e:	203c 0000 3740 	move.l #14144,d0
    2034:	7202           	moveq #2,d1
    2036:	4eae ff3a      	jsr -198(a6)
    203a:	2840           	movea.l d0,a4
  if( destination == 0) {
    203c:	4a80           	tst.l d0
    203e:	6700 2228      	beq.w 4268 <ZoomTest+0x2ae6>
    2042:	2003           	move.l d3,d0
    2044:	0680 0000 3300 	addi.l #13056,d0
    204a:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    204c:	20bc 5555 5555 	move.l #1431655765,(a0)
    2052:	217c 5555 5555 	move.l #1431655765,4(a0)
    2058:	0004 
    205a:	217c 5555 5555 	move.l #1431655765,8(a0)
    2060:	0008 
    2062:	217c 5555 5555 	move.l #1431655765,12(a0)
    2068:	000c 
    206a:	217c 5555 5555 	move.l #1431655765,16(a0)
    2070:	0010 
    2072:	217c 5555 5555 	move.l #1431655765,20(a0)
    2078:	0014 
    207a:	217c 5555 5555 	move.l #1431655765,24(a0)
    2080:	0018 
    2082:	217c 5555 5555 	move.l #1431655765,28(a0)
    2088:	001c 
    208a:	217c 5555 5555 	move.l #1431655765,32(a0)
    2090:	0020 
    2092:	217c 5555 5555 	move.l #1431655765,36(a0)
    2098:	0024 
    209a:	217c 5555 5555 	move.l #1431655765,40(a0)
    20a0:	0028 
    20a2:	217c 5555 5555 	move.l #1431655765,44(a0)
    20a8:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    20aa:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    20b0:	0030 
    20b2:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    20b8:	0034 
    20ba:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    20c0:	0038 
    20c2:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    20c8:	003c 
    20ca:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    20d0:	0040 
    20d2:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    20d8:	0044 
    20da:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    20e0:	0048 
    20e2:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    20e8:	004c 
    20ea:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    20f0:	0050 
    20f2:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    20f8:	0054 
    20fa:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    2100:	0058 
    2102:	41e8 0060      	lea 96(a0),a0
    2106:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    210c:	fffc 
  for(int i=0;i<128+8;i++) {
    210e:	b1c0           	cmpa.l d0,a0
    2110:	6600 ff3a      	bne.w 204c <ZoomTest+0x8ca>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    2114:	4878 0001      	pea 1 <_start+0x1>
    2118:	42a7           	clr.l -(sp)
    211a:	2f0c           	move.l a4,-(sp)
    211c:	2f03           	move.l d3,-(sp)
    211e:	4eba eb9a      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2122:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    2128:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    212c:	41ec 0004      	lea 4(a4),a0
    2130:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    2134:	41ec 0364      	lea 868(a4),a0
    2138:	2f48 0040      	move.l a0,64(sp)
    213c:	2a08           	move.l a0,d5
    213e:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    2142:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    2146:	74ff           	moveq #-1,d2
    2148:	7800           	moveq #0,d4
    214a:	4644           	not.w d4
    214c:	4bfa e792      	lea 8e0 <TestRow>(pc),a5
    2150:	2445           	movea.l d5,a2
    2152:	45ea fca0      	lea -864(a2),a2
    2156:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    215a:	2f0e           	move.l a6,-(sp)
    215c:	2f04           	move.l d4,-(sp)
    215e:	2f0a           	move.l a2,-(sp)
    2160:	4879 0001 771c 	pea 1771c <destlinezoom1>
    2166:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2168:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    216c:	4642           	not.w d2
    216e:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    2170:	4fef 0010      	lea 16(sp),sp
    2174:	ba8a           	cmp.l a2,d5
    2176:	6600 1888      	bne.w 3a00 <ZoomTest+0x227e>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    217a:	2f0b           	move.l a3,-(sp)
    217c:	7800           	moveq #0,d4
    217e:	3802           	move.w d2,d4
    2180:	2f04           	move.l d4,-(sp)
    2182:	2f0a           	move.l a2,-(sp)
    2184:	4879 0001 771c 	pea 1771c <destlinezoom1>
    218a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    218c:	2a0a           	move.l a2,d5
    218e:	0685 0000 0390 	addi.l #912,d5
    2194:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    2198:	4fef 0010      	lea 16(sp),sp
    219c:	b6fc 011c      	cmpa.w #284,a3
    21a0:	66ae           	bne.s 2150 <ZoomTest+0x9ce>
    21a2:	41ec 31e4      	lea 12772(a4),a0
    21a6:	2f48 003c      	move.l a0,60(sp)
    21aa:	2448           	movea.l a0,a2
    21ac:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    21b2:	2f05           	move.l d5,-(sp)
    21b4:	2f04           	move.l d4,-(sp)
    21b6:	2f0a           	move.l a2,-(sp)
    21b8:	4879 0001 771c 	pea 1771c <destlinezoom1>
    21be:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    21c0:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    21c4:	4642           	not.w d2
    21c6:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    21c8:	4fef 0010      	lea 16(sp),sp
    21cc:	0c85 0000 010d 	cmpi.l #269,d5
    21d2:	6726           	beq.s 21fa <ZoomTest+0xa78>
    21d4:	7800           	moveq #0,d4
    21d6:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    21d8:	2f05           	move.l d5,-(sp)
    21da:	2f04           	move.l d4,-(sp)
    21dc:	2f0a           	move.l a2,-(sp)
    21de:	4879 0001 771c 	pea 1771c <destlinezoom1>
    21e4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    21e6:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    21ea:	4642           	not.w d2
    21ec:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    21ee:	4fef 0010      	lea 16(sp),sp
    21f2:	0c85 0000 010d 	cmpi.l #269,d5
    21f8:	66da           	bne.s 21d4 <ZoomTest+0xa52>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    21fa:	4878 0001      	pea 1 <_start+0x1>
    21fe:	4878 0001      	pea 1 <_start+0x1>
    2202:	2f03           	move.l d3,-(sp)
    2204:	2f0c           	move.l a4,-(sp)
    2206:	4eba eab2      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    220a:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    2210:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    2214:	2003           	move.l d3,d0
    2216:	5880           	addq.l #4,d0
    2218:	2f40 003c      	move.l d0,60(sp)
    221c:	4fef 0010      	lea 16(sp),sp
    2220:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    2222:	7800           	moveq #0,d4
  mask = 0x0000;
    2224:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2226:	2f04           	move.l d4,-(sp)
    2228:	3f02           	move.w d2,-(sp)
    222a:	4267           	clr.w -(sp)
    222c:	2f0a           	move.l a2,-(sp)
    222e:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2234:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2236:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    223a:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    223c:	5284           	addq.l #1,d4
    223e:	4fef 0010      	lea 16(sp),sp
    2242:	720b           	moveq #11,d1
    2244:	b284           	cmp.l d4,d1
    2246:	66de           	bne.s 2226 <ZoomTest+0xaa4>
  TestRow( valsupposed, valactual, 0xffff, 8);
    2248:	4878 0008      	pea 8 <main+0x2>
    224c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2252:	2003           	move.l d3,d0
    2254:	0680 0000 0214 	addi.l #532,d0
    225a:	2f40 0064      	move.l d0,100(sp)
    225e:	2f00           	move.l d0,-(sp)
    2260:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2266:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    2268:	4878 0009      	pea 9 <main+0x3>
    226c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2272:	2043           	movea.l d3,a0
    2274:	4868 0244      	pea 580(a0)
    2278:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    227e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    2280:	4fef 0020      	lea 32(sp),sp
    2284:	4878 000a      	pea a <main+0x4>
    2288:	42a7           	clr.l -(sp)
    228a:	2043           	movea.l d3,a0
    228c:	4868 0274      	pea 628(a0)
    2290:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2296:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    2298:	4878 000b      	pea b <main+0x5>
    229c:	42a7           	clr.l -(sp)
    229e:	2043           	movea.l d3,a0
    22a0:	4868 02a4      	pea 676(a0)
    22a4:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    22aa:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    22ac:	2c03           	move.l d3,d6
    22ae:	0686 0000 05d4 	addi.l #1492,d6
    22b4:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    22b8:	2e06           	move.l d6,d7
    22ba:	367c 0018      	movea.w #24,a3
    22be:	7a00           	moveq #0,d5
    22c0:	3a02           	move.w d2,d5
    22c2:	2447           	movea.l d7,a2
    22c4:	45ea fd00      	lea -768(a2),a2
    22c8:	4deb fff3      	lea -13(a3),a6
    22cc:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    22ce:	2f0e           	move.l a6,-(sp)
    22d0:	2f04           	move.l d4,-(sp)
    22d2:	2f0a           	move.l a2,-(sp)
    22d4:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    22da:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    22dc:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    22e0:	4642           	not.w d2
    22e2:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    22e4:	4fef 0010      	lea 16(sp),sp
    22e8:	be8a           	cmp.l a2,d7
    22ea:	6722           	beq.s 230e <ZoomTest+0xb8c>
    22ec:	7800           	moveq #0,d4
    22ee:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    22f0:	2f0e           	move.l a6,-(sp)
    22f2:	2f04           	move.l d4,-(sp)
    22f4:	2f0a           	move.l a2,-(sp)
    22f6:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    22fc:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    22fe:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2302:	4642           	not.w d2
    2304:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    2306:	4fef 0010      	lea 16(sp),sp
    230a:	be8a           	cmp.l a2,d7
    230c:	66de           	bne.s 22ec <ZoomTest+0xb6a>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    230e:	7a00           	moveq #0,d5
    2310:	3a02           	move.w d2,d5
    2312:	2f0b           	move.l a3,-(sp)
    2314:	2f05           	move.l d5,-(sp)
    2316:	2f0a           	move.l a2,-(sp)
    2318:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    231e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    2320:	486b 0001      	pea 1(a3)
    2324:	2f05           	move.l d5,-(sp)
    2326:	486a 0030      	pea 48(a2)
    232a:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2330:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    2332:	4fef 0020      	lea 32(sp),sp
    2336:	486b 0002      	pea 2(a3)
    233a:	2f04           	move.l d4,-(sp)
    233c:	486a 0060      	pea 96(a2)
    2340:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2346:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    2348:	486b 0003      	pea 3(a3)
    234c:	2f04           	move.l d4,-(sp)
    234e:	486a 0090      	pea 144(a2)
    2352:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2358:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    235a:	2e0a           	move.l a2,d7
    235c:	0687 0000 03c0 	addi.l #960,d7
    2362:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    2366:	4fef 0020      	lea 32(sp),sp
    236a:	b6fc 00e4      	cmpa.w #228,a3
    236e:	6600 ff52      	bne.w 22c2 <ZoomTest+0xb40>
    2372:	2003           	move.l d3,d0
    2374:	0680 0000 2fd4 	addi.l #12244,d0
    237a:	2f40 0058      	move.l d0,88(sp)
    237e:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    2380:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    2382:	2f04           	move.l d4,-(sp)
    2384:	2f05           	move.l d5,-(sp)
    2386:	2f0a           	move.l a2,-(sp)
    2388:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    238e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2390:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2394:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2396:	5284           	addq.l #1,d4
    2398:	4fef 0010      	lea 16(sp),sp
    239c:	720f           	moveq #15,d1
    239e:	b284           	cmp.l d4,d1
    23a0:	6724           	beq.s 23c6 <ZoomTest+0xc44>
    23a2:	7a00           	moveq #0,d5
    23a4:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    23a6:	2f04           	move.l d4,-(sp)
    23a8:	2f05           	move.l d5,-(sp)
    23aa:	2f0a           	move.l a2,-(sp)
    23ac:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    23b2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    23b4:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    23b8:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    23ba:	5284           	addq.l #1,d4
    23bc:	4fef 0010      	lea 16(sp),sp
    23c0:	720f           	moveq #15,d1
    23c2:	b284           	cmp.l d4,d1
    23c4:	66dc           	bne.s 23a2 <ZoomTest+0xc20>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    23c6:	4878 0001      	pea 1 <_start+0x1>
    23ca:	4878 0002      	pea 2 <_start+0x2>
    23ce:	2f0c           	move.l a4,-(sp)
    23d0:	2f03           	move.l d3,-(sp)
    23d2:	4eba e8e6      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    23d6:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    23dc:	4eae ff1c      	jsr -228(a6)
    23e0:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    23e4:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    23e8:	7400           	moveq #0,d2
  mask = 0xffff;
    23ea:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    23ec:	2f02           	move.l d2,-(sp)
    23ee:	3f04           	move.w d4,-(sp)
    23f0:	4267           	clr.w -(sp)
    23f2:	2f0a           	move.l a2,-(sp)
    23f4:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    23fa:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    23fc:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2400:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    2402:	5282           	addq.l #1,d2
    2404:	4fef 0010      	lea 16(sp),sp
    2408:	7004           	moveq #4,d0
    240a:	b082           	cmp.l d2,d0
    240c:	66de           	bne.s 23ec <ZoomTest+0xc6a>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    240e:	4878 0004      	pea 4 <_start+0x4>
    2412:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2418:	486c 00c4      	pea 196(a4)
    241c:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2422:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    2424:	4878 0005      	pea 5 <_start+0x5>
    2428:	2f3c 0000 ffff 	move.l #65535,-(sp)
    242e:	486c 00f4      	pea 244(a4)
    2432:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2438:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    243a:	4fef 0020      	lea 32(sp),sp
    243e:	4878 0006      	pea 6 <main>
    2442:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    2444:	41ec 0124      	lea 292(a4),a0
    2448:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    244c:	2f08           	move.l a0,-(sp)
    244e:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2454:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2456:	4878 0007      	pea 7 <main+0x1>
    245a:	42a7           	clr.l -(sp)
    245c:	486c 0154      	pea 340(a4)
    2460:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2466:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    2468:	4fef 0020      	lea 32(sp),sp
    246c:	4878 0008      	pea 8 <main+0x2>
    2470:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2476:	486c 0184      	pea 388(a4)
    247a:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2480:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2482:	4878 0009      	pea 9 <main+0x3>
    2486:	2f3c 0000 ffff 	move.l #65535,-(sp)
    248c:	486c 01b4      	pea 436(a4)
    2490:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2496:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2498:	280c           	move.l a4,d4
    249a:	0684 0000 04b4 	addi.l #1204,d4
    24a0:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    24a4:	367c 0018      	movea.w #24,a3
    24a8:	7a00           	moveq #0,d5
    24aa:	74ff           	moveq #-1,d2
    24ac:	2444           	movea.l d4,a2
    24ae:	45ea fd30      	lea -720(a2),a2
    24b2:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    24b6:	2f0e           	move.l a6,-(sp)
    24b8:	2f05           	move.l d5,-(sp)
    24ba:	2f0a           	move.l a2,-(sp)
    24bc:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    24c2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    24c4:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    24c8:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    24ca:	4fef 0010      	lea 16(sp),sp
    24ce:	b88a           	cmp.l a2,d4
    24d0:	6722           	beq.s 24f4 <ZoomTest+0xd72>
    24d2:	7a00           	moveq #0,d5
    24d4:	3a02           	move.w d2,d5
    24d6:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    24d8:	2f0e           	move.l a6,-(sp)
    24da:	2f05           	move.l d5,-(sp)
    24dc:	2f0a           	move.l a2,-(sp)
    24de:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    24e4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    24e6:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    24ea:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    24ec:	4fef 0010      	lea 16(sp),sp
    24f0:	b88a           	cmp.l a2,d4
    24f2:	66de           	bne.s 24d2 <ZoomTest+0xd50>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    24f4:	7800           	moveq #0,d4
    24f6:	3802           	move.w d2,d4
    24f8:	2f0b           	move.l a3,-(sp)
    24fa:	2f04           	move.l d4,-(sp)
    24fc:	2f0a           	move.l a2,-(sp)
    24fe:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2504:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    2506:	486b 0001      	pea 1(a3)
    250a:	2f04           	move.l d4,-(sp)
    250c:	486a 0030      	pea 48(a2)
    2510:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2516:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    2518:	4fef 0020      	lea 32(sp),sp
    251c:	486b 0002      	pea 2(a3)
    2520:	2f05           	move.l d5,-(sp)
    2522:	486a 0060      	pea 96(a2)
    2526:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    252c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    252e:	486b 0003      	pea 3(a3)
    2532:	2f05           	move.l d5,-(sp)
    2534:	486a 0090      	pea 144(a2)
    2538:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    253e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2540:	4fef 0020      	lea 32(sp),sp
    2544:	486b 0004      	pea 4(a3)
    2548:	2f04           	move.l d4,-(sp)
    254a:	486a 00c0      	pea 192(a2)
    254e:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2554:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2556:	486b 0005      	pea 5(a3)
    255a:	2f04           	move.l d4,-(sp)
    255c:	486a 00f0      	pea 240(a2)
    2560:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2566:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2568:	280a           	move.l a2,d4
    256a:	0684 0000 03f0 	addi.l #1008,d4
    2570:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2574:	4fef 0020      	lea 32(sp),sp
    2578:	b6fc 0114      	cmpa.w #276,a3
    257c:	6600 ff2e      	bne.w 24ac <ZoomTest+0xd2a>
    2580:	45ec 3124      	lea 12580(a4),a2
    2584:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    258a:	2f04           	move.l d4,-(sp)
    258c:	2f05           	move.l d5,-(sp)
    258e:	2f0a           	move.l a2,-(sp)
    2590:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2596:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2598:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    259c:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    259e:	4fef 0010      	lea 16(sp),sp
    25a2:	0c84 0000 010d 	cmpi.l #269,d4
    25a8:	6726           	beq.s 25d0 <ZoomTest+0xe4e>
    25aa:	7a00           	moveq #0,d5
    25ac:	3a02           	move.w d2,d5
    25ae:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    25b0:	2f04           	move.l d4,-(sp)
    25b2:	2f05           	move.l d5,-(sp)
    25b4:	2f0a           	move.l a2,-(sp)
    25b6:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    25bc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    25be:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    25c2:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    25c4:	4fef 0010      	lea 16(sp),sp
    25c8:	0c84 0000 010d 	cmpi.l #269,d4
    25ce:	66da           	bne.s 25aa <ZoomTest+0xe28>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    25d0:	4878 0001      	pea 1 <_start+0x1>
    25d4:	4878 0003      	pea 3 <_start+0x3>
    25d8:	2f03           	move.l d3,-(sp)
    25da:	2f0c           	move.l a4,-(sp)
    25dc:	4eba e6dc      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    25e0:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    25e6:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    25ea:	4878 0007      	pea 7 <main+0x1>
    25ee:	42a7           	clr.l -(sp)
    25f0:	2f2f 0044      	move.l 68(sp),-(sp)
    25f4:	4879 0001 7698 	pea 17698 <destlinezoom4>
    25fa:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    25fc:	7034           	moveq #52,d0
    25fe:	d083           	add.l d3,d0
    2600:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    2604:	4fef 0020      	lea 32(sp),sp
    2608:	4878 0008      	pea 8 <main+0x2>
    260c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2612:	2f00           	move.l d0,-(sp)
    2614:	4879 0001 7698 	pea 17698 <destlinezoom4>
    261a:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    261c:	7264           	moveq #100,d1
    261e:	d283           	add.l d3,d1
    2620:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2624:	4878 0009      	pea 9 <main+0x3>
    2628:	2f3c 0000 ffff 	move.l #65535,-(sp)
    262e:	2f01           	move.l d1,-(sp)
    2630:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2636:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2638:	2003           	move.l d3,d0
    263a:	0680 0000 0094 	addi.l #148,d0
    2640:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    2644:	4fef 0020      	lea 32(sp),sp
    2648:	4878 0008      	pea 8 <main+0x2>
    264c:	42a7           	clr.l -(sp)
    264e:	2f00           	move.l d0,-(sp)
    2650:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2656:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    2658:	4878 0009      	pea 9 <main+0x3>
    265c:	42a7           	clr.l -(sp)
    265e:	2043           	movea.l d3,a0
    2660:	4868 00c4      	pea 196(a0)
    2664:	4879 0001 7698 	pea 17698 <destlinezoom4>
    266a:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    266c:	2003           	move.l d3,d0
    266e:	0680 0000 00f4 	addi.l #244,d0
    2674:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    2678:	2e03           	move.l d3,d7
    267a:	0687 0000 0394 	addi.l #916,d7
    2680:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2684:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    2688:	7aff           	moveq #-1,d5
    268a:	7400           	moveq #0,d2
    268c:	4642           	not.w d2
    268e:	2447           	movea.l d7,a2
    2690:	45ea fd60      	lea -672(a2),a2
    2694:	4deb fff1      	lea -15(a3),a6
    2698:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    269a:	2f0e           	move.l a6,-(sp)
    269c:	2f04           	move.l d4,-(sp)
    269e:	2f0a           	move.l a2,-(sp)
    26a0:	4879 0001 7698 	pea 17698 <destlinezoom4>
    26a6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    26a8:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    26ac:	4645           	not.w d5
    26ae:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    26b0:	4fef 0010      	lea 16(sp),sp
    26b4:	be8a           	cmp.l a2,d7
    26b6:	6722           	beq.s 26da <ZoomTest+0xf58>
    26b8:	7800           	moveq #0,d4
    26ba:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    26bc:	2f0e           	move.l a6,-(sp)
    26be:	2f04           	move.l d4,-(sp)
    26c0:	2f0a           	move.l a2,-(sp)
    26c2:	4879 0001 7698 	pea 17698 <destlinezoom4>
    26c8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    26ca:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    26ce:	4645           	not.w d5
    26d0:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    26d2:	4fef 0010      	lea 16(sp),sp
    26d6:	be8a           	cmp.l a2,d7
    26d8:	66de           	bne.s 26b8 <ZoomTest+0xf36>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    26da:	7400           	moveq #0,d2
    26dc:	3405           	move.w d5,d2
    26de:	2f0b           	move.l a3,-(sp)
    26e0:	2f02           	move.l d2,-(sp)
    26e2:	2f0a           	move.l a2,-(sp)
    26e4:	4879 0001 7698 	pea 17698 <destlinezoom4>
    26ea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    26ec:	486b 0001      	pea 1(a3)
    26f0:	2f02           	move.l d2,-(sp)
    26f2:	486a 0030      	pea 48(a2)
    26f6:	4879 0001 7698 	pea 17698 <destlinezoom4>
    26fc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    26fe:	4fef 0020      	lea 32(sp),sp
    2702:	486b 0002      	pea 2(a3)
    2706:	2f04           	move.l d4,-(sp)
    2708:	486a 0060      	pea 96(a2)
    270c:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2712:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    2714:	486b 0003      	pea 3(a3)
    2718:	2f04           	move.l d4,-(sp)
    271a:	486a 0090      	pea 144(a2)
    271e:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2724:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2726:	4deb 0004      	lea 4(a3),a6
    272a:	4fef 001c      	lea 28(sp),sp
    272e:	2e8e           	move.l a6,(sp)
    2730:	2f02           	move.l d2,-(sp)
    2732:	486a 00c0      	pea 192(a2)
    2736:	4879 0001 7698 	pea 17698 <destlinezoom4>
    273c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    273e:	2e0b           	move.l a3,d7
    2740:	5a87           	addq.l #5,d7
    2742:	2f07           	move.l d7,-(sp)
    2744:	2f02           	move.l d2,-(sp)
    2746:	486a 00f0      	pea 240(a2)
    274a:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2750:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2752:	4fef 001c      	lea 28(sp),sp
    2756:	2e8e           	move.l a6,(sp)
    2758:	2f04           	move.l d4,-(sp)
    275a:	486a 0120      	pea 288(a2)
    275e:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2764:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2766:	2f07           	move.l d7,-(sp)
    2768:	2f04           	move.l d4,-(sp)
    276a:	486a 0150      	pea 336(a2)
    276e:	4879 0001 7698 	pea 17698 <destlinezoom4>
    2774:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2776:	2e0a           	move.l a2,d7
    2778:	0687 0000 0420 	addi.l #1056,d7
    277e:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2782:	4fef 0020      	lea 32(sp),sp
    2786:	b6fc 0114      	cmpa.w #276,a3
    278a:	6600 ff02      	bne.w 268e <ZoomTest+0xf0c>
  TestRow( valsupposed, valactual, mask, 269);
    278e:	4878 010d      	pea 10d <main+0x107>
    2792:	2f02           	move.l d2,-(sp)
    2794:	2043           	movea.l d3,a0
    2796:	4868 3274      	pea 12916(a0)
    279a:	4879 0001 7698 	pea 17698 <destlinezoom4>
    27a0:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    27a2:	4878 0001      	pea 1 <_start+0x1>
    27a6:	4878 0004      	pea 4 <_start+0x4>
    27aa:	2f0c           	move.l a4,-(sp)
    27ac:	2f03           	move.l d3,-(sp)
    27ae:	4eba e50a      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    27b2:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    27b8:	4eae ff1c      	jsr -228(a6)
    27bc:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    27c0:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    27c4:	95ca           	suba.l a2,a2
  mask = 0x0000;
    27c6:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    27c8:	7400           	moveq #0,d2
    27ca:	3405           	move.w d5,d2
    27cc:	2f0a           	move.l a2,-(sp)
    27ce:	2f02           	move.l d2,-(sp)
    27d0:	2f0b           	move.l a3,-(sp)
    27d2:	4879 0001 766c 	pea 1766c <destlinezoom5>
    27d8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    27da:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    27de:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    27e0:	528a           	addq.l #1,a2
    27e2:	4fef 0010      	lea 16(sp),sp
    27e6:	700d           	moveq #13,d0
    27e8:	b08a           	cmp.l a2,d0
    27ea:	66dc           	bne.s 27c8 <ZoomTest+0x1046>
    27ec:	7800           	moveq #0,d4
    27ee:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    27f0:	4878 000c      	pea c <main+0x6>
    27f4:	2f04           	move.l d4,-(sp)
    27f6:	486c 0274      	pea 628(a4)
    27fa:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2800:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    2802:	4878 000d      	pea d <main+0x7>
    2806:	2f04           	move.l d4,-(sp)
    2808:	486c 02a4      	pea 676(a4)
    280c:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2812:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    2814:	4fef 0020      	lea 32(sp),sp
    2818:	4878 000e      	pea e <main+0x8>
    281c:	2f02           	move.l d2,-(sp)
    281e:	486c 02d4      	pea 724(a4)
    2822:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2828:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    282a:	4878 000f      	pea f <main+0x9>
    282e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2830:	41ec 0304      	lea 772(a4),a0
    2834:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    2838:	2f08           	move.l a0,-(sp)
    283a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2840:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    2842:	4fef 0020      	lea 32(sp),sp
    2846:	4878 0010      	pea 10 <main+0xa>
    284a:	2f04           	move.l d4,-(sp)
    284c:	486c 0334      	pea 820(a4)
    2850:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2856:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    2858:	4878 0011      	pea 11 <main+0xb>
    285c:	2f04           	move.l d4,-(sp)
    285e:	2f2f 0048      	move.l 72(sp),-(sp)
    2862:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2868:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    286a:	4fef 0020      	lea 32(sp),sp
    286e:	4878 0012      	pea 12 <main+0xc>
    2872:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2874:	41ec 0394      	lea 916(a4),a0
    2878:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 18);
    287c:	2f08           	move.l a0,-(sp)
    287e:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2884:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    2886:	4878 0013      	pea 13 <main+0xd>
    288a:	2f02           	move.l d2,-(sp)
    288c:	486c 03c4      	pea 964(a4)
    2890:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2896:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    2898:	4fef 0020      	lea 32(sp),sp
    289c:	4878 0014      	pea 14 <main+0xe>
    28a0:	2f04           	move.l d4,-(sp)
    28a2:	486c 03f4      	pea 1012(a4)
    28a6:	4879 0001 766c 	pea 1766c <destlinezoom5>
    28ac:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    28ae:	4878 0015      	pea 15 <main+0xf>
    28b2:	2f04           	move.l d4,-(sp)
    28b4:	486c 0424      	pea 1060(a4)
    28b8:	4879 0001 766c 	pea 1766c <destlinezoom5>
    28be:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    28c0:	280c           	move.l a4,d4
    28c2:	0684 0000 06c4 	addi.l #1732,d4
    28c8:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    28cc:	347c 0023      	movea.w #35,a2
    28d0:	2644           	movea.l d4,a3
    28d2:	47eb fd90      	lea -624(a3),a3
    28d6:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    28da:	2f0e           	move.l a6,-(sp)
    28dc:	2f02           	move.l d2,-(sp)
    28de:	2f0b           	move.l a3,-(sp)
    28e0:	4879 0001 766c 	pea 1766c <destlinezoom5>
    28e6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    28e8:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    28ec:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    28ee:	4fef 0010      	lea 16(sp),sp
    28f2:	b88b           	cmp.l a3,d4
    28f4:	6722           	beq.s 2918 <ZoomTest+0x1196>
    28f6:	7400           	moveq #0,d2
    28f8:	3405           	move.w d5,d2
    28fa:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    28fc:	2f0e           	move.l a6,-(sp)
    28fe:	2f02           	move.l d2,-(sp)
    2900:	2f0b           	move.l a3,-(sp)
    2902:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2908:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    290a:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    290e:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2910:	4fef 0010      	lea 16(sp),sp
    2914:	b88b           	cmp.l a3,d4
    2916:	66de           	bne.s 28f6 <ZoomTest+0x1174>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    2918:	7800           	moveq #0,d4
    291a:	3805           	move.w d5,d4
    291c:	2f0a           	move.l a2,-(sp)
    291e:	2f04           	move.l d4,-(sp)
    2920:	2f0b           	move.l a3,-(sp)
    2922:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2928:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    292a:	486a 0001      	pea 1(a2)
    292e:	2f04           	move.l d4,-(sp)
    2930:	486b 0030      	pea 48(a3)
    2934:	4879 0001 766c 	pea 1766c <destlinezoom5>
    293a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    293c:	4fef 0020      	lea 32(sp),sp
    2940:	486a 0002      	pea 2(a2)
    2944:	2f02           	move.l d2,-(sp)
    2946:	486b 0060      	pea 96(a3)
    294a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2950:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2952:	486a 0003      	pea 3(a2)
    2956:	2f02           	move.l d2,-(sp)
    2958:	486b 0090      	pea 144(a3)
    295c:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2962:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2964:	4fef 0020      	lea 32(sp),sp
    2968:	486a 0004      	pea 4(a2)
    296c:	2f04           	move.l d4,-(sp)
    296e:	486b 00c0      	pea 192(a3)
    2972:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2978:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    297a:	486a 0005      	pea 5(a2)
    297e:	2f04           	move.l d4,-(sp)
    2980:	486b 00f0      	pea 240(a3)
    2984:	4879 0001 766c 	pea 1766c <destlinezoom5>
    298a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    298c:	4fef 0020      	lea 32(sp),sp
    2990:	486a 0006      	pea 6(a2)
    2994:	2f02           	move.l d2,-(sp)
    2996:	486b 0120      	pea 288(a3)
    299a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    29a0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    29a2:	486a 0007      	pea 7(a2)
    29a6:	2f02           	move.l d2,-(sp)
    29a8:	486b 0150      	pea 336(a3)
    29ac:	4879 0001 766c 	pea 1766c <destlinezoom5>
    29b2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    29b4:	4fef 0020      	lea 32(sp),sp
    29b8:	486a 0008      	pea 8(a2)
    29bc:	2f04           	move.l d4,-(sp)
    29be:	486b 0180      	pea 384(a3)
    29c2:	4879 0001 766c 	pea 1766c <destlinezoom5>
    29c8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    29ca:	486a 0009      	pea 9(a2)
    29ce:	2f04           	move.l d4,-(sp)
    29d0:	486b 01b0      	pea 432(a3)
    29d4:	4879 0001 766c 	pea 1766c <destlinezoom5>
    29da:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    29dc:	280b           	move.l a3,d4
    29de:	0684 0000 0450 	addi.l #1104,d4
    29e4:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    29e8:	4fef 0020      	lea 32(sp),sp
    29ec:	b4fc 00f5      	cmpa.w #245,a2
    29f0:	6600 fede      	bne.w 28d0 <ZoomTest+0x114e>
    29f4:	47ec 2f74      	lea 12148(a4),a3
    29f8:	7e02           	moveq #2,d7
    29fa:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    29fc:	2f07           	move.l d7,-(sp)
    29fe:	2f02           	move.l d2,-(sp)
    2a00:	2f0b           	move.l a3,-(sp)
    2a02:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2a08:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2a0a:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2a0e:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2a10:	4fef 0010      	lea 16(sp),sp
    2a14:	0c87 0000 010a 	cmpi.l #266,d7
    2a1a:	6726           	beq.s 2a42 <ZoomTest+0x12c0>
    2a1c:	7400           	moveq #0,d2
    2a1e:	3405           	move.w d5,d2
    2a20:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    2a22:	2f07           	move.l d7,-(sp)
    2a24:	2f02           	move.l d2,-(sp)
    2a26:	2f0b           	move.l a3,-(sp)
    2a28:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2a2e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2a30:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2a34:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2a36:	4fef 0010      	lea 16(sp),sp
    2a3a:	0c87 0000 010a 	cmpi.l #266,d7
    2a40:	66da           	bne.s 2a1c <ZoomTest+0x129a>
    2a42:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    2a48:	2f07           	move.l d7,-(sp)
    2a4a:	2f05           	move.l d5,-(sp)
    2a4c:	2f2f 0044      	move.l 68(sp),-(sp)
    2a50:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2a56:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    2a58:	4878 010b      	pea 10b <main+0x105>
    2a5c:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    2a5e:	41ec 3214      	lea 12820(a4),a0
    2a62:	2f48 007c      	move.l a0,124(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2a66:	2f08           	move.l a0,-(sp)
    2a68:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2a6e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    2a70:	4fef 0020      	lea 32(sp),sp
    2a74:	4878 010c      	pea 10c <main+0x106>
    2a78:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2a7a:	41ec 3244      	lea 12868(a4),a0
    2a7e:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2a82:	2f08           	move.l a0,-(sp)
    2a84:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2a8a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    2a8c:	4878 010d      	pea 10d <main+0x107>
    2a90:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2a92:	41ec 3274      	lea 12916(a4),a0
    2a96:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2a9a:	2f08           	move.l a0,-(sp)
    2a9c:	4879 0001 766c 	pea 1766c <destlinezoom5>
    2aa2:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2aa4:	4fef 0020      	lea 32(sp),sp
    2aa8:	4878 0001      	pea 1 <_start+0x1>
    2aac:	4878 0005      	pea 5 <_start+0x5>
    2ab0:	2f03           	move.l d3,-(sp)
    2ab2:	2f0c           	move.l a4,-(sp)
    2ab4:	4eba e204      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2ab8:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    2abe:	4eae ff1c      	jsr -228(a6)
    2ac2:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2ac6:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    2aca:	7800           	moveq #0,d4
  mask = 0x0000;
    2acc:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2ace:	2f04           	move.l d4,-(sp)
    2ad0:	3f02           	move.w d2,-(sp)
    2ad2:	4267           	clr.w -(sp)
    2ad4:	2f0b           	move.l a3,-(sp)
    2ad6:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2adc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2ade:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2ae2:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    2ae4:	5284           	addq.l #1,d4
    2ae6:	4fef 0010      	lea 16(sp),sp
    2aea:	7007           	moveq #7,d0
    2aec:	b084           	cmp.l d4,d0
    2aee:	66de           	bne.s 2ace <ZoomTest+0x134c>
    2af0:	2c43           	movea.l d3,a6
    2af2:	4dee 0154      	lea 340(a6),a6
    2af6:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2afa:	7800           	moveq #0,d4
    2afc:	3802           	move.w d2,d4
    2afe:	2f0b           	move.l a3,-(sp)
    2b00:	2f04           	move.l d4,-(sp)
    2b02:	2f0e           	move.l a6,-(sp)
    2b04:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2b0a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2b0c:	486b 0001      	pea 1(a3)
    2b10:	2f04           	move.l d4,-(sp)
    2b12:	486e 0030      	pea 48(a6)
    2b16:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2b1c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2b1e:	4642           	not.w d2
    2b20:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2b22:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    2b26:	4fef 0020      	lea 32(sp),sp
    2b2a:	7213           	moveq #19,d1
    2b2c:	b28b           	cmp.l a3,d1
    2b2e:	66ca           	bne.s 2afa <ZoomTest+0x1378>
    2b30:	2a0a           	move.l a2,d5
    2b32:	2c46           	movea.l d6,a6
    2b34:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2b38:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2b3a:	2f04           	move.l d4,-(sp)
    2b3c:	3f02           	move.w d2,-(sp)
    2b3e:	4267           	clr.w -(sp)
    2b40:	2f0e           	move.l a6,-(sp)
    2b42:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2b48:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2b4a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2b4e:	4642           	not.w d2
    2b50:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2b52:	4fef 0010      	lea 16(sp),sp
    2b56:	bc8e           	cmp.l a6,d6
    2b58:	66e0           	bne.s 2b3a <ZoomTest+0x13b8>
    2b5a:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2b5e:	7800           	moveq #0,d4
    2b60:	3802           	move.w d2,d4
    2b62:	2f0a           	move.l a2,-(sp)
    2b64:	2f04           	move.l d4,-(sp)
    2b66:	2f0e           	move.l a6,-(sp)
    2b68:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2b6e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2b70:	486a 0001      	pea 1(a2)
    2b74:	2f04           	move.l d4,-(sp)
    2b76:	486e 0030      	pea 48(a6)
    2b7a:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2b80:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2b82:	4642           	not.w d2
    2b84:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2b88:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2b8c:	4fef 0020      	lea 32(sp),sp
    2b90:	b4fc 00af      	cmpa.w #175,a2
    2b94:	66c8           	bne.s 2b5e <ZoomTest+0x13dc>
    2b96:	0686 0000 0480 	addi.l #1152,d6
    2b9c:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2ba0:	b6fc 0103      	cmpa.w #259,a3
    2ba4:	668c           	bne.s 2b32 <ZoomTest+0x13b0>
    2ba6:	2445           	movea.l d5,a2
    2ba8:	2c43           	movea.l d3,a6
    2baa:	4dee 3094      	lea 12436(a6),a6
    2bae:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2bb4:	2f04           	move.l d4,-(sp)
    2bb6:	3f02           	move.w d2,-(sp)
    2bb8:	4267           	clr.w -(sp)
    2bba:	2f0e           	move.l a6,-(sp)
    2bbc:	4879 0001 7640 	pea 17640 <destlinezoom6>
    2bc2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2bc4:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2bc8:	4642           	not.w d2
    2bca:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2bcc:	4fef 0010      	lea 16(sp),sp
    2bd0:	0c84 0000 010d 	cmpi.l #269,d4
    2bd6:	66dc           	bne.s 2bb4 <ZoomTest+0x1432>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2bd8:	4878 0001      	pea 1 <_start+0x1>
    2bdc:	4878 0006      	pea 6 <main>
    2be0:	2f0c           	move.l a4,-(sp)
    2be2:	2f03           	move.l d3,-(sp)
    2be4:	4eba e0d4      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2be8:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    2bee:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2bf2:	42a7           	clr.l -(sp)
    2bf4:	42a7           	clr.l -(sp)
    2bf6:	2f2f 004c      	move.l 76(sp),-(sp)
    2bfa:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2c00:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2c02:	41ec 0034      	lea 52(a4),a0
    2c06:	2f48 0068      	move.l a0,104(sp)
    2c0a:	4fef 0020      	lea 32(sp),sp
    2c0e:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2c12:	7eff           	moveq #-1,d7
    2c14:	280a           	move.l a2,d4
    2c16:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2c18:	7400           	moveq #0,d2
    2c1a:	3407           	move.w d7,d2
    2c1c:	2f0e           	move.l a6,-(sp)
    2c1e:	2f02           	move.l d2,-(sp)
    2c20:	2f0a           	move.l a2,-(sp)
    2c22:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2c28:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2c2a:	486e 0001      	pea 1(a6)
    2c2e:	2f02           	move.l d2,-(sp)
    2c30:	486a 0030      	pea 48(a2)
    2c34:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2c3a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2c3c:	4647           	not.w d7
    2c3e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2c40:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2c44:	4fef 0020      	lea 32(sp),sp
    2c48:	700f           	moveq #15,d0
    2c4a:	b08e           	cmp.l a6,d0
    2c4c:	66ca           	bne.s 2c18 <ZoomTest+0x1496>
    2c4e:	240c           	move.l a4,d2
    2c50:	0682 0000 04e4 	addi.l #1252,d2
    2c56:	2a04           	move.l d4,d5
    2c58:	2c0b           	move.l a3,d6
    2c5a:	264e           	movea.l a6,a3
    2c5c:	2c42           	movea.l d2,a6
    2c5e:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2c62:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2c64:	2f04           	move.l d4,-(sp)
    2c66:	3f07           	move.w d7,-(sp)
    2c68:	4267           	clr.w -(sp)
    2c6a:	2f0e           	move.l a6,-(sp)
    2c6c:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2c72:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2c74:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2c78:	4647           	not.w d7
    2c7a:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2c7c:	4fef 0010      	lea 16(sp),sp
    2c80:	b48e           	cmp.l a6,d2
    2c82:	66e0           	bne.s 2c64 <ZoomTest+0x14e2>
    2c84:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2c88:	7800           	moveq #0,d4
    2c8a:	3807           	move.w d7,d4
    2c8c:	2f0a           	move.l a2,-(sp)
    2c8e:	2f04           	move.l d4,-(sp)
    2c90:	2f0e           	move.l a6,-(sp)
    2c92:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2c98:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2c9a:	2f0a           	move.l a2,-(sp)
    2c9c:	2f04           	move.l d4,-(sp)
    2c9e:	486e 0030      	pea 48(a6)
    2ca2:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2ca8:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2caa:	4647           	not.w d7
    2cac:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2cb0:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2cb4:	4fef 0020      	lea 32(sp),sp
    2cb8:	b4fc 00c9      	cmpa.w #201,a2
    2cbc:	66ca           	bne.s 2c88 <ZoomTest+0x1506>
    2cbe:	0682 0000 04b0 	addi.l #1200,d2
    2cc4:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2cc8:	b6fc 0109      	cmpa.w #265,a3
    2ccc:	668e           	bne.s 2c5c <ZoomTest+0x14da>
    2cce:	2445           	movea.l d5,a2
    2cd0:	2646           	movea.l d6,a3
    2cd2:	4dec 31b4      	lea 12724(a4),a6
    2cd6:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2cdc:	2f02           	move.l d2,-(sp)
    2cde:	3f07           	move.w d7,-(sp)
    2ce0:	4267           	clr.w -(sp)
    2ce2:	2f0e           	move.l a6,-(sp)
    2ce4:	4879 0001 7614 	pea 17614 <destlinezoom7>
    2cea:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2cec:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2cf0:	4647           	not.w d7
    2cf2:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2cf4:	4fef 0010      	lea 16(sp),sp
    2cf8:	0c82 0000 0105 	cmpi.l #261,d2
    2cfe:	66dc           	bne.s 2cdc <ZoomTest+0x155a>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2d00:	4878 0001      	pea 1 <_start+0x1>
    2d04:	4878 0007      	pea 7 <main+0x1>
    2d08:	2f03           	move.l d3,-(sp)
    2d0a:	2f0c           	move.l a4,-(sp)
    2d0c:	4eba dfac      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2d10:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    2d16:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2d1a:	42a7           	clr.l -(sp)
    2d1c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2d22:	2f2f 0044      	move.l 68(sp),-(sp)
    2d26:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2d2c:	4e95           	jsr (a5)
    2d2e:	4fef 0020      	lea 32(sp),sp
    2d32:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2d38:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    2d3c:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    2d3e:	4245           	clr.w d5
    2d40:	2c2f 0030      	move.l 48(sp),d6
    2d44:	2c44           	movea.l d4,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2d46:	7800           	moveq #0,d4
    2d48:	3805           	move.w d5,d4
    2d4a:	2f0e           	move.l a6,-(sp)
    2d4c:	2f04           	move.l d4,-(sp)
    2d4e:	2f02           	move.l d2,-(sp)
    2d50:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2d56:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2d58:	486e 0001      	pea 1(a6)
    2d5c:	2f04           	move.l d4,-(sp)
    2d5e:	2042           	movea.l d2,a0
    2d60:	4868 0030      	pea 48(a0)
    2d64:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2d6a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2d6c:	4645           	not.w d5
    2d6e:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2d70:	4fef 0020      	lea 32(sp),sp
    2d74:	700b           	moveq #11,d0
    2d76:	b08e           	cmp.l a6,d0
    2d78:	6740           	beq.s 2dba <ZoomTest+0x1638>
    2d7a:	2002           	move.l d2,d0
    2d7c:	0680 0000 00c0 	addi.l #192,d0
    2d82:	2406           	move.l d6,d2
    2d84:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2d86:	7800           	moveq #0,d4
    2d88:	3805           	move.w d5,d4
    2d8a:	2f0e           	move.l a6,-(sp)
    2d8c:	2f04           	move.l d4,-(sp)
    2d8e:	2f02           	move.l d2,-(sp)
    2d90:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2d96:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2d98:	486e 0001      	pea 1(a6)
    2d9c:	2f04           	move.l d4,-(sp)
    2d9e:	2042           	movea.l d2,a0
    2da0:	4868 0030      	pea 48(a0)
    2da4:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2daa:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2dac:	4645           	not.w d5
    2dae:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2db0:	4fef 0020      	lea 32(sp),sp
    2db4:	700b           	moveq #11,d0
    2db6:	b08e           	cmp.l a6,d0
    2db8:	66c0           	bne.s 2d7a <ZoomTest+0x15f8>
    2dba:	2f46 0030      	move.l d6,48(sp)
    2dbe:	280e           	move.l a6,d4
    2dc0:	2e06           	move.l d6,d7
    2dc2:	0687 0000 01e0 	addi.l #480,d7
    2dc8:	327c 0015      	movea.w #21,a1
    2dcc:	2f4a 006c      	move.l a2,108(sp)
    2dd0:	2f4b 0070      	move.l a3,112(sp)
    2dd4:	2449           	movea.l a1,a2
    2dd6:	2c47           	movea.l d7,a6
    2dd8:	4dee fe20      	lea -480(a6),a6
    2ddc:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    2de0:	2f0b           	move.l a3,-(sp)
    2de2:	3f05           	move.w d5,-(sp)
    2de4:	4267           	clr.w -(sp)
    2de6:	2f0e           	move.l a6,-(sp)
    2de8:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2dee:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2df0:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2df4:	4645           	not.w d5
    2df6:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    2df8:	4fef 0010      	lea 16(sp),sp
    2dfc:	be8e           	cmp.l a6,d7
    2dfe:	66e0           	bne.s 2de0 <ZoomTest+0x165e>
    2e00:	240a           	move.l a2,d2
    2e02:	2c0e           	move.l a6,d6
    2e04:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    2e0a:	7200           	moveq #0,d1
    2e0c:	3205           	move.w d5,d1
    2e0e:	2641           	movea.l d1,a3
    2e10:	2f02           	move.l d2,-(sp)
    2e12:	2f0b           	move.l a3,-(sp)
    2e14:	2f0e           	move.l a6,-(sp)
    2e16:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2e1c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    2e1e:	2f02           	move.l d2,-(sp)
    2e20:	2f0b           	move.l a3,-(sp)
    2e22:	486e 0030      	pea 48(a6)
    2e26:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2e2c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2e2e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2e32:	4645           	not.w d5
    2e34:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    2e36:	4fef 0020      	lea 32(sp),sp
    2e3a:	bc8e           	cmp.l a6,d6
    2e3c:	66cc           	bne.s 2e0a <ZoomTest+0x1688>
    2e3e:	0687 0000 04e0 	addi.l #1248,d7
    2e44:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    2e48:	b4fc 00ff      	cmpa.w #255,a2
    2e4c:	6688           	bne.s 2dd6 <ZoomTest+0x1654>
    2e4e:	246f 006c      	movea.l 108(sp),a2
    2e52:	266f 0070      	movea.l 112(sp),a3
    2e56:	2c2f 0030      	move.l 48(sp),d6
    2e5a:	0686 0000 2be0 	addi.l #11232,d6
    2e60:	240a           	move.l a2,d2
    2e62:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2e64:	2f02           	move.l d2,-(sp)
    2e66:	3f05           	move.w d5,-(sp)
    2e68:	4267           	clr.w -(sp)
    2e6a:	2f0e           	move.l a6,-(sp)
    2e6c:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2e72:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2e74:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2e78:	4645           	not.w d5
    2e7a:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    2e7c:	4fef 0010      	lea 16(sp),sp
    2e80:	0c82 0000 00ff 	cmpi.l #255,d2
    2e86:	66dc           	bne.s 2e64 <ZoomTest+0x16e2>
    2e88:	2c2f 0030      	move.l 48(sp),d6
    2e8c:	0686 0000 2dc0 	addi.l #11712,d6
    2e92:	2c42           	movea.l d2,a6
    2e94:	2e0a           	move.l a2,d7
    2e96:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    2e98:	7c00           	moveq #0,d6
    2e9a:	3c05           	move.w d5,d6
    2e9c:	2f0e           	move.l a6,-(sp)
    2e9e:	2f06           	move.l d6,-(sp)
    2ea0:	2f0a           	move.l a2,-(sp)
    2ea2:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2ea8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    2eaa:	486e 0001      	pea 1(a6)
    2eae:	2f06           	move.l d6,-(sp)
    2eb0:	486a 0030      	pea 48(a2)
    2eb4:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2eba:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2ebc:	4645           	not.w d5
    2ebe:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2ec0:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2ec4:	4fef 0020      	lea 32(sp),sp
    2ec8:	bcfc 010d      	cmpa.w #269,a6
    2ecc:	66ca           	bne.s 2e98 <ZoomTest+0x1716>
    2ece:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    2ed0:	2f0e           	move.l a6,-(sp)
    2ed2:	3f05           	move.w d5,-(sp)
    2ed4:	4267           	clr.w -(sp)
    2ed6:	206f 0038      	movea.l 56(sp),a0
    2eda:	4868 3060      	pea 12384(a0)
    2ede:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    2ee4:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    2ee6:	4878 0001      	pea 1 <_start+0x1>
    2eea:	4878 0008      	pea 8 <main+0x2>
    2eee:	2f0c           	move.l a4,-(sp)
    2ef0:	2f03           	move.l d3,-(sp)
    2ef2:	4eba ddc6      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2ef6:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    2efc:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2f00:	4fef 001c      	lea 28(sp),sp
    2f04:	4297           	clr.l (sp)
    2f06:	42a7           	clr.l -(sp)
    2f08:	2f2f 003c      	move.l 60(sp),-(sp)
    2f0c:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    2f12:	4e95           	jsr (a5)
    2f14:	4fef 0010      	lea 16(sp),sp
    2f18:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2f1c:	7cff           	moveq #-1,d6
    2f1e:	2e0a           	move.l a2,d7
    2f20:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2f24:	7a00           	moveq #0,d5
    2f26:	3a06           	move.w d6,d5
    2f28:	2f0e           	move.l a6,-(sp)
    2f2a:	2f05           	move.l d5,-(sp)
    2f2c:	2f0a           	move.l a2,-(sp)
    2f2e:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    2f34:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2f36:	486e 0001      	pea 1(a6)
    2f3a:	2f05           	move.l d5,-(sp)
    2f3c:	486a 0030      	pea 48(a2)
    2f40:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    2f46:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2f48:	4646           	not.w d6
    2f4a:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2f4c:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    2f50:	4fef 0020      	lea 32(sp),sp
    2f54:	7007           	moveq #7,d0
    2f56:	b08e           	cmp.l a6,d0
    2f58:	66ca           	bne.s 2f24 <ZoomTest+0x17a2>
    2f5a:	2a2f 004c      	move.l 76(sp),d5
    2f5e:	307c 0014      	movea.w #20,a0
    2f62:	2f47 0030      	move.l d7,48(sp)
    2f66:	2f4b 0048      	move.l a3,72(sp)
    2f6a:	2f42 004c      	move.l d2,76(sp)
    2f6e:	2448           	movea.l a0,a2
    2f70:	2c45           	movea.l d5,a6
    2f72:	4dee fe50      	lea -432(a6),a6
    2f76:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    2f7a:	2f0b           	move.l a3,-(sp)
    2f7c:	3f06           	move.w d6,-(sp)
    2f7e:	4267           	clr.w -(sp)
    2f80:	2f0e           	move.l a6,-(sp)
    2f82:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    2f88:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2f8a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2f8e:	4646           	not.w d6
    2f90:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    2f92:	4fef 0010      	lea 16(sp),sp
    2f96:	ba8e           	cmp.l a6,d5
    2f98:	66e0           	bne.s 2f7a <ZoomTest+0x17f8>
    2f9a:	2e0a           	move.l a2,d7
    2f9c:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    2fa0:	7400           	moveq #0,d2
    2fa2:	3406           	move.w d6,d2
    2fa4:	2f07           	move.l d7,-(sp)
    2fa6:	2f02           	move.l d2,-(sp)
    2fa8:	2f0e           	move.l a6,-(sp)
    2faa:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    2fb0:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    2fb2:	5287           	addq.l #1,d7
    2fb4:	2f07           	move.l d7,-(sp)
    2fb6:	2f02           	move.l d2,-(sp)
    2fb8:	486e 0030      	pea 48(a6)
    2fbc:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    2fc2:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2fc4:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    2fc6:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    2fca:	4fef 0020      	lea 32(sp),sp
    2fce:	be8b           	cmp.l a3,d7
    2fd0:	66ce           	bne.s 2fa0 <ZoomTest+0x181e>
    2fd2:	0685 0000 0510 	addi.l #1296,d5
    2fd8:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    2fdc:	b4fc 0107      	cmpa.w #263,a2
    2fe0:	668e           	bne.s 2f70 <ZoomTest+0x17ee>
    2fe2:	246f 0030      	movea.l 48(sp),a2
    2fe6:	266f 0048      	movea.l 72(sp),a3
    2fea:	242f 004c      	move.l 76(sp),d2
    2fee:	41ec 2ee4      	lea 12004(a4),a0
    2ff2:	2f48 0030      	move.l a0,48(sp)
    2ff6:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2ff8:	2f0a           	move.l a2,-(sp)
    2ffa:	3f06           	move.w d6,-(sp)
    2ffc:	4267           	clr.w -(sp)
    2ffe:	2f0e           	move.l a6,-(sp)
    3000:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3006:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3008:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    300c:	4646           	not.w d6
    300e:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    3010:	4fef 0010      	lea 16(sp),sp
    3014:	b4fc 00fe      	cmpa.w #254,a2
    3018:	66de           	bne.s 2ff8 <ZoomTest+0x1876>
    301a:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    301e:	7a00           	moveq #0,d5
    3020:	3a06           	move.w d6,d5
    3022:	2f0b           	move.l a3,-(sp)
    3024:	2f05           	move.l d5,-(sp)
    3026:	2f0a           	move.l a2,-(sp)
    3028:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    302e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    3030:	486b 0001      	pea 1(a3)
    3034:	2f05           	move.l d5,-(sp)
    3036:	486a 0030      	pea 48(a2)
    303a:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3040:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3042:	4646           	not.w d6
    3044:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3046:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    304a:	4fef 0020      	lea 32(sp),sp
    304e:	b6fc 010d      	cmpa.w #269,a3
    3052:	66ca           	bne.s 301e <ZoomTest+0x189c>
  TestRow( valsupposed, valactual, mask, 269);
    3054:	2f0b           	move.l a3,-(sp)
    3056:	3f06           	move.w d6,-(sp)
    3058:	4267           	clr.w -(sp)
    305a:	2f2f 0044      	move.l 68(sp),-(sp)
    305e:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3064:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    3066:	4878 0001      	pea 1 <_start+0x1>
    306a:	4878 0009      	pea 9 <main+0x3>
    306e:	2f03           	move.l d3,-(sp)
    3070:	2f0c           	move.l a4,-(sp)
    3072:	4eba dc46      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3076:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    307c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3080:	4fef 001c      	lea 28(sp),sp
    3084:	4297           	clr.l (sp)
    3086:	2f3c 0000 ffff 	move.l #65535,-(sp)
    308c:	2f2f 0034      	move.l 52(sp),-(sp)
    3090:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3096:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    3098:	4878 0001      	pea 1 <_start+0x1>
    309c:	42a7           	clr.l -(sp)
    309e:	2f2f 0058      	move.l 88(sp),-(sp)
    30a2:	4879 0001 7590 	pea 17590 <destlinezoom10>
    30a8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    30aa:	4fef 0020      	lea 32(sp),sp
    30ae:	4878 0002      	pea 2 <_start+0x2>
    30b2:	42a7           	clr.l -(sp)
    30b4:	2f2f 0058      	move.l 88(sp),-(sp)
    30b8:	4879 0001 7590 	pea 17590 <destlinezoom10>
    30be:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    30c0:	2a2f 006c      	move.l 108(sp),d5
    30c4:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    30c8:	7eff           	moveq #-1,d7
    30ca:	2644           	movea.l d4,a3
    30cc:	2445           	movea.l d5,a2
    30ce:	45ea fe80      	lea -384(a2),a2
    30d2:	280b           	move.l a3,d4
    30d4:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    30d6:	2f04           	move.l d4,-(sp)
    30d8:	3f07           	move.w d7,-(sp)
    30da:	4267           	clr.w -(sp)
    30dc:	2f0a           	move.l a2,-(sp)
    30de:	4879 0001 7590 	pea 17590 <destlinezoom10>
    30e4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    30e6:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    30ea:	4647           	not.w d7
    30ec:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    30ee:	4fef 0010      	lea 16(sp),sp
    30f2:	ba8a           	cmp.l a2,d5
    30f4:	66e0           	bne.s 30d6 <ZoomTest+0x1954>
    30f6:	280b           	move.l a3,d4
    30f8:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    30fc:	7c00           	moveq #0,d6
    30fe:	3c07           	move.w d7,d6
    3100:	2f04           	move.l d4,-(sp)
    3102:	2f06           	move.l d6,-(sp)
    3104:	2f0a           	move.l a2,-(sp)
    3106:	4879 0001 7590 	pea 17590 <destlinezoom10>
    310c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    310e:	2f04           	move.l d4,-(sp)
    3110:	2f06           	move.l d6,-(sp)
    3112:	486a 0030      	pea 48(a2)
    3116:	4879 0001 7590 	pea 17590 <destlinezoom10>
    311c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    311e:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    3122:	4647           	not.w d7
    3124:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    3126:	4fef 0020      	lea 32(sp),sp
    312a:	bdca           	cmpa.l a2,a6
    312c:	66ce           	bne.s 30fc <ZoomTest+0x197a>
    312e:	0685 0000 0540 	addi.l #1344,d5
    3134:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    3138:	b6fc 0107      	cmpa.w #263,a3
    313c:	668e           	bne.s 30cc <ZoomTest+0x194a>
    313e:	246f 0058      	movea.l 88(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    3142:	2f02           	move.l d2,-(sp)
    3144:	3f07           	move.w d7,-(sp)
    3146:	4267           	clr.w -(sp)
    3148:	2f0a           	move.l a2,-(sp)
    314a:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3150:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3152:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3156:	4647           	not.w d7
    3158:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    315a:	4fef 0010      	lea 16(sp),sp
    315e:	0c82 0000 0107 	cmpi.l #263,d2
    3164:	66dc           	bne.s 3142 <ZoomTest+0x19c0>
    3166:	2c43           	movea.l d3,a6
    3168:	4dee 3154      	lea 12628(a6),a6
    316c:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    3170:	7400           	moveq #0,d2
    3172:	3407           	move.w d7,d2
    3174:	486a ffff      	pea -1(a2)
    3178:	2f02           	move.l d2,-(sp)
    317a:	2f0e           	move.l a6,-(sp)
    317c:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3182:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3184:	2f0a           	move.l a2,-(sp)
    3186:	2f02           	move.l d2,-(sp)
    3188:	486e 0030      	pea 48(a6)
    318c:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3192:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3194:	4647           	not.w d7
    3196:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3198:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    319c:	4fef 0020      	lea 32(sp),sp
    31a0:	b4fc 010e      	cmpa.w #270,a2
    31a4:	66ca           	bne.s 3170 <ZoomTest+0x19ee>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    31a6:	4878 0001      	pea 1 <_start+0x1>
    31aa:	4878 000a      	pea a <main+0x4>
    31ae:	2f0c           	move.l a4,-(sp)
    31b0:	2f03           	move.l d3,-(sp)
    31b2:	4eba db06      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    31b6:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    31bc:	4eae ff1c      	jsr -228(a6)
    31c0:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    31c4:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    31c8:	7800           	moveq #0,d4
  mask = 0xffff;
    31ca:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    31cc:	2f04           	move.l d4,-(sp)
    31ce:	3f02           	move.w d2,-(sp)
    31d0:	4267           	clr.w -(sp)
    31d2:	2f0a           	move.l a2,-(sp)
    31d4:	4879 0001 7564 	pea 17564 <destlinezoom11>
    31da:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    31dc:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    31e0:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    31e2:	5284           	addq.l #1,d4
    31e4:	4fef 0010      	lea 16(sp),sp
    31e8:	7006           	moveq #6,d0
    31ea:	b084           	cmp.l d4,d0
    31ec:	66de           	bne.s 31cc <ZoomTest+0x1a4a>
    31ee:	266f 0054      	movea.l 84(sp),a3
    31f2:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    31f6:	7800           	moveq #0,d4
    31f8:	3802           	move.w d2,d4
    31fa:	2f0a           	move.l a2,-(sp)
    31fc:	2f04           	move.l d4,-(sp)
    31fe:	2f0b           	move.l a3,-(sp)
    3200:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3206:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    3208:	486a 0001      	pea 1(a2)
    320c:	2f04           	move.l d4,-(sp)
    320e:	486b 0030      	pea 48(a3)
    3212:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3218:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    321a:	4642           	not.w d2
    321c:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    321e:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3222:	4fef 0020      	lea 32(sp),sp
    3226:	721c           	moveq #28,d1
    3228:	b28a           	cmp.l a2,d1
    322a:	66ca           	bne.s 31f6 <ZoomTest+0x1a74>
    322c:	280c           	move.l a4,d4
    322e:	0684 0000 0694 	addi.l #1684,d4
    3234:	347c 0023      	movea.w #35,a2
    3238:	2644           	movea.l d4,a3
    323a:	47eb feb0      	lea -336(a3),a3
    323e:	2a0a           	move.l a2,d5
    3240:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    3242:	2f05           	move.l d5,-(sp)
    3244:	3f02           	move.w d2,-(sp)
    3246:	4267           	clr.w -(sp)
    3248:	2f0b           	move.l a3,-(sp)
    324a:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3250:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3252:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3256:	4642           	not.w d2
    3258:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    325a:	4fef 0010      	lea 16(sp),sp
    325e:	b88b           	cmp.l a3,d4
    3260:	66e0           	bne.s 3242 <ZoomTest+0x1ac0>
    3262:	2c4a           	movea.l a2,a6
    3264:	2c0b           	move.l a3,d6
    3266:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    326c:	7a00           	moveq #0,d5
    326e:	3a02           	move.w d2,d5
    3270:	2f0e           	move.l a6,-(sp)
    3272:	2f05           	move.l d5,-(sp)
    3274:	2f0b           	move.l a3,-(sp)
    3276:	4879 0001 7564 	pea 17564 <destlinezoom11>
    327c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    327e:	486e ffe8      	pea -24(a6)
    3282:	2f05           	move.l d5,-(sp)
    3284:	486b 0030      	pea 48(a3)
    3288:	4879 0001 7564 	pea 17564 <destlinezoom11>
    328e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3290:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3294:	4642           	not.w d2
    3296:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    3298:	4fef 0020      	lea 32(sp),sp
    329c:	bc8b           	cmp.l a3,d6
    329e:	66cc           	bne.s 326c <ZoomTest+0x1aea>
    32a0:	0684 0000 0570 	addi.l #1392,d4
    32a6:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    32aa:	b4fc 010b      	cmpa.w #267,a2
    32ae:	6688           	bne.s 3238 <ZoomTest+0x1ab6>
    32b0:	45ec 30c4      	lea 12484(a4),a2
    32b4:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    32ba:	7800           	moveq #0,d4
    32bc:	3802           	move.w d2,d4
    32be:	2f05           	move.l d5,-(sp)
    32c0:	2f04           	move.l d4,-(sp)
    32c2:	2f0a           	move.l a2,-(sp)
    32c4:	4879 0001 7564 	pea 17564 <destlinezoom11>
    32ca:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    32cc:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    32d0:	4642           	not.w d2
    32d2:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    32d4:	4fef 0010      	lea 16(sp),sp
    32d8:	0c85 0000 010b 	cmpi.l #267,d5
    32de:	66da           	bne.s 32ba <ZoomTest+0x1b38>
    32e0:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    32e6:	2f05           	move.l d5,-(sp)
    32e8:	2f02           	move.l d2,-(sp)
    32ea:	2f2f 006c      	move.l 108(sp),-(sp)
    32ee:	4879 0001 7564 	pea 17564 <destlinezoom11>
    32f4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    32f6:	4878 010c      	pea 10c <main+0x106>
    32fa:	2f02           	move.l d2,-(sp)
    32fc:	2f2f 0080      	move.l 128(sp),-(sp)
    3300:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3306:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    3308:	4fef 0020      	lea 32(sp),sp
    330c:	4878 010d      	pea 10d <main+0x107>
    3310:	2f04           	move.l d4,-(sp)
    3312:	2f2f 0044      	move.l 68(sp),-(sp)
    3316:	4879 0001 7564 	pea 17564 <destlinezoom11>
    331c:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    331e:	4878 0001      	pea 1 <_start+0x1>
    3322:	4878 000b      	pea b <main+0x5>
    3326:	2f03           	move.l d3,-(sp)
    3328:	2f0c           	move.l a4,-(sp)
    332a:	4eba d98e      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    332e:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    3334:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3338:	4fef 001c      	lea 28(sp),sp
    333c:	4297           	clr.l (sp)
    333e:	42a7           	clr.l -(sp)
    3340:	2f2f 0034      	move.l 52(sp),-(sp)
    3344:	4879 0001 7538 	pea 17538 <destlinezoom12>
    334a:	4e95           	jsr (a5)
    334c:	4fef 0010      	lea 16(sp),sp
    3350:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    3354:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    3358:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    335c:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    335e:	7a00           	moveq #0,d5
    3360:	3a02           	move.w d2,d5
    3362:	2f0a           	move.l a2,-(sp)
    3364:	2f05           	move.l d5,-(sp)
    3366:	2f0b           	move.l a3,-(sp)
    3368:	4879 0001 7538 	pea 17538 <destlinezoom12>
    336e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3370:	486a 0001      	pea 1(a2)
    3374:	2f05           	move.l d5,-(sp)
    3376:	486b 0030      	pea 48(a3)
    337a:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3380:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3382:	4642           	not.w d2
    3384:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3386:	4fef 0020      	lea 32(sp),sp
    338a:	7019           	moveq #25,d0
    338c:	b08a           	cmp.l a2,d0
    338e:	673e           	beq.s 33ce <ZoomTest+0x1c4c>
    3390:	200b           	move.l a3,d0
    3392:	0680 0000 00c0 	addi.l #192,d0
    3398:	2644           	movea.l d4,a3
    339a:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    339c:	7a00           	moveq #0,d5
    339e:	3a02           	move.w d2,d5
    33a0:	2f0a           	move.l a2,-(sp)
    33a2:	2f05           	move.l d5,-(sp)
    33a4:	2f0b           	move.l a3,-(sp)
    33a6:	4879 0001 7538 	pea 17538 <destlinezoom12>
    33ac:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    33ae:	486a 0001      	pea 1(a2)
    33b2:	2f05           	move.l d5,-(sp)
    33b4:	486b 0030      	pea 48(a3)
    33b8:	4879 0001 7538 	pea 17538 <destlinezoom12>
    33be:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    33c0:	4642           	not.w d2
    33c2:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    33c4:	4fef 0020      	lea 32(sp),sp
    33c8:	7019           	moveq #25,d0
    33ca:	b08a           	cmp.l a2,d0
    33cc:	66c2           	bne.s 3390 <ZoomTest+0x1c0e>
    33ce:	2a04           	move.l d4,d5
    33d0:	0685 0000 0120 	addi.l #288,d5
    33d6:	347c 001f      	movea.w #31,a2
    33da:	2645           	movea.l d5,a3
    33dc:	47eb fee0      	lea -288(a3),a3
    33e0:	2c0a           	move.l a2,d6
    33e2:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    33e4:	2f06           	move.l d6,-(sp)
    33e6:	3f02           	move.w d2,-(sp)
    33e8:	4267           	clr.w -(sp)
    33ea:	2f0b           	move.l a3,-(sp)
    33ec:	4879 0001 7538 	pea 17538 <destlinezoom12>
    33f2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    33f4:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    33f8:	4642           	not.w d2
    33fa:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    33fc:	4fef 0010      	lea 16(sp),sp
    3400:	ba8b           	cmp.l a3,d5
    3402:	66e0           	bne.s 33e4 <ZoomTest+0x1c62>
    3404:	2c4a           	movea.l a2,a6
    3406:	2e0b           	move.l a3,d7
    3408:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    340e:	7c00           	moveq #0,d6
    3410:	3c02           	move.w d2,d6
    3412:	2f0e           	move.l a6,-(sp)
    3414:	2f06           	move.l d6,-(sp)
    3416:	2f0b           	move.l a3,-(sp)
    3418:	4879 0001 7538 	pea 17538 <destlinezoom12>
    341e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    3420:	486e 0001      	pea 1(a6)
    3424:	2f06           	move.l d6,-(sp)
    3426:	486b 0030      	pea 48(a3)
    342a:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3430:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3432:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3436:	4642           	not.w d2
    3438:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    343a:	4fef 0020      	lea 32(sp),sp
    343e:	be8b           	cmp.l a3,d7
    3440:	66cc           	bne.s 340e <ZoomTest+0x1c8c>
    3442:	0685 0000 05a0 	addi.l #1440,d5
    3448:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    344c:	b4fc 010f      	cmpa.w #271,a2
    3450:	6688           	bne.s 33da <ZoomTest+0x1c58>
    3452:	2444           	movea.l d4,a2
    3454:	45ea 2d00      	lea 11520(a2),a2
    3458:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    345e:	2f04           	move.l d4,-(sp)
    3460:	3f02           	move.w d2,-(sp)
    3462:	4267           	clr.w -(sp)
    3464:	2f0a           	move.l a2,-(sp)
    3466:	4879 0001 7538 	pea 17538 <destlinezoom12>
    346c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    346e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3472:	4642           	not.w d2
    3474:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    3476:	4fef 0010      	lea 16(sp),sp
    347a:	0c84 0000 0109 	cmpi.l #265,d4
    3480:	66dc           	bne.s 345e <ZoomTest+0x1cdc>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3482:	4878 0001      	pea 1 <_start+0x1>
    3486:	4878 000c      	pea c <main+0x6>
    348a:	2f0c           	move.l a4,-(sp)
    348c:	2f03           	move.l d3,-(sp)
    348e:	4eba d82a      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3492:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    3498:	4eae ff1c      	jsr -228(a6)
    349c:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    34a0:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    34a4:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    34a8:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    34aa:	7400           	moveq #0,d2
    34ac:	3406           	move.w d6,d2
    34ae:	486a ffff      	pea -1(a2)
    34b2:	2f02           	move.l d2,-(sp)
    34b4:	2f0b           	move.l a3,-(sp)
    34b6:	4879 0001 750c 	pea 1750c <destlinezoom13>
    34bc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    34be:	2f0a           	move.l a2,-(sp)
    34c0:	2f02           	move.l d2,-(sp)
    34c2:	486b 0030      	pea 48(a3)
    34c6:	4879 0001 750c 	pea 1750c <destlinezoom13>
    34cc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    34ce:	4646           	not.w d6
    34d0:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    34d2:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    34d6:	4fef 0020      	lea 32(sp),sp
    34da:	7217           	moveq #23,d1
    34dc:	b28a           	cmp.l a2,d1
    34de:	66ca           	bne.s 34aa <ZoomTest+0x1d28>
    34e0:	240c           	move.l a4,d2
    34e2:	0682 0000 0514 	addi.l #1300,d2
    34e8:	3c7c 001b      	movea.w #27,a6
    34ec:	2a0a           	move.l a2,d5
    34ee:	2642           	movea.l d2,a3
    34f0:	47eb ff10      	lea -240(a3),a3
    34f4:	280e           	move.l a6,d4
    34f6:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    34f8:	2f04           	move.l d4,-(sp)
    34fa:	3f06           	move.w d6,-(sp)
    34fc:	4267           	clr.w -(sp)
    34fe:	2f0b           	move.l a3,-(sp)
    3500:	4879 0001 750c 	pea 1750c <destlinezoom13>
    3506:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3508:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    350c:	4646           	not.w d6
    350e:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    3510:	4fef 0010      	lea 16(sp),sp
    3514:	b48b           	cmp.l a3,d2
    3516:	66e0           	bne.s 34f8 <ZoomTest+0x1d76>
    3518:	244e           	movea.l a6,a2
    351a:	2e0b           	move.l a3,d7
    351c:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    3522:	7800           	moveq #0,d4
    3524:	3806           	move.w d6,d4
    3526:	2f0a           	move.l a2,-(sp)
    3528:	2f04           	move.l d4,-(sp)
    352a:	2f0b           	move.l a3,-(sp)
    352c:	4879 0001 750c 	pea 1750c <destlinezoom13>
    3532:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    3534:	486a 0001      	pea 1(a2)
    3538:	2f04           	move.l d4,-(sp)
    353a:	486b 0030      	pea 48(a3)
    353e:	4879 0001 750c 	pea 1750c <destlinezoom13>
    3544:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3546:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    354a:	4646           	not.w d6
    354c:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    354e:	4fef 0020      	lea 32(sp),sp
    3552:	be8b           	cmp.l a3,d7
    3554:	66cc           	bne.s 3522 <ZoomTest+0x1da0>
    3556:	0682 0000 05d0 	addi.l #1488,d2
    355c:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    3560:	bcfc 0113      	cmpa.w #275,a6
    3564:	6688           	bne.s 34ee <ZoomTest+0x1d6c>
    3566:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    3568:	4878 0001      	pea 1 <_start+0x1>
    356c:	4878 000d      	pea d <main+0x7>
    3570:	2f03           	move.l d3,-(sp)
    3572:	2f0c           	move.l a4,-(sp)
    3574:	4eba d744      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3578:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    357e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3582:	42a7           	clr.l -(sp)
    3584:	2f3c 0000 ffff 	move.l #65535,-(sp)
    358a:	2f2f 0044      	move.l 68(sp),-(sp)
    358e:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    3594:	4e95           	jsr (a5)
    3596:	4fef 0020      	lea 32(sp),sp
    359a:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    359e:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    35a2:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    35a6:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    35a8:	7800           	moveq #0,d4
    35aa:	3807           	move.w d7,d4
    35ac:	2f0b           	move.l a3,-(sp)
    35ae:	2f04           	move.l d4,-(sp)
    35b0:	2f0e           	move.l a6,-(sp)
    35b2:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    35b8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    35ba:	486b 0001      	pea 1(a3)
    35be:	2f04           	move.l d4,-(sp)
    35c0:	486e 0030      	pea 48(a6)
    35c4:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    35ca:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    35cc:	4647           	not.w d7
    35ce:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    35d0:	4fef 0020      	lea 32(sp),sp
    35d4:	7013           	moveq #19,d0
    35d6:	b08b           	cmp.l a3,d0
    35d8:	673e           	beq.s 3618 <ZoomTest+0x1e96>
    35da:	200e           	move.l a6,d0
    35dc:	0680 0000 00c0 	addi.l #192,d0
    35e2:	2c42           	movea.l d2,a6
    35e4:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    35e6:	7800           	moveq #0,d4
    35e8:	3807           	move.w d7,d4
    35ea:	2f0b           	move.l a3,-(sp)
    35ec:	2f04           	move.l d4,-(sp)
    35ee:	2f0e           	move.l a6,-(sp)
    35f0:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    35f6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    35f8:	486b 0001      	pea 1(a3)
    35fc:	2f04           	move.l d4,-(sp)
    35fe:	486e 0030      	pea 48(a6)
    3602:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    3608:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    360a:	4647           	not.w d7
    360c:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    360e:	4fef 0020      	lea 32(sp),sp
    3612:	7013           	moveq #19,d0
    3614:	b08b           	cmp.l a3,d0
    3616:	66c2           	bne.s 35da <ZoomTest+0x1e58>
    3618:	2802           	move.l d2,d4
    361a:	0684 0000 00c0 	addi.l #192,d4
    3620:	2c0b           	move.l a3,d6
    3622:	2c44           	movea.l d4,a6
    3624:	4dee ff40      	lea -192(a6),a6
    3628:	2a0a           	move.l a2,d5
    362a:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    362c:	2f05           	move.l d5,-(sp)
    362e:	3f07           	move.w d7,-(sp)
    3630:	4267           	clr.w -(sp)
    3632:	2f0e           	move.l a6,-(sp)
    3634:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    363a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    363c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3640:	4647           	not.w d7
    3642:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    3644:	4fef 0010      	lea 16(sp),sp
    3648:	b88e           	cmp.l a6,d4
    364a:	66e0           	bne.s 362c <ZoomTest+0x1eaa>
    364c:	264a           	movea.l a2,a3
    364e:	41ee 0540      	lea 1344(a6),a0
    3652:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3656:	7a00           	moveq #0,d5
    3658:	3a07           	move.w d7,d5
    365a:	2f0b           	move.l a3,-(sp)
    365c:	2f05           	move.l d5,-(sp)
    365e:	2f0e           	move.l a6,-(sp)
    3660:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    3666:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    3668:	486b 0001      	pea 1(a3)
    366c:	2f05           	move.l d5,-(sp)
    366e:	486e 0030      	pea 48(a6)
    3672:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    3678:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    367a:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    367e:	4647           	not.w d7
    3680:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    3682:	4fef 0020      	lea 32(sp),sp
    3686:	bdef 003c      	cmpa.l 60(sp),a6
    368a:	66ca           	bne.s 3656 <ZoomTest+0x1ed4>
    368c:	0684 0000 0600 	addi.l #1536,d4
    3692:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    3696:	b4fc 00f7      	cmpa.w #247,a2
    369a:	6686           	bne.s 3622 <ZoomTest+0x1ea0>
    369c:	2646           	movea.l d6,a3
    369e:	2c42           	movea.l d2,a6
    36a0:	4dee 2a00      	lea 10752(a6),a6
    36a4:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    36a8:	2f0a           	move.l a2,-(sp)
    36aa:	3f07           	move.w d7,-(sp)
    36ac:	4267           	clr.w -(sp)
    36ae:	2f0e           	move.l a6,-(sp)
    36b0:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    36b6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    36b8:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    36bc:	4647           	not.w d7
    36be:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    36c0:	4fef 0010      	lea 16(sp),sp
    36c4:	b4fc 00f7      	cmpa.w #247,a2
    36c8:	66de           	bne.s 36a8 <ZoomTest+0x1f26>
    36ca:	0682 0000 2ac0 	addi.l #10944,d2
    36d0:	2c4a           	movea.l a2,a6
    36d2:	280a           	move.l a2,d4
    36d4:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    36d6:	7400           	moveq #0,d2
    36d8:	3407           	move.w d7,d2
    36da:	2f0e           	move.l a6,-(sp)
    36dc:	2f02           	move.l d2,-(sp)
    36de:	2f0a           	move.l a2,-(sp)
    36e0:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    36e6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    36e8:	486e 0001      	pea 1(a6)
    36ec:	2f02           	move.l d2,-(sp)
    36ee:	486a 0030      	pea 48(a2)
    36f2:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    36f8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    36fa:	4647           	not.w d7
    36fc:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    36fe:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    3702:	4fef 0020      	lea 32(sp),sp
    3706:	bcfc 010f      	cmpa.w #271,a6
    370a:	66ca           	bne.s 36d6 <ZoomTest+0x1f54>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    370c:	4878 0001      	pea 1 <_start+0x1>
    3710:	4878 000e      	pea e <main+0x8>
    3714:	2f0c           	move.l a4,-(sp)
    3716:	2f03           	move.l d3,-(sp)
    3718:	4eba d5a0      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    371c:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    3722:	4eae ff1c      	jsr -228(a6)
    3726:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    372a:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    372e:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    3732:	4246           	clr.w d6
    3734:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3736:	7400           	moveq #0,d2
    3738:	3406           	move.w d6,d2
    373a:	486e ffff      	pea -1(a6)
    373e:	2f02           	move.l d2,-(sp)
    3740:	2f0a           	move.l a2,-(sp)
    3742:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    3748:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    374a:	2f0e           	move.l a6,-(sp)
    374c:	2f02           	move.l d2,-(sp)
    374e:	486a 0030      	pea 48(a2)
    3752:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    3758:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    375a:	4646           	not.w d6
    375c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    375e:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    3762:	4fef 0020      	lea 32(sp),sp
    3766:	7011           	moveq #17,d0
    3768:	b08e           	cmp.l a6,d0
    376a:	66ca           	bne.s 3736 <ZoomTest+0x1fb4>
    376c:	2444           	movea.l d4,a2
    376e:	242f 0060      	move.l 96(sp),d2
    3772:	2c42           	movea.l d2,a6
    3774:	4dee ff70      	lea -144(a6),a6
    3778:	280b           	move.l a3,d4
    377a:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    377c:	2f04           	move.l d4,-(sp)
    377e:	3f06           	move.w d6,-(sp)
    3780:	4267           	clr.w -(sp)
    3782:	2f0e           	move.l a6,-(sp)
    3784:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    378a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    378c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3790:	4646           	not.w d6
    3792:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    3794:	4fef 0010      	lea 16(sp),sp
    3798:	b48e           	cmp.l a6,d2
    379a:	66e0           	bne.s 377c <ZoomTest+0x1ffa>
    379c:	280b           	move.l a3,d4
    379e:	2e0e           	move.l a6,d7
    37a0:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    37a6:	7a00           	moveq #0,d5
    37a8:	3a06           	move.w d6,d5
    37aa:	2f04           	move.l d4,-(sp)
    37ac:	2f05           	move.l d5,-(sp)
    37ae:	2f0e           	move.l a6,-(sp)
    37b0:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    37b6:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    37b8:	2f04           	move.l d4,-(sp)
    37ba:	2f05           	move.l d5,-(sp)
    37bc:	486e 0030      	pea 48(a6)
    37c0:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    37c6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    37c8:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    37cc:	4646           	not.w d6
    37ce:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    37d0:	4fef 0020      	lea 32(sp),sp
    37d4:	be8e           	cmp.l a6,d7
    37d6:	66ce           	bne.s 37a6 <ZoomTest+0x2024>
    37d8:	0682 0000 0630 	addi.l #1584,d2
    37de:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    37e2:	b6fc 00fa      	cmpa.w #250,a3
    37e6:	668a           	bne.s 3772 <ZoomTest+0x1ff0>
    37e8:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    37ec:	2f0a           	move.l a2,-(sp)
    37ee:	3f06           	move.w d6,-(sp)
    37f0:	4267           	clr.w -(sp)
    37f2:	2f0b           	move.l a3,-(sp)
    37f4:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    37fa:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    37fc:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    3800:	4646           	not.w d6
    3802:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    3804:	4fef 0010      	lea 16(sp),sp
    3808:	b4fc 00fa      	cmpa.w #250,a2
    380c:	66de           	bne.s 37ec <ZoomTest+0x206a>
    380e:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3812:	7400           	moveq #0,d2
    3814:	3406           	move.w d6,d2
    3816:	2f0a           	move.l a2,-(sp)
    3818:	2f02           	move.l d2,-(sp)
    381a:	2f0b           	move.l a3,-(sp)
    381c:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    3822:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    3824:	486a 0001      	pea 1(a2)
    3828:	2f02           	move.l d2,-(sp)
    382a:	486b 0030      	pea 48(a3)
    382e:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    3834:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3836:	4646           	not.w d6
    3838:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    383a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    383e:	4fef 0020      	lea 32(sp),sp
    3842:	b4fc 010e      	cmpa.w #270,a2
    3846:	66ca           	bne.s 3812 <ZoomTest+0x2090>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    3848:	4878 0001      	pea 1 <_start+0x1>
    384c:	4878 000f      	pea f <main+0x9>
    3850:	2f03           	move.l d3,-(sp)
    3852:	2f0c           	move.l a4,-(sp)
    3854:	4eba d464      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3858:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    385e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3862:	42a7           	clr.l -(sp)
    3864:	42a7           	clr.l -(sp)
    3866:	2f2f 0044      	move.l 68(sp),-(sp)
    386a:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3870:	4e95           	jsr (a5)
    3872:	4fef 0020      	lea 32(sp),sp
    3876:	246f 0044      	movea.l 68(sp),a2
    387a:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    387e:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    3882:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    3884:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3886:	7a00           	moveq #0,d5
    3888:	3a02           	move.w d2,d5
    388a:	2f0b           	move.l a3,-(sp)
    388c:	2f05           	move.l d5,-(sp)
    388e:	2f04           	move.l d4,-(sp)
    3890:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3896:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3898:	486b 0001      	pea 1(a3)
    389c:	2f05           	move.l d5,-(sp)
    389e:	2044           	movea.l d4,a0
    38a0:	4868 0030      	pea 48(a0)
    38a4:	4879 0001 7488 	pea 17488 <destlinezoom16>
    38aa:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38ac:	4642           	not.w d2
    38ae:	2004           	move.l d4,d0
    38b0:	0680 0000 0120 	addi.l #288,d0
    38b6:	548b           	addq.l #2,a3
    38b8:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    38ba:	4fef 0020      	lea 32(sp),sp
    38be:	720c           	moveq #12,d1
    38c0:	b28b           	cmp.l a3,d1
    38c2:	6742           	beq.s 3906 <ZoomTest+0x2184>
    38c4:	2c4a           	movea.l a2,a6
    38c6:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    38c8:	7a00           	moveq #0,d5
    38ca:	3a02           	move.w d2,d5
    38cc:	2f0b           	move.l a3,-(sp)
    38ce:	2f05           	move.l d5,-(sp)
    38d0:	2f04           	move.l d4,-(sp)
    38d2:	4879 0001 7488 	pea 17488 <destlinezoom16>
    38d8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    38da:	486b 0001      	pea 1(a3)
    38de:	2f05           	move.l d5,-(sp)
    38e0:	2044           	movea.l d4,a0
    38e2:	4868 0030      	pea 48(a0)
    38e6:	4879 0001 7488 	pea 17488 <destlinezoom16>
    38ec:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38ee:	4642           	not.w d2
    38f0:	2004           	move.l d4,d0
    38f2:	0680 0000 0120 	addi.l #288,d0
    38f8:	548b           	addq.l #2,a3
    38fa:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    38fc:	4fef 0020      	lea 32(sp),sp
    3900:	720c           	moveq #12,d1
    3902:	b28b           	cmp.l a3,d1
    3904:	66be           	bne.s 38c4 <ZoomTest+0x2142>
    3906:	367c 000d      	movea.w #13,a3
    390a:	2a0c           	move.l a4,d5
    390c:	2e00           	move.l d0,d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    390e:	2f0b           	move.l a3,-(sp)
    3910:	7800           	moveq #0,d4
    3912:	3802           	move.w d2,d4
    3914:	2f04           	move.l d4,-(sp)
    3916:	2f0e           	move.l a6,-(sp)
    3918:	4879 0001 7488 	pea 17488 <destlinezoom16>
    391e:	4e95           	jsr (a5)
    3920:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3924:	3c02           	move.w d2,d6
    3926:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3928:	3f06           	move.w d6,-(sp)
    392a:	4267           	clr.w -(sp)
    392c:	486e 0030      	pea 48(a6)
    3930:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3936:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3938:	49eb 0003      	lea 3(a3),a4
    393c:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3940:	2c47           	movea.l d7,a6
    3942:	7e23           	moveq #35,d7
    3944:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3946:	2f0c           	move.l a4,-(sp)
    3948:	2f04           	move.l d4,-(sp)
    394a:	2f0a           	move.l a2,-(sp)
    394c:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3952:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3954:	486c 0001      	pea 1(a4)
    3958:	2f04           	move.l d4,-(sp)
    395a:	486a 0030      	pea 48(a2)
    395e:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3964:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3966:	3406           	move.w d6,d2
    3968:	41ea 00c0      	lea 192(a2),a0
    396c:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    396e:	4fef 0020      	lea 32(sp),sp
    3972:	be8c           	cmp.l a4,d7
    3974:	673a           	beq.s 39b0 <ZoomTest+0x222e>
    3976:	244e           	movea.l a6,a2
    3978:	2c48           	movea.l a0,a6
    397a:	7800           	moveq #0,d4
    397c:	3806           	move.w d6,d4
    397e:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3980:	2f0c           	move.l a4,-(sp)
    3982:	2f04           	move.l d4,-(sp)
    3984:	2f0a           	move.l a2,-(sp)
    3986:	4879 0001 7488 	pea 17488 <destlinezoom16>
    398c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    398e:	486c 0001      	pea 1(a4)
    3992:	2f04           	move.l d4,-(sp)
    3994:	486a 0030      	pea 48(a2)
    3998:	4879 0001 7488 	pea 17488 <destlinezoom16>
    399e:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    39a0:	3406           	move.w d6,d2
    39a2:	41ea 00c0      	lea 192(a2),a0
    39a6:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    39a8:	4fef 0020      	lea 32(sp),sp
    39ac:	be8c           	cmp.l a4,d7
    39ae:	66c6           	bne.s 3976 <ZoomTest+0x21f4>
    39b0:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    39b4:	b6fc 00fb      	cmpa.w #251,a3
    39b8:	674e           	beq.s 3a08 <ZoomTest+0x2286>
    39ba:	2e0a           	move.l a2,d7
    39bc:	0687 0000 0120 	addi.l #288,d7
    39c2:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    39c4:	2f0b           	move.l a3,-(sp)
    39c6:	7800           	moveq #0,d4
    39c8:	3802           	move.w d2,d4
    39ca:	2f04           	move.l d4,-(sp)
    39cc:	2f0e           	move.l a6,-(sp)
    39ce:	4879 0001 7488 	pea 17488 <destlinezoom16>
    39d4:	4e95           	jsr (a5)
    39d6:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    39da:	3c02           	move.w d2,d6
    39dc:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    39de:	3f06           	move.w d6,-(sp)
    39e0:	4267           	clr.w -(sp)
    39e2:	486e 0030      	pea 48(a6)
    39e6:	4879 0001 7488 	pea 17488 <destlinezoom16>
    39ec:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    39ee:	49eb 0003      	lea 3(a3),a4
    39f2:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    39f6:	2c47           	movea.l d7,a6
    39f8:	7e23           	moveq #35,d7
    39fa:	de8b           	add.l a3,d7
    39fc:	6000 ff48      	bra.w 3946 <ZoomTest+0x21c4>
    3a00:	7800           	moveq #0,d4
    3a02:	3802           	move.w d2,d4
    3a04:	6000 e754      	bra.w 215a <ZoomTest+0x9d8>
    3a08:	2845           	movea.l d5,a4
    3a0a:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3a0c:	2f0b           	move.l a3,-(sp)
    3a0e:	7c00           	moveq #0,d6
    3a10:	3c02           	move.w d2,d6
    3a12:	2f06           	move.l d6,-(sp)
    3a14:	2f0e           	move.l a6,-(sp)
    3a16:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3a1c:	4e95           	jsr (a5)
    3a1e:	4878 00fc      	pea fc <main+0xf6>
    3a22:	2f04           	move.l d4,-(sp)
    3a24:	486a 0090      	pea 144(a2)
    3a28:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3a2e:	4e95           	jsr (a5)
    3a30:	4fef 0020      	lea 32(sp),sp
    3a34:	347c 00fd      	movea.w #253,a2
    3a38:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3a3a:	2f0a           	move.l a2,-(sp)
    3a3c:	2f06           	move.l d6,-(sp)
    3a3e:	2f0b           	move.l a3,-(sp)
    3a40:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3a46:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3a48:	486a 0001      	pea 1(a2)
    3a4c:	2f06           	move.l d6,-(sp)
    3a4e:	486b 0030      	pea 48(a3)
    3a52:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3a58:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a5a:	4642           	not.w d2
    3a5c:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3a5e:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3a62:	4fef 0020      	lea 32(sp),sp
    3a66:	b4fc 010d      	cmpa.w #269,a2
    3a6a:	6736           	beq.s 3aa2 <ZoomTest+0x2320>
    3a6c:	7c00           	moveq #0,d6
    3a6e:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3a70:	2f0a           	move.l a2,-(sp)
    3a72:	2f06           	move.l d6,-(sp)
    3a74:	2f0b           	move.l a3,-(sp)
    3a76:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3a7c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3a7e:	486a 0001      	pea 1(a2)
    3a82:	2f06           	move.l d6,-(sp)
    3a84:	486b 0030      	pea 48(a3)
    3a88:	4879 0001 7488 	pea 17488 <destlinezoom16>
    3a8e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a90:	4642           	not.w d2
    3a92:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3a94:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3a98:	4fef 0020      	lea 32(sp),sp
    3a9c:	b4fc 010d      	cmpa.w #269,a2
    3aa0:	66ca           	bne.s 3a6c <ZoomTest+0x22ea>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3aa2:	4878 0001      	pea 1 <_start+0x1>
    3aa6:	4878 0010      	pea 10 <main+0xa>
    3aaa:	2f0c           	move.l a4,-(sp)
    3aac:	2f03           	move.l d3,-(sp)
    3aae:	4eba d20a      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3ab2:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    3ab8:	4eae ff1c      	jsr -228(a6)
    3abc:	4fef 0010      	lea 16(sp),sp
    3ac0:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3ac4:	7eff           	moveq #-1,d7
    3ac6:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3aca:	7400           	moveq #0,d2
    3acc:	3407           	move.w d7,d2
    3ace:	486a ffff      	pea -1(a2)
    3ad2:	2f02           	move.l d2,-(sp)
    3ad4:	2f0b           	move.l a3,-(sp)
    3ad6:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3adc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3ade:	2f0a           	move.l a2,-(sp)
    3ae0:	2f02           	move.l d2,-(sp)
    3ae2:	486b 0030      	pea 48(a3)
    3ae6:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3aec:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3aee:	4647           	not.w d7
    3af0:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3af2:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    3af6:	4fef 0020      	lea 32(sp),sp
    3afa:	700b           	moveq #11,d0
    3afc:	b08a           	cmp.l a2,d0
    3afe:	66ca           	bne.s 3aca <ZoomTest+0x2348>
    3b00:	2a0c           	move.l a4,d5
    3b02:	0685 0000 01e4 	addi.l #484,d5
    3b08:	367c 000a      	movea.w #10,a3
    3b0c:	2f4c 0034      	move.l a4,52(sp)
    3b10:	2c0a           	move.l a2,d6
    3b12:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3b14:	2f0b           	move.l a3,-(sp)
    3b16:	3f07           	move.w d7,-(sp)
    3b18:	4267           	clr.w -(sp)
    3b1a:	2f0a           	move.l a2,-(sp)
    3b1c:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3b22:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3b24:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    3b28:	3807           	move.w d7,d4
    3b2a:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3b2c:	49eb 0001      	lea 1(a3),a4
    3b30:	4fef 0010      	lea 16(sp),sp
    3b34:	45ea 0690      	lea 1680(a2),a2
    3b38:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3b3a:	7400           	moveq #0,d2
    3b3c:	3404           	move.w d4,d2
    3b3e:	2f0c           	move.l a4,-(sp)
    3b40:	2f02           	move.l d2,-(sp)
    3b42:	2f0e           	move.l a6,-(sp)
    3b44:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3b4a:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3b4c:	486c 0001      	pea 1(a4)
    3b50:	2f02           	move.l d2,-(sp)
    3b52:	486e 0030      	pea 48(a6)
    3b56:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3b5c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3b5e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3b62:	4644           	not.w d4
    3b64:	3e04           	move.w d4,d7
    3b66:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3b68:	4fef 0020      	lea 32(sp),sp
    3b6c:	bdc5           	cmpa.l d5,a6
    3b6e:	66ca           	bne.s 3b3a <ZoomTest+0x23b8>
    3b70:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3b74:	b6fc 00ff      	cmpa.w #255,a3
    3b78:	669a           	bne.s 3b14 <ZoomTest+0x2392>
    3b7a:	286f 0034      	movea.l 52(sp),a4
    3b7e:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3b80:	2f0b           	move.l a3,-(sp)
    3b82:	3f04           	move.w d4,-(sp)
    3b84:	4267           	clr.w -(sp)
    3b86:	486c 2fd4      	pea 12244(a4)
    3b8a:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3b90:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3b92:	4dec 3004      	lea 12292(a4),a6
    3b96:	4fef 0010      	lea 16(sp),sp
    3b9a:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3b9e:	2f0b           	move.l a3,-(sp)
    3ba0:	2f02           	move.l d2,-(sp)
    3ba2:	2f0e           	move.l a6,-(sp)
    3ba4:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3baa:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3bac:	486b 0001      	pea 1(a3)
    3bb0:	2f02           	move.l d2,-(sp)
    3bb2:	486e 0030      	pea 48(a6)
    3bb6:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3bbc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3bbe:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3bc0:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3bc4:	4fef 0020      	lea 32(sp),sp
    3bc8:	b6fc 010e      	cmpa.w #270,a3
    3bcc:	6736           	beq.s 3c04 <ZoomTest+0x2482>
    3bce:	7400           	moveq #0,d2
    3bd0:	3404           	move.w d4,d2
    3bd2:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3bd4:	2f0b           	move.l a3,-(sp)
    3bd6:	2f02           	move.l d2,-(sp)
    3bd8:	2f0e           	move.l a6,-(sp)
    3bda:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3be0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3be2:	486b 0001      	pea 1(a3)
    3be6:	2f02           	move.l d2,-(sp)
    3be8:	486e 0030      	pea 48(a6)
    3bec:	4879 0001 745c 	pea 1745c <destlinezoom17>
    3bf2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3bf4:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3bf6:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3bfa:	4fef 0020      	lea 32(sp),sp
    3bfe:	b6fc 010e      	cmpa.w #270,a3
    3c02:	66ca           	bne.s 3bce <ZoomTest+0x244c>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3c04:	4878 0001      	pea 1 <_start+0x1>
    3c08:	4878 0011      	pea 11 <main+0xb>
    3c0c:	2f03           	move.l d3,-(sp)
    3c0e:	2f0c           	move.l a4,-(sp)
    3c10:	4eba d0a8      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3c14:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    3c1a:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3c1e:	42a7           	clr.l -(sp)
    3c20:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3c26:	2f2f 0044      	move.l 68(sp),-(sp)
    3c2a:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3c30:	4e95           	jsr (a5)
    3c32:	4fef 0020      	lea 32(sp),sp
    3c36:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3c3a:	4242           	clr.w d2
    3c3c:	2a2f 0044      	move.l 68(sp),d5
    3c40:	2c2f 0038      	move.l 56(sp),d6
    3c44:	2c6f 0040      	movea.l 64(sp),a6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3c48:	7800           	moveq #0,d4
    3c4a:	3802           	move.w d2,d4
    3c4c:	2f0b           	move.l a3,-(sp)
    3c4e:	2f04           	move.l d4,-(sp)
    3c50:	2f0e           	move.l a6,-(sp)
    3c52:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3c58:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3c5a:	486b 0001      	pea 1(a3)
    3c5e:	2f04           	move.l d4,-(sp)
    3c60:	486e 0030      	pea 48(a6)
    3c64:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3c6a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c6c:	4642           	not.w d2
    3c6e:	200e           	move.l a6,d0
    3c70:	0680 0000 0120 	addi.l #288,d0
    3c76:	548b           	addq.l #2,a3
    3c78:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3c7a:	4fef 0020      	lea 32(sp),sp
    3c7e:	7209           	moveq #9,d1
    3c80:	b28b           	cmp.l a3,d1
    3c82:	6740           	beq.s 3cc4 <ZoomTest+0x2542>
    3c84:	2c05           	move.l d5,d6
    3c86:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3c88:	7800           	moveq #0,d4
    3c8a:	3802           	move.w d2,d4
    3c8c:	2f0b           	move.l a3,-(sp)
    3c8e:	2f04           	move.l d4,-(sp)
    3c90:	2f0e           	move.l a6,-(sp)
    3c92:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3c98:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3c9a:	486b 0001      	pea 1(a3)
    3c9e:	2f04           	move.l d4,-(sp)
    3ca0:	486e 0030      	pea 48(a6)
    3ca4:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3caa:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3cac:	4642           	not.w d2
    3cae:	200e           	move.l a6,d0
    3cb0:	0680 0000 0120 	addi.l #288,d0
    3cb6:	548b           	addq.l #2,a3
    3cb8:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3cba:	4fef 0020      	lea 32(sp),sp
    3cbe:	7209           	moveq #9,d1
    3cc0:	b28b           	cmp.l a3,d1
    3cc2:	66c0           	bne.s 3c84 <ZoomTest+0x2502>
    3cc4:	2f45 0044      	move.l d5,68(sp)
    3cc8:	2f46 0038      	move.l d6,56(sp)
    3ccc:	2805           	move.l d5,d4
    3cce:	2646           	movea.l d6,a3
    3cd0:	2c4a           	movea.l a2,a6
    3cd2:	2a00           	move.l d0,d5
    3cd4:	7e24           	moveq #36,d7
    3cd6:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3cd8:	7c00           	moveq #0,d6
    3cda:	3c02           	move.w d2,d6
    3cdc:	2f0e           	move.l a6,-(sp)
    3cde:	2f06           	move.l d6,-(sp)
    3ce0:	2f0b           	move.l a3,-(sp)
    3ce2:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3ce8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3cea:	486e 0001      	pea 1(a6)
    3cee:	2f06           	move.l d6,-(sp)
    3cf0:	486b 0030      	pea 48(a3)
    3cf4:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3cfa:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3cfc:	4642           	not.w d2
    3cfe:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3d00:	4fef 0020      	lea 32(sp),sp
    3d04:	bdc7           	cmpa.l d7,a6
    3d06:	673e           	beq.s 3d46 <ZoomTest+0x25c4>
    3d08:	200b           	move.l a3,d0
    3d0a:	0680 0000 0120 	addi.l #288,d0
    3d10:	2644           	movea.l d4,a3
    3d12:	2805           	move.l d5,d4
    3d14:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3d16:	7c00           	moveq #0,d6
    3d18:	3c02           	move.w d2,d6
    3d1a:	2f0e           	move.l a6,-(sp)
    3d1c:	2f06           	move.l d6,-(sp)
    3d1e:	2f0b           	move.l a3,-(sp)
    3d20:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3d26:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3d28:	486e 0001      	pea 1(a6)
    3d2c:	2f06           	move.l d6,-(sp)
    3d2e:	486b 0030      	pea 48(a3)
    3d32:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3d38:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3d3a:	4642           	not.w d2
    3d3c:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3d3e:	4fef 0020      	lea 32(sp),sp
    3d42:	bdc7           	cmpa.l d7,a6
    3d44:	66c2           	bne.s 3d08 <ZoomTest+0x2586>
    3d46:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    3d4a:	b4fc 0100      	cmpa.w #256,a2
    3d4e:	6718           	beq.s 3d68 <ZoomTest+0x25e6>
    3d50:	200b           	move.l a3,d0
    3d52:	0680 0000 0120 	addi.l #288,d0
    3d58:	2644           	movea.l d4,a3
    3d5a:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    3d5c:	2c4a           	movea.l a2,a6
    3d5e:	2a00           	move.l d0,d5
    3d60:	7e24           	moveq #36,d7
    3d62:	de8a           	add.l a2,d7
    3d64:	6000 ff72      	bra.w 3cd8 <ZoomTest+0x2556>
    3d68:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3d6a:	7800           	moveq #0,d4
    3d6c:	3802           	move.w d2,d4
    3d6e:	2f0a           	move.l a2,-(sp)
    3d70:	2f04           	move.l d4,-(sp)
    3d72:	2f0b           	move.l a3,-(sp)
    3d74:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3d7a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3d7c:	486a 0001      	pea 1(a2)
    3d80:	2f04           	move.l d4,-(sp)
    3d82:	486b 0030      	pea 48(a3)
    3d86:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3d8c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d8e:	4642           	not.w d2
    3d90:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3d92:	4fef 0020      	lea 32(sp),sp
    3d96:	b4fc 0108      	cmpa.w #264,a2
    3d9a:	673e           	beq.s 3dda <ZoomTest+0x2658>
    3d9c:	200b           	move.l a3,d0
    3d9e:	0680 0000 00c0 	addi.l #192,d0
    3da4:	2645           	movea.l d5,a3
    3da6:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3da8:	7800           	moveq #0,d4
    3daa:	3802           	move.w d2,d4
    3dac:	2f0a           	move.l a2,-(sp)
    3dae:	2f04           	move.l d4,-(sp)
    3db0:	2f0b           	move.l a3,-(sp)
    3db2:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3db8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3dba:	486a 0001      	pea 1(a2)
    3dbe:	2f04           	move.l d4,-(sp)
    3dc0:	486b 0030      	pea 48(a3)
    3dc4:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3dca:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3dcc:	4642           	not.w d2
    3dce:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3dd0:	4fef 0020      	lea 32(sp),sp
    3dd4:	b4fc 0108      	cmpa.w #264,a2
    3dd8:	66c2           	bne.s 3d9c <ZoomTest+0x261a>
  TestRow( valsupposed, valactual, mask, 0);
    3dda:	42a7           	clr.l -(sp)
    3ddc:	3f02           	move.w d2,-(sp)
    3dde:	4267           	clr.w -(sp)
    3de0:	2f05           	move.l d5,-(sp)
    3de2:	4879 0001 7430 	pea 17430 <destlinezoom18>
    3de8:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    3dea:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    3df0:	224c           	movea.l a4,a1
    3df2:	203c 0000 3740 	move.l #14144,d0
    3df8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    3dfc:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    3e02:	2243           	movea.l d3,a1
    3e04:	203c 0000 3740 	move.l #14144,d0
    3e0a:	4eae ff2e      	jsr -210(a6)
    3e0e:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3e12:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    3e18:	203c 0001 1440 	move.l #70720,d0
    3e1e:	7202           	moveq #2,d1
    3e20:	4eae ff3a      	jsr -198(a6)
    3e24:	2f40 0038      	move.l d0,56(sp)
  if( source == 0) {
    3e28:	6700 0388      	beq.w 41b2 <ZoomTest+0x2a30>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3e2c:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    3e32:	203c 0001 1440 	move.l #70720,d0
    3e38:	7202           	moveq #2,d1
    3e3a:	4eae ff3a      	jsr -198(a6)
    3e3e:	2f40 0034      	move.l d0,52(sp)
  if( destination == 0) {
    3e42:	6700 03da      	beq.w 421e <ZoomTest+0x2a9c>
    3e46:	242f 0038      	move.l 56(sp),d2
    3e4a:	0682 0000 ff00 	addi.l #65280,d2
    3e50:	246f 0038      	movea.l 56(sp),a2
    3e54:	4878 00f0      	pea f0 <main+0xea>
    3e58:	4878 0055      	pea 55 <main+0x4f>
    3e5c:	2f0a           	move.l a2,-(sp)
    3e5e:	4eba 04bc      	jsr 431c <memset>(pc)
    3e62:	4878 00f0      	pea f0 <main+0xea>
    3e66:	4878 00aa      	pea aa <main+0xa4>
    3e6a:	486a 00f0      	pea 240(a2)
    3e6e:	4eba 04ac      	jsr 431c <memset>(pc)
    3e72:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    3e76:	4fef 0018      	lea 24(sp),sp
    3e7a:	b48a           	cmp.l a2,d2
    3e7c:	66d6           	bne.s 3e54 <ZoomTest+0x26d2>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3e7e:	4878 0005      	pea 5 <_start+0x5>
    3e82:	42a7           	clr.l -(sp)
    3e84:	2f2f 003c      	move.l 60(sp),-(sp)
    3e88:	2f2f 0044      	move.l 68(sp),-(sp)
    3e8c:	4eba ce2c      	jsr cba <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3e90:	2c79 0001 77ac 	movea.l 177ac <GfxBase>,a6
    3e96:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    3e9a:	202f 0044      	move.l 68(sp),d0
    3e9e:	0680 0000 11d4 	addi.l #4564,d0
    3ea4:	2f40 003c      	move.l d0,60(sp)
    3ea8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3eac:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    3eae:	7eff           	moveq #-1,d7
    3eb0:	4bfa ca2e      	lea 8e0 <TestRow>(pc),a5
    3eb4:	41ef 0078      	lea 120(sp),a0
    3eb8:	2f48 0048      	move.l a0,72(sp)
    3ebc:	2f4d 0030      	move.l a5,48(sp)
    3ec0:	2a46           	movea.l d6,a5
    3ec2:	282f 002c      	move.l 44(sp),d4
    3ec6:	0684 ffff ef4a 	addi.l #-4278,d4
    3ecc:	3c0d           	move.w a5,d6
    3ece:	0646 ffee      	addi.w #-18,d6
    3ed2:	307c 002a      	movea.w #42,a0
    3ed6:	d1ef 002c      	adda.l 44(sp),a0
    3eda:	2f48 0044      	move.l a0,68(sp)
    3ede:	2f4d 003c      	move.l a5,60(sp)
    3ee2:	2844           	movea.l d4,a4
    3ee4:	49ec ff10      	lea -240(a4),a4
    3ee8:	41ec ffd6      	lea -42(a4),a0
    3eec:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3ef0:	4878 0064      	pea 64 <main+0x5e>
    3ef4:	42a7           	clr.l -(sp)
    3ef6:	486f 0080      	pea 128(sp)
    3efa:	4eba 0420      	jsr 431c <memset>(pc)
  data[1] = numberofline;
    3efe:	3f46 0082      	move.w d6,130(sp)
    3f02:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3f06:	7a00           	moveq #0,d5
  testpattern += 0;
    3f08:	4bf9 0001 771c 	lea 1771c <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    3f0e:	301d           	move.w (a5)+,d0
    3f10:	bf40           	eor.w d7,d0
    3f12:	206f 0040      	movea.l 64(sp),a0
    3f16:	54af 0040      	addq.l #2,64(sp)
    3f1a:	b058           	cmp.w (a0)+,d0
    3f1c:	673c           	beq.s 3f5a <ZoomTest+0x27d8>
      data[0] = i;
    3f1e:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    3f22:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    3f28:	41f9 0001 4bd1 	lea 14bd1 <incbin_startimage_end+0x1>,a0
    3f2e:	43ef 0074      	lea 116(sp),a1
    3f32:	45f9 0000 4508 	lea 4508 <PutChar>,a2
    3f38:	47ef 0078      	lea 120(sp),a3
    3f3c:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    3f40:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    3f46:	4eae ffc4      	jsr -60(a6)
    3f4a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    3f50:	2200           	move.l d0,d1
    3f52:	240b           	move.l a3,d2
    3f54:	7664           	moveq #100,d3
    3f56:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    3f5a:	5285           	addq.l #1,d5
    3f5c:	bbfc 0001 7746 	cmpa.l #96070,a5
    3f62:	66aa           	bne.s 3f0e <ZoomTest+0x278c>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    3f64:	3039 0001 7746 	move.w 17746 <destlinezoom1+0x2a>,d0
    3f6a:	bf40           	eor.w d7,d0
    3f6c:	3214           	move.w (a4),d1
    3f6e:	b340           	eor.w d1,d0
    3f70:	0240 ff00      	andi.w #-256,d0
    3f74:	6600 00b4      	bne.w 402a <ZoomTest+0x28a8>
        valactual += ZMLINESIZE/2;
    3f78:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    3f7c:	b9c4           	cmpa.l d4,a4
    3f7e:	6600 ff68      	bne.w 3ee8 <ZoomTest+0x2766>
      mask = mask ^ 0xffff;
    3f82:	4647           	not.w d7
    3f84:	0684 0000 00f0 	addi.l #240,d4
    3f8a:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    3f8c:	b8af 0044      	cmp.l 68(sp),d4
    3f90:	6600 ff50      	bne.w 3ee2 <ZoomTest+0x2760>
    3f94:	2a6f 003c      	movea.l 60(sp),a5
    3f98:	246f 002c      	movea.l 44(sp),a2
    3f9c:	45ea ff10      	lea -240(a2),a2
    3fa0:	7600           	moveq #0,d3
    3fa2:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3fa4:	2f0d           	move.l a5,-(sp)
    3fa6:	2f03           	move.l d3,-(sp)
    3fa8:	2f0a           	move.l a2,-(sp)
    3faa:	4879 0001 771c 	pea 1771c <destlinezoom1>
    3fb0:	206f 0040      	movea.l 64(sp),a0
    3fb4:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    3fb6:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    3fba:	4fef 0010      	lea 16(sp),sp
    3fbe:	b5ef 002c      	cmpa.l 44(sp),a2
    3fc2:	66e0           	bne.s 3fa4 <ZoomTest+0x2822>
    3fc4:	45ea 11d0      	lea 4560(a2),a2
    3fc8:	2f4a 002c      	move.l a2,44(sp)
    3fcc:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    3fd0:	bafc 011c      	cmpa.w #284,a5
    3fd4:	6600 feec      	bne.w 3ec2 <ZoomTest+0x2740>
    3fd8:	2a6f 0030      	movea.l 48(sp),a5
    3fdc:	246f 0034      	movea.l 52(sp),a2
    3fe0:	d5fc 0000 f964 	adda.l #63844,a2
    3fe6:	243c 0000 0109 	move.l #265,d2
    3fec:	280a           	move.l a2,d4
    3fee:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    3ff4:	2f02           	move.l d2,-(sp)
    3ff6:	2f03           	move.l d3,-(sp)
    3ff8:	2f0a           	move.l a2,-(sp)
    3ffa:	4879 0001 771c 	pea 1771c <destlinezoom1>
    4000:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4002:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    4006:	4fef 0010      	lea 16(sp),sp
    400a:	b88a           	cmp.l a2,d4
    400c:	66e6           	bne.s 3ff4 <ZoomTest+0x2872>
    mask = mask ^ 0xffff;
    400e:	4647           	not.w d7
    4010:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    4012:	0c82 0000 010d 	cmpi.l #269,d2
    4018:	6700 009e      	beq.w 40b8 <ZoomTest+0x2936>
    401c:	7600           	moveq #0,d3
    401e:	3607           	move.w d7,d3
    4020:	280a           	move.l a2,d4
    4022:	0684 0000 00f0 	addi.l #240,d4
    4028:	60ca           	bra.s 3ff4 <ZoomTest+0x2872>
    data[0] = 21;
    402a:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    4030:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    4036:	41f9 0001 4bd1 	lea 14bd1 <incbin_startimage_end+0x1>,a0
    403c:	43ef 0074      	lea 116(sp),a1
    4040:	45f9 0000 4508 	lea 4508 <PutChar>,a2
    4046:	47ef 0078      	lea 120(sp),a3
    404a:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    404e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4054:	4eae ffc4      	jsr -60(a6)
    4058:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    405e:	2200           	move.l d0,d1
    4060:	240b           	move.l a3,d2
    4062:	7664           	moveq #100,d3
    4064:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    4068:	7000           	moveq #0,d0
    406a:	3014           	move.w (a4),d0
    406c:	2f00           	move.l d0,-(sp)
    406e:	3039 0001 7746 	move.w 17746 <destlinezoom1+0x2a>,d0
    4074:	2f00           	move.l d0,-(sp)
    4076:	4879 0001 4c01 	pea 14c01 <incbin_startimage_end+0x31>
    407c:	4eba c7fa      	jsr 878 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    4080:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    4084:	4fef 000c      	lea 12(sp),sp
    4088:	b9c4           	cmpa.l d4,a4
    408a:	6700 fef6      	beq.w 3f82 <ZoomTest+0x2800>
    408e:	41ec ffd6      	lea -42(a4),a0
    4092:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    4096:	4878 0064      	pea 64 <main+0x5e>
    409a:	42a7           	clr.l -(sp)
    409c:	486f 0080      	pea 128(sp)
    40a0:	4eba 027a      	jsr 431c <memset>(pc)
  data[1] = numberofline;
    40a4:	3f46 0082      	move.w d6,130(sp)
    40a8:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    40ac:	7a00           	moveq #0,d5
  testpattern += 0;
    40ae:	4bf9 0001 771c 	lea 1771c <destlinezoom1>,a5
    40b4:	6000 fe58      	bra.w 3f0e <ZoomTest+0x278c>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    40b8:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    40be:	226f 0038      	movea.l 56(sp),a1
    40c2:	203c 0001 1440 	move.l #70720,d0
    40c8:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    40cc:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    40d2:	226f 0034      	movea.l 52(sp),a1
    40d6:	203c 0001 1440 	move.l #70720,d0
    40dc:	4eae ff2e      	jsr -210(a6)
}
    40e0:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    40e4:	4fef 00b0      	lea 176(sp),sp
    40e8:	4e75           	rts
  if( TestCopperlistBatch( cl2test, position+33, template4cl+33, 60) == 0)
    40ea:	4878 003c      	pea 3c <main+0x36>
    40ee:	4879 0001 71a0 	pea 171a0 <Cl102ZoomTest+0x84>
    40f4:	4878 006a      	pea 6a <main+0x64>
    40f8:	2f0d           	move.l a5,-(sp)
    40fa:	4e92           	jsr (a2)
    40fc:	4fef 0010      	lea 16(sp),sp
    4100:	4a80           	tst.l d0
    4102:	6700 db18      	beq.w 1c1c <ZoomTest+0x49a>
  if( TestCopperlistBatch( cl2test, position+95, template4cl+95, 31) == 0)
    4106:	4878 001f      	pea 1f <main+0x19>
    410a:	4879 0001 7298 	pea 17298 <Cl102ZoomTest+0x17c>
    4110:	4878 00a8      	pea a8 <main+0xa2>
    4114:	2f0d           	move.l a5,-(sp)
    4116:	4e92           	jsr (a2)
    4118:	4fef 0010      	lea 16(sp),sp
    411c:	4a80           	tst.l d0
    411e:	6600 db1a      	bne.w 1c3a <ZoomTest+0x4b8>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    4122:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4128:	4eae ffc4      	jsr -60(a6)
    412c:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4132:	2200           	move.l d0,d1
    4134:	243c 0001 4ee3 	move.l #85731,d2
    413a:	7625           	moveq #37,d3
    413c:	4eae ffd0      	jsr -48(a6)
    4140:	6000 daf8      	bra.w 1c3a <ZoomTest+0x4b8>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    4144:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    414a:	4eae ffc4      	jsr -60(a6)
    414e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4154:	2200           	move.l d0,d1
    4156:	243c 0001 4fc8 	move.l #85960,d2
    415c:	7635           	moveq #53,d3
    415e:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    4162:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    4168:	203c 0000 3740 	move.l #14144,d0
    416e:	7202           	moveq #2,d1
    4170:	4eae ff3a      	jsr -198(a6)
    4174:	2600           	move.l d0,d3
  if( source == 0) {
    4176:	6600 deb0      	bne.w 2028 <ZoomTest+0x8a6>
    Write(  Output(), 
    417a:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4180:	4eae ffc4      	jsr -60(a6)
    4184:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    418a:	2200           	move.l d0,d1
    418c:	243c 0001 503f 	move.l #86079,d2
    4192:	7639           	moveq #57,d3
    4194:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    4198:	2c79 0001 77b8 	movea.l 177b8 <SysBase>,a6
    419e:	203c 0001 1440 	move.l #70720,d0
    41a4:	7202           	moveq #2,d1
    41a6:	4eae ff3a      	jsr -198(a6)
    41aa:	2f40 0038      	move.l d0,56(sp)
  if( source == 0) {
    41ae:	6600 fc7c      	bne.w 3e2c <ZoomTest+0x26aa>
    Write(  Output(), 
    41b2:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    41b8:	4eae ffc4      	jsr -60(a6)
    41bc:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    41c2:	2200           	move.l d0,d1
    41c4:	243c 0001 503f 	move.l #86079,d2
    41ca:	7639           	moveq #57,d3
    41cc:	4eae ffd0      	jsr -48(a6)
}
    41d0:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    41d4:	4fef 00b0      	lea 176(sp),sp
    41d8:	4e75           	rts
    Write(  Output(), 
    41da:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    41e0:	4eae ffc4      	jsr -60(a6)
    41e4:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    41ea:	2200           	move.l d0,d1
    41ec:	243c 0001 4f3b 	move.l #85819,d2
    41f2:	7636           	moveq #54,d3
    41f4:	4eae ffd0      	jsr -48(a6)
    return;
    41f8:	6000 dbdc      	bra.w 1dd6 <ZoomTest+0x654>
    Write(  Output(), 
    41fc:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4202:	4eae ffc4      	jsr -60(a6)
    4206:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    420c:	2200           	move.l d0,d1
    420e:	243c 0001 4ca9 	move.l #85161,d2
    4214:	7639           	moveq #57,d3
    4216:	4eae ffd0      	jsr -48(a6)
    return;
    421a:	6000 d760      	bra.w 197c <ZoomTest+0x1fa>
    Write(  Output(), 
    421e:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4224:	4eae ffc4      	jsr -60(a6)
    4228:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    422e:	2200           	move.l d0,d1
    4230:	243c 0001 5079 	move.l #86137,d2
    4236:	763d           	moveq #61,d3
    4238:	4eae ffd0      	jsr -48(a6)
}
    423c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4240:	4fef 00b0      	lea 176(sp),sp
    4244:	4e75           	rts
    Write(  Output(), 
    4246:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    424c:	4eae ffc4      	jsr -60(a6)
    4250:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4256:	2200           	move.l d0,d1
    4258:	243c 0001 4ce0 	move.l #85216,d2
    425e:	763d           	moveq #61,d3
    4260:	4eae ffd0      	jsr -48(a6)
    return;
    4264:	6000 d716      	bra.w 197c <ZoomTest+0x1fa>
    Write(  Output(), 
    4268:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    426e:	4eae ffc4      	jsr -60(a6)
    4272:	2c79 0001 77b4 	movea.l 177b4 <DOSBase>,a6
    4278:	2200           	move.l d0,d1
    427a:	243c 0001 5079 	move.l #86137,d2
    4280:	763d           	moveq #61,d3
    4282:	4eae ffd0      	jsr -48(a6)
    return;
    4286:	6000 fb8a      	bra.w 3e12 <ZoomTest+0x2690>

0000428a <memcpy>:
{
    428a:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    428e:	202f 0014      	move.l 20(sp),d0
    4292:	226f 0018      	movea.l 24(sp),a1
    4296:	222f 001c      	move.l 28(sp),d1
	while(len--)
    429a:	2601           	move.l d1,d3
    429c:	5383           	subq.l #1,d3
    429e:	4a81           	tst.l d1
    42a0:	6762           	beq.s 4304 <memcpy+0x7a>
    42a2:	2040           	movea.l d0,a0
    42a4:	5888           	addq.l #4,a0
    42a6:	b1c9           	cmpa.l a1,a0
    42a8:	53c2           	sl.s d2
    42aa:	4402           	neg.b d2
    42ac:	41e9 0004      	lea 4(a1),a0
    42b0:	b1c0           	cmpa.l d0,a0
    42b2:	53c4           	sl.s d4
    42b4:	4404           	neg.b d4
    42b6:	8404           	or.b d4,d2
    42b8:	7808           	moveq #8,d4
    42ba:	b883           	cmp.l d3,d4
    42bc:	55c4           	sc.s d4
    42be:	4404           	neg.b d4
    42c0:	c404           	and.b d4,d2
    42c2:	6746           	beq.s 430a <memcpy+0x80>
    42c4:	2409           	move.l a1,d2
    42c6:	8480           	or.l d0,d2
    42c8:	7803           	moveq #3,d4
    42ca:	c484           	and.l d4,d2
    42cc:	663c           	bne.s 430a <memcpy+0x80>
    42ce:	2049           	movea.l a1,a0
    42d0:	2440           	movea.l d0,a2
    42d2:	74fc           	moveq #-4,d2
    42d4:	c481           	and.l d1,d2
    42d6:	d489           	add.l a1,d2
		*d++ = *s++;
    42d8:	24d8           	move.l (a0)+,(a2)+
    42da:	b488           	cmp.l a0,d2
    42dc:	66fa           	bne.s 42d8 <memcpy+0x4e>
    42de:	74fc           	moveq #-4,d2
    42e0:	c481           	and.l d1,d2
    42e2:	2040           	movea.l d0,a0
    42e4:	d1c2           	adda.l d2,a0
    42e6:	d3c2           	adda.l d2,a1
    42e8:	9682           	sub.l d2,d3
    42ea:	b481           	cmp.l d1,d2
    42ec:	6716           	beq.s 4304 <memcpy+0x7a>
    42ee:	1091           	move.b (a1),(a0)
	while(len--)
    42f0:	4a83           	tst.l d3
    42f2:	6710           	beq.s 4304 <memcpy+0x7a>
		*d++ = *s++;
    42f4:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    42fa:	5383           	subq.l #1,d3
    42fc:	6706           	beq.s 4304 <memcpy+0x7a>
		*d++ = *s++;
    42fe:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4304:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    4308:	4e75           	rts
    430a:	2040           	movea.l d0,a0
    430c:	d289           	add.l a1,d1
		*d++ = *s++;
    430e:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4310:	b289           	cmp.l a1,d1
    4312:	67f0           	beq.s 4304 <memcpy+0x7a>
		*d++ = *s++;
    4314:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4316:	b289           	cmp.l a1,d1
    4318:	66f4           	bne.s 430e <memcpy+0x84>
    431a:	60e8           	bra.s 4304 <memcpy+0x7a>

0000431c <memset>:
{
    431c:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    4320:	202f 0024      	move.l 36(sp),d0
    4324:	2a2f 0028      	move.l 40(sp),d5
    4328:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    432c:	2809           	move.l a1,d4
    432e:	5384           	subq.l #1,d4
    4330:	b2fc 0000      	cmpa.w #0,a1
    4334:	6f00 00b0      	ble.w 43e6 <memset+0xca>
    4338:	1e05           	move.b d5,d7
    433a:	2200           	move.l d0,d1
    433c:	4481           	neg.l d1
    433e:	7403           	moveq #3,d2
    4340:	c282           	and.l d2,d1
    4342:	7c05           	moveq #5,d6
		*ptr++ = val;
    4344:	2440           	movea.l d0,a2
    4346:	bc84           	cmp.l d4,d6
    4348:	646a           	bcc.s 43b4 <memset+0x98>
    434a:	4a81           	tst.l d1
    434c:	6724           	beq.s 4372 <memset+0x56>
    434e:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4350:	5384           	subq.l #1,d4
    4352:	7401           	moveq #1,d2
    4354:	b481           	cmp.l d1,d2
    4356:	671a           	beq.s 4372 <memset+0x56>
		*ptr++ = val;
    4358:	2440           	movea.l d0,a2
    435a:	548a           	addq.l #2,a2
    435c:	2040           	movea.l d0,a0
    435e:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4362:	5384           	subq.l #1,d4
    4364:	7403           	moveq #3,d2
    4366:	b481           	cmp.l d1,d2
    4368:	6608           	bne.s 4372 <memset+0x56>
		*ptr++ = val;
    436a:	528a           	addq.l #1,a2
    436c:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4370:	5384           	subq.l #1,d4
    4372:	2609           	move.l a1,d3
    4374:	9681           	sub.l d1,d3
    4376:	7c00           	moveq #0,d6
    4378:	1c05           	move.b d5,d6
    437a:	2406           	move.l d6,d2
    437c:	4842           	swap d2
    437e:	4242           	clr.w d2
    4380:	2042           	movea.l d2,a0
    4382:	2406           	move.l d6,d2
    4384:	e14a           	lsl.w #8,d2
    4386:	4842           	swap d2
    4388:	4242           	clr.w d2
    438a:	e18e           	lsl.l #8,d6
    438c:	2646           	movea.l d6,a3
    438e:	2c08           	move.l a0,d6
    4390:	8486           	or.l d6,d2
    4392:	2c0b           	move.l a3,d6
    4394:	8486           	or.l d6,d2
    4396:	1407           	move.b d7,d2
    4398:	2040           	movea.l d0,a0
    439a:	d1c1           	adda.l d1,a0
    439c:	72fc           	moveq #-4,d1
    439e:	c283           	and.l d3,d1
    43a0:	d288           	add.l a0,d1
		*ptr++ = val;
    43a2:	20c2           	move.l d2,(a0)+
    43a4:	b1c1           	cmpa.l d1,a0
    43a6:	66fa           	bne.s 43a2 <memset+0x86>
    43a8:	72fc           	moveq #-4,d1
    43aa:	c283           	and.l d3,d1
    43ac:	d5c1           	adda.l d1,a2
    43ae:	9881           	sub.l d1,d4
    43b0:	b283           	cmp.l d3,d1
    43b2:	6732           	beq.s 43e6 <memset+0xca>
    43b4:	1485           	move.b d5,(a2)
	while(len-- > 0)
    43b6:	4a84           	tst.l d4
    43b8:	6f2c           	ble.s 43e6 <memset+0xca>
		*ptr++ = val;
    43ba:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    43be:	7201           	moveq #1,d1
    43c0:	b284           	cmp.l d4,d1
    43c2:	6c22           	bge.s 43e6 <memset+0xca>
		*ptr++ = val;
    43c4:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    43c8:	7402           	moveq #2,d2
    43ca:	b484           	cmp.l d4,d2
    43cc:	6c18           	bge.s 43e6 <memset+0xca>
		*ptr++ = val;
    43ce:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    43d2:	7c03           	moveq #3,d6
    43d4:	bc84           	cmp.l d4,d6
    43d6:	6c0e           	bge.s 43e6 <memset+0xca>
		*ptr++ = val;
    43d8:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    43dc:	7204           	moveq #4,d1
    43de:	b284           	cmp.l d4,d1
    43e0:	6c04           	bge.s 43e6 <memset+0xca>
		*ptr++ = val;
    43e2:	1545 0005      	move.b d5,5(a2)
}
    43e6:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    43ea:	4e75           	rts

000043ec <strlen>:
{
    43ec:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    43f0:	7000           	moveq #0,d0
	while(*s++)
    43f2:	4a10           	tst.b (a0)
    43f4:	6708           	beq.s 43fe <strlen+0x12>
		t++;
    43f6:	5280           	addq.l #1,d0
	while(*s++)
    43f8:	4a30 0800      	tst.b (0,a0,d0.l)
    43fc:	66f8           	bne.s 43f6 <strlen+0xa>
}
    43fe:	4e75           	rts

00004400 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4400:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4404:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4408:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    440c:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    4410:	d041           	add.w d1,d0
	swap	d0
    4412:	4840           	swap d0
	clrw	d0
    4414:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4416:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    441a:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    441e:	d081           	add.l d1,d0

	rts
    4420:	4e75           	rts

00004422 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    4422:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    4424:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    4428:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    442c:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4432:	6416           	bcc.s 444a <__udivsi3+0x28>
	movel	d0, d2
    4434:	2400           	move.l d0,d2
	clrw	d2
    4436:	4242           	clr.w d2
	swap	d2
    4438:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    443a:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    443c:	3002           	move.w d2,d0
	swap	d0
    443e:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4440:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4444:	84c1           	divu.w d1,d2
	movew	d2, d0
    4446:	3002           	move.w d2,d0
	jra	6f
    4448:	6030           	bra.s 447a <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    444a:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    444c:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    444e:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4450:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    4456:	64f4           	bcc.s 444c <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4458:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    445a:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4460:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    4462:	c2c0           	mulu.w d0,d1
	swap	d2
    4464:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    4466:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4468:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    446a:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    446c:	660a           	bne.s 4478 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    446e:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4470:	6506           	bcs.s 4478 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    4472:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    4476:	6302           	bls.s 447a <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4478:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    447a:	241f           	move.l (sp)+,d2
	rts
    447c:	4e75           	rts

0000447e <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    447e:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4480:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    4482:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    4486:	6a04           	bpl.s 448c <__divsi3+0xe>
	negl	d1
    4488:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    448a:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    448c:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4490:	6a04           	bpl.s 4496 <__divsi3+0x18>
	negl	d0
    4492:	4480           	neg.l d0
	negb	d2
    4494:	4402           	neg.b d2

2:	movel	d1, sp@-
    4496:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4498:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    449a:	6186           	bsr.s 4422 <__udivsi3>
	addql	IMM (8), sp
    449c:	508f           	addq.l #8,sp

	tstb	d2
    449e:	4a02           	tst.b d2
	jpl	3f
    44a0:	6a02           	bpl.s 44a4 <__divsi3+0x26>
	negl	d0
    44a2:	4480           	neg.l d0

3:	movel	sp@+, d2
    44a4:	241f           	move.l (sp)+,d2
	rts
    44a6:	4e75           	rts

000044a8 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    44a8:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    44ac:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    44b0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44b2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    44b4:	61c8           	bsr.s 447e <__divsi3>
	addql	IMM (8), sp
    44b6:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    44b8:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    44bc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44be:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    44c0:	6100 ff3e      	bsr.w 4400 <__mulsi3>
	addql	IMM (8), sp
    44c4:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    44c6:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    44ca:	9280           	sub.l d0,d1
	movel	d1, d0
    44cc:	2001           	move.l d1,d0
	rts
    44ce:	4e75           	rts

000044d0 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    44d0:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    44d4:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    44d8:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44da:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    44dc:	6100 ff44      	bsr.w 4422 <__udivsi3>
	addql	IMM (8), sp
    44e0:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    44e2:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    44e6:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    44e8:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    44ea:	6100 ff14      	bsr.w 4400 <__mulsi3>
	addql	IMM (8), sp
    44ee:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    44f0:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    44f4:	9280           	sub.l d0,d1
	movel	d1, d0
    44f6:	2001           	move.l d1,d0
	rts
    44f8:	4e75           	rts

000044fa <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    44fa:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    44fc:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4500:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4504:	2c5f           	movea.l (sp)+,a6
    rts
    4506:	4e75           	rts

00004508 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    4508:	16c0           	move.b d0,(a3)+
	rts
    450a:	4e75           	rts

0000450c <saveregs>:
	...

00004548 <font2distance>:
    4548:	0505           	btst d2,d5
    454a:	0505           	btst d2,d5
    454c:	0505           	btst d2,d5
    454e:	0505           	btst d2,d5
    4550:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    4552:	0505           	btst d2,d5
    4554:	0505           	btst d2,d5
    4556:	0005 0505      	ori.b #5,d5
    455a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    455c:	0505           	btst d2,d5
    455e:	0505           	btst d2,d5
    4560:	0505           	btst d2,d5
    4562:	0505           	btst d2,d5
    4564:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    4566:	0505           	btst d2,d5
    4568:	0505           	btst d2,d5
    456a:	0505           	btst d2,d5
    456c:	0505           	btst d2,d5
    456e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4570:	0500           	btst d2,d0
    4572:	0505           	btst d2,d5
    4574:	0505           	btst d2,d5
    4576:	0505           	btst d2,d5
    4578:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    457a:	0505           	btst d2,d5
    457c:	0505           	btst d2,d5
    457e:	0505           	btst d2,d5
    4580:	0505           	btst d2,d5
    4582:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    4584:	0505           	btst d2,d5
    4586:	0505           	btst d2,d5
    4588:	0503           	btst d2,d3
    458a:	0505           	btst d2,d5
    458c:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    458e:	0505           	btst d2,d5
    4590:	0500           	btst d2,d0
    4592:	0505           	btst d2,d5
    4594:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4598:	0505           	btst d2,d5
    459a:	0503           	btst d2,d3
    459c:	0205 0507      	andi.b #7,d5
    45a0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    45a2:	0505           	btst d2,d5
    45a4:	0505           	btst d2,d5
    45a6:	0505           	btst d2,d5
    45a8:	0505           	btst d2,d5
    45aa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45ac:	0505           	btst d2,d5
    45ae:	0505           	btst d2,d5
    45b0:	0505           	btst d2,d5
    45b2:	0505           	btst d2,d5
    45b4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45b6:	0505           	btst d2,d5
    45b8:	0505           	btst d2,d5
    45ba:	0505           	btst d2,d5
    45bc:	0505           	btst d2,d5
    45be:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45c0:	0505           	btst d2,d5
    45c2:	0505           	btst d2,d5
    45c4:	0505           	btst d2,d5
    45c6:	0505           	btst d2,d5
    45c8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45ca:	0505           	btst d2,d5
    45cc:	0505           	btst d2,d5
    45ce:	0505           	btst d2,d5
    45d0:	0505           	btst d2,d5
    45d2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45d4:	0505           	btst d2,d5
    45d6:	0505           	btst d2,d5
    45d8:	0505           	btst d2,d5
    45da:	0505           	btst d2,d5
    45dc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45de:	0505           	btst d2,d5
    45e0:	0505           	btst d2,d5
    45e2:	0505           	btst d2,d5
    45e4:	0505           	btst d2,d5
    45e6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45e8:	0505           	btst d2,d5
    45ea:	0505           	btst d2,d5
    45ec:	0505           	btst d2,d5
    45ee:	0505           	btst d2,d5
    45f0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45f2:	0505           	btst d2,d5
    45f4:	0505           	btst d2,d5
    45f6:	0505           	btst d2,d5
    45f8:	0505           	btst d2,d5
    45fa:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    45fc:	0505           	btst d2,d5
    45fe:	0505           	btst d2,d5
    4600:	0505           	btst d2,d5
    4602:	0505           	btst d2,d5
    4604:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4606:	0505           	btst d2,d5
    4608:	0505           	btst d2,d5
    460a:	0505           	btst d2,d5
    460c:	0505           	btst d2,d5
    460e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4610:	0505           	btst d2,d5
    4612:	0505           	btst d2,d5
    4614:	0505           	btst d2,d5
    4616:	0505           	btst d2,d5
    4618:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    461a:	0505           	btst d2,d5
    461c:	0505           	btst d2,d5
    461e:	0505           	btst d2,d5
    4620:	0505           	btst d2,d5
    4622:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4624:	0505           	btst d2,d5
    4626:	0505           	btst d2,d5
    4628:	0505           	btst d2,d5
    462a:	0505           	btst d2,d5
    462c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    462e:	0505           	btst d2,d5
    4630:	0505           	btst d2,d5
    4632:	0505           	btst d2,d5
    4634:	0505           	btst d2,d5
    4636:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4638:	0505           	btst d2,d5
    463a:	0505           	btst d2,d5
    463c:	0505           	btst d2,d5
    463e:	0505           	btst d2,d5
    4640:	0505           	btst d2,d5

00004642 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    4642:	16c0           	move.b d0,(a3)+
  RTS
    4644:	4e75           	rts

00004646 <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    4646:	48f9 7fff 0000 	movem.l d0-a6,450c <saveregs>
    464c:	450c 
  lea 0xdff000,a5
    464e:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd7036>,a5
  move.l sp@(4),a0  //Fontlocation
    4654:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4658:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    465c:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4660:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    4662:	082d 0006 0002 	btst #6,2(a5)

00004668 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4668:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    466e:	66f8           	bne.s 4668 <st2wblit>

00004670 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4670:	7019           	moveq #25,d0
	sub.l d5,d5      
    4672:	9a85           	sub.l d5,d5

00004674 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    4674:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    4676:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4678:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    467c:	9dce           	suba.l a6,a6
	move.l d2, a6
    467e:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4680:	ddfc 0000 4548 	adda.l #17736,a6

	LSL  	#4,d2 	    //Fetch next char
    4686:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4688:	2842           	movea.l d2,a4


	move.l  #0,d4
    468a:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    468c:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    468e:	3814           	move.w (a4),d4
	swap	d4
    4690:	4844           	swap d4
	lsr.l	d5, d4
    4692:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    4694:	8993           	or.l d4,(a3)
	clr.l	d4
    4696:	4284           	clr.l d4
	move.w  2(a4), d4
    4698:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    469c:	4844           	swap d4
	lsr.l	d5, d4
    469e:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    46a0:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    46a4:	4284           	clr.l d4
	move.w  4(a4), d4
    46a6:	382c 0004      	move.w 4(a4),d4
	swap	d4
    46aa:	4844           	swap d4
	lsr.l	d5, d4
    46ac:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    46ae:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    46b2:	4284           	clr.l d4
	move.w  6(a4), d4
    46b4:	382c 0006      	move.w 6(a4),d4
	swap	d4
    46b8:	4844           	swap d4
	lsr.l	d5, d4
    46ba:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    46bc:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    46c0:	4284           	clr.l d4
	move.w  8(a4), d4
    46c2:	382c 0008      	move.w 8(a4),d4
	swap	d4
    46c6:	4844           	swap d4
	lsr.l	d5, d4
    46c8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    46ca:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    46ce:	4284           	clr.l d4
	move.w  10(a4), d4
    46d0:	382c 000a      	move.w 10(a4),d4
	swap	d4
    46d4:	4844           	swap d4
	lsr.l	d5, d4
    46d6:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    46d8:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    46dc:	4284           	clr.l d4
	move.w  12(a4), d4
    46de:	382c 000c      	move.w 12(a4),d4
	swap	d4
    46e2:	4844           	swap d4
	lsr.l	d5, d4
    46e4:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    46e6:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    46ea:	4284           	clr.l d4
	move.w  14(a4), d4
    46ec:	382c 000e      	move.w 14(a4),d4
	swap	d4
    46f0:	4844           	swap d4
	lsr.l	d5, d4
    46f2:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    46f4:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    46f8:	4284           	clr.l d4

	add.b   (a6), d5
    46fa:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    46fc:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    4700:	6500 0006      	bcs.w 4708 <noadditionalchar>
	addq.w  #1, a3
    4704:	524b           	addq.w #1,a3
	sub.w   #8,d5
    4706:	5145           	subq.w #8,d5

00004708 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    4708:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    470a:	51c8 ff68      	dbf d0,4674 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    470e:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    4712:	51cb ff5c      	dbf d3,4670 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    4716:	4cfa 7fff fdf2 	movem.l 450c <saveregs>(pc),d0-a6

	RTS
    471c:	4e75           	rts
