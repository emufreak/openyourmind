
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
       6:	48e7 303a      	movem.l d2-d3/a2-a4/a6,-(sp)

  SysBase = *((struct ExecBase**)4UL);
       a:	2c78 0004      	movea.l 4 <_start+0x4>,a6
       e:	23ce 0001 77c4 	move.l a6,177c4 <SysBase>
	hw = (struct Custom*)0xdff000;
      14:	23fc 00df f000 	move.l #14675968,177b8 <hw>
      1a:	0001 77b8 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      1e:	43f9 0001 5b0c 	lea 15b0c <zoom.c.02d731d4+0x166>,a1
      24:	7000           	moveq #0,d0
      26:	4eae fdd8      	jsr -552(a6)
      2a:	23c0 0001 77bc 	move.l d0,177bc <GfxBase>
	if (!GfxBase)
      30:	6700 0592      	beq.w 5c4 <main+0x5be>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      34:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
      3a:	43f9 0001 5b1d 	lea 15b1d <zoom.c.02d731d4+0x177>,a1
      40:	7000           	moveq #0,d0
      42:	4eae fdd8      	jsr -552(a6)
      46:	23c0 0001 77c0 	move.l d0,177c0 <DOSBase>
	if (!DOSBase)
      4c:	6700 0564      	beq.w 5b2 <main+0x5ac>
		Exit(0);

	//KPrintF("Hello debugger from Amiga!\n");
	Write(Output(), "Hello console!\n", 15);
      50:	2c40           	movea.l d0,a6
      52:	4eae ffc4      	jsr -60(a6)
      56:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
      5c:	2200           	move.l d0,d1
      5e:	243c 0001 5b29 	move.l #88873,d2
      64:	760f           	moveq #15,d3
      66:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      6a:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
      70:	7232           	moveq #50,d1
      72:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      76:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
      7c:	4eae ffc4      	jsr -60(a6)
      80:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
      86:	2628 0080      	move.l 128(a0),d3
      8a:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
      90:	2200           	move.l d0,d1
      92:	243c 0001 5b39 	move.l #88889,d2
      98:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      9c:	49f9 0000 08a2 	lea 8a2 <ClBuild>,a4
      a2:	4e94           	jsr (a4)
      a4:	2440           	movea.l d0,a2
      a6:	23c0 0001 77aa 	move.l d0,177aa <Copperlist1>
  DrawCopper = Copperlist1;
      ac:	23c0 0001 77a2 	move.l d0,177a2 <DrawCopper>
  Copperlist2 = ClBuild();
      b2:	4e94           	jsr (a4)
      b4:	23c0 0001 7788 	move.l d0,17788 <Copperlist2>
  ViewCopper = Copperlist2;
      ba:	23c0 0001 7782 	move.l d0,17782 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      c0:	2012           	move.l (a2),d0
      c2:	b0b9 0001 73f0 	cmp.l 173f0 <ClsSprites>,d0
      c8:	6600 047a      	bne.w 544 <main+0x53e>
      cc:	202a 0004      	move.l 4(a2),d0
      d0:	b0b9 0001 73f4 	cmp.l 173f4 <ClsSprites+0x4>,d0
      d6:	6600 046c      	bne.w 544 <main+0x53e>
      da:	202a 0008      	move.l 8(a2),d0
      de:	b0b9 0001 73f8 	cmp.l 173f8 <ClsSprites+0x8>,d0
      e4:	6600 045e      	bne.w 544 <main+0x53e>
      e8:	202a 000c      	move.l 12(a2),d0
      ec:	b0b9 0001 73fc 	cmp.l 173fc <ClsSprites+0xc>,d0
      f2:	6600 0450      	bne.w 544 <main+0x53e>
      f6:	202a 0010      	move.l 16(a2),d0
      fa:	b0b9 0001 7400 	cmp.l 17400 <ClsSprites+0x10>,d0
     100:	6600 0442      	bne.w 544 <main+0x53e>
     104:	202a 0014      	move.l 20(a2),d0
     108:	b0b9 0001 7404 	cmp.l 17404 <ClsSprites+0x14>,d0
     10e:	6600 0434      	bne.w 544 <main+0x53e>
     112:	202a 0018      	move.l 24(a2),d0
     116:	b0b9 0001 7408 	cmp.l 17408 <ClsSprites+0x18>,d0
     11c:	6600 0426      	bne.w 544 <main+0x53e>
     120:	202a 001c      	move.l 28(a2),d0
     124:	b0b9 0001 740c 	cmp.l 1740c <ClsSprites+0x1c>,d0
     12a:	6600 0418      	bne.w 544 <main+0x53e>
     12e:	202a 0020      	move.l 32(a2),d0
     132:	b0b9 0001 7410 	cmp.l 17410 <ClsSprites+0x20>,d0
     138:	6600 040a      	bne.w 544 <main+0x53e>
     13c:	202a 0024      	move.l 36(a2),d0
     140:	b0b9 0001 7414 	cmp.l 17414 <ClsSprites+0x24>,d0
     146:	6600 03fc      	bne.w 544 <main+0x53e>
     14a:	202a 0028      	move.l 40(a2),d0
     14e:	b0b9 0001 7418 	cmp.l 17418 <ClsSprites+0x28>,d0
     154:	6600 03ee      	bne.w 544 <main+0x53e>
     158:	202a 002c      	move.l 44(a2),d0
     15c:	b0b9 0001 741c 	cmp.l 1741c <ClsSprites+0x2c>,d0
     162:	6600 03e0      	bne.w 544 <main+0x53e>
     166:	202a 0030      	move.l 48(a2),d0
     16a:	b0b9 0001 7420 	cmp.l 17420 <ClsSprites+0x30>,d0
     170:	6600 03d2      	bne.w 544 <main+0x53e>
     174:	202a 0034      	move.l 52(a2),d0
     178:	b0b9 0001 7424 	cmp.l 17424 <ClsSprites+0x34>,d0
     17e:	6600 03c4      	bne.w 544 <main+0x53e>
     182:	202a 0038      	move.l 56(a2),d0
     186:	b0b9 0001 7428 	cmp.l 17428 <ClsSprites+0x38>,d0
     18c:	6600 03b6      	bne.w 544 <main+0x53e>
     190:	246a 003c      	movea.l 60(a2),a2
     194:	b5f9 0001 742c 	cmpa.l 1742c <ClsSprites+0x3c>,a2
     19a:	6600 03a8      	bne.w 544 <main+0x53e>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     19e:	2079 0001 77aa 	movea.l 177aa <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1a4:	2039 0001 73c0 	move.l 173c0 <ClScreen>,d0
     1aa:	b0a8 0040      	cmp.l 64(a0),d0
     1ae:	6600 03b6      	bne.w 566 <main+0x560>
     1b2:	2039 0001 73c4 	move.l 173c4 <ClScreen+0x4>,d0
     1b8:	b0a8 0044      	cmp.l 68(a0),d0
     1bc:	6600 03a8      	bne.w 566 <main+0x560>
     1c0:	2039 0001 73c8 	move.l 173c8 <ClScreen+0x8>,d0
     1c6:	b0a8 0048      	cmp.l 72(a0),d0
     1ca:	6600 039a      	bne.w 566 <main+0x560>
     1ce:	2039 0001 73cc 	move.l 173cc <ClScreen+0xc>,d0
     1d4:	b0a8 004c      	cmp.l 76(a0),d0
     1d8:	6600 038c      	bne.w 566 <main+0x560>
     1dc:	2028 0050      	move.l 80(a0),d0
     1e0:	b0b9 0001 73d0 	cmp.l 173d0 <ClScreen+0x10>,d0
     1e6:	6600 037e      	bne.w 566 <main+0x560>
     1ea:	2028 0054      	move.l 84(a0),d0
     1ee:	b0b9 0001 73d4 	cmp.l 173d4 <ClScreen+0x14>,d0
     1f4:	6600 0370      	bne.w 566 <main+0x560>
     1f8:	2028 0058      	move.l 88(a0),d0
     1fc:	b0b9 0001 73d8 	cmp.l 173d8 <ClScreen+0x18>,d0
     202:	6600 0362      	bne.w 566 <main+0x560>
     206:	2028 005c      	move.l 92(a0),d0
     20a:	b0b9 0001 73dc 	cmp.l 173dc <ClScreen+0x1c>,d0
     210:	6600 0354      	bne.w 566 <main+0x560>
     214:	2028 0060      	move.l 96(a0),d0
     218:	b0b9 0001 73e0 	cmp.l 173e0 <ClScreen+0x20>,d0
     21e:	6600 0346      	bne.w 566 <main+0x560>
     222:	2028 0064      	move.l 100(a0),d0
     226:	b0b9 0001 73e4 	cmp.l 173e4 <ClScreen+0x24>,d0
     22c:	6600 0338      	bne.w 566 <main+0x560>
     230:	2028 0068      	move.l 104(a0),d0
     234:	b0b9 0001 73e8 	cmp.l 173e8 <ClScreen+0x28>,d0
     23a:	6600 032a      	bne.w 566 <main+0x560>
     23e:	2068 006c      	movea.l 108(a0),a0
     242:	b1f9 0001 73ec 	cmpa.l 173ec <ClScreen+0x2c>,a0
     248:	6600 031c      	bne.w 566 <main+0x560>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     24c:	23fc 0004 0000 	move.l #262144,177b0 <DrawBuffer>
     252:	0001 77b0 
  ViewBuffer = (ULONG *)0x50000;
     256:	23fc 0005 0000 	move.l #327680,177a6 <ViewBuffer>
     25c:	0001 77a6 
  
  SetBplPointers();
     260:	45f9 0000 1f24 	lea 1f24 <SetBplPointers>,a2
     266:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     268:	0cb9 0005 0000 	cmpi.l #327680,177b0 <DrawBuffer>
     26e:	0001 77b0 
     272:	6700 040e      	beq.w 682 <main+0x67c>
    Write( Output(), 
     276:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     27c:	4eae ffc4      	jsr -60(a6)
     280:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     286:	2200           	move.l d0,d1
     288:	243c 0001 5b3c 	move.l #88892,d2
     28e:	763b           	moveq #59,d3
     290:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     294:	2079 0001 77aa 	movea.l 177aa <Copperlist1>,a0
     29a:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2a0:	0070 
     2a2:	6724           	beq.s 2c8 <main+0x2c2>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2a4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     2aa:	4eae ffc4      	jsr -60(a6)
     2ae:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     2b4:	2200           	move.l d0,d1
     2b6:	243c 0001 5b78 	move.l #88952,d2
     2bc:	763c           	moveq #60,d3
     2be:	4eae ffd0      	jsr -48(a6)
     2c2:	2079 0001 77aa 	movea.l 177aa <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2c8:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2ce:	0074 
     2d0:	6724           	beq.s 2f6 <main+0x2f0>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2d2:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     2d8:	4eae ffc4      	jsr -60(a6)
     2dc:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     2e2:	2200           	move.l d0,d1
     2e4:	243c 0001 5bb5 	move.l #89013,d2
     2ea:	763c           	moveq #60,d3
     2ec:	4eae ffd0      	jsr -48(a6)
     2f0:	2079 0001 77aa 	movea.l 177aa <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     2f6:	2028 0078      	move.l 120(a0),d0
     2fa:	b0b9 0001 7340 	cmp.l 17340 <ClColor>,d0
     300:	6600 03b0      	bne.w 6b2 <main+0x6ac>
     304:	2028 007c      	move.l 124(a0),d0
     308:	b0b9 0001 7344 	cmp.l 17344 <ClColor+0x4>,d0
     30e:	6600 03a2      	bne.w 6b2 <main+0x6ac>
  if( instructions[pos] == value ) 
     312:	70fe           	moveq #-2,d0
     314:	b0a8 0080      	cmp.l 128(a0),d0
     318:	671e           	beq.s 338 <main+0x332>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     31a:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     320:	4eae ffc4      	jsr -60(a6)
     324:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     32a:	2200           	move.l d0,d1
     32c:	243c 0001 5c14 	move.l #89108,d2
     332:	7622           	moveq #34,d3
     334:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     338:	47f9 0000 148c 	lea 148c <SwapCl>,a3
     33e:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     340:	2039 0001 77a2 	move.l 177a2 <DrawCopper>,d0
     346:	b0b9 0001 7788 	cmp.l 17788 <Copperlist2>,d0
     34c:	671e           	beq.s 36c <main+0x366>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     34e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     354:	4eae ffc4      	jsr -60(a6)
     358:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     35e:	2200           	move.l d0,d1
     360:	243c 0001 5c37 	move.l #89143,d2
     366:	7615           	moveq #21,d3
     368:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     36c:	4e94           	jsr (a4)
     36e:	23c0 0001 77aa 	move.l d0,177aa <Copperlist1>
  Copperlist2 = ClBuild( );
     374:	4e94           	jsr (a4)
     376:	23c0 0001 7788 	move.l d0,17788 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     37c:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     382:	203c 0000 c800 	move.l #51200,d0
     388:	7202           	moveq #2,d1
     38a:	4eae ff3a      	jsr -198(a6)
     38e:	23c0 0001 7790 	move.l d0,17790 <Bitplane1>
  if(Bitplane1 == 0) {
     394:	6700 028c      	beq.w 622 <main+0x61c>
  ViewBuffer = Bitplane1;
     398:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
  ViewCopper = Copperlist1;
     39e:	23f9 0001 77aa 	move.l 177aa <Copperlist1>,17782 <ViewCopper>
     3a4:	0001 7782 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3a8:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     3ae:	203c 0000 c800 	move.l #51200,d0
     3b4:	7202           	moveq #2,d1
     3b6:	4eae ff3a      	jsr -198(a6)
     3ba:	23c0 0001 778c 	move.l d0,1778c <Bitplane2>
  if(Bitplane2 == 0) {
     3c0:	6700 022c      	beq.w 5ee <main+0x5e8>
  DrawBuffer = Bitplane2;
     3c4:	23c0 0001 77b0 	move.l d0,177b0 <DrawBuffer>
  DrawCopper = Copperlist2;
     3ca:	23f9 0001 7788 	move.l 17788 <Copperlist2>,177a2 <DrawCopper>
     3d0:	0001 77a2 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3d4:	2039 0001 77a6 	move.l 177a6 <ViewBuffer>,d0
     3da:	b0b9 0001 7790 	cmp.l 17790 <Bitplane1>,d0
     3e0:	671e           	beq.s 400 <main+0x3fa>
    Write( Output(), 
     3e2:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     3e8:	4eae ffc4      	jsr -60(a6)
     3ec:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     3f2:	2200           	move.l d0,d1
     3f4:	243c 0001 5c4d 	move.l #89165,d2
     3fa:	7638           	moveq #56,d3
     3fc:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     400:	2039 0001 7782 	move.l 17782 <ViewCopper>,d0
     406:	b0b9 0001 77aa 	cmp.l 177aa <Copperlist1>,d0
     40c:	671e           	beq.s 42c <main+0x426>
    Write( Output(), 
     40e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     414:	4eae ffc4      	jsr -60(a6)
     418:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     41e:	2200           	move.l d0,d1
     420:	243c 0001 5c86 	move.l #89222,d2
     426:	763a           	moveq #58,d3
     428:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     42c:	4e92           	jsr (a2)
  SwapCl();
     42e:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     430:	2079 0001 7782 	movea.l 17782 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     436:	7000           	moveq #0,d0
     438:	3028 0072      	move.w 114(a0),d0
     43c:	4840           	swap d0
     43e:	4240           	clr.w d0
     440:	7200           	moveq #0,d1
     442:	3228 0076      	move.w 118(a0),d1
     446:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     448:	b0b9 0001 778c 	cmp.l 1778c <Bitplane2>,d0
     44e:	671e           	beq.s 46e <main+0x468>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     450:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     456:	4eae ffc4      	jsr -60(a6)
     45a:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     460:	2200           	move.l d0,d1
     462:	243c 0001 5cc1 	move.l #89281,d2
     468:	7648           	moveq #72,d3
     46a:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     46e:	4e92           	jsr (a2)
  SwapCl();
     470:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     472:	2079 0001 7782 	movea.l 17782 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     478:	7000           	moveq #0,d0
     47a:	3028 0072      	move.w 114(a0),d0
     47e:	4840           	swap d0
     480:	4240           	clr.w d0
     482:	7200           	moveq #0,d1
     484:	3228 0076      	move.w 118(a0),d1
     488:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     48a:	b0b9 0001 7790 	cmp.l 17790 <Bitplane1>,d0
     490:	671e           	beq.s 4b0 <main+0x4aa>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     492:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     498:	4eae ffc4      	jsr -60(a6)
     49c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     4a2:	2200           	move.l d0,d1
     4a4:	243c 0001 5d0a 	move.l #89354,d2
     4aa:	7649           	moveq #73,d3
     4ac:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4b0:	4e92           	jsr (a2)
  SwapCl();
     4b2:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4b4:	2079 0001 7782 	movea.l 17782 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ba:	7000           	moveq #0,d0
     4bc:	3028 0072      	move.w 114(a0),d0
     4c0:	4840           	swap d0
     4c2:	4240           	clr.w d0
     4c4:	7200           	moveq #0,d1
     4c6:	3228 0076      	move.w 118(a0),d1
     4ca:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4cc:	b0b9 0001 778c 	cmp.l 1778c <Bitplane2>,d0
     4d2:	671e           	beq.s 4f2 <main+0x4ec>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4d4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     4da:	4eae ffc4      	jsr -60(a6)
     4de:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     4e4:	2200           	move.l d0,d1
     4e6:	243c 0001 5d54 	move.l #89428,d2
     4ec:	7648           	moveq #72,d3
     4ee:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4f2:	2f3c 0000 c800 	move.l #51200,-(sp)
     4f8:	4878 0084      	pea 84 <main+0x7e>
     4fc:	4eb9 0000 1f50 	jsr 1f50 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     502:	4eb9 0000 21bc 	jsr 21bc <ZoomTest>
  RunTests();
	//warpmode(1);
	// TODO: precalc stuff here
	//warpmode(0);

	TakeSystem();
     508:	4eb9 0000 20c4 	jsr 20c4 <TakeSystem>
	WaitVbl();
     50e:	4eb9 0000 1fc2 	jsr 1fc2 <WaitVbl>

	// DEMO

	//RunDemo();	// END

	FreeSystem();
     514:	4eb9 0000 2008 	jsr 2008 <FreeSystem>

	CloseLibrary((struct Library*)DOSBase);
     51a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     520:	2279 0001 77c0 	movea.l 177c0 <DOSBase>,a1
     526:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     52a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     530:	2279 0001 77bc 	movea.l 177bc <GfxBase>,a1
     536:	4eae fe62      	jsr -414(a6)
     53a:	508f           	addq.l #8,sp
}
     53c:	7000           	moveq #0,d0
     53e:	4cdf 5c0c      	movem.l (sp)+,d2-d3/a2-a4/a6
     542:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     544:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     54a:	4eae ffc4      	jsr -60(a6)
     54e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     554:	2200           	move.l d0,d1
     556:	243c 0001 5dd4 	move.l #89556,d2
     55c:	762c           	moveq #44,d3
     55e:	4eae ffd0      	jsr -48(a6)
     562:	6000 fc3a      	bra.w 19e <main+0x198>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     566:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     56c:	4eae ffc4      	jsr -60(a6)
     570:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     576:	2200           	move.l d0,d1
     578:	243c 0001 5d9d 	move.l #89501,d2
     57e:	7636           	moveq #54,d3
     580:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     584:	23fc 0004 0000 	move.l #262144,177b0 <DrawBuffer>
     58a:	0001 77b0 
  ViewBuffer = (ULONG *)0x50000;
     58e:	23fc 0005 0000 	move.l #327680,177a6 <ViewBuffer>
     594:	0001 77a6 
  SetBplPointers();
     598:	45f9 0000 1f24 	lea 1f24 <SetBplPointers>,a2
     59e:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     5a0:	0cb9 0005 0000 	cmpi.l #327680,177b0 <DrawBuffer>
     5a6:	0001 77b0 
     5aa:	6600 fcca      	bne.w 276 <main+0x270>
     5ae:	6000 00d2      	bra.w 682 <main+0x67c>
		Exit(0);
     5b2:	9dce           	suba.l a6,a6
     5b4:	7200           	moveq #0,d1
     5b6:	4eae ff70      	jsr -144(a6)
     5ba:	2039 0001 77c0 	move.l 177c0 <DOSBase>,d0
     5c0:	6000 fa8e      	bra.w 50 <main+0x4a>
		Exit(0);
     5c4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     5ca:	7200           	moveq #0,d1
     5cc:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     5d0:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     5d6:	43f9 0001 5b1d 	lea 15b1d <zoom.c.02d731d4+0x177>,a1
     5dc:	7000           	moveq #0,d0
     5de:	4eae fdd8      	jsr -552(a6)
     5e2:	23c0 0001 77c0 	move.l d0,177c0 <DOSBase>
	if (!DOSBase)
     5e8:	6600 fa66      	bne.w 50 <main+0x4a>
     5ec:	60c4           	bra.s 5b2 <main+0x5ac>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     5ee:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     5f4:	4eae ffc4      	jsr -60(a6)
     5f8:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     5fe:	2200           	move.l d0,d1
     600:	243c 0001 573c 	move.l #87868,d2
     606:	7626           	moveq #38,d3
     608:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     60c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     612:	7201           	moveq #1,d1
     614:	4eae ff70      	jsr -144(a6)
     618:	2039 0001 778c 	move.l 1778c <Bitplane2>,d0
     61e:	6000 fda4      	bra.w 3c4 <main+0x3be>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     622:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     628:	4eae ffc4      	jsr -60(a6)
     62c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     632:	2200           	move.l d0,d1
     634:	243c 0001 5715 	move.l #87829,d2
     63a:	7626           	moveq #38,d3
     63c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     640:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     646:	7201           	moveq #1,d1
     648:	4eae ff70      	jsr -144(a6)
     64c:	2039 0001 7790 	move.l 17790 <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     652:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
  ViewCopper = Copperlist1;
     658:	23f9 0001 77aa 	move.l 177aa <Copperlist1>,17782 <ViewCopper>
     65e:	0001 7782 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     662:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     668:	203c 0000 c800 	move.l #51200,d0
     66e:	7202           	moveq #2,d1
     670:	4eae ff3a      	jsr -198(a6)
     674:	23c0 0001 778c 	move.l d0,1778c <Bitplane2>
  if(Bitplane2 == 0) {
     67a:	6600 fd48      	bne.w 3c4 <main+0x3be>
     67e:	6000 ff6e      	bra.w 5ee <main+0x5e8>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     682:	0cb9 0004 0000 	cmpi.l #262144,177a6 <ViewBuffer>
     688:	0001 77a6 
     68c:	6700 fc06      	beq.w 294 <main+0x28e>
    Write( Output(), 
     690:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     696:	4eae ffc4      	jsr -60(a6)
     69a:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     6a0:	2200           	move.l d0,d1
     6a2:	243c 0001 5b3c 	move.l #88892,d2
     6a8:	763b           	moveq #59,d3
     6aa:	4eae ffd0      	jsr -48(a6)
     6ae:	6000 fbe4      	bra.w 294 <main+0x28e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     6b2:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     6b8:	4eae ffc4      	jsr -60(a6)
     6bc:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     6c2:	2200           	move.l d0,d1
     6c4:	243c 0001 5bf2 	move.l #89074,d2
     6ca:	7621           	moveq #33,d3
     6cc:	4eae ffd0      	jsr -48(a6)
     6d0:	2079 0001 77aa 	movea.l 177aa <Copperlist1>,a0
     6d6:	6000 fc3a      	bra.w 312 <main+0x30c>
     6da:	4e71           	nop

000006dc <KPrintF>:
{
     6dc:	4fef ff80      	lea -128(sp),sp
     6e0:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     6e4:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee7ce0>
     6ea:	6734           	beq.s 720 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     6ec:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     6f2:	206f 0090      	movea.l 144(sp),a0
     6f6:	43ef 0094      	lea 148(sp),a1
     6fa:	45f9 0000 4fd0 	lea 4fd0 <PutChar>,a2
     700:	47ef 000c      	lea 12(sp),a3
     704:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     708:	2f0b           	move.l a3,-(sp)
     70a:	4878 0056      	pea 56 <main+0x50>
     70e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee7ce0>
     714:	508f           	addq.l #8,sp
}
     716:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     71a:	4fef 0080      	lea 128(sp),sp
     71e:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     720:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     726:	206f 0090      	movea.l 144(sp),a0
     72a:	43ef 0094      	lea 148(sp),a1
     72e:	45f9 0000 4fc2 	lea 4fc2 <KPutCharX>,a2
     734:	97cb           	suba.l a3,a3
     736:	4eae fdf6      	jsr -522(a6)
}
     73a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     73e:	4fef 0080      	lea 128(sp),sp
     742:	4e75           	rts

00000744 <TestRow>:
  FreeMem( source, (ZMLINESIZE+4)*272);
  FreeMem( destination, (ZMLINESIZE+4)*272);
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
     744:	4fef ff94      	lea -108(sp),sp
     748:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     74c:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
     752:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
     756:	7a34           	moveq #52,d5
     758:	da8f           	add.l sp,d5
     75a:	4878 0064      	pea 64 <main+0x5e>
     75e:	42a7           	clr.l -(sp)
     760:	2f05           	move.l d5,-(sp)
     762:	4eba 467e      	jsr 4de2 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
     766:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
     76c:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
     770:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
     774:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
     778:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     77a:	2e3c 0001 5699 	move.l #87705,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     780:	301c           	move.w (a4)+,d0
     782:	bd40           	eor.w d6,d0
     784:	b05d           	cmp.w (a5)+,d0
     786:	6736           	beq.s 7be <TestRow+0x7a>
      data[0] = i;
     788:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     78c:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     792:	2047           	movea.l d7,a0
     794:	43ef 0030      	lea 48(sp),a1
     798:	45f9 0000 4fd0 	lea 4fd0 <PutChar>,a2
     79e:	2645           	movea.l d5,a3
     7a0:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     7a4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     7aa:	4eae ffc4      	jsr -60(a6)
     7ae:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     7b4:	2200           	move.l d0,d1
     7b6:	2405           	move.l d5,d2
     7b8:	7664           	moveq #100,d3
     7ba:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
     7be:	5284           	addq.l #1,d4
     7c0:	7015           	moveq #21,d0
     7c2:	b084           	cmp.l d4,d0
     7c4:	66ba           	bne.s 780 <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     7c6:	206f 00a0      	movea.l 160(sp),a0
     7ca:	3028 002a      	move.w 42(a0),d0
     7ce:	322f 002e      	move.w 46(sp),d1
     7d2:	b340           	eor.w d1,d0
     7d4:	206f 009c      	movea.l 156(sp),a0
     7d8:	3228 002a      	move.w 42(a0),d1
     7dc:	b340           	eor.w d1,d0
     7de:	0240 ff00      	andi.w #-256,d0
     7e2:	660a           	bne.s 7ee <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
     7e4:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     7e8:	4fef 006c      	lea 108(sp),sp
     7ec:	4e75           	rts
    data[0] = 21;
     7ee:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
     7f4:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     7fa:	41f9 0001 5699 	lea 15699 <incbin_startimage_end+0x1>,a0
     800:	43ef 0030      	lea 48(sp),a1
     804:	45f9 0000 4fd0 	lea 4fd0 <PutChar>,a2
     80a:	47ef 0034      	lea 52(sp),a3
     80e:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     812:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     818:	4eae ffc4      	jsr -60(a6)
     81c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     822:	2200           	move.l d0,d1
     824:	240b           	move.l a3,d2
     826:	7664           	moveq #100,d3
     828:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
     82c:	206f 00a0      	movea.l 160(sp),a0
     830:	7000           	moveq #0,d0
     832:	3028 002a      	move.w 42(a0),d0
     836:	2f00           	move.l d0,-(sp)
     838:	206f 00a0      	movea.l 160(sp),a0
     83c:	3028 002a      	move.w 42(a0),d0
     840:	2f00           	move.l d0,-(sp)
     842:	4879 0001 56c9 	pea 156c9 <incbin_startimage_end+0x31>
     848:	4eba fe92      	jsr 6dc <KPrintF>(pc)
     84c:	4fef 000c      	lea 12(sp),sp
}
     850:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     854:	4fef 006c      	lea 108(sp),sp
     858:	4e75           	rts

0000085a <TestCopperlistPos>:
  if( instructions[pos] == value ) 
     85a:	202f 0008      	move.l 8(sp),d0
     85e:	d080           	add.l d0,d0
     860:	d080           	add.l d0,d0
     862:	206f 0004      	movea.l 4(sp),a0
     866:	2030 0800      	move.l (0,a0,d0.l),d0
     86a:	b0af 000c      	cmp.l 12(sp),d0
     86e:	57c0           	seq d0
     870:	4880           	ext.w d0
     872:	48c0           	ext.l d0
}
     874:	4480           	neg.l d0
     876:	4e75           	rts

00000878 <TestCopperlistBatch>:
  for( int i=0;i<length;i++)
     878:	226f 0008      	movea.l 8(sp),a1
     87c:	d3c9           	adda.l a1,a1
     87e:	d3c9           	adda.l a1,a1
     880:	d3ef 0004      	adda.l 4(sp),a1
     884:	206f 000c      	movea.l 12(sp),a0
     888:	202f 0010      	move.l 16(sp),d0
     88c:	d080           	add.l d0,d0
     88e:	d080           	add.l d0,d0
     890:	d088           	add.l a0,d0
    if( instructions[ pos+i] != batch[ i])
     892:	b388           	cmpm.l (a0)+,(a1)+
     894:	6608           	bne.s 89e <TestCopperlistBatch+0x26>
  for( int i=0;i<length;i++)
     896:	b1c0           	cmpa.l d0,a0
     898:	66f8           	bne.s 892 <TestCopperlistBatch+0x1a>
  return 1;
     89a:	7001           	moveq #1,d0
}
     89c:	4e75           	rts
      return 0;
     89e:	7000           	moveq #0,d0
}
     8a0:	4e75           	rts

000008a2 <ClBuild>:
ULONG * ClBuild() {
     8a2:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     8a6:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     8ac:	707b           	moveq #123,d0
     8ae:	4600           	not.b d0
     8b0:	7202           	moveq #2,d1
     8b2:	4eae ff3a      	jsr -198(a6)
     8b6:	2440           	movea.l d0,a2
  if( retval == 0) {
     8b8:	4a80           	tst.l d0
     8ba:	6700 010e      	beq.w 9ca <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     8be:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
     8c4:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
     8ca:	0004 
     8cc:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
     8d2:	0008 
     8d4:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
     8da:	000c 
     8dc:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
     8e2:	0010 
     8e4:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
     8ea:	0014 
     8ec:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
     8f2:	0018 
     8f4:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
     8fa:	001c 
     8fc:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
     902:	0020 
     904:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
     90a:	0024 
     90c:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
     912:	0028 
     914:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
     91a:	002c 
     91c:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
     922:	0030 
     924:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
     92a:	0034 
     92c:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
     932:	0038 
     934:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
     93a:	003c 
    *cl++ = *clpartinstruction++;
     93c:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
     942:	0040 
     944:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
     94a:	0044 
     94c:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
     952:	0048 
     954:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
     95a:	004c 
     95c:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
     962:	0050 
     964:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
     96a:	0054 
     96c:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
     972:	0058 
     974:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
     97a:	005c 
     97c:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
     982:	0060 
     984:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
     98a:	0064 
     98c:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
     992:	0068 
     994:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
     99a:	006c 
  *cl++ = 0x00e00000;
     99c:	257c 00e0 0000 	move.l #14680064,112(a2)
     9a2:	0070 
  *cl++ = 0x00e20000;
     9a4:	257c 00e2 0000 	move.l #14811136,116(a2)
     9aa:	0074 
    *cl++ = *clpartinstruction++;
     9ac:	2579 0001 7340 	move.l 17340 <ClColor>,120(a2)
     9b2:	0078 
     9b4:	2579 0001 7344 	move.l 17344 <ClColor+0x4>,124(a2)
     9ba:	007c 
  *cl = 0xfffffffe;
     9bc:	70fe           	moveq #-2,d0
     9be:	2540 0080      	move.l d0,128(a2)
}
     9c2:	200a           	move.l a2,d0
     9c4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     9c8:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     9ca:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     9d0:	4eae ffc4      	jsr -60(a6)
     9d4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     9da:	2200           	move.l d0,d1
     9dc:	243c 0001 56ef 	move.l #87791,d2
     9e2:	7628           	moveq #40,d3
     9e4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     9e8:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
     9ee:	7201           	moveq #1,d1
     9f0:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     9f4:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
     9fa:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
     a00:	0004 
     a02:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
     a08:	0008 
     a0a:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
     a10:	000c 
     a12:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
     a18:	0010 
     a1a:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
     a20:	0014 
     a22:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
     a28:	0018 
     a2a:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
     a30:	001c 
     a32:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
     a38:	0020 
     a3a:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
     a40:	0024 
     a42:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
     a48:	0028 
     a4a:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
     a50:	002c 
     a52:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
     a58:	0030 
     a5a:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
     a60:	0034 
     a62:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
     a68:	0038 
     a6a:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
     a70:	003c 
    *cl++ = *clpartinstruction++;
     a72:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
     a78:	0040 
     a7a:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
     a80:	0044 
     a82:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
     a88:	0048 
     a8a:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
     a90:	004c 
     a92:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
     a98:	0050 
     a9a:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
     aa0:	0054 
     aa2:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
     aa8:	0058 
     aaa:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
     ab0:	005c 
     ab2:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
     ab8:	0060 
     aba:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
     ac0:	0064 
     ac2:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
     ac8:	0068 
     aca:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
     ad0:	006c 
  *cl++ = 0x00e00000;
     ad2:	257c 00e0 0000 	move.l #14680064,112(a2)
     ad8:	0070 
  *cl++ = 0x00e20000;
     ada:	257c 00e2 0000 	move.l #14811136,116(a2)
     ae0:	0074 
    *cl++ = *clpartinstruction++;
     ae2:	2579 0001 7340 	move.l 17340 <ClColor>,120(a2)
     ae8:	0078 
     aea:	2579 0001 7344 	move.l 17344 <ClColor+0x4>,124(a2)
     af0:	007c 
  *cl = 0xfffffffe;
     af2:	70fe           	moveq #-2,d0
     af4:	2540 0080      	move.l d0,128(a2)
}
     af8:	200a           	move.l a2,d0
     afa:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     afe:	4e75           	rts

00000b00 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     b00:	4fef ffdc      	lea -36(sp),sp
     b04:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     b08:	282f 005c      	move.l 92(sp),d4
     b0c:	262f 0060      	move.l 96(sp),d3
     b10:	3404           	move.w d4,d2
     b12:	3f43 0032      	move.w d3,50(sp)
  WaitBlit();
     b16:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
     b1c:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     b20:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     b26:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     b2c:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     b32:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     b38:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     b3e:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     b44:	3044           	movea.w d4,a0
     b46:	d0c4           	adda.w d4,a0
     b48:	3208           	move.w a0,d1
     b4a:	d248           	add.w a0,d1
     b4c:	d244           	add.w d4,d1
     b4e:	3001           	move.w d1,d0
     b50:	d041           	add.w d1,d0
     b52:	0640 014c      	addi.w #332,d0
     b56:	3f40 0042      	move.w d0,66(sp)
  WORD shiftright = 9;
     b5a:	3a7c 0009      	movea.w #9,a5
  while( nextzoom > 22 * 16) {
     b5e:	0c40 0160      	cmpi.w #352,d0
     b62:	6f12           	ble.s b76 <Zoom_ZoomIntoPicture+0x76>
    nextzoom -= (19 + zoomnr);
     b64:	0640 ffed      	addi.w #-19,d0
     b68:	9042           	sub.w d2,d0
    shiftright--;
     b6a:	534d           	subq.w #1,a5
  while( nextzoom > 22 * 16) {
     b6c:	0c40 0160      	cmpi.w #352,d0
     b70:	6ef2           	bgt.s b64 <Zoom_ZoomIntoPicture+0x64>
     b72:	3f40 0042      	move.w d0,66(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     b76:	7012           	moveq #18,d0
     b78:	9041           	sub.w d1,d0
     b7a:	3f40 004c      	move.w d0,76(sp)
  while( ZoomHorizontalStart < 0) {
     b7e:	6c00 03fa      	bge.w f7a <Zoom_ZoomIntoPicture+0x47a>
     b82:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     b84:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     b86:	0641 0013      	addi.w #19,d1
     b8a:	d242           	add.w d2,d1
      shifthoriz--;
     b8c:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     b8e:	4a41           	tst.w d1
     b90:	6df4           	blt.s b86 <Zoom_ZoomIntoPicture+0x86>
     b92:	3f41 004c      	move.w d1,76(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     b96:	3203           	move.w d3,d1
     b98:	d243           	add.w d3,d1
     b9a:	d243           	add.w d3,d1
     b9c:	e749           	lsl.w #3,d1
     b9e:	3f41 002c      	move.w d1,44(sp)
  hw->bltsize = (height<<6)+2;
     ba2:	3203           	move.w d3,d1
     ba4:	ed49           	lsl.w #6,d1
     ba6:	5441           	addq.w #2,d1
     ba8:	3f41 0034      	move.w d1,52(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     bac:	90c4           	suba.w d4,a0
     bae:	3448           	movea.w a0,a2
     bb0:	45ea 0012      	lea 18(a2),a2
     bb4:	7200           	moveq #0,d1
     bb6:	322f 002c      	move.w 44(sp),d1
     bba:	2f41 002e      	move.l d1,46(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     bbe:	c6c0           	mulu.w d0,d3
     bc0:	2003           	move.l d3,d0
     bc2:	d083           	add.l d3,d0
     bc4:	d083           	add.l d3,d0
     bc6:	e988           	lsl.l #4,d0
     bc8:	206f 0054      	movea.l 84(sp),a0
     bcc:	41f0 082c      	lea (44,a0,d0.l),a0
     bd0:	2f48 003e      	move.l a0,62(sp)
     bd4:	702c           	moveq #44,d0
     bd6:	d0af 0058      	add.l 88(sp),d0
     bda:	2f40 003a      	move.l d0,58(sp)
  UWORD shifttoleft = 0;
     bde:	426f 004a      	clr.w 74(sp)
  UWORD startofword = 21*16;
     be2:	3f7c 0150 0036 	move.w #336,54(sp)
      nextzoom -= (19 + zoomnr);
     be8:	72ed           	moveq #-19,d1
     bea:	9242           	sub.w d2,d1
     bec:	3f41 004e      	move.w d1,78(sp)
    ZoomBlit_Increment4SrcA = 1;
     bf0:	3f4d 0038      	move.w a5,56(sp)
    ZoomHorizontal = ZoomHorizontalStart;
     bf4:	33ef 004c 0001 	move.w 76(sp),17798 <ZoomHorizontal>
     bfa:	7798 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     bfc:	262f 003e      	move.l 62(sp),d3
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     c00:	282f 003a      	move.l 58(sp),d4
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     c04:	7000           	moveq #0,d0
     c06:	302f 004a      	move.w 74(sp),d0
     c0a:	2840           	movea.l d0,a4
     c0c:	4bf4 c800      	lea (0,a4,a4.l),a5
     c10:	3f6f 0038 0048 	move.w 56(sp),72(sp)
     c16:	342f 0038      	move.w 56(sp),d2
     c1a:	720c           	moveq #12,d1
     c1c:	e36a           	lsl.w d1,d2
     c1e:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
     c24:	302f 0036      	move.w 54(sp),d0
     c28:	306f 0042      	movea.w 66(sp),a0
     c2c:	b1c0           	cmpa.l d0,a0
     c2e:	6e00 0138      	bgt.w d68 <Zoom_ZoomIntoPicture+0x268>
  WaitBlit();
     c32:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     c36:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     c3c:	0642 09f0      	addi.w #2544,d2
     c40:	3142 0040      	move.w d2,64(a0)
  hw->bltcon1 = 0;
     c44:	317c 0000 0042 	move.w #0,66(a0)
     c4a:	3039 0001 7798 	move.w 17798 <ZoomHorizontal>,d0
    WORD linesleft = 272;
     c50:	3c3c 0110      	move.w #272,d6
        if( linesleft >= ZoomHorizontal+1) {
     c54:	3a06           	move.w d6,d5
     c56:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
     c5c:	b046           	cmp.w d6,d0
     c5e:	6c00 0092      	bge.w cf2 <Zoom_ZoomIntoPicture+0x1f2>
          linesleft -= ZoomHorizontal;
     c62:	9c40           	sub.w d0,d6
        UWORD size4blit = ZoomHorizontal*onestep; 
     c64:	342f 002c      	move.w 44(sp),d2
     c68:	c5c0           	muls.w d0,d2
        if( linesleft>0) {
     c6a:	0282 0000 ffff 	andi.l #65535,d2
     c70:	2e02           	move.l d2,d7
     c72:	de82           	add.l d2,d7
     c74:	4a46           	tst.w d6
     c76:	6f00 00ea      	ble.w d62 <Zoom_ZoomIntoPicture+0x262>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     c7a:	2a0c           	move.l a4,d5
     c7c:	da82           	add.l d2,d5
     c7e:	da85           	add.l d5,d5
     c80:	da83           	add.l d3,d5
  WaitBlit();
     c82:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = (UWORD *) source;
     c86:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     c8c:	2145 0050      	move.l d5,80(a0)
  hw->bltdpt = (UWORD *) destination;
     c90:	2004           	move.l d4,d0
     c92:	d087           	add.l d7,d0
     c94:	2140 0054      	move.l d0,84(a0)
  hw->bltsize = (height<<6)+2;
     c98:	316f 0034 0058 	move.w 52(sp),88(a0)
          linesleft--;
     c9e:	5346           	subq.w #1,d6
     ca0:	3a39 0001 7798 	move.w 17798 <ZoomHorizontal>,d5
     ca6:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     cac:	cbef 0032      	muls.w 50(sp),d5
     cb0:	47f5 3800      	lea (0,a5,d3.l),a3
  WaitBlit();
     cb4:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = (UWORD *) source;
     cb8:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     cbe:	214b 0050      	move.l a3,80(a0)
  hw->bltdpt = (UWORD *) destination;
     cc2:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = (height<<6)+2;
     cc6:	ed4d           	lsl.w #6,d5
     cc8:	5445           	addq.w #2,d5
     cca:	3145 0058      	move.w d5,88(a0)
        pos4source += size4blit;
     cce:	d687           	add.l d7,d3
        pos4dest += size4blit + onestep; 
     cd0:	d4af 002e      	add.l 46(sp),d2
     cd4:	d482           	add.l d2,d2
     cd6:	d882           	add.l d2,d4
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     cd8:	33ca 0001 7798 	move.w a2,17798 <ZoomHorizontal>
      while(linesleft > 0) {
     cde:	4a46           	tst.w d6
     ce0:	6f5e           	ble.s d40 <Zoom_ZoomIntoPicture+0x240>
     ce2:	300a           	move.w a2,d0
        if( linesleft >= ZoomHorizontal+1) {
     ce4:	3a06           	move.w d6,d5
     ce6:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
     cec:	b046           	cmp.w d6,d0
     cee:	6d00 ff72      	blt.w c62 <Zoom_ZoomIntoPicture+0x162>
          ZoomHorizontal = linesleft;
     cf2:	33c6 0001 7798 	move.w d6,17798 <ZoomHorizontal>
        UWORD size4blit = ZoomHorizontal*onestep; 
     cf8:	342f 002c      	move.w 44(sp),d2
     cfc:	c5c6           	muls.w d6,d2
        if( linesleft>0) {
     cfe:	0282 0000 ffff 	andi.l #65535,d2
     d04:	2e02           	move.l d2,d7
     d06:	de82           	add.l d2,d7
          linesleft = 0;
     d08:	4246           	clr.w d6
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     d0a:	cbef 0032      	muls.w 50(sp),d5
     d0e:	47f5 3800      	lea (0,a5,d3.l),a3
  WaitBlit();
     d12:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = (UWORD *) source;
     d16:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     d1c:	214b 0050      	move.l a3,80(a0)
  hw->bltdpt = (UWORD *) destination;
     d20:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = (height<<6)+2;
     d24:	ed4d           	lsl.w #6,d5
     d26:	5445           	addq.w #2,d5
     d28:	3145 0058      	move.w d5,88(a0)
        pos4source += size4blit;
     d2c:	d687           	add.l d7,d3
        pos4dest += size4blit + onestep; 
     d2e:	d4af 002e      	add.l 46(sp),d2
     d32:	d482           	add.l d2,d2
     d34:	d882           	add.l d2,d4
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     d36:	33ca 0001 7798 	move.w a2,17798 <ZoomHorizontal>
      while(linesleft > 0) {
     d3c:	4a46           	tst.w d6
     d3e:	6ea2           	bgt.s ce2 <Zoom_ZoomIntoPicture+0x1e2>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     d40:	066f fff0 0036 	addi.w #-16,54(sp)
     d46:	55af 003e      	subq.l #2,62(sp)
     d4a:	55af 003a      	subq.l #2,58(sp)
  for(int i=0;i<22;i++) {
     d4e:	0c6f fff0 0036 	cmpi.w #-16,54(sp)
     d54:	6600 fe9e      	bne.w bf4 <Zoom_ZoomIntoPicture+0xf4>
  }
  //ZoomHorizontal = 10;
}
     d58:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     d5c:	4fef 0024      	lea 36(sp),sp
     d60:	4e75           	rts
        if( linesleft>0) {
     d62:	3a00           	move.w d0,d5
     d64:	6000 ff46      	bra.w cac <Zoom_ZoomIntoPicture+0x1ac>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     d68:	3c2f 0042      	move.w 66(sp),d6
     d6c:	9c6f 0036      	sub.w 54(sp),d6
     d70:	5346           	subq.w #1,d6
  if( shiftright == 0) {
     d72:	302f 0048      	move.w 72(sp),d0
     d76:	5340           	subq.w #1,d0
     d78:	3f40 0038      	move.w d0,56(sp)
     d7c:	4a6f 0048      	tst.w 72(sp)
     d80:	6600 01a6      	bne.w f28 <Zoom_ZoomIntoPicture+0x428>
    ZoomBlit_Increment4SrcA = 1;
     d84:	33fc 0001 0001 	move.w #1,177ae <ZoomBlit_Increment4SrcA>
     d8a:	77ae 
     d8c:	3a3c fde4      	move.w #-540,d5
  WaitBlit(); 
     d90:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     d94:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     d9a:	3142 0042      	move.w d2,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     d9e:	3145 0040      	move.w d5,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     da2:	0286 0000 ffff 	andi.l #65535,d6
     da8:	7010           	moveq #16,d0
     daa:	9086           	sub.l d6,d0
     dac:	2c00           	move.l d0,d6
     dae:	7000           	moveq #0,d0
     db0:	4640           	not.w d0
     db2:	eda8           	lsl.l d6,d0
     db4:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
     db8:	322f 004e      	move.w 78(sp),d1
     dbc:	d36f 0042      	add.w d1,66(sp)
      while( linesleft > 0) {
     dc0:	3039 0001 7798 	move.w 17798 <ZoomHorizontal>,d0
    WORD linesleft = 272;
     dc6:	3e3c 0110      	move.w #272,d7
     dca:	2f4c 0044      	move.l a4,68(sp)
        if( linesleft >= ZoomHorizontal+1) {
     dce:	3c07           	move.w d7,d6
     dd0:	7a00           	moveq #0,d5
     dd2:	3a39 0001 77ae 	move.w 177ae <ZoomBlit_Increment4SrcA>,d5
     dd8:	da85           	add.l d5,d5
     dda:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
     de0:	b047           	cmp.w d7,d0
     de2:	6c00 00b4      	bge.w e98 <Zoom_ZoomIntoPicture+0x398>
          linesleft -= ZoomHorizontal;
     de6:	9e40           	sub.w d0,d7
        UWORD size4blit = ZoomHorizontal*onestep;
     de8:	342f 002c      	move.w 44(sp),d2
     dec:	c5c0           	muls.w d0,d2
        if( linesleft>0) {
     dee:	0282 0000 ffff 	andi.l #65535,d2
     df4:	2842           	movea.l d2,a4
     df6:	d9c2           	adda.l d2,a4
     df8:	4a47           	tst.w d7
     dfa:	6f00 0126      	ble.w f22 <Zoom_ZoomIntoPicture+0x422>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     dfe:	2c2f 0044      	move.l 68(sp),d6
     e02:	dc82           	add.l d2,d6
     e04:	dc86           	add.l d6,d6
     e06:	dc83           	add.l d3,d6
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     e08:	da86           	add.l d6,d5
  WaitBlit();
     e0a:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = blta;
     e0e:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     e14:	2145 0050      	move.l d5,80(a0)
  hw->bltbpt = source;
     e18:	2146 004c      	move.l d6,76(a0)
  hw->bltdpt = destination;
     e1c:	2004           	move.l d4,d0
     e1e:	d08c           	add.l a4,d0
     e20:	2140 0054      	move.l d0,84(a0)
  hw->bltsize = (height<<6)+2;
     e24:	316f 0034 0058 	move.w 52(sp),88(a0)
          linesleft--;
     e2a:	5347           	subq.w #1,d7
     e2c:	3c39 0001 7798 	move.w 17798 <ZoomHorizontal>,d6
     e32:	7a00           	moveq #0,d5
     e34:	3a39 0001 77ae 	move.w 177ae <ZoomBlit_Increment4SrcA>,d5
     e3a:	da85           	add.l d5,d5
     e3c:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     e42:	cdef 0032      	muls.w 50(sp),d6
     e46:	47f5 3800      	lea (0,a5,d3.l),a3
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     e4a:	da8b           	add.l a3,d5
  WaitBlit();
     e4c:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = blta;
     e50:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     e56:	2145 0050      	move.l d5,80(a0)
  hw->bltbpt = source;
     e5a:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
     e5e:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = (height<<6)+2;
     e62:	ed4e           	lsl.w #6,d6
     e64:	5446           	addq.w #2,d6
     e66:	3146 0058      	move.w d6,88(a0)
        pos4source += size4blit;
     e6a:	d68c           	add.l a4,d3
        pos4dest += size4blit + onestep;   
     e6c:	d4af 002e      	add.l 46(sp),d2
     e70:	d482           	add.l d2,d2
     e72:	d882           	add.l d2,d4
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     e74:	33ca 0001 7798 	move.w a2,17798 <ZoomHorizontal>
      while( linesleft > 0) {
     e7a:	4a47           	tst.w d7
     e7c:	6f6e           	ble.s eec <Zoom_ZoomIntoPicture+0x3ec>
     e7e:	300a           	move.w a2,d0
        if( linesleft >= ZoomHorizontal+1) {
     e80:	3c07           	move.w d7,d6
     e82:	7a00           	moveq #0,d5
     e84:	3a39 0001 77ae 	move.w 177ae <ZoomBlit_Increment4SrcA>,d5
     e8a:	da85           	add.l d5,d5
     e8c:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
     e92:	b047           	cmp.w d7,d0
     e94:	6d00 ff50      	blt.w de6 <Zoom_ZoomIntoPicture+0x2e6>
          ZoomHorizontal = linesleft;
     e98:	33c7 0001 7798 	move.w d7,17798 <ZoomHorizontal>
        UWORD size4blit = ZoomHorizontal*onestep;
     e9e:	342f 002c      	move.w 44(sp),d2
     ea2:	c5c7           	muls.w d7,d2
        if( linesleft>0) {
     ea4:	0282 0000 ffff 	andi.l #65535,d2
     eaa:	2842           	movea.l d2,a4
     eac:	d9c2           	adda.l d2,a4
          linesleft = 0;
     eae:	4247           	clr.w d7
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     eb0:	cdef 0032      	muls.w 50(sp),d6
     eb4:	47f5 3800      	lea (0,a5,d3.l),a3
  ULONG blta = source + ZoomBlit_Increment4SrcA;
     eb8:	da8b           	add.l a3,d5
  WaitBlit();
     eba:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = blta;
     ebe:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     ec4:	2145 0050      	move.l d5,80(a0)
  hw->bltbpt = source;
     ec8:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
     ecc:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = (height<<6)+2;
     ed0:	ed4e           	lsl.w #6,d6
     ed2:	5446           	addq.w #2,d6
     ed4:	3146 0058      	move.w d6,88(a0)
        pos4source += size4blit;
     ed8:	d68c           	add.l a4,d3
        pos4dest += size4blit + onestep;   
     eda:	d4af 002e      	add.l 46(sp),d2
     ede:	d482           	add.l d2,d2
     ee0:	d882           	add.l d2,d4
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     ee2:	33ca 0001 7798 	move.w a2,17798 <ZoomHorizontal>
      while( linesleft > 0) {
     ee8:	4a47           	tst.w d7
     eea:	6e92           	bgt.s e7e <Zoom_ZoomIntoPicture+0x37e>
      if(shiftright < 0) {
     eec:	4a6f 0038      	tst.w 56(sp)
     ef0:	6c00 fe4e      	bge.w d40 <Zoom_ZoomIntoPicture+0x240>
        shiftright += 16;
     ef4:	302f 0048      	move.w 72(sp),d0
     ef8:	0640 000f      	addi.w #15,d0
     efc:	3f40 0038      	move.w d0,56(sp)
        shifttoleft = 1;
     f00:	3f7c 0001 004a 	move.w #1,74(sp)
    startofword -= 16;
     f06:	066f fff0 0036 	addi.w #-16,54(sp)
     f0c:	55af 003e      	subq.l #2,62(sp)
     f10:	55af 003a      	subq.l #2,58(sp)
  for(int i=0;i<22;i++) {
     f14:	0c6f fff0 0036 	cmpi.w #-16,54(sp)
     f1a:	6600 fcd8      	bne.w bf4 <Zoom_ZoomIntoPicture+0xf4>
     f1e:	6000 fe38      	bra.w d58 <Zoom_ZoomIntoPicture+0x258>
        if( linesleft>0) {
     f22:	3c00           	move.w d0,d6
     f24:	6000 ff1c      	bra.w e42 <Zoom_ZoomIntoPicture+0x342>
     f28:	3a00           	move.w d0,d5
  ZoomBlit_Increment4SrcA = 0;
     f2a:	4279 0001 77ae 	clr.w 177ae <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
     f30:	720c           	moveq #12,d1
     f32:	e36d           	lsl.w d1,d5
     f34:	0645 0de4      	addi.w #3556,d5
  WaitBlit(); 
     f38:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     f3c:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
     f42:	3142 0042      	move.w d2,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     f46:	3145 0040      	move.w d5,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     f4a:	0286 0000 ffff 	andi.l #65535,d6
     f50:	7010           	moveq #16,d0
     f52:	9086           	sub.l d6,d0
     f54:	2c00           	move.l d0,d6
     f56:	7000           	moveq #0,d0
     f58:	4640           	not.w d0
     f5a:	eda8           	lsl.l d6,d0
     f5c:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
     f60:	322f 004e      	move.w 78(sp),d1
     f64:	d36f 0042      	add.w d1,66(sp)
      while( linesleft > 0) {
     f68:	3039 0001 7798 	move.w 17798 <ZoomHorizontal>,d0
    WORD linesleft = 272;
     f6e:	3e3c 0110      	move.w #272,d7
     f72:	2f4c 0044      	move.l a4,68(sp)
     f76:	6000 fe56      	bra.w dce <Zoom_ZoomIntoPicture+0x2ce>
  UWORD shifthoriz = 7;
     f7a:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
     f7c:	3203           	move.w d3,d1
     f7e:	d243           	add.w d3,d1
     f80:	d243           	add.w d3,d1
     f82:	e749           	lsl.w #3,d1
     f84:	3f41 002c      	move.w d1,44(sp)
  hw->bltsize = (height<<6)+2;
     f88:	3203           	move.w d3,d1
     f8a:	ed49           	lsl.w #6,d1
     f8c:	5441           	addq.w #2,d1
     f8e:	3f41 0034      	move.w d1,52(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     f92:	90c4           	suba.w d4,a0
     f94:	3448           	movea.w a0,a2
     f96:	45ea 0012      	lea 18(a2),a2
     f9a:	7200           	moveq #0,d1
     f9c:	322f 002c      	move.w 44(sp),d1
     fa0:	2f41 002e      	move.l d1,46(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     fa4:	c6c0           	mulu.w d0,d3
     fa6:	2003           	move.l d3,d0
     fa8:	d083           	add.l d3,d0
     faa:	d083           	add.l d3,d0
     fac:	e988           	lsl.l #4,d0
     fae:	206f 0054      	movea.l 84(sp),a0
     fb2:	41f0 082c      	lea (44,a0,d0.l),a0
     fb6:	2f48 003e      	move.l a0,62(sp)
     fba:	702c           	moveq #44,d0
     fbc:	d0af 0058      	add.l 88(sp),d0
     fc0:	2f40 003a      	move.l d0,58(sp)
  UWORD shifttoleft = 0;
     fc4:	426f 004a      	clr.w 74(sp)
  UWORD startofword = 21*16;
     fc8:	3f7c 0150 0036 	move.w #336,54(sp)
      nextzoom -= (19 + zoomnr);
     fce:	72ed           	moveq #-19,d1
     fd0:	9242           	sub.w d2,d1
     fd2:	3f41 004e      	move.w d1,78(sp)
    ZoomBlit_Increment4SrcA = 1;
     fd6:	3f4d 0038      	move.w a5,56(sp)
     fda:	6000 fc18      	bra.w bf4 <Zoom_ZoomIntoPicture+0xf4>

00000fde <ClbuildZoom>:
ULONG * ClbuildZoom() {
     fde:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     fe2:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
     fe8:	203c 0000 031c 	move.l #796,d0
     fee:	7202           	moveq #2,d1
     ff0:	4eae ff3a      	jsr -198(a6)
     ff4:	2440           	movea.l d0,a2
  if( retval == 0) {
     ff6:	4a80           	tst.l d0
     ff8:	6700 01ea      	beq.w 11e4 <ClbuildZoom+0x206>
    *cl++ = *clpartinstruction++;
     ffc:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
    1002:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
    1008:	0004 
    100a:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
    1010:	0008 
    1012:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
    1018:	000c 
    101a:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
    1020:	0010 
    1022:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
    1028:	0014 
    102a:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
    1030:	0018 
    1032:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
    1038:	001c 
    103a:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
    1040:	0020 
    1042:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
    1048:	0024 
    104a:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
    1050:	0028 
    1052:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
    1058:	002c 
    105a:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
    1060:	0030 
    1062:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
    1068:	0034 
    106a:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
    1070:	0038 
    1072:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
    1078:	003c 
    *cl++ = *clpartinstruction++;
    107a:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
    1080:	0040 
    1082:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
    1088:	0044 
    108a:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
    1090:	0048 
    1092:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
    1098:	004c 
    109a:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
    10a0:	0050 
    10a2:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
    10a8:	0054 
    10aa:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
    10b0:	0058 
    10b2:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
    10b8:	005c 
    10ba:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
    10c0:	0060 
    10c2:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
    10c8:	0064 
    10ca:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
    10d0:	0068 
    10d2:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
    10d8:	006c 
  *cl++ = 0x00e00000;
    10da:	257c 00e0 0000 	move.l #14680064,112(a2)
    10e0:	0070 
  *cl++ = 0x00e20000;
    10e2:	257c 00e2 0000 	move.l #14811136,116(a2)
    10e8:	0074 
  *cl++ = 0x00e40000;
    10ea:	257c 00e4 0000 	move.l #14942208,120(a2)
    10f0:	0078 
  *cl++ = 0x00e60000;
    10f2:	257c 00e6 0000 	move.l #15073280,124(a2)
    10f8:	007c 
  *cl++ = 0x00e80000;
    10fa:	257c 00e8 0000 	move.l #15204352,128(a2)
    1100:	0080 
  *cl++ = 0x00ea0000;
    1102:	257c 00ea 0000 	move.l #15335424,132(a2)
    1108:	0084 
  *cl++ = 0x00ec0000;
    110a:	257c 00ec 0000 	move.l #15466496,136(a2)
    1110:	0088 
  *cl++ = 0x00ee0000;
    1112:	257c 00ee 0000 	move.l #15597568,140(a2)
    1118:	008c 
  *cl++ = 0x00f00000;
    111a:	257c 00f0 0000 	move.l #15728640,144(a2)
    1120:	0090 
  *cl++ = 0x00f20000;
    1122:	257c 00f2 0000 	move.l #15859712,148(a2)
    1128:	0094 
  for(int i=0; i<32;i++)
    112a:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    112e:	41f9 0001 7340 	lea 17340 <ClColor>,a0
    *cl++ = *clpartinstruction++;
    1134:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1136:	b1fc 0001 73c0 	cmpa.l #95168,a0
    113c:	66f6           	bne.s 1134 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
    113e:	200a           	move.l a2,d0
    1140:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1146:	2200           	move.l d0,d1
    1148:	4241           	clr.w d1
    114a:	4841           	swap d1
    114c:	0681 0084 0000 	addi.l #8650752,d1
    1152:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    1156:	2200           	move.l d0,d1
    1158:	0281 0000 ffff 	andi.l #65535,d1
    115e:	0681 0086 0000 	addi.l #8781824,d1
    1164:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
    1168:	257c 2c01 ff00 	move.l #738328320,288(a2)
    116e:	0120 
  ULONG cop2br1 = cop2 + ( (30)<<2);
    1170:	7278           	moveq #120,d1
    1172:	d280           	add.l d0,d1
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1174:	2401           	move.l d1,d2
    1176:	4242           	clr.w d2
    1178:	4842           	swap d2
    117a:	0682 0084 0000 	addi.l #8650752,d2
    1180:	23c2 0001 6f70 	move.l d2,16f70 <Cl102ZoomRepeat+0x70>
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1186:	0281 0000 ffff 	andi.l #65535,d1
    118c:	0681 0086 0000 	addi.l #8781824,d1
    1192:	23c1 0001 6f74 	move.l d1,16f74 <Cl102ZoomRepeat+0x74>
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1198:	220a           	move.l a2,d1
    119a:	0681 0000 027c 	addi.l #636,d1
    11a0:	2401           	move.l d1,d2
    11a2:	4242           	clr.w d2
    11a4:	4842           	swap d2
    11a6:	0682 0084 0000 	addi.l #8650752,d2
    11ac:	23c2 0001 7050 	move.l d2,17050 <Cl102ZoomRepeat+0x150>
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    11b2:	0281 0000 ffff 	andi.l #65535,d1
    11b8:	0681 0086 0000 	addi.l #8781824,d1
    11be:	23c1 0001 7054 	move.l d1,17054 <Cl102ZoomRepeat+0x154>
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    11c4:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
    11c6:	41f9 0001 6f00 	lea 16f00 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
    11cc:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    11ce:	b1fc 0001 70c8 	cmpa.l #94408,a0
    11d4:	66f6           	bne.s 11cc <ClbuildZoom+0x1ee>
   *cl++ = 0xfffffffe;
    11d6:	70fe           	moveq #-2,d0
    11d8:	2540 02ec      	move.l d0,748(a2)
}
    11dc:	200a           	move.l a2,d0
    11de:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    11e2:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    11e4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    11ea:	4eae ffc4      	jsr -60(a6)
    11ee:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    11f4:	2200           	move.l d0,d1
    11f6:	243c 0001 56ef 	move.l #87791,d2
    11fc:	7628           	moveq #40,d3
    11fe:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1202:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    1208:	7201           	moveq #1,d1
    120a:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    120e:	24b9 0001 73f0 	move.l 173f0 <ClsSprites>,(a2)
    1214:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x4>,4(a2)
    121a:	0004 
    121c:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x8>,8(a2)
    1222:	0008 
    1224:	2579 0001 73fc 	move.l 173fc <ClsSprites+0xc>,12(a2)
    122a:	000c 
    122c:	2579 0001 7400 	move.l 17400 <ClsSprites+0x10>,16(a2)
    1232:	0010 
    1234:	2579 0001 7404 	move.l 17404 <ClsSprites+0x14>,20(a2)
    123a:	0014 
    123c:	2579 0001 7408 	move.l 17408 <ClsSprites+0x18>,24(a2)
    1242:	0018 
    1244:	2579 0001 740c 	move.l 1740c <ClsSprites+0x1c>,28(a2)
    124a:	001c 
    124c:	2579 0001 7410 	move.l 17410 <ClsSprites+0x20>,32(a2)
    1252:	0020 
    1254:	2579 0001 7414 	move.l 17414 <ClsSprites+0x24>,36(a2)
    125a:	0024 
    125c:	2579 0001 7418 	move.l 17418 <ClsSprites+0x28>,40(a2)
    1262:	0028 
    1264:	2579 0001 741c 	move.l 1741c <ClsSprites+0x2c>,44(a2)
    126a:	002c 
    126c:	2579 0001 7420 	move.l 17420 <ClsSprites+0x30>,48(a2)
    1272:	0030 
    1274:	2579 0001 7424 	move.l 17424 <ClsSprites+0x34>,52(a2)
    127a:	0034 
    127c:	2579 0001 7428 	move.l 17428 <ClsSprites+0x38>,56(a2)
    1282:	0038 
    1284:	2579 0001 742c 	move.l 1742c <ClsSprites+0x3c>,60(a2)
    128a:	003c 
    *cl++ = *clpartinstruction++;
    128c:	2579 0001 73c0 	move.l 173c0 <ClScreen>,64(a2)
    1292:	0040 
    1294:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x4>,68(a2)
    129a:	0044 
    129c:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x8>,72(a2)
    12a2:	0048 
    12a4:	2579 0001 73cc 	move.l 173cc <ClScreen+0xc>,76(a2)
    12aa:	004c 
    12ac:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x10>,80(a2)
    12b2:	0050 
    12b4:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x14>,84(a2)
    12ba:	0054 
    12bc:	2579 0001 73d8 	move.l 173d8 <ClScreen+0x18>,88(a2)
    12c2:	0058 
    12c4:	2579 0001 73dc 	move.l 173dc <ClScreen+0x1c>,92(a2)
    12ca:	005c 
    12cc:	2579 0001 73e0 	move.l 173e0 <ClScreen+0x20>,96(a2)
    12d2:	0060 
    12d4:	2579 0001 73e4 	move.l 173e4 <ClScreen+0x24>,100(a2)
    12da:	0064 
    12dc:	2579 0001 73e8 	move.l 173e8 <ClScreen+0x28>,104(a2)
    12e2:	0068 
    12e4:	2579 0001 73ec 	move.l 173ec <ClScreen+0x2c>,108(a2)
    12ea:	006c 
  *cl++ = 0x00e00000;
    12ec:	257c 00e0 0000 	move.l #14680064,112(a2)
    12f2:	0070 
  *cl++ = 0x00e20000;
    12f4:	257c 00e2 0000 	move.l #14811136,116(a2)
    12fa:	0074 
  *cl++ = 0x00e40000;
    12fc:	257c 00e4 0000 	move.l #14942208,120(a2)
    1302:	0078 
  *cl++ = 0x00e60000;
    1304:	257c 00e6 0000 	move.l #15073280,124(a2)
    130a:	007c 
  *cl++ = 0x00e80000;
    130c:	257c 00e8 0000 	move.l #15204352,128(a2)
    1312:	0080 
  *cl++ = 0x00ea0000;
    1314:	257c 00ea 0000 	move.l #15335424,132(a2)
    131a:	0084 
  *cl++ = 0x00ec0000;
    131c:	257c 00ec 0000 	move.l #15466496,136(a2)
    1322:	0088 
  *cl++ = 0x00ee0000;
    1324:	257c 00ee 0000 	move.l #15597568,140(a2)
    132a:	008c 
  *cl++ = 0x00f00000;
    132c:	257c 00f0 0000 	move.l #15728640,144(a2)
    1332:	0090 
  *cl++ = 0x00f20000;
    1334:	257c 00f2 0000 	move.l #15859712,148(a2)
    133a:	0094 
  for(int i=0; i<32;i++)
    133c:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    1340:	41f9 0001 7340 	lea 17340 <ClColor>,a0
    1346:	6000 fdec      	bra.w 1134 <ClbuildZoom+0x156>

0000134a <PrepareDisplayZoom>:
int Zoom_PrepareDisplay() {
    134a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom( );
    134e:	45fa fc8e      	lea fde <ClbuildZoom>(pc),a2
    1352:	4e92           	jsr (a2)
    1354:	23c0 0001 77aa 	move.l d0,177aa <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    135a:	4e92           	jsr (a2)
    135c:	23c0 0001 7788 	move.l d0,17788 <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    1362:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1368:	203c 0000 ff00 	move.l #65280,d0
    136e:	7202           	moveq #2,d1
    1370:	4eae ff3a      	jsr -198(a6)
    1374:	23c0 0001 7790 	move.l d0,17790 <Bitplane1>
  if(Bitplane1 == 0) {
    137a:	6700 008c      	beq.w 1408 <PrepareDisplayZoom+0xbe>
  DrawBuffer = Bitplane1;
    137e:	23c0 0001 77b0 	move.l d0,177b0 <DrawBuffer>
  DrawCopper = Copperlist1;
    1384:	23f9 0001 77aa 	move.l 177aa <Copperlist1>,177a2 <DrawCopper>
    138a:	0001 77a2 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    138e:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1394:	203c 0000 ff00 	move.l #65280,d0
    139a:	7202           	moveq #2,d1
    139c:	4eae ff3a      	jsr -198(a6)
    13a0:	23c0 0001 778c 	move.l d0,1778c <Bitplane2>
  if(Bitplane2 == 0) {
    13a6:	6718           	beq.s 13c0 <PrepareDisplayZoom+0x76>
  ViewBuffer = Bitplane2;
    13a8:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
  ViewCopper = Copperlist2;
    13ae:	23f9 0001 7788 	move.l 17788 <Copperlist2>,17782 <ViewCopper>
    13b4:	0001 7782 
}
    13b8:	7000           	moveq #0,d0
    13ba:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    13be:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    13c0:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    13c6:	4eae ffc4      	jsr -60(a6)
    13ca:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    13d0:	2200           	move.l d0,d1
    13d2:	243c 0001 573c 	move.l #87868,d2
    13d8:	7626           	moveq #38,d3
    13da:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    13de:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    13e4:	7201           	moveq #1,d1
    13e6:	4eae ff70      	jsr -144(a6)
    13ea:	2039 0001 778c 	move.l 1778c <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    13f0:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
  ViewCopper = Copperlist2;
    13f6:	23f9 0001 7788 	move.l 17788 <Copperlist2>,17782 <ViewCopper>
    13fc:	0001 7782 
}
    1400:	7000           	moveq #0,d0
    1402:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1406:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    1408:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    140e:	4eae ffc4      	jsr -60(a6)
    1412:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    1418:	2200           	move.l d0,d1
    141a:	243c 0001 5715 	move.l #87829,d2
    1420:	7626           	moveq #38,d3
    1422:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1426:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    142c:	7201           	moveq #1,d1
    142e:	4eae ff70      	jsr -144(a6)
    1432:	2039 0001 7790 	move.l 17790 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    1438:	23c0 0001 77b0 	move.l d0,177b0 <DrawBuffer>
  DrawCopper = Copperlist1;
    143e:	23f9 0001 77aa 	move.l 177aa <Copperlist1>,177a2 <DrawCopper>
    1444:	0001 77a2 
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    1448:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    144e:	203c 0000 ff00 	move.l #65280,d0
    1454:	7202           	moveq #2,d1
    1456:	4eae ff3a      	jsr -198(a6)
    145a:	23c0 0001 778c 	move.l d0,1778c <Bitplane2>
  if(Bitplane2 == 0) {
    1460:	6600 ff46      	bne.w 13a8 <PrepareDisplayZoom+0x5e>
    1464:	6000 ff5a      	bra.w 13c0 <PrepareDisplayZoom+0x76>

00001468 <Zoom_Init>:
void Zoom_Init() {
    1468:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    146a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1470:	7004           	moveq #4,d0
    1472:	7202           	moveq #2,d1
    1474:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    1478:	33fc 0010 0001 	move.w #16,17798 <ZoomHorizontal>
    147e:	7798 
  Zoom_LevelOf102Zoom = 15;
    1480:	33fc 000f 0001 	move.w #15,177a0 <Zoom_LevelOf102Zoom>
    1486:	77a0 
}
    1488:	2c5f           	movea.l (sp)+,a6
    148a:	4e75           	rts

0000148c <SwapCl>:
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}

void SwapCl() {
  ULONG tmp = (ULONG) DrawCopper;
    148c:	2039 0001 77a2 	move.l 177a2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    1492:	23f9 0001 7782 	move.l 17782 <ViewCopper>,177a2 <DrawCopper>
    1498:	0001 77a2 
  ViewCopper = (ULONG *)tmp;
    149c:	23c0 0001 7782 	move.l d0,17782 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    14a2:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    14a8:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    14ac:	3140 0088      	move.w d0,136(a0)
}
    14b0:	4e75           	rts

000014b2 <Zoom_VblankHandler>:
void Zoom_VblankHandler() {
    14b2:	2f0a           	move.l a2,-(sp)
  Zoom_Counter++;
    14b4:	5279 0001 779e 	addq.w #1,1779e <Zoom_Counter>
  ULONG tmp = (ULONG) DrawCopper;
    14ba:	2039 0001 77a2 	move.l 177a2 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    14c0:	2079 0001 7782 	movea.l 17782 <ViewCopper>,a0
    14c6:	23c8 0001 77a2 	move.l a0,177a2 <DrawCopper>
  ViewCopper = (ULONG *)tmp;
    14cc:	23c0 0001 7782 	move.l d0,17782 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    14d2:	2279 0001 77b8 	movea.l 177b8 <hw>,a1
    14d8:	2340 0080      	move.l d0,128(a1)
  hw->copjmp1 = tmp;
    14dc:	3340 0088      	move.w d0,136(a1)
  Zoom_MouseReleased = 1;
    14e0:	33fc 0001 0001 	move.w #1,17780 <Zoom_MouseReleased>
    14e6:	7780 
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
  for( int i=0;i<size;i++) 
    *destination++ = *source++;  
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
    14e8:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd5d81>,d0
  if( MouseLeft())
    14ee:	0800 0006      	btst #6,d0
    14f2:	6600 0398      	bne.w 188c <Zoom_VblankHandler+0x3da>
    Zoom_Mousepressed = 1;
    14f6:	33fc 0001 0001 	move.w #1,1777e <Zoom_Mousepressed>
    14fc:	777e 
    14fe:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd5d81>,d0
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1504:	0800 0006      	btst #6,d0
    1508:	6600 06cc      	bne.w 1bd6 <Zoom_VblankHandler+0x724>
      Zoom_MouseReleased = 0;
    150c:	4279 0001 7780 	clr.w 17780 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
    1512:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    1518:	2479 0001 77a6 	movea.l 177a6 <ViewBuffer>,a2
    151e:	6600 038e      	bne.w 18ae <Zoom_VblankHandler+0x3fc>
        if( Zoom_LevelOfZoom == 17)
    1522:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1528:	0c40 0011      	cmpi.w #17,d0
    152c:	6700 06b2      	beq.w 1be0 <Zoom_VblankHandler+0x72e>
          Zoom_LevelOfZoom++;
    1530:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1536:	5240           	addq.w #1,d0
    1538:	33c0 0001 7786 	move.w d0,17786 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    153e:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1544:	0280 0000 ffff 	andi.l #65535,d0
    154a:	d080           	add.l d0,d0
    154c:	43f9 0001 5e0a 	lea 15e0a <MaxZoom102>,a1
    1552:	3031 0800      	move.w (0,a1,d0.l),d0
    1556:	5540           	subq.w #2,d0
    1558:	33c0 0001 77a0 	move.w d0,177a0 <Zoom_LevelOf102Zoom>
  }
  
}

void Zoom_SwapBuffers() {
  ULONG tmp = (ULONG) DrawBuffer;
    155e:	2039 0001 77b0 	move.l 177b0 <DrawBuffer>,d0
  DrawBuffer = ViewBuffer;
    1564:	23ca 0001 77b0 	move.l a2,177b0 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    156a:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
    1570:	2440           	movea.l d0,a2
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    1572:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
}

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
    1578:	c0fc 00d8      	mulu.w #216,d0
    157c:	2240           	movea.l d0,a1
    157e:	d3fc 0001 6000 	adda.l #90112,a1
    *copperlist = *values4shift++;
    1584:	3151 012a      	move.w (a1),298(a0)
    1588:	3169 0002 012e 	move.w 2(a1),302(a0)
    158e:	3169 0004 0132 	move.w 4(a1),306(a0)
    1594:	3169 0006 0136 	move.w 6(a1),310(a0)
    159a:	3169 0008 013a 	move.w 8(a1),314(a0)
    15a0:	3169 000a 013e 	move.w 10(a1),318(a0)
  *copperlist++ = *values4shift++;
    15a6:	3169 000c 0140 	move.w 12(a1),320(a0)
  *copperlist = *values4shift++;
    15ac:	3169 000e 0142 	move.w 14(a1),322(a0)
    *copperlist = *values4shift++;
    15b2:	3169 0010 0146 	move.w 16(a1),326(a0)
    15b8:	3169 0012 014a 	move.w 18(a1),330(a0)
    15be:	3169 0014 014e 	move.w 20(a1),334(a0)
    15c4:	3169 0016 0152 	move.w 22(a1),338(a0)
    15ca:	3169 0018 0156 	move.w 24(a1),342(a0)
    15d0:	3169 001a 015a 	move.w 26(a1),346(a0)
    15d6:	3169 001c 015e 	move.w 28(a1),350(a0)
    15dc:	3169 001e 0162 	move.w 30(a1),354(a0)
    15e2:	3169 0020 0166 	move.w 32(a1),358(a0)
    15e8:	3169 0022 016a 	move.w 34(a1),362(a0)
  *copperlist++ = *values4shift++;
    15ee:	3169 0024 016c 	move.w 36(a1),364(a0)
  *copperlist = *values4shift++;
    15f4:	3169 0026 016e 	move.w 38(a1),366(a0)
    *copperlist = *values4shift++;
    15fa:	3169 0028 0172 	move.w 40(a1),370(a0)
    1600:	3169 002a 0176 	move.w 42(a1),374(a0)
    1606:	3169 002c 017a 	move.w 44(a1),378(a0)
    160c:	3169 002e 017e 	move.w 46(a1),382(a0)
    1612:	3169 0030 0182 	move.w 48(a1),386(a0)
    1618:	3169 0032 0186 	move.w 50(a1),390(a0)
    161e:	3169 0034 018a 	move.w 52(a1),394(a0)
    *copperlist = *values4shift++;
    1624:	3169 0036 01a2 	move.w 54(a1),418(a0)
    162a:	3169 0038 01a6 	move.w 56(a1),422(a0)
    1630:	3169 003a 01aa 	move.w 58(a1),426(a0)
    1636:	3169 003c 01ae 	move.w 60(a1),430(a0)
    163c:	3169 003e 01b2 	move.w 62(a1),434(a0)
    1642:	3169 0040 01b6 	move.w 64(a1),438(a0)
  *copperlist++ = *values4shift++;
    1648:	3169 0042 01b8 	move.w 66(a1),440(a0)
  *copperlist = *values4shift++;
    164e:	3169 0044 01ba 	move.w 68(a1),442(a0)
    *copperlist = *values4shift++;
    1654:	3169 0046 01be 	move.w 70(a1),446(a0)
    165a:	3169 0048 01c2 	move.w 72(a1),450(a0)
    1660:	3169 004a 01c6 	move.w 74(a1),454(a0)
    1666:	3169 004c 01ca 	move.w 76(a1),458(a0)
    166c:	3169 004e 01ce 	move.w 78(a1),462(a0)
    1672:	3169 0050 01d2 	move.w 80(a1),466(a0)
    1678:	3169 0052 01d6 	move.w 82(a1),470(a0)
    167e:	3169 0054 01da 	move.w 84(a1),474(a0)
    1684:	3169 0056 01de 	move.w 86(a1),478(a0)
    168a:	3169 0058 01e2 	move.w 88(a1),482(a0)
  *copperlist++ = *values4shift++;
    1690:	3169 005a 01e4 	move.w 90(a1),484(a0)
  *copperlist = *values4shift++;
    1696:	3169 005c 01e6 	move.w 92(a1),486(a0)
    *copperlist = *values4shift++;
    169c:	3169 005e 01ea 	move.w 94(a1),490(a0)
    16a2:	3169 0060 01ee 	move.w 96(a1),494(a0)
    16a8:	3169 0062 01f2 	move.w 98(a1),498(a0)
    16ae:	3169 0064 01f6 	move.w 100(a1),502(a0)
    16b4:	3169 0066 01fa 	move.w 102(a1),506(a0)
    16ba:	3169 0068 01fe 	move.w 104(a1),510(a0)
    16c0:	3169 006a 0202 	move.w 106(a1),514(a0)
    *copperlist = *values4shift++;
    16c6:	3169 006c 0212 	move.w 108(a1),530(a0)
    16cc:	3169 006e 0216 	move.w 110(a1),534(a0)
    16d2:	3169 0070 021a 	move.w 112(a1),538(a0)
    16d8:	3169 0072 021e 	move.w 114(a1),542(a0)
    16de:	3169 0074 0222 	move.w 116(a1),546(a0)
    16e4:	3169 0076 0226 	move.w 118(a1),550(a0)
  *copperlist++ = *values4shift++;
    16ea:	3169 0078 0228 	move.w 120(a1),552(a0)
  *copperlist = *values4shift++;
    16f0:	3169 007a 022a 	move.w 122(a1),554(a0)
    *copperlist = *values4shift++;
    16f6:	3169 007c 022e 	move.w 124(a1),558(a0)
    16fc:	3169 007e 0232 	move.w 126(a1),562(a0)
    1702:	3169 0080 0236 	move.w 128(a1),566(a0)
    1708:	3169 0082 023a 	move.w 130(a1),570(a0)
    170e:	3169 0084 023e 	move.w 132(a1),574(a0)
    1714:	3169 0086 0242 	move.w 134(a1),578(a0)
    171a:	3169 0088 0246 	move.w 136(a1),582(a0)
    1720:	3169 008a 024a 	move.w 138(a1),586(a0)
    1726:	3169 008c 024e 	move.w 140(a1),590(a0)
    172c:	3169 008e 0252 	move.w 142(a1),594(a0)
  *copperlist++ = *values4shift++;
    1732:	3169 0090 0254 	move.w 144(a1),596(a0)
  *copperlist = *values4shift++;
    1738:	3169 0092 0256 	move.w 146(a1),598(a0)
    *copperlist = *values4shift++;
    173e:	3169 0094 025a 	move.w 148(a1),602(a0)
    1744:	3169 0096 025e 	move.w 150(a1),606(a0)
    174a:	3169 0098 0262 	move.w 152(a1),610(a0)
    1750:	3169 009a 0266 	move.w 154(a1),614(a0)
    1756:	3169 009c 026a 	move.w 156(a1),618(a0)
    175c:	3169 009e 026e 	move.w 158(a1),622(a0)
    1762:	3169 00a0 0272 	move.w 160(a1),626(a0)
    *copperlist = *values4shift++;
    1768:	3169 00a2 0282 	move.w 162(a1),642(a0)
    176e:	3169 00a4 0286 	move.w 164(a1),646(a0)
    1774:	3169 00a6 028a 	move.w 166(a1),650(a0)
    177a:	3169 00a8 028e 	move.w 168(a1),654(a0)
    1780:	3169 00aa 0292 	move.w 170(a1),658(a0)
    1786:	3169 00ac 0296 	move.w 172(a1),662(a0)
  *copperlist++ = *values4shift++;
    178c:	3169 00ae 0298 	move.w 174(a1),664(a0)
  *copperlist = *values4shift++;
    1792:	3169 00b0 029a 	move.w 176(a1),666(a0)
    *copperlist = *values4shift++;
    1798:	3169 00b2 029e 	move.w 178(a1),670(a0)
    179e:	3169 00b4 02a2 	move.w 180(a1),674(a0)
    17a4:	3169 00b6 02a6 	move.w 182(a1),678(a0)
    17aa:	3169 00b8 02aa 	move.w 184(a1),682(a0)
    17b0:	3169 00ba 02ae 	move.w 186(a1),686(a0)
    17b6:	3169 00bc 02b2 	move.w 188(a1),690(a0)
    17bc:	3169 00be 02b6 	move.w 190(a1),694(a0)
    17c2:	3169 00c0 02ba 	move.w 192(a1),698(a0)
    17c8:	3169 00c2 02be 	move.w 194(a1),702(a0)
    17ce:	3169 00c4 02c2 	move.w 196(a1),706(a0)
  *copperlist++ = *values4shift++;
    17d4:	3169 00c6 02c4 	move.w 198(a1),708(a0)
  *copperlist = *values4shift++;
    17da:	3169 00c8 02c6 	move.w 200(a1),710(a0)
    *copperlist = *values4shift++;
    17e0:	3169 00ca 02ca 	move.w 202(a1),714(a0)
    17e6:	3169 00cc 02ce 	move.w 204(a1),718(a0)
    17ec:	3169 00ce 02d2 	move.w 206(a1),722(a0)
    17f2:	3169 00d0 02d6 	move.w 208(a1),726(a0)
    17f8:	3169 00d2 02da 	move.w 210(a1),730(a0)
    17fe:	3169 00d4 02de 	move.w 212(a1),734(a0)
    1804:	3169 00d6 02e2 	move.w 214(a1),738(a0)
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    180a:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    1810:	e248           	lsr.w #1,d0
    1812:	0280 0000 ffff 	andi.l #65535,d0
    1818:	7208           	moveq #8,d1
    181a:	9280           	sub.l d0,d1
    181c:	2001           	move.l d1,d0
    181e:	e989           	lsl.l #4,d1
    1820:	9280           	sub.l d0,d1
    1822:	2001           	move.l d1,d0
    1824:	e988           	lsl.l #4,d0
    1826:	43f2 0804      	lea (4,a2,d0.l),a1
  *bp = 0;
    182a:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD highword = (ULONG)plane2set >> 16;
    182e:	2009           	move.l a1,d0
    1830:	4240           	clr.w d0
    1832:	4840           	swap d0
    1834:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1838:	3149 0076      	move.w a1,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    183c:	7030           	moveq #48,d0
    183e:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1840:	2200           	move.l d0,d1
    1842:	4241           	clr.w d1
    1844:	4841           	swap d1
    1846:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    184a:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    184e:	7060           	moveq #96,d0
    1850:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1852:	2200           	move.l d0,d1
    1854:	4241           	clr.w d1
    1856:	4841           	swap d1
    1858:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    185c:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1860:	2009           	move.l a1,d0
    1862:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1868:	2200           	move.l d0,d1
    186a:	4241           	clr.w d1
    186c:	4841           	swap d1
    186e:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1872:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1876:	43e9 00c0      	lea 192(a1),a1
    UWORD highword = (ULONG)plane2set >> 16;
    187a:	2009           	move.l a1,d0
    187c:	4240           	clr.w d0
    187e:	4840           	swap d0
    1880:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1884:	3149 0096      	move.w a1,150(a0)
}
    1888:	245f           	movea.l (sp)+,a2
    188a:	4e75           	rts
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    188c:	0c79 0001 0001 	cmpi.w #1,1777e <Zoom_Mousepressed>
    1892:	777e 
    1894:	6700 fc68      	beq.w 14fe <Zoom_VblankHandler+0x4c>
      Zoom_MouseReleased = 0;
    1898:	4279 0001 7780 	clr.w 17780 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
    189e:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    18a4:	2479 0001 77a6 	movea.l 177a6 <ViewBuffer>,a2
    18aa:	6700 fc76      	beq.w 1522 <Zoom_VblankHandler+0x70>
        Zoom_LevelOf102Zoom--;
    18ae:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    18b4:	5340           	subq.w #1,d0
    18b6:	33c0 0001 77a0 	move.w d0,177a0 <Zoom_LevelOf102Zoom>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    18bc:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
  UWORD *values4shift = Values4Shift+levelofshrink*108;
    18c2:	c0fc 00d8      	mulu.w #216,d0
    18c6:	2240           	movea.l d0,a1
    18c8:	d3fc 0001 6000 	adda.l #90112,a1
    *copperlist = *values4shift++;
    18ce:	3151 012a      	move.w (a1),298(a0)
    18d2:	3169 0002 012e 	move.w 2(a1),302(a0)
    18d8:	3169 0004 0132 	move.w 4(a1),306(a0)
    18de:	3169 0006 0136 	move.w 6(a1),310(a0)
    18e4:	3169 0008 013a 	move.w 8(a1),314(a0)
    18ea:	3169 000a 013e 	move.w 10(a1),318(a0)
  *copperlist++ = *values4shift++;
    18f0:	3169 000c 0140 	move.w 12(a1),320(a0)
  *copperlist = *values4shift++;
    18f6:	3169 000e 0142 	move.w 14(a1),322(a0)
    *copperlist = *values4shift++;
    18fc:	3169 0010 0146 	move.w 16(a1),326(a0)
    1902:	3169 0012 014a 	move.w 18(a1),330(a0)
    1908:	3169 0014 014e 	move.w 20(a1),334(a0)
    190e:	3169 0016 0152 	move.w 22(a1),338(a0)
    1914:	3169 0018 0156 	move.w 24(a1),342(a0)
    191a:	3169 001a 015a 	move.w 26(a1),346(a0)
    1920:	3169 001c 015e 	move.w 28(a1),350(a0)
    1926:	3169 001e 0162 	move.w 30(a1),354(a0)
    192c:	3169 0020 0166 	move.w 32(a1),358(a0)
    1932:	3169 0022 016a 	move.w 34(a1),362(a0)
  *copperlist++ = *values4shift++;
    1938:	3169 0024 016c 	move.w 36(a1),364(a0)
  *copperlist = *values4shift++;
    193e:	3169 0026 016e 	move.w 38(a1),366(a0)
    *copperlist = *values4shift++;
    1944:	3169 0028 0172 	move.w 40(a1),370(a0)
    194a:	3169 002a 0176 	move.w 42(a1),374(a0)
    1950:	3169 002c 017a 	move.w 44(a1),378(a0)
    1956:	3169 002e 017e 	move.w 46(a1),382(a0)
    195c:	3169 0030 0182 	move.w 48(a1),386(a0)
    1962:	3169 0032 0186 	move.w 50(a1),390(a0)
    1968:	3169 0034 018a 	move.w 52(a1),394(a0)
    *copperlist = *values4shift++;
    196e:	3169 0036 01a2 	move.w 54(a1),418(a0)
    1974:	3169 0038 01a6 	move.w 56(a1),422(a0)
    197a:	3169 003a 01aa 	move.w 58(a1),426(a0)
    1980:	3169 003c 01ae 	move.w 60(a1),430(a0)
    1986:	3169 003e 01b2 	move.w 62(a1),434(a0)
    198c:	3169 0040 01b6 	move.w 64(a1),438(a0)
  *copperlist++ = *values4shift++;
    1992:	3169 0042 01b8 	move.w 66(a1),440(a0)
  *copperlist = *values4shift++;
    1998:	3169 0044 01ba 	move.w 68(a1),442(a0)
    *copperlist = *values4shift++;
    199e:	3169 0046 01be 	move.w 70(a1),446(a0)
    19a4:	3169 0048 01c2 	move.w 72(a1),450(a0)
    19aa:	3169 004a 01c6 	move.w 74(a1),454(a0)
    19b0:	3169 004c 01ca 	move.w 76(a1),458(a0)
    19b6:	3169 004e 01ce 	move.w 78(a1),462(a0)
    19bc:	3169 0050 01d2 	move.w 80(a1),466(a0)
    19c2:	3169 0052 01d6 	move.w 82(a1),470(a0)
    19c8:	3169 0054 01da 	move.w 84(a1),474(a0)
    19ce:	3169 0056 01de 	move.w 86(a1),478(a0)
    19d4:	3169 0058 01e2 	move.w 88(a1),482(a0)
  *copperlist++ = *values4shift++;
    19da:	3169 005a 01e4 	move.w 90(a1),484(a0)
  *copperlist = *values4shift++;
    19e0:	3169 005c 01e6 	move.w 92(a1),486(a0)
    *copperlist = *values4shift++;
    19e6:	3169 005e 01ea 	move.w 94(a1),490(a0)
    19ec:	3169 0060 01ee 	move.w 96(a1),494(a0)
    19f2:	3169 0062 01f2 	move.w 98(a1),498(a0)
    19f8:	3169 0064 01f6 	move.w 100(a1),502(a0)
    19fe:	3169 0066 01fa 	move.w 102(a1),506(a0)
    1a04:	3169 0068 01fe 	move.w 104(a1),510(a0)
    1a0a:	3169 006a 0202 	move.w 106(a1),514(a0)
    *copperlist = *values4shift++;
    1a10:	3169 006c 0212 	move.w 108(a1),530(a0)
    1a16:	3169 006e 0216 	move.w 110(a1),534(a0)
    1a1c:	3169 0070 021a 	move.w 112(a1),538(a0)
    1a22:	3169 0072 021e 	move.w 114(a1),542(a0)
    1a28:	3169 0074 0222 	move.w 116(a1),546(a0)
    1a2e:	3169 0076 0226 	move.w 118(a1),550(a0)
  *copperlist++ = *values4shift++;
    1a34:	3169 0078 0228 	move.w 120(a1),552(a0)
  *copperlist = *values4shift++;
    1a3a:	3169 007a 022a 	move.w 122(a1),554(a0)
    *copperlist = *values4shift++;
    1a40:	3169 007c 022e 	move.w 124(a1),558(a0)
    1a46:	3169 007e 0232 	move.w 126(a1),562(a0)
    1a4c:	3169 0080 0236 	move.w 128(a1),566(a0)
    1a52:	3169 0082 023a 	move.w 130(a1),570(a0)
    1a58:	3169 0084 023e 	move.w 132(a1),574(a0)
    1a5e:	3169 0086 0242 	move.w 134(a1),578(a0)
    1a64:	3169 0088 0246 	move.w 136(a1),582(a0)
    1a6a:	3169 008a 024a 	move.w 138(a1),586(a0)
    1a70:	3169 008c 024e 	move.w 140(a1),590(a0)
    1a76:	3169 008e 0252 	move.w 142(a1),594(a0)
  *copperlist++ = *values4shift++;
    1a7c:	3169 0090 0254 	move.w 144(a1),596(a0)
  *copperlist = *values4shift++;
    1a82:	3169 0092 0256 	move.w 146(a1),598(a0)
    *copperlist = *values4shift++;
    1a88:	3169 0094 025a 	move.w 148(a1),602(a0)
    1a8e:	3169 0096 025e 	move.w 150(a1),606(a0)
    1a94:	3169 0098 0262 	move.w 152(a1),610(a0)
    1a9a:	3169 009a 0266 	move.w 154(a1),614(a0)
    1aa0:	3169 009c 026a 	move.w 156(a1),618(a0)
    1aa6:	3169 009e 026e 	move.w 158(a1),622(a0)
    1aac:	3169 00a0 0272 	move.w 160(a1),626(a0)
    *copperlist = *values4shift++;
    1ab2:	3169 00a2 0282 	move.w 162(a1),642(a0)
    1ab8:	3169 00a4 0286 	move.w 164(a1),646(a0)
    1abe:	3169 00a6 028a 	move.w 166(a1),650(a0)
    1ac4:	3169 00a8 028e 	move.w 168(a1),654(a0)
    1aca:	3169 00aa 0292 	move.w 170(a1),658(a0)
    1ad0:	3169 00ac 0296 	move.w 172(a1),662(a0)
  *copperlist++ = *values4shift++;
    1ad6:	3169 00ae 0298 	move.w 174(a1),664(a0)
  *copperlist = *values4shift++;
    1adc:	3169 00b0 029a 	move.w 176(a1),666(a0)
    *copperlist = *values4shift++;
    1ae2:	3169 00b2 029e 	move.w 178(a1),670(a0)
    1ae8:	3169 00b4 02a2 	move.w 180(a1),674(a0)
    1aee:	3169 00b6 02a6 	move.w 182(a1),678(a0)
    1af4:	3169 00b8 02aa 	move.w 184(a1),682(a0)
    1afa:	3169 00ba 02ae 	move.w 186(a1),686(a0)
    1b00:	3169 00bc 02b2 	move.w 188(a1),690(a0)
    1b06:	3169 00be 02b6 	move.w 190(a1),694(a0)
    1b0c:	3169 00c0 02ba 	move.w 192(a1),698(a0)
    1b12:	3169 00c2 02be 	move.w 194(a1),702(a0)
    1b18:	3169 00c4 02c2 	move.w 196(a1),706(a0)
  *copperlist++ = *values4shift++;
    1b1e:	3169 00c6 02c4 	move.w 198(a1),708(a0)
  *copperlist = *values4shift++;
    1b24:	3169 00c8 02c6 	move.w 200(a1),710(a0)
    *copperlist = *values4shift++;
    1b2a:	3169 00ca 02ca 	move.w 202(a1),714(a0)
    1b30:	3169 00cc 02ce 	move.w 204(a1),718(a0)
    1b36:	3169 00ce 02d2 	move.w 206(a1),722(a0)
    1b3c:	3169 00d0 02d6 	move.w 208(a1),726(a0)
    1b42:	3169 00d2 02da 	move.w 210(a1),730(a0)
    1b48:	3169 00d4 02de 	move.w 212(a1),734(a0)
    1b4e:	3169 00d6 02e2 	move.w 214(a1),738(a0)
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    1b54:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    1b5a:	e248           	lsr.w #1,d0
    1b5c:	0280 0000 ffff 	andi.l #65535,d0
    1b62:	7208           	moveq #8,d1
    1b64:	9280           	sub.l d0,d1
    1b66:	2001           	move.l d1,d0
    1b68:	e989           	lsl.l #4,d1
    1b6a:	9280           	sub.l d0,d1
    1b6c:	2001           	move.l d1,d0
    1b6e:	e988           	lsl.l #4,d0
    1b70:	43f2 0804      	lea (4,a2,d0.l),a1
  *bp = 0;
    1b74:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD highword = (ULONG)plane2set >> 16;
    1b78:	2009           	move.l a1,d0
    1b7a:	4240           	clr.w d0
    1b7c:	4840           	swap d0
    1b7e:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1b82:	3149 0076      	move.w a1,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1b86:	7030           	moveq #48,d0
    1b88:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1b8a:	2200           	move.l d0,d1
    1b8c:	4241           	clr.w d1
    1b8e:	4841           	swap d1
    1b90:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1b94:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1b98:	7060           	moveq #96,d0
    1b9a:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1b9c:	2200           	move.l d0,d1
    1b9e:	4241           	clr.w d1
    1ba0:	4841           	swap d1
    1ba2:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1ba6:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1baa:	2009           	move.l a1,d0
    1bac:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1bb2:	2200           	move.l d0,d1
    1bb4:	4241           	clr.w d1
    1bb6:	4841           	swap d1
    1bb8:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1bbc:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1bc0:	43e9 00c0      	lea 192(a1),a1
    UWORD highword = (ULONG)plane2set >> 16;
    1bc4:	2009           	move.l a1,d0
    1bc6:	4240           	clr.w d0
    1bc8:	4840           	swap d0
    1bca:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1bce:	3149 0096      	move.w a1,150(a0)
}
    1bd2:	245f           	movea.l (sp)+,a2
    1bd4:	4e75           	rts
    Zoom_Mousepressed = 0;
    1bd6:	4279 0001 777e 	clr.w 1777e <Zoom_Mousepressed>
    1bdc:	6000 f92e      	bra.w 150c <Zoom_VblankHandler+0x5a>
          Zoom_LevelOfZoom = 0;
    1be0:	33fc 0000 0001 	move.w #0,17786 <Zoom_LevelOfZoom>
    1be6:	7786 
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
    1be8:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1bee:	0280 0000 ffff 	andi.l #65535,d0
    1bf4:	d080           	add.l d0,d0
    1bf6:	43f9 0001 5e0a 	lea 15e0a <MaxZoom102>,a1
    1bfc:	3031 0800      	move.w (0,a1,d0.l),d0
    1c00:	5540           	subq.w #2,d0
    1c02:	33c0 0001 77a0 	move.w d0,177a0 <Zoom_LevelOf102Zoom>
  ULONG tmp = (ULONG) DrawBuffer;
    1c08:	2039 0001 77b0 	move.l 177b0 <DrawBuffer>,d0
  DrawBuffer = ViewBuffer;
    1c0e:	23ca 0001 77b0 	move.l a2,177b0 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1c14:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
    1c1a:	2440           	movea.l d0,a2
    1c1c:	6000 f954      	bra.w 1572 <Zoom_VblankHandler+0xc0>

00001c20 <Zoom_Shrink102>:
void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
    1c20:	226f 0008      	movea.l 8(sp),a1
  UWORD *values4shift = Values4Shift+levelofshrink*108;
    1c24:	302f 0006      	move.w 6(sp),d0
    1c28:	c0fc 00d8      	mulu.w #216,d0
    1c2c:	2040           	movea.l d0,a0
    1c2e:	d1fc 0001 6000 	adda.l #90112,a0
    *copperlist = *values4shift++;
    1c34:	3350 012a      	move.w (a0),298(a1)
    1c38:	3368 0002 012e 	move.w 2(a0),302(a1)
    1c3e:	3368 0004 0132 	move.w 4(a0),306(a1)
    1c44:	3368 0006 0136 	move.w 6(a0),310(a1)
    1c4a:	3368 0008 013a 	move.w 8(a0),314(a1)
    1c50:	3368 000a 013e 	move.w 10(a0),318(a1)
  *copperlist++ = *values4shift++;
    1c56:	3368 000c 0140 	move.w 12(a0),320(a1)
  *copperlist = *values4shift++;
    1c5c:	3368 000e 0142 	move.w 14(a0),322(a1)
    *copperlist = *values4shift++;
    1c62:	3368 0010 0146 	move.w 16(a0),326(a1)
    1c68:	3368 0012 014a 	move.w 18(a0),330(a1)
    1c6e:	3368 0014 014e 	move.w 20(a0),334(a1)
    1c74:	3368 0016 0152 	move.w 22(a0),338(a1)
    1c7a:	3368 0018 0156 	move.w 24(a0),342(a1)
    1c80:	3368 001a 015a 	move.w 26(a0),346(a1)
    1c86:	3368 001c 015e 	move.w 28(a0),350(a1)
    1c8c:	3368 001e 0162 	move.w 30(a0),354(a1)
    1c92:	3368 0020 0166 	move.w 32(a0),358(a1)
    1c98:	3368 0022 016a 	move.w 34(a0),362(a1)
  *copperlist++ = *values4shift++;
    1c9e:	3368 0024 016c 	move.w 36(a0),364(a1)
  *copperlist = *values4shift++;
    1ca4:	3368 0026 016e 	move.w 38(a0),366(a1)
    *copperlist = *values4shift++;
    1caa:	3368 0028 0172 	move.w 40(a0),370(a1)
    1cb0:	3368 002a 0176 	move.w 42(a0),374(a1)
    1cb6:	3368 002c 017a 	move.w 44(a0),378(a1)
    1cbc:	3368 002e 017e 	move.w 46(a0),382(a1)
    1cc2:	3368 0030 0182 	move.w 48(a0),386(a1)
    1cc8:	3368 0032 0186 	move.w 50(a0),390(a1)
    1cce:	3368 0034 018a 	move.w 52(a0),394(a1)
    *copperlist = *values4shift++;
    1cd4:	3368 0036 01a2 	move.w 54(a0),418(a1)
    1cda:	3368 0038 01a6 	move.w 56(a0),422(a1)
    1ce0:	3368 003a 01aa 	move.w 58(a0),426(a1)
    1ce6:	3368 003c 01ae 	move.w 60(a0),430(a1)
    1cec:	3368 003e 01b2 	move.w 62(a0),434(a1)
    1cf2:	3368 0040 01b6 	move.w 64(a0),438(a1)
  *copperlist++ = *values4shift++;
    1cf8:	3368 0042 01b8 	move.w 66(a0),440(a1)
  *copperlist = *values4shift++;
    1cfe:	3368 0044 01ba 	move.w 68(a0),442(a1)
    *copperlist = *values4shift++;
    1d04:	3368 0046 01be 	move.w 70(a0),446(a1)
    1d0a:	3368 0048 01c2 	move.w 72(a0),450(a1)
    1d10:	3368 004a 01c6 	move.w 74(a0),454(a1)
    1d16:	3368 004c 01ca 	move.w 76(a0),458(a1)
    1d1c:	3368 004e 01ce 	move.w 78(a0),462(a1)
    1d22:	3368 0050 01d2 	move.w 80(a0),466(a1)
    1d28:	3368 0052 01d6 	move.w 82(a0),470(a1)
    1d2e:	3368 0054 01da 	move.w 84(a0),474(a1)
    1d34:	3368 0056 01de 	move.w 86(a0),478(a1)
    1d3a:	3368 0058 01e2 	move.w 88(a0),482(a1)
  *copperlist++ = *values4shift++;
    1d40:	3368 005a 01e4 	move.w 90(a0),484(a1)
  *copperlist = *values4shift++;
    1d46:	3368 005c 01e6 	move.w 92(a0),486(a1)
    *copperlist = *values4shift++;
    1d4c:	3368 005e 01ea 	move.w 94(a0),490(a1)
    1d52:	3368 0060 01ee 	move.w 96(a0),494(a1)
    1d58:	3368 0062 01f2 	move.w 98(a0),498(a1)
    1d5e:	3368 0064 01f6 	move.w 100(a0),502(a1)
    1d64:	3368 0066 01fa 	move.w 102(a0),506(a1)
    1d6a:	3368 0068 01fe 	move.w 104(a0),510(a1)
    1d70:	3368 006a 0202 	move.w 106(a0),514(a1)
    *copperlist = *values4shift++;
    1d76:	3368 006c 0212 	move.w 108(a0),530(a1)
    1d7c:	3368 006e 0216 	move.w 110(a0),534(a1)
    1d82:	3368 0070 021a 	move.w 112(a0),538(a1)
    1d88:	3368 0072 021e 	move.w 114(a0),542(a1)
    1d8e:	3368 0074 0222 	move.w 116(a0),546(a1)
    1d94:	3368 0076 0226 	move.w 118(a0),550(a1)
  *copperlist++ = *values4shift++;
    1d9a:	3368 0078 0228 	move.w 120(a0),552(a1)
  *copperlist = *values4shift++;
    1da0:	3368 007a 022a 	move.w 122(a0),554(a1)
    *copperlist = *values4shift++;
    1da6:	3368 007c 022e 	move.w 124(a0),558(a1)
    1dac:	3368 007e 0232 	move.w 126(a0),562(a1)
    1db2:	3368 0080 0236 	move.w 128(a0),566(a1)
    1db8:	3368 0082 023a 	move.w 130(a0),570(a1)
    1dbe:	3368 0084 023e 	move.w 132(a0),574(a1)
    1dc4:	3368 0086 0242 	move.w 134(a0),578(a1)
    1dca:	3368 0088 0246 	move.w 136(a0),582(a1)
    1dd0:	3368 008a 024a 	move.w 138(a0),586(a1)
    1dd6:	3368 008c 024e 	move.w 140(a0),590(a1)
    1ddc:	3368 008e 0252 	move.w 142(a0),594(a1)
  *copperlist++ = *values4shift++;
    1de2:	3368 0090 0254 	move.w 144(a0),596(a1)
  *copperlist = *values4shift++;
    1de8:	3368 0092 0256 	move.w 146(a0),598(a1)
    *copperlist = *values4shift++;
    1dee:	3368 0094 025a 	move.w 148(a0),602(a1)
    1df4:	3368 0096 025e 	move.w 150(a0),606(a1)
    1dfa:	3368 0098 0262 	move.w 152(a0),610(a1)
    1e00:	3368 009a 0266 	move.w 154(a0),614(a1)
    1e06:	3368 009c 026a 	move.w 156(a0),618(a1)
    1e0c:	3368 009e 026e 	move.w 158(a0),622(a1)
    1e12:	3368 00a0 0272 	move.w 160(a0),626(a1)
    *copperlist = *values4shift++;
    1e18:	3368 00a2 0282 	move.w 162(a0),642(a1)
    1e1e:	3368 00a4 0286 	move.w 164(a0),646(a1)
    1e24:	3368 00a6 028a 	move.w 166(a0),650(a1)
    1e2a:	3368 00a8 028e 	move.w 168(a0),654(a1)
    1e30:	3368 00aa 0292 	move.w 170(a0),658(a1)
    1e36:	3368 00ac 0296 	move.w 172(a0),662(a1)
  *copperlist++ = *values4shift++;
    1e3c:	3368 00ae 0298 	move.w 174(a0),664(a1)
  *copperlist = *values4shift++;
    1e42:	3368 00b0 029a 	move.w 176(a0),666(a1)
    *copperlist = *values4shift++;
    1e48:	3368 00b2 029e 	move.w 178(a0),670(a1)
    1e4e:	3368 00b4 02a2 	move.w 180(a0),674(a1)
    1e54:	3368 00b6 02a6 	move.w 182(a0),678(a1)
    1e5a:	3368 00b8 02aa 	move.w 184(a0),682(a1)
    1e60:	3368 00ba 02ae 	move.w 186(a0),686(a1)
    1e66:	3368 00bc 02b2 	move.w 188(a0),690(a1)
    1e6c:	3368 00be 02b6 	move.w 190(a0),694(a1)
    1e72:	3368 00c0 02ba 	move.w 192(a0),698(a1)
    1e78:	3368 00c2 02be 	move.w 194(a0),702(a1)
    1e7e:	3368 00c4 02c2 	move.w 196(a0),706(a1)
  *copperlist++ = *values4shift++;
    1e84:	3368 00c6 02c4 	move.w 198(a0),708(a1)
  *copperlist = *values4shift++;
    1e8a:	3368 00c8 02c6 	move.w 200(a0),710(a1)
    *copperlist = *values4shift++;
    1e90:	3368 00ca 02ca 	move.w 202(a0),714(a1)
    1e96:	3368 00cc 02ce 	move.w 204(a0),718(a1)
    1e9c:	3368 00ce 02d2 	move.w 206(a0),722(a1)
    1ea2:	3368 00d0 02d6 	move.w 208(a0),726(a1)
    1ea8:	3368 00d2 02da 	move.w 210(a0),730(a1)
    1eae:	3368 00d4 02de 	move.w 212(a0),734(a1)
    1eb4:	3368 00d6 02e2 	move.w 214(a0),738(a1)
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
    1eba:	4e75           	rts

00001ebc <RunFrame>:
  SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
	hw->intreq=1<<INTB_VERTB;//reset vbl req
}

void RunFrame() {
    1ebc:	2f0e           	move.l a6,-(sp)
    1ebe:	2f02           	move.l d2,-(sp)
  Zoom_Blit4ZoomFinished = 0;
  UWORD tmp = Zoom_LevelOfZoom;
    1ec0:	3439 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d2
  if(Zoom_LevelOfZoom == 0)
    1ec6:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1ecc:	2279 0001 77b0 	movea.l 177b0 <DrawBuffer>,a1
    1ed2:	6626           	bne.s 1efa <RunFrame+0x3e>
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
    1ed4:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1eda:	2079 0001 7794 	movea.l 17794 <Zoom_StartImage>,a0
    1ee0:	203c 0000 ff00 	move.l #65280,d0
    1ee6:	4eae fd8a      	jsr -630(a6)
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  while( tmp == Zoom_LevelOfZoom) { }
    1eea:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1ef0:	b440           	cmp.w d0,d2
    1ef2:	67f6           	beq.s 1eea <RunFrame+0x2e>
    1ef4:	241f           	move.l (sp)+,d2
    1ef6:	2c5f           	movea.l (sp)+,a6
    1ef8:	4e75           	rts
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
    1efa:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1f00:	4878 0005      	pea 5 <_start+0x5>
    1f04:	3f00           	move.w d0,-(sp)
    1f06:	4267           	clr.w -(sp)
    1f08:	2f09           	move.l a1,-(sp)
    1f0a:	2f39 0001 77a6 	move.l 177a6 <ViewBuffer>,-(sp)
    1f10:	4eba ebee      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
    1f14:	4fef 0010      	lea 16(sp),sp
  while( tmp == Zoom_LevelOfZoom) { }
    1f18:	3039 0001 7786 	move.w 17786 <Zoom_LevelOfZoom>,d0
    1f1e:	b440           	cmp.w d0,d2
    1f20:	67c8           	beq.s 1eea <RunFrame+0x2e>
    1f22:	60d0           	bra.s 1ef4 <RunFrame+0x38>

00001f24 <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1f24:	2039 0001 77b0 	move.l 177b0 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1f2a:	2079 0001 77a2 	movea.l 177a2 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1f30:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    1f34:	2200           	move.l d0,d1
    1f36:	4241           	clr.w d1
    1f38:	4841           	swap d1
    1f3a:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1f3e:	23f9 0001 77a6 	move.l 177a6 <ViewBuffer>,177b0 <DrawBuffer>
    1f44:	0001 77b0 
  ViewBuffer = (ULONG *) tmp;
    1f48:	23c0 0001 77a6 	move.l d0,177a6 <ViewBuffer>
}
    1f4e:	4e75           	rts

00001f50 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    1f50:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    1f54:	262f 0010      	move.l 16(sp),d3
    1f58:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1f5c:	2279 0001 77aa 	movea.l 177aa <Copperlist1>,a1
    1f62:	b2fc 0000      	cmpa.w #0,a1
    1f66:	670c           	beq.s 1f74 <FreeDisplay+0x24>
    1f68:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1f6e:	2003           	move.l d3,d0
    1f70:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    1f74:	2279 0001 7788 	movea.l 17788 <Copperlist2>,a1
    1f7a:	b2fc 0000      	cmpa.w #0,a1
    1f7e:	670c           	beq.s 1f8c <FreeDisplay+0x3c>
    1f80:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1f86:	2003           	move.l d3,d0
    1f88:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    1f8c:	2279 0001 7790 	movea.l 17790 <Bitplane1>,a1
    1f92:	b2fc 0000      	cmpa.w #0,a1
    1f96:	670c           	beq.s 1fa4 <FreeDisplay+0x54>
    1f98:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1f9e:	2002           	move.l d2,d0
    1fa0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    1fa4:	2279 0001 778c 	movea.l 1778c <Bitplane2>,a1
    1faa:	b2fc 0000      	cmpa.w #0,a1
    1fae:	670c           	beq.s 1fbc <FreeDisplay+0x6c>
    1fb0:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    1fb6:	2002           	move.l d2,d0
    1fb8:	4eae ff2e      	jsr -210(a6)
}
    1fbc:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1fc0:	4e75           	rts

00001fc2 <WaitVbl>:
void WaitVbl() {
    1fc2:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1fc4:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd6d84>,d0
    1fca:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1fcc:	2017           	move.l (sp),d0
    1fce:	0280 0001 ff00 	andi.l #130816,d0
    1fd4:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1fd6:	2017           	move.l (sp),d0
    1fd8:	0c80 0001 3700 	cmpi.l #79616,d0
    1fde:	67e4           	beq.s 1fc4 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1fe0:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd6d84>,d0
    1fe6:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1fea:	202f 0004      	move.l 4(sp),d0
    1fee:	0280 0001 ff00 	andi.l #130816,d0
    1ff4:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1ff8:	202f 0004      	move.l 4(sp),d0
    1ffc:	0c80 0001 3700 	cmpi.l #79616,d0
    2002:	66dc           	bne.s 1fe0 <WaitVbl+0x1e>
}
    2004:	508f           	addq.l #8,sp
    2006:	4e75           	rts

00002008 <FreeSystem>:
void FreeSystem() { 
    2008:	2f0e           	move.l a6,-(sp)
	WaitVbl();
    200a:	4eba ffb6      	jsr 1fc2 <WaitVbl>(pc)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    200e:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    2014:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    2018:	3028 0002      	move.w 2(a0),d0
    201c:	0800 000e      	btst #14,d0
    2020:	66f6           	bne.s 2018 <FreeSystem+0x10>
	hw->intena=0x7fff;//disable all interrupts
    2022:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2028:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    202e:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    2034:	2279 0001 7776 	movea.l 17776 <VBR.lto_priv.5>,a1
    203a:	2379 0001 777a 	move.l 1777a <SystemIrq>,108(a1)
    2040:	006c 
	hw->cop1lc=(ULONG)GfxBase->copinit;
    2042:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2048:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    204e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    2054:	317c 7fff 0088 	move.w #32767,136(a0)
	hw->intena=SystemInts|0x8000;
    205a:	3039 0001 7774 	move.w 17774 <SystemInts>,d0
    2060:	0040 8000      	ori.w #-32768,d0
    2064:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    2068:	3039 0001 7772 	move.w 17772 <SystemDMA>,d0
    206e:	0040 8000      	ori.w #-32768,d0
    2072:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    2076:	3039 0001 7770 	move.w 17770 <SystemADKCON>,d0
    207c:	0040 8000      	ori.w #-32768,d0
    2080:	3140 009e      	move.w d0,158(a0)
	LoadView(ActiView);
    2084:	2279 0001 776c 	movea.l 1776c <ActiView>,a1
    208a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    208e:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2094:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2098:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    209e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    20a2:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    20a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    20ac:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    20b2:	4eae fe32      	jsr -462(a6)
  Permit();
    20b6:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    20bc:	4eae ff76      	jsr -138(a6)
}
    20c0:	2c5f           	movea.l (sp)+,a6
    20c2:	4e75           	rts

000020c4 <TakeSystem>:
void TakeSystem() {
    20c4:	518f           	subq.l #8,sp
    20c6:	48e7 0132      	movem.l d7/a2-a3/a6,-(sp)
	ActiView=GfxBase->ActiView; //store current view
    20ca:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    20d0:	23ee 0022 0001 	move.l 34(a6),1776c <ActiView>
    20d6:	776c 
	OwnBlitter();
    20d8:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    20dc:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    20e2:	4eae ff1c      	jsr -228(a6)
  Forbid();
    20e6:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    20ec:	4eae ff7c      	jsr -132(a6)
	SystemADKCON=hw->adkconr;
    20f0:	2479 0001 77b8 	movea.l 177b8 <hw>,a2
    20f6:	302a 0010      	move.w 16(a2),d0
    20fa:	33c0 0001 7770 	move.w d0,17770 <SystemADKCON>
	SystemInts=hw->intenar;
    2100:	302a 001c      	move.w 28(a2),d0
    2104:	33c0 0001 7774 	move.w d0,17774 <SystemInts>
	SystemDMA=hw->dmaconr;
    210a:	302a 0002      	move.w 2(a2),d0
    210e:	33c0 0001 7772 	move.w d0,17772 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    2114:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    211a:	357c 7fff 009c 	move.w #32767,156(a2)
	WaitVbl();
    2120:	47fa fea0      	lea 1fc2 <WaitVbl>(pc),a3
    2124:	4e93           	jsr (a3)
	WaitVbl();
    2126:	4e93           	jsr (a3)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2128:	357c 7fff 0096 	move.w #32767,150(a2)
	LoadView(0);
    212e:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2134:	93c9           	suba.l a1,a1
    2136:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    213a:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2140:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2144:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    214a:	4eae fef2      	jsr -270(a6)
	WaitVbl();
    214e:	4e93           	jsr (a3)
	WaitVbl();
    2150:	4e93           	jsr (a3)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    2152:	3f7c 4e7a 0012 	move.w #20090,18(sp)
    2158:	3f7c 0801 0014 	move.w #2049,20(sp)
    215e:	3f7c 4e73 0016 	move.w #20083,22(sp)
	if (SysBase->AttnFlags & AFF_68010) 
    2164:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    216a:	082e 0000 0129 	btst #0,297(a6)
    2170:	672a           	beq.s 219c <TakeSystem+0xd8>
		vbr = (APTR)Supervisor((void*)getvbr);
    2172:	7e12           	moveq #18,d7
    2174:	de8f           	add.l sp,d7
    2176:	cf8d           	exg d7,a5
    2178:	4eae ffe2      	jsr -30(a6)
    217c:	cf8d           	exg d7,a5
	VBR=GetVBR();
    217e:	23c0 0001 7776 	move.l d0,17776 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2184:	2079 0001 7776 	movea.l 17776 <VBR.lto_priv.5>,a0
    218a:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
    218e:	23c0 0001 777a 	move.l d0,1777a <SystemIrq>
}
    2194:	4cdf 4c80      	movem.l (sp)+,d7/a2-a3/a6
    2198:	508f           	addq.l #8,sp
    219a:	4e75           	rts
	APTR vbr = 0;
    219c:	7000           	moveq #0,d0
	VBR=GetVBR();
    219e:	23c0 0001 7776 	move.l d0,17776 <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    21a4:	2079 0001 7776 	movea.l 17776 <VBR.lto_priv.5>,a0
    21aa:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
    21ae:	23c0 0001 777a 	move.l d0,1777a <SystemIrq>
}
    21b4:	4cdf 4c80      	movem.l (sp)+,d7/a2-a3/a6
    21b8:	508f           	addq.l #8,sp
    21ba:	4e75           	rts

000021bc <ZoomTest>:
void ZoomTest() {
    21bc:	4fef ff50      	lea -176(sp),sp
    21c0:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
 	TakeSystem();
    21c4:	4eba fefe      	jsr 20c4 <TakeSystem>(pc)
	WaitVbl();
    21c8:	4eba fdf8      	jsr 1fc2 <WaitVbl>(pc)
  hw->dmacon = 0b1000011111100000;
    21cc:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    21d2:	317c 87e0 0096 	move.w #-30752,150(a0)
  Zoom_Counter = 0;
    21d8:	4279 0001 779e 	clr.w 1779e <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    21de:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    21e4:	7004           	moveq #4,d0
    21e6:	7202           	moveq #2,d1
    21e8:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 15;
    21ec:	33fc 000f 0001 	move.w #15,177a0 <Zoom_LevelOf102Zoom>
    21f2:	77a0 
  ZoomHorizontal = 16;
    21f4:	33fc 0010 0001 	move.w #16,17798 <ZoomHorizontal>
    21fa:	7798 
  Zoom_PrepareDisplay();
    21fc:	4eba f14c      	jsr 134a <PrepareDisplayZoom>(pc)
  Zoom_StartImage = startimage;
    2200:	23fc 0000 5798 	move.l #22424,17794 <Zoom_StartImage>
    2206:	0001 7794 
  CopyMem( startimage, destination, ZMBPLSIZE);
    220a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2210:	41f9 0000 5798 	lea 5798 <incbin_startimage_start>,a0
    2216:	2279 0001 7790 	movea.l 17790 <Bitplane1>,a1
    221c:	203c 0000 ff00 	move.l #65280,d0
    2222:	4eae fd90      	jsr -624(a6)
  Zoom_ZoomIntoPicture( Bitplane1, Bitplane2, 0, 5);
    2226:	2639 0001 778c 	move.l 1778c <Bitplane2>,d3
    222c:	2439 0001 7790 	move.l 17790 <Bitplane1>,d2
    2232:	4878 0005      	pea 5 <_start+0x5>
    2236:	42a7           	clr.l -(sp)
    2238:	2f03           	move.l d3,-(sp)
    223a:	2f02           	move.l d2,-(sp)
    223c:	4eba e8c2      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
    2240:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2246:	2043           	movea.l d3,a0
    2248:	2242           	movea.l d2,a1
    224a:	203c 0000 ff00 	move.l #65280,d0
    2250:	4eae fd90      	jsr -624(a6)
  CopyMem( Bitplane2, startimage, ZMBPLSIZE);
    2254:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    225a:	2079 0001 778c 	movea.l 1778c <Bitplane2>,a0
    2260:	43f9 0000 5798 	lea 5798 <incbin_startimage_start>,a1
    2266:	203c 0000 ff00 	move.l #65280,d0
    226c:	4eae fd90      	jsr -624(a6)
  Zoom_Shrink102( 15, Copperlist1);
    2270:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    2276:	4878 000f      	pea f <main+0x9>
    227a:	47fa f9a4      	lea 1c20 <Zoom_Shrink102>(pc),a3
    227e:	4e93           	jsr (a3)
  Zoom_Shrink102( 15, Copperlist2);
    2280:	2f39 0001 7788 	move.l 17788 <Copperlist2>,-(sp)
    2286:	4878 000f      	pea f <main+0x9>
    228a:	4e93           	jsr (a3)
  Zoom_LevelOfZoom = 1;
    228c:	33fc 0001 0001 	move.w #1,17786 <Zoom_LevelOfZoom>
    2292:	7786 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    2294:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    229a:	7016           	moveq #22,d0
    229c:	223c 0001 0001 	move.l #65537,d1
    22a2:	4eae ff3a      	jsr -198(a6)
    22a6:	2240           	movea.l d0,a1
    22a8:	23c0 0001 779a 	move.l d0,1779a <Zoom_vbint>
    22ae:	4fef 0020      	lea 32(sp),sp
    22b2:	671a           	beq.s 22ce <ZoomTest+0x112>
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    22b4:	337c 02c4 0008 	move.w #708,8(a1)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    22ba:	237c 0001 5763 	move.l #87907,10(a1)
    22c0:	000a 
    Zoom_vbint->is_Data = NULL;
    22c2:	42a9 000e      	clr.l 14(a1)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    22c6:	237c 0000 14b2 	move.l #5298,18(a1)
    22cc:	0012 
  AddIntServer( INTB_VERTB, Zoom_vbint);
    22ce:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    22d4:	7005           	moveq #5,d0
    22d6:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    22da:	2079 0001 7782 	movea.l 17782 <ViewCopper>,a0
    22e0:	2479 0001 77a6 	movea.l 177a6 <ViewBuffer>,a2
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    22e6:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    22ec:	e248           	lsr.w #1,d0
    22ee:	0280 0000 ffff 	andi.l #65535,d0
    22f4:	7208           	moveq #8,d1
    22f6:	9280           	sub.l d0,d1
    22f8:	2001           	move.l d1,d0
    22fa:	e989           	lsl.l #4,d1
    22fc:	9280           	sub.l d0,d1
    22fe:	2001           	move.l d1,d0
    2300:	e988           	lsl.l #4,d0
    2302:	43f2 0804      	lea (4,a2,d0.l),a1
  *bp = 0;
    2306:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD highword = (ULONG)plane2set >> 16;
    230a:	2009           	move.l a1,d0
    230c:	4240           	clr.w d0
    230e:	4840           	swap d0
    2310:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2314:	3149 0076      	move.w a1,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    2318:	7030           	moveq #48,d0
    231a:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    231c:	2200           	move.l d0,d1
    231e:	4241           	clr.w d1
    2320:	4841           	swap d1
    2322:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2326:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    232a:	7060           	moveq #96,d0
    232c:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    232e:	2200           	move.l d0,d1
    2330:	4241           	clr.w d1
    2332:	4841           	swap d1
    2334:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2338:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    233c:	2009           	move.l a1,d0
    233e:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    2344:	2200           	move.l d0,d1
    2346:	4241           	clr.w d1
    2348:	4841           	swap d1
    234a:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    234e:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    2352:	43e9 00c0      	lea 192(a1),a1
    UWORD highword = (ULONG)plane2set >> 16;
    2356:	2009           	move.l a1,d0
    2358:	4240           	clr.w d0
    235a:	4840           	swap d0
    235c:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2360:	3149 0096      	move.w a1,150(a0)
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    2364:	2079 0001 77a2 	movea.l 177a2 <DrawCopper>,a0
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    236a:	3039 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d0
    2370:	e248           	lsr.w #1,d0
    2372:	0280 0000 ffff 	andi.l #65535,d0
    2378:	7208           	moveq #8,d1
    237a:	9280           	sub.l d0,d1
    237c:	2001           	move.l d1,d0
    237e:	e989           	lsl.l #4,d1
    2380:	9280           	sub.l d0,d1
    2382:	2001           	move.l d1,d0
    2384:	e988           	lsl.l #4,d0
    2386:	43f2 0804      	lea (4,a2,d0.l),a1
  *bp = 0;
    238a:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD highword = (ULONG)plane2set >> 16;
    238e:	2009           	move.l a1,d0
    2390:	4240           	clr.w d0
    2392:	4840           	swap d0
    2394:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2398:	3149 0076      	move.w a1,118(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    239c:	7030           	moveq #48,d0
    239e:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    23a0:	2200           	move.l d0,d1
    23a2:	4241           	clr.w d1
    23a4:	4841           	swap d1
    23a6:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    23aa:	3140 007e      	move.w d0,126(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    23ae:	7060           	moveq #96,d0
    23b0:	d089           	add.l a1,d0
    UWORD highword = (ULONG)plane2set >> 16;
    23b2:	2200           	move.l d0,d1
    23b4:	4241           	clr.w d1
    23b6:	4841           	swap d1
    23b8:	3141 0082      	move.w d1,130(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    23bc:	3140 0086      	move.w d0,134(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    23c0:	2009           	move.l a1,d0
    23c2:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    23c8:	2200           	move.l d0,d1
    23ca:	4241           	clr.w d1
    23cc:	4841           	swap d1
    23ce:	3141 008a      	move.w d1,138(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    23d2:	3140 008e      	move.w d0,142(a0)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    23d6:	43e9 00c0      	lea 192(a1),a1
    UWORD highword = (ULONG)plane2set >> 16;
    23da:	2009           	move.l a1,d0
    23dc:	4240           	clr.w d0
    23de:	4840           	swap d0
    23e0:	3140 0092      	move.w d0,146(a0)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    23e4:	3149 0096      	move.w a1,150(a0)
  SwapCl();
    23e8:	4eba f0a2      	jsr 148c <SwapCl>(pc)
  RunFrame();
    23ec:	4eba face      	jsr 1ebc <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    23f0:	3439 0001 779e 	move.w 1779e <Zoom_Counter>,d2
  RemIntServer(INTB_VERTB, Zoom_vbint);
    23f6:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    23fc:	7005           	moveq #5,d0
    23fe:	2279 0001 779a 	movea.l 1779a <Zoom_vbint>,a1
    2404:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    2408:	2f3c 0000 ff00 	move.l #65280,-(sp)
    240e:	4878 031c      	pea 31c <main+0x316>
    2412:	49fa fb3c      	lea 1f50 <FreeDisplay>(pc),a4
    2416:	4e94           	jsr (a4)
  FreeSystem();
    2418:	4eba fbee      	jsr 2008 <FreeSystem>(pc)
  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    241c:	508f           	addq.l #8,sp
    241e:	0c42 0008      	cmpi.w #8,d2
    2422:	631e           	bls.s 2442 <ZoomTest+0x286>
    2424:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    242a:	4eae ffc4      	jsr -60(a6)
    242e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2434:	2200           	move.l d0,d1
    2436:	243c 0001 5771 	move.l #87921,d2
    243c:	761c           	moveq #28,d3
    243e:	4eae ffd0      	jsr -48(a6)
  Zoom_Init();
    2442:	4bfa f024      	lea 1468 <Zoom_Init>(pc),a5
    2446:	4e95           	jsr (a5)
  PrepareDisplayZoom();
    2448:	283c 0000 134a 	move.l #4938,d4
    244e:	2044           	movea.l d4,a0
    2450:	4e90           	jsr (a0)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2452:	4878 0010      	pea 10 <main+0xa>
    2456:	4879 0001 73f0 	pea 173f0 <ClsSprites>
    245c:	42a7           	clr.l -(sp)
    245e:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    2464:	45fa e412      	lea 878 <TestCopperlistBatch>(pc),a2
    2468:	4e92           	jsr (a2)
    246a:	4fef 0010      	lea 16(sp),sp
    246e:	4a80           	tst.l d0
    2470:	661e           	bne.s 2490 <ZoomTest+0x2d4>
    Write( Output(), 
    2472:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2478:	4eae ffc4      	jsr -60(a6)
    247c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2482:	2200           	move.l d0,d1
    2484:	243c 0001 5790 	move.l #87952,d2
    248a:	7645           	moveq #69,d3
    248c:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2490:	4878 000c      	pea c <main+0x6>
    2494:	4879 0001 73c0 	pea 173c0 <ClScreen>
    249a:	4878 0010      	pea 10 <main+0xa>
    249e:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    24a4:	4e92           	jsr (a2)
    24a6:	4fef 0010      	lea 16(sp),sp
    24aa:	4a80           	tst.l d0
    24ac:	661e           	bne.s 24cc <ZoomTest+0x310>
    Write( Output(), 
    24ae:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    24b4:	4eae ffc4      	jsr -60(a6)
    24b8:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    24be:	2200           	move.l d0,d1
    24c0:	243c 0001 57d6 	move.l #88022,d2
    24c6:	7646           	moveq #70,d3
    24c8:	4eae ffd0      	jsr -48(a6)
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    24cc:	2279 0001 77a2 	movea.l 177a2 <DrawCopper>,a1
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    24d2:	3239 0001 77a0 	move.w 177a0 <Zoom_LevelOf102Zoom>,d1
    24d8:	e249           	lsr.w #1,d1
    24da:	0281 0000 ffff 	andi.l #65535,d1
    24e0:	7008           	moveq #8,d0
    24e2:	9081           	sub.l d1,d0
    24e4:	2200           	move.l d0,d1
    24e6:	e988           	lsl.l #4,d0
    24e8:	9081           	sub.l d1,d0
    24ea:	e988           	lsl.l #4,d0
    24ec:	2040           	movea.l d0,a0
    24ee:	d1fc 0004 0004 	adda.l #262148,a0
  *bp = 0;
    24f4:	4278 0200      	clr.w 200 <main+0x1fa>
    UWORD highword = (ULONG)plane2set >> 16;
    24f8:	2008           	move.l a0,d0
    24fa:	4240           	clr.w d0
    24fc:	4840           	swap d0
    24fe:	3340 0072      	move.w d0,114(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2502:	3348 0076      	move.w a0,118(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    2506:	7030           	moveq #48,d0
    2508:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
    250a:	2200           	move.l d0,d1
    250c:	4241           	clr.w d1
    250e:	4841           	swap d1
    2510:	3341 007a      	move.w d1,122(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2514:	3340 007e      	move.w d0,126(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    2518:	7060           	moveq #96,d0
    251a:	d088           	add.l a0,d0
    UWORD highword = (ULONG)plane2set >> 16;
    251c:	2200           	move.l d0,d1
    251e:	4241           	clr.w d1
    2520:	4841           	swap d1
    2522:	3341 0082      	move.w d1,130(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    2526:	3340 0086      	move.w d0,134(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    252a:	2008           	move.l a0,d0
    252c:	0680 0000 0090 	addi.l #144,d0
    UWORD highword = (ULONG)plane2set >> 16;
    2532:	2200           	move.l d0,d1
    2534:	4241           	clr.w d1
    2536:	4841           	swap d1
    2538:	3341 008a      	move.w d1,138(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    253c:	3340 008e      	move.w d0,142(a1)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    2540:	41e8 00c0      	lea 192(a0),a0
    UWORD highword = (ULONG)plane2set >> 16;
    2544:	2008           	move.l a0,d0
    2546:	4240           	clr.w d0
    2548:	4840           	swap d0
    254a:	3340 0092      	move.w d0,146(a1)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    254e:	3348 0096      	move.w a0,150(a1)
  DrawBuffer = ViewBuffer;
    2552:	23fc 0005 0000 	move.l #327680,177b0 <DrawBuffer>
    2558:	0001 77b0 
  ViewBuffer = (ULONG *) tmp;
    255c:	23fc 0004 0000 	move.l #262144,177a6 <ViewBuffer>
    2562:	0001 77a6 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    2566:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    256c:	4878 001c      	pea 1c <main+0x16>
    2570:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    2576:	2a3c 0000 085a 	move.l #2138,d5
    257c:	2045           	movea.l d5,a0
    257e:	4e90           	jsr (a0)
    2580:	4fef 000c      	lea 12(sp),sp
    2584:	4a80           	tst.l d0
    2586:	661e           	bne.s 25a6 <ZoomTest+0x3ea>
    Write(Output(), 
    2588:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    258e:	4eae ffc4      	jsr -60(a6)
    2592:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2598:	2200           	move.l d0,d1
    259a:	243c 0001 581d 	move.l #88093,d2
    25a0:	763c           	moveq #60,d3
    25a2:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    25a6:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    25ac:	4878 001d      	pea 1d <main+0x17>
    25b0:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    25b6:	2045           	movea.l d5,a0
    25b8:	4e90           	jsr (a0)
    25ba:	4fef 000c      	lea 12(sp),sp
    25be:	4a80           	tst.l d0
    25c0:	661e           	bne.s 25e0 <ZoomTest+0x424>
    Write(Output(), 
    25c2:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    25c8:	4eae ffc4      	jsr -60(a6)
    25cc:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    25d2:	2200           	move.l d0,d1
    25d4:	243c 0001 585a 	move.l #88154,d2
    25da:	763c           	moveq #60,d3
    25dc:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    25e0:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    25e6:	4878 001e      	pea 1e <main+0x18>
    25ea:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    25f0:	2045           	movea.l d5,a0
    25f2:	4e90           	jsr (a0)
    25f4:	4fef 000c      	lea 12(sp),sp
    25f8:	4a80           	tst.l d0
    25fa:	661e           	bne.s 261a <ZoomTest+0x45e>
    Write(Output(), 
    25fc:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2602:	4eae ffc4      	jsr -60(a6)
    2606:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    260c:	2200           	move.l d0,d1
    260e:	243c 0001 5897 	move.l #88215,d2
    2614:	763c           	moveq #60,d3
    2616:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    261a:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    2620:	4878 001f      	pea 1f <main+0x19>
    2624:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    262a:	2045           	movea.l d5,a0
    262c:	4e90           	jsr (a0)
    262e:	4fef 000c      	lea 12(sp),sp
    2632:	4a80           	tst.l d0
    2634:	661e           	bne.s 2654 <ZoomTest+0x498>
    Write(Output(), 
    2636:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    263c:	4eae ffc4      	jsr -60(a6)
    2640:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2646:	2200           	move.l d0,d1
    2648:	243c 0001 58d4 	move.l #88276,d2
    264e:	763c           	moveq #60,d3
    2650:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    2654:	4878 0020      	pea 20 <main+0x1a>
    2658:	4879 0001 7340 	pea 17340 <ClColor>
    265e:	4878 0026      	pea 26 <main+0x20>
    2662:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    2668:	4e92           	jsr (a2)
    266a:	4fef 0010      	lea 16(sp),sp
    266e:	4a80           	tst.l d0
    2670:	661e           	bne.s 2690 <ZoomTest+0x4d4>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    2672:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2678:	4eae ffc4      	jsr -60(a6)
    267c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2682:	2200           	move.l d0,d1
    2684:	243c 0001 5911 	move.l #88337,d2
    268a:	7625           	moveq #37,d3
    268c:	4eae ffd0      	jsr -48(a6)
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    2690:	2439 0001 77aa 	move.l 177aa <Copperlist1>,d2
    2696:	2f02           	move.l d2,-(sp)
    2698:	4878 000f      	pea f <main+0x9>
    269c:	4e93           	jsr (a3)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    269e:	4878 001c      	pea 1c <main+0x16>
    26a2:	4879 0001 711c 	pea 1711c <Cl102ZoomTest>
    26a8:	4878 0049      	pea 49 <main+0x43>
    26ac:	2f02           	move.l d2,-(sp)
    26ae:	4e92           	jsr (a2)
    26b0:	4fef 0018      	lea 24(sp),sp
    26b4:	4a80           	tst.l d0
    26b6:	6600 253a      	bne.w 4bf2 <ZoomTest+0x2a36>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    26ba:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    26c0:	4eae ffc4      	jsr -60(a6)
    26c4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    26ca:	2200           	move.l d0,d1
    26cc:	243c 0001 5937 	move.l #88375,d2
    26d2:	7625           	moveq #37,d3
    26d4:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    26d8:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd7d7e>
    26dc:	4878 00bb      	pea bb <main+0xb5>
    26e0:	2f39 0001 77aa 	move.l 177aa <Copperlist1>,-(sp)
    26e6:	2045           	movea.l d5,a0
    26e8:	4e90           	jsr (a0)
    26ea:	4fef 000c      	lea 12(sp),sp
    26ee:	4a80           	tst.l d0
    26f0:	661e           	bne.s 2710 <ZoomTest+0x554>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    26f2:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    26f8:	4eae ffc4      	jsr -60(a6)
    26fc:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2702:	2200           	move.l d0,d1
    2704:	243c 0001 595c 	move.l #88412,d2
    270a:	7632           	moveq #50,d3
    270c:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    2710:	2f3c 0000 ff00 	move.l #65280,-(sp)
    2716:	4878 031c      	pea 31c <main+0x316>
    271a:	4e94           	jsr (a4)
  Zoom_Init();
    271c:	4e95           	jsr (a5)
  PrepareDisplayZoom();
    271e:	2044           	movea.l d4,a0
    2720:	4e90           	jsr (a0)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    2722:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2728:	203c 0000 c800 	move.l #51200,d0
    272e:	7202           	moveq #2,d1
    2730:	4eae ff3a      	jsr -198(a6)
    2734:	2040           	movea.l d0,a0
    2736:	23c0 0001 77b4 	move.l d0,177b4 <Zoom_Source>
  if( Zoom_Source == 0) {
    273c:	508f           	addq.l #8,sp
    273e:	6700 25a4      	beq.w 4ce4 <ZoomTest+0x2b28>
  *tstsource++ = 0x0000;
    2742:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    2744:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    274a:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    2750:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    2756:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    275a:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    2760:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2766:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
    276a:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    2770:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    2776:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    277c:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    2782:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    2788:	317c 002c 0066 	move.w #44,102(a0)
    ZoomBlit_Increment4SrcA = 1;
    278e:	33fc 0001 0001 	move.w #1,177ae <ZoomBlit_Increment4SrcA>
    2794:	77ae 
  WaitBlit(); 
    2796:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    279c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    27a0:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    27a6:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    27ac:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    27b2:	317c ff00 0070 	move.w #-256,112(a0)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    27b8:	2839 0001 77b0 	move.l 177b0 <DrawBuffer>,d4
    27be:	2639 0001 77b4 	move.l 177b4 <Zoom_Source>,d3
  ULONG blta = source + ZoomBlit_Increment4SrcA;
    27c4:	7000           	moveq #0,d0
    27c6:	3039 0001 77ae 	move.w 177ae <ZoomBlit_Increment4SrcA>,d0
    27cc:	d080           	add.l d0,d0
    27ce:	2403           	move.l d3,d2
    27d0:	d480           	add.l d0,d2
  WaitBlit();
    27d2:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    27d8:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = blta;
    27dc:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    27e2:	2142 0050      	move.l d2,80(a0)
  hw->bltbpt = source;
    27e6:	2143 004c      	move.l d3,76(a0)
  hw->bltdpt = destination;
    27ea:	2144 0054      	move.l d4,84(a0)
  hw->bltsize = (height<<6)+2;
    27ee:	317c 2002 0058 	move.w #8194,88(a0)
  WaitBlit();
    27f4:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    27fa:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    27fe:	2479 0001 77b0 	movea.l 177b0 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    2804:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    280a:	671e           	beq.s 282a <ZoomTest+0x66e>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    280c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2812:	4eae ffc4      	jsr -60(a6)
    2816:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    281c:	2200           	move.l d0,d1
    281e:	243c 0001 59c7 	move.l #88519,d2
    2824:	761c           	moveq #28,d3
    2826:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    282a:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    2830:	671e           	beq.s 2850 <ZoomTest+0x694>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    2832:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2838:	4eae ffc4      	jsr -60(a6)
    283c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2842:	2200           	move.l d0,d1
    2844:	243c 0001 59e4 	move.l #88548,d2
    284a:	761c           	moveq #28,d3
    284c:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    2850:	2079 0001 77b0 	movea.l 177b0 <DrawBuffer>,a0
    2856:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    285c:	671e           	beq.s 287c <ZoomTest+0x6c0>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    285e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2864:	4eae ffc4      	jsr -60(a6)
    2868:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    286e:	2200           	move.l d0,d1
    2870:	243c 0001 5a01 	move.l #88577,d2
    2876:	761a           	moveq #26,d3
    2878:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    287c:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2882:	2279 0001 77b4 	movea.l 177b4 <Zoom_Source>,a1
    2888:	203c 0000 c800 	move.l #51200,d0
    288e:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    2892:	2f3c 0000 ff00 	move.l #65280,-(sp)
    2898:	4878 031c      	pea 31c <main+0x316>
    289c:	4e94           	jsr (a4)
    289e:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    28a0:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    28a6:	203c 0000 05a0 	move.l #1440,d0
    28ac:	7202           	moveq #2,d1
    28ae:	4eae ff3a      	jsr -198(a6)
    28b2:	2440           	movea.l d0,a2
  if( source == 0) {
    28b4:	4a80           	tst.l d0
    28b6:	6700 2394      	beq.w 4c4c <ZoomTest+0x2a90>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    28ba:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    28c0:	203c 0000 05a0 	move.l #1440,d0
    28c6:	7202           	moveq #2,d1
    28c8:	4eae ff3a      	jsr -198(a6)
    28cc:	2640           	movea.l d0,a3
  if( destination == 0) {
    28ce:	4a80           	tst.l d0
    28d0:	6700 237a      	beq.w 4c4c <ZoomTest+0x2a90>
    *tmp++ = 0;
    28d4:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    28d6:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    28dc:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    28e2:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    28e6:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    28ea:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    28f0:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    28f6:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    28fa:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    28fe:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    2904:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    290a:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    290e:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    2912:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    2918:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    291e:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    2922:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    2926:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    292c:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    2932:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    2936:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    293a:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    2940:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    2946:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    294a:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    294e:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    2954:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    295a:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    295e:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    2962:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    2968:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    296e:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    2972:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    2976:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    297c:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    2982:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    2986:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    298a:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    2990:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    2996:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    299a:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    299e:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    29a4:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    29aa:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    29ae:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    29b2:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    29b8:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    29be:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    29c2:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    29c6:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    29cc:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    29d2:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    29d6:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    29da:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    29e0:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    29e6:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    29ea:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    29ee:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    29f4:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    29fa:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    29fe:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    2a02:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    2a08:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    2a0e:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    2a12:	4878 05a0      	pea 5a0 <main+0x59a>
    2a16:	42a7           	clr.l -(sp)
    2a18:	2f00           	move.l d0,-(sp)
    2a1a:	4eba 23c6      	jsr 4de2 <memset>(pc)
  WaitBlit();
    2a1e:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2a24:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    2a28:	4e95           	jsr (a5)
  WaitBlit();
    2a2a:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2a30:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    2a34:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    2a3a:	317c 39f0 0040 	move.w #14832,64(a0)
  hw->bltcon1 = 0;
    2a40:	317c 0000 0042 	move.w #0,66(a0)
  WaitBlit();
    2a46:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2a4c:	4eae ff1c      	jsr -228(a6)
  hw->bltapt = (UWORD *) source;
    2a50:	2079 0001 77b8 	movea.l 177b8 <hw>,a0
    2a56:	200a           	move.l a2,d0
    2a58:	5480           	addq.l #2,d0
    2a5a:	2140 0050      	move.l d0,80(a0)
  hw->bltdpt = (UWORD *) destination;
    2a5e:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = (height<<6)+2;
    2a62:	317c 0402 0058 	move.w #1026,88(a0)
  WaitBlit();
    2a68:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2a6e:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    2a72:	4fef 000c      	lea 12(sp),sp
    2a76:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    2a7c:	671e           	beq.s 2a9c <ZoomTest+0x8e0>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    2a7e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2a84:	4eae ffc4      	jsr -60(a6)
    2a88:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2a8e:	2200           	move.l d0,d1
    2a90:	243c 0001 5a52 	move.l #88658,d2
    2a96:	761f           	moveq #31,d3
    2a98:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    2a9c:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    2aa2:	671e           	beq.s 2ac2 <ZoomTest+0x906>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    2aa4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2aaa:	4eae ffc4      	jsr -60(a6)
    2aae:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    2ab4:	2200           	move.l d0,d1
    2ab6:	243c 0001 5a72 	move.l #88690,d2
    2abc:	7620           	moveq #32,d3
    2abe:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    2ac2:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2ac8:	224a           	movea.l a2,a1
    2aca:	203c 0000 05a0 	move.l #1440,d0
    2ad0:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    2ad4:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2ada:	224b           	movea.l a3,a1
    2adc:	203c 0000 05a0 	move.l #1440,d0
    2ae2:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2ae6:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2aec:	203c 0000 3740 	move.l #14144,d0
    2af2:	7202           	moveq #2,d1
    2af4:	4eae ff3a      	jsr -198(a6)
    2af8:	2f40 002c      	move.l d0,44(sp)
  if( source == 0) {
    2afc:	6700 2186      	beq.w 4c84 <ZoomTest+0x2ac8>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2b00:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    2b06:	203c 0000 3740 	move.l #14144,d0
    2b0c:	7202           	moveq #2,d1
    2b0e:	4eae ff3a      	jsr -198(a6)
    2b12:	2840           	movea.l d0,a4
  if( destination == 0) {
    2b14:	4a80           	tst.l d0
    2b16:	6700 21ee      	beq.w 4d06 <ZoomTest+0x2b4a>
    2b1a:	202f 002c      	move.l 44(sp),d0
    2b1e:	0680 0000 3300 	addi.l #13056,d0
    2b24:	206f 002c      	movea.l 44(sp),a0
      *tmp4source++ = 0x55555555;
    2b28:	20bc 5555 5555 	move.l #1431655765,(a0)
    2b2e:	217c 5555 5555 	move.l #1431655765,4(a0)
    2b34:	0004 
    2b36:	217c 5555 5555 	move.l #1431655765,8(a0)
    2b3c:	0008 
    2b3e:	217c 5555 5555 	move.l #1431655765,12(a0)
    2b44:	000c 
    2b46:	217c 5555 5555 	move.l #1431655765,16(a0)
    2b4c:	0010 
    2b4e:	217c 5555 5555 	move.l #1431655765,20(a0)
    2b54:	0014 
    2b56:	217c 5555 5555 	move.l #1431655765,24(a0)
    2b5c:	0018 
    2b5e:	217c 5555 5555 	move.l #1431655765,28(a0)
    2b64:	001c 
    2b66:	217c 5555 5555 	move.l #1431655765,32(a0)
    2b6c:	0020 
    2b6e:	217c 5555 5555 	move.l #1431655765,36(a0)
    2b74:	0024 
    2b76:	217c 5555 5555 	move.l #1431655765,40(a0)
    2b7c:	0028 
    2b7e:	217c 5555 5555 	move.l #1431655765,44(a0)
    2b84:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    2b86:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    2b8c:	0030 
    2b8e:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    2b94:	0034 
    2b96:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    2b9c:	0038 
    2b9e:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    2ba4:	003c 
    2ba6:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    2bac:	0040 
    2bae:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    2bb4:	0044 
    2bb6:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    2bbc:	0048 
    2bbe:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    2bc4:	004c 
    2bc6:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    2bcc:	0050 
    2bce:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    2bd4:	0054 
    2bd6:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    2bdc:	0058 
    2bde:	41e8 0060      	lea 96(a0),a0
    2be2:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    2be8:	fffc 
  for(int i=0;i<128+8;i++) {
    2bea:	b1c0           	cmpa.l d0,a0
    2bec:	6600 ff3a      	bne.w 2b28 <ZoomTest+0x96c>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    2bf0:	4878 0001      	pea 1 <_start+0x1>
    2bf4:	42a7           	clr.l -(sp)
    2bf6:	2f0c           	move.l a4,-(sp)
    2bf8:	2f2f 0038      	move.l 56(sp),-(sp)
    2bfc:	4eba df02      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2c00:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2c06:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    2c0a:	41ec 0004      	lea 4(a4),a0
    2c0e:	2f48 0048      	move.l a0,72(sp)
  for(int i=0;i<14;i++) {
    2c12:	41ec 0364      	lea 868(a4),a0
    2c16:	2f48 004c      	move.l a0,76(sp)
    2c1a:	2808           	move.l a0,d4
    2c1c:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    2c20:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    2c24:	74ff           	moveq #-1,d2
    2c26:	7600           	moveq #0,d3
    2c28:	4643           	not.w d3
    2c2a:	4bfa db18      	lea 744 <TestRow>(pc),a5
    2c2e:	2444           	movea.l d4,a2
    2c30:	45ea fca0      	lea -864(a2),a2
    2c34:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    2c38:	2f0e           	move.l a6,-(sp)
    2c3a:	2f03           	move.l d3,-(sp)
    2c3c:	2f0a           	move.l a2,-(sp)
    2c3e:	4879 0001 771c 	pea 1771c <destlinezoom1>
    2c44:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2c46:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2c4a:	4642           	not.w d2
    2c4c:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    2c4e:	4fef 0010      	lea 16(sp),sp
    2c52:	b88a           	cmp.l a2,d4
    2c54:	6600 18b2      	bne.w 4508 <ZoomTest+0x234c>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    2c58:	2f0b           	move.l a3,-(sp)
    2c5a:	7600           	moveq #0,d3
    2c5c:	3602           	move.w d2,d3
    2c5e:	2f03           	move.l d3,-(sp)
    2c60:	2f0a           	move.l a2,-(sp)
    2c62:	4879 0001 771c 	pea 1771c <destlinezoom1>
    2c68:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2c6a:	280a           	move.l a2,d4
    2c6c:	0684 0000 0390 	addi.l #912,d4
    2c72:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    2c76:	4fef 0010      	lea 16(sp),sp
    2c7a:	b6fc 011c      	cmpa.w #284,a3
    2c7e:	66ae           	bne.s 2c2e <ZoomTest+0xa72>
    2c80:	2e0c           	move.l a4,d7
    2c82:	0687 0000 31e4 	addi.l #12772,d7
    2c88:	2447           	movea.l d7,a2
    2c8a:	283c 0000 0109 	move.l #265,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    2c90:	2f04           	move.l d4,-(sp)
    2c92:	2f03           	move.l d3,-(sp)
    2c94:	2f0a           	move.l a2,-(sp)
    2c96:	4879 0001 771c 	pea 1771c <destlinezoom1>
    2c9c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2c9e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2ca2:	4642           	not.w d2
    2ca4:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    2ca6:	4fef 0010      	lea 16(sp),sp
    2caa:	0c84 0000 010d 	cmpi.l #269,d4
    2cb0:	6726           	beq.s 2cd8 <ZoomTest+0xb1c>
    2cb2:	7600           	moveq #0,d3
    2cb4:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
    2cb6:	2f04           	move.l d4,-(sp)
    2cb8:	2f03           	move.l d3,-(sp)
    2cba:	2f0a           	move.l a2,-(sp)
    2cbc:	4879 0001 771c 	pea 1771c <destlinezoom1>
    2cc2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2cc4:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2cc8:	4642           	not.w d2
    2cca:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    2ccc:	4fef 0010      	lea 16(sp),sp
    2cd0:	0c84 0000 010d 	cmpi.l #269,d4
    2cd6:	66da           	bne.s 2cb2 <ZoomTest+0xaf6>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    2cd8:	4878 0001      	pea 1 <_start+0x1>
    2cdc:	4878 0001      	pea 1 <_start+0x1>
    2ce0:	2f2f 0034      	move.l 52(sp),-(sp)
    2ce4:	2f0c           	move.l a4,-(sp)
    2ce6:	4eba de18      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2cea:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2cf0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    2cf4:	202f 003c      	move.l 60(sp),d0
    2cf8:	5880           	addq.l #4,d0
    2cfa:	2f40 0040      	move.l d0,64(sp)
    2cfe:	4fef 0010      	lea 16(sp),sp
    2d02:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    2d04:	7600           	moveq #0,d3
  mask = 0x0000;
    2d06:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2d08:	2f03           	move.l d3,-(sp)
    2d0a:	3f02           	move.w d2,-(sp)
    2d0c:	4267           	clr.w -(sp)
    2d0e:	2f0a           	move.l a2,-(sp)
    2d10:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2d16:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2d18:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2d1c:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    2d1e:	5283           	addq.l #1,d3
    2d20:	4fef 0010      	lea 16(sp),sp
    2d24:	720b           	moveq #11,d1
    2d26:	b283           	cmp.l d3,d1
    2d28:	66de           	bne.s 2d08 <ZoomTest+0xb4c>
  TestRow( valsupposed, valactual, 0xffff, 8);
    2d2a:	4878 0008      	pea 8 <main+0x2>
    2d2e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2d34:	202f 0034      	move.l 52(sp),d0
    2d38:	0680 0000 0214 	addi.l #532,d0
    2d3e:	2f40 005c      	move.l d0,92(sp)
    2d42:	2f00           	move.l d0,-(sp)
    2d44:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2d4a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    2d4c:	4878 0009      	pea 9 <main+0x3>
    2d50:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2d56:	206f 0044      	movea.l 68(sp),a0
    2d5a:	4868 0244      	pea 580(a0)
    2d5e:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2d64:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    2d66:	4fef 0020      	lea 32(sp),sp
    2d6a:	4878 000a      	pea a <main+0x4>
    2d6e:	42a7           	clr.l -(sp)
    2d70:	206f 0034      	movea.l 52(sp),a0
    2d74:	4868 0274      	pea 628(a0)
    2d78:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2d7e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    2d80:	4878 000b      	pea b <main+0x5>
    2d84:	42a7           	clr.l -(sp)
    2d86:	206f 0044      	movea.l 68(sp),a0
    2d8a:	4868 02a4      	pea 676(a0)
    2d8e:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2d94:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2d96:	2a2f 004c      	move.l 76(sp),d5
    2d9a:	0685 0000 05d4 	addi.l #1492,d5
    2da0:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    2da4:	2c05           	move.l d5,d6
    2da6:	367c 0018      	movea.w #24,a3
    2daa:	7800           	moveq #0,d4
    2dac:	3802           	move.w d2,d4
    2dae:	2446           	movea.l d6,a2
    2db0:	45ea fd00      	lea -768(a2),a2
    2db4:	4deb fff3      	lea -13(a3),a6
    2db8:	2604           	move.l d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2dba:	2f0e           	move.l a6,-(sp)
    2dbc:	2f03           	move.l d3,-(sp)
    2dbe:	2f0a           	move.l a2,-(sp)
    2dc0:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2dc6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2dc8:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2dcc:	4642           	not.w d2
    2dce:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    2dd0:	4fef 0010      	lea 16(sp),sp
    2dd4:	bc8a           	cmp.l a2,d6
    2dd6:	6722           	beq.s 2dfa <ZoomTest+0xc3e>
    2dd8:	7600           	moveq #0,d3
    2dda:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2ddc:	2f0e           	move.l a6,-(sp)
    2dde:	2f03           	move.l d3,-(sp)
    2de0:	2f0a           	move.l a2,-(sp)
    2de2:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2de8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2dea:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2dee:	4642           	not.w d2
    2df0:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    2df2:	4fef 0010      	lea 16(sp),sp
    2df6:	bc8a           	cmp.l a2,d6
    2df8:	66de           	bne.s 2dd8 <ZoomTest+0xc1c>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    2dfa:	7800           	moveq #0,d4
    2dfc:	3802           	move.w d2,d4
    2dfe:	2f0b           	move.l a3,-(sp)
    2e00:	2f04           	move.l d4,-(sp)
    2e02:	2f0a           	move.l a2,-(sp)
    2e04:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2e0a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    2e0c:	486b 0001      	pea 1(a3)
    2e10:	2f04           	move.l d4,-(sp)
    2e12:	486a 0030      	pea 48(a2)
    2e16:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2e1c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    2e1e:	4fef 0020      	lea 32(sp),sp
    2e22:	486b 0002      	pea 2(a3)
    2e26:	2f03           	move.l d3,-(sp)
    2e28:	486a 0060      	pea 96(a2)
    2e2c:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2e32:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    2e34:	486b 0003      	pea 3(a3)
    2e38:	2f03           	move.l d3,-(sp)
    2e3a:	486a 0090      	pea 144(a2)
    2e3e:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2e44:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2e46:	2c0a           	move.l a2,d6
    2e48:	0686 0000 03c0 	addi.l #960,d6
    2e4e:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    2e52:	4fef 0020      	lea 32(sp),sp
    2e56:	b6fc 00e4      	cmpa.w #228,a3
    2e5a:	6600 ff52      	bne.w 2dae <ZoomTest+0xbf2>
    2e5e:	206f 002c      	movea.l 44(sp),a0
    2e62:	41e8 2fd4      	lea 12244(a0),a0
    2e66:	2f48 0068      	move.l a0,104(sp)
    2e6a:	2448           	movea.l a0,a2
  for(int i2=0;i2<15;i2++) { 
    2e6c:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
    2e6e:	2f03           	move.l d3,-(sp)
    2e70:	2f04           	move.l d4,-(sp)
    2e72:	2f0a           	move.l a2,-(sp)
    2e74:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2e7a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2e7c:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2e80:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2e82:	5283           	addq.l #1,d3
    2e84:	4fef 0010      	lea 16(sp),sp
    2e88:	700f           	moveq #15,d0
    2e8a:	b083           	cmp.l d3,d0
    2e8c:	6724           	beq.s 2eb2 <ZoomTest+0xcf6>
    2e8e:	7800           	moveq #0,d4
    2e90:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2);
    2e92:	2f03           	move.l d3,-(sp)
    2e94:	2f04           	move.l d4,-(sp)
    2e96:	2f0a           	move.l a2,-(sp)
    2e98:	4879 0001 76f0 	pea 176f0 <destlinezoom2>
    2e9e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2ea0:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2ea4:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2ea6:	5283           	addq.l #1,d3
    2ea8:	4fef 0010      	lea 16(sp),sp
    2eac:	700f           	moveq #15,d0
    2eae:	b083           	cmp.l d3,d0
    2eb0:	66dc           	bne.s 2e8e <ZoomTest+0xcd2>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    2eb2:	4878 0001      	pea 1 <_start+0x1>
    2eb6:	4878 0002      	pea 2 <_start+0x2>
    2eba:	2f0c           	move.l a4,-(sp)
    2ebc:	2f2f 0038      	move.l 56(sp),-(sp)
    2ec0:	4eba dc3e      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2ec4:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    2eca:	4eae ff1c      	jsr -228(a6)
    2ece:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2ed2:	246f 0038      	movea.l 56(sp),a2
  for(int i2=0;i2<4;i2++) { 
    2ed6:	7400           	moveq #0,d2
  mask = 0xffff;
    2ed8:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
    2eda:	2f02           	move.l d2,-(sp)
    2edc:	3f03           	move.w d3,-(sp)
    2ede:	4267           	clr.w -(sp)
    2ee0:	2f0a           	move.l a2,-(sp)
    2ee2:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2ee8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2eea:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2eee:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
    2ef0:	5282           	addq.l #1,d2
    2ef2:	4fef 0010      	lea 16(sp),sp
    2ef6:	7204           	moveq #4,d1
    2ef8:	b282           	cmp.l d2,d1
    2efa:	66de           	bne.s 2eda <ZoomTest+0xd1e>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    2efc:	4878 0004      	pea 4 <_start+0x4>
    2f00:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2f06:	486c 00c4      	pea 196(a4)
    2f0a:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2f10:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    2f12:	4878 0005      	pea 5 <_start+0x5>
    2f16:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2f1c:	486c 00f4      	pea 244(a4)
    2f20:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2f26:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2f28:	4fef 0020      	lea 32(sp),sp
    2f2c:	4878 0006      	pea 6 <main>
    2f30:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    2f32:	41ec 0124      	lea 292(a4),a0
    2f36:	2f48 006c      	move.l a0,108(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2f3a:	2f08           	move.l a0,-(sp)
    2f3c:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2f42:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2f44:	4878 0007      	pea 7 <main+0x1>
    2f48:	42a7           	clr.l -(sp)
    2f4a:	486c 0154      	pea 340(a4)
    2f4e:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2f54:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    2f56:	4fef 0020      	lea 32(sp),sp
    2f5a:	4878 0008      	pea 8 <main+0x2>
    2f5e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2f64:	486c 0184      	pea 388(a4)
    2f68:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2f6e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2f70:	4878 0009      	pea 9 <main+0x3>
    2f74:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2f7a:	486c 01b4      	pea 436(a4)
    2f7e:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2f84:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2f86:	260c           	move.l a4,d3
    2f88:	0683 0000 04b4 	addi.l #1204,d3
    2f8e:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2f92:	367c 0018      	movea.w #24,a3
    2f96:	7800           	moveq #0,d4
    2f98:	74ff           	moveq #-1,d2
    2f9a:	2443           	movea.l d3,a2
    2f9c:	45ea fd30      	lea -720(a2),a2
    2fa0:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2fa4:	2f0e           	move.l a6,-(sp)
    2fa6:	2f04           	move.l d4,-(sp)
    2fa8:	2f0a           	move.l a2,-(sp)
    2faa:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2fb0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2fb2:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2fb6:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2fb8:	4fef 0010      	lea 16(sp),sp
    2fbc:	b68a           	cmp.l a2,d3
    2fbe:	6722           	beq.s 2fe2 <ZoomTest+0xe26>
    2fc0:	7800           	moveq #0,d4
    2fc2:	3802           	move.w d2,d4
    2fc4:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2fc6:	2f0e           	move.l a6,-(sp)
    2fc8:	2f04           	move.l d4,-(sp)
    2fca:	2f0a           	move.l a2,-(sp)
    2fcc:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2fd2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2fd4:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2fd8:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2fda:	4fef 0010      	lea 16(sp),sp
    2fde:	b68a           	cmp.l a2,d3
    2fe0:	66de           	bne.s 2fc0 <ZoomTest+0xe04>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    2fe2:	7600           	moveq #0,d3
    2fe4:	3602           	move.w d2,d3
    2fe6:	2f0b           	move.l a3,-(sp)
    2fe8:	2f03           	move.l d3,-(sp)
    2fea:	2f0a           	move.l a2,-(sp)
    2fec:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    2ff2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    2ff4:	486b 0001      	pea 1(a3)
    2ff8:	2f03           	move.l d3,-(sp)
    2ffa:	486a 0030      	pea 48(a2)
    2ffe:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    3004:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    3006:	4fef 0020      	lea 32(sp),sp
    300a:	486b 0002      	pea 2(a3)
    300e:	2f04           	move.l d4,-(sp)
    3010:	486a 0060      	pea 96(a2)
    3014:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    301a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    301c:	486b 0003      	pea 3(a3)
    3020:	2f04           	move.l d4,-(sp)
    3022:	486a 0090      	pea 144(a2)
    3026:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    302c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    302e:	4fef 0020      	lea 32(sp),sp
    3032:	486b 0004      	pea 4(a3)
    3036:	2f03           	move.l d3,-(sp)
    3038:	486a 00c0      	pea 192(a2)
    303c:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    3042:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    3044:	486b 0005      	pea 5(a3)
    3048:	2f03           	move.l d3,-(sp)
    304a:	486a 00f0      	pea 240(a2)
    304e:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    3054:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3056:	260a           	move.l a2,d3
    3058:	0683 0000 03f0 	addi.l #1008,d3
    305e:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    3062:	4fef 0020      	lea 32(sp),sp
    3066:	b6fc 0114      	cmpa.w #276,a3
    306a:	6600 ff2e      	bne.w 2f9a <ZoomTest+0xdde>
    306e:	45ec 3124      	lea 12580(a4),a2
    3072:	263c 0000 0105 	move.l #261,d3
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    3078:	2f03           	move.l d3,-(sp)
    307a:	2f04           	move.l d4,-(sp)
    307c:	2f0a           	move.l a2,-(sp)
    307e:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    3084:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3086:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    308a:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    308c:	4fef 0010      	lea 16(sp),sp
    3090:	0c83 0000 010d 	cmpi.l #269,d3
    3096:	6726           	beq.s 30be <ZoomTest+0xf02>
    3098:	7800           	moveq #0,d4
    309a:	3802           	move.w d2,d4
    309c:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    309e:	2f03           	move.l d3,-(sp)
    30a0:	2f04           	move.l d4,-(sp)
    30a2:	2f0a           	move.l a2,-(sp)
    30a4:	4879 0001 76c4 	pea 176c4 <destlinezoom3>
    30aa:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    30ac:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    30b0:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    30b2:	4fef 0010      	lea 16(sp),sp
    30b6:	0c83 0000 010d 	cmpi.l #269,d3
    30bc:	66da           	bne.s 3098 <ZoomTest+0xedc>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    30be:	4878 0001      	pea 1 <_start+0x1>
    30c2:	4878 0003      	pea 3 <_start+0x3>
    30c6:	2f2f 0034      	move.l 52(sp),-(sp)
    30ca:	2f0c           	move.l a4,-(sp)
    30cc:	4eba da32      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    30d0:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    30d6:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    30da:	4878 0007      	pea 7 <main+0x1>
    30de:	42a7           	clr.l -(sp)
    30e0:	2f2f 0048      	move.l 72(sp),-(sp)
    30e4:	4879 0001 7698 	pea 17698 <destlinezoom4>
    30ea:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    30ec:	7034           	moveq #52,d0
    30ee:	d0af 004c      	add.l 76(sp),d0
    30f2:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    30f6:	4fef 0020      	lea 32(sp),sp
    30fa:	4878 0008      	pea 8 <main+0x2>
    30fe:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3104:	2f00           	move.l d0,-(sp)
    3106:	4879 0001 7698 	pea 17698 <destlinezoom4>
    310c:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    310e:	7264           	moveq #100,d1
    3110:	d2af 003c      	add.l 60(sp),d1
    3114:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    3118:	4878 0009      	pea 9 <main+0x3>
    311c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3122:	2f01           	move.l d1,-(sp)
    3124:	4879 0001 7698 	pea 17698 <destlinezoom4>
    312a:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    312c:	202f 004c      	move.l 76(sp),d0
    3130:	0680 0000 0094 	addi.l #148,d0
    3136:	2f40 0054      	move.l d0,84(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    313a:	4fef 0020      	lea 32(sp),sp
    313e:	4878 0008      	pea 8 <main+0x2>
    3142:	42a7           	clr.l -(sp)
    3144:	2f00           	move.l d0,-(sp)
    3146:	4879 0001 7698 	pea 17698 <destlinezoom4>
    314c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    314e:	4878 0009      	pea 9 <main+0x3>
    3152:	42a7           	clr.l -(sp)
    3154:	206f 0044      	movea.l 68(sp),a0
    3158:	4868 00c4      	pea 196(a0)
    315c:	4879 0001 7698 	pea 17698 <destlinezoom4>
    3162:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3164:	202f 004c      	move.l 76(sp),d0
    3168:	0680 0000 00f4 	addi.l #244,d0
    316e:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    3172:	2c2f 004c      	move.l 76(sp),d6
    3176:	0686 0000 0394 	addi.l #916,d6
    317c:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    3180:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    3184:	78ff           	moveq #-1,d4
    3186:	7400           	moveq #0,d2
    3188:	4642           	not.w d2
    318a:	2446           	movea.l d6,a2
    318c:	45ea fd60      	lea -672(a2),a2
    3190:	4deb fff1      	lea -15(a3),a6
    3194:	2602           	move.l d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    3196:	2f0e           	move.l a6,-(sp)
    3198:	2f03           	move.l d3,-(sp)
    319a:	2f0a           	move.l a2,-(sp)
    319c:	4879 0001 7698 	pea 17698 <destlinezoom4>
    31a2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    31a4:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    31a8:	4644           	not.w d4
    31aa:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    31ac:	4fef 0010      	lea 16(sp),sp
    31b0:	bc8a           	cmp.l a2,d6
    31b2:	6722           	beq.s 31d6 <ZoomTest+0x101a>
    31b4:	7600           	moveq #0,d3
    31b6:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    31b8:	2f0e           	move.l a6,-(sp)
    31ba:	2f03           	move.l d3,-(sp)
    31bc:	2f0a           	move.l a2,-(sp)
    31be:	4879 0001 7698 	pea 17698 <destlinezoom4>
    31c4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    31c6:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    31ca:	4644           	not.w d4
    31cc:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    31ce:	4fef 0010      	lea 16(sp),sp
    31d2:	bc8a           	cmp.l a2,d6
    31d4:	66de           	bne.s 31b4 <ZoomTest+0xff8>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    31d6:	7400           	moveq #0,d2
    31d8:	3404           	move.w d4,d2
    31da:	2f0b           	move.l a3,-(sp)
    31dc:	2f02           	move.l d2,-(sp)
    31de:	2f0a           	move.l a2,-(sp)
    31e0:	4879 0001 7698 	pea 17698 <destlinezoom4>
    31e6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    31e8:	486b 0001      	pea 1(a3)
    31ec:	2f02           	move.l d2,-(sp)
    31ee:	486a 0030      	pea 48(a2)
    31f2:	4879 0001 7698 	pea 17698 <destlinezoom4>
    31f8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    31fa:	4fef 0020      	lea 32(sp),sp
    31fe:	486b 0002      	pea 2(a3)
    3202:	2f03           	move.l d3,-(sp)
    3204:	486a 0060      	pea 96(a2)
    3208:	4879 0001 7698 	pea 17698 <destlinezoom4>
    320e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    3210:	486b 0003      	pea 3(a3)
    3214:	2f03           	move.l d3,-(sp)
    3216:	486a 0090      	pea 144(a2)
    321a:	4879 0001 7698 	pea 17698 <destlinezoom4>
    3220:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    3222:	4deb 0004      	lea 4(a3),a6
    3226:	4fef 001c      	lea 28(sp),sp
    322a:	2e8e           	move.l a6,(sp)
    322c:	2f02           	move.l d2,-(sp)
    322e:	486a 00c0      	pea 192(a2)
    3232:	4879 0001 7698 	pea 17698 <destlinezoom4>
    3238:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    323a:	2c0b           	move.l a3,d6
    323c:	5a86           	addq.l #5,d6
    323e:	2f06           	move.l d6,-(sp)
    3240:	2f02           	move.l d2,-(sp)
    3242:	486a 00f0      	pea 240(a2)
    3246:	4879 0001 7698 	pea 17698 <destlinezoom4>
    324c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    324e:	4fef 001c      	lea 28(sp),sp
    3252:	2e8e           	move.l a6,(sp)
    3254:	2f03           	move.l d3,-(sp)
    3256:	486a 0120      	pea 288(a2)
    325a:	4879 0001 7698 	pea 17698 <destlinezoom4>
    3260:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    3262:	2f06           	move.l d6,-(sp)
    3264:	2f03           	move.l d3,-(sp)
    3266:	486a 0150      	pea 336(a2)
    326a:	4879 0001 7698 	pea 17698 <destlinezoom4>
    3270:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3272:	2c0a           	move.l a2,d6
    3274:	0686 0000 0420 	addi.l #1056,d6
    327a:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    327e:	4fef 0020      	lea 32(sp),sp
    3282:	b6fc 0114      	cmpa.w #276,a3
    3286:	6600 ff02      	bne.w 318a <ZoomTest+0xfce>
  TestRow( valsupposed, valactual, mask, 269);
    328a:	4878 010d      	pea 10d <main+0x107>
    328e:	2f02           	move.l d2,-(sp)
    3290:	206f 0034      	movea.l 52(sp),a0
    3294:	4868 3274      	pea 12916(a0)
    3298:	4879 0001 7698 	pea 17698 <destlinezoom4>
    329e:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    32a0:	4878 0001      	pea 1 <_start+0x1>
    32a4:	4878 0004      	pea 4 <_start+0x4>
    32a8:	2f0c           	move.l a4,-(sp)
    32aa:	2f2f 0048      	move.l 72(sp),-(sp)
    32ae:	4eba d850      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    32b2:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    32b8:	4eae ff1c      	jsr -228(a6)
    32bc:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    32c0:	266f 0038      	movea.l 56(sp),a3
  for(int i2=0;i2<13;i2++) {  
    32c4:	95ca           	suba.l a2,a2
  mask = 0x0000;
    32c6:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    32c8:	7400           	moveq #0,d2
    32ca:	3404           	move.w d4,d2
    32cc:	2f0a           	move.l a2,-(sp)
    32ce:	2f02           	move.l d2,-(sp)
    32d0:	2f0b           	move.l a3,-(sp)
    32d2:	4879 0001 766c 	pea 1766c <destlinezoom5>
    32d8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    32da:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    32de:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    32e0:	528a           	addq.l #1,a2
    32e2:	4fef 0010      	lea 16(sp),sp
    32e6:	700d           	moveq #13,d0
    32e8:	b08a           	cmp.l a2,d0
    32ea:	66dc           	bne.s 32c8 <ZoomTest+0x110c>
    32ec:	7600           	moveq #0,d3
    32ee:	3604           	move.w d4,d3
  TestRow( valsupposed, valactual, mask, 12);   
    32f0:	4878 000c      	pea c <main+0x6>
    32f4:	2f03           	move.l d3,-(sp)
    32f6:	486c 0274      	pea 628(a4)
    32fa:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3300:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    3302:	4878 000d      	pea d <main+0x7>
    3306:	2f03           	move.l d3,-(sp)
    3308:	486c 02a4      	pea 676(a4)
    330c:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3312:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    3314:	4fef 0020      	lea 32(sp),sp
    3318:	4878 000e      	pea e <main+0x8>
    331c:	2f02           	move.l d2,-(sp)
    331e:	486c 02d4      	pea 724(a4)
    3322:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3328:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    332a:	4878 000f      	pea f <main+0x9>
    332e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    3330:	41ec 0304      	lea 772(a4),a0
    3334:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    3338:	2f08           	move.l a0,-(sp)
    333a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3340:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    3342:	4fef 0020      	lea 32(sp),sp
    3346:	4878 0010      	pea 10 <main+0xa>
    334a:	2f03           	move.l d3,-(sp)
    334c:	486c 0334      	pea 820(a4)
    3350:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3356:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    3358:	4878 0011      	pea 11 <main+0xb>
    335c:	2f03           	move.l d3,-(sp)
    335e:	2f2f 0054      	move.l 84(sp),-(sp)
    3362:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3368:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    336a:	4fef 0020      	lea 32(sp),sp
    336e:	4878 0012      	pea 12 <main+0xc>
    3372:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    3374:	41ec 0394      	lea 916(a4),a0
    3378:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 18);
    337c:	2f08           	move.l a0,-(sp)
    337e:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3384:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    3386:	4878 0013      	pea 13 <main+0xd>
    338a:	2f02           	move.l d2,-(sp)
    338c:	486c 03c4      	pea 964(a4)
    3390:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3396:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    3398:	4fef 0020      	lea 32(sp),sp
    339c:	4878 0014      	pea 14 <main+0xe>
    33a0:	2f03           	move.l d3,-(sp)
    33a2:	486c 03f4      	pea 1012(a4)
    33a6:	4879 0001 766c 	pea 1766c <destlinezoom5>
    33ac:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    33ae:	4878 0015      	pea 15 <main+0xf>
    33b2:	2f03           	move.l d3,-(sp)
    33b4:	486c 0424      	pea 1060(a4)
    33b8:	4879 0001 766c 	pea 1766c <destlinezoom5>
    33be:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    33c0:	260c           	move.l a4,d3
    33c2:	0683 0000 06c4 	addi.l #1732,d3
    33c8:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    33cc:	347c 0023      	movea.w #35,a2
    33d0:	2643           	movea.l d3,a3
    33d2:	47eb fd90      	lea -624(a3),a3
    33d6:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    33da:	2f0e           	move.l a6,-(sp)
    33dc:	2f02           	move.l d2,-(sp)
    33de:	2f0b           	move.l a3,-(sp)
    33e0:	4879 0001 766c 	pea 1766c <destlinezoom5>
    33e6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    33e8:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    33ec:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    33ee:	4fef 0010      	lea 16(sp),sp
    33f2:	b68b           	cmp.l a3,d3
    33f4:	6722           	beq.s 3418 <ZoomTest+0x125c>
    33f6:	7400           	moveq #0,d2
    33f8:	3404           	move.w d4,d2
    33fa:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    33fc:	2f0e           	move.l a6,-(sp)
    33fe:	2f02           	move.l d2,-(sp)
    3400:	2f0b           	move.l a3,-(sp)
    3402:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3408:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    340a:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    340e:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    3410:	4fef 0010      	lea 16(sp),sp
    3414:	b68b           	cmp.l a3,d3
    3416:	66de           	bne.s 33f6 <ZoomTest+0x123a>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    3418:	7600           	moveq #0,d3
    341a:	3604           	move.w d4,d3
    341c:	2f0a           	move.l a2,-(sp)
    341e:	2f03           	move.l d3,-(sp)
    3420:	2f0b           	move.l a3,-(sp)
    3422:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3428:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    342a:	486a 0001      	pea 1(a2)
    342e:	2f03           	move.l d3,-(sp)
    3430:	486b 0030      	pea 48(a3)
    3434:	4879 0001 766c 	pea 1766c <destlinezoom5>
    343a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    343c:	4fef 0020      	lea 32(sp),sp
    3440:	486a 0002      	pea 2(a2)
    3444:	2f02           	move.l d2,-(sp)
    3446:	486b 0060      	pea 96(a3)
    344a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3450:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    3452:	486a 0003      	pea 3(a2)
    3456:	2f02           	move.l d2,-(sp)
    3458:	486b 0090      	pea 144(a3)
    345c:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3462:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    3464:	4fef 0020      	lea 32(sp),sp
    3468:	486a 0004      	pea 4(a2)
    346c:	2f03           	move.l d3,-(sp)
    346e:	486b 00c0      	pea 192(a3)
    3472:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3478:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    347a:	486a 0005      	pea 5(a2)
    347e:	2f03           	move.l d3,-(sp)
    3480:	486b 00f0      	pea 240(a3)
    3484:	4879 0001 766c 	pea 1766c <destlinezoom5>
    348a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    348c:	4fef 0020      	lea 32(sp),sp
    3490:	486a 0006      	pea 6(a2)
    3494:	2f02           	move.l d2,-(sp)
    3496:	486b 0120      	pea 288(a3)
    349a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    34a0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    34a2:	486a 0007      	pea 7(a2)
    34a6:	2f02           	move.l d2,-(sp)
    34a8:	486b 0150      	pea 336(a3)
    34ac:	4879 0001 766c 	pea 1766c <destlinezoom5>
    34b2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    34b4:	4fef 0020      	lea 32(sp),sp
    34b8:	486a 0008      	pea 8(a2)
    34bc:	2f03           	move.l d3,-(sp)
    34be:	486b 0180      	pea 384(a3)
    34c2:	4879 0001 766c 	pea 1766c <destlinezoom5>
    34c8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    34ca:	486a 0009      	pea 9(a2)
    34ce:	2f03           	move.l d3,-(sp)
    34d0:	486b 01b0      	pea 432(a3)
    34d4:	4879 0001 766c 	pea 1766c <destlinezoom5>
    34da:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    34dc:	260b           	move.l a3,d3
    34de:	0683 0000 0450 	addi.l #1104,d3
    34e4:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    34e8:	4fef 0020      	lea 32(sp),sp
    34ec:	b4fc 00f5      	cmpa.w #245,a2
    34f0:	6600 fede      	bne.w 33d0 <ZoomTest+0x1214>
    34f4:	47ec 2f74      	lea 12148(a4),a3
    34f8:	7c02           	moveq #2,d6
    34fa:	4606           	not.b d6
    TestRow( valsupposed, valactual, mask, i2+253);
    34fc:	2f06           	move.l d6,-(sp)
    34fe:	2f02           	move.l d2,-(sp)
    3500:	2f0b           	move.l a3,-(sp)
    3502:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3508:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    350a:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    350e:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    3510:	4fef 0010      	lea 16(sp),sp
    3514:	0c86 0000 010a 	cmpi.l #266,d6
    351a:	6726           	beq.s 3542 <ZoomTest+0x1386>
    351c:	7400           	moveq #0,d2
    351e:	3404           	move.w d4,d2
    3520:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    3522:	2f06           	move.l d6,-(sp)
    3524:	2f02           	move.l d2,-(sp)
    3526:	2f0b           	move.l a3,-(sp)
    3528:	4879 0001 766c 	pea 1766c <destlinezoom5>
    352e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3530:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    3534:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    3536:	4fef 0010      	lea 16(sp),sp
    353a:	0c86 0000 010a 	cmpi.l #266,d6
    3540:	66da           	bne.s 351c <ZoomTest+0x1360>
    3542:	0284 0000 ffff 	andi.l #65535,d4
  TestRow( valsupposed, valactual, mask, 266);
    3548:	2f06           	move.l d6,-(sp)
    354a:	2f04           	move.l d4,-(sp)
    354c:	2f07           	move.l d7,-(sp)
    354e:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3554:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    3556:	4878 010b      	pea 10b <main+0x105>
    355a:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    355c:	41ec 3214      	lea 12820(a4),a0
    3560:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 267);
    3564:	2f08           	move.l a0,-(sp)
    3566:	4879 0001 766c 	pea 1766c <destlinezoom5>
    356c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    356e:	4fef 0020      	lea 32(sp),sp
    3572:	4878 010c      	pea 10c <main+0x106>
    3576:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    3578:	41ec 3244      	lea 12868(a4),a0
    357c:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 268);
    3580:	2f08           	move.l a0,-(sp)
    3582:	4879 0001 766c 	pea 1766c <destlinezoom5>
    3588:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    358a:	4878 010d      	pea 10d <main+0x107>
    358e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    3590:	41ec 3274      	lea 12916(a4),a0
    3594:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    3598:	2f08           	move.l a0,-(sp)
    359a:	4879 0001 766c 	pea 1766c <destlinezoom5>
    35a0:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    35a2:	4fef 0020      	lea 32(sp),sp
    35a6:	4878 0001      	pea 1 <_start+0x1>
    35aa:	4878 0005      	pea 5 <_start+0x5>
    35ae:	2f2f 0034      	move.l 52(sp),-(sp)
    35b2:	2f0c           	move.l a4,-(sp)
    35b4:	4eba d54a      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    35b8:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    35be:	4eae ff1c      	jsr -228(a6)
    35c2:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    35c6:	266f 0030      	movea.l 48(sp),a3
  for(int i2=0;i2<7;i2++) {  
    35ca:	7600           	moveq #0,d3
  mask = 0x0000;
    35cc:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    35ce:	2f03           	move.l d3,-(sp)
    35d0:	3f02           	move.w d2,-(sp)
    35d2:	4267           	clr.w -(sp)
    35d4:	2f0b           	move.l a3,-(sp)
    35d6:	4879 0001 7640 	pea 17640 <destlinezoom6>
    35dc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    35de:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    35e2:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    35e4:	5283           	addq.l #1,d3
    35e6:	4fef 0010      	lea 16(sp),sp
    35ea:	7007           	moveq #7,d0
    35ec:	b083           	cmp.l d3,d0
    35ee:	66de           	bne.s 35ce <ZoomTest+0x1412>
    35f0:	2c6f 002c      	movea.l 44(sp),a6
    35f4:	4dee 0154      	lea 340(a6),a6
    35f8:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    35fc:	7600           	moveq #0,d3
    35fe:	3602           	move.w d2,d3
    3600:	2f0b           	move.l a3,-(sp)
    3602:	2f03           	move.l d3,-(sp)
    3604:	2f0e           	move.l a6,-(sp)
    3606:	4879 0001 7640 	pea 17640 <destlinezoom6>
    360c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    360e:	486b 0001      	pea 1(a3)
    3612:	2f03           	move.l d3,-(sp)
    3614:	486e 0030      	pea 48(a6)
    3618:	4879 0001 7640 	pea 17640 <destlinezoom6>
    361e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3620:	4642           	not.w d2
    3622:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3624:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    3628:	4fef 0020      	lea 32(sp),sp
    362c:	7213           	moveq #19,d1
    362e:	b28b           	cmp.l a3,d1
    3630:	66ca           	bne.s 35fc <ZoomTest+0x1440>
    3632:	280a           	move.l a2,d4
    3634:	2c45           	movea.l d5,a6
    3636:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    363a:	260b           	move.l a3,d3
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    363c:	2f03           	move.l d3,-(sp)
    363e:	3f02           	move.w d2,-(sp)
    3640:	4267           	clr.w -(sp)
    3642:	2f0e           	move.l a6,-(sp)
    3644:	4879 0001 7640 	pea 17640 <destlinezoom6>
    364a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    364c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3650:	4642           	not.w d2
    3652:	5283           	addq.l #1,d3
    for(int i2=0;i2<12;i2++) {  
    3654:	4fef 0010      	lea 16(sp),sp
    3658:	ba8e           	cmp.l a6,d5
    365a:	66e0           	bne.s 363c <ZoomTest+0x1480>
    365c:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    3660:	7600           	moveq #0,d3
    3662:	3602           	move.w d2,d3
    3664:	2f0a           	move.l a2,-(sp)
    3666:	2f03           	move.l d3,-(sp)
    3668:	2f0e           	move.l a6,-(sp)
    366a:	4879 0001 7640 	pea 17640 <destlinezoom6>
    3670:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    3672:	486a 0001      	pea 1(a2)
    3676:	2f03           	move.l d3,-(sp)
    3678:	486e 0030      	pea 48(a6)
    367c:	4879 0001 7640 	pea 17640 <destlinezoom6>
    3682:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3684:	4642           	not.w d2
    3686:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    368a:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    368e:	4fef 0020      	lea 32(sp),sp
    3692:	b4fc 00af      	cmpa.w #175,a2
    3696:	66c8           	bne.s 3660 <ZoomTest+0x14a4>
    3698:	0685 0000 0480 	addi.l #1152,d5
    369e:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    36a2:	b6fc 0103      	cmpa.w #259,a3
    36a6:	668c           	bne.s 3634 <ZoomTest+0x1478>
    36a8:	2444           	movea.l d4,a2
    36aa:	2c6f 002c      	movea.l 44(sp),a6
    36ae:	4dee 3094      	lea 12436(a6),a6
    36b2:	263c 0000 0102 	move.l #258,d3
    TestRow( valsupposed, valactual, mask, 258+i2);
    36b8:	2f03           	move.l d3,-(sp)
    36ba:	3f02           	move.w d2,-(sp)
    36bc:	4267           	clr.w -(sp)
    36be:	2f0e           	move.l a6,-(sp)
    36c0:	4879 0001 7640 	pea 17640 <destlinezoom6>
    36c6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    36c8:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    36cc:	4642           	not.w d2
    36ce:	5283           	addq.l #1,d3
  for(int i2=0;i2<11;i2++) {  
    36d0:	4fef 0010      	lea 16(sp),sp
    36d4:	0c83 0000 010d 	cmpi.l #269,d3
    36da:	66dc           	bne.s 36b8 <ZoomTest+0x14fc>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    36dc:	4878 0001      	pea 1 <_start+0x1>
    36e0:	4878 0006      	pea 6 <main>
    36e4:	2f0c           	move.l a4,-(sp)
    36e6:	2f2f 0038      	move.l 56(sp),-(sp)
    36ea:	4eba d414      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    36ee:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    36f4:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    36f8:	42a7           	clr.l -(sp)
    36fa:	42a7           	clr.l -(sp)
    36fc:	2f2f 0050      	move.l 80(sp),-(sp)
    3700:	4879 0001 7614 	pea 17614 <destlinezoom7>
    3706:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3708:	41ec 0034      	lea 52(a4),a0
    370c:	2f48 0068      	move.l a0,104(sp)
    3710:	4fef 0020      	lea 32(sp),sp
    3714:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    3718:	7cff           	moveq #-1,d6
    371a:	260a           	move.l a2,d3
    371c:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    371e:	7400           	moveq #0,d2
    3720:	3406           	move.w d6,d2
    3722:	2f0e           	move.l a6,-(sp)
    3724:	2f02           	move.l d2,-(sp)
    3726:	2f0a           	move.l a2,-(sp)
    3728:	4879 0001 7614 	pea 17614 <destlinezoom7>
    372e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    3730:	486e 0001      	pea 1(a6)
    3734:	2f02           	move.l d2,-(sp)
    3736:	486a 0030      	pea 48(a2)
    373a:	4879 0001 7614 	pea 17614 <destlinezoom7>
    3740:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3742:	4646           	not.w d6
    3744:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3746:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    374a:	4fef 0020      	lea 32(sp),sp
    374e:	700f           	moveq #15,d0
    3750:	b08e           	cmp.l a6,d0
    3752:	66ca           	bne.s 371e <ZoomTest+0x1562>
    3754:	240c           	move.l a4,d2
    3756:	0682 0000 04e4 	addi.l #1252,d2
    375c:	280b           	move.l a3,d4
    375e:	264e           	movea.l a6,a3
    3760:	2a03           	move.l d3,d5
    3762:	2c42           	movea.l d2,a6
    3764:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    3768:	260b           	move.l a3,d3
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    376a:	2f03           	move.l d3,-(sp)
    376c:	3f06           	move.w d6,-(sp)
    376e:	4267           	clr.w -(sp)
    3770:	2f0e           	move.l a6,-(sp)
    3772:	4879 0001 7614 	pea 17614 <destlinezoom7>
    3778:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    377a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    377e:	4646           	not.w d6
    3780:	5283           	addq.l #1,d3
    for(int i2=0;i2<11;i2++) {  
    3782:	4fef 0010      	lea 16(sp),sp
    3786:	b48e           	cmp.l a6,d2
    3788:	66e0           	bne.s 376a <ZoomTest+0x15ae>
    378a:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    378e:	7600           	moveq #0,d3
    3790:	3606           	move.w d6,d3
    3792:	2f0a           	move.l a2,-(sp)
    3794:	2f03           	move.l d3,-(sp)
    3796:	2f0e           	move.l a6,-(sp)
    3798:	4879 0001 7614 	pea 17614 <destlinezoom7>
    379e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    37a0:	2f0a           	move.l a2,-(sp)
    37a2:	2f03           	move.l d3,-(sp)
    37a4:	486e 0030      	pea 48(a6)
    37a8:	4879 0001 7614 	pea 17614 <destlinezoom7>
    37ae:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    37b0:	4646           	not.w d6
    37b2:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    37b6:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    37ba:	4fef 0020      	lea 32(sp),sp
    37be:	b4fc 00c9      	cmpa.w #201,a2
    37c2:	66ca           	bne.s 378e <ZoomTest+0x15d2>
    37c4:	0682 0000 04b0 	addi.l #1200,d2
    37ca:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    37ce:	b6fc 0109      	cmpa.w #265,a3
    37d2:	668e           	bne.s 3762 <ZoomTest+0x15a6>
    37d4:	2644           	movea.l d4,a3
    37d6:	2445           	movea.l d5,a2
    37d8:	4dec 31b4      	lea 12724(a4),a6
    37dc:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    37e2:	2f02           	move.l d2,-(sp)
    37e4:	3f06           	move.w d6,-(sp)
    37e6:	4267           	clr.w -(sp)
    37e8:	2f0e           	move.l a6,-(sp)
    37ea:	4879 0001 7614 	pea 17614 <destlinezoom7>
    37f0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    37f2:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    37f6:	4646           	not.w d6
    37f8:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    37fa:	4fef 0010      	lea 16(sp),sp
    37fe:	0c82 0000 0105 	cmpi.l #261,d2
    3804:	66dc           	bne.s 37e2 <ZoomTest+0x1626>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    3806:	4878 0001      	pea 1 <_start+0x1>
    380a:	4878 0007      	pea 7 <main+0x1>
    380e:	2f2f 0034      	move.l 52(sp),-(sp)
    3812:	2f0c           	move.l a4,-(sp)
    3814:	4eba d2ea      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3818:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    381e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3822:	42a7           	clr.l -(sp)
    3824:	2f3c 0000 ffff 	move.l #65535,-(sp)
    382a:	2f2f 0048      	move.l 72(sp),-(sp)
    382e:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    3834:	4e95           	jsr (a5)
    3836:	4fef 0020      	lea 32(sp),sp
    383a:	2c6f 0034      	movea.l 52(sp),a6
  valactual += ZMLINESIZE/2;
    383e:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    3842:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    3844:	4245           	clr.w d5
    3846:	200a           	move.l a2,d0
    3848:	2444           	movea.l d4,a2
    384a:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    384c:	7600           	moveq #0,d3
    384e:	3605           	move.w d5,d3
    3850:	2f0a           	move.l a2,-(sp)
    3852:	2f03           	move.l d3,-(sp)
    3854:	2f02           	move.l d2,-(sp)
    3856:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    385c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    385e:	486a 0001      	pea 1(a2)
    3862:	2f03           	move.l d3,-(sp)
    3864:	2042           	movea.l d2,a0
    3866:	4868 0030      	pea 48(a0)
    386a:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    3870:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3872:	4645           	not.w d5
    3874:	548a           	addq.l #2,a2
  for(int i=0;i<5;i++) {
    3876:	4fef 0020      	lea 32(sp),sp
    387a:	700b           	moveq #11,d0
    387c:	b08a           	cmp.l a2,d0
    387e:	6740           	beq.s 38c0 <ZoomTest+0x1704>
    3880:	2002           	move.l d2,d0
    3882:	0680 0000 00c0 	addi.l #192,d0
    3888:	240e           	move.l a6,d2
    388a:	2c40           	movea.l d0,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    388c:	7600           	moveq #0,d3
    388e:	3605           	move.w d5,d3
    3890:	2f0a           	move.l a2,-(sp)
    3892:	2f03           	move.l d3,-(sp)
    3894:	2f02           	move.l d2,-(sp)
    3896:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    389c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    389e:	486a 0001      	pea 1(a2)
    38a2:	2f03           	move.l d3,-(sp)
    38a4:	2042           	movea.l d2,a0
    38a6:	4868 0030      	pea 48(a0)
    38aa:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    38b0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38b2:	4645           	not.w d5
    38b4:	548a           	addq.l #2,a2
  for(int i=0;i<5;i++) {
    38b6:	4fef 0020      	lea 32(sp),sp
    38ba:	700b           	moveq #11,d0
    38bc:	b08a           	cmp.l a2,d0
    38be:	66c0           	bne.s 3880 <ZoomTest+0x16c4>
    38c0:	2004           	move.l d4,d0
    38c2:	280a           	move.l a2,d4
    38c4:	2e0e           	move.l a6,d7
    38c6:	0687 0000 01e0 	addi.l #480,d7
    38cc:	307c 0015      	movea.w #21,a0
    38d0:	2f4c 006c      	move.l a4,108(sp)
    38d4:	2f4b 0070      	move.l a3,112(sp)
    38d8:	2648           	movea.l a0,a3
    38da:	2c00           	move.l d0,d6
    38dc:	2447           	movea.l d7,a2
    38de:	45ea fe20      	lea -480(a2),a2
    38e2:	49eb fff6      	lea -10(a3),a4
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    38e6:	2f0c           	move.l a4,-(sp)
    38e8:	3f05           	move.w d5,-(sp)
    38ea:	4267           	clr.w -(sp)
    38ec:	2f0a           	move.l a2,-(sp)
    38ee:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    38f4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    38f6:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    38fa:	4645           	not.w d5
    38fc:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    38fe:	4fef 0010      	lea 16(sp),sp
    3902:	be8a           	cmp.l a2,d7
    3904:	66e0           	bne.s 38e6 <ZoomTest+0x172a>
    3906:	240b           	move.l a3,d2
    3908:	49ea 0300      	lea 768(a2),a4
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    390c:	7600           	moveq #0,d3
    390e:	3605           	move.w d5,d3
    3910:	2f02           	move.l d2,-(sp)
    3912:	2f03           	move.l d3,-(sp)
    3914:	2f0a           	move.l a2,-(sp)
    3916:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    391c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    391e:	2f02           	move.l d2,-(sp)
    3920:	2f03           	move.l d3,-(sp)
    3922:	486a 0030      	pea 48(a2)
    3926:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    392c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    392e:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    3932:	4645           	not.w d5
    3934:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    3936:	4fef 0020      	lea 32(sp),sp
    393a:	b9ca           	cmpa.l a2,a4
    393c:	66ce           	bne.s 390c <ZoomTest+0x1750>
    393e:	0687 0000 04e0 	addi.l #1248,d7
    3944:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    3948:	b6fc 00ff      	cmpa.w #255,a3
    394c:	668e           	bne.s 38dc <ZoomTest+0x1720>
    394e:	286f 006c      	movea.l 108(sp),a4
    3952:	266f 0070      	movea.l 112(sp),a3
    3956:	2446           	movea.l d6,a2
    3958:	260e           	move.l a6,d3
    395a:	0683 0000 2be0 	addi.l #11232,d3
    3960:	2406           	move.l d6,d2
    TestRow( valsupposed, valactual, mask, 245+i2);
    3962:	2f02           	move.l d2,-(sp)
    3964:	3f05           	move.w d5,-(sp)
    3966:	4267           	clr.w -(sp)
    3968:	2f03           	move.l d3,-(sp)
    396a:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    3970:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3972:	7230           	moveq #48,d1
    3974:	d681           	add.l d1,d3
    mask = mask ^ 0xffff;
    3976:	4645           	not.w d5
    3978:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    397a:	4fef 0010      	lea 16(sp),sp
    397e:	0c82 0000 00ff 	cmpi.l #255,d2
    3984:	66dc           	bne.s 3962 <ZoomTest+0x17a6>
    3986:	260e           	move.l a6,d3
    3988:	0683 0000 2dc0 	addi.l #11712,d3
    398e:	2e0a           	move.l a2,d7
    3990:	2442           	movea.l d2,a2
    3992:	2c0b           	move.l a3,d6
    3994:	2643           	movea.l d3,a3
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    3996:	7600           	moveq #0,d3
    3998:	3605           	move.w d5,d3
    399a:	2f0a           	move.l a2,-(sp)
    399c:	2f03           	move.l d3,-(sp)
    399e:	2f0b           	move.l a3,-(sp)
    39a0:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    39a6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    39a8:	486a 0001      	pea 1(a2)
    39ac:	2f03           	move.l d3,-(sp)
    39ae:	486b 0030      	pea 48(a3)
    39b2:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    39b8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    39ba:	4645           	not.w d5
    39bc:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    39be:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    39c2:	4fef 0020      	lea 32(sp),sp
    39c6:	b4fc 010d      	cmpa.w #269,a2
    39ca:	66ca           	bne.s 3996 <ZoomTest+0x17da>
    39cc:	2646           	movea.l d6,a3
    39ce:	2c0a           	move.l a2,d6
  TestRow( valsupposed, valactual, mask, 269);
    39d0:	2f06           	move.l d6,-(sp)
    39d2:	3f05           	move.w d5,-(sp)
    39d4:	4267           	clr.w -(sp)
    39d6:	486e 3060      	pea 12384(a6)
    39da:	4879 0001 75e8 	pea 175e8 <destlinezoom8>
    39e0:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    39e2:	4878 0001      	pea 1 <_start+0x1>
    39e6:	4878 0008      	pea 8 <main+0x2>
    39ea:	2f0c           	move.l a4,-(sp)
    39ec:	2f2f 0048      	move.l 72(sp),-(sp)
    39f0:	4eba d10e      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    39f4:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    39fa:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    39fe:	4fef 001c      	lea 28(sp),sp
    3a02:	4297           	clr.l (sp)
    3a04:	42a7           	clr.l -(sp)
    3a06:	2f2f 0040      	move.l 64(sp),-(sp)
    3a0a:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3a10:	4e95           	jsr (a5)
    3a12:	4fef 0010      	lea 16(sp),sp
    3a16:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    3a1a:	7cff           	moveq #-1,d6
    3a1c:	2a07           	move.l d7,d5
    3a1e:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    3a22:	7600           	moveq #0,d3
    3a24:	3606           	move.w d6,d3
    3a26:	2f0e           	move.l a6,-(sp)
    3a28:	2f03           	move.l d3,-(sp)
    3a2a:	2f0a           	move.l a2,-(sp)
    3a2c:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3a32:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    3a34:	486e 0001      	pea 1(a6)
    3a38:	2f03           	move.l d3,-(sp)
    3a3a:	486a 0030      	pea 48(a2)
    3a3e:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3a44:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a46:	4646           	not.w d6
    3a48:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3a4a:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    3a4e:	4fef 0020      	lea 32(sp),sp
    3a52:	7007           	moveq #7,d0
    3a54:	b08e           	cmp.l a6,d0
    3a56:	66ca           	bne.s 3a22 <ZoomTest+0x1866>
    3a58:	2445           	movea.l d5,a2
    3a5a:	2a2f 004c      	move.l 76(sp),d5
    3a5e:	7614           	moveq #20,d3
    3a60:	2f42 0048      	move.l d2,72(sp)
    3a64:	2f4b 004c      	move.l a3,76(sp)
    3a68:	2e0a           	move.l a2,d7
    3a6a:	2443           	movea.l d3,a2
    3a6c:	2c45           	movea.l d5,a6
    3a6e:	4dee fe50      	lea -432(a6),a6
    3a72:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    3a76:	2f0b           	move.l a3,-(sp)
    3a78:	3f06           	move.w d6,-(sp)
    3a7a:	4267           	clr.w -(sp)
    3a7c:	2f0e           	move.l a6,-(sp)
    3a7e:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3a84:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a86:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3a8a:	4646           	not.w d6
    3a8c:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    3a8e:	4fef 0010      	lea 16(sp),sp
    3a92:	ba8e           	cmp.l a6,d5
    3a94:	66e0           	bne.s 3a76 <ZoomTest+0x18ba>
    3a96:	260a           	move.l a2,d3
    3a98:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    3a9c:	7400           	moveq #0,d2
    3a9e:	3406           	move.w d6,d2
    3aa0:	2f03           	move.l d3,-(sp)
    3aa2:	2f02           	move.l d2,-(sp)
    3aa4:	2f0e           	move.l a6,-(sp)
    3aa6:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3aac:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    3aae:	5283           	addq.l #1,d3
    3ab0:	2f03           	move.l d3,-(sp)
    3ab2:	2f02           	move.l d2,-(sp)
    3ab4:	486e 0030      	pea 48(a6)
    3ab8:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3abe:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3ac0:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    3ac2:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    3ac6:	4fef 0020      	lea 32(sp),sp
    3aca:	b68b           	cmp.l a3,d3
    3acc:	66ce           	bne.s 3a9c <ZoomTest+0x18e0>
    3ace:	0685 0000 0510 	addi.l #1296,d5
    3ad4:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    3ad8:	b4fc 0107      	cmpa.w #263,a2
    3adc:	668e           	bne.s 3a6c <ZoomTest+0x18b0>
    3ade:	242f 0048      	move.l 72(sp),d2
    3ae2:	266f 004c      	movea.l 76(sp),a3
    3ae6:	2447           	movea.l d7,a2
    3ae8:	2e0c           	move.l a4,d7
    3aea:	0687 0000 2ee4 	addi.l #12004,d7
    3af0:	2c47           	movea.l d7,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    3af2:	2f0a           	move.l a2,-(sp)
    3af4:	3f06           	move.w d6,-(sp)
    3af6:	4267           	clr.w -(sp)
    3af8:	2f0e           	move.l a6,-(sp)
    3afa:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3b00:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3b02:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3b06:	4646           	not.w d6
    3b08:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    3b0a:	4fef 0010      	lea 16(sp),sp
    3b0e:	b4fc 00fe      	cmpa.w #254,a2
    3b12:	66de           	bne.s 3af2 <ZoomTest+0x1936>
    3b14:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    3b18:	7600           	moveq #0,d3
    3b1a:	3606           	move.w d6,d3
    3b1c:	2f0b           	move.l a3,-(sp)
    3b1e:	2f03           	move.l d3,-(sp)
    3b20:	2f0a           	move.l a2,-(sp)
    3b22:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3b28:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    3b2a:	486b 0001      	pea 1(a3)
    3b2e:	2f03           	move.l d3,-(sp)
    3b30:	486a 0030      	pea 48(a2)
    3b34:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3b3a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b3c:	4646           	not.w d6
    3b3e:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3b40:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    3b44:	4fef 0020      	lea 32(sp),sp
    3b48:	b6fc 010d      	cmpa.w #269,a3
    3b4c:	66ca           	bne.s 3b18 <ZoomTest+0x195c>
  TestRow( valsupposed, valactual, mask, 269);
    3b4e:	2f0b           	move.l a3,-(sp)
    3b50:	3f06           	move.w d6,-(sp)
    3b52:	4267           	clr.w -(sp)
    3b54:	2f2f 0044      	move.l 68(sp),-(sp)
    3b58:	4879 0001 75bc 	pea 175bc <destlinezoom9>
    3b5e:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    3b60:	4878 0001      	pea 1 <_start+0x1>
    3b64:	4878 0009      	pea 9 <main+0x3>
    3b68:	2f2f 0044      	move.l 68(sp),-(sp)
    3b6c:	2f0c           	move.l a4,-(sp)
    3b6e:	4eba cf90      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b72:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    3b78:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3b7c:	4fef 001c      	lea 28(sp),sp
    3b80:	4297           	clr.l (sp)
    3b82:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3b88:	2f2f 0038      	move.l 56(sp),-(sp)
    3b8c:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3b92:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    3b94:	4878 0001      	pea 1 <_start+0x1>
    3b98:	42a7           	clr.l -(sp)
    3b9a:	2f2f 0058      	move.l 88(sp),-(sp)
    3b9e:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3ba4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    3ba6:	4fef 0020      	lea 32(sp),sp
    3baa:	4878 0002      	pea 2 <_start+0x2>
    3bae:	42a7           	clr.l -(sp)
    3bb0:	2f2f 0058      	move.l 88(sp),-(sp)
    3bb4:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3bba:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    3bbc:	262f 0064      	move.l 100(sp),d3
    3bc0:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    3bc4:	7cff           	moveq #-1,d6
    3bc6:	2644           	movea.l d4,a3
    3bc8:	2443           	movea.l d3,a2
    3bca:	45ea fe80      	lea -384(a2),a2
    3bce:	280b           	move.l a3,d4
    3bd0:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    3bd2:	2f04           	move.l d4,-(sp)
    3bd4:	3f06           	move.w d6,-(sp)
    3bd6:	4267           	clr.w -(sp)
    3bd8:	2f0a           	move.l a2,-(sp)
    3bda:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3be0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3be2:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    3be6:	4646           	not.w d6
    3be8:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    3bea:	4fef 0010      	lea 16(sp),sp
    3bee:	b68a           	cmp.l a2,d3
    3bf0:	66e0           	bne.s 3bd2 <ZoomTest+0x1a16>
    3bf2:	280b           	move.l a3,d4
    3bf4:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    3bf8:	7a00           	moveq #0,d5
    3bfa:	3a06           	move.w d6,d5
    3bfc:	2f04           	move.l d4,-(sp)
    3bfe:	2f05           	move.l d5,-(sp)
    3c00:	2f0a           	move.l a2,-(sp)
    3c02:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3c08:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    3c0a:	2f04           	move.l d4,-(sp)
    3c0c:	2f05           	move.l d5,-(sp)
    3c0e:	486a 0030      	pea 48(a2)
    3c12:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3c18:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3c1a:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    3c1e:	4646           	not.w d6
    3c20:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    3c22:	4fef 0020      	lea 32(sp),sp
    3c26:	bdca           	cmpa.l a2,a6
    3c28:	66ce           	bne.s 3bf8 <ZoomTest+0x1a3c>
    3c2a:	0683 0000 0540 	addi.l #1344,d3
    3c30:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    3c34:	b6fc 0107      	cmpa.w #263,a3
    3c38:	668e           	bne.s 3bc8 <ZoomTest+0x1a0c>
    3c3a:	246f 0068      	movea.l 104(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    3c3e:	2f02           	move.l d2,-(sp)
    3c40:	3f06           	move.w d6,-(sp)
    3c42:	4267           	clr.w -(sp)
    3c44:	2f0a           	move.l a2,-(sp)
    3c46:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3c4c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3c4e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3c52:	4646           	not.w d6
    3c54:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    3c56:	4fef 0010      	lea 16(sp),sp
    3c5a:	0c82 0000 0107 	cmpi.l #263,d2
    3c60:	66dc           	bne.s 3c3e <ZoomTest+0x1a82>
    3c62:	2c6f 002c      	movea.l 44(sp),a6
    3c66:	4dee 3154      	lea 12628(a6),a6
    3c6a:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    3c6e:	7400           	moveq #0,d2
    3c70:	3406           	move.w d6,d2
    3c72:	486a ffff      	pea -1(a2)
    3c76:	2f02           	move.l d2,-(sp)
    3c78:	2f0e           	move.l a6,-(sp)
    3c7a:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3c80:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3c82:	2f0a           	move.l a2,-(sp)
    3c84:	2f02           	move.l d2,-(sp)
    3c86:	486e 0030      	pea 48(a6)
    3c8a:	4879 0001 7590 	pea 17590 <destlinezoom10>
    3c90:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3c92:	4646           	not.w d6
    3c94:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3c96:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    3c9a:	4fef 0020      	lea 32(sp),sp
    3c9e:	b4fc 010e      	cmpa.w #270,a2
    3ca2:	66ca           	bne.s 3c6e <ZoomTest+0x1ab2>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    3ca4:	4878 0001      	pea 1 <_start+0x1>
    3ca8:	4878 000a      	pea a <main+0x4>
    3cac:	2f0c           	move.l a4,-(sp)
    3cae:	2f2f 0038      	move.l 56(sp),-(sp)
    3cb2:	4eba ce4c      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3cb6:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    3cbc:	4eae ff1c      	jsr -228(a6)
    3cc0:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3cc4:	246f 0038      	movea.l 56(sp),a2
  for(int i2=0;i2<6;i2++) {  
    3cc8:	7600           	moveq #0,d3
  mask = 0xffff;
    3cca:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    3ccc:	2f03           	move.l d3,-(sp)
    3cce:	3f02           	move.w d2,-(sp)
    3cd0:	4267           	clr.w -(sp)
    3cd2:	2f0a           	move.l a2,-(sp)
    3cd4:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3cda:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3cdc:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3ce0:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    3ce2:	5283           	addq.l #1,d3
    3ce4:	4fef 0010      	lea 16(sp),sp
    3ce8:	7206           	moveq #6,d1
    3cea:	b283           	cmp.l d3,d1
    3cec:	66de           	bne.s 3ccc <ZoomTest+0x1b10>
    3cee:	266f 0064      	movea.l 100(sp),a3
    3cf2:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    3cf6:	7600           	moveq #0,d3
    3cf8:	3602           	move.w d2,d3
    3cfa:	2f0a           	move.l a2,-(sp)
    3cfc:	2f03           	move.l d3,-(sp)
    3cfe:	2f0b           	move.l a3,-(sp)
    3d00:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3d06:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    3d08:	486a 0001      	pea 1(a2)
    3d0c:	2f03           	move.l d3,-(sp)
    3d0e:	486b 0030      	pea 48(a3)
    3d12:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3d18:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d1a:	4642           	not.w d2
    3d1c:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3d1e:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3d22:	4fef 0020      	lea 32(sp),sp
    3d26:	701c           	moveq #28,d0
    3d28:	b08a           	cmp.l a2,d0
    3d2a:	66ca           	bne.s 3cf6 <ZoomTest+0x1b3a>
    3d2c:	260c           	move.l a4,d3
    3d2e:	0683 0000 0694 	addi.l #1684,d3
    3d34:	347c 0023      	movea.w #35,a2
    3d38:	2643           	movea.l d3,a3
    3d3a:	47eb feb0      	lea -336(a3),a3
    3d3e:	280a           	move.l a2,d4
    3d40:	5f84           	subq.l #7,d4
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    3d42:	2f04           	move.l d4,-(sp)
    3d44:	3f02           	move.w d2,-(sp)
    3d46:	4267           	clr.w -(sp)
    3d48:	2f0b           	move.l a3,-(sp)
    3d4a:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3d50:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3d52:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3d56:	4642           	not.w d2
    3d58:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    3d5a:	4fef 0010      	lea 16(sp),sp
    3d5e:	b68b           	cmp.l a3,d3
    3d60:	66e0           	bne.s 3d42 <ZoomTest+0x1b86>
    3d62:	2c4a           	movea.l a2,a6
    3d64:	2a0b           	move.l a3,d5
    3d66:	0685 0000 0420 	addi.l #1056,d5
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    3d6c:	7800           	moveq #0,d4
    3d6e:	3802           	move.w d2,d4
    3d70:	2f0e           	move.l a6,-(sp)
    3d72:	2f04           	move.l d4,-(sp)
    3d74:	2f0b           	move.l a3,-(sp)
    3d76:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3d7c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    3d7e:	486e ffe8      	pea -24(a6)
    3d82:	2f04           	move.l d4,-(sp)
    3d84:	486b 0030      	pea 48(a3)
    3d88:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3d8e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3d90:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3d94:	4642           	not.w d2
    3d96:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    3d98:	4fef 0020      	lea 32(sp),sp
    3d9c:	ba8b           	cmp.l a3,d5
    3d9e:	66cc           	bne.s 3d6c <ZoomTest+0x1bb0>
    3da0:	0683 0000 0570 	addi.l #1392,d3
    3da6:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    3daa:	b4fc 010b      	cmpa.w #267,a2
    3dae:	6688           	bne.s 3d38 <ZoomTest+0x1b7c>
    3db0:	45ec 30c4      	lea 12484(a4),a2
    3db4:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    3dba:	7600           	moveq #0,d3
    3dbc:	3602           	move.w d2,d3
    3dbe:	2f04           	move.l d4,-(sp)
    3dc0:	2f03           	move.l d3,-(sp)
    3dc2:	2f0a           	move.l a2,-(sp)
    3dc4:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3dca:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3dcc:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3dd0:	4642           	not.w d2
    3dd2:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    3dd4:	4fef 0010      	lea 16(sp),sp
    3dd8:	0c84 0000 010b 	cmpi.l #267,d4
    3dde:	66da           	bne.s 3dba <ZoomTest+0x1bfe>
    3de0:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    3de6:	2f04           	move.l d4,-(sp)
    3de8:	2f02           	move.l d2,-(sp)
    3dea:	2f2f 0060      	move.l 96(sp),-(sp)
    3dee:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3df4:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    3df6:	4878 010c      	pea 10c <main+0x106>
    3dfa:	2f02           	move.l d2,-(sp)
    3dfc:	2f2f 0078      	move.l 120(sp),-(sp)
    3e00:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3e06:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    3e08:	4fef 0020      	lea 32(sp),sp
    3e0c:	4878 010d      	pea 10d <main+0x107>
    3e10:	2f03           	move.l d3,-(sp)
    3e12:	2f2f 0044      	move.l 68(sp),-(sp)
    3e16:	4879 0001 7564 	pea 17564 <destlinezoom11>
    3e1c:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    3e1e:	4878 0001      	pea 1 <_start+0x1>
    3e22:	4878 000b      	pea b <main+0x5>
    3e26:	2f2f 0044      	move.l 68(sp),-(sp)
    3e2a:	2f0c           	move.l a4,-(sp)
    3e2c:	4eba ccd2      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3e30:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    3e36:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3e3a:	4fef 001c      	lea 28(sp),sp
    3e3e:	4297           	clr.l (sp)
    3e40:	42a7           	clr.l -(sp)
    3e42:	2f2f 0038      	move.l 56(sp),-(sp)
    3e46:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3e4c:	4e95           	jsr (a5)
    3e4e:	4fef 0010      	lea 16(sp),sp
    3e52:	262f 0034      	move.l 52(sp),d3
  valactual += ZMLINESIZE/2;
    3e56:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    3e5a:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    3e5e:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3e60:	7800           	moveq #0,d4
    3e62:	3802           	move.w d2,d4
    3e64:	2f0a           	move.l a2,-(sp)
    3e66:	2f04           	move.l d4,-(sp)
    3e68:	2f0b           	move.l a3,-(sp)
    3e6a:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3e70:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3e72:	486a 0001      	pea 1(a2)
    3e76:	2f04           	move.l d4,-(sp)
    3e78:	486b 0030      	pea 48(a3)
    3e7c:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3e82:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e84:	4642           	not.w d2
    3e86:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3e88:	4fef 0020      	lea 32(sp),sp
    3e8c:	7219           	moveq #25,d1
    3e8e:	b28a           	cmp.l a2,d1
    3e90:	673e           	beq.s 3ed0 <ZoomTest+0x1d14>
    3e92:	200b           	move.l a3,d0
    3e94:	0680 0000 00c0 	addi.l #192,d0
    3e9a:	2643           	movea.l d3,a3
    3e9c:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3e9e:	7800           	moveq #0,d4
    3ea0:	3802           	move.w d2,d4
    3ea2:	2f0a           	move.l a2,-(sp)
    3ea4:	2f04           	move.l d4,-(sp)
    3ea6:	2f0b           	move.l a3,-(sp)
    3ea8:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3eae:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3eb0:	486a 0001      	pea 1(a2)
    3eb4:	2f04           	move.l d4,-(sp)
    3eb6:	486b 0030      	pea 48(a3)
    3eba:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3ec0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ec2:	4642           	not.w d2
    3ec4:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3ec6:	4fef 0020      	lea 32(sp),sp
    3eca:	7219           	moveq #25,d1
    3ecc:	b28a           	cmp.l a2,d1
    3ece:	66c2           	bne.s 3e92 <ZoomTest+0x1cd6>
    3ed0:	2803           	move.l d3,d4
    3ed2:	0684 0000 0120 	addi.l #288,d4
    3ed8:	347c 001f      	movea.w #31,a2
    3edc:	2644           	movea.l d4,a3
    3ede:	47eb fee0      	lea -288(a3),a3
    3ee2:	2a0a           	move.l a2,d5
    3ee4:	5d85           	subq.l #6,d5
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    3ee6:	2f05           	move.l d5,-(sp)
    3ee8:	3f02           	move.w d2,-(sp)
    3eea:	4267           	clr.w -(sp)
    3eec:	2f0b           	move.l a3,-(sp)
    3eee:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3ef4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3ef6:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3efa:	4642           	not.w d2
    3efc:	5285           	addq.l #1,d5
    for(int i2=0;i2<6;i2++) {  
    3efe:	4fef 0010      	lea 16(sp),sp
    3f02:	b88b           	cmp.l a3,d4
    3f04:	66e0           	bne.s 3ee6 <ZoomTest+0x1d2a>
    3f06:	2c4a           	movea.l a2,a6
    3f08:	2c0b           	move.l a3,d6
    3f0a:	0686 0000 0480 	addi.l #1152,d6
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    3f10:	7a00           	moveq #0,d5
    3f12:	3a02           	move.w d2,d5
    3f14:	2f0e           	move.l a6,-(sp)
    3f16:	2f05           	move.l d5,-(sp)
    3f18:	2f0b           	move.l a3,-(sp)
    3f1a:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3f20:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    3f22:	486e 0001      	pea 1(a6)
    3f26:	2f05           	move.l d5,-(sp)
    3f28:	486b 0030      	pea 48(a3)
    3f2c:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3f32:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3f34:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3f38:	4642           	not.w d2
    3f3a:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    3f3c:	4fef 0020      	lea 32(sp),sp
    3f40:	bc8b           	cmp.l a3,d6
    3f42:	66cc           	bne.s 3f10 <ZoomTest+0x1d54>
    3f44:	0684 0000 05a0 	addi.l #1440,d4
    3f4a:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    3f4e:	b4fc 010f      	cmpa.w #271,a2
    3f52:	6688           	bne.s 3edc <ZoomTest+0x1d20>
    3f54:	2443           	movea.l d3,a2
    3f56:	45ea 2d00      	lea 11520(a2),a2
    3f5a:	263c 0000 0104 	move.l #260,d3
    TestRow( valsupposed, valactual, mask, 260+i2);
    3f60:	2f03           	move.l d3,-(sp)
    3f62:	3f02           	move.w d2,-(sp)
    3f64:	4267           	clr.w -(sp)
    3f66:	2f0a           	move.l a2,-(sp)
    3f68:	4879 0001 7538 	pea 17538 <destlinezoom12>
    3f6e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3f70:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3f74:	4642           	not.w d2
    3f76:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    3f78:	4fef 0010      	lea 16(sp),sp
    3f7c:	0c83 0000 0109 	cmpi.l #265,d3
    3f82:	66dc           	bne.s 3f60 <ZoomTest+0x1da4>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3f84:	4878 0001      	pea 1 <_start+0x1>
    3f88:	4878 000c      	pea c <main+0x6>
    3f8c:	2f0c           	move.l a4,-(sp)
    3f8e:	2f2f 0038      	move.l 56(sp),-(sp)
    3f92:	4eba cb6c      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3f96:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    3f9c:	4eae ff1c      	jsr -228(a6)
    3fa0:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3fa4:	266f 0038      	movea.l 56(sp),a3
  WaitBlit();
    3fa8:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3fac:	7aff           	moveq #-1,d5
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3fae:	7400           	moveq #0,d2
    3fb0:	3405           	move.w d5,d2
    3fb2:	486a ffff      	pea -1(a2)
    3fb6:	2f02           	move.l d2,-(sp)
    3fb8:	2f0b           	move.l a3,-(sp)
    3fba:	4879 0001 750c 	pea 1750c <destlinezoom13>
    3fc0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3fc2:	2f0a           	move.l a2,-(sp)
    3fc4:	2f02           	move.l d2,-(sp)
    3fc6:	486b 0030      	pea 48(a3)
    3fca:	4879 0001 750c 	pea 1750c <destlinezoom13>
    3fd0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3fd2:	4645           	not.w d5
    3fd4:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3fd6:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3fda:	4fef 0020      	lea 32(sp),sp
    3fde:	7017           	moveq #23,d0
    3fe0:	b08a           	cmp.l a2,d0
    3fe2:	66ca           	bne.s 3fae <ZoomTest+0x1df2>
    3fe4:	240c           	move.l a4,d2
    3fe6:	0682 0000 0514 	addi.l #1300,d2
    3fec:	3c7c 001b      	movea.w #27,a6
    3ff0:	280a           	move.l a2,d4
    3ff2:	2642           	movea.l d2,a3
    3ff4:	47eb ff10      	lea -240(a3),a3
    3ff8:	260e           	move.l a6,d3
    3ffa:	5b83           	subq.l #5,d3
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    3ffc:	2f03           	move.l d3,-(sp)
    3ffe:	3f05           	move.w d5,-(sp)
    4000:	4267           	clr.w -(sp)
    4002:	2f0b           	move.l a3,-(sp)
    4004:	4879 0001 750c 	pea 1750c <destlinezoom13>
    400a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    400c:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    4010:	4645           	not.w d5
    4012:	5283           	addq.l #1,d3
    for(int i2=0;i2<5;i2++) {  
    4014:	4fef 0010      	lea 16(sp),sp
    4018:	b48b           	cmp.l a3,d2
    401a:	66e0           	bne.s 3ffc <ZoomTest+0x1e40>
    401c:	244e           	movea.l a6,a2
    401e:	2c0b           	move.l a3,d6
    4020:	0686 0000 04e0 	addi.l #1248,d6
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    4026:	7600           	moveq #0,d3
    4028:	3605           	move.w d5,d3
    402a:	2f0a           	move.l a2,-(sp)
    402c:	2f03           	move.l d3,-(sp)
    402e:	2f0b           	move.l a3,-(sp)
    4030:	4879 0001 750c 	pea 1750c <destlinezoom13>
    4036:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    4038:	486a 0001      	pea 1(a2)
    403c:	2f03           	move.l d3,-(sp)
    403e:	486b 0030      	pea 48(a3)
    4042:	4879 0001 750c 	pea 1750c <destlinezoom13>
    4048:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    404a:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    404e:	4645           	not.w d5
    4050:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    4052:	4fef 0020      	lea 32(sp),sp
    4056:	bc8b           	cmp.l a3,d6
    4058:	66cc           	bne.s 4026 <ZoomTest+0x1e6a>
    405a:	0682 0000 05d0 	addi.l #1488,d2
    4060:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    4064:	bcfc 0113      	cmpa.w #275,a6
    4068:	6688           	bne.s 3ff2 <ZoomTest+0x1e36>
    406a:	2444           	movea.l d4,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    406c:	4878 0001      	pea 1 <_start+0x1>
    4070:	4878 000d      	pea d <main+0x7>
    4074:	2f2f 0034      	move.l 52(sp),-(sp)
    4078:	2f0c           	move.l a4,-(sp)
    407a:	4eba ca84      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    407e:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    4084:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    4088:	42a7           	clr.l -(sp)
    408a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    4090:	2f2f 0048      	move.l 72(sp),-(sp)
    4094:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    409a:	4e95           	jsr (a5)
    409c:	4fef 0020      	lea 32(sp),sp
    40a0:	242f 0034      	move.l 52(sp),d2
  valactual += ZMLINESIZE/2; 
    40a4:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    40a8:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    40ac:	4246           	clr.w d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    40ae:	7600           	moveq #0,d3
    40b0:	3606           	move.w d6,d3
    40b2:	2f0b           	move.l a3,-(sp)
    40b4:	2f03           	move.l d3,-(sp)
    40b6:	2f0e           	move.l a6,-(sp)
    40b8:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    40be:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    40c0:	486b 0001      	pea 1(a3)
    40c4:	2f03           	move.l d3,-(sp)
    40c6:	486e 0030      	pea 48(a6)
    40ca:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    40d0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    40d2:	4646           	not.w d6
    40d4:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    40d6:	4fef 0020      	lea 32(sp),sp
    40da:	7213           	moveq #19,d1
    40dc:	b28b           	cmp.l a3,d1
    40de:	673e           	beq.s 411e <ZoomTest+0x1f62>
    40e0:	200e           	move.l a6,d0
    40e2:	0680 0000 00c0 	addi.l #192,d0
    40e8:	2c42           	movea.l d2,a6
    40ea:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    40ec:	7600           	moveq #0,d3
    40ee:	3606           	move.w d6,d3
    40f0:	2f0b           	move.l a3,-(sp)
    40f2:	2f03           	move.l d3,-(sp)
    40f4:	2f0e           	move.l a6,-(sp)
    40f6:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    40fc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    40fe:	486b 0001      	pea 1(a3)
    4102:	2f03           	move.l d3,-(sp)
    4104:	486e 0030      	pea 48(a6)
    4108:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    410e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4110:	4646           	not.w d6
    4112:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    4114:	4fef 0020      	lea 32(sp),sp
    4118:	7213           	moveq #19,d1
    411a:	b28b           	cmp.l a3,d1
    411c:	66c2           	bne.s 40e0 <ZoomTest+0x1f24>
    411e:	2602           	move.l d2,d3
    4120:	0683 0000 00c0 	addi.l #192,d3
    4126:	2a0b           	move.l a3,d5
    4128:	2c43           	movea.l d3,a6
    412a:	4dee ff40      	lea -192(a6),a6
    412e:	280a           	move.l a2,d4
    4130:	5984           	subq.l #4,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    4132:	2f04           	move.l d4,-(sp)
    4134:	3f06           	move.w d6,-(sp)
    4136:	4267           	clr.w -(sp)
    4138:	2f0e           	move.l a6,-(sp)
    413a:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    4140:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4142:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    4146:	4646           	not.w d6
    4148:	5284           	addq.l #1,d4
    for(int i2=0;i2<4;i2++) {  
    414a:	4fef 0010      	lea 16(sp),sp
    414e:	b68e           	cmp.l a6,d3
    4150:	66e0           	bne.s 4132 <ZoomTest+0x1f76>
    4152:	264a           	movea.l a2,a3
    4154:	41ee 0540      	lea 1344(a6),a0
    4158:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    415c:	7800           	moveq #0,d4
    415e:	3806           	move.w d6,d4
    4160:	2f0b           	move.l a3,-(sp)
    4162:	2f04           	move.l d4,-(sp)
    4164:	2f0e           	move.l a6,-(sp)
    4166:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    416c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    416e:	486b 0001      	pea 1(a3)
    4172:	2f04           	move.l d4,-(sp)
    4174:	486e 0030      	pea 48(a6)
    4178:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    417e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4180:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    4184:	4646           	not.w d6
    4186:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    4188:	4fef 0020      	lea 32(sp),sp
    418c:	bdef 003c      	cmpa.l 60(sp),a6
    4190:	66ca           	bne.s 415c <ZoomTest+0x1fa0>
    4192:	0683 0000 0600 	addi.l #1536,d3
    4198:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    419c:	b4fc 00f7      	cmpa.w #247,a2
    41a0:	6686           	bne.s 4128 <ZoomTest+0x1f6c>
    41a2:	2645           	movea.l d5,a3
    41a4:	2c42           	movea.l d2,a6
    41a6:	4dee 2a00      	lea 10752(a6),a6
    41aa:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    41ae:	2f0a           	move.l a2,-(sp)
    41b0:	3f06           	move.w d6,-(sp)
    41b2:	4267           	clr.w -(sp)
    41b4:	2f0e           	move.l a6,-(sp)
    41b6:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    41bc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    41be:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    41c2:	4646           	not.w d6
    41c4:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    41c6:	4fef 0010      	lea 16(sp),sp
    41ca:	b4fc 00f7      	cmpa.w #247,a2
    41ce:	66de           	bne.s 41ae <ZoomTest+0x1ff2>
    41d0:	0682 0000 2ac0 	addi.l #10944,d2
    41d6:	2c4a           	movea.l a2,a6
    41d8:	260a           	move.l a2,d3
    41da:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    41dc:	7400           	moveq #0,d2
    41de:	3406           	move.w d6,d2
    41e0:	2f0e           	move.l a6,-(sp)
    41e2:	2f02           	move.l d2,-(sp)
    41e4:	2f0a           	move.l a2,-(sp)
    41e6:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    41ec:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    41ee:	486e 0001      	pea 1(a6)
    41f2:	2f02           	move.l d2,-(sp)
    41f4:	486a 0030      	pea 48(a2)
    41f8:	4879 0001 74e0 	pea 174e0 <destlinezoom14>
    41fe:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4200:	4646           	not.w d6
    4202:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    4204:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    4208:	4fef 0020      	lea 32(sp),sp
    420c:	bcfc 010f      	cmpa.w #271,a6
    4210:	66ca           	bne.s 41dc <ZoomTest+0x2020>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    4212:	4878 0001      	pea 1 <_start+0x1>
    4216:	4878 000e      	pea e <main+0x8>
    421a:	2f0c           	move.l a4,-(sp)
    421c:	2f2f 0038      	move.l 56(sp),-(sp)
    4220:	4eba c8de      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    4224:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    422a:	4eae ff1c      	jsr -228(a6)
    422e:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    4232:	242f 0038      	move.l 56(sp),d2
  WaitBlit();
    4236:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    423a:	4245           	clr.w d5
    423c:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    423e:	7400           	moveq #0,d2
    4240:	3405           	move.w d5,d2
    4242:	486e ffff      	pea -1(a6)
    4246:	2f02           	move.l d2,-(sp)
    4248:	2f0a           	move.l a2,-(sp)
    424a:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    4250:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    4252:	2f0e           	move.l a6,-(sp)
    4254:	2f02           	move.l d2,-(sp)
    4256:	486a 0030      	pea 48(a2)
    425a:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    4260:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4262:	4645           	not.w d5
    4264:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    4266:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    426a:	4fef 0020      	lea 32(sp),sp
    426e:	7011           	moveq #17,d0
    4270:	b08e           	cmp.l a6,d0
    4272:	66ca           	bne.s 423e <ZoomTest+0x2082>
    4274:	2443           	movea.l d3,a2
    4276:	242f 005c      	move.l 92(sp),d2
    427a:	2c42           	movea.l d2,a6
    427c:	4dee ff70      	lea -144(a6),a6
    4280:	260b           	move.l a3,d3
    4282:	5783           	subq.l #3,d3
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    4284:	2f03           	move.l d3,-(sp)
    4286:	3f05           	move.w d5,-(sp)
    4288:	4267           	clr.w -(sp)
    428a:	2f0e           	move.l a6,-(sp)
    428c:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    4292:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4294:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    4298:	4645           	not.w d5
    429a:	5283           	addq.l #1,d3
    for(int i2=0;i2<3;i2++) {  
    429c:	4fef 0010      	lea 16(sp),sp
    42a0:	b48e           	cmp.l a6,d2
    42a2:	66e0           	bne.s 4284 <ZoomTest+0x20c8>
    42a4:	260b           	move.l a3,d3
    42a6:	2c0e           	move.l a6,d6
    42a8:	0686 0000 05a0 	addi.l #1440,d6
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    42ae:	7800           	moveq #0,d4
    42b0:	3805           	move.w d5,d4
    42b2:	2f03           	move.l d3,-(sp)
    42b4:	2f04           	move.l d4,-(sp)
    42b6:	2f0e           	move.l a6,-(sp)
    42b8:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    42be:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    42c0:	2f03           	move.l d3,-(sp)
    42c2:	2f04           	move.l d4,-(sp)
    42c4:	486e 0030      	pea 48(a6)
    42c8:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    42ce:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    42d0:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    42d4:	4645           	not.w d5
    42d6:	5483           	addq.l #2,d3
    for(int i2=0;i2<15;i2++) {
    42d8:	4fef 0020      	lea 32(sp),sp
    42dc:	bc8e           	cmp.l a6,d6
    42de:	66ce           	bne.s 42ae <ZoomTest+0x20f2>
    42e0:	0682 0000 0630 	addi.l #1584,d2
    42e6:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    42ea:	b6fc 00fa      	cmpa.w #250,a3
    42ee:	668a           	bne.s 427a <ZoomTest+0x20be>
    42f0:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    42f4:	2f0a           	move.l a2,-(sp)
    42f6:	3f05           	move.w d5,-(sp)
    42f8:	4267           	clr.w -(sp)
    42fa:	2f0b           	move.l a3,-(sp)
    42fc:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    4302:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    4304:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    4308:	4645           	not.w d5
    430a:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    430c:	4fef 0010      	lea 16(sp),sp
    4310:	b4fc 00fa      	cmpa.w #250,a2
    4314:	66de           	bne.s 42f4 <ZoomTest+0x2138>
    4316:	2647           	movea.l d7,a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    4318:	7400           	moveq #0,d2
    431a:	3405           	move.w d5,d2
    431c:	2f0a           	move.l a2,-(sp)
    431e:	2f02           	move.l d2,-(sp)
    4320:	2f0b           	move.l a3,-(sp)
    4322:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    4328:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    432a:	486a 0001      	pea 1(a2)
    432e:	2f02           	move.l d2,-(sp)
    4330:	486b 0030      	pea 48(a3)
    4334:	4879 0001 74b4 	pea 174b4 <destlinezoom15>
    433a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    433c:	4645           	not.w d5
    433e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    4340:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    4344:	4fef 0020      	lea 32(sp),sp
    4348:	b4fc 010e      	cmpa.w #270,a2
    434c:	66ca           	bne.s 4318 <ZoomTest+0x215c>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    434e:	4878 0001      	pea 1 <_start+0x1>
    4352:	4878 000f      	pea f <main+0x9>
    4356:	2f2f 0034      	move.l 52(sp),-(sp)
    435a:	2f0c           	move.l a4,-(sp)
    435c:	4eba c7a2      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    4360:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    4366:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    436a:	42a7           	clr.l -(sp)
    436c:	42a7           	clr.l -(sp)
    436e:	2f2f 0048      	move.l 72(sp),-(sp)
    4372:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4378:	4e95           	jsr (a5)
    437a:	4fef 0020      	lea 32(sp),sp
    437e:	246f 0044      	movea.l 68(sp),a2
    4382:	2e2f 0034      	move.l 52(sp),d7
  valactual += ZMLINESIZE/2;
    4386:	262f 0040      	move.l 64(sp),d3
  TestRow( valsupposed, valactual, mask, 0);   
    438a:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    438c:	74ff           	moveq #-1,d2
    438e:	2c43           	movea.l d3,a6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    4390:	7600           	moveq #0,d3
    4392:	3602           	move.w d2,d3
    4394:	2f0b           	move.l a3,-(sp)
    4396:	2f03           	move.l d3,-(sp)
    4398:	2f0e           	move.l a6,-(sp)
    439a:	4879 0001 7488 	pea 17488 <destlinezoom16>
    43a0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    43a2:	486b 0001      	pea 1(a3)
    43a6:	2f03           	move.l d3,-(sp)
    43a8:	486e 0030      	pea 48(a6)
    43ac:	4879 0001 7488 	pea 17488 <destlinezoom16>
    43b2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    43b4:	4642           	not.w d2
    43b6:	200e           	move.l a6,d0
    43b8:	0680 0000 0120 	addi.l #288,d0
    43be:	548b           	addq.l #2,a3
    43c0:	2c47           	movea.l d7,a6
  for(int i2=0;i2<6;i2++) {
    43c2:	4fef 0020      	lea 32(sp),sp
    43c6:	720c           	moveq #12,d1
    43c8:	b28b           	cmp.l a3,d1
    43ca:	6740           	beq.s 440c <ZoomTest+0x2250>
    43cc:	2e0a           	move.l a2,d7
    43ce:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    43d0:	7600           	moveq #0,d3
    43d2:	3602           	move.w d2,d3
    43d4:	2f0b           	move.l a3,-(sp)
    43d6:	2f03           	move.l d3,-(sp)
    43d8:	2f0e           	move.l a6,-(sp)
    43da:	4879 0001 7488 	pea 17488 <destlinezoom16>
    43e0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    43e2:	486b 0001      	pea 1(a3)
    43e6:	2f03           	move.l d3,-(sp)
    43e8:	486e 0030      	pea 48(a6)
    43ec:	4879 0001 7488 	pea 17488 <destlinezoom16>
    43f2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    43f4:	4642           	not.w d2
    43f6:	200e           	move.l a6,d0
    43f8:	0680 0000 0120 	addi.l #288,d0
    43fe:	548b           	addq.l #2,a3
    4400:	2c47           	movea.l d7,a6
  for(int i2=0;i2<6;i2++) {
    4402:	4fef 0020      	lea 32(sp),sp
    4406:	720c           	moveq #12,d1
    4408:	b28b           	cmp.l a3,d1
    440a:	66c0           	bne.s 43cc <ZoomTest+0x2210>
    440c:	367c 000d      	movea.w #13,a3
    4410:	2800           	move.l d0,d4
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    4412:	2f0b           	move.l a3,-(sp)
    4414:	7600           	moveq #0,d3
    4416:	3602           	move.w d2,d3
    4418:	2f03           	move.l d3,-(sp)
    441a:	2f07           	move.l d7,-(sp)
    441c:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4422:	4e95           	jsr (a5)
    4424:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    4428:	3a02           	move.w d2,d5
    442a:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    442c:	3f05           	move.w d5,-(sp)
    442e:	4267           	clr.w -(sp)
    4430:	2047           	movea.l d7,a0
    4432:	4868 0030      	pea 48(a0)
    4436:	4879 0001 7488 	pea 17488 <destlinezoom16>
    443c:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    443e:	4deb 0003      	lea 3(a3),a6
    4442:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    4446:	2e04           	move.l d4,d7
    4448:	7c23           	moveq #35,d6
    444a:	dc8b           	add.l a3,d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    444c:	2f0e           	move.l a6,-(sp)
    444e:	2f03           	move.l d3,-(sp)
    4450:	2f0a           	move.l a2,-(sp)
    4452:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4458:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    445a:	486e 0001      	pea 1(a6)
    445e:	2f03           	move.l d3,-(sp)
    4460:	486a 0030      	pea 48(a2)
    4464:	4879 0001 7488 	pea 17488 <destlinezoom16>
    446a:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    446c:	3405           	move.w d5,d2
    446e:	41ea 00c0      	lea 192(a2),a0
    4472:	548e           	addq.l #2,a6
    for(int i2=0;i2<16;i2++) {
    4474:	4fef 0020      	lea 32(sp),sp
    4478:	bdc6           	cmpa.l d6,a6
    447a:	673a           	beq.s 44b6 <ZoomTest+0x22fa>
    447c:	2447           	movea.l d7,a2
    447e:	2e08           	move.l a0,d7
    4480:	7600           	moveq #0,d3
    4482:	3605           	move.w d5,d3
    4484:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    4486:	2f0e           	move.l a6,-(sp)
    4488:	2f03           	move.l d3,-(sp)
    448a:	2f0a           	move.l a2,-(sp)
    448c:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4492:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    4494:	486e 0001      	pea 1(a6)
    4498:	2f03           	move.l d3,-(sp)
    449a:	486a 0030      	pea 48(a2)
    449e:	4879 0001 7488 	pea 17488 <destlinezoom16>
    44a4:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    44a6:	3405           	move.w d5,d2
    44a8:	41ea 00c0      	lea 192(a2),a0
    44ac:	548e           	addq.l #2,a6
    for(int i2=0;i2<16;i2++) {
    44ae:	4fef 0020      	lea 32(sp),sp
    44b2:	bdc6           	cmpa.l d6,a6
    44b4:	66c6           	bne.s 447c <ZoomTest+0x22c0>
    44b6:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    44ba:	b6fc 00fb      	cmpa.w #251,a3
    44be:	6750           	beq.s 4510 <ZoomTest+0x2354>
    44c0:	280a           	move.l a2,d4
    44c2:	0684 0000 0120 	addi.l #288,d4
    44c8:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    44ca:	2f0b           	move.l a3,-(sp)
    44cc:	7600           	moveq #0,d3
    44ce:	3602           	move.w d2,d3
    44d0:	2f03           	move.l d3,-(sp)
    44d2:	2f07           	move.l d7,-(sp)
    44d4:	4879 0001 7488 	pea 17488 <destlinezoom16>
    44da:	4e95           	jsr (a5)
    44dc:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    44e0:	3a02           	move.w d2,d5
    44e2:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    44e4:	3f05           	move.w d5,-(sp)
    44e6:	4267           	clr.w -(sp)
    44e8:	2047           	movea.l d7,a0
    44ea:	4868 0030      	pea 48(a0)
    44ee:	4879 0001 7488 	pea 17488 <destlinezoom16>
    44f4:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    44f6:	4deb 0003      	lea 3(a3),a6
    44fa:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    44fe:	2e04           	move.l d4,d7
    4500:	7c23           	moveq #35,d6
    4502:	dc8b           	add.l a3,d6
    4504:	6000 ff46      	bra.w 444c <ZoomTest+0x2290>
    4508:	7600           	moveq #0,d3
    450a:	3602           	move.w d2,d3
    450c:	6000 e72a      	bra.w 2c38 <ZoomTest+0xa7c>
    4510:	2808           	move.l a0,d4
    TestRow( valsupposed, valactual, mask, 251+i2);
    4512:	2f0b           	move.l a3,-(sp)
    4514:	7a00           	moveq #0,d5
    4516:	3a02           	move.w d2,d5
    4518:	2f05           	move.l d5,-(sp)
    451a:	2f07           	move.l d7,-(sp)
    451c:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4522:	4e95           	jsr (a5)
    4524:	4878 00fc      	pea fc <main+0xf6>
    4528:	2f03           	move.l d3,-(sp)
    452a:	486a 0090      	pea 144(a2)
    452e:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4534:	4e95           	jsr (a5)
    4536:	4fef 0020      	lea 32(sp),sp
    453a:	347c 00fd      	movea.w #253,a2
    453e:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    4540:	2f0a           	move.l a2,-(sp)
    4542:	2f05           	move.l d5,-(sp)
    4544:	2f0b           	move.l a3,-(sp)
    4546:	4879 0001 7488 	pea 17488 <destlinezoom16>
    454c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    454e:	486a 0001      	pea 1(a2)
    4552:	2f05           	move.l d5,-(sp)
    4554:	486b 0030      	pea 48(a3)
    4558:	4879 0001 7488 	pea 17488 <destlinezoom16>
    455e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4560:	4642           	not.w d2
    4562:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    4564:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    4568:	4fef 0020      	lea 32(sp),sp
    456c:	b4fc 010d      	cmpa.w #269,a2
    4570:	6736           	beq.s 45a8 <ZoomTest+0x23ec>
    4572:	7a00           	moveq #0,d5
    4574:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    4576:	2f0a           	move.l a2,-(sp)
    4578:	2f05           	move.l d5,-(sp)
    457a:	2f0b           	move.l a3,-(sp)
    457c:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4582:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    4584:	486a 0001      	pea 1(a2)
    4588:	2f05           	move.l d5,-(sp)
    458a:	486b 0030      	pea 48(a3)
    458e:	4879 0001 7488 	pea 17488 <destlinezoom16>
    4594:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4596:	4642           	not.w d2
    4598:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    459a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    459e:	4fef 0020      	lea 32(sp),sp
    45a2:	b4fc 010d      	cmpa.w #269,a2
    45a6:	66ca           	bne.s 4572 <ZoomTest+0x23b6>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    45a8:	4878 0001      	pea 1 <_start+0x1>
    45ac:	4878 0010      	pea 10 <main+0xa>
    45b0:	2f0c           	move.l a4,-(sp)
    45b2:	2f2f 0038      	move.l 56(sp),-(sp)
    45b6:	4eba c548      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    45ba:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    45c0:	4eae ff1c      	jsr -228(a6)
    45c4:	4fef 0010      	lea 16(sp),sp
    45c8:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    45cc:	7cff           	moveq #-1,d6
    45ce:	266f 0038      	movea.l 56(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    45d2:	7400           	moveq #0,d2
    45d4:	3406           	move.w d6,d2
    45d6:	486a ffff      	pea -1(a2)
    45da:	2f02           	move.l d2,-(sp)
    45dc:	2f0b           	move.l a3,-(sp)
    45de:	4879 0001 745c 	pea 1745c <destlinezoom17>
    45e4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    45e6:	2f0a           	move.l a2,-(sp)
    45e8:	2f02           	move.l d2,-(sp)
    45ea:	486b 0030      	pea 48(a3)
    45ee:	4879 0001 745c 	pea 1745c <destlinezoom17>
    45f4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    45f6:	4646           	not.w d6
    45f8:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    45fa:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    45fe:	4fef 0020      	lea 32(sp),sp
    4602:	700b           	moveq #11,d0
    4604:	b08a           	cmp.l a2,d0
    4606:	66ca           	bne.s 45d2 <ZoomTest+0x2416>
    4608:	280c           	move.l a4,d4
    460a:	0684 0000 01e4 	addi.l #484,d4
    4610:	367c 000a      	movea.w #10,a3
    4614:	2a0a           	move.l a2,d5
    4616:	2444           	movea.l d4,a2
    4618:	280c           	move.l a4,d4
      TestRow( valsupposed, valactual, mask, 10+i*35);
    461a:	2f0b           	move.l a3,-(sp)
    461c:	3f06           	move.w d6,-(sp)
    461e:	4267           	clr.w -(sp)
    4620:	2f0a           	move.l a2,-(sp)
    4622:	4879 0001 745c 	pea 1745c <destlinezoom17>
    4628:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    462a:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    462e:	3e06           	move.w d6,d7
    4630:	4647           	not.w d7
    for(int i2=0;i2<17;i2++) {
    4632:	49eb 0001      	lea 1(a3),a4
    4636:	4fef 0010      	lea 16(sp),sp
    463a:	45ea 0690      	lea 1680(a2),a2
    463e:	260a           	move.l a2,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    4640:	7400           	moveq #0,d2
    4642:	3407           	move.w d7,d2
    4644:	2f0c           	move.l a4,-(sp)
    4646:	2f02           	move.l d2,-(sp)
    4648:	2f0e           	move.l a6,-(sp)
    464a:	4879 0001 745c 	pea 1745c <destlinezoom17>
    4650:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    4652:	486c 0001      	pea 1(a4)
    4656:	2f02           	move.l d2,-(sp)
    4658:	486e 0030      	pea 48(a6)
    465c:	4879 0001 745c 	pea 1745c <destlinezoom17>
    4662:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4664:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    4668:	4647           	not.w d7
    466a:	3c07           	move.w d7,d6
    466c:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    466e:	4fef 0020      	lea 32(sp),sp
    4672:	bdc3           	cmpa.l d3,a6
    4674:	66ca           	bne.s 4640 <ZoomTest+0x2484>
    4676:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    467a:	b6fc 00ff      	cmpa.w #255,a3
    467e:	669a           	bne.s 461a <ZoomTest+0x245e>
    4680:	2844           	movea.l d4,a4
    4682:	2445           	movea.l d5,a2
  TestRow( valsupposed, valactual, mask, 255);
    4684:	2f0b           	move.l a3,-(sp)
    4686:	3f07           	move.w d7,-(sp)
    4688:	4267           	clr.w -(sp)
    468a:	486c 2fd4      	pea 12244(a4)
    468e:	4879 0001 745c 	pea 1745c <destlinezoom17>
    4694:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    4696:	4dec 3004      	lea 12292(a4),a6
    469a:	4fef 0010      	lea 16(sp),sp
    469e:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    46a2:	2f0b           	move.l a3,-(sp)
    46a4:	2f02           	move.l d2,-(sp)
    46a6:	2f0e           	move.l a6,-(sp)
    46a8:	4879 0001 745c 	pea 1745c <destlinezoom17>
    46ae:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    46b0:	486b 0001      	pea 1(a3)
    46b4:	2f02           	move.l d2,-(sp)
    46b6:	486e 0030      	pea 48(a6)
    46ba:	4879 0001 745c 	pea 1745c <destlinezoom17>
    46c0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    46c2:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    46c4:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    46c8:	4fef 0020      	lea 32(sp),sp
    46cc:	b6fc 010e      	cmpa.w #270,a3
    46d0:	6736           	beq.s 4708 <ZoomTest+0x254c>
    46d2:	7400           	moveq #0,d2
    46d4:	3407           	move.w d7,d2
    46d6:	4647           	not.w d7
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    46d8:	2f0b           	move.l a3,-(sp)
    46da:	2f02           	move.l d2,-(sp)
    46dc:	2f0e           	move.l a6,-(sp)
    46de:	4879 0001 745c 	pea 1745c <destlinezoom17>
    46e4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    46e6:	486b 0001      	pea 1(a3)
    46ea:	2f02           	move.l d2,-(sp)
    46ec:	486e 0030      	pea 48(a6)
    46f0:	4879 0001 745c 	pea 1745c <destlinezoom17>
    46f6:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    46f8:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    46fa:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    46fe:	4fef 0020      	lea 32(sp),sp
    4702:	b6fc 010e      	cmpa.w #270,a3
    4706:	66ca           	bne.s 46d2 <ZoomTest+0x2516>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    4708:	4878 0001      	pea 1 <_start+0x1>
    470c:	4878 0011      	pea 11 <main+0xb>
    4710:	2f2f 0034      	move.l 52(sp),-(sp)
    4714:	2f0c           	move.l a4,-(sp)
    4716:	4eba c3e8      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    471a:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    4720:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    4724:	42a7           	clr.l -(sp)
    4726:	2f3c 0000 ffff 	move.l #65535,-(sp)
    472c:	2f2f 0048      	move.l 72(sp),-(sp)
    4730:	4879 0001 7430 	pea 17430 <destlinezoom18>
    4736:	4e95           	jsr (a5)
    4738:	4fef 0020      	lea 32(sp),sp
    473c:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    4740:	4242           	clr.w d2
    4742:	2c6f 0040      	movea.l 64(sp),a6
    4746:	282f 0034      	move.l 52(sp),d4
    474a:	2a2f 0044      	move.l 68(sp),d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    474e:	7600           	moveq #0,d3
    4750:	3602           	move.w d2,d3
    4752:	2f0b           	move.l a3,-(sp)
    4754:	2f03           	move.l d3,-(sp)
    4756:	2f0e           	move.l a6,-(sp)
    4758:	4879 0001 7430 	pea 17430 <destlinezoom18>
    475e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    4760:	486b 0001      	pea 1(a3)
    4764:	2f03           	move.l d3,-(sp)
    4766:	486e 0030      	pea 48(a6)
    476a:	4879 0001 7430 	pea 17430 <destlinezoom18>
    4770:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4772:	4642           	not.w d2
    4774:	200e           	move.l a6,d0
    4776:	0680 0000 0120 	addi.l #288,d0
    477c:	548b           	addq.l #2,a3
    477e:	2c44           	movea.l d4,a6
  for(int i2=0;i2<4;i2++) {
    4780:	4fef 0020      	lea 32(sp),sp
    4784:	7209           	moveq #9,d1
    4786:	b28b           	cmp.l a3,d1
    4788:	6740           	beq.s 47ca <ZoomTest+0x260e>
    478a:	2805           	move.l d5,d4
    478c:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    478e:	7600           	moveq #0,d3
    4790:	3602           	move.w d2,d3
    4792:	2f0b           	move.l a3,-(sp)
    4794:	2f03           	move.l d3,-(sp)
    4796:	2f0e           	move.l a6,-(sp)
    4798:	4879 0001 7430 	pea 17430 <destlinezoom18>
    479e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    47a0:	486b 0001      	pea 1(a3)
    47a4:	2f03           	move.l d3,-(sp)
    47a6:	486e 0030      	pea 48(a6)
    47aa:	4879 0001 7430 	pea 17430 <destlinezoom18>
    47b0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    47b2:	4642           	not.w d2
    47b4:	200e           	move.l a6,d0
    47b6:	0680 0000 0120 	addi.l #288,d0
    47bc:	548b           	addq.l #2,a3
    47be:	2c44           	movea.l d4,a6
  for(int i2=0;i2<4;i2++) {
    47c0:	4fef 0020      	lea 32(sp),sp
    47c4:	7209           	moveq #9,d1
    47c6:	b28b           	cmp.l a3,d1
    47c8:	66c0           	bne.s 478a <ZoomTest+0x25ce>
    47ca:	2f44 0034      	move.l d4,52(sp)
    47ce:	2f45 0044      	move.l d5,68(sp)
    47d2:	2644           	movea.l d4,a3
    47d4:	2805           	move.l d5,d4
    47d6:	2c4a           	movea.l a2,a6
    47d8:	2600           	move.l d0,d3
    47da:	7c24           	moveq #36,d6
    47dc:	dc8a           	add.l a2,d6
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    47de:	7a00           	moveq #0,d5
    47e0:	3a02           	move.w d2,d5
    47e2:	2f0e           	move.l a6,-(sp)
    47e4:	2f05           	move.l d5,-(sp)
    47e6:	2f0b           	move.l a3,-(sp)
    47e8:	4879 0001 7430 	pea 17430 <destlinezoom18>
    47ee:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    47f0:	486e 0001      	pea 1(a6)
    47f4:	2f05           	move.l d5,-(sp)
    47f6:	486b 0030      	pea 48(a3)
    47fa:	4879 0001 7430 	pea 17430 <destlinezoom18>
    4800:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    4802:	4642           	not.w d2
    4804:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    4806:	4fef 0020      	lea 32(sp),sp
    480a:	bc8e           	cmp.l a6,d6
    480c:	673e           	beq.s 484c <ZoomTest+0x2690>
    480e:	200b           	move.l a3,d0
    4810:	0680 0000 0120 	addi.l #288,d0
    4816:	2644           	movea.l d4,a3
    4818:	2803           	move.l d3,d4
    481a:	2600           	move.l d0,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    481c:	7a00           	moveq #0,d5
    481e:	3a02           	move.w d2,d5
    4820:	2f0e           	move.l a6,-(sp)
    4822:	2f05           	move.l d5,-(sp)
    4824:	2f0b           	move.l a3,-(sp)
    4826:	4879 0001 7430 	pea 17430 <destlinezoom18>
    482c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    482e:	486e 0001      	pea 1(a6)
    4832:	2f05           	move.l d5,-(sp)
    4834:	486b 0030      	pea 48(a3)
    4838:	4879 0001 7430 	pea 17430 <destlinezoom18>
    483e:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    4840:	4642           	not.w d2
    4842:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    4844:	4fef 0020      	lea 32(sp),sp
    4848:	bc8e           	cmp.l a6,d6
    484a:	66c2           	bne.s 480e <ZoomTest+0x2652>
    484c:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    4850:	b4fc 0100      	cmpa.w #256,a2
    4854:	6718           	beq.s 486e <ZoomTest+0x26b2>
    4856:	200b           	move.l a3,d0
    4858:	0680 0000 0120 	addi.l #288,d0
    485e:	2644           	movea.l d4,a3
    4860:	2803           	move.l d3,d4
  for(int i2=0;i2<4;i2++) {
    4862:	2c4a           	movea.l a2,a6
    4864:	2600           	move.l d0,d3
    4866:	7c24           	moveq #36,d6
    4868:	dc8a           	add.l a2,d6
    486a:	6000 ff72      	bra.w 47de <ZoomTest+0x2622>
    486e:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    4870:	7800           	moveq #0,d4
    4872:	3802           	move.w d2,d4
    4874:	2f0a           	move.l a2,-(sp)
    4876:	2f04           	move.l d4,-(sp)
    4878:	2f0b           	move.l a3,-(sp)
    487a:	4879 0001 7430 	pea 17430 <destlinezoom18>
    4880:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    4882:	486a 0001      	pea 1(a2)
    4886:	2f04           	move.l d4,-(sp)
    4888:	486b 0030      	pea 48(a3)
    488c:	4879 0001 7430 	pea 17430 <destlinezoom18>
    4892:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4894:	4642           	not.w d2
    4896:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    4898:	4fef 0020      	lea 32(sp),sp
    489c:	b4fc 0108      	cmpa.w #264,a2
    48a0:	673e           	beq.s 48e0 <ZoomTest+0x2724>
    48a2:	200b           	move.l a3,d0
    48a4:	0680 0000 00c0 	addi.l #192,d0
    48aa:	2643           	movea.l d3,a3
    48ac:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    48ae:	7800           	moveq #0,d4
    48b0:	3802           	move.w d2,d4
    48b2:	2f0a           	move.l a2,-(sp)
    48b4:	2f04           	move.l d4,-(sp)
    48b6:	2f0b           	move.l a3,-(sp)
    48b8:	4879 0001 7430 	pea 17430 <destlinezoom18>
    48be:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    48c0:	486a 0001      	pea 1(a2)
    48c4:	2f04           	move.l d4,-(sp)
    48c6:	486b 0030      	pea 48(a3)
    48ca:	4879 0001 7430 	pea 17430 <destlinezoom18>
    48d0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    48d2:	4642           	not.w d2
    48d4:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    48d6:	4fef 0020      	lea 32(sp),sp
    48da:	b4fc 0108      	cmpa.w #264,a2
    48de:	66c2           	bne.s 48a2 <ZoomTest+0x26e6>
  TestRow( valsupposed, valactual, mask, 0);
    48e0:	42a7           	clr.l -(sp)
    48e2:	3f02           	move.w d2,-(sp)
    48e4:	4267           	clr.w -(sp)
    48e6:	2f03           	move.l d3,-(sp)
    48e8:	4879 0001 7430 	pea 17430 <destlinezoom18>
    48ee:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    48f0:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    48f6:	224c           	movea.l a4,a1
    48f8:	203c 0000 3740 	move.l #14144,d0
    48fe:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    4902:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4908:	226f 003c      	movea.l 60(sp),a1
    490c:	203c 0000 3740 	move.l #14144,d0
    4912:	4eae ff2e      	jsr -210(a6)
    4916:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    491a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4920:	203c 0001 1440 	move.l #70720,d0
    4926:	7202           	moveq #2,d1
    4928:	4eae ff3a      	jsr -198(a6)
    492c:	2f40 0030      	move.l d0,48(sp)
  if( source == 0) {
    4930:	6700 038a      	beq.w 4cbc <ZoomTest+0x2b00>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    4934:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    493a:	203c 0001 1440 	move.l #70720,d0
    4940:	7202           	moveq #2,d1
    4942:	4eae ff3a      	jsr -198(a6)
    4946:	2f40 0034      	move.l d0,52(sp)
  if( destination == 0) {
    494a:	6700 03dc      	beq.w 4d28 <ZoomTest+0x2b6c>
    494e:	242f 0030      	move.l 48(sp),d2
    4952:	0682 0000 ff00 	addi.l #65280,d2
    4958:	246f 0030      	movea.l 48(sp),a2
    495c:	4878 00f0      	pea f0 <main+0xea>
    4960:	4878 0055      	pea 55 <main+0x4f>
    4964:	2f0a           	move.l a2,-(sp)
    4966:	4eba 047a      	jsr 4de2 <memset>(pc)
    496a:	4878 00f0      	pea f0 <main+0xea>
    496e:	4878 00aa      	pea aa <main+0xa4>
    4972:	486a 00f0      	pea 240(a2)
    4976:	4eba 046a      	jsr 4de2 <memset>(pc)
    497a:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    497e:	4fef 0018      	lea 24(sp),sp
    4982:	b5c2           	cmpa.l d2,a2
    4984:	66d6           	bne.s 495c <ZoomTest+0x27a0>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    4986:	4878 0005      	pea 5 <_start+0x5>
    498a:	42a7           	clr.l -(sp)
    498c:	2f2f 003c      	move.l 60(sp),-(sp)
    4990:	2f2f 003c      	move.l 60(sp),-(sp)
    4994:	4eba c16a      	jsr b00 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    4998:	2c79 0001 77bc 	movea.l 177bc <GfxBase>,a6
    499e:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    49a2:	202f 0044      	move.l 68(sp),d0
    49a6:	0680 0000 11d4 	addi.l #4564,d0
    49ac:	2f40 003c      	move.l d0,60(sp)
    49b0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    49b4:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    49b6:	7eff           	moveq #-1,d7
    49b8:	4bfa bd8a      	lea 744 <TestRow>(pc),a5
    49bc:	41ef 0078      	lea 120(sp),a0
    49c0:	2f48 0048      	move.l a0,72(sp)
    49c4:	2f4d 0040      	move.l a5,64(sp)
    49c8:	2a46           	movea.l d6,a5
    49ca:	282f 002c      	move.l 44(sp),d4
    49ce:	0684 ffff ef4a 	addi.l #-4278,d4
    49d4:	3c0d           	move.w a5,d6
    49d6:	0646 ffee      	addi.w #-18,d6
    49da:	307c 002a      	movea.w #42,a0
    49de:	d1ef 002c      	adda.l 44(sp),a0
    49e2:	2f48 0044      	move.l a0,68(sp)
    49e6:	2f4d 003c      	move.l a5,60(sp)
    49ea:	2844           	movea.l d4,a4
    49ec:	49ec ff10      	lea -240(a4),a4
    49f0:	41ec ffd6      	lea -42(a4),a0
    49f4:	2f48 0038      	move.l a0,56(sp)
  char str[ 100] = { 0 };
    49f8:	4878 0064      	pea 64 <main+0x5e>
    49fc:	42a7           	clr.l -(sp)
    49fe:	486f 0080      	pea 128(sp)
    4a02:	4eba 03de      	jsr 4de2 <memset>(pc)
  data[1] = numberofline;
    4a06:	3f46 0082      	move.w d6,130(sp)
    4a0a:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    4a0e:	7a00           	moveq #0,d5
  testpattern += 0;
    4a10:	4bf9 0001 771c 	lea 1771c <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    4a16:	301d           	move.w (a5)+,d0
    4a18:	bf40           	eor.w d7,d0
    4a1a:	206f 0038      	movea.l 56(sp),a0
    4a1e:	54af 0038      	addq.l #2,56(sp)
    4a22:	b058           	cmp.w (a0)+,d0
    4a24:	673c           	beq.s 4a62 <ZoomTest+0x28a6>
      data[0] = i;
    4a26:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    4a2a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4a30:	41f9 0001 5699 	lea 15699 <incbin_startimage_end+0x1>,a0
    4a36:	43ef 0074      	lea 116(sp),a1
    4a3a:	45f9 0000 4fd0 	lea 4fd0 <PutChar>,a2
    4a40:	47ef 0078      	lea 120(sp),a3
    4a44:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    4a48:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4a4e:	4eae ffc4      	jsr -60(a6)
    4a52:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4a58:	2200           	move.l d0,d1
    4a5a:	240b           	move.l a3,d2
    4a5c:	7664           	moveq #100,d3
    4a5e:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    4a62:	5285           	addq.l #1,d5
    4a64:	bbfc 0001 7746 	cmpa.l #96070,a5
    4a6a:	66aa           	bne.s 4a16 <ZoomTest+0x285a>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    4a6c:	3039 0001 7746 	move.w 17746 <destlinezoom1+0x2a>,d0
    4a72:	bf40           	eor.w d7,d0
    4a74:	3214           	move.w (a4),d1
    4a76:	b340           	eor.w d1,d0
    4a78:	0240 ff00      	andi.w #-256,d0
    4a7c:	6600 00b4      	bne.w 4b32 <ZoomTest+0x2976>
        valactual += ZMLINESIZE/2;
    4a80:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    4a84:	b9c4           	cmpa.l d4,a4
    4a86:	6600 ff68      	bne.w 49f0 <ZoomTest+0x2834>
      mask = mask ^ 0xffff;
    4a8a:	4647           	not.w d7
    4a8c:	0684 0000 00f0 	addi.l #240,d4
    4a92:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    4a94:	b8af 0044      	cmp.l 68(sp),d4
    4a98:	6600 ff50      	bne.w 49ea <ZoomTest+0x282e>
    4a9c:	2a6f 003c      	movea.l 60(sp),a5
    4aa0:	246f 002c      	movea.l 44(sp),a2
    4aa4:	45ea ff10      	lea -240(a2),a2
    4aa8:	7600           	moveq #0,d3
    4aaa:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    4aac:	2f0d           	move.l a5,-(sp)
    4aae:	2f03           	move.l d3,-(sp)
    4ab0:	2f0a           	move.l a2,-(sp)
    4ab2:	4879 0001 771c 	pea 1771c <destlinezoom1>
    4ab8:	206f 0050      	movea.l 80(sp),a0
    4abc:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    4abe:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    4ac2:	4fef 0010      	lea 16(sp),sp
    4ac6:	b5ef 002c      	cmpa.l 44(sp),a2
    4aca:	66e0           	bne.s 4aac <ZoomTest+0x28f0>
    4acc:	45ea 11d0      	lea 4560(a2),a2
    4ad0:	2f4a 002c      	move.l a2,44(sp)
    4ad4:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    4ad8:	bafc 011c      	cmpa.w #284,a5
    4adc:	6600 feec      	bne.w 49ca <ZoomTest+0x280e>
    4ae0:	2a6f 0040      	movea.l 64(sp),a5
    4ae4:	246f 0034      	movea.l 52(sp),a2
    4ae8:	d5fc 0000 f964 	adda.l #63844,a2
    4aee:	243c 0000 0109 	move.l #265,d2
    4af4:	280a           	move.l a2,d4
    4af6:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    4afc:	2f02           	move.l d2,-(sp)
    4afe:	2f03           	move.l d3,-(sp)
    4b00:	2f0a           	move.l a2,-(sp)
    4b02:	4879 0001 771c 	pea 1771c <destlinezoom1>
    4b08:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    4b0a:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    4b0e:	4fef 0010      	lea 16(sp),sp
    4b12:	b88a           	cmp.l a2,d4
    4b14:	66e6           	bne.s 4afc <ZoomTest+0x2940>
    mask = mask ^ 0xffff;
    4b16:	4647           	not.w d7
    4b18:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    4b1a:	0c82 0000 010d 	cmpi.l #269,d2
    4b20:	6700 009e      	beq.w 4bc0 <ZoomTest+0x2a04>
    4b24:	7600           	moveq #0,d3
    4b26:	3607           	move.w d7,d3
    4b28:	280a           	move.l a2,d4
    4b2a:	0684 0000 00f0 	addi.l #240,d4
    4b30:	60ca           	bra.s 4afc <ZoomTest+0x2940>
    data[0] = 21;
    4b32:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    4b38:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4b3e:	41f9 0001 5699 	lea 15699 <incbin_startimage_end+0x1>,a0
    4b44:	43ef 0074      	lea 116(sp),a1
    4b48:	45f9 0000 4fd0 	lea 4fd0 <PutChar>,a2
    4b4e:	47ef 0078      	lea 120(sp),a3
    4b52:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    4b56:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4b5c:	4eae ffc4      	jsr -60(a6)
    4b60:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4b66:	2200           	move.l d0,d1
    4b68:	240b           	move.l a3,d2
    4b6a:	7664           	moveq #100,d3
    4b6c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    4b70:	7000           	moveq #0,d0
    4b72:	3014           	move.w (a4),d0
    4b74:	2f00           	move.l d0,-(sp)
    4b76:	3039 0001 7746 	move.w 17746 <destlinezoom1+0x2a>,d0
    4b7c:	2f00           	move.l d0,-(sp)
    4b7e:	4879 0001 56c9 	pea 156c9 <incbin_startimage_end+0x31>
    4b84:	4eba bb56      	jsr 6dc <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    4b88:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    4b8c:	4fef 000c      	lea 12(sp),sp
    4b90:	b9c4           	cmpa.l d4,a4
    4b92:	6700 fef6      	beq.w 4a8a <ZoomTest+0x28ce>
    4b96:	41ec ffd6      	lea -42(a4),a0
    4b9a:	2f48 0038      	move.l a0,56(sp)
  char str[ 100] = { 0 };
    4b9e:	4878 0064      	pea 64 <main+0x5e>
    4ba2:	42a7           	clr.l -(sp)
    4ba4:	486f 0080      	pea 128(sp)
    4ba8:	4eba 0238      	jsr 4de2 <memset>(pc)
  data[1] = numberofline;
    4bac:	3f46 0082      	move.w d6,130(sp)
    4bb0:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    4bb4:	7a00           	moveq #0,d5
  testpattern += 0;
    4bb6:	4bf9 0001 771c 	lea 1771c <destlinezoom1>,a5
    4bbc:	6000 fe58      	bra.w 4a16 <ZoomTest+0x285a>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    4bc0:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4bc6:	226f 0030      	movea.l 48(sp),a1
    4bca:	203c 0001 1440 	move.l #70720,d0
    4bd0:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    4bd4:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4bda:	226f 0034      	movea.l 52(sp),a1
    4bde:	203c 0001 1440 	move.l #70720,d0
    4be4:	4eae ff2e      	jsr -210(a6)
}
    4be8:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4bec:	4fef 00b0      	lea 176(sp),sp
    4bf0:	4e75           	rts
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    4bf2:	4878 0036      	pea 36 <main+0x30>
    4bf6:	4879 0001 7194 	pea 17194 <Cl102ZoomTest+0x78>
    4bfc:	4878 0067      	pea 67 <main+0x61>
    4c00:	2f02           	move.l d2,-(sp)
    4c02:	4e92           	jsr (a2)
    4c04:	4fef 0010      	lea 16(sp),sp
    4c08:	4a80           	tst.l d0
    4c0a:	6700 daae      	beq.w 26ba <ZoomTest+0x4fe>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    4c0e:	4878 001c      	pea 1c <main+0x16>
    4c12:	4879 0001 7274 	pea 17274 <Cl102ZoomTest+0x158>
    4c18:	4878 009f      	pea 9f <main+0x99>
    4c1c:	2f02           	move.l d2,-(sp)
    4c1e:	4e92           	jsr (a2)
    4c20:	4fef 0010      	lea 16(sp),sp
    4c24:	4a80           	tst.l d0
    4c26:	6600 dab0      	bne.w 26d8 <ZoomTest+0x51c>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    4c2a:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4c30:	4eae ffc4      	jsr -60(a6)
    4c34:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4c3a:	2200           	move.l d0,d1
    4c3c:	243c 0001 5937 	move.l #88375,d2
    4c42:	7625           	moveq #37,d3
    4c44:	4eae ffd0      	jsr -48(a6)
    4c48:	6000 da8e      	bra.w 26d8 <ZoomTest+0x51c>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    4c4c:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4c52:	4eae ffc4      	jsr -60(a6)
    4c56:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4c5c:	2200           	move.l d0,d1
    4c5e:	243c 0001 5a1c 	move.l #88604,d2
    4c64:	7635           	moveq #53,d3
    4c66:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    4c6a:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4c70:	203c 0000 3740 	move.l #14144,d0
    4c76:	7202           	moveq #2,d1
    4c78:	4eae ff3a      	jsr -198(a6)
    4c7c:	2f40 002c      	move.l d0,44(sp)
  if( source == 0) {
    4c80:	6600 de7e      	bne.w 2b00 <ZoomTest+0x944>
    Write(  Output(), 
    4c84:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4c8a:	4eae ffc4      	jsr -60(a6)
    4c8e:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4c94:	2200           	move.l d0,d1
    4c96:	243c 0001 5a93 	move.l #88723,d2
    4c9c:	7639           	moveq #57,d3
    4c9e:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    4ca2:	2c79 0001 77c4 	movea.l 177c4 <SysBase>,a6
    4ca8:	203c 0001 1440 	move.l #70720,d0
    4cae:	7202           	moveq #2,d1
    4cb0:	4eae ff3a      	jsr -198(a6)
    4cb4:	2f40 0030      	move.l d0,48(sp)
  if( source == 0) {
    4cb8:	6600 fc7a      	bne.w 4934 <ZoomTest+0x2778>
    Write(  Output(), 
    4cbc:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4cc2:	4eae ffc4      	jsr -60(a6)
    4cc6:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4ccc:	2200           	move.l d0,d1
    4cce:	243c 0001 5a93 	move.l #88723,d2
    4cd4:	7639           	moveq #57,d3
    4cd6:	4eae ffd0      	jsr -48(a6)
}
    4cda:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4cde:	4fef 00b0      	lea 176(sp),sp
    4ce2:	4e75           	rts
    Write(  Output(), 
    4ce4:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4cea:	4eae ffc4      	jsr -60(a6)
    4cee:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4cf4:	2200           	move.l d0,d1
    4cf6:	243c 0001 598f 	move.l #88463,d2
    4cfc:	7636           	moveq #54,d3
    4cfe:	4eae ffd0      	jsr -48(a6)
    return;
    4d02:	6000 db9c      	bra.w 28a0 <ZoomTest+0x6e4>
    Write(  Output(), 
    4d06:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4d0c:	4eae ffc4      	jsr -60(a6)
    4d10:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4d16:	2200           	move.l d0,d1
    4d18:	243c 0001 5acd 	move.l #88781,d2
    4d1e:	763d           	moveq #61,d3
    4d20:	4eae ffd0      	jsr -48(a6)
    return;
    4d24:	6000 fbf4      	bra.w 491a <ZoomTest+0x275e>
    Write(  Output(), 
    4d28:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4d2e:	4eae ffc4      	jsr -60(a6)
    4d32:	2c79 0001 77c0 	movea.l 177c0 <DOSBase>,a6
    4d38:	2200           	move.l d0,d1
    4d3a:	243c 0001 5acd 	move.l #88781,d2
    4d40:	763d           	moveq #61,d3
    4d42:	4eae ffd0      	jsr -48(a6)
}
    4d46:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4d4a:	4fef 00b0      	lea 176(sp),sp
    4d4e:	4e75           	rts

00004d50 <memcpy>:
{
    4d50:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4d54:	202f 0014      	move.l 20(sp),d0
    4d58:	226f 0018      	movea.l 24(sp),a1
    4d5c:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4d60:	2601           	move.l d1,d3
    4d62:	5383           	subq.l #1,d3
    4d64:	4a81           	tst.l d1
    4d66:	6762           	beq.s 4dca <memcpy+0x7a>
    4d68:	2040           	movea.l d0,a0
    4d6a:	5888           	addq.l #4,a0
    4d6c:	b1c9           	cmpa.l a1,a0
    4d6e:	53c2           	sl.s d2
    4d70:	4402           	neg.b d2
    4d72:	41e9 0004      	lea 4(a1),a0
    4d76:	b1c0           	cmpa.l d0,a0
    4d78:	53c4           	sl.s d4
    4d7a:	4404           	neg.b d4
    4d7c:	8404           	or.b d4,d2
    4d7e:	7808           	moveq #8,d4
    4d80:	b883           	cmp.l d3,d4
    4d82:	55c4           	sc.s d4
    4d84:	4404           	neg.b d4
    4d86:	c404           	and.b d4,d2
    4d88:	6746           	beq.s 4dd0 <memcpy+0x80>
    4d8a:	2409           	move.l a1,d2
    4d8c:	8480           	or.l d0,d2
    4d8e:	7803           	moveq #3,d4
    4d90:	c484           	and.l d4,d2
    4d92:	663c           	bne.s 4dd0 <memcpy+0x80>
    4d94:	2049           	movea.l a1,a0
    4d96:	2440           	movea.l d0,a2
    4d98:	74fc           	moveq #-4,d2
    4d9a:	c481           	and.l d1,d2
    4d9c:	d489           	add.l a1,d2
		*d++ = *s++;
    4d9e:	24d8           	move.l (a0)+,(a2)+
    4da0:	b488           	cmp.l a0,d2
    4da2:	66fa           	bne.s 4d9e <memcpy+0x4e>
    4da4:	74fc           	moveq #-4,d2
    4da6:	c481           	and.l d1,d2
    4da8:	2040           	movea.l d0,a0
    4daa:	d1c2           	adda.l d2,a0
    4dac:	d3c2           	adda.l d2,a1
    4dae:	9682           	sub.l d2,d3
    4db0:	b481           	cmp.l d1,d2
    4db2:	6716           	beq.s 4dca <memcpy+0x7a>
    4db4:	1091           	move.b (a1),(a0)
	while(len--)
    4db6:	4a83           	tst.l d3
    4db8:	6710           	beq.s 4dca <memcpy+0x7a>
		*d++ = *s++;
    4dba:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    4dc0:	5383           	subq.l #1,d3
    4dc2:	6706           	beq.s 4dca <memcpy+0x7a>
		*d++ = *s++;
    4dc4:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4dca:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    4dce:	4e75           	rts
    4dd0:	2040           	movea.l d0,a0
    4dd2:	d289           	add.l a1,d1
		*d++ = *s++;
    4dd4:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4dd6:	b289           	cmp.l a1,d1
    4dd8:	67f0           	beq.s 4dca <memcpy+0x7a>
		*d++ = *s++;
    4dda:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4ddc:	b289           	cmp.l a1,d1
    4dde:	66f4           	bne.s 4dd4 <memcpy+0x84>
    4de0:	60e8           	bra.s 4dca <memcpy+0x7a>

00004de2 <memset>:
{
    4de2:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    4de6:	202f 0024      	move.l 36(sp),d0
    4dea:	2a2f 0028      	move.l 40(sp),d5
    4dee:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    4df2:	2809           	move.l a1,d4
    4df4:	5384           	subq.l #1,d4
    4df6:	b2fc 0000      	cmpa.w #0,a1
    4dfa:	6f00 00b0      	ble.w 4eac <memset+0xca>
    4dfe:	1e05           	move.b d5,d7
    4e00:	2200           	move.l d0,d1
    4e02:	4481           	neg.l d1
    4e04:	7403           	moveq #3,d2
    4e06:	c282           	and.l d2,d1
    4e08:	7c05           	moveq #5,d6
		*ptr++ = val;
    4e0a:	2440           	movea.l d0,a2
    4e0c:	bc84           	cmp.l d4,d6
    4e0e:	646a           	bcc.s 4e7a <memset+0x98>
    4e10:	4a81           	tst.l d1
    4e12:	6724           	beq.s 4e38 <memset+0x56>
    4e14:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4e16:	5384           	subq.l #1,d4
    4e18:	7401           	moveq #1,d2
    4e1a:	b481           	cmp.l d1,d2
    4e1c:	671a           	beq.s 4e38 <memset+0x56>
		*ptr++ = val;
    4e1e:	2440           	movea.l d0,a2
    4e20:	548a           	addq.l #2,a2
    4e22:	2040           	movea.l d0,a0
    4e24:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4e28:	5384           	subq.l #1,d4
    4e2a:	7403           	moveq #3,d2
    4e2c:	b481           	cmp.l d1,d2
    4e2e:	6608           	bne.s 4e38 <memset+0x56>
		*ptr++ = val;
    4e30:	528a           	addq.l #1,a2
    4e32:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4e36:	5384           	subq.l #1,d4
    4e38:	2609           	move.l a1,d3
    4e3a:	9681           	sub.l d1,d3
    4e3c:	7c00           	moveq #0,d6
    4e3e:	1c05           	move.b d5,d6
    4e40:	2406           	move.l d6,d2
    4e42:	4842           	swap d2
    4e44:	4242           	clr.w d2
    4e46:	2042           	movea.l d2,a0
    4e48:	2406           	move.l d6,d2
    4e4a:	e14a           	lsl.w #8,d2
    4e4c:	4842           	swap d2
    4e4e:	4242           	clr.w d2
    4e50:	e18e           	lsl.l #8,d6
    4e52:	2646           	movea.l d6,a3
    4e54:	2c08           	move.l a0,d6
    4e56:	8486           	or.l d6,d2
    4e58:	2c0b           	move.l a3,d6
    4e5a:	8486           	or.l d6,d2
    4e5c:	1407           	move.b d7,d2
    4e5e:	2040           	movea.l d0,a0
    4e60:	d1c1           	adda.l d1,a0
    4e62:	72fc           	moveq #-4,d1
    4e64:	c283           	and.l d3,d1
    4e66:	d288           	add.l a0,d1
		*ptr++ = val;
    4e68:	20c2           	move.l d2,(a0)+
    4e6a:	b1c1           	cmpa.l d1,a0
    4e6c:	66fa           	bne.s 4e68 <memset+0x86>
    4e6e:	72fc           	moveq #-4,d1
    4e70:	c283           	and.l d3,d1
    4e72:	d5c1           	adda.l d1,a2
    4e74:	9881           	sub.l d1,d4
    4e76:	b283           	cmp.l d3,d1
    4e78:	6732           	beq.s 4eac <memset+0xca>
    4e7a:	1485           	move.b d5,(a2)
	while(len-- > 0)
    4e7c:	4a84           	tst.l d4
    4e7e:	6f2c           	ble.s 4eac <memset+0xca>
		*ptr++ = val;
    4e80:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4e84:	7201           	moveq #1,d1
    4e86:	b284           	cmp.l d4,d1
    4e88:	6c22           	bge.s 4eac <memset+0xca>
		*ptr++ = val;
    4e8a:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    4e8e:	7402           	moveq #2,d2
    4e90:	b484           	cmp.l d4,d2
    4e92:	6c18           	bge.s 4eac <memset+0xca>
		*ptr++ = val;
    4e94:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    4e98:	7c03           	moveq #3,d6
    4e9a:	bc84           	cmp.l d4,d6
    4e9c:	6c0e           	bge.s 4eac <memset+0xca>
		*ptr++ = val;
    4e9e:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    4ea2:	7204           	moveq #4,d1
    4ea4:	b284           	cmp.l d4,d1
    4ea6:	6c04           	bge.s 4eac <memset+0xca>
		*ptr++ = val;
    4ea8:	1545 0005      	move.b d5,5(a2)
}
    4eac:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    4eb0:	4e75           	rts

00004eb2 <strlen>:
{
    4eb2:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    4eb6:	7000           	moveq #0,d0
	while(*s++)
    4eb8:	4a10           	tst.b (a0)
    4eba:	6708           	beq.s 4ec4 <strlen+0x12>
		t++;
    4ebc:	5280           	addq.l #1,d0
	while(*s++)
    4ebe:	4a30 0800      	tst.b (0,a0,d0.l)
    4ec2:	66f8           	bne.s 4ebc <strlen+0xa>
}
    4ec4:	4e75           	rts
    4ec6:	4e71           	nop

00004ec8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4ec8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4ecc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4ed0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4ed4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    4ed8:	d041           	add.w d1,d0
	swap	d0
    4eda:	4840           	swap d0
	clrw	d0
    4edc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    4ede:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    4ee2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    4ee6:	d081           	add.l d1,d0

	rts
    4ee8:	4e75           	rts

00004eea <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    4eea:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    4eec:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    4ef0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4ef4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4efa:	6416           	bcc.s 4f12 <__udivsi3+0x28>
	movel	d0, d2
    4efc:	2400           	move.l d0,d2
	clrw	d2
    4efe:	4242           	clr.w d2
	swap	d2
    4f00:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    4f02:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4f04:	3002           	move.w d2,d0
	swap	d0
    4f06:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4f08:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4f0c:	84c1           	divu.w d1,d2
	movew	d2, d0
    4f0e:	3002           	move.w d2,d0
	jra	6f
    4f10:	6030           	bra.s 4f42 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4f12:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4f14:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4f16:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4f18:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    4f1e:	64f4           	bcc.s 4f14 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4f20:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    4f22:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4f28:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    4f2a:	c2c0           	mulu.w d0,d1
	swap	d2
    4f2c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    4f2e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4f30:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    4f32:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4f34:	660a           	bne.s 4f40 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4f36:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4f38:	6506           	bcs.s 4f40 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    4f3a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    4f3e:	6302           	bls.s 4f42 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4f40:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    4f42:	241f           	move.l (sp)+,d2
	rts
    4f44:	4e75           	rts

00004f46 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    4f46:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4f48:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    4f4a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    4f4e:	6a04           	bpl.s 4f54 <__divsi3+0xe>
	negl	d1
    4f50:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    4f52:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4f54:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4f58:	6a04           	bpl.s 4f5e <__divsi3+0x18>
	negl	d0
    4f5a:	4480           	neg.l d0
	negb	d2
    4f5c:	4402           	neg.b d2

2:	movel	d1, sp@-
    4f5e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4f60:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    4f62:	6186           	bsr.s 4eea <__udivsi3>
	addql	IMM (8), sp
    4f64:	508f           	addq.l #8,sp

	tstb	d2
    4f66:	4a02           	tst.b d2
	jpl	3f
    4f68:	6a02           	bpl.s 4f6c <__divsi3+0x26>
	negl	d0
    4f6a:	4480           	neg.l d0

3:	movel	sp@+, d2
    4f6c:	241f           	move.l (sp)+,d2
	rts
    4f6e:	4e75           	rts

00004f70 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4f70:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4f74:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4f78:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4f7a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    4f7c:	61c8           	bsr.s 4f46 <__divsi3>
	addql	IMM (8), sp
    4f7e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4f80:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4f84:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4f86:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4f88:	6100 ff3e      	bsr.w 4ec8 <__mulsi3>
	addql	IMM (8), sp
    4f8c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4f8e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4f92:	9280           	sub.l d0,d1
	movel	d1, d0
    4f94:	2001           	move.l d1,d0
	rts
    4f96:	4e75           	rts

00004f98 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4f98:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4f9c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4fa0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4fa2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4fa4:	6100 ff44      	bsr.w 4eea <__udivsi3>
	addql	IMM (8), sp
    4fa8:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4faa:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4fae:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4fb0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4fb2:	6100 ff14      	bsr.w 4ec8 <__mulsi3>
	addql	IMM (8), sp
    4fb6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    4fb8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4fbc:	9280           	sub.l d0,d1
	movel	d1, d0
    4fbe:	2001           	move.l d1,d0
	rts
    4fc0:	4e75           	rts

00004fc2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    4fc2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    4fc4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4fc8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4fcc:	2c5f           	movea.l (sp)+,a6
    rts
    4fce:	4e75           	rts

00004fd0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    4fd0:	16c0           	move.b d0,(a3)+
	rts
    4fd2:	4e75           	rts

00004fd4 <saveregs>:
	...

00005010 <font2distance>:
    5010:	0505           	btst d2,d5
    5012:	0505           	btst d2,d5
    5014:	0505           	btst d2,d5
    5016:	0505           	btst d2,d5
    5018:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    501a:	0505           	btst d2,d5
    501c:	0505           	btst d2,d5
    501e:	0005 0505      	ori.b #5,d5
    5022:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    5024:	0505           	btst d2,d5
    5026:	0505           	btst d2,d5
    5028:	0505           	btst d2,d5
    502a:	0505           	btst d2,d5
    502c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    502e:	0505           	btst d2,d5
    5030:	0505           	btst d2,d5
    5032:	0505           	btst d2,d5
    5034:	0505           	btst d2,d5
    5036:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    5038:	0500           	btst d2,d0
    503a:	0505           	btst d2,d5
    503c:	0505           	btst d2,d5
    503e:	0505           	btst d2,d5
    5040:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    5042:	0505           	btst d2,d5
    5044:	0505           	btst d2,d5
    5046:	0505           	btst d2,d5
    5048:	0505           	btst d2,d5
    504a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    504c:	0505           	btst d2,d5
    504e:	0505           	btst d2,d5
    5050:	0503           	btst d2,d3
    5052:	0505           	btst d2,d5
    5054:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    5056:	0505           	btst d2,d5
    5058:	0500           	btst d2,d0
    505a:	0505           	btst d2,d5
    505c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    5060:	0505           	btst d2,d5
    5062:	0503           	btst d2,d3
    5064:	0205 0507      	andi.b #7,d5
    5068:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    506a:	0505           	btst d2,d5
    506c:	0505           	btst d2,d5
    506e:	0505           	btst d2,d5
    5070:	0505           	btst d2,d5
    5072:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    5074:	0505           	btst d2,d5
    5076:	0505           	btst d2,d5
    5078:	0505           	btst d2,d5
    507a:	0505           	btst d2,d5
    507c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    507e:	0505           	btst d2,d5
    5080:	0505           	btst d2,d5
    5082:	0505           	btst d2,d5
    5084:	0505           	btst d2,d5
    5086:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    5088:	0505           	btst d2,d5
    508a:	0505           	btst d2,d5
    508c:	0505           	btst d2,d5
    508e:	0505           	btst d2,d5
    5090:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    5092:	0505           	btst d2,d5
    5094:	0505           	btst d2,d5
    5096:	0505           	btst d2,d5
    5098:	0505           	btst d2,d5
    509a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    509c:	0505           	btst d2,d5
    509e:	0505           	btst d2,d5
    50a0:	0505           	btst d2,d5
    50a2:	0505           	btst d2,d5
    50a4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50a6:	0505           	btst d2,d5
    50a8:	0505           	btst d2,d5
    50aa:	0505           	btst d2,d5
    50ac:	0505           	btst d2,d5
    50ae:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50b0:	0505           	btst d2,d5
    50b2:	0505           	btst d2,d5
    50b4:	0505           	btst d2,d5
    50b6:	0505           	btst d2,d5
    50b8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50ba:	0505           	btst d2,d5
    50bc:	0505           	btst d2,d5
    50be:	0505           	btst d2,d5
    50c0:	0505           	btst d2,d5
    50c2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50c4:	0505           	btst d2,d5
    50c6:	0505           	btst d2,d5
    50c8:	0505           	btst d2,d5
    50ca:	0505           	btst d2,d5
    50cc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50ce:	0505           	btst d2,d5
    50d0:	0505           	btst d2,d5
    50d2:	0505           	btst d2,d5
    50d4:	0505           	btst d2,d5
    50d6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50d8:	0505           	btst d2,d5
    50da:	0505           	btst d2,d5
    50dc:	0505           	btst d2,d5
    50de:	0505           	btst d2,d5
    50e0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50e2:	0505           	btst d2,d5
    50e4:	0505           	btst d2,d5
    50e6:	0505           	btst d2,d5
    50e8:	0505           	btst d2,d5
    50ea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50ec:	0505           	btst d2,d5
    50ee:	0505           	btst d2,d5
    50f0:	0505           	btst d2,d5
    50f2:	0505           	btst d2,d5
    50f4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    50f6:	0505           	btst d2,d5
    50f8:	0505           	btst d2,d5
    50fa:	0505           	btst d2,d5
    50fc:	0505           	btst d2,d5
    50fe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    5100:	0505           	btst d2,d5
    5102:	0505           	btst d2,d5
    5104:	0505           	btst d2,d5
    5106:	0505           	btst d2,d5
    5108:	0505           	btst d2,d5

0000510a <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    510a:	16c0           	move.b d0,(a3)+
  RTS
    510c:	4e75           	rts

0000510e <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    510e:	48f9 7fff 0000 	movem.l d0-a6,4fd4 <saveregs>
    5114:	4fd4 
  lea 0xdff000,a5
    5116:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd6d80>,a5
  move.l sp@(4),a0  //Fontlocation
    511c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    5120:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    5124:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    5128:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    512a:	082d 0006 0002 	btst #6,2(a5)

00005130 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    5130:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    5136:	66f8           	bne.s 5130 <st2wblit>

00005138 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    5138:	7019           	moveq #25,d0
	sub.l d5,d5      
    513a:	9a85           	sub.l d5,d5

0000513c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    513c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    513e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    5140:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    5144:	9dce           	suba.l a6,a6
	move.l d2, a6
    5146:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    5148:	ddfc 0000 5010 	adda.l #20496,a6

	LSL  	#4,d2 	    //Fetch next char
    514e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    5150:	2842           	movea.l d2,a4


	move.l  #0,d4
    5152:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    5154:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    5156:	3814           	move.w (a4),d4
	swap	d4
    5158:	4844           	swap d4
	lsr.l	d5, d4
    515a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    515c:	8993           	or.l d4,(a3)
	clr.l	d4
    515e:	4284           	clr.l d4
	move.w  2(a4), d4
    5160:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    5164:	4844           	swap d4
	lsr.l	d5, d4
    5166:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    5168:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    516c:	4284           	clr.l d4
	move.w  4(a4), d4
    516e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    5172:	4844           	swap d4
	lsr.l	d5, d4
    5174:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    5176:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    517a:	4284           	clr.l d4
	move.w  6(a4), d4
    517c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    5180:	4844           	swap d4
	lsr.l	d5, d4
    5182:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    5184:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    5188:	4284           	clr.l d4
	move.w  8(a4), d4
    518a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    518e:	4844           	swap d4
	lsr.l	d5, d4
    5190:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    5192:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    5196:	4284           	clr.l d4
	move.w  10(a4), d4
    5198:	382c 000a      	move.w 10(a4),d4
	swap	d4
    519c:	4844           	swap d4
	lsr.l	d5, d4
    519e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    51a0:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    51a4:	4284           	clr.l d4
	move.w  12(a4), d4
    51a6:	382c 000c      	move.w 12(a4),d4
	swap	d4
    51aa:	4844           	swap d4
	lsr.l	d5, d4
    51ac:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    51ae:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    51b2:	4284           	clr.l d4
	move.w  14(a4), d4
    51b4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    51b8:	4844           	swap d4
	lsr.l	d5, d4
    51ba:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    51bc:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    51c0:	4284           	clr.l d4

	add.b   (a6), d5
    51c2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    51c4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    51c8:	6500 0006      	bcs.w 51d0 <noadditionalchar>
	addq.w  #1, a3
    51cc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    51ce:	5145           	subq.w #8,d5

000051d0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    51d0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    51d2:	51c8 ff68      	dbf d0,513c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    51d6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    51da:	51cb ff5c      	dbf d3,5138 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    51de:	4cfa 7fff fdf2 	movem.l 4fd4 <saveregs>(pc),d0-a6

	RTS
    51e4:	4e75           	rts
