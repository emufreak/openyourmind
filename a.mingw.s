
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
      10:	23ce 0001 6a8e 	move.l a6,16a8e <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,16a7e <hw>
      1c:	0001 6a7e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0001 53d4 	lea 153d4 <incbin_startimage_end+0x530>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0001 6a82 	move.l d0,16a82 <GfxBase>
	if (!GfxBase)
      32:	6700 0730      	beq.w 764 <main+0x75e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
      3c:	43f9 0001 53e5 	lea 153e5 <incbin_startimage_end+0x541>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0001 6a8a 	move.l d0,16a8a <DOSBase>
	if (!DOSBase)
      4e:	6700 0708      	beq.w 758 <main+0x752>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0001 53f1 	pea 153f1 <incbin_startimage_end+0x54d>
      58:	4eb9 0000 0946 	jsr 946 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0001 540d 	move.l #87053,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0001 541d 	move.l #87069,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	49f9 0000 0df6 	lea df6 <ClBuild>,a4
      b4:	4e94           	jsr (a4)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0001 6a70 	move.l d0,16a70 <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0001 6a68 	move.l d0,16a68 <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e94           	jsr (a4)
      c6:	23c0 0001 6a62 	move.l d0,16a62 <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0001 6a56 	move.l d0,16a56 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0001 66c8 	cmp.l 166c8 <ClsSprites>,d0
      dc:	6600 060c      	bne.w 6ea <main+0x6e4>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0001 66cc 	cmp.l 166cc <ClsSprites+0x4>,d0
      ea:	6600 05fe      	bne.w 6ea <main+0x6e4>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0001 66d0 	cmp.l 166d0 <ClsSprites+0x8>,d0
      f8:	6600 05f0      	bne.w 6ea <main+0x6e4>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0001 66d4 	cmp.l 166d4 <ClsSprites+0xc>,d0
     106:	6600 05e2      	bne.w 6ea <main+0x6e4>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0001 66d8 	cmp.l 166d8 <ClsSprites+0x10>,d0
     114:	6600 05d4      	bne.w 6ea <main+0x6e4>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0001 66dc 	cmp.l 166dc <ClsSprites+0x14>,d0
     122:	6600 05c6      	bne.w 6ea <main+0x6e4>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0001 66e0 	cmp.l 166e0 <ClsSprites+0x18>,d0
     130:	6600 05b8      	bne.w 6ea <main+0x6e4>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0001 66e4 	cmp.l 166e4 <ClsSprites+0x1c>,d0
     13e:	6600 05aa      	bne.w 6ea <main+0x6e4>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0001 66e8 	cmp.l 166e8 <ClsSprites+0x20>,d0
     14c:	6600 059c      	bne.w 6ea <main+0x6e4>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0001 66ec 	cmp.l 166ec <ClsSprites+0x24>,d0
     15a:	6600 058e      	bne.w 6ea <main+0x6e4>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0001 66f0 	cmp.l 166f0 <ClsSprites+0x28>,d0
     168:	6600 0580      	bne.w 6ea <main+0x6e4>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0001 66f4 	cmp.l 166f4 <ClsSprites+0x2c>,d0
     176:	6600 0572      	bne.w 6ea <main+0x6e4>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0001 66f8 	cmp.l 166f8 <ClsSprites+0x30>,d0
     184:	6600 0564      	bne.w 6ea <main+0x6e4>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0001 66fc 	cmp.l 166fc <ClsSprites+0x34>,d0
     192:	6600 0556      	bne.w 6ea <main+0x6e4>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0001 6700 	cmp.l 16700 <ClsSprites+0x38>,d0
     1a0:	6600 0548      	bne.w 6ea <main+0x6e4>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0001 6704 	cmpa.l 16704 <ClsSprites+0x3c>,a2
     1ae:	6600 053a      	bne.w 6ea <main+0x6e4>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0001 6698 	move.l 16698 <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0548      	bne.w 70c <main+0x706>
     1c6:	2039 0001 669c 	move.l 1669c <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 053a      	bne.w 70c <main+0x706>
     1d4:	2039 0001 66a0 	move.l 166a0 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 052c      	bne.w 70c <main+0x706>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0001 66a4 	cmp.l 166a4 <ClScreen+0xc>,d0
     1ec:	6600 051e      	bne.w 70c <main+0x706>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0001 66a8 	cmp.l 166a8 <ClScreen+0x10>,d0
     1fa:	6600 0510      	bne.w 70c <main+0x706>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0001 66ac 	cmp.l 166ac <ClScreen+0x14>,d0
     208:	6600 0502      	bne.w 70c <main+0x706>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0001 66b0 	cmp.l 166b0 <ClScreen+0x18>,d0
     216:	6600 04f4      	bne.w 70c <main+0x706>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0001 66b4 	cmp.l 166b4 <ClScreen+0x1c>,d0
     224:	6600 04e6      	bne.w 70c <main+0x706>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0001 66b8 	cmp.l 166b8 <ClScreen+0x20>,d0
     232:	6600 04d8      	bne.w 70c <main+0x706>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0001 66bc 	cmp.l 166bc <ClScreen+0x24>,d0
     240:	6600 04ca      	bne.w 70c <main+0x706>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0001 66c0 	cmp.l 166c0 <ClScreen+0x28>,d0
     24e:	6600 04bc      	bne.w 70c <main+0x706>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0001 66c4 	cmpa.l 166c4 <ClScreen+0x2c>,a0
     25c:	6600 04ae      	bne.w 70c <main+0x706>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,16a76 <DrawBuffer>
     266:	0001 6a76 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,16a6c <ViewBuffer>
     270:	0001 6a6c 
  
  SetBplPointers();
     274:	45f9 0000 198c 	lea 198c <SetBplPointers>,a2
     27a:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27c:	0cb9 0005 0000 	cmpi.l #327680,16a76 <DrawBuffer>
     282:	0001 6a76 
     286:	6700 059a      	beq.w 822 <main+0x81c>
    Write( Output(), 
     28a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     290:	4eae ffc4      	jsr -60(a6)
     294:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     29a:	2200           	move.l d0,d1
     29c:	243c 0001 5420 	move.l #87072,d2
     2a2:	763b           	moveq #59,d3
     2a4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a8:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
     2ae:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b4:	0070 
     2b6:	6724           	beq.s 2dc <main+0x2d6>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2be:	4eae ffc4      	jsr -60(a6)
     2c2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2c8:	2200           	move.l d0,d1
     2ca:	243c 0001 545c 	move.l #87132,d2
     2d0:	763c           	moveq #60,d3
     2d2:	4eae ffd0      	jsr -48(a6)
     2d6:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2dc:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e2:	0074 
     2e4:	6724           	beq.s 30a <main+0x304>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2ec:	4eae ffc4      	jsr -60(a6)
     2f0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     2f6:	2200           	move.l d0,d1
     2f8:	243c 0001 5499 	move.l #87193,d2
     2fe:	763c           	moveq #60,d3
     300:	4eae ffd0      	jsr -48(a6)
     304:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30a:	2028 0078      	move.l 120(a0),d0
     30e:	b0b9 0001 6618 	cmp.l 16618 <ClColor>,d0
     314:	6600 053c      	bne.w 852 <main+0x84c>
     318:	2028 007c      	move.l 124(a0),d0
     31c:	b0b9 0001 661c 	cmp.l 1661c <ClColor+0x4>,d0
     322:	6600 052e      	bne.w 852 <main+0x84c>
  if( instructions[pos] == value ) 
     326:	70fe           	moveq #-2,d0
     328:	b0a8 0080      	cmp.l 128(a0),d0
     32c:	671e           	beq.s 34c <main+0x346>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     334:	4eae ffc4      	jsr -60(a6)
     338:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     33e:	2200           	move.l d0,d1
     340:	243c 0001 54f8 	move.l #87288,d2
     346:	7622           	moveq #34,d3
     348:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34c:	47f9 0000 1966 	lea 1966 <SwapCl>,a3
     352:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     354:	2039 0001 6a68 	move.l 16a68 <DrawCopper>,d0
     35a:	b0b9 0001 6a62 	cmp.l 16a62 <Copperlist2>,d0
     360:	671e           	beq.s 380 <main+0x37a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     362:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     368:	4eae ffc4      	jsr -60(a6)
     36c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     372:	2200           	move.l d0,d1
     374:	243c 0001 551b 	move.l #87323,d2
     37a:	7615           	moveq #21,d3
     37c:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     380:	4e94           	jsr (a4)
     382:	23c0 0001 6a70 	move.l d0,16a70 <Copperlist1>
  Copperlist2 = ClBuild( );
     388:	4e94           	jsr (a4)
     38a:	23c0 0001 6a62 	move.l d0,16a62 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     390:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     396:	203c 0000 c800 	move.l #51200,d0
     39c:	7202           	moveq #2,d1
     39e:	4eae ff3a      	jsr -198(a6)
     3a2:	23c0 0001 6a5e 	move.l d0,16a5e <Bitplane1>
  if(Bitplane1 == 0) {
     3a8:	6700 0418      	beq.w 7c2 <main+0x7bc>
  ViewBuffer = Bitplane1;
     3ac:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist1;
     3b2:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a56 <ViewCopper>
     3b8:	0001 6a56 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3bc:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     3c2:	203c 0000 c800 	move.l #51200,d0
     3c8:	7202           	moveq #2,d1
     3ca:	4eae ff3a      	jsr -198(a6)
     3ce:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
     3d4:	6700 03b8      	beq.w 78e <main+0x788>
  DrawBuffer = Bitplane2;
     3d8:	23c0 0001 6a76 	move.l d0,16a76 <DrawBuffer>
  DrawCopper = Copperlist2;
     3de:	23f9 0001 6a62 	move.l 16a62 <Copperlist2>,16a68 <DrawCopper>
     3e4:	0001 6a68 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e8:	2039 0001 6a6c 	move.l 16a6c <ViewBuffer>,d0
     3ee:	b0b9 0001 6a5e 	cmp.l 16a5e <Bitplane1>,d0
     3f4:	671e           	beq.s 414 <main+0x40e>
    Write( Output(), 
     3f6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     3fc:	4eae ffc4      	jsr -60(a6)
     400:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     406:	2200           	move.l d0,d1
     408:	243c 0001 5531 	move.l #87345,d2
     40e:	7638           	moveq #56,d3
     410:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     414:	2039 0001 6a56 	move.l 16a56 <ViewCopper>,d0
     41a:	b0b9 0001 6a70 	cmp.l 16a70 <Copperlist1>,d0
     420:	671e           	beq.s 440 <main+0x43a>
    Write( Output(), 
     422:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     428:	4eae ffc4      	jsr -60(a6)
     42c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     432:	2200           	move.l d0,d1
     434:	243c 0001 556a 	move.l #87402,d2
     43a:	763a           	moveq #58,d3
     43c:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     440:	4e92           	jsr (a2)
  SwapCl();
     442:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     444:	2079 0001 6a56 	movea.l 16a56 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0001 6a5a 	cmp.l 16a5a <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0001 55a5 	move.l #87461,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     482:	4e92           	jsr (a2)
  SwapCl();
     484:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     486:	2079 0001 6a56 	movea.l 16a56 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48c:	7000           	moveq #0,d0
     48e:	3028 0072      	move.w 114(a0),d0
     492:	4840           	swap d0
     494:	4240           	clr.w d0
     496:	7200           	moveq #0,d1
     498:	3228 0076      	move.w 118(a0),d1
     49c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49e:	b0b9 0001 6a5e 	cmp.l 16a5e <Bitplane1>,d0
     4a4:	671e           	beq.s 4c4 <main+0x4be>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4ac:	4eae ffc4      	jsr -60(a6)
     4b0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4b6:	2200           	move.l d0,d1
     4b8:	243c 0001 55ee 	move.l #87534,d2
     4be:	7649           	moveq #73,d3
     4c0:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4c4:	4e92           	jsr (a2)
  SwapCl();
     4c6:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4c8:	2079 0001 6a56 	movea.l 16a56 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ce:	7000           	moveq #0,d0
     4d0:	3028 0072      	move.w 114(a0),d0
     4d4:	4840           	swap d0
     4d6:	4240           	clr.w d0
     4d8:	7200           	moveq #0,d1
     4da:	3228 0076      	move.w 118(a0),d1
     4de:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4e0:	b0b9 0001 6a5a 	cmp.l 16a5a <Bitplane2>,d0
     4e6:	671e           	beq.s 506 <main+0x500>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4ee:	4eae ffc4      	jsr -60(a6)
     4f2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     4f8:	2200           	move.l d0,d1
     4fa:	243c 0001 5638 	move.l #87608,d2
     500:	7648           	moveq #72,d3
     502:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     506:	2f3c 0000 c800 	move.l #51200,-(sp)
     50c:	4878 0084      	pea 84 <main+0x7e>
     510:	4eb9 0000 19b8 	jsr 19b8 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     516:	4eb9 0000 1a70 	jsr 1a70 <ZoomTest>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
     51c:	247c 00f0 ff60 	movea.l #15794016,a2
     522:	508f           	addq.l #8,sp
     524:	4a92           	tst.l (a2)
     526:	6718           	beq.s 540 <main+0x53a>
     528:	4878 0001      	pea 1 <_start+0x1>
     52c:	47f9 0000 08a4 	lea 8a4 <warpmode.part.0>,a3
     532:	4e93           	jsr (a3)
     534:	588f           	addq.l #4,sp
     536:	4a92           	tst.l (a2)
     538:	6706           	beq.s 540 <main+0x53a>
     53a:	42a7           	clr.l -(sp)
     53c:	4e93           	jsr (a3)
     53e:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
     540:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     546:	23ee 0022 0001 	move.l 34(a6),16a44 <ActiView>
     54c:	6a44 
	OwnBlitter();
     54e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     552:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     558:	4eae ff1c      	jsr -228(a6)
	Disable();
     55c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     562:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     566:	2679 0001 6a7e 	movea.l 16a7e <hw>,a3
     56c:	302b 0010      	move.w 16(a3),d0
     570:	33c0 0001 6a48 	move.w d0,16a48 <SystemADKCON>
	SystemInts=hw->intenar;
     576:	302b 001c      	move.w 28(a3),d0
     57a:	33c0 0001 6a4c 	move.w d0,16a4c <SystemInts>
	SystemDMA=hw->dmaconr;
     580:	302b 0002      	move.w 2(a3),d0
     584:	33c0 0001 6a4a 	move.w d0,16a4a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     58a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     590:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     596:	45f9 0000 1a2a 	lea 1a2a <WaitVbl>,a2
     59c:	4e92           	jsr (a2)
	WaitVbl();
     59e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5a0:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a6:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     5ac:	93c9           	suba.l a1,a1
     5ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5b2:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     5b8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5bc:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     5c2:	4eae fef2      	jsr -270(a6)

	WaitVbl();
     5c6:	4e92           	jsr (a2)
	WaitVbl();
     5c8:	4e92           	jsr (a2)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     5ca:	3f7c 4e7a 001e 	move.w #20090,30(sp)
     5d0:	3f7c 0801 0020 	move.w #2049,32(sp)
     5d6:	3f7c 4e73 0022 	move.w #20083,34(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     5dc:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     5e2:	082e 0000 0129 	btst #0,297(a6)
     5e8:	6700 0290      	beq.w 87a <main+0x874>
		vbr = (APTR)Supervisor((void*)getvbr);
     5ec:	7e1e           	moveq #30,d7
     5ee:	de8f           	add.l sp,d7
     5f0:	cf8d           	exg d7,a5
     5f2:	4eae ffe2      	jsr -30(a6)
     5f6:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f8:	23c0 0001 6a4e 	move.l d0,16a4e <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fe:	2079 0001 6a4e 	movea.l 16a4e <VBR.lto_priv.5>,a0
     604:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     608:	23cb 0001 6a52 	move.l a3,16a52 <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
     60e:	4e92           	jsr (a2)
}

void FreeSystem() { 
	WaitVbl();
     610:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     612:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
     618:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     61c:	3028 0002      	move.w 2(a0),d0
     620:	0800 000e      	btst #14,d0
     624:	66f6           	bne.s 61c <main+0x616>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
     626:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     62c:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
     632:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     638:	2279 0001 6a4e 	movea.l 16a4e <VBR.lto_priv.5>,a1
     63e:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     642:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     648:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     654:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     65a:	3039 0001 6a4c 	move.w 16a4c <SystemInts>,d0
     660:	0040 8000      	ori.w #-32768,d0
     664:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     668:	3039 0001 6a4a 	move.w 16a4a <SystemDMA>,d0
     66e:	0040 8000      	ori.w #-32768,d0
     672:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     676:	3039 0001 6a48 	move.w 16a48 <SystemADKCON>,d0
     67c:	0040 8000      	ori.w #-32768,d0
     680:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     684:	2279 0001 6a44 	movea.l 16a44 <ActiView>,a1
     68a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     694:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     698:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     69e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     6a2:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     6a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6ac:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
     6b2:	4eae fe32      	jsr -462(a6)
	Enable();
     6b6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     6bc:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6c0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     6c6:	2279 0001 6a8a 	movea.l 16a8a <DOSBase>,a1
     6cc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6d0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     6d6:	2279 0001 6a82 	movea.l 16a82 <GfxBase>,a1
     6dc:	4eae fe62      	jsr -414(a6)
}
     6e0:	7000           	moveq #0,d0
     6e2:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6e6:	508f           	addq.l #8,sp
     6e8:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6ea:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     6f0:	4eae ffc4      	jsr -60(a6)
     6f4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     6fa:	2200           	move.l d0,d1
     6fc:	243c 0001 56b8 	move.l #87736,d2
     702:	762c           	moveq #44,d3
     704:	4eae ffd0      	jsr -48(a6)
     708:	6000 faa8      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     70c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0001 5681 	move.l #87681,d2
     724:	7636           	moveq #54,d3
     726:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     72a:	23fc 0004 0000 	move.l #262144,16a76 <DrawBuffer>
     730:	0001 6a76 
  ViewBuffer = (ULONG *)0x50000;
     734:	23fc 0005 0000 	move.l #327680,16a6c <ViewBuffer>
     73a:	0001 6a6c 
  SetBplPointers();
     73e:	45f9 0000 198c 	lea 198c <SetBplPointers>,a2
     744:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     746:	0cb9 0005 0000 	cmpi.l #327680,16a76 <DrawBuffer>
     74c:	0001 6a76 
     750:	6600 fb38      	bne.w 28a <main+0x284>
     754:	6000 00cc      	bra.w 822 <main+0x81c>
		Exit(0);
     758:	9dce           	suba.l a6,a6
     75a:	7200           	moveq #0,d1
     75c:	4eae ff70      	jsr -144(a6)
     760:	6000 f8f0      	bra.w 52 <main+0x4c>
		Exit(0);
     764:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     76a:	7200           	moveq #0,d1
     76c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     770:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     776:	43f9 0001 53e5 	lea 153e5 <incbin_startimage_end+0x541>,a1
     77c:	7000           	moveq #0,d0
     77e:	4eae fdd8      	jsr -552(a6)
     782:	23c0 0001 6a8a 	move.l d0,16a8a <DOSBase>
	if (!DOSBase)
     788:	6600 f8c8      	bne.w 52 <main+0x4c>
     78c:	60ca           	bra.s 758 <main+0x752>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     78e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     794:	4eae ffc4      	jsr -60(a6)
     798:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     79e:	2200           	move.l d0,d1
     7a0:	243c 0001 4f90 	move.l #85904,d2
     7a6:	7626           	moveq #38,d3
     7a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7ac:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7b2:	7201           	moveq #1,d1
     7b4:	4eae ff70      	jsr -144(a6)
     7b8:	2039 0001 6a5a 	move.l 16a5a <Bitplane2>,d0
     7be:	6000 fc18      	bra.w 3d8 <main+0x3d2>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7c2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7c8:	4eae ffc4      	jsr -60(a6)
     7cc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7d2:	2200           	move.l d0,d1
     7d4:	243c 0001 4f69 	move.l #85865,d2
     7da:	7626           	moveq #38,d3
     7dc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7e0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     7e6:	7201           	moveq #1,d1
     7e8:	4eae ff70      	jsr -144(a6)
     7ec:	2039 0001 6a5e 	move.l 16a5e <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7f2:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist1;
     7f8:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a56 <ViewCopper>
     7fe:	0001 6a56 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     802:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     808:	203c 0000 c800 	move.l #51200,d0
     80e:	7202           	moveq #2,d1
     810:	4eae ff3a      	jsr -198(a6)
     814:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
     81a:	6600 fbbc      	bne.w 3d8 <main+0x3d2>
     81e:	6000 ff6e      	bra.w 78e <main+0x788>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     822:	0cb9 0004 0000 	cmpi.l #262144,16a6c <ViewBuffer>
     828:	0001 6a6c 
     82c:	6700 fa7a      	beq.w 2a8 <main+0x2a2>
    Write( Output(), 
     830:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     836:	4eae ffc4      	jsr -60(a6)
     83a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     840:	2200           	move.l d0,d1
     842:	243c 0001 5420 	move.l #87072,d2
     848:	763b           	moveq #59,d3
     84a:	4eae ffd0      	jsr -48(a6)
     84e:	6000 fa58      	bra.w 2a8 <main+0x2a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     852:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     858:	4eae ffc4      	jsr -60(a6)
     85c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     862:	2200           	move.l d0,d1
     864:	243c 0001 54d6 	move.l #87254,d2
     86a:	7621           	moveq #33,d3
     86c:	4eae ffd0      	jsr -48(a6)
     870:	2079 0001 6a70 	movea.l 16a70 <Copperlist1>,a0
     876:	6000 faae      	bra.w 326 <main+0x320>
	APTR vbr = 0;
     87a:	7000           	moveq #0,d0
	VBR=GetVBR();
     87c:	23c0 0001 6a4e 	move.l d0,16a4e <VBR.lto_priv.5>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     882:	2079 0001 6a4e 	movea.l 16a4e <VBR.lto_priv.5>,a0
     888:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     88c:	23cb 0001 6a52 	move.l a3,16a52 <SystemIrq>
	WaitVbl();
     892:	4e92           	jsr (a2)
	WaitVbl();
     894:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     896:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
     89c:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     8a0:	6000 fd7a      	bra.w 61c <main+0x616>

000008a4 <warpmode.part.0>:
void warpmode(int on) 
     8a4:	598f           	subq.l #4,sp
     8a6:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     8a8:	4aaf 000c      	tst.l 12(sp)
     8ac:	674c           	beq.s 8fa <warpmode.part.0+0x56>
     8ae:	4878 0001      	pea 1 <_start+0x1>
     8b2:	740b           	moveq #11,d2
     8b4:	d48f           	add.l sp,d2
     8b6:	2f02           	move.l d2,-(sp)
     8b8:	42a7           	clr.l -(sp)
     8ba:	4879 0001 4ed8 	pea 14ed8 <incbin_startimage_end+0x34>
     8c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8170>
     8c4:	4878 0052      	pea 52 <main+0x4c>
     8c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee80d1>
     8ce:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8d2:	203c 0001 4ebe 	move.l #85694,d0
     8d8:	4878 0001      	pea 1 <_start+0x1>
     8dc:	2f02           	move.l d2,-(sp)
     8de:	42a7           	clr.l -(sp)
     8e0:	2f00           	move.l d0,-(sp)
     8e2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8170>
     8e6:	4878 0052      	pea 52 <main+0x4c>
     8ea:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee80d1>
	}
}
     8f0:	4fef 0018      	lea 24(sp),sp
     8f4:	241f           	move.l (sp)+,d2
     8f6:	588f           	addq.l #4,sp
     8f8:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     8fa:	4878 0001      	pea 1 <_start+0x1>
     8fe:	740b           	moveq #11,d2
     900:	d48f           	add.l sp,d2
     902:	2f02           	move.l d2,-(sp)
     904:	42a7           	clr.l -(sp)
     906:	4879 0001 4ee2 	pea 14ee2 <incbin_startimage_end+0x3e>
     90c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8170>
     910:	4878 0052      	pea 52 <main+0x4c>
     914:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee80d1>
     91a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91e:	203c 0001 4ea5 	move.l #85669,d0
     924:	4878 0001      	pea 1 <_start+0x1>
     928:	2f02           	move.l d2,-(sp)
     92a:	42a7           	clr.l -(sp)
     92c:	2f00           	move.l d0,-(sp)
     92e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8170>
     932:	4878 0052      	pea 52 <main+0x4c>
     936:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee80d1>
}
     93c:	4fef 0018      	lea 24(sp),sp
     940:	241f           	move.l (sp)+,d2
     942:	588f           	addq.l #4,sp
     944:	4e75           	rts

00000946 <KPrintF>:
{
     946:	4fef ff80      	lea -128(sp),sp
     94a:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
     94e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee80d1>
     954:	6734           	beq.s 98a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     956:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     95c:	206f 0090      	movea.l 144(sp),a0
     960:	43ef 0094      	lea 148(sp),a1
     964:	45f9 0000 47dc 	lea 47dc <PutChar>,a2
     96a:	47ef 000c      	lea 12(sp),a3
     96e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     972:	2f0b           	move.l a3,-(sp)
     974:	4878 0056      	pea 56 <main+0x50>
     978:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee80d1>
     97e:	508f           	addq.l #8,sp
}
     980:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     984:	4fef 0080      	lea 128(sp),sp
     988:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     98a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     990:	206f 0090      	movea.l 144(sp),a0
     994:	43ef 0094      	lea 148(sp),a1
     998:	45f9 0000 47ce 	lea 47ce <KPutCharX>,a2
     99e:	97cb           	suba.l a3,a3
     9a0:	4eae fdf6      	jsr -522(a6)
}
     9a4:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     9a8:	4fef 0080      	lea 128(sp),sp
     9ac:	4e75           	rts

000009ae <TestRow>:
  FreeMem( source, (ZMLINESIZE+4)*272);
  FreeMem( destination, (ZMLINESIZE+4)*272);
}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
     9ae:	4fef ff94      	lea -108(sp),sp
     9b2:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     9b6:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
     9bc:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
     9c0:	7a34           	moveq #52,d5
     9c2:	da8f           	add.l sp,d5
     9c4:	4878 0064      	pea 64 <main+0x5e>
     9c8:	42a7           	clr.l -(sp)
     9ca:	2f05           	move.l d5,-(sp)
     9cc:	4eba 3c20      	jsr 45ee <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
     9d0:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
     9d6:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
     9da:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
     9de:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
     9e2:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9e4:	2e3c 0001 4eed 	move.l #85741,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9ea:	301c           	move.w (a4)+,d0
     9ec:	bd40           	eor.w d6,d0
     9ee:	b05d           	cmp.w (a5)+,d0
     9f0:	6736           	beq.s a28 <TestRow+0x7a>
      data[0] = i;
     9f2:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     9fc:	2047           	movea.l d7,a0
     9fe:	43ef 0030      	lea 48(sp),a1
     a02:	45f9 0000 47dc 	lea 47dc <PutChar>,a2
     a08:	2645           	movea.l d5,a3
     a0a:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     a14:	4eae ffc4      	jsr -60(a6)
     a18:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     a1e:	2200           	move.l d0,d1
     a20:	2405           	move.l d5,d2
     a22:	7664           	moveq #100,d3
     a24:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
     a28:	5284           	addq.l #1,d4
     a2a:	7015           	moveq #21,d0
     a2c:	b084           	cmp.l d4,d0
     a2e:	66ba           	bne.s 9ea <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
     a30:	206f 00a0      	movea.l 160(sp),a0
     a34:	3028 002a      	move.w 42(a0),d0
     a38:	322f 002e      	move.w 46(sp),d1
     a3c:	b340           	eor.w d1,d0
     a3e:	206f 009c      	movea.l 156(sp),a0
     a42:	3228 002a      	move.w 42(a0),d1
     a46:	b340           	eor.w d1,d0
     a48:	0240 ff00      	andi.w #-256,d0
     a4c:	660a           	bne.s a58 <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
     a4e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     a52:	4fef 006c      	lea 108(sp),sp
     a56:	4e75           	rts
    data[0] = 21;
     a58:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
     a5e:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     a64:	41f9 0001 4eed 	lea 14eed <incbin_startimage_end+0x49>,a0
     a6a:	43ef 0030      	lea 48(sp),a1
     a6e:	45f9 0000 47dc 	lea 47dc <PutChar>,a2
     a74:	47ef 0034      	lea 52(sp),a3
     a78:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a7c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     a82:	4eae ffc4      	jsr -60(a6)
     a86:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     a8c:	2200           	move.l d0,d1
     a8e:	240b           	move.l a3,d2
     a90:	7664           	moveq #100,d3
     a92:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
     a96:	206f 00a0      	movea.l 160(sp),a0
     a9a:	7000           	moveq #0,d0
     a9c:	3028 002a      	move.w 42(a0),d0
     aa0:	2f00           	move.l d0,-(sp)
     aa2:	206f 00a0      	movea.l 160(sp),a0
     aa6:	3028 002a      	move.w 42(a0),d0
     aaa:	2f00           	move.l d0,-(sp)
     aac:	4879 0001 4f1d 	pea 14f1d <incbin_startimage_end+0x79>
     ab2:	4eba fe92      	jsr 946 <KPrintF>(pc)
     ab6:	4fef 000c      	lea 12(sp),sp
}
     aba:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     abe:	4fef 006c      	lea 108(sp),sp
     ac2:	4e75           	rts

00000ac4 <Vblankcounter>:
  Counter4Frames++;
     ac4:	52b9 0001 6a86 	addq.l #1,16a86 <Counter4Frames>
}
     aca:	4e75           	rts

00000acc <TestCopperlistPos>:
  if( instructions[pos] == value ) 
     acc:	202f 0008      	move.l 8(sp),d0
     ad0:	d080           	add.l d0,d0
     ad2:	d080           	add.l d0,d0
     ad4:	206f 0004      	movea.l 4(sp),a0
     ad8:	2030 0800      	move.l (0,a0,d0.l),d0
     adc:	b0af 000c      	cmp.l 12(sp),d0
     ae0:	57c0           	seq d0
     ae2:	4880           	ext.w d0
     ae4:	48c0           	ext.l d0
}
     ae6:	4480           	neg.l d0
     ae8:	4e75           	rts

00000aea <TestZoom102Batch>:
int TestZoom102Batch( ULONG *cl2test, UWORD position) {
     aea:	48e7 2030      	movem.l d2/a2-a3,-(sp)
     aee:	242f 0010      	move.l 16(sp),d2
  for( int i=0;i<12;i++)
     af2:	7000           	moveq #0,d0
     af4:	302f 0016      	move.w 22(sp),d0
     af8:	2640           	movea.l d0,a3
    if( TestCopperlistPos( cl2test, i+position, 0x1020099) == 0)
     afa:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b00:	2f0b           	move.l a3,-(sp)
     b02:	2f02           	move.l d2,-(sp)
     b04:	45fa ffc6      	lea acc <TestCopperlistPos>(pc),a2
     b08:	4e92           	jsr (a2)
     b0a:	4fef 000c      	lea 12(sp),sp
     b0e:	4a80           	tst.l d0
     b10:	6700 02b4      	beq.w dc6 <TestZoom102Batch+0x2dc>
     b14:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b1a:	486b 0001      	pea 1(a3)
     b1e:	2f02           	move.l d2,-(sp)
     b20:	4e92           	jsr (a2)
     b22:	4fef 000c      	lea 12(sp),sp
     b26:	4a80           	tst.l d0
     b28:	6700 029c      	beq.w dc6 <TestZoom102Batch+0x2dc>
     b2c:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b32:	486b 0002      	pea 2(a3)
     b36:	2f02           	move.l d2,-(sp)
     b38:	4e92           	jsr (a2)
     b3a:	4fef 000c      	lea 12(sp),sp
     b3e:	4a80           	tst.l d0
     b40:	6700 0284      	beq.w dc6 <TestZoom102Batch+0x2dc>
     b44:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b4a:	486b 0003      	pea 3(a3)
     b4e:	2f02           	move.l d2,-(sp)
     b50:	4e92           	jsr (a2)
     b52:	4fef 000c      	lea 12(sp),sp
     b56:	4a80           	tst.l d0
     b58:	6700 026c      	beq.w dc6 <TestZoom102Batch+0x2dc>
     b5c:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b62:	486b 0004      	pea 4(a3)
     b66:	2f02           	move.l d2,-(sp)
     b68:	4e92           	jsr (a2)
     b6a:	4fef 000c      	lea 12(sp),sp
     b6e:	4a80           	tst.l d0
     b70:	6700 0254      	beq.w dc6 <TestZoom102Batch+0x2dc>
     b74:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b7a:	486b 0005      	pea 5(a3)
     b7e:	2f02           	move.l d2,-(sp)
     b80:	4e92           	jsr (a2)
     b82:	4fef 000c      	lea 12(sp),sp
     b86:	4a80           	tst.l d0
     b88:	6700 023c      	beq.w dc6 <TestZoom102Batch+0x2dc>
     b8c:	2f3c 0102 0099 	move.l #16908441,-(sp)
     b92:	486b 0006      	pea 6(a3)
     b96:	2f02           	move.l d2,-(sp)
     b98:	4e92           	jsr (a2)
     b9a:	4fef 000c      	lea 12(sp),sp
     b9e:	4a80           	tst.l d0
     ba0:	6700 0224      	beq.w dc6 <TestZoom102Batch+0x2dc>
     ba4:	2f3c 0102 0099 	move.l #16908441,-(sp)
     baa:	486b 0007      	pea 7(a3)
     bae:	2f02           	move.l d2,-(sp)
     bb0:	4e92           	jsr (a2)
     bb2:	4fef 000c      	lea 12(sp),sp
     bb6:	4a80           	tst.l d0
     bb8:	6700 020c      	beq.w dc6 <TestZoom102Batch+0x2dc>
     bbc:	2f3c 0102 0099 	move.l #16908441,-(sp)
     bc2:	486b 0008      	pea 8(a3)
     bc6:	2f02           	move.l d2,-(sp)
     bc8:	4e92           	jsr (a2)
     bca:	4fef 000c      	lea 12(sp),sp
     bce:	4a80           	tst.l d0
     bd0:	6700 01f4      	beq.w dc6 <TestZoom102Batch+0x2dc>
     bd4:	2f3c 0102 0099 	move.l #16908441,-(sp)
     bda:	486b 0009      	pea 9(a3)
     bde:	2f02           	move.l d2,-(sp)
     be0:	4e92           	jsr (a2)
     be2:	4fef 000c      	lea 12(sp),sp
     be6:	4a80           	tst.l d0
     be8:	6700 01dc      	beq.w dc6 <TestZoom102Batch+0x2dc>
     bec:	2f3c 0102 0099 	move.l #16908441,-(sp)
     bf2:	486b 000a      	pea 10(a3)
     bf6:	2f02           	move.l d2,-(sp)
     bf8:	4e92           	jsr (a2)
     bfa:	4fef 000c      	lea 12(sp),sp
     bfe:	4a80           	tst.l d0
     c00:	6700 01c4      	beq.w dc6 <TestZoom102Batch+0x2dc>
     c04:	2f3c 0102 0099 	move.l #16908441,-(sp)
     c0a:	486b 000b      	pea 11(a3)
     c0e:	2f02           	move.l d2,-(sp)
     c10:	4e92           	jsr (a2)
     c12:	4fef 000c      	lea 12(sp),sp
     c16:	4a80           	tst.l d0
     c18:	6700 01ac      	beq.w dc6 <TestZoom102Batch+0x2dc>
    if( TestCopperlistPos( cl2test, 12+i+position, 0x1020088) == 0)
     c1c:	2f3c 0102 0088 	move.l #16908424,-(sp)
     c22:	486b 000c      	pea 12(a3)
     c26:	2f02           	move.l d2,-(sp)
     c28:	4e92           	jsr (a2)
     c2a:	4fef 000c      	lea 12(sp),sp
     c2e:	4a80           	tst.l d0
     c30:	6700 0194      	beq.w dc6 <TestZoom102Batch+0x2dc>
     c34:	2f3c 0102 0088 	move.l #16908424,-(sp)
     c3a:	486b 000d      	pea 13(a3)
     c3e:	2f02           	move.l d2,-(sp)
     c40:	4e92           	jsr (a2)
     c42:	4fef 000c      	lea 12(sp),sp
     c46:	4a80           	tst.l d0
     c48:	6700 017c      	beq.w dc6 <TestZoom102Batch+0x2dc>
    if( TestCopperlistPos( cl2test, 14+i+position, 0x1020077) == 0)
     c4c:	2f3c 0102 0077 	move.l #16908407,-(sp)
     c52:	486b 000e      	pea 14(a3)
     c56:	2f02           	move.l d2,-(sp)
     c58:	4e92           	jsr (a2)
     c5a:	4fef 000c      	lea 12(sp),sp
     c5e:	4a80           	tst.l d0
     c60:	6700 0164      	beq.w dc6 <TestZoom102Batch+0x2dc>
     c64:	2f3c 0102 0077 	move.l #16908407,-(sp)
     c6a:	486b 000f      	pea 15(a3)
     c6e:	2f02           	move.l d2,-(sp)
     c70:	4e92           	jsr (a2)
     c72:	4fef 000c      	lea 12(sp),sp
     c76:	4a80           	tst.l d0
     c78:	6700 014c      	beq.w dc6 <TestZoom102Batch+0x2dc>
    if( TestCopperlistPos( cl2test, 16+i+position, 0x1020066) == 0)
     c7c:	2f3c 0102 0066 	move.l #16908390,-(sp)
     c82:	486b 0010      	pea 16(a3)
     c86:	2f02           	move.l d2,-(sp)
     c88:	4e92           	jsr (a2)
     c8a:	4fef 000c      	lea 12(sp),sp
     c8e:	4a80           	tst.l d0
     c90:	6700 0134      	beq.w dc6 <TestZoom102Batch+0x2dc>
     c94:	2f3c 0102 0066 	move.l #16908390,-(sp)
     c9a:	486b 0011      	pea 17(a3)
     c9e:	2f02           	move.l d2,-(sp)
     ca0:	4e92           	jsr (a2)
     ca2:	4fef 000c      	lea 12(sp),sp
     ca6:	4a80           	tst.l d0
     ca8:	6700 011c      	beq.w dc6 <TestZoom102Batch+0x2dc>
    if( TestCopperlistPos( cl2test, 18+i+position, 0x1020055) == 0)
     cac:	2f3c 0102 0055 	move.l #16908373,-(sp)
     cb2:	486b 0012      	pea 18(a3)
     cb6:	2f02           	move.l d2,-(sp)
     cb8:	4e92           	jsr (a2)
     cba:	4fef 000c      	lea 12(sp),sp
     cbe:	4a80           	tst.l d0
     cc0:	6700 0104      	beq.w dc6 <TestZoom102Batch+0x2dc>
     cc4:	2f3c 0102 0055 	move.l #16908373,-(sp)
     cca:	486b 0013      	pea 19(a3)
     cce:	2f02           	move.l d2,-(sp)
     cd0:	4e92           	jsr (a2)
     cd2:	4fef 000c      	lea 12(sp),sp
     cd6:	4a80           	tst.l d0
     cd8:	6700 00ec      	beq.w dc6 <TestZoom102Batch+0x2dc>
     cdc:	2f3c 0102 0055 	move.l #16908373,-(sp)
     ce2:	486b 0014      	pea 20(a3)
     ce6:	2f02           	move.l d2,-(sp)
     ce8:	4e92           	jsr (a2)
     cea:	4fef 000c      	lea 12(sp),sp
     cee:	4a80           	tst.l d0
     cf0:	6700 00d4      	beq.w dc6 <TestZoom102Batch+0x2dc>
     cf4:	2f3c 0102 0055 	move.l #16908373,-(sp)
     cfa:	486b 0015      	pea 21(a3)
     cfe:	2f02           	move.l d2,-(sp)
     d00:	4e92           	jsr (a2)
     d02:	4fef 000c      	lea 12(sp),sp
     d06:	4a80           	tst.l d0
     d08:	6700 00bc      	beq.w dc6 <TestZoom102Batch+0x2dc>
     d0c:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d12:	486b 0016      	pea 22(a3)
     d16:	2f02           	move.l d2,-(sp)
     d18:	4e92           	jsr (a2)
     d1a:	4fef 000c      	lea 12(sp),sp
     d1e:	4a80           	tst.l d0
     d20:	6700 00a4      	beq.w dc6 <TestZoom102Batch+0x2dc>
     d24:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d2a:	486b 0017      	pea 23(a3)
     d2e:	2f02           	move.l d2,-(sp)
     d30:	4e92           	jsr (a2)
     d32:	4fef 000c      	lea 12(sp),sp
     d36:	4a80           	tst.l d0
     d38:	6700 008c      	beq.w dc6 <TestZoom102Batch+0x2dc>
     d3c:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d42:	486b 0018      	pea 24(a3)
     d46:	2f02           	move.l d2,-(sp)
     d48:	4e92           	jsr (a2)
     d4a:	4fef 000c      	lea 12(sp),sp
     d4e:	4a80           	tst.l d0
     d50:	6774           	beq.s dc6 <TestZoom102Batch+0x2dc>
     d52:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d58:	486b 0019      	pea 25(a3)
     d5c:	2f02           	move.l d2,-(sp)
     d5e:	4e92           	jsr (a2)
     d60:	4fef 000c      	lea 12(sp),sp
     d64:	4a80           	tst.l d0
     d66:	675e           	beq.s dc6 <TestZoom102Batch+0x2dc>
     d68:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d6e:	486b 001a      	pea 26(a3)
     d72:	2f02           	move.l d2,-(sp)
     d74:	4e92           	jsr (a2)
     d76:	4fef 000c      	lea 12(sp),sp
     d7a:	4a80           	tst.l d0
     d7c:	6748           	beq.s dc6 <TestZoom102Batch+0x2dc>
     d7e:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d84:	486b 001b      	pea 27(a3)
     d88:	2f02           	move.l d2,-(sp)
     d8a:	4e92           	jsr (a2)
     d8c:	4fef 000c      	lea 12(sp),sp
     d90:	4a80           	tst.l d0
     d92:	6732           	beq.s dc6 <TestZoom102Batch+0x2dc>
     d94:	2f3c 0102 0055 	move.l #16908373,-(sp)
     d9a:	486b 001c      	pea 28(a3)
     d9e:	2f02           	move.l d2,-(sp)
     da0:	4e92           	jsr (a2)
     da2:	4fef 000c      	lea 12(sp),sp
     da6:	4a80           	tst.l d0
     da8:	671c           	beq.s dc6 <TestZoom102Batch+0x2dc>
   if( TestCopperlistPos( cl2test, 29+position, 0x1020099) == 0)
     daa:	2f3c 0102 0099 	move.l #16908441,-(sp)
     db0:	486b 001d      	pea 29(a3)
     db4:	2f02           	move.l d2,-(sp)
     db6:	4e92           	jsr (a2)
     db8:	4fef 000c      	lea 12(sp),sp
     dbc:	4a80           	tst.l d0
     dbe:	56c0           	sne d0
     dc0:	4880           	ext.w d0
     dc2:	48c0           	ext.l d0
     dc4:	4480           	neg.l d0
}
     dc6:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
     dca:	4e75           	rts

00000dcc <TestCopperlistBatch>:
  for( int i=0;i<length;i++)
     dcc:	226f 0008      	movea.l 8(sp),a1
     dd0:	d3c9           	adda.l a1,a1
     dd2:	d3c9           	adda.l a1,a1
     dd4:	d3ef 0004      	adda.l 4(sp),a1
     dd8:	206f 000c      	movea.l 12(sp),a0
     ddc:	202f 0010      	move.l 16(sp),d0
     de0:	d080           	add.l d0,d0
     de2:	d080           	add.l d0,d0
     de4:	d088           	add.l a0,d0
    if( instructions[ pos+i] != batch[ i])
     de6:	b388           	cmpm.l (a0)+,(a1)+
     de8:	6608           	bne.s df2 <TestCopperlistBatch+0x26>
  for( int i=0;i<length;i++)
     dea:	b1c0           	cmpa.l d0,a0
     dec:	66f8           	bne.s de6 <TestCopperlistBatch+0x1a>
  return 1;
     dee:	7001           	moveq #1,d0
}
     df0:	4e75           	rts
      return 0;
     df2:	7000           	moveq #0,d0
}
     df4:	4e75           	rts

00000df6 <ClBuild>:
ULONG * ClBuild() {
     df6:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     dfa:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
     e00:	707b           	moveq #123,d0
     e02:	4600           	not.b d0
     e04:	7202           	moveq #2,d1
     e06:	4eae ff3a      	jsr -198(a6)
     e0a:	2440           	movea.l d0,a2
  if( retval == 0) {
     e0c:	4a80           	tst.l d0
     e0e:	6700 010e      	beq.w f1e <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     e12:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
     e18:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
     e1e:	0004 
     e20:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
     e26:	0008 
     e28:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
     e2e:	000c 
     e30:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
     e36:	0010 
     e38:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
     e3e:	0014 
     e40:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
     e46:	0018 
     e48:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
     e4e:	001c 
     e50:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
     e56:	0020 
     e58:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
     e5e:	0024 
     e60:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
     e66:	0028 
     e68:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
     e6e:	002c 
     e70:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
     e76:	0030 
     e78:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
     e7e:	0034 
     e80:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
     e86:	0038 
     e88:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
     e8e:	003c 
    *cl++ = *clpartinstruction++;
     e90:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
     e96:	0040 
     e98:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
     e9e:	0044 
     ea0:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
     ea6:	0048 
     ea8:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
     eae:	004c 
     eb0:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
     eb6:	0050 
     eb8:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
     ebe:	0054 
     ec0:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
     ec6:	0058 
     ec8:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
     ece:	005c 
     ed0:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
     ed6:	0060 
     ed8:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
     ede:	0064 
     ee0:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
     ee6:	0068 
     ee8:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
     eee:	006c 
  *cl++ = 0x00e00000;
     ef0:	257c 00e0 0000 	move.l #14680064,112(a2)
     ef6:	0070 
  *cl++ = 0x00e20000;
     ef8:	257c 00e2 0000 	move.l #14811136,116(a2)
     efe:	0074 
    *cl++ = *clpartinstruction++;
     f00:	2579 0001 6618 	move.l 16618 <ClColor>,120(a2)
     f06:	0078 
     f08:	2579 0001 661c 	move.l 1661c <ClColor+0x4>,124(a2)
     f0e:	007c 
  *cl = 0xfffffffe;
     f10:	70fe           	moveq #-2,d0
     f12:	2540 0080      	move.l d0,128(a2)
}
     f16:	200a           	move.l a2,d0
     f18:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     f1c:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     f1e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     f24:	4eae ffc4      	jsr -60(a6)
     f28:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     f2e:	2200           	move.l d0,d1
     f30:	243c 0001 4f43 	move.l #85827,d2
     f36:	7628           	moveq #40,d3
     f38:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     f3c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
     f42:	7201           	moveq #1,d1
     f44:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     f48:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
     f4e:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
     f54:	0004 
     f56:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
     f5c:	0008 
     f5e:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
     f64:	000c 
     f66:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
     f6c:	0010 
     f6e:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
     f74:	0014 
     f76:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
     f7c:	0018 
     f7e:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
     f84:	001c 
     f86:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
     f8c:	0020 
     f8e:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
     f94:	0024 
     f96:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
     f9c:	0028 
     f9e:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
     fa4:	002c 
     fa6:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
     fac:	0030 
     fae:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
     fb4:	0034 
     fb6:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
     fbc:	0038 
     fbe:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
     fc4:	003c 
    *cl++ = *clpartinstruction++;
     fc6:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
     fcc:	0040 
     fce:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
     fd4:	0044 
     fd6:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
     fdc:	0048 
     fde:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
     fe4:	004c 
     fe6:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
     fec:	0050 
     fee:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
     ff4:	0054 
     ff6:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
     ffc:	0058 
     ffe:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
    1004:	005c 
    1006:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
    100c:	0060 
    100e:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
    1014:	0064 
    1016:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
    101c:	0068 
    101e:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
    1024:	006c 
  *cl++ = 0x00e00000;
    1026:	257c 00e0 0000 	move.l #14680064,112(a2)
    102c:	0070 
  *cl++ = 0x00e20000;
    102e:	257c 00e2 0000 	move.l #14811136,116(a2)
    1034:	0074 
    *cl++ = *clpartinstruction++;
    1036:	2579 0001 6618 	move.l 16618 <ClColor>,120(a2)
    103c:	0078 
    103e:	2579 0001 661c 	move.l 1661c <ClColor+0x4>,124(a2)
    1044:	007c 
  *cl = 0xfffffffe;
    1046:	70fe           	moveq #-2,d0
    1048:	2540 0080      	move.l d0,128(a2)
}
    104c:	200a           	move.l a2,d0
    104e:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1052:	4e75           	rts

00001054 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1054:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    105a:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    105e:	3028 0002      	move.w 2(a0),d0
    1062:	0800 000e      	btst #14,d0
    1066:	66f6           	bne.s 105e <WaitBlt+0xa>
}
    1068:	4e75           	rts

0000106a <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    106a:	4fef ffe0      	lea -32(sp),sp
    106e:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    1072:	282f 0058      	move.l 88(sp),d4
    1076:	262f 005c      	move.l 92(sp),d3
    107a:	3404           	move.w d4,d2
  WaitBlit();
    107c:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1082:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
    1086:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    108c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1092:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    1098:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    109e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    10a4:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    10aa:	3044           	movea.w d4,a0
    10ac:	d0c4           	adda.w d4,a0
    10ae:	3208           	move.w a0,d1
    10b0:	d248           	add.w a0,d1
    10b2:	d244           	add.w d4,d1
    10b4:	3001           	move.w d1,d0
    10b6:	d041           	add.w d1,d0
    10b8:	0640 014c      	addi.w #332,d0
    10bc:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
    10c0:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
    10c6:	0c40 0160      	cmpi.w #352,d0
    10ca:	631a           	bls.s 10e6 <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
    10cc:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
    10d0:	0640 ffed      	addi.w #-19,d0
    10d4:	9042           	sub.w d2,d0
    shiftright--;
    10d6:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
    10d8:	0c40 0160      	cmpi.w #352,d0
    10dc:	62f2           	bhi.s 10d0 <Zoom_ZoomIntoPicture+0x66>
    10de:	3f49 0032      	move.w a1,50(sp)
    10e2:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    10e6:	7012           	moveq #18,d0
    10e8:	9041           	sub.w d1,d0
    10ea:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
    10ee:	6c00 0346      	bge.w 1436 <Zoom_ZoomIntoPicture+0x3cc>
    10f2:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
    10f4:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    10f6:	0641 0013      	addi.w #19,d1
    10fa:	d242           	add.w d2,d1
      shifthoriz--;
    10fc:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
    10fe:	4a41           	tst.w d1
    1100:	6df4           	blt.s 10f6 <Zoom_ZoomIntoPicture+0x8c>
    1102:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
    1106:	3203           	move.w d3,d1
    1108:	d243           	add.w d3,d1
    110a:	d243           	add.w d3,d1
    110c:	e749           	lsl.w #3,d1
    110e:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    1112:	3e03           	move.w d3,d7
    1114:	ed4f           	lsl.w #6,d7
    1116:	3207           	move.w d7,d1
    1118:	5441           	addq.w #2,d1
    111a:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    111e:	90c4           	suba.w d4,a0
    1120:	3a48           	movea.w a0,a5
    1122:	4bed 0012      	lea 18(a5),a5
    1126:	7200           	moveq #0,d1
    1128:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    112c:	c6c0           	mulu.w d0,d3
    112e:	2003           	move.l d3,d0
    1130:	d083           	add.l d3,d0
    1132:	d083           	add.l d3,d0
    1134:	e988           	lsl.l #4,d0
    1136:	206f 0050      	movea.l 80(sp),a0
    113a:	41f0 082c      	lea (44,a0,d0.l),a0
    113e:	2f48 003c      	move.l a0,60(sp)
    1142:	702c           	moveq #44,d0
    1144:	d0af 0054      	add.l 84(sp),d0
    1148:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    114c:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    1150:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    1156:	70ed           	moveq #-19,d0
    1158:	9042           	sub.w d2,d0
    115a:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    115e:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
    1160:	33ef 0048 0001 	move.w 72(sp),16a66 <ZoomHorizontal>
    1166:	6a66 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1168:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    116c:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1170:	7c00           	moveq #0,d6
    1172:	3c2f 0046      	move.w 70(sp),d6
    1176:	2a06           	move.l d6,d5
    1178:	da86           	add.l d6,d5
    117a:	3f6f 0032 002c 	move.w 50(sp),44(sp)
    1180:	382f 0032      	move.w 50(sp),d4
    1184:	720c           	moveq #12,d1
    1186:	e36c           	lsl.w d1,d4
    1188:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    118e:	7000           	moveq #0,d0
    1190:	302f 0030      	move.w 48(sp),d0
    1194:	306f 0040      	movea.w 64(sp),a0
    1198:	b1c0           	cmpa.l d0,a0
    119a:	6e00 00e8      	bgt.w 1284 <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
    119e:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    11a2:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    11a8:	0644 09f0      	addi.w #2544,d4
    11ac:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
    11b0:	317c 0000 0042 	move.w #0,66(a0)
    11b6:	3239 0001 6a66 	move.w 16a66 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    11bc:	383c 0110      	move.w #272,d4
    11c0:	2f46 002c      	move.l d6,44(sp)
    11c4:	2645           	movea.l d5,a3
    11c6:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
    11ca:	b841           	cmp.w d1,d4
    11cc:	6f00 009a      	ble.w 1268 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
    11d0:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
    11d2:	3001           	move.w d1,d0
    11d4:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
    11d6:	0280 0000 ffff 	andi.l #65535,d0
    11dc:	2440           	movea.l d0,a2
    11de:	d5c0           	adda.l d0,a2
    11e0:	4a44           	tst.w d4
    11e2:	6f2c           	ble.s 1210 <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    11e4:	226f 002c      	movea.l 44(sp),a1
    11e8:	d3c0           	adda.l d0,a1
    11ea:	d3c9           	adda.l a1,a1
    11ec:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
    11ee:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    11f2:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    11f6:	3a28 0002      	move.w 2(a0),d5
    11fa:	0805 000e      	btst #14,d5
    11fe:	66f6           	bne.s 11f6 <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
    1200:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1204:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
    1208:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    120e:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1210:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1214:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1218:	3a28 0002      	move.w 2(a0),d5
    121c:	0805 000e      	btst #14,d5
    1220:	66f6           	bne.s 1218 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
    1222:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    1226:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    122a:	c3c7           	muls.w d7,d1
    122c:	5441           	addq.w #2,d1
    122e:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    1232:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
    1234:	d08c           	add.l a4,d0
    1236:	d080           	add.l d0,d0
    1238:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    123a:	320d           	move.w a5,d1
      while(linesleft > 0) {
    123c:	4a44           	tst.w d4
    123e:	6e8a           	bgt.s 11ca <Zoom_ZoomIntoPicture+0x160>
    1240:	33cd 0001 6a66 	move.w a5,16a66 <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
    1246:	066f fff0 0030 	addi.w #-16,48(sp)
    124c:	55af 003c      	subq.l #2,60(sp)
    1250:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    1254:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    125a:	6600 ff04      	bne.w 1160 <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
    125e:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    1262:	4fef 0020      	lea 32(sp),sp
    1266:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
    1268:	3006           	move.w d6,d0
    126a:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    126c:	0280 0000 ffff 	andi.l #65535,d0
    1272:	2440           	movea.l d0,a2
    1274:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
    1276:	3204           	move.w d4,d1
          linesleft = 0;
    1278:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    127a:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    127e:	3a28 0002      	move.w 2(a0),d5
    1282:	6094           	bra.s 1218 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    1284:	366f 0040      	movea.w 64(sp),a3
    1288:	96ef 0030      	suba.w 48(sp),a3
    128c:	534b           	subq.w #1,a3
  if( shiftright == 0) {
    128e:	302f 002c      	move.w 44(sp),d0
    1292:	5340           	subq.w #1,d0
    1294:	3f40 0032      	move.w d0,50(sp)
    1298:	4a6f 002c      	tst.w 44(sp)
    129c:	6600 013c      	bne.w 13da <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
    12a0:	33fc 0001 0001 	move.w #1,16a74 <ZoomBlit_Increment4SrcA>
    12a6:	6a74 
    12a8:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
    12ac:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    12b0:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    12b6:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    12ba:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    12be:	7000           	moveq #0,d0
    12c0:	300b           	move.w a3,d0
    12c2:	7210           	moveq #16,d1
    12c4:	9280           	sub.l d0,d1
    12c6:	2001           	move.l d1,d0
    12c8:	7200           	moveq #0,d1
    12ca:	4641           	not.w d1
    12cc:	e1a9           	lsl.l d0,d1
    12ce:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    12d2:	302f 004a      	move.w 74(sp),d0
    12d6:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    12da:	7000           	moveq #0,d0
    12dc:	3039 0001 6a74 	move.w 16a74 <ZoomBlit_Increment4SrcA>,d0
    12e2:	2c40           	movea.l d0,a6
    12e4:	ddc0           	adda.l d0,a6
    12e6:	3239 0001 6a66 	move.w 16a66 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    12ec:	383c 0110      	move.w #272,d4
    12f0:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
    12f4:	b841           	cmp.w d1,d4
    12f6:	6f00 00c2      	ble.w 13ba <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
    12fa:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
    12fc:	302f 0034      	move.w 52(sp),d0
    1300:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
    1302:	0280 0000 ffff 	andi.l #65535,d0
    1308:	2440           	movea.l d0,a2
    130a:	d5c0           	adda.l d0,a2
    130c:	4a44           	tst.w d4
    130e:	6f34           	ble.s 1344 <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1310:	226f 0042      	movea.l 66(sp),a1
    1314:	d3c0           	adda.l d0,a1
    1316:	d3c9           	adda.l a1,a1
    1318:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
    131a:	47f2 3800      	lea (0,a2,d3.l),a3
    131e:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1322:	3c28 0002      	move.w 2(a0),d6
    1326:	0806 000e      	btst #14,d6
    132a:	66f6           	bne.s 1322 <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    132c:	2c09           	move.l a1,d6
    132e:	dc8e           	add.l a6,d6
    1330:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    1334:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1338:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    133c:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    1342:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1344:	2242           	movea.l d2,a1
    1346:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1348:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    134c:	3c28 0002      	move.w 2(a0),d6
    1350:	0806 000e      	btst #14,d6
    1354:	66f6           	bne.s 134c <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1356:	2c09           	move.l a1,d6
    1358:	dc8e           	add.l a6,d6
    135a:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    135e:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1362:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1366:	c3c7           	muls.w d7,d1
    1368:	5441           	addq.w #2,d1
    136a:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    136e:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
    1370:	d08c           	add.l a4,d0
    1372:	d080           	add.l d0,d0
    1374:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1376:	320d           	move.w a5,d1
      while( linesleft > 0) {
    1378:	4a44           	tst.w d4
    137a:	6e00 ff78      	bgt.w 12f4 <Zoom_ZoomIntoPicture+0x28a>
    137e:	33cd 0001 6a66 	move.w a5,16a66 <ZoomHorizontal>
      if(shiftright < 0) {
    1384:	4a6f 0032      	tst.w 50(sp)
    1388:	6c00 febc      	bge.w 1246 <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
    138c:	322f 002c      	move.w 44(sp),d1
    1390:	0641 000f      	addi.w #15,d1
    1394:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
    1398:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    139e:	066f fff0 0030 	addi.w #-16,48(sp)
    13a4:	55af 003c      	subq.l #2,60(sp)
    13a8:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    13ac:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    13b2:	6600 fdac      	bne.w 1160 <Zoom_ZoomIntoPicture+0xf6>
    13b6:	6000 fea6      	bra.w 125e <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    13ba:	302f 0034      	move.w 52(sp),d0
    13be:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    13c0:	0280 0000 ffff 	andi.l #65535,d0
    13c6:	2440           	movea.l d0,a2
    13c8:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    13ca:	3204           	move.w d4,d1
          linesleft = 0;
    13cc:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    13ce:	2242           	movea.l d2,a1
    13d0:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    13d2:	3c28 0002      	move.w 2(a0),d6
    13d6:	6000 ff74      	bra.w 134c <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    13da:	4279 0001 6a74 	clr.w 16a74 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    13e0:	720c           	moveq #12,d1
    13e2:	e368           	lsl.w d1,d0
    13e4:	3440           	movea.w d0,a2
    13e6:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    13ea:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    13ee:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    13f4:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    13f8:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    13fc:	7000           	moveq #0,d0
    13fe:	300b           	move.w a3,d0
    1400:	7210           	moveq #16,d1
    1402:	9280           	sub.l d0,d1
    1404:	2001           	move.l d1,d0
    1406:	7200           	moveq #0,d1
    1408:	4641           	not.w d1
    140a:	e1a9           	lsl.l d0,d1
    140c:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    1410:	302f 004a      	move.w 74(sp),d0
    1414:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1418:	7000           	moveq #0,d0
    141a:	3039 0001 6a74 	move.w 16a74 <ZoomBlit_Increment4SrcA>,d0
    1420:	2c40           	movea.l d0,a6
    1422:	ddc0           	adda.l d0,a6
    1424:	3239 0001 6a66 	move.w 16a66 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    142a:	383c 0110      	move.w #272,d4
    142e:	2f46 0042      	move.l d6,66(sp)
    1432:	6000 fec0      	bra.w 12f4 <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    1436:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    1438:	3203           	move.w d3,d1
    143a:	d243           	add.w d3,d1
    143c:	d243           	add.w d3,d1
    143e:	e749           	lsl.w #3,d1
    1440:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    1444:	3e03           	move.w d3,d7
    1446:	ed4f           	lsl.w #6,d7
    1448:	3207           	move.w d7,d1
    144a:	5441           	addq.w #2,d1
    144c:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1450:	90c4           	suba.w d4,a0
    1452:	3a48           	movea.w a0,a5
    1454:	4bed 0012      	lea 18(a5),a5
    1458:	7200           	moveq #0,d1
    145a:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    145e:	c6c0           	mulu.w d0,d3
    1460:	2003           	move.l d3,d0
    1462:	d083           	add.l d3,d0
    1464:	d083           	add.l d3,d0
    1466:	e988           	lsl.l #4,d0
    1468:	206f 0050      	movea.l 80(sp),a0
    146c:	41f0 082c      	lea (44,a0,d0.l),a0
    1470:	2f48 003c      	move.l a0,60(sp)
    1474:	702c           	moveq #44,d0
    1476:	d0af 0054      	add.l 84(sp),d0
    147a:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    147e:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    1482:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    1488:	70ed           	moveq #-19,d0
    148a:	9042           	sub.w d2,d0
    148c:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    1490:	2841           	movea.l d1,a4
    1492:	6000 fccc      	bra.w 1160 <Zoom_ZoomIntoPicture+0xf6>

00001496 <Init_Blit>:
  hw->bltafwm = 0xffff;
    1496:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    149c:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    14a2:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    14a8:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    14ae:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    14b4:	317c 002c 0066 	move.w #44,102(a0)
}
    14ba:	4e75           	rts

000014bc <ClbuildZoom>:
ULONG * ClbuildZoom() {
    14bc:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    14c0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    14c6:	203c 0000 591c 	move.l #22812,d0
    14cc:	7202           	moveq #2,d1
    14ce:	4eae ff3a      	jsr -198(a6)
    14d2:	2440           	movea.l d0,a2
  if( retval == 0) {
    14d4:	4a80           	tst.l d0
    14d6:	6700 01ee      	beq.w 16c6 <ClbuildZoom+0x20a>
    *cl++ = *clpartinstruction++;
    14da:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
    14e0:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
    14e6:	0004 
    14e8:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
    14ee:	0008 
    14f0:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
    14f6:	000c 
    14f8:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
    14fe:	0010 
    1500:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
    1506:	0014 
    1508:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
    150e:	0018 
    1510:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
    1516:	001c 
    1518:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
    151e:	0020 
    1520:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
    1526:	0024 
    1528:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
    152e:	0028 
    1530:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
    1536:	002c 
    1538:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
    153e:	0030 
    1540:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
    1546:	0034 
    1548:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
    154e:	0038 
    1550:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
    1556:	003c 
    *cl++ = *clpartinstruction++;
    1558:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
    155e:	0040 
    1560:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
    1566:	0044 
    1568:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
    156e:	0048 
    1570:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
    1576:	004c 
    1578:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
    157e:	0050 
    1580:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
    1586:	0054 
    1588:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
    158e:	0058 
    1590:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
    1596:	005c 
    1598:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
    159e:	0060 
    15a0:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
    15a6:	0064 
    15a8:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
    15ae:	0068 
    15b0:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
    15b6:	006c 
  *cl++ = 0x00e00000;
    15b8:	257c 00e0 0000 	move.l #14680064,112(a2)
    15be:	0070 
  *cl++ = 0x00e20000;
    15c0:	257c 00e2 0000 	move.l #14811136,116(a2)
    15c6:	0074 
  *cl++ = 0x00e40000;
    15c8:	257c 00e4 0000 	move.l #14942208,120(a2)
    15ce:	0078 
  *cl++ = 0x00e60000;
    15d0:	257c 00e6 0000 	move.l #15073280,124(a2)
    15d6:	007c 
  *cl++ = 0x00e80000;
    15d8:	257c 00e8 0000 	move.l #15204352,128(a2)
    15de:	0080 
  *cl++ = 0x00ea0000;
    15e0:	257c 00ea 0000 	move.l #15335424,132(a2)
    15e6:	0084 
  *cl++ = 0x00ec0000;
    15e8:	257c 00ec 0000 	move.l #15466496,136(a2)
    15ee:	0088 
  *cl++ = 0x00ee0000;
    15f0:	257c 00ee 0000 	move.l #15597568,140(a2)
    15f6:	008c 
  *cl++ = 0x00f00000;
    15f8:	257c 00f0 0000 	move.l #15728640,144(a2)
    15fe:	0090 
  *cl++ = 0x00f20000;
    1600:	257c 00f2 0000 	move.l #15859712,148(a2)
    1606:	0094 
  for(int i=0; i<32;i++)
    1608:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    160c:	41f9 0001 6618 	lea 16618 <ClColor>,a0
    *cl++ = *clpartinstruction++;
    1612:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1614:	b1fc 0001 6698 	cmpa.l #91800,a0
    161a:	66f6           	bne.s 1612 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
    161c:	200a           	move.l a2,d0
    161e:	0680 0000 0124 	addi.l #292,d0
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1624:	2200           	move.l d0,d1
    1626:	4241           	clr.w d1
    1628:	4841           	swap d1
    162a:	0681 0084 0000 	addi.l #8650752,d1
    1630:	2541 0118      	move.l d1,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    1634:	2200           	move.l d0,d1
    1636:	0281 0000 ffff 	andi.l #65535,d1
    163c:	0681 0086 0000 	addi.l #8781824,d1
    1642:	2541 011c      	move.l d1,284(a2)
  *cl++ = 0x2c01ff00;
    1646:	257c 2c01 ff00 	move.l #738328320,288(a2)
    164c:	0120 
  ULONG cop2br1 = cop2 + ( (8+27)<<2);
    164e:	2200           	move.l d0,d1
    1650:	0681 0000 008c 	addi.l #140,d1
  clpartinstruction[6+27] = 0x00840000 + ( cop2br1 >> 16);
    1656:	2401           	move.l d1,d2
    1658:	4242           	clr.w d2
    165a:	4842           	swap d2
    165c:	0682 0084 0000 	addi.l #8650752,d2
    1662:	23c2 0001 6480 	move.l d2,16480 <Cl102ZoomRepeat+0x84>
  clpartinstruction[7+27] = 0x00860000 + ( cop2br1 & 0xffff);
    1668:	0281 0000 ffff 	andi.l #65535,d1
    166e:	0681 0086 0000 	addi.l #8781824,d1
    1674:	23c1 0001 6484 	move.l d1,16484 <Cl102ZoomRepeat+0x88>
  clpartinstruction[17+27+27+27+1] = 0x00840000 + ( cop2br2 >> 16);
    167a:	220a           	move.l a2,d1
    167c:	0681 0000 02b8 	addi.l #696,d1
    1682:	2401           	move.l d1,d2
    1684:	4242           	clr.w d2
    1686:	4842           	swap d2
    1688:	0682 0084 0000 	addi.l #8650752,d2
    168e:	23c2 0001 6588 	move.l d2,16588 <Cl102ZoomRepeat+0x18c>
  clpartinstruction[18+27+27+27+1] = 0x00860000 + ( cop2br2 & 0xffff);
    1694:	0281 0000 ffff 	andi.l #65535,d1
    169a:	0681 0086 0000 	addi.l #8781824,d1
    16a0:	23c1 0001 658c 	move.l d1,1658c <Cl102ZoomRepeat+0x190>
  for(int i=0;i<26+27+27+26+27+1;i++)
    16a6:	2240           	movea.l d0,a1
  clpartinstruction = Cl102ZoomRepeat;
    16a8:	41f9 0001 63fc 	lea 163fc <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
    16ae:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1;i++)
    16b0:	b1fc 0001 6614 	cmpa.l #91668,a0
    16b6:	66f6           	bne.s 16ae <ClbuildZoom+0x1f2>
   *cl++ = 0xfffffffe;
    16b8:	70fe           	moveq #-2,d0
    16ba:	2540 033c      	move.l d0,828(a2)
}
    16be:	200a           	move.l a2,d0
    16c0:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    16c4:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    16c6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    16cc:	4eae ffc4      	jsr -60(a6)
    16d0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    16d6:	2200           	move.l d0,d1
    16d8:	243c 0001 4f43 	move.l #85827,d2
    16de:	7628           	moveq #40,d3
    16e0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    16e4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    16ea:	7201           	moveq #1,d1
    16ec:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    16f0:	24b9 0001 66c8 	move.l 166c8 <ClsSprites>,(a2)
    16f6:	2579 0001 66cc 	move.l 166cc <ClsSprites+0x4>,4(a2)
    16fc:	0004 
    16fe:	2579 0001 66d0 	move.l 166d0 <ClsSprites+0x8>,8(a2)
    1704:	0008 
    1706:	2579 0001 66d4 	move.l 166d4 <ClsSprites+0xc>,12(a2)
    170c:	000c 
    170e:	2579 0001 66d8 	move.l 166d8 <ClsSprites+0x10>,16(a2)
    1714:	0010 
    1716:	2579 0001 66dc 	move.l 166dc <ClsSprites+0x14>,20(a2)
    171c:	0014 
    171e:	2579 0001 66e0 	move.l 166e0 <ClsSprites+0x18>,24(a2)
    1724:	0018 
    1726:	2579 0001 66e4 	move.l 166e4 <ClsSprites+0x1c>,28(a2)
    172c:	001c 
    172e:	2579 0001 66e8 	move.l 166e8 <ClsSprites+0x20>,32(a2)
    1734:	0020 
    1736:	2579 0001 66ec 	move.l 166ec <ClsSprites+0x24>,36(a2)
    173c:	0024 
    173e:	2579 0001 66f0 	move.l 166f0 <ClsSprites+0x28>,40(a2)
    1744:	0028 
    1746:	2579 0001 66f4 	move.l 166f4 <ClsSprites+0x2c>,44(a2)
    174c:	002c 
    174e:	2579 0001 66f8 	move.l 166f8 <ClsSprites+0x30>,48(a2)
    1754:	0030 
    1756:	2579 0001 66fc 	move.l 166fc <ClsSprites+0x34>,52(a2)
    175c:	0034 
    175e:	2579 0001 6700 	move.l 16700 <ClsSprites+0x38>,56(a2)
    1764:	0038 
    1766:	2579 0001 6704 	move.l 16704 <ClsSprites+0x3c>,60(a2)
    176c:	003c 
    *cl++ = *clpartinstruction++;
    176e:	2579 0001 6698 	move.l 16698 <ClScreen>,64(a2)
    1774:	0040 
    1776:	2579 0001 669c 	move.l 1669c <ClScreen+0x4>,68(a2)
    177c:	0044 
    177e:	2579 0001 66a0 	move.l 166a0 <ClScreen+0x8>,72(a2)
    1784:	0048 
    1786:	2579 0001 66a4 	move.l 166a4 <ClScreen+0xc>,76(a2)
    178c:	004c 
    178e:	2579 0001 66a8 	move.l 166a8 <ClScreen+0x10>,80(a2)
    1794:	0050 
    1796:	2579 0001 66ac 	move.l 166ac <ClScreen+0x14>,84(a2)
    179c:	0054 
    179e:	2579 0001 66b0 	move.l 166b0 <ClScreen+0x18>,88(a2)
    17a4:	0058 
    17a6:	2579 0001 66b4 	move.l 166b4 <ClScreen+0x1c>,92(a2)
    17ac:	005c 
    17ae:	2579 0001 66b8 	move.l 166b8 <ClScreen+0x20>,96(a2)
    17b4:	0060 
    17b6:	2579 0001 66bc 	move.l 166bc <ClScreen+0x24>,100(a2)
    17bc:	0064 
    17be:	2579 0001 66c0 	move.l 166c0 <ClScreen+0x28>,104(a2)
    17c4:	0068 
    17c6:	2579 0001 66c4 	move.l 166c4 <ClScreen+0x2c>,108(a2)
    17cc:	006c 
  *cl++ = 0x00e00000;
    17ce:	257c 00e0 0000 	move.l #14680064,112(a2)
    17d4:	0070 
  *cl++ = 0x00e20000;
    17d6:	257c 00e2 0000 	move.l #14811136,116(a2)
    17dc:	0074 
  *cl++ = 0x00e40000;
    17de:	257c 00e4 0000 	move.l #14942208,120(a2)
    17e4:	0078 
  *cl++ = 0x00e60000;
    17e6:	257c 00e6 0000 	move.l #15073280,124(a2)
    17ec:	007c 
  *cl++ = 0x00e80000;
    17ee:	257c 00e8 0000 	move.l #15204352,128(a2)
    17f4:	0080 
  *cl++ = 0x00ea0000;
    17f6:	257c 00ea 0000 	move.l #15335424,132(a2)
    17fc:	0084 
  *cl++ = 0x00ec0000;
    17fe:	257c 00ec 0000 	move.l #15466496,136(a2)
    1804:	0088 
  *cl++ = 0x00ee0000;
    1806:	257c 00ee 0000 	move.l #15597568,140(a2)
    180c:	008c 
  *cl++ = 0x00f00000;
    180e:	257c 00f0 0000 	move.l #15728640,144(a2)
    1814:	0090 
  *cl++ = 0x00f20000;
    1816:	257c 00f2 0000 	move.l #15859712,148(a2)
    181c:	0094 
  for(int i=0; i<32;i++)
    181e:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    1822:	41f9 0001 6618 	lea 16618 <ClColor>,a0
    1828:	6000 fde8      	bra.w 1612 <ClbuildZoom+0x156>

0000182c <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    182c:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    1830:	45fa fc8a      	lea 14bc <ClbuildZoom>(pc),a2
    1834:	4e92           	jsr (a2)
    1836:	23c0 0001 6a70 	move.l d0,16a70 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    183c:	4e92           	jsr (a2)
    183e:	23c0 0001 6a62 	move.l d0,16a62 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1844:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    184a:	203c 0001 6800 	move.l #92160,d0
    1850:	7202           	moveq #2,d1
    1852:	4eae ff3a      	jsr -198(a6)
    1856:	23c0 0001 6a5e 	move.l d0,16a5e <Bitplane1>
  if(Bitplane1 == 0) {
    185c:	6700 008c      	beq.w 18ea <PrepareDisplayZoom+0xbe>
  DrawBuffer = Bitplane1;
    1860:	23c0 0001 6a76 	move.l d0,16a76 <DrawBuffer>
  DrawCopper = Copperlist1;
    1866:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a68 <DrawCopper>
    186c:	0001 6a68 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1870:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1876:	203c 0001 6800 	move.l #92160,d0
    187c:	7202           	moveq #2,d1
    187e:	4eae ff3a      	jsr -198(a6)
    1882:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
    1888:	6718           	beq.s 18a2 <PrepareDisplayZoom+0x76>
  ViewBuffer = Bitplane2;
    188a:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist2;
    1890:	23f9 0001 6a62 	move.l 16a62 <Copperlist2>,16a56 <ViewCopper>
    1896:	0001 6a56 
}
    189a:	7000           	moveq #0,d0
    189c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    18a0:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18a2:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18a8:	4eae ffc4      	jsr -60(a6)
    18ac:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18b2:	2200           	move.l d0,d1
    18b4:	243c 0001 4f90 	move.l #85904,d2
    18ba:	7626           	moveq #38,d3
    18bc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    18c0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18c6:	7201           	moveq #1,d1
    18c8:	4eae ff70      	jsr -144(a6)
    18cc:	2039 0001 6a5a 	move.l 16a5a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    18d2:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
  ViewCopper = Copperlist2;
    18d8:	23f9 0001 6a62 	move.l 16a62 <Copperlist2>,16a56 <ViewCopper>
    18de:	0001 6a56 
}
    18e2:	7000           	moveq #0,d0
    18e4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    18e8:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    18ea:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18f0:	4eae ffc4      	jsr -60(a6)
    18f4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    18fa:	2200           	move.l d0,d1
    18fc:	243c 0001 4f69 	move.l #85865,d2
    1902:	7626           	moveq #38,d3
    1904:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1908:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    190e:	7201           	moveq #1,d1
    1910:	4eae ff70      	jsr -144(a6)
    1914:	2039 0001 6a5e 	move.l 16a5e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    191a:	23c0 0001 6a76 	move.l d0,16a76 <DrawBuffer>
  DrawCopper = Copperlist1;
    1920:	23f9 0001 6a70 	move.l 16a70 <Copperlist1>,16a68 <DrawCopper>
    1926:	0001 6a68 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    192a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1930:	203c 0001 6800 	move.l #92160,d0
    1936:	7202           	moveq #2,d1
    1938:	4eae ff3a      	jsr -198(a6)
    193c:	23c0 0001 6a5a 	move.l d0,16a5a <Bitplane2>
  if(Bitplane2 == 0) {
    1942:	6600 ff46      	bne.w 188a <PrepareDisplayZoom+0x5e>
    1946:	6000 ff5a      	bra.w 18a2 <PrepareDisplayZoom+0x76>

0000194a <Zoom_Init>:
void Zoom_Init() {
    194a:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    194c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1952:	7004           	moveq #4,d0
    1954:	7202           	moveq #2,d1
    1956:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    195a:	33fc 0010 0001 	move.w #16,16a66 <ZoomHorizontal>
    1960:	6a66 
}
    1962:	2c5f           	movea.l (sp)+,a6
    1964:	4e75           	rts

00001966 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1966:	2039 0001 6a68 	move.l 16a68 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    196c:	23f9 0001 6a56 	move.l 16a56 <ViewCopper>,16a68 <DrawCopper>
    1972:	0001 6a68 
  ViewCopper = (ULONG *)tmp;
    1976:	23c0 0001 6a56 	move.l d0,16a56 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    197c:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1982:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1986:	3140 0088      	move.w d0,136(a0)
}
    198a:	4e75           	rts

0000198c <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    198c:	2039 0001 6a76 	move.l 16a76 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1992:	2079 0001 6a68 	movea.l 16a68 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1998:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    199c:	2200           	move.l d0,d1
    199e:	4241           	clr.w d1
    19a0:	4841           	swap d1
    19a2:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    19a6:	23f9 0001 6a6c 	move.l 16a6c <ViewBuffer>,16a76 <DrawBuffer>
    19ac:	0001 6a76 
  ViewBuffer = (ULONG *) tmp;
    19b0:	23c0 0001 6a6c 	move.l d0,16a6c <ViewBuffer>
}
    19b6:	4e75           	rts

000019b8 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    19b8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    19bc:	262f 0010      	move.l 16(sp),d3
    19c0:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    19c4:	2279 0001 6a70 	movea.l 16a70 <Copperlist1>,a1
    19ca:	b2fc 0000      	cmpa.w #0,a1
    19ce:	670c           	beq.s 19dc <FreeDisplay+0x24>
    19d0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    19d6:	2003           	move.l d3,d0
    19d8:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    19dc:	2279 0001 6a62 	movea.l 16a62 <Copperlist2>,a1
    19e2:	b2fc 0000      	cmpa.w #0,a1
    19e6:	670c           	beq.s 19f4 <FreeDisplay+0x3c>
    19e8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    19ee:	2003           	move.l d3,d0
    19f0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    19f4:	2279 0001 6a5e 	movea.l 16a5e <Bitplane1>,a1
    19fa:	b2fc 0000      	cmpa.w #0,a1
    19fe:	670c           	beq.s 1a0c <FreeDisplay+0x54>
    1a00:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1a06:	2002           	move.l d2,d0
    1a08:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    1a0c:	2279 0001 6a5a 	movea.l 16a5a <Bitplane2>,a1
    1a12:	b2fc 0000      	cmpa.w #0,a1
    1a16:	670c           	beq.s 1a24 <FreeDisplay+0x6c>
    1a18:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1a1e:	2002           	move.l d2,d0
    1a20:	4eae ff2e      	jsr -210(a6)
}
    1a24:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    1a28:	4e75           	rts

00001a2a <WaitVbl>:
void WaitVbl() {
    1a2a:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1a2c:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7175>,d0
    1a32:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    1a34:	2017           	move.l (sp),d0
    1a36:	0280 0001 ff00 	andi.l #130816,d0
    1a3c:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    1a3e:	2017           	move.l (sp),d0
    1a40:	0c80 0001 3700 	cmpi.l #79616,d0
    1a46:	67e4           	beq.s 1a2c <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    1a48:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd7175>,d0
    1a4e:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1a52:	202f 0004      	move.l 4(sp),d0
    1a56:	0280 0001 ff00 	andi.l #130816,d0
    1a5c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1a60:	202f 0004      	move.l 4(sp),d0
    1a64:	0c80 0001 3700 	cmpi.l #79616,d0
    1a6a:	66dc           	bne.s 1a48 <WaitVbl+0x1e>
}
    1a6c:	508f           	addq.l #8,sp
    1a6e:	4e75           	rts

00001a70 <ZoomTest>:
void ZoomTest() {
    1a70:	4fef ff50      	lea -176(sp),sp
    1a74:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    1a78:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1a7e:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1a84:	42b9 0001 6a86 	clr.l 16a86 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    1a8a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1a90:	7016           	moveq #22,d0
    1a92:	223c 0001 0001 	move.l #65537,d1
    1a98:	4eae ff3a      	jsr -198(a6)
    1a9c:	2440           	movea.l d0,a2
    1a9e:	4a80           	tst.l d0
    1aa0:	671a           	beq.s 1abc <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1aa2:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    1aa8:	257c 0001 4fb7 	move.l #85943,10(a2)
    1aae:	000a 
    vbint->is_Data = NULL;
    1ab0:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1ab4:	257c 0000 0ac4 	move.l #2756,18(a2)
    1aba:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1abc:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1ac2:	203c 0001 1440 	move.l #70720,d0
    1ac8:	7202           	moveq #2,d1
    1aca:	4eae ff3a      	jsr -198(a6)
    1ace:	2800           	move.l d0,d4
  if( source == 0) {
    1ad0:	6700 29fc      	beq.w 44ce <ZoomTest+0x2a5e>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1ad4:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1ada:	203c 0001 1440 	move.l #70720,d0
    1ae0:	7202           	moveq #2,d1
    1ae2:	4eae ff3a      	jsr -198(a6)
    1ae6:	2a00           	move.l d0,d5
  if( destination == 0) {
    1ae8:	6700 2a50      	beq.w 453a <ZoomTest+0x2aca>
    1aec:	2004           	move.l d4,d0
    1aee:	0680 0000 3300 	addi.l #13056,d0
    1af4:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    1af6:	20bc 5555 5555 	move.l #1431655765,(a0)
    1afc:	217c 5555 5555 	move.l #1431655765,4(a0)
    1b02:	0004 
    1b04:	217c 5555 5555 	move.l #1431655765,8(a0)
    1b0a:	0008 
    1b0c:	217c 5555 5555 	move.l #1431655765,12(a0)
    1b12:	000c 
    1b14:	217c 5555 5555 	move.l #1431655765,16(a0)
    1b1a:	0010 
    1b1c:	217c 5555 5555 	move.l #1431655765,20(a0)
    1b22:	0014 
    1b24:	217c 5555 5555 	move.l #1431655765,24(a0)
    1b2a:	0018 
    1b2c:	217c 5555 5555 	move.l #1431655765,28(a0)
    1b32:	001c 
    1b34:	217c 5555 5555 	move.l #1431655765,32(a0)
    1b3a:	0020 
    1b3c:	217c 5555 5555 	move.l #1431655765,36(a0)
    1b42:	0024 
    1b44:	217c 5555 5555 	move.l #1431655765,40(a0)
    1b4a:	0028 
    1b4c:	217c 5555 5555 	move.l #1431655765,44(a0)
    1b52:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1b54:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1b5a:	0030 
    1b5c:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1b62:	0034 
    1b64:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1b6a:	0038 
    1b6c:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1b72:	003c 
    1b74:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1b7a:	0040 
    1b7c:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1b82:	0044 
    1b84:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1b8a:	0048 
    1b8c:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1b92:	004c 
    1b94:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    1b9a:	0050 
    1b9c:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1ba2:	0054 
    1ba4:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    1baa:	0058 
    1bac:	41e8 0060      	lea 96(a0),a0
    1bb0:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1bb6:	fffc 
  for(int i=0;i<128+8;i++) {
    1bb8:	b1c0           	cmpa.l d0,a0
    1bba:	6600 ff3a      	bne.w 1af6 <ZoomTest+0x86>
  WaitVbl();
    1bbe:	4eba fe6a      	jsr 1a2a <WaitVbl>(pc)
  Init_Blit();
    1bc2:	4eba f8d2      	jsr 1496 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1bc6:	33fc 0001 0001 	move.w #1,16a74 <ZoomBlit_Increment4SrcA>
    1bcc:	6a74 
  WaitBlit(); 
    1bce:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1bd4:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1bd8:	2079 0001 6a7e 	movea.l 16a7e <hw>,a0
    1bde:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1be4:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1bea:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    1bf0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1bf6:	7005           	moveq #5,d0
    1bf8:	224a           	movea.l a2,a1
    1bfa:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    1bfe:	4878 0005      	pea 5 <_start+0x5>
    1c02:	42a7           	clr.l -(sp)
    1c04:	2f05           	move.l d5,-(sp)
    1c06:	2f04           	move.l d4,-(sp)
    1c08:	4eba f460      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    1c0c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1c12:	7005           	moveq #5,d0
    1c14:	224a           	movea.l a2,a1
    1c16:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 7)
    1c1a:	4fef 0010      	lea 16(sp),sp
    1c1e:	7007           	moveq #7,d0
    1c20:	b0b9 0001 6a86 	cmp.l 16a86 <Counter4Frames>,d0
    1c26:	6c1e           	bge.s 1c46 <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    1c28:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c2e:	4eae ffc4      	jsr -60(a6)
    1c32:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c38:	2200           	move.l d0,d1
    1c3a:	243c 0001 5038 	move.l #86072,d2
    1c40:	761f           	moveq #31,d3
    1c42:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    1c46:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1c4c:	2244           	movea.l d4,a1
    1c4e:	203c 0001 1440 	move.l #70720,d0
    1c54:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1c58:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1c5e:	2245           	movea.l d5,a1
    1c60:	203c 0001 1440 	move.l #70720,d0
    1c66:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    1c6a:	47fa fbc0      	lea 182c <PrepareDisplayZoom>(pc),a3
    1c6e:	4e93           	jsr (a3)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1c70:	4878 0010      	pea 10 <main+0xa>
    1c74:	4879 0001 66c8 	pea 166c8 <ClsSprites>
    1c7a:	42a7           	clr.l -(sp)
    1c7c:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1c82:	49fa f148      	lea dcc <TestCopperlistBatch>(pc),a4
    1c86:	4e94           	jsr (a4)
    1c88:	4fef 0010      	lea 16(sp),sp
    1c8c:	4a80           	tst.l d0
    1c8e:	661e           	bne.s 1cae <ZoomTest+0x23e>
    Write( Output(), 
    1c90:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1c96:	4eae ffc4      	jsr -60(a6)
    1c9a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ca0:	2200           	move.l d0,d1
    1ca2:	243c 0001 5058 	move.l #86104,d2
    1ca8:	7645           	moveq #69,d3
    1caa:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    1cae:	4878 000c      	pea c <main+0x6>
    1cb2:	4879 0001 6698 	pea 16698 <ClScreen>
    1cb8:	4878 0010      	pea 10 <main+0xa>
    1cbc:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1cc2:	4e94           	jsr (a4)
    1cc4:	4fef 0010      	lea 16(sp),sp
    1cc8:	4a80           	tst.l d0
    1cca:	661e           	bne.s 1cea <ZoomTest+0x27a>
    Write( Output(), 
    1ccc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1cd2:	4eae ffc4      	jsr -60(a6)
    1cd6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1cdc:	2200           	move.l d0,d1
    1cde:	243c 0001 509e 	move.l #86174,d2
    1ce4:	7646           	moveq #70,d3
    1ce6:	4eae ffd0      	jsr -48(a6)

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
    1cea:	2079 0001 6a68 	movea.l 16a68 <DrawCopper>,a0
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    UWORD lowword = (ULONG)plane2set & 0xffff;
    *posofcopper = highword;
    1cf0:	317c 0004 0072 	move.w #4,114(a0)
    posofcopper += 2;
    *posofcopper = lowword;
    1cf6:	4268 0076      	clr.w 118(a0)
    *posofcopper = highword;
    1cfa:	317c 0004 007a 	move.w #4,122(a0)
    *posofcopper = lowword;
    1d00:	317c 0030 007e 	move.w #48,126(a0)
    *posofcopper = highword;
    1d06:	317c 0004 0082 	move.w #4,130(a0)
    *posofcopper = lowword;
    1d0c:	317c 0060 0086 	move.w #96,134(a0)
    *posofcopper = highword;
    1d12:	317c 0004 008a 	move.w #4,138(a0)
    *posofcopper = lowword;
    1d18:	317c 0090 008e 	move.w #144,142(a0)
    *posofcopper = highword;
    1d1e:	317c 0004 0092 	move.w #4,146(a0)
    *posofcopper = lowword;
    1d24:	317c 00c0 0096 	move.w #192,150(a0)
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
    1d2a:	23fc 0005 0000 	move.l #327680,16a76 <DrawBuffer>
    1d30:	0001 6a76 
  ViewBuffer = (ULONG *) tmp;
    1d34:	23fc 0004 0000 	move.l #262144,16a6c <ViewBuffer>
    1d3a:	0001 6a6c 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    1d3e:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    1d44:	4878 001c      	pea 1c <main+0x16>
    1d48:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1d4e:	45fa ed7c      	lea acc <TestCopperlistPos>(pc),a2
    1d52:	4e92           	jsr (a2)
    1d54:	4fef 000c      	lea 12(sp),sp
    1d58:	4a80           	tst.l d0
    1d5a:	661e           	bne.s 1d7a <ZoomTest+0x30a>
    Write(Output(), 
    1d5c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d62:	4eae ffc4      	jsr -60(a6)
    1d66:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d6c:	2200           	move.l d0,d1
    1d6e:	243c 0001 50e5 	move.l #86245,d2
    1d74:	763c           	moveq #60,d3
    1d76:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1d7a:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1d80:	4878 001d      	pea 1d <main+0x17>
    1d84:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1d8a:	4e92           	jsr (a2)
    1d8c:	4fef 000c      	lea 12(sp),sp
    1d90:	4a80           	tst.l d0
    1d92:	661e           	bne.s 1db2 <ZoomTest+0x342>
    Write(Output(), 
    1d94:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1d9a:	4eae ffc4      	jsr -60(a6)
    1d9e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1da4:	2200           	move.l d0,d1
    1da6:	243c 0001 5122 	move.l #86306,d2
    1dac:	763c           	moveq #60,d3
    1dae:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1db2:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1db8:	4878 001e      	pea 1e <main+0x18>
    1dbc:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1dc2:	4e92           	jsr (a2)
    1dc4:	4fef 000c      	lea 12(sp),sp
    1dc8:	4a80           	tst.l d0
    1dca:	661e           	bne.s 1dea <ZoomTest+0x37a>
    Write(Output(), 
    1dcc:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1dd2:	4eae ffc4      	jsr -60(a6)
    1dd6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ddc:	2200           	move.l d0,d1
    1dde:	243c 0001 515f 	move.l #86367,d2
    1de4:	763c           	moveq #60,d3
    1de6:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60030) == 0)
    1dea:	2f3c 00e6 0030 	move.l #15073328,-(sp)
    1df0:	4878 001f      	pea 1f <main+0x19>
    1df4:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1dfa:	4e92           	jsr (a2)
    1dfc:	4fef 000c      	lea 12(sp),sp
    1e00:	4a80           	tst.l d0
    1e02:	661e           	bne.s 1e22 <ZoomTest+0x3b2>
    Write(Output(), 
    1e04:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1e0a:	4eae ffc4      	jsr -60(a6)
    1e0e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1e14:	2200           	move.l d0,d1
    1e16:	243c 0001 519c 	move.l #86428,d2
    1e1c:	763c           	moveq #60,d3
    1e1e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    1e22:	4878 0020      	pea 20 <main+0x1a>
    1e26:	4879 0001 6618 	pea 16618 <ClColor>
    1e2c:	4878 0026      	pea 26 <main+0x20>
    1e30:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1e36:	4e94           	jsr (a4)
    1e38:	4fef 0010      	lea 16(sp),sp
    1e3c:	4a80           	tst.l d0
    1e3e:	661e           	bne.s 1e5e <ZoomTest+0x3ee>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    1e40:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1e46:	4eae ffc4      	jsr -60(a6)
    1e4a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1e50:	2200           	move.l d0,d1
    1e52:	243c 0001 51d9 	move.l #86489,d2
    1e58:	7625           	moveq #37,d3
    1e5a:	4eae ffd0      	jsr -48(a6)
  Zoom_Shrink102( 4, (UWORD *) Copperlist1);
    1e5e:	2439 0001 6a70 	move.l 16a70 <Copperlist1>,d2
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
  UWORD *values4shift = Values4Shift+levelofshrink*30;
  copperlist+=3+73*2;
    1e64:	2242           	movea.l d2,a1
    1e66:	43e9 012a      	lea 298(a1),a1
  UWORD *values4shift = Values4Shift+levelofshrink*30;
    1e6a:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    1e70:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1e72:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
    1e74:	b1fc 0001 612c 	cmpa.l #90412,a0
    1e7a:	66f4           	bne.s 1e70 <ZoomTest+0x400>
  }
  values4shift -= 30;
  copperlist += 10;
    1e7c:	2242           	movea.l d2,a1
    1e7e:	43e9 01b6      	lea 438(a1),a1
  values4shift -= 30;
    1e82:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    1e88:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1e8a:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
    1e8c:	b1fc 0001 612c 	cmpa.l #90412,a0
    1e92:	66f4           	bne.s 1e88 <ZoomTest+0x418>
  }
  values4shift -= 30;
  copperlist += 6;
    1e94:	2242           	movea.l d2,a1
    1e96:	43e9 023a      	lea 570(a1),a1
  values4shift -= 30;
    1e9a:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    1ea0:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1ea2:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
    1ea4:	b1fc 0001 612c 	cmpa.l #90412,a0
    1eaa:	66f4           	bne.s 1ea0 <ZoomTest+0x430>
  }
  values4shift -= 30;
  copperlist += 6;
    1eac:	2242           	movea.l d2,a1
    1eae:	43e9 02be      	lea 702(a1),a1
  values4shift -= 30;
    1eb2:	41f9 0001 60f0 	lea 160f0 <Values4Shift+0xf0>,a0
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    1eb8:	3298           	move.w (a0)+,(a1)
    copperlist += 2;
    1eba:	5889           	addq.l #4,a1
  for(int i = 0; i<30;i++) {
    1ebc:	b1fc 0001 612c 	cmpa.l #90412,a0
    1ec2:	66f4           	bne.s 1eb8 <ZoomTest+0x448>
  }
  UWORD *bp = 0x200;
  *bp = 0;
    1ec4:	4278 0200      	clr.w 200 <main+0x1fa>
  if( TestCopperlistPos( cl2test, position, *template4cl) == 0)
    1ec8:	2f39 0001 63fc 	move.l 163fc <Cl102ZoomRepeat>,-(sp)
    1ece:	4878 0049      	pea 49 <main+0x43>
    1ed2:	2f02           	move.l d2,-(sp)
    1ed4:	4e92           	jsr (a2)
    1ed6:	4fef 000c      	lea 12(sp),sp
    1eda:	4a80           	tst.l d0
    1edc:	6600 24d2      	bne.w 43b0 <ZoomTest+0x2940>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    1ee0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ee6:	4eae ffc4      	jsr -60(a6)
    1eea:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1ef0:	2200           	move.l d0,d1
    1ef2:	243c 0001 51ff 	move.l #86527,d2
    1ef8:	7625           	moveq #37,d3
    1efa:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 73+134, 0xfffffffe) == 0)
    1efe:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd816f>
    1f02:	4878 00cf      	pea cf <main+0xc9>
    1f06:	2f39 0001 6a70 	move.l 16a70 <Copperlist1>,-(sp)
    1f0c:	4e92           	jsr (a2)
    1f0e:	4fef 000c      	lea 12(sp),sp
    1f12:	4a80           	tst.l d0
    1f14:	661e           	bne.s 1f34 <ZoomTest+0x4c4>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    1f16:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1f1c:	4eae ffc4      	jsr -60(a6)
    1f20:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    1f26:	2200           	move.l d0,d1
    1f28:	243c 0001 5224 	move.l #86564,d2
    1f2e:	7632           	moveq #50,d3
    1f30:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1f34:	2f3c 0001 6800 	move.l #92160,-(sp)
    1f3a:	4878 591c      	pea 591c <incbin_startimage_start+0x978>
    1f3e:	4bfa fa78      	lea 19b8 <FreeDisplay>(pc),a5
    1f42:	4e95           	jsr (a5)
  Zoom_Init();
    1f44:	49fa fa04      	lea 194a <Zoom_Init>(pc),a4
    1f48:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1f4a:	4e93           	jsr (a3)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1f4c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    1f52:	203c 0000 c800 	move.l #51200,d0
    1f58:	7202           	moveq #2,d1
    1f5a:	4eae ff3a      	jsr -198(a6)
    1f5e:	2040           	movea.l d0,a0
    1f60:	23c0 0001 6a7a 	move.l d0,16a7a <Zoom_Source>
  if( Zoom_Source == 0) {
    1f66:	508f           	addq.l #8,sp
    1f68:	6700 2542      	beq.w 44ac <ZoomTest+0x2a3c>
  *tstsource++ = 0x0000;
    1f6c:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1f6e:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1f74:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1f7a:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1f80:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1f84:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1f8a:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1f90:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1f94:	4eba f500      	jsr 1496 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1f98:	33fc 0001 0001 	move.w #1,16a74 <ZoomBlit_Increment4SrcA>
    1f9e:	6a74 
  WaitBlit(); 
    1fa0:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1fa6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1faa:	2479 0001 6a7e 	movea.l 16a7e <hw>,a2
    1fb0:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1fb6:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1fbc:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1fc2:	2639 0001 6a76 	move.l 16a76 <DrawBuffer>,d3
    1fc8:	2439 0001 6a7a 	move.l 16a7a <Zoom_Source>,d2
  WaitBlt();
    1fce:	4eba f084      	jsr 1054 <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1fd2:	7000           	moveq #0,d0
    1fd4:	3039 0001 6a74 	move.w 16a74 <ZoomBlit_Increment4SrcA>,d0
    1fda:	d080           	add.l d0,d0
    1fdc:	d082           	add.l d2,d0
    1fde:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1fe2:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1fe6:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1fea:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1ff0:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    1ff6:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1ffa:	2479 0001 6a76 	movea.l 16a76 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    2000:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    2006:	671e           	beq.s 2026 <ZoomTest+0x5b6>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    2008:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    200e:	4eae ffc4      	jsr -60(a6)
    2012:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2018:	2200           	move.l d0,d1
    201a:	243c 0001 528f 	move.l #86671,d2
    2020:	761c           	moveq #28,d3
    2022:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    2026:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    202c:	671e           	beq.s 204c <ZoomTest+0x5dc>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    202e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2034:	4eae ffc4      	jsr -60(a6)
    2038:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    203e:	2200           	move.l d0,d1
    2040:	243c 0001 52ac 	move.l #86700,d2
    2046:	761c           	moveq #28,d3
    2048:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    204c:	2079 0001 6a76 	movea.l 16a76 <DrawBuffer>,a0
    2052:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    2058:	671e           	beq.s 2078 <ZoomTest+0x608>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    205a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2060:	4eae ffc4      	jsr -60(a6)
    2064:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    206a:	2200           	move.l d0,d1
    206c:	243c 0001 52c9 	move.l #86729,d2
    2072:	761a           	moveq #26,d3
    2074:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    2078:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    207e:	2279 0001 6a7a 	movea.l 16a7a <Zoom_Source>,a1
    2084:	203c 0000 c800 	move.l #51200,d0
    208a:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    208e:	2f3c 0001 6800 	move.l #92160,-(sp)
    2094:	4878 591c      	pea 591c <incbin_startimage_start+0x978>
    2098:	4e95           	jsr (a5)
    209a:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    209c:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    20a2:	203c 0000 05a0 	move.l #1440,d0
    20a8:	7202           	moveq #2,d1
    20aa:	4eae ff3a      	jsr -198(a6)
    20ae:	2440           	movea.l d0,a2
  if( source == 0) {
    20b0:	4a80           	tst.l d0
    20b2:	6700 2362      	beq.w 4416 <ZoomTest+0x29a6>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    20b6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    20bc:	203c 0000 05a0 	move.l #1440,d0
    20c2:	7202           	moveq #2,d1
    20c4:	4eae ff3a      	jsr -198(a6)
    20c8:	2640           	movea.l d0,a3
  if( destination == 0) {
    20ca:	4a80           	tst.l d0
    20cc:	6700 2348      	beq.w 4416 <ZoomTest+0x29a6>
    *tmp++ = 0;
    20d0:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    20d2:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    20d8:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    20de:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    20e2:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    20e6:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    20ec:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    20f2:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    20f6:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    20fa:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    2100:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    2106:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    210a:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    210e:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    2114:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    211a:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    211e:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    2122:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    2128:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    212e:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    2132:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    2136:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    213c:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    2142:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    2146:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    214a:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    2150:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    2156:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    215a:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    215e:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    2164:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    216a:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    216e:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    2172:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    2178:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    217e:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    2182:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    2186:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    218c:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    2192:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    2196:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    219a:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    21a0:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    21a6:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    21aa:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    21ae:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    21b4:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    21ba:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    21be:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    21c2:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    21c8:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    21ce:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    21d2:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    21d6:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    21dc:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    21e2:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    21e6:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    21ea:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    21f0:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    21f6:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    21fa:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    21fe:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    2204:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    220a:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    220e:	4878 05a0      	pea 5a0 <main+0x59a>
    2212:	42a7           	clr.l -(sp)
    2214:	2f00           	move.l d0,-(sp)
    2216:	4eba 23d6      	jsr 45ee <memset>(pc)
  WaitBlit();
    221a:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2220:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    2224:	4e94           	jsr (a4)
  WaitBlit();
    2226:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    222c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    2230:	2879 0001 6a7e 	movea.l 16a7e <hw>,a4
    2236:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    223c:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    2242:	4eba ee10      	jsr 1054 <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    2246:	200a           	move.l a2,d0
    2248:	5480           	addq.l #2,d0
    224a:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    224e:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    2252:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    2258:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    225e:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    2262:	4fef 000c      	lea 12(sp),sp
    2266:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    226c:	671e           	beq.s 228c <ZoomTest+0x81c>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    226e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    2274:	4eae ffc4      	jsr -60(a6)
    2278:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    227e:	2200           	move.l d0,d1
    2280:	243c 0001 531a 	move.l #86810,d2
    2286:	761f           	moveq #31,d3
    2288:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    228c:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    2292:	671e           	beq.s 22b2 <ZoomTest+0x842>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    2294:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    229a:	4eae ffc4      	jsr -60(a6)
    229e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    22a4:	2200           	move.l d0,d1
    22a6:	243c 0001 533a 	move.l #86842,d2
    22ac:	7620           	moveq #32,d3
    22ae:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    22b2:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22b8:	224a           	movea.l a2,a1
    22ba:	203c 0000 05a0 	move.l #1440,d0
    22c0:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    22c4:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22ca:	224b           	movea.l a3,a1
    22cc:	203c 0000 05a0 	move.l #1440,d0
    22d2:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    22d6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22dc:	203c 0000 3740 	move.l #14144,d0
    22e2:	7202           	moveq #2,d1
    22e4:	4eae ff3a      	jsr -198(a6)
    22e8:	2600           	move.l d0,d3
  if( source == 0) {
    22ea:	6700 2160      	beq.w 444c <ZoomTest+0x29dc>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    22ee:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    22f4:	203c 0000 3740 	move.l #14144,d0
    22fa:	7202           	moveq #2,d1
    22fc:	4eae ff3a      	jsr -198(a6)
    2300:	2840           	movea.l d0,a4
  if( destination == 0) {
    2302:	4a80           	tst.l d0
    2304:	6700 21ea      	beq.w 44f0 <ZoomTest+0x2a80>
    2308:	2003           	move.l d3,d0
    230a:	0680 0000 3300 	addi.l #13056,d0
    2310:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    2312:	20bc 5555 5555 	move.l #1431655765,(a0)
    2318:	217c 5555 5555 	move.l #1431655765,4(a0)
    231e:	0004 
    2320:	217c 5555 5555 	move.l #1431655765,8(a0)
    2326:	0008 
    2328:	217c 5555 5555 	move.l #1431655765,12(a0)
    232e:	000c 
    2330:	217c 5555 5555 	move.l #1431655765,16(a0)
    2336:	0010 
    2338:	217c 5555 5555 	move.l #1431655765,20(a0)
    233e:	0014 
    2340:	217c 5555 5555 	move.l #1431655765,24(a0)
    2346:	0018 
    2348:	217c 5555 5555 	move.l #1431655765,28(a0)
    234e:	001c 
    2350:	217c 5555 5555 	move.l #1431655765,32(a0)
    2356:	0020 
    2358:	217c 5555 5555 	move.l #1431655765,36(a0)
    235e:	0024 
    2360:	217c 5555 5555 	move.l #1431655765,40(a0)
    2366:	0028 
    2368:	217c 5555 5555 	move.l #1431655765,44(a0)
    236e:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    2370:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    2376:	0030 
    2378:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    237e:	0034 
    2380:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    2386:	0038 
    2388:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    238e:	003c 
    2390:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    2396:	0040 
    2398:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    239e:	0044 
    23a0:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    23a6:	0048 
    23a8:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    23ae:	004c 
    23b0:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    23b6:	0050 
    23b8:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    23be:	0054 
    23c0:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    23c6:	0058 
    23c8:	41e8 0060      	lea 96(a0),a0
    23cc:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    23d2:	fffc 
  for(int i=0;i<128+8;i++) {
    23d4:	b1c0           	cmpa.l d0,a0
    23d6:	6600 ff3a      	bne.w 2312 <ZoomTest+0x8a2>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    23da:	4878 0001      	pea 1 <_start+0x1>
    23de:	42a7           	clr.l -(sp)
    23e0:	2f0c           	move.l a4,-(sp)
    23e2:	2f03           	move.l d3,-(sp)
    23e4:	4eba ec84      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    23e8:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    23ee:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    23f2:	41ec 0004      	lea 4(a4),a0
    23f6:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    23fa:	41ec 0364      	lea 868(a4),a0
    23fe:	2f48 004c      	move.l a0,76(sp)
    2402:	2a08           	move.l a0,d5
    2404:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    2408:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    240c:	74ff           	moveq #-1,d2
    240e:	7800           	moveq #0,d4
    2410:	4644           	not.w d4
    2412:	4bfa e59a      	lea 9ae <TestRow>(pc),a5
    2416:	2445           	movea.l d5,a2
    2418:	45ea fca0      	lea -864(a2),a2
    241c:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    2420:	2f0e           	move.l a6,-(sp)
    2422:	2f04           	move.l d4,-(sp)
    2424:	2f0a           	move.l a2,-(sp)
    2426:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    242c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    242e:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2432:	4642           	not.w d2
    2434:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    2436:	4fef 0010      	lea 16(sp),sp
    243a:	ba8a           	cmp.l a2,d5
    243c:	6600 1888      	bne.w 3cc6 <ZoomTest+0x2256>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    2440:	2f0b           	move.l a3,-(sp)
    2442:	7800           	moveq #0,d4
    2444:	3802           	move.w d2,d4
    2446:	2f04           	move.l d4,-(sp)
    2448:	2f0a           	move.l a2,-(sp)
    244a:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    2450:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2452:	2a0a           	move.l a2,d5
    2454:	0685 0000 0390 	addi.l #912,d5
    245a:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    245e:	4fef 0010      	lea 16(sp),sp
    2462:	b6fc 011c      	cmpa.w #284,a3
    2466:	66ae           	bne.s 2416 <ZoomTest+0x9a6>
    2468:	41ec 31e4      	lea 12772(a4),a0
    246c:	2f48 0030      	move.l a0,48(sp)
    2470:	2448           	movea.l a0,a2
    2472:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    2478:	2f05           	move.l d5,-(sp)
    247a:	2f04           	move.l d4,-(sp)
    247c:	2f0a           	move.l a2,-(sp)
    247e:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    2484:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2486:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    248a:	4642           	not.w d2
    248c:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    248e:	4fef 0010      	lea 16(sp),sp
    2492:	0c85 0000 010d 	cmpi.l #269,d5
    2498:	6726           	beq.s 24c0 <ZoomTest+0xa50>
    249a:	7800           	moveq #0,d4
    249c:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    249e:	2f05           	move.l d5,-(sp)
    24a0:	2f04           	move.l d4,-(sp)
    24a2:	2f0a           	move.l a2,-(sp)
    24a4:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    24aa:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    24ac:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    24b0:	4642           	not.w d2
    24b2:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    24b4:	4fef 0010      	lea 16(sp),sp
    24b8:	0c85 0000 010d 	cmpi.l #269,d5
    24be:	66da           	bne.s 249a <ZoomTest+0xa2a>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    24c0:	4878 0001      	pea 1 <_start+0x1>
    24c4:	4878 0001      	pea 1 <_start+0x1>
    24c8:	2f03           	move.l d3,-(sp)
    24ca:	2f0c           	move.l a4,-(sp)
    24cc:	4eba eb9c      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    24d0:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    24d6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    24da:	2003           	move.l d3,d0
    24dc:	5880           	addq.l #4,d0
    24de:	2f40 003c      	move.l d0,60(sp)
    24e2:	4fef 0010      	lea 16(sp),sp
    24e6:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    24e8:	7800           	moveq #0,d4
  mask = 0x0000;
    24ea:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    24ec:	2f04           	move.l d4,-(sp)
    24ee:	3f02           	move.w d2,-(sp)
    24f0:	4267           	clr.w -(sp)
    24f2:	2f0a           	move.l a2,-(sp)
    24f4:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    24fa:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    24fc:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2500:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    2502:	5284           	addq.l #1,d4
    2504:	4fef 0010      	lea 16(sp),sp
    2508:	720b           	moveq #11,d1
    250a:	b284           	cmp.l d4,d1
    250c:	66de           	bne.s 24ec <ZoomTest+0xa7c>
  TestRow( valsupposed, valactual, 0xffff, 8);
    250e:	4878 0008      	pea 8 <main+0x2>
    2512:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2518:	2003           	move.l d3,d0
    251a:	0680 0000 0214 	addi.l #532,d0
    2520:	2f40 005c      	move.l d0,92(sp)
    2524:	2f00           	move.l d0,-(sp)
    2526:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    252c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    252e:	4878 0009      	pea 9 <main+0x3>
    2532:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2538:	2043           	movea.l d3,a0
    253a:	4868 0244      	pea 580(a0)
    253e:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2544:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    2546:	4fef 0020      	lea 32(sp),sp
    254a:	4878 000a      	pea a <main+0x4>
    254e:	42a7           	clr.l -(sp)
    2550:	2043           	movea.l d3,a0
    2552:	4868 0274      	pea 628(a0)
    2556:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    255c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    255e:	4878 000b      	pea b <main+0x5>
    2562:	42a7           	clr.l -(sp)
    2564:	2043           	movea.l d3,a0
    2566:	4868 02a4      	pea 676(a0)
    256a:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2570:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    2572:	2c03           	move.l d3,d6
    2574:	0686 0000 05d4 	addi.l #1492,d6
    257a:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    257e:	2e06           	move.l d6,d7
    2580:	367c 0018      	movea.w #24,a3
    2584:	7a00           	moveq #0,d5
    2586:	3a02           	move.w d2,d5
    2588:	2447           	movea.l d7,a2
    258a:	45ea fd00      	lea -768(a2),a2
    258e:	4deb fff3      	lea -13(a3),a6
    2592:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2594:	2f0e           	move.l a6,-(sp)
    2596:	2f04           	move.l d4,-(sp)
    2598:	2f0a           	move.l a2,-(sp)
    259a:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25a0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    25a2:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    25a6:	4642           	not.w d2
    25a8:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    25aa:	4fef 0010      	lea 16(sp),sp
    25ae:	be8a           	cmp.l a2,d7
    25b0:	6722           	beq.s 25d4 <ZoomTest+0xb64>
    25b2:	7800           	moveq #0,d4
    25b4:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    25b6:	2f0e           	move.l a6,-(sp)
    25b8:	2f04           	move.l d4,-(sp)
    25ba:	2f0a           	move.l a2,-(sp)
    25bc:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25c2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    25c4:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    25c8:	4642           	not.w d2
    25ca:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    25cc:	4fef 0010      	lea 16(sp),sp
    25d0:	be8a           	cmp.l a2,d7
    25d2:	66de           	bne.s 25b2 <ZoomTest+0xb42>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    25d4:	7a00           	moveq #0,d5
    25d6:	3a02           	move.w d2,d5
    25d8:	2f0b           	move.l a3,-(sp)
    25da:	2f05           	move.l d5,-(sp)
    25dc:	2f0a           	move.l a2,-(sp)
    25de:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25e4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    25e6:	486b 0001      	pea 1(a3)
    25ea:	2f05           	move.l d5,-(sp)
    25ec:	486a 0030      	pea 48(a2)
    25f0:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    25f6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    25f8:	4fef 0020      	lea 32(sp),sp
    25fc:	486b 0002      	pea 2(a3)
    2600:	2f04           	move.l d4,-(sp)
    2602:	486a 0060      	pea 96(a2)
    2606:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    260c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    260e:	486b 0003      	pea 3(a3)
    2612:	2f04           	move.l d4,-(sp)
    2614:	486a 0090      	pea 144(a2)
    2618:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    261e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2620:	2e0a           	move.l a2,d7
    2622:	0687 0000 03c0 	addi.l #960,d7
    2628:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    262c:	4fef 0020      	lea 32(sp),sp
    2630:	b6fc 00e4      	cmpa.w #228,a3
    2634:	6600 ff52      	bne.w 2588 <ZoomTest+0xb18>
    2638:	2003           	move.l d3,d0
    263a:	0680 0000 2fd4 	addi.l #12244,d0
    2640:	2f40 0068      	move.l d0,104(sp)
    2644:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    2646:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    2648:	2f04           	move.l d4,-(sp)
    264a:	2f05           	move.l d5,-(sp)
    264c:	2f0a           	move.l a2,-(sp)
    264e:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2654:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2656:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    265a:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    265c:	5284           	addq.l #1,d4
    265e:	4fef 0010      	lea 16(sp),sp
    2662:	720f           	moveq #15,d1
    2664:	b284           	cmp.l d4,d1
    2666:	6724           	beq.s 268c <ZoomTest+0xc1c>
    2668:	7a00           	moveq #0,d5
    266a:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    266c:	2f04           	move.l d4,-(sp)
    266e:	2f05           	move.l d5,-(sp)
    2670:	2f0a           	move.l a2,-(sp)
    2672:	4879 0001 69c8 	pea 169c8 <destlinezoom2>
    2678:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    267a:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    267e:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    2680:	5284           	addq.l #1,d4
    2682:	4fef 0010      	lea 16(sp),sp
    2686:	720f           	moveq #15,d1
    2688:	b284           	cmp.l d4,d1
    268a:	66dc           	bne.s 2668 <ZoomTest+0xbf8>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    268c:	4878 0001      	pea 1 <_start+0x1>
    2690:	4878 0002      	pea 2 <_start+0x2>
    2694:	2f0c           	move.l a4,-(sp)
    2696:	2f03           	move.l d3,-(sp)
    2698:	4eba e9d0      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    269c:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    26a2:	4eae ff1c      	jsr -228(a6)
    26a6:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    26aa:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    26ae:	7400           	moveq #0,d2
  mask = 0xffff;
    26b0:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    26b2:	2f02           	move.l d2,-(sp)
    26b4:	3f04           	move.w d4,-(sp)
    26b6:	4267           	clr.w -(sp)
    26b8:	2f0a           	move.l a2,-(sp)
    26ba:	4879 0001 699c 	pea 1699c <destlinezoom3>
    26c0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    26c2:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    26c6:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    26c8:	5282           	addq.l #1,d2
    26ca:	4fef 0010      	lea 16(sp),sp
    26ce:	7004           	moveq #4,d0
    26d0:	b082           	cmp.l d2,d0
    26d2:	66de           	bne.s 26b2 <ZoomTest+0xc42>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    26d4:	4878 0004      	pea 4 <_start+0x4>
    26d8:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26de:	486c 00c4      	pea 196(a4)
    26e2:	4879 0001 699c 	pea 1699c <destlinezoom3>
    26e8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    26ea:	4878 0005      	pea 5 <_start+0x5>
    26ee:	2f3c 0000 ffff 	move.l #65535,-(sp)
    26f4:	486c 00f4      	pea 244(a4)
    26f8:	4879 0001 699c 	pea 1699c <destlinezoom3>
    26fe:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2700:	4fef 0020      	lea 32(sp),sp
    2704:	4878 0006      	pea 6 <main>
    2708:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    270a:	41ec 0124      	lea 292(a4),a0
    270e:	2f48 006c      	move.l a0,108(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    2712:	2f08           	move.l a0,-(sp)
    2714:	4879 0001 699c 	pea 1699c <destlinezoom3>
    271a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    271c:	4878 0007      	pea 7 <main+0x1>
    2720:	42a7           	clr.l -(sp)
    2722:	486c 0154      	pea 340(a4)
    2726:	4879 0001 699c 	pea 1699c <destlinezoom3>
    272c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    272e:	4fef 0020      	lea 32(sp),sp
    2732:	4878 0008      	pea 8 <main+0x2>
    2736:	2f3c 0000 ffff 	move.l #65535,-(sp)
    273c:	486c 0184      	pea 388(a4)
    2740:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2746:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2748:	4878 0009      	pea 9 <main+0x3>
    274c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2752:	486c 01b4      	pea 436(a4)
    2756:	4879 0001 699c 	pea 1699c <destlinezoom3>
    275c:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    275e:	280c           	move.l a4,d4
    2760:	0684 0000 04b4 	addi.l #1204,d4
    2766:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    276a:	367c 0018      	movea.w #24,a3
    276e:	7a00           	moveq #0,d5
    2770:	74ff           	moveq #-1,d2
    2772:	2444           	movea.l d4,a2
    2774:	45ea fd30      	lea -720(a2),a2
    2778:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    277c:	2f0e           	move.l a6,-(sp)
    277e:	2f05           	move.l d5,-(sp)
    2780:	2f0a           	move.l a2,-(sp)
    2782:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2788:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    278a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    278e:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    2790:	4fef 0010      	lea 16(sp),sp
    2794:	b88a           	cmp.l a2,d4
    2796:	6722           	beq.s 27ba <ZoomTest+0xd4a>
    2798:	7a00           	moveq #0,d5
    279a:	3a02           	move.w d2,d5
    279c:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    279e:	2f0e           	move.l a6,-(sp)
    27a0:	2f05           	move.l d5,-(sp)
    27a2:	2f0a           	move.l a2,-(sp)
    27a4:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27aa:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    27ac:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    27b0:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    27b2:	4fef 0010      	lea 16(sp),sp
    27b6:	b88a           	cmp.l a2,d4
    27b8:	66de           	bne.s 2798 <ZoomTest+0xd28>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    27ba:	7800           	moveq #0,d4
    27bc:	3802           	move.w d2,d4
    27be:	2f0b           	move.l a3,-(sp)
    27c0:	2f04           	move.l d4,-(sp)
    27c2:	2f0a           	move.l a2,-(sp)
    27c4:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27ca:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    27cc:	486b 0001      	pea 1(a3)
    27d0:	2f04           	move.l d4,-(sp)
    27d2:	486a 0030      	pea 48(a2)
    27d6:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27dc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    27de:	4fef 0020      	lea 32(sp),sp
    27e2:	486b 0002      	pea 2(a3)
    27e6:	2f05           	move.l d5,-(sp)
    27e8:	486a 0060      	pea 96(a2)
    27ec:	4879 0001 699c 	pea 1699c <destlinezoom3>
    27f2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    27f4:	486b 0003      	pea 3(a3)
    27f8:	2f05           	move.l d5,-(sp)
    27fa:	486a 0090      	pea 144(a2)
    27fe:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2804:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2806:	4fef 0020      	lea 32(sp),sp
    280a:	486b 0004      	pea 4(a3)
    280e:	2f04           	move.l d4,-(sp)
    2810:	486a 00c0      	pea 192(a2)
    2814:	4879 0001 699c 	pea 1699c <destlinezoom3>
    281a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    281c:	486b 0005      	pea 5(a3)
    2820:	2f04           	move.l d4,-(sp)
    2822:	486a 00f0      	pea 240(a2)
    2826:	4879 0001 699c 	pea 1699c <destlinezoom3>
    282c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    282e:	280a           	move.l a2,d4
    2830:	0684 0000 03f0 	addi.l #1008,d4
    2836:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    283a:	4fef 0020      	lea 32(sp),sp
    283e:	b6fc 0114      	cmpa.w #276,a3
    2842:	6600 ff2e      	bne.w 2772 <ZoomTest+0xd02>
    2846:	45ec 3124      	lea 12580(a4),a2
    284a:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2850:	2f04           	move.l d4,-(sp)
    2852:	2f05           	move.l d5,-(sp)
    2854:	2f0a           	move.l a2,-(sp)
    2856:	4879 0001 699c 	pea 1699c <destlinezoom3>
    285c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    285e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2862:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    2864:	4fef 0010      	lea 16(sp),sp
    2868:	0c84 0000 010d 	cmpi.l #269,d4
    286e:	6726           	beq.s 2896 <ZoomTest+0xe26>
    2870:	7a00           	moveq #0,d5
    2872:	3a02           	move.w d2,d5
    2874:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    2876:	2f04           	move.l d4,-(sp)
    2878:	2f05           	move.l d5,-(sp)
    287a:	2f0a           	move.l a2,-(sp)
    287c:	4879 0001 699c 	pea 1699c <destlinezoom3>
    2882:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2884:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2888:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    288a:	4fef 0010      	lea 16(sp),sp
    288e:	0c84 0000 010d 	cmpi.l #269,d4
    2894:	66da           	bne.s 2870 <ZoomTest+0xe00>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    2896:	4878 0001      	pea 1 <_start+0x1>
    289a:	4878 0003      	pea 3 <_start+0x3>
    289e:	2f03           	move.l d3,-(sp)
    28a0:	2f0c           	move.l a4,-(sp)
    28a2:	4eba e7c6      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    28a6:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    28ac:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    28b0:	4878 0007      	pea 7 <main+0x1>
    28b4:	42a7           	clr.l -(sp)
    28b6:	2f2f 0044      	move.l 68(sp),-(sp)
    28ba:	4879 0001 6970 	pea 16970 <destlinezoom4>
    28c0:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    28c2:	7034           	moveq #52,d0
    28c4:	d083           	add.l d3,d0
    28c6:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    28ca:	4fef 0020      	lea 32(sp),sp
    28ce:	4878 0008      	pea 8 <main+0x2>
    28d2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    28d8:	2f00           	move.l d0,-(sp)
    28da:	4879 0001 6970 	pea 16970 <destlinezoom4>
    28e0:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    28e2:	7264           	moveq #100,d1
    28e4:	d283           	add.l d3,d1
    28e6:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    28ea:	4878 0009      	pea 9 <main+0x3>
    28ee:	2f3c 0000 ffff 	move.l #65535,-(sp)
    28f4:	2f01           	move.l d1,-(sp)
    28f6:	4879 0001 6970 	pea 16970 <destlinezoom4>
    28fc:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    28fe:	2003           	move.l d3,d0
    2900:	0680 0000 0094 	addi.l #148,d0
    2906:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    290a:	4fef 0020      	lea 32(sp),sp
    290e:	4878 0008      	pea 8 <main+0x2>
    2912:	42a7           	clr.l -(sp)
    2914:	2f00           	move.l d0,-(sp)
    2916:	4879 0001 6970 	pea 16970 <destlinezoom4>
    291c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    291e:	4878 0009      	pea 9 <main+0x3>
    2922:	42a7           	clr.l -(sp)
    2924:	2043           	movea.l d3,a0
    2926:	4868 00c4      	pea 196(a0)
    292a:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2930:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2932:	2003           	move.l d3,d0
    2934:	0680 0000 00f4 	addi.l #244,d0
    293a:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    293e:	2e03           	move.l d3,d7
    2940:	0687 0000 0394 	addi.l #916,d7
    2946:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    294a:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    294e:	7aff           	moveq #-1,d5
    2950:	7400           	moveq #0,d2
    2952:	4642           	not.w d2
    2954:	2447           	movea.l d7,a2
    2956:	45ea fd60      	lea -672(a2),a2
    295a:	4deb fff1      	lea -15(a3),a6
    295e:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2960:	2f0e           	move.l a6,-(sp)
    2962:	2f04           	move.l d4,-(sp)
    2964:	2f0a           	move.l a2,-(sp)
    2966:	4879 0001 6970 	pea 16970 <destlinezoom4>
    296c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    296e:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2972:	4645           	not.w d5
    2974:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2976:	4fef 0010      	lea 16(sp),sp
    297a:	be8a           	cmp.l a2,d7
    297c:	6722           	beq.s 29a0 <ZoomTest+0xf30>
    297e:	7800           	moveq #0,d4
    2980:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    2982:	2f0e           	move.l a6,-(sp)
    2984:	2f04           	move.l d4,-(sp)
    2986:	2f0a           	move.l a2,-(sp)
    2988:	4879 0001 6970 	pea 16970 <destlinezoom4>
    298e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2990:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2994:	4645           	not.w d5
    2996:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    2998:	4fef 0010      	lea 16(sp),sp
    299c:	be8a           	cmp.l a2,d7
    299e:	66de           	bne.s 297e <ZoomTest+0xf0e>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    29a0:	7400           	moveq #0,d2
    29a2:	3405           	move.w d5,d2
    29a4:	2f0b           	move.l a3,-(sp)
    29a6:	2f02           	move.l d2,-(sp)
    29a8:	2f0a           	move.l a2,-(sp)
    29aa:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29b0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    29b2:	486b 0001      	pea 1(a3)
    29b6:	2f02           	move.l d2,-(sp)
    29b8:	486a 0030      	pea 48(a2)
    29bc:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29c2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    29c4:	4fef 0020      	lea 32(sp),sp
    29c8:	486b 0002      	pea 2(a3)
    29cc:	2f04           	move.l d4,-(sp)
    29ce:	486a 0060      	pea 96(a2)
    29d2:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29d8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    29da:	486b 0003      	pea 3(a3)
    29de:	2f04           	move.l d4,-(sp)
    29e0:	486a 0090      	pea 144(a2)
    29e4:	4879 0001 6970 	pea 16970 <destlinezoom4>
    29ea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    29ec:	4deb 0004      	lea 4(a3),a6
    29f0:	4fef 001c      	lea 28(sp),sp
    29f4:	2e8e           	move.l a6,(sp)
    29f6:	2f02           	move.l d2,-(sp)
    29f8:	486a 00c0      	pea 192(a2)
    29fc:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a02:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2a04:	2e0b           	move.l a3,d7
    2a06:	5a87           	addq.l #5,d7
    2a08:	2f07           	move.l d7,-(sp)
    2a0a:	2f02           	move.l d2,-(sp)
    2a0c:	486a 00f0      	pea 240(a2)
    2a10:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a16:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2a18:	4fef 001c      	lea 28(sp),sp
    2a1c:	2e8e           	move.l a6,(sp)
    2a1e:	2f04           	move.l d4,-(sp)
    2a20:	486a 0120      	pea 288(a2)
    2a24:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a2a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2a2c:	2f07           	move.l d7,-(sp)
    2a2e:	2f04           	move.l d4,-(sp)
    2a30:	486a 0150      	pea 336(a2)
    2a34:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a3a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2a3c:	2e0a           	move.l a2,d7
    2a3e:	0687 0000 0420 	addi.l #1056,d7
    2a44:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2a48:	4fef 0020      	lea 32(sp),sp
    2a4c:	b6fc 0114      	cmpa.w #276,a3
    2a50:	6600 ff02      	bne.w 2954 <ZoomTest+0xee4>
  TestRow( valsupposed, valactual, mask, 269);
    2a54:	4878 010d      	pea 10d <main+0x107>
    2a58:	2f02           	move.l d2,-(sp)
    2a5a:	2043           	movea.l d3,a0
    2a5c:	4868 3274      	pea 12916(a0)
    2a60:	4879 0001 6970 	pea 16970 <destlinezoom4>
    2a66:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    2a68:	4878 0001      	pea 1 <_start+0x1>
    2a6c:	4878 0004      	pea 4 <_start+0x4>
    2a70:	2f0c           	move.l a4,-(sp)
    2a72:	2f03           	move.l d3,-(sp)
    2a74:	4eba e5f4      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2a78:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2a7e:	4eae ff1c      	jsr -228(a6)
    2a82:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    2a86:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    2a8a:	95ca           	suba.l a2,a2
  mask = 0x0000;
    2a8c:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    2a8e:	7400           	moveq #0,d2
    2a90:	3405           	move.w d5,d2
    2a92:	2f0a           	move.l a2,-(sp)
    2a94:	2f02           	move.l d2,-(sp)
    2a96:	2f0b           	move.l a3,-(sp)
    2a98:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2a9e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2aa0:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2aa4:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    2aa6:	528a           	addq.l #1,a2
    2aa8:	4fef 0010      	lea 16(sp),sp
    2aac:	700d           	moveq #13,d0
    2aae:	b08a           	cmp.l a2,d0
    2ab0:	66dc           	bne.s 2a8e <ZoomTest+0x101e>
    2ab2:	7800           	moveq #0,d4
    2ab4:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    2ab6:	4878 000c      	pea c <main+0x6>
    2aba:	2f04           	move.l d4,-(sp)
    2abc:	486c 0274      	pea 628(a4)
    2ac0:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2ac6:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    2ac8:	4878 000d      	pea d <main+0x7>
    2acc:	2f04           	move.l d4,-(sp)
    2ace:	486c 02a4      	pea 676(a4)
    2ad2:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2ad8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    2ada:	4fef 0020      	lea 32(sp),sp
    2ade:	4878 000e      	pea e <main+0x8>
    2ae2:	2f02           	move.l d2,-(sp)
    2ae4:	486c 02d4      	pea 724(a4)
    2ae8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2aee:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    2af0:	4878 000f      	pea f <main+0x9>
    2af4:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2af6:	41ec 0304      	lea 772(a4),a0
    2afa:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    2afe:	2f08           	move.l a0,-(sp)
    2b00:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b06:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    2b08:	4fef 0020      	lea 32(sp),sp
    2b0c:	4878 0010      	pea 10 <main+0xa>
    2b10:	2f04           	move.l d4,-(sp)
    2b12:	486c 0334      	pea 820(a4)
    2b16:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b1c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    2b1e:	4878 0011      	pea 11 <main+0xb>
    2b22:	2f04           	move.l d4,-(sp)
    2b24:	2f2f 0054      	move.l 84(sp),-(sp)
    2b28:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b2e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    2b30:	4fef 0020      	lea 32(sp),sp
    2b34:	4878 0012      	pea 12 <main+0xc>
    2b38:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2b3a:	41ec 0394      	lea 916(a4),a0
    2b3e:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 18);
    2b42:	2f08           	move.l a0,-(sp)
    2b44:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b4a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    2b4c:	4878 0013      	pea 13 <main+0xd>
    2b50:	2f02           	move.l d2,-(sp)
    2b52:	486c 03c4      	pea 964(a4)
    2b56:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b5c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    2b5e:	4fef 0020      	lea 32(sp),sp
    2b62:	4878 0014      	pea 14 <main+0xe>
    2b66:	2f04           	move.l d4,-(sp)
    2b68:	486c 03f4      	pea 1012(a4)
    2b6c:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b72:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    2b74:	4878 0015      	pea 15 <main+0xf>
    2b78:	2f04           	move.l d4,-(sp)
    2b7a:	486c 0424      	pea 1060(a4)
    2b7e:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2b84:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    2b86:	280c           	move.l a4,d4
    2b88:	0684 0000 06c4 	addi.l #1732,d4
    2b8e:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    2b92:	347c 0023      	movea.w #35,a2
    2b96:	2644           	movea.l d4,a3
    2b98:	47eb fd90      	lea -624(a3),a3
    2b9c:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2ba0:	2f0e           	move.l a6,-(sp)
    2ba2:	2f02           	move.l d2,-(sp)
    2ba4:	2f0b           	move.l a3,-(sp)
    2ba6:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2bac:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2bae:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2bb2:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2bb4:	4fef 0010      	lea 16(sp),sp
    2bb8:	b88b           	cmp.l a3,d4
    2bba:	6722           	beq.s 2bde <ZoomTest+0x116e>
    2bbc:	7400           	moveq #0,d2
    2bbe:	3405           	move.w d5,d2
    2bc0:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    2bc2:	2f0e           	move.l a6,-(sp)
    2bc4:	2f02           	move.l d2,-(sp)
    2bc6:	2f0b           	move.l a3,-(sp)
    2bc8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2bce:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2bd0:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2bd4:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2bd6:	4fef 0010      	lea 16(sp),sp
    2bda:	b88b           	cmp.l a3,d4
    2bdc:	66de           	bne.s 2bbc <ZoomTest+0x114c>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    2bde:	7800           	moveq #0,d4
    2be0:	3805           	move.w d5,d4
    2be2:	2f0a           	move.l a2,-(sp)
    2be4:	2f04           	move.l d4,-(sp)
    2be6:	2f0b           	move.l a3,-(sp)
    2be8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2bee:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    2bf0:	486a 0001      	pea 1(a2)
    2bf4:	2f04           	move.l d4,-(sp)
    2bf6:	486b 0030      	pea 48(a3)
    2bfa:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c00:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    2c02:	4fef 0020      	lea 32(sp),sp
    2c06:	486a 0002      	pea 2(a2)
    2c0a:	2f02           	move.l d2,-(sp)
    2c0c:	486b 0060      	pea 96(a3)
    2c10:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c16:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2c18:	486a 0003      	pea 3(a2)
    2c1c:	2f02           	move.l d2,-(sp)
    2c1e:	486b 0090      	pea 144(a3)
    2c22:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c28:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2c2a:	4fef 0020      	lea 32(sp),sp
    2c2e:	486a 0004      	pea 4(a2)
    2c32:	2f04           	move.l d4,-(sp)
    2c34:	486b 00c0      	pea 192(a3)
    2c38:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c3e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    2c40:	486a 0005      	pea 5(a2)
    2c44:	2f04           	move.l d4,-(sp)
    2c46:	486b 00f0      	pea 240(a3)
    2c4a:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c50:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    2c52:	4fef 0020      	lea 32(sp),sp
    2c56:	486a 0006      	pea 6(a2)
    2c5a:	2f02           	move.l d2,-(sp)
    2c5c:	486b 0120      	pea 288(a3)
    2c60:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c66:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    2c68:	486a 0007      	pea 7(a2)
    2c6c:	2f02           	move.l d2,-(sp)
    2c6e:	486b 0150      	pea 336(a3)
    2c72:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c78:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    2c7a:	4fef 0020      	lea 32(sp),sp
    2c7e:	486a 0008      	pea 8(a2)
    2c82:	2f04           	move.l d4,-(sp)
    2c84:	486b 0180      	pea 384(a3)
    2c88:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2c8e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    2c90:	486a 0009      	pea 9(a2)
    2c94:	2f04           	move.l d4,-(sp)
    2c96:	486b 01b0      	pea 432(a3)
    2c9a:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2ca0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2ca2:	280b           	move.l a3,d4
    2ca4:	0684 0000 0450 	addi.l #1104,d4
    2caa:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    2cae:	4fef 0020      	lea 32(sp),sp
    2cb2:	b4fc 00f5      	cmpa.w #245,a2
    2cb6:	6600 fede      	bne.w 2b96 <ZoomTest+0x1126>
    2cba:	47ec 2f74      	lea 12148(a4),a3
    2cbe:	7e02           	moveq #2,d7
    2cc0:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    2cc2:	2f07           	move.l d7,-(sp)
    2cc4:	2f02           	move.l d2,-(sp)
    2cc6:	2f0b           	move.l a3,-(sp)
    2cc8:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2cce:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2cd0:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2cd4:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2cd6:	4fef 0010      	lea 16(sp),sp
    2cda:	0c87 0000 010a 	cmpi.l #266,d7
    2ce0:	6726           	beq.s 2d08 <ZoomTest+0x1298>
    2ce2:	7400           	moveq #0,d2
    2ce4:	3405           	move.w d5,d2
    2ce6:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    2ce8:	2f07           	move.l d7,-(sp)
    2cea:	2f02           	move.l d2,-(sp)
    2cec:	2f0b           	move.l a3,-(sp)
    2cee:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2cf4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2cf6:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2cfa:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2cfc:	4fef 0010      	lea 16(sp),sp
    2d00:	0c87 0000 010a 	cmpi.l #266,d7
    2d06:	66da           	bne.s 2ce2 <ZoomTest+0x1272>
    2d08:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    2d0e:	2f07           	move.l d7,-(sp)
    2d10:	2f05           	move.l d5,-(sp)
    2d12:	2f2f 0038      	move.l 56(sp),-(sp)
    2d16:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d1c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    2d1e:	4878 010b      	pea 10b <main+0x105>
    2d22:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    2d24:	41ec 3214      	lea 12820(a4),a0
    2d28:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2d2c:	2f08           	move.l a0,-(sp)
    2d2e:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d34:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    2d36:	4fef 0020      	lea 32(sp),sp
    2d3a:	4878 010c      	pea 10c <main+0x106>
    2d3e:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2d40:	41ec 3244      	lea 12868(a4),a0
    2d44:	2f48 0068      	move.l a0,104(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2d48:	2f08           	move.l a0,-(sp)
    2d4a:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d50:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    2d52:	4878 010d      	pea 10d <main+0x107>
    2d56:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2d58:	41ec 3274      	lea 12916(a4),a0
    2d5c:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    2d60:	2f08           	move.l a0,-(sp)
    2d62:	4879 0001 6944 	pea 16944 <destlinezoom5>
    2d68:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    2d6a:	4fef 0020      	lea 32(sp),sp
    2d6e:	4878 0001      	pea 1 <_start+0x1>
    2d72:	4878 0005      	pea 5 <_start+0x5>
    2d76:	2f03           	move.l d3,-(sp)
    2d78:	2f0c           	move.l a4,-(sp)
    2d7a:	4eba e2ee      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2d7e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2d84:	4eae ff1c      	jsr -228(a6)
    2d88:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    2d8c:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    2d90:	7800           	moveq #0,d4
  mask = 0x0000;
    2d92:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2d94:	2f04           	move.l d4,-(sp)
    2d96:	3f02           	move.w d2,-(sp)
    2d98:	4267           	clr.w -(sp)
    2d9a:	2f0b           	move.l a3,-(sp)
    2d9c:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2da2:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2da4:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2da8:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    2daa:	5284           	addq.l #1,d4
    2dac:	4fef 0010      	lea 16(sp),sp
    2db0:	7007           	moveq #7,d0
    2db2:	b084           	cmp.l d4,d0
    2db4:	66de           	bne.s 2d94 <ZoomTest+0x1324>
    2db6:	2c43           	movea.l d3,a6
    2db8:	4dee 0154      	lea 340(a6),a6
    2dbc:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2dc0:	7800           	moveq #0,d4
    2dc2:	3802           	move.w d2,d4
    2dc4:	2f0b           	move.l a3,-(sp)
    2dc6:	2f04           	move.l d4,-(sp)
    2dc8:	2f0e           	move.l a6,-(sp)
    2dca:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2dd0:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2dd2:	486b 0001      	pea 1(a3)
    2dd6:	2f04           	move.l d4,-(sp)
    2dd8:	486e 0030      	pea 48(a6)
    2ddc:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2de2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2de4:	4642           	not.w d2
    2de6:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2de8:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    2dec:	4fef 0020      	lea 32(sp),sp
    2df0:	7213           	moveq #19,d1
    2df2:	b28b           	cmp.l a3,d1
    2df4:	66ca           	bne.s 2dc0 <ZoomTest+0x1350>
    2df6:	2a0a           	move.l a2,d5
    2df8:	2c46           	movea.l d6,a6
    2dfa:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2dfe:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2e00:	2f04           	move.l d4,-(sp)
    2e02:	3f02           	move.w d2,-(sp)
    2e04:	4267           	clr.w -(sp)
    2e06:	2f0e           	move.l a6,-(sp)
    2e08:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e0e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2e10:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2e14:	4642           	not.w d2
    2e16:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2e18:	4fef 0010      	lea 16(sp),sp
    2e1c:	bc8e           	cmp.l a6,d6
    2e1e:	66e0           	bne.s 2e00 <ZoomTest+0x1390>
    2e20:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2e24:	7800           	moveq #0,d4
    2e26:	3802           	move.w d2,d4
    2e28:	2f0a           	move.l a2,-(sp)
    2e2a:	2f04           	move.l d4,-(sp)
    2e2c:	2f0e           	move.l a6,-(sp)
    2e2e:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e34:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2e36:	486a 0001      	pea 1(a2)
    2e3a:	2f04           	move.l d4,-(sp)
    2e3c:	486e 0030      	pea 48(a6)
    2e40:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e46:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2e48:	4642           	not.w d2
    2e4a:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2e4e:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2e52:	4fef 0020      	lea 32(sp),sp
    2e56:	b4fc 00af      	cmpa.w #175,a2
    2e5a:	66c8           	bne.s 2e24 <ZoomTest+0x13b4>
    2e5c:	0686 0000 0480 	addi.l #1152,d6
    2e62:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2e66:	b6fc 0103      	cmpa.w #259,a3
    2e6a:	668c           	bne.s 2df8 <ZoomTest+0x1388>
    2e6c:	2445           	movea.l d5,a2
    2e6e:	2c43           	movea.l d3,a6
    2e70:	4dee 3094      	lea 12436(a6),a6
    2e74:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2e7a:	2f04           	move.l d4,-(sp)
    2e7c:	3f02           	move.w d2,-(sp)
    2e7e:	4267           	clr.w -(sp)
    2e80:	2f0e           	move.l a6,-(sp)
    2e82:	4879 0001 6918 	pea 16918 <destlinezoom6>
    2e88:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2e8a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2e8e:	4642           	not.w d2
    2e90:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2e92:	4fef 0010      	lea 16(sp),sp
    2e96:	0c84 0000 010d 	cmpi.l #269,d4
    2e9c:	66dc           	bne.s 2e7a <ZoomTest+0x140a>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2e9e:	4878 0001      	pea 1 <_start+0x1>
    2ea2:	4878 0006      	pea 6 <main>
    2ea6:	2f0c           	move.l a4,-(sp)
    2ea8:	2f03           	move.l d3,-(sp)
    2eaa:	4eba e1be      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2eae:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2eb4:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2eb8:	42a7           	clr.l -(sp)
    2eba:	42a7           	clr.l -(sp)
    2ebc:	2f2f 004c      	move.l 76(sp),-(sp)
    2ec0:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2ec6:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2ec8:	41ec 0034      	lea 52(a4),a0
    2ecc:	2f48 0068      	move.l a0,104(sp)
    2ed0:	4fef 0020      	lea 32(sp),sp
    2ed4:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2ed8:	7eff           	moveq #-1,d7
    2eda:	280a           	move.l a2,d4
    2edc:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2ede:	7400           	moveq #0,d2
    2ee0:	3407           	move.w d7,d2
    2ee2:	2f0e           	move.l a6,-(sp)
    2ee4:	2f02           	move.l d2,-(sp)
    2ee6:	2f0a           	move.l a2,-(sp)
    2ee8:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2eee:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2ef0:	486e 0001      	pea 1(a6)
    2ef4:	2f02           	move.l d2,-(sp)
    2ef6:	486a 0030      	pea 48(a2)
    2efa:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f00:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2f02:	4647           	not.w d7
    2f04:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2f06:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2f0a:	4fef 0020      	lea 32(sp),sp
    2f0e:	700f           	moveq #15,d0
    2f10:	b08e           	cmp.l a6,d0
    2f12:	66ca           	bne.s 2ede <ZoomTest+0x146e>
    2f14:	240c           	move.l a4,d2
    2f16:	0682 0000 04e4 	addi.l #1252,d2
    2f1c:	2a04           	move.l d4,d5
    2f1e:	2c0b           	move.l a3,d6
    2f20:	264e           	movea.l a6,a3
    2f22:	2c42           	movea.l d2,a6
    2f24:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2f28:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2f2a:	2f04           	move.l d4,-(sp)
    2f2c:	3f07           	move.w d7,-(sp)
    2f2e:	4267           	clr.w -(sp)
    2f30:	2f0e           	move.l a6,-(sp)
    2f32:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f38:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2f3a:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2f3e:	4647           	not.w d7
    2f40:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2f42:	4fef 0010      	lea 16(sp),sp
    2f46:	b48e           	cmp.l a6,d2
    2f48:	66e0           	bne.s 2f2a <ZoomTest+0x14ba>
    2f4a:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2f4e:	7800           	moveq #0,d4
    2f50:	3807           	move.w d7,d4
    2f52:	2f0a           	move.l a2,-(sp)
    2f54:	2f04           	move.l d4,-(sp)
    2f56:	2f0e           	move.l a6,-(sp)
    2f58:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f5e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2f60:	2f0a           	move.l a2,-(sp)
    2f62:	2f04           	move.l d4,-(sp)
    2f64:	486e 0030      	pea 48(a6)
    2f68:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2f6e:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2f70:	4647           	not.w d7
    2f72:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2f76:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2f7a:	4fef 0020      	lea 32(sp),sp
    2f7e:	b4fc 00c9      	cmpa.w #201,a2
    2f82:	66ca           	bne.s 2f4e <ZoomTest+0x14de>
    2f84:	0682 0000 04b0 	addi.l #1200,d2
    2f8a:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2f8e:	b6fc 0109      	cmpa.w #265,a3
    2f92:	668e           	bne.s 2f22 <ZoomTest+0x14b2>
    2f94:	2445           	movea.l d5,a2
    2f96:	2646           	movea.l d6,a3
    2f98:	4dec 31b4      	lea 12724(a4),a6
    2f9c:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2fa2:	2f02           	move.l d2,-(sp)
    2fa4:	3f07           	move.w d7,-(sp)
    2fa6:	4267           	clr.w -(sp)
    2fa8:	2f0e           	move.l a6,-(sp)
    2faa:	4879 0001 68ec 	pea 168ec <destlinezoom7>
    2fb0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2fb2:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2fb6:	4647           	not.w d7
    2fb8:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2fba:	4fef 0010      	lea 16(sp),sp
    2fbe:	0c82 0000 0105 	cmpi.l #261,d2
    2fc4:	66dc           	bne.s 2fa2 <ZoomTest+0x1532>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2fc6:	4878 0001      	pea 1 <_start+0x1>
    2fca:	4878 0007      	pea 7 <main+0x1>
    2fce:	2f03           	move.l d3,-(sp)
    2fd0:	2f0c           	move.l a4,-(sp)
    2fd2:	4eba e096      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2fd6:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    2fdc:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2fe0:	42a7           	clr.l -(sp)
    2fe2:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2fe8:	2f2f 0044      	move.l 68(sp),-(sp)
    2fec:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    2ff2:	4e95           	jsr (a5)
    2ff4:	4fef 0020      	lea 32(sp),sp
    2ff8:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2ffe:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    3002:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    3004:	4245           	clr.w d5
    3006:	2c2f 0030      	move.l 48(sp),d6
    300a:	2c44           	movea.l d4,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    300c:	7800           	moveq #0,d4
    300e:	3805           	move.w d5,d4
    3010:	2f0e           	move.l a6,-(sp)
    3012:	2f04           	move.l d4,-(sp)
    3014:	2f02           	move.l d2,-(sp)
    3016:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    301c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    301e:	486e 0001      	pea 1(a6)
    3022:	2f04           	move.l d4,-(sp)
    3024:	2042           	movea.l d2,a0
    3026:	4868 0030      	pea 48(a0)
    302a:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3030:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3032:	4645           	not.w d5
    3034:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    3036:	4fef 0020      	lea 32(sp),sp
    303a:	700b           	moveq #11,d0
    303c:	b08e           	cmp.l a6,d0
    303e:	6740           	beq.s 3080 <ZoomTest+0x1610>
    3040:	2002           	move.l d2,d0
    3042:	0680 0000 00c0 	addi.l #192,d0
    3048:	2406           	move.l d6,d2
    304a:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    304c:	7800           	moveq #0,d4
    304e:	3805           	move.w d5,d4
    3050:	2f0e           	move.l a6,-(sp)
    3052:	2f04           	move.l d4,-(sp)
    3054:	2f02           	move.l d2,-(sp)
    3056:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    305c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    305e:	486e 0001      	pea 1(a6)
    3062:	2f04           	move.l d4,-(sp)
    3064:	2042           	movea.l d2,a0
    3066:	4868 0030      	pea 48(a0)
    306a:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3070:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3072:	4645           	not.w d5
    3074:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    3076:	4fef 0020      	lea 32(sp),sp
    307a:	700b           	moveq #11,d0
    307c:	b08e           	cmp.l a6,d0
    307e:	66c0           	bne.s 3040 <ZoomTest+0x15d0>
    3080:	2f46 0030      	move.l d6,48(sp)
    3084:	280e           	move.l a6,d4
    3086:	2e06           	move.l d6,d7
    3088:	0687 0000 01e0 	addi.l #480,d7
    308e:	327c 0015      	movea.w #21,a1
    3092:	2f4a 006c      	move.l a2,108(sp)
    3096:	2f4b 0070      	move.l a3,112(sp)
    309a:	2449           	movea.l a1,a2
    309c:	2c47           	movea.l d7,a6
    309e:	4dee fe20      	lea -480(a6),a6
    30a2:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    30a6:	2f0b           	move.l a3,-(sp)
    30a8:	3f05           	move.w d5,-(sp)
    30aa:	4267           	clr.w -(sp)
    30ac:	2f0e           	move.l a6,-(sp)
    30ae:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    30b4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    30b6:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    30ba:	4645           	not.w d5
    30bc:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    30be:	4fef 0010      	lea 16(sp),sp
    30c2:	be8e           	cmp.l a6,d7
    30c4:	66e0           	bne.s 30a6 <ZoomTest+0x1636>
    30c6:	240a           	move.l a2,d2
    30c8:	2c0e           	move.l a6,d6
    30ca:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    30d0:	7200           	moveq #0,d1
    30d2:	3205           	move.w d5,d1
    30d4:	2641           	movea.l d1,a3
    30d6:	2f02           	move.l d2,-(sp)
    30d8:	2f0b           	move.l a3,-(sp)
    30da:	2f0e           	move.l a6,-(sp)
    30dc:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    30e2:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    30e4:	2f02           	move.l d2,-(sp)
    30e6:	2f0b           	move.l a3,-(sp)
    30e8:	486e 0030      	pea 48(a6)
    30ec:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    30f2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    30f4:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    30f8:	4645           	not.w d5
    30fa:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    30fc:	4fef 0020      	lea 32(sp),sp
    3100:	bc8e           	cmp.l a6,d6
    3102:	66cc           	bne.s 30d0 <ZoomTest+0x1660>
    3104:	0687 0000 04e0 	addi.l #1248,d7
    310a:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    310e:	b4fc 00ff      	cmpa.w #255,a2
    3112:	6688           	bne.s 309c <ZoomTest+0x162c>
    3114:	246f 006c      	movea.l 108(sp),a2
    3118:	266f 0070      	movea.l 112(sp),a3
    311c:	2c2f 0030      	move.l 48(sp),d6
    3120:	0686 0000 2be0 	addi.l #11232,d6
    3126:	240a           	move.l a2,d2
    3128:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    312a:	2f02           	move.l d2,-(sp)
    312c:	3f05           	move.w d5,-(sp)
    312e:	4267           	clr.w -(sp)
    3130:	2f0e           	move.l a6,-(sp)
    3132:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3138:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    313a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    313e:	4645           	not.w d5
    3140:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    3142:	4fef 0010      	lea 16(sp),sp
    3146:	0c82 0000 00ff 	cmpi.l #255,d2
    314c:	66dc           	bne.s 312a <ZoomTest+0x16ba>
    314e:	2c2f 0030      	move.l 48(sp),d6
    3152:	0686 0000 2dc0 	addi.l #11712,d6
    3158:	2c42           	movea.l d2,a6
    315a:	2e0a           	move.l a2,d7
    315c:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    315e:	7c00           	moveq #0,d6
    3160:	3c05           	move.w d5,d6
    3162:	2f0e           	move.l a6,-(sp)
    3164:	2f06           	move.l d6,-(sp)
    3166:	2f0a           	move.l a2,-(sp)
    3168:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    316e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    3170:	486e 0001      	pea 1(a6)
    3174:	2f06           	move.l d6,-(sp)
    3176:	486a 0030      	pea 48(a2)
    317a:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    3180:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3182:	4645           	not.w d5
    3184:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3186:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    318a:	4fef 0020      	lea 32(sp),sp
    318e:	bcfc 010d      	cmpa.w #269,a6
    3192:	66ca           	bne.s 315e <ZoomTest+0x16ee>
    3194:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    3196:	2f0e           	move.l a6,-(sp)
    3198:	3f05           	move.w d5,-(sp)
    319a:	4267           	clr.w -(sp)
    319c:	206f 0038      	movea.l 56(sp),a0
    31a0:	4868 3060      	pea 12384(a0)
    31a4:	4879 0001 68c0 	pea 168c0 <destlinezoom8>
    31aa:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    31ac:	4878 0001      	pea 1 <_start+0x1>
    31b0:	4878 0008      	pea 8 <main+0x2>
    31b4:	2f0c           	move.l a4,-(sp)
    31b6:	2f03           	move.l d3,-(sp)
    31b8:	4eba deb0      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    31bc:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    31c2:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    31c6:	4fef 001c      	lea 28(sp),sp
    31ca:	4297           	clr.l (sp)
    31cc:	42a7           	clr.l -(sp)
    31ce:	2f2f 003c      	move.l 60(sp),-(sp)
    31d2:	4879 0001 6894 	pea 16894 <destlinezoom9>
    31d8:	4e95           	jsr (a5)
    31da:	4fef 0010      	lea 16(sp),sp
    31de:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    31e2:	7cff           	moveq #-1,d6
    31e4:	2e0a           	move.l a2,d7
    31e6:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    31ea:	7a00           	moveq #0,d5
    31ec:	3a06           	move.w d6,d5
    31ee:	2f0e           	move.l a6,-(sp)
    31f0:	2f05           	move.l d5,-(sp)
    31f2:	2f0a           	move.l a2,-(sp)
    31f4:	4879 0001 6894 	pea 16894 <destlinezoom9>
    31fa:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    31fc:	486e 0001      	pea 1(a6)
    3200:	2f05           	move.l d5,-(sp)
    3202:	486a 0030      	pea 48(a2)
    3206:	4879 0001 6894 	pea 16894 <destlinezoom9>
    320c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    320e:	4646           	not.w d6
    3210:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3212:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    3216:	4fef 0020      	lea 32(sp),sp
    321a:	7007           	moveq #7,d0
    321c:	b08e           	cmp.l a6,d0
    321e:	66ca           	bne.s 31ea <ZoomTest+0x177a>
    3220:	2a2f 004c      	move.l 76(sp),d5
    3224:	307c 0014      	movea.w #20,a0
    3228:	2f47 0030      	move.l d7,48(sp)
    322c:	2f4b 0048      	move.l a3,72(sp)
    3230:	2f42 004c      	move.l d2,76(sp)
    3234:	2448           	movea.l a0,a2
    3236:	2c45           	movea.l d5,a6
    3238:	4dee fe50      	lea -432(a6),a6
    323c:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    3240:	2f0b           	move.l a3,-(sp)
    3242:	3f06           	move.w d6,-(sp)
    3244:	4267           	clr.w -(sp)
    3246:	2f0e           	move.l a6,-(sp)
    3248:	4879 0001 6894 	pea 16894 <destlinezoom9>
    324e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3250:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3254:	4646           	not.w d6
    3256:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    3258:	4fef 0010      	lea 16(sp),sp
    325c:	ba8e           	cmp.l a6,d5
    325e:	66e0           	bne.s 3240 <ZoomTest+0x17d0>
    3260:	2e0a           	move.l a2,d7
    3262:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    3266:	7400           	moveq #0,d2
    3268:	3406           	move.w d6,d2
    326a:	2f07           	move.l d7,-(sp)
    326c:	2f02           	move.l d2,-(sp)
    326e:	2f0e           	move.l a6,-(sp)
    3270:	4879 0001 6894 	pea 16894 <destlinezoom9>
    3276:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    3278:	5287           	addq.l #1,d7
    327a:	2f07           	move.l d7,-(sp)
    327c:	2f02           	move.l d2,-(sp)
    327e:	486e 0030      	pea 48(a6)
    3282:	4879 0001 6894 	pea 16894 <destlinezoom9>
    3288:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    328a:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    328c:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    3290:	4fef 0020      	lea 32(sp),sp
    3294:	be8b           	cmp.l a3,d7
    3296:	66ce           	bne.s 3266 <ZoomTest+0x17f6>
    3298:	0685 0000 0510 	addi.l #1296,d5
    329e:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    32a2:	b4fc 0107      	cmpa.w #263,a2
    32a6:	668e           	bne.s 3236 <ZoomTest+0x17c6>
    32a8:	246f 0030      	movea.l 48(sp),a2
    32ac:	266f 0048      	movea.l 72(sp),a3
    32b0:	242f 004c      	move.l 76(sp),d2
    32b4:	41ec 2ee4      	lea 12004(a4),a0
    32b8:	2f48 0030      	move.l a0,48(sp)
    32bc:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    32be:	2f0a           	move.l a2,-(sp)
    32c0:	3f06           	move.w d6,-(sp)
    32c2:	4267           	clr.w -(sp)
    32c4:	2f0e           	move.l a6,-(sp)
    32c6:	4879 0001 6894 	pea 16894 <destlinezoom9>
    32cc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    32ce:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    32d2:	4646           	not.w d6
    32d4:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    32d6:	4fef 0010      	lea 16(sp),sp
    32da:	b4fc 00fe      	cmpa.w #254,a2
    32de:	66de           	bne.s 32be <ZoomTest+0x184e>
    32e0:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    32e4:	7a00           	moveq #0,d5
    32e6:	3a06           	move.w d6,d5
    32e8:	2f0b           	move.l a3,-(sp)
    32ea:	2f05           	move.l d5,-(sp)
    32ec:	2f0a           	move.l a2,-(sp)
    32ee:	4879 0001 6894 	pea 16894 <destlinezoom9>
    32f4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    32f6:	486b 0001      	pea 1(a3)
    32fa:	2f05           	move.l d5,-(sp)
    32fc:	486a 0030      	pea 48(a2)
    3300:	4879 0001 6894 	pea 16894 <destlinezoom9>
    3306:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3308:	4646           	not.w d6
    330a:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    330c:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    3310:	4fef 0020      	lea 32(sp),sp
    3314:	b6fc 010d      	cmpa.w #269,a3
    3318:	66ca           	bne.s 32e4 <ZoomTest+0x1874>
  TestRow( valsupposed, valactual, mask, 269);
    331a:	2f0b           	move.l a3,-(sp)
    331c:	3f06           	move.w d6,-(sp)
    331e:	4267           	clr.w -(sp)
    3320:	2f2f 0044      	move.l 68(sp),-(sp)
    3324:	4879 0001 6894 	pea 16894 <destlinezoom9>
    332a:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    332c:	4878 0001      	pea 1 <_start+0x1>
    3330:	4878 0009      	pea 9 <main+0x3>
    3334:	2f03           	move.l d3,-(sp)
    3336:	2f0c           	move.l a4,-(sp)
    3338:	4eba dd30      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    333c:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3342:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3346:	4fef 001c      	lea 28(sp),sp
    334a:	4297           	clr.l (sp)
    334c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3352:	2f2f 0034      	move.l 52(sp),-(sp)
    3356:	4879 0001 6868 	pea 16868 <destlinezoom10>
    335c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    335e:	4878 0001      	pea 1 <_start+0x1>
    3362:	42a7           	clr.l -(sp)
    3364:	2f2f 0058      	move.l 88(sp),-(sp)
    3368:	4879 0001 6868 	pea 16868 <destlinezoom10>
    336e:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    3370:	4fef 0020      	lea 32(sp),sp
    3374:	4878 0002      	pea 2 <_start+0x2>
    3378:	42a7           	clr.l -(sp)
    337a:	2f2f 0058      	move.l 88(sp),-(sp)
    337e:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3384:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    3386:	2a2f 0064      	move.l 100(sp),d5
    338a:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    338e:	7eff           	moveq #-1,d7
    3390:	2644           	movea.l d4,a3
    3392:	2445           	movea.l d5,a2
    3394:	45ea fe80      	lea -384(a2),a2
    3398:	280b           	move.l a3,d4
    339a:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    339c:	2f04           	move.l d4,-(sp)
    339e:	3f07           	move.w d7,-(sp)
    33a0:	4267           	clr.w -(sp)
    33a2:	2f0a           	move.l a2,-(sp)
    33a4:	4879 0001 6868 	pea 16868 <destlinezoom10>
    33aa:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    33ac:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    33b0:	4647           	not.w d7
    33b2:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    33b4:	4fef 0010      	lea 16(sp),sp
    33b8:	ba8a           	cmp.l a2,d5
    33ba:	66e0           	bne.s 339c <ZoomTest+0x192c>
    33bc:	280b           	move.l a3,d4
    33be:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    33c2:	7c00           	moveq #0,d6
    33c4:	3c07           	move.w d7,d6
    33c6:	2f04           	move.l d4,-(sp)
    33c8:	2f06           	move.l d6,-(sp)
    33ca:	2f0a           	move.l a2,-(sp)
    33cc:	4879 0001 6868 	pea 16868 <destlinezoom10>
    33d2:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    33d4:	2f04           	move.l d4,-(sp)
    33d6:	2f06           	move.l d6,-(sp)
    33d8:	486a 0030      	pea 48(a2)
    33dc:	4879 0001 6868 	pea 16868 <destlinezoom10>
    33e2:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    33e4:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    33e8:	4647           	not.w d7
    33ea:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    33ec:	4fef 0020      	lea 32(sp),sp
    33f0:	bdca           	cmpa.l a2,a6
    33f2:	66ce           	bne.s 33c2 <ZoomTest+0x1952>
    33f4:	0685 0000 0540 	addi.l #1344,d5
    33fa:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    33fe:	b6fc 0107      	cmpa.w #263,a3
    3402:	668e           	bne.s 3392 <ZoomTest+0x1922>
    3404:	246f 0068      	movea.l 104(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    3408:	2f02           	move.l d2,-(sp)
    340a:	3f07           	move.w d7,-(sp)
    340c:	4267           	clr.w -(sp)
    340e:	2f0a           	move.l a2,-(sp)
    3410:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3416:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3418:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    341c:	4647           	not.w d7
    341e:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    3420:	4fef 0010      	lea 16(sp),sp
    3424:	0c82 0000 0107 	cmpi.l #263,d2
    342a:	66dc           	bne.s 3408 <ZoomTest+0x1998>
    342c:	2c43           	movea.l d3,a6
    342e:	4dee 3154      	lea 12628(a6),a6
    3432:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    3436:	7400           	moveq #0,d2
    3438:	3407           	move.w d7,d2
    343a:	486a ffff      	pea -1(a2)
    343e:	2f02           	move.l d2,-(sp)
    3440:	2f0e           	move.l a6,-(sp)
    3442:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3448:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    344a:	2f0a           	move.l a2,-(sp)
    344c:	2f02           	move.l d2,-(sp)
    344e:	486e 0030      	pea 48(a6)
    3452:	4879 0001 6868 	pea 16868 <destlinezoom10>
    3458:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    345a:	4647           	not.w d7
    345c:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    345e:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    3462:	4fef 0020      	lea 32(sp),sp
    3466:	b4fc 010e      	cmpa.w #270,a2
    346a:	66ca           	bne.s 3436 <ZoomTest+0x19c6>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    346c:	4878 0001      	pea 1 <_start+0x1>
    3470:	4878 000a      	pea a <main+0x4>
    3474:	2f0c           	move.l a4,-(sp)
    3476:	2f03           	move.l d3,-(sp)
    3478:	4eba dbf0      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    347c:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3482:	4eae ff1c      	jsr -228(a6)
    3486:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    348a:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    348e:	7800           	moveq #0,d4
  mask = 0xffff;
    3490:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    3492:	2f04           	move.l d4,-(sp)
    3494:	3f02           	move.w d2,-(sp)
    3496:	4267           	clr.w -(sp)
    3498:	2f0a           	move.l a2,-(sp)
    349a:	4879 0001 683c 	pea 1683c <destlinezoom11>
    34a0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    34a2:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    34a6:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    34a8:	5284           	addq.l #1,d4
    34aa:	4fef 0010      	lea 16(sp),sp
    34ae:	7006           	moveq #6,d0
    34b0:	b084           	cmp.l d4,d0
    34b2:	66de           	bne.s 3492 <ZoomTest+0x1a22>
    34b4:	266f 0064      	movea.l 100(sp),a3
    34b8:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    34bc:	7800           	moveq #0,d4
    34be:	3802           	move.w d2,d4
    34c0:	2f0a           	move.l a2,-(sp)
    34c2:	2f04           	move.l d4,-(sp)
    34c4:	2f0b           	move.l a3,-(sp)
    34c6:	4879 0001 683c 	pea 1683c <destlinezoom11>
    34cc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    34ce:	486a 0001      	pea 1(a2)
    34d2:	2f04           	move.l d4,-(sp)
    34d4:	486b 0030      	pea 48(a3)
    34d8:	4879 0001 683c 	pea 1683c <destlinezoom11>
    34de:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    34e0:	4642           	not.w d2
    34e2:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    34e4:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    34e8:	4fef 0020      	lea 32(sp),sp
    34ec:	721c           	moveq #28,d1
    34ee:	b28a           	cmp.l a2,d1
    34f0:	66ca           	bne.s 34bc <ZoomTest+0x1a4c>
    34f2:	280c           	move.l a4,d4
    34f4:	0684 0000 0694 	addi.l #1684,d4
    34fa:	347c 0023      	movea.w #35,a2
    34fe:	2644           	movea.l d4,a3
    3500:	47eb feb0      	lea -336(a3),a3
    3504:	2a0a           	move.l a2,d5
    3506:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    3508:	2f05           	move.l d5,-(sp)
    350a:	3f02           	move.w d2,-(sp)
    350c:	4267           	clr.w -(sp)
    350e:	2f0b           	move.l a3,-(sp)
    3510:	4879 0001 683c 	pea 1683c <destlinezoom11>
    3516:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3518:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    351c:	4642           	not.w d2
    351e:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    3520:	4fef 0010      	lea 16(sp),sp
    3524:	b88b           	cmp.l a3,d4
    3526:	66e0           	bne.s 3508 <ZoomTest+0x1a98>
    3528:	2c4a           	movea.l a2,a6
    352a:	2c0b           	move.l a3,d6
    352c:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    3532:	7a00           	moveq #0,d5
    3534:	3a02           	move.w d2,d5
    3536:	2f0e           	move.l a6,-(sp)
    3538:	2f05           	move.l d5,-(sp)
    353a:	2f0b           	move.l a3,-(sp)
    353c:	4879 0001 683c 	pea 1683c <destlinezoom11>
    3542:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    3544:	486e ffe8      	pea -24(a6)
    3548:	2f05           	move.l d5,-(sp)
    354a:	486b 0030      	pea 48(a3)
    354e:	4879 0001 683c 	pea 1683c <destlinezoom11>
    3554:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3556:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    355a:	4642           	not.w d2
    355c:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    355e:	4fef 0020      	lea 32(sp),sp
    3562:	bc8b           	cmp.l a3,d6
    3564:	66cc           	bne.s 3532 <ZoomTest+0x1ac2>
    3566:	0684 0000 0570 	addi.l #1392,d4
    356c:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    3570:	b4fc 010b      	cmpa.w #267,a2
    3574:	6688           	bne.s 34fe <ZoomTest+0x1a8e>
    3576:	45ec 30c4      	lea 12484(a4),a2
    357a:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    3580:	7800           	moveq #0,d4
    3582:	3802           	move.w d2,d4
    3584:	2f05           	move.l d5,-(sp)
    3586:	2f04           	move.l d4,-(sp)
    3588:	2f0a           	move.l a2,-(sp)
    358a:	4879 0001 683c 	pea 1683c <destlinezoom11>
    3590:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3592:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3596:	4642           	not.w d2
    3598:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    359a:	4fef 0010      	lea 16(sp),sp
    359e:	0c85 0000 010b 	cmpi.l #267,d5
    35a4:	66da           	bne.s 3580 <ZoomTest+0x1b10>
    35a6:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    35ac:	2f05           	move.l d5,-(sp)
    35ae:	2f02           	move.l d2,-(sp)
    35b0:	2f2f 0060      	move.l 96(sp),-(sp)
    35b4:	4879 0001 683c 	pea 1683c <destlinezoom11>
    35ba:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    35bc:	4878 010c      	pea 10c <main+0x106>
    35c0:	2f02           	move.l d2,-(sp)
    35c2:	2f2f 0078      	move.l 120(sp),-(sp)
    35c6:	4879 0001 683c 	pea 1683c <destlinezoom11>
    35cc:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    35ce:	4fef 0020      	lea 32(sp),sp
    35d2:	4878 010d      	pea 10d <main+0x107>
    35d6:	2f04           	move.l d4,-(sp)
    35d8:	2f2f 0044      	move.l 68(sp),-(sp)
    35dc:	4879 0001 683c 	pea 1683c <destlinezoom11>
    35e2:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    35e4:	4878 0001      	pea 1 <_start+0x1>
    35e8:	4878 000b      	pea b <main+0x5>
    35ec:	2f03           	move.l d3,-(sp)
    35ee:	2f0c           	move.l a4,-(sp)
    35f0:	4eba da78      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    35f4:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    35fa:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    35fe:	4fef 001c      	lea 28(sp),sp
    3602:	4297           	clr.l (sp)
    3604:	42a7           	clr.l -(sp)
    3606:	2f2f 0034      	move.l 52(sp),-(sp)
    360a:	4879 0001 6810 	pea 16810 <destlinezoom12>
    3610:	4e95           	jsr (a5)
    3612:	4fef 0010      	lea 16(sp),sp
    3616:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    361a:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    361e:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    3622:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3624:	7a00           	moveq #0,d5
    3626:	3a02           	move.w d2,d5
    3628:	2f0a           	move.l a2,-(sp)
    362a:	2f05           	move.l d5,-(sp)
    362c:	2f0b           	move.l a3,-(sp)
    362e:	4879 0001 6810 	pea 16810 <destlinezoom12>
    3634:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3636:	486a 0001      	pea 1(a2)
    363a:	2f05           	move.l d5,-(sp)
    363c:	486b 0030      	pea 48(a3)
    3640:	4879 0001 6810 	pea 16810 <destlinezoom12>
    3646:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3648:	4642           	not.w d2
    364a:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    364c:	4fef 0020      	lea 32(sp),sp
    3650:	7019           	moveq #25,d0
    3652:	b08a           	cmp.l a2,d0
    3654:	673e           	beq.s 3694 <ZoomTest+0x1c24>
    3656:	200b           	move.l a3,d0
    3658:	0680 0000 00c0 	addi.l #192,d0
    365e:	2644           	movea.l d4,a3
    3660:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3662:	7a00           	moveq #0,d5
    3664:	3a02           	move.w d2,d5
    3666:	2f0a           	move.l a2,-(sp)
    3668:	2f05           	move.l d5,-(sp)
    366a:	2f0b           	move.l a3,-(sp)
    366c:	4879 0001 6810 	pea 16810 <destlinezoom12>
    3672:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3674:	486a 0001      	pea 1(a2)
    3678:	2f05           	move.l d5,-(sp)
    367a:	486b 0030      	pea 48(a3)
    367e:	4879 0001 6810 	pea 16810 <destlinezoom12>
    3684:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3686:	4642           	not.w d2
    3688:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    368a:	4fef 0020      	lea 32(sp),sp
    368e:	7019           	moveq #25,d0
    3690:	b08a           	cmp.l a2,d0
    3692:	66c2           	bne.s 3656 <ZoomTest+0x1be6>
    3694:	2a04           	move.l d4,d5
    3696:	0685 0000 0120 	addi.l #288,d5
    369c:	347c 001f      	movea.w #31,a2
    36a0:	2645           	movea.l d5,a3
    36a2:	47eb fee0      	lea -288(a3),a3
    36a6:	2c0a           	move.l a2,d6
    36a8:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    36aa:	2f06           	move.l d6,-(sp)
    36ac:	3f02           	move.w d2,-(sp)
    36ae:	4267           	clr.w -(sp)
    36b0:	2f0b           	move.l a3,-(sp)
    36b2:	4879 0001 6810 	pea 16810 <destlinezoom12>
    36b8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36ba:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    36be:	4642           	not.w d2
    36c0:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    36c2:	4fef 0010      	lea 16(sp),sp
    36c6:	ba8b           	cmp.l a3,d5
    36c8:	66e0           	bne.s 36aa <ZoomTest+0x1c3a>
    36ca:	2c4a           	movea.l a2,a6
    36cc:	2e0b           	move.l a3,d7
    36ce:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    36d4:	7c00           	moveq #0,d6
    36d6:	3c02           	move.w d2,d6
    36d8:	2f0e           	move.l a6,-(sp)
    36da:	2f06           	move.l d6,-(sp)
    36dc:	2f0b           	move.l a3,-(sp)
    36de:	4879 0001 6810 	pea 16810 <destlinezoom12>
    36e4:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    36e6:	486e 0001      	pea 1(a6)
    36ea:	2f06           	move.l d6,-(sp)
    36ec:	486b 0030      	pea 48(a3)
    36f0:	4879 0001 6810 	pea 16810 <destlinezoom12>
    36f6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36f8:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    36fc:	4642           	not.w d2
    36fe:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    3700:	4fef 0020      	lea 32(sp),sp
    3704:	be8b           	cmp.l a3,d7
    3706:	66cc           	bne.s 36d4 <ZoomTest+0x1c64>
    3708:	0685 0000 05a0 	addi.l #1440,d5
    370e:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    3712:	b4fc 010f      	cmpa.w #271,a2
    3716:	6688           	bne.s 36a0 <ZoomTest+0x1c30>
    3718:	2444           	movea.l d4,a2
    371a:	45ea 2d00      	lea 11520(a2),a2
    371e:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    3724:	2f04           	move.l d4,-(sp)
    3726:	3f02           	move.w d2,-(sp)
    3728:	4267           	clr.w -(sp)
    372a:	2f0a           	move.l a2,-(sp)
    372c:	4879 0001 6810 	pea 16810 <destlinezoom12>
    3732:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3734:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3738:	4642           	not.w d2
    373a:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    373c:	4fef 0010      	lea 16(sp),sp
    3740:	0c84 0000 0109 	cmpi.l #265,d4
    3746:	66dc           	bne.s 3724 <ZoomTest+0x1cb4>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3748:	4878 0001      	pea 1 <_start+0x1>
    374c:	4878 000c      	pea c <main+0x6>
    3750:	2f0c           	move.l a4,-(sp)
    3752:	2f03           	move.l d3,-(sp)
    3754:	4eba d914      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3758:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    375e:	4eae ff1c      	jsr -228(a6)
    3762:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    3766:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    376a:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    376e:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3770:	7400           	moveq #0,d2
    3772:	3406           	move.w d6,d2
    3774:	486a ffff      	pea -1(a2)
    3778:	2f02           	move.l d2,-(sp)
    377a:	2f0b           	move.l a3,-(sp)
    377c:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    3782:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3784:	2f0a           	move.l a2,-(sp)
    3786:	2f02           	move.l d2,-(sp)
    3788:	486b 0030      	pea 48(a3)
    378c:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    3792:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3794:	4646           	not.w d6
    3796:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3798:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    379c:	4fef 0020      	lea 32(sp),sp
    37a0:	7217           	moveq #23,d1
    37a2:	b28a           	cmp.l a2,d1
    37a4:	66ca           	bne.s 3770 <ZoomTest+0x1d00>
    37a6:	240c           	move.l a4,d2
    37a8:	0682 0000 0514 	addi.l #1300,d2
    37ae:	3c7c 001b      	movea.w #27,a6
    37b2:	2a0a           	move.l a2,d5
    37b4:	2642           	movea.l d2,a3
    37b6:	47eb ff10      	lea -240(a3),a3
    37ba:	280e           	move.l a6,d4
    37bc:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    37be:	2f04           	move.l d4,-(sp)
    37c0:	3f06           	move.w d6,-(sp)
    37c2:	4267           	clr.w -(sp)
    37c4:	2f0b           	move.l a3,-(sp)
    37c6:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    37cc:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    37ce:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    37d2:	4646           	not.w d6
    37d4:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    37d6:	4fef 0010      	lea 16(sp),sp
    37da:	b48b           	cmp.l a3,d2
    37dc:	66e0           	bne.s 37be <ZoomTest+0x1d4e>
    37de:	244e           	movea.l a6,a2
    37e0:	2e0b           	move.l a3,d7
    37e2:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    37e8:	7800           	moveq #0,d4
    37ea:	3806           	move.w d6,d4
    37ec:	2f0a           	move.l a2,-(sp)
    37ee:	2f04           	move.l d4,-(sp)
    37f0:	2f0b           	move.l a3,-(sp)
    37f2:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    37f8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    37fa:	486a 0001      	pea 1(a2)
    37fe:	2f04           	move.l d4,-(sp)
    3800:	486b 0030      	pea 48(a3)
    3804:	4879 0001 67e4 	pea 167e4 <destlinezoom13>
    380a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    380c:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3810:	4646           	not.w d6
    3812:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    3814:	4fef 0020      	lea 32(sp),sp
    3818:	be8b           	cmp.l a3,d7
    381a:	66cc           	bne.s 37e8 <ZoomTest+0x1d78>
    381c:	0682 0000 05d0 	addi.l #1488,d2
    3822:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    3826:	bcfc 0113      	cmpa.w #275,a6
    382a:	6688           	bne.s 37b4 <ZoomTest+0x1d44>
    382c:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    382e:	4878 0001      	pea 1 <_start+0x1>
    3832:	4878 000d      	pea d <main+0x7>
    3836:	2f03           	move.l d3,-(sp)
    3838:	2f0c           	move.l a4,-(sp)
    383a:	4eba d82e      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    383e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3844:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3848:	42a7           	clr.l -(sp)
    384a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3850:	2f2f 0044      	move.l 68(sp),-(sp)
    3854:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    385a:	4e95           	jsr (a5)
    385c:	4fef 0020      	lea 32(sp),sp
    3860:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    3864:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    3868:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    386c:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    386e:	7800           	moveq #0,d4
    3870:	3807           	move.w d7,d4
    3872:	2f0b           	move.l a3,-(sp)
    3874:	2f04           	move.l d4,-(sp)
    3876:	2f0e           	move.l a6,-(sp)
    3878:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    387e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3880:	486b 0001      	pea 1(a3)
    3884:	2f04           	move.l d4,-(sp)
    3886:	486e 0030      	pea 48(a6)
    388a:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3890:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3892:	4647           	not.w d7
    3894:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    3896:	4fef 0020      	lea 32(sp),sp
    389a:	7013           	moveq #19,d0
    389c:	b08b           	cmp.l a3,d0
    389e:	673e           	beq.s 38de <ZoomTest+0x1e6e>
    38a0:	200e           	move.l a6,d0
    38a2:	0680 0000 00c0 	addi.l #192,d0
    38a8:	2c42           	movea.l d2,a6
    38aa:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    38ac:	7800           	moveq #0,d4
    38ae:	3807           	move.w d7,d4
    38b0:	2f0b           	move.l a3,-(sp)
    38b2:	2f04           	move.l d4,-(sp)
    38b4:	2f0e           	move.l a6,-(sp)
    38b6:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    38bc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    38be:	486b 0001      	pea 1(a3)
    38c2:	2f04           	move.l d4,-(sp)
    38c4:	486e 0030      	pea 48(a6)
    38c8:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    38ce:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    38d0:	4647           	not.w d7
    38d2:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    38d4:	4fef 0020      	lea 32(sp),sp
    38d8:	7013           	moveq #19,d0
    38da:	b08b           	cmp.l a3,d0
    38dc:	66c2           	bne.s 38a0 <ZoomTest+0x1e30>
    38de:	2802           	move.l d2,d4
    38e0:	0684 0000 00c0 	addi.l #192,d4
    38e6:	2c0b           	move.l a3,d6
    38e8:	2c44           	movea.l d4,a6
    38ea:	4dee ff40      	lea -192(a6),a6
    38ee:	2a0a           	move.l a2,d5
    38f0:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    38f2:	2f05           	move.l d5,-(sp)
    38f4:	3f07           	move.w d7,-(sp)
    38f6:	4267           	clr.w -(sp)
    38f8:	2f0e           	move.l a6,-(sp)
    38fa:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    3900:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3902:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3906:	4647           	not.w d7
    3908:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    390a:	4fef 0010      	lea 16(sp),sp
    390e:	b88e           	cmp.l a6,d4
    3910:	66e0           	bne.s 38f2 <ZoomTest+0x1e82>
    3912:	264a           	movea.l a2,a3
    3914:	41ee 0540      	lea 1344(a6),a0
    3918:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    391c:	7a00           	moveq #0,d5
    391e:	3a07           	move.w d7,d5
    3920:	2f0b           	move.l a3,-(sp)
    3922:	2f05           	move.l d5,-(sp)
    3924:	2f0e           	move.l a6,-(sp)
    3926:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    392c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    392e:	486b 0001      	pea 1(a3)
    3932:	2f05           	move.l d5,-(sp)
    3934:	486e 0030      	pea 48(a6)
    3938:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    393e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3940:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3944:	4647           	not.w d7
    3946:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    3948:	4fef 0020      	lea 32(sp),sp
    394c:	bdef 003c      	cmpa.l 60(sp),a6
    3950:	66ca           	bne.s 391c <ZoomTest+0x1eac>
    3952:	0684 0000 0600 	addi.l #1536,d4
    3958:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    395c:	b4fc 00f7      	cmpa.w #247,a2
    3960:	6686           	bne.s 38e8 <ZoomTest+0x1e78>
    3962:	2646           	movea.l d6,a3
    3964:	2c42           	movea.l d2,a6
    3966:	4dee 2a00      	lea 10752(a6),a6
    396a:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    396e:	2f0a           	move.l a2,-(sp)
    3970:	3f07           	move.w d7,-(sp)
    3972:	4267           	clr.w -(sp)
    3974:	2f0e           	move.l a6,-(sp)
    3976:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    397c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    397e:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    3982:	4647           	not.w d7
    3984:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    3986:	4fef 0010      	lea 16(sp),sp
    398a:	b4fc 00f7      	cmpa.w #247,a2
    398e:	66de           	bne.s 396e <ZoomTest+0x1efe>
    3990:	0682 0000 2ac0 	addi.l #10944,d2
    3996:	2c4a           	movea.l a2,a6
    3998:	280a           	move.l a2,d4
    399a:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    399c:	7400           	moveq #0,d2
    399e:	3407           	move.w d7,d2
    39a0:	2f0e           	move.l a6,-(sp)
    39a2:	2f02           	move.l d2,-(sp)
    39a4:	2f0a           	move.l a2,-(sp)
    39a6:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    39ac:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    39ae:	486e 0001      	pea 1(a6)
    39b2:	2f02           	move.l d2,-(sp)
    39b4:	486a 0030      	pea 48(a2)
    39b8:	4879 0001 67b8 	pea 167b8 <destlinezoom14>
    39be:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    39c0:	4647           	not.w d7
    39c2:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    39c4:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    39c8:	4fef 0020      	lea 32(sp),sp
    39cc:	bcfc 010f      	cmpa.w #271,a6
    39d0:	66ca           	bne.s 399c <ZoomTest+0x1f2c>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    39d2:	4878 0001      	pea 1 <_start+0x1>
    39d6:	4878 000e      	pea e <main+0x8>
    39da:	2f0c           	move.l a4,-(sp)
    39dc:	2f03           	move.l d3,-(sp)
    39de:	4eba d68a      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    39e2:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    39e8:	4eae ff1c      	jsr -228(a6)
    39ec:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    39f0:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    39f4:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    39f8:	4246           	clr.w d6
    39fa:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    39fc:	7400           	moveq #0,d2
    39fe:	3406           	move.w d6,d2
    3a00:	486e ffff      	pea -1(a6)
    3a04:	2f02           	move.l d2,-(sp)
    3a06:	2f0a           	move.l a2,-(sp)
    3a08:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a0e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3a10:	2f0e           	move.l a6,-(sp)
    3a12:	2f02           	move.l d2,-(sp)
    3a14:	486a 0030      	pea 48(a2)
    3a18:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a1e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a20:	4646           	not.w d6
    3a22:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3a24:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    3a28:	4fef 0020      	lea 32(sp),sp
    3a2c:	7011           	moveq #17,d0
    3a2e:	b08e           	cmp.l a6,d0
    3a30:	66ca           	bne.s 39fc <ZoomTest+0x1f8c>
    3a32:	2444           	movea.l d4,a2
    3a34:	242f 005c      	move.l 92(sp),d2
    3a38:	2c42           	movea.l d2,a6
    3a3a:	4dee ff70      	lea -144(a6),a6
    3a3e:	280b           	move.l a3,d4
    3a40:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    3a42:	2f04           	move.l d4,-(sp)
    3a44:	3f06           	move.w d6,-(sp)
    3a46:	4267           	clr.w -(sp)
    3a48:	2f0e           	move.l a6,-(sp)
    3a4a:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a50:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a52:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3a56:	4646           	not.w d6
    3a58:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    3a5a:	4fef 0010      	lea 16(sp),sp
    3a5e:	b48e           	cmp.l a6,d2
    3a60:	66e0           	bne.s 3a42 <ZoomTest+0x1fd2>
    3a62:	280b           	move.l a3,d4
    3a64:	2e0e           	move.l a6,d7
    3a66:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    3a6c:	7a00           	moveq #0,d5
    3a6e:	3a06           	move.w d6,d5
    3a70:	2f04           	move.l d4,-(sp)
    3a72:	2f05           	move.l d5,-(sp)
    3a74:	2f0e           	move.l a6,-(sp)
    3a76:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a7c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    3a7e:	2f04           	move.l d4,-(sp)
    3a80:	2f05           	move.l d5,-(sp)
    3a82:	486e 0030      	pea 48(a6)
    3a86:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3a8c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a8e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3a92:	4646           	not.w d6
    3a94:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    3a96:	4fef 0020      	lea 32(sp),sp
    3a9a:	be8e           	cmp.l a6,d7
    3a9c:	66ce           	bne.s 3a6c <ZoomTest+0x1ffc>
    3a9e:	0682 0000 0630 	addi.l #1584,d2
    3aa4:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    3aa8:	b6fc 00fa      	cmpa.w #250,a3
    3aac:	668a           	bne.s 3a38 <ZoomTest+0x1fc8>
    3aae:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    3ab2:	2f0a           	move.l a2,-(sp)
    3ab4:	3f06           	move.w d6,-(sp)
    3ab6:	4267           	clr.w -(sp)
    3ab8:	2f0b           	move.l a3,-(sp)
    3aba:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3ac0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3ac2:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    3ac6:	4646           	not.w d6
    3ac8:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    3aca:	4fef 0010      	lea 16(sp),sp
    3ace:	b4fc 00fa      	cmpa.w #250,a2
    3ad2:	66de           	bne.s 3ab2 <ZoomTest+0x2042>
    3ad4:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3ad8:	7400           	moveq #0,d2
    3ada:	3406           	move.w d6,d2
    3adc:	2f0a           	move.l a2,-(sp)
    3ade:	2f02           	move.l d2,-(sp)
    3ae0:	2f0b           	move.l a3,-(sp)
    3ae2:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3ae8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    3aea:	486a 0001      	pea 1(a2)
    3aee:	2f02           	move.l d2,-(sp)
    3af0:	486b 0030      	pea 48(a3)
    3af4:	4879 0001 678c 	pea 1678c <destlinezoom15>
    3afa:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3afc:	4646           	not.w d6
    3afe:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3b00:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    3b04:	4fef 0020      	lea 32(sp),sp
    3b08:	b4fc 010e      	cmpa.w #270,a2
    3b0c:	66ca           	bne.s 3ad8 <ZoomTest+0x2068>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    3b0e:	4878 0001      	pea 1 <_start+0x1>
    3b12:	4878 000f      	pea f <main+0x9>
    3b16:	2f03           	move.l d3,-(sp)
    3b18:	2f0c           	move.l a4,-(sp)
    3b1a:	4eba d54e      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b1e:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3b24:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3b28:	42a7           	clr.l -(sp)
    3b2a:	42a7           	clr.l -(sp)
    3b2c:	2f2f 0044      	move.l 68(sp),-(sp)
    3b30:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b36:	4e95           	jsr (a5)
    3b38:	4fef 0020      	lea 32(sp),sp
    3b3c:	246f 0044      	movea.l 68(sp),a2
    3b40:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    3b44:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    3b48:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    3b4a:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b4c:	7a00           	moveq #0,d5
    3b4e:	3a02           	move.w d2,d5
    3b50:	2f0b           	move.l a3,-(sp)
    3b52:	2f05           	move.l d5,-(sp)
    3b54:	2f04           	move.l d4,-(sp)
    3b56:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b5c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3b5e:	486b 0001      	pea 1(a3)
    3b62:	2f05           	move.l d5,-(sp)
    3b64:	2044           	movea.l d4,a0
    3b66:	4868 0030      	pea 48(a0)
    3b6a:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b70:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b72:	4642           	not.w d2
    3b74:	2004           	move.l d4,d0
    3b76:	0680 0000 0120 	addi.l #288,d0
    3b7c:	548b           	addq.l #2,a3
    3b7e:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3b80:	4fef 0020      	lea 32(sp),sp
    3b84:	720c           	moveq #12,d1
    3b86:	b28b           	cmp.l a3,d1
    3b88:	6742           	beq.s 3bcc <ZoomTest+0x215c>
    3b8a:	2c4a           	movea.l a2,a6
    3b8c:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3b8e:	7a00           	moveq #0,d5
    3b90:	3a02           	move.w d2,d5
    3b92:	2f0b           	move.l a3,-(sp)
    3b94:	2f05           	move.l d5,-(sp)
    3b96:	2f04           	move.l d4,-(sp)
    3b98:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3b9e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3ba0:	486b 0001      	pea 1(a3)
    3ba4:	2f05           	move.l d5,-(sp)
    3ba6:	2044           	movea.l d4,a0
    3ba8:	4868 0030      	pea 48(a0)
    3bac:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3bb2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3bb4:	4642           	not.w d2
    3bb6:	2004           	move.l d4,d0
    3bb8:	0680 0000 0120 	addi.l #288,d0
    3bbe:	548b           	addq.l #2,a3
    3bc0:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    3bc2:	4fef 0020      	lea 32(sp),sp
    3bc6:	720c           	moveq #12,d1
    3bc8:	b28b           	cmp.l a3,d1
    3bca:	66be           	bne.s 3b8a <ZoomTest+0x211a>
    3bcc:	367c 000d      	movea.w #13,a3
    3bd0:	2a0c           	move.l a4,d5
    3bd2:	2e00           	move.l d0,d7
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3bd4:	2f0b           	move.l a3,-(sp)
    3bd6:	7800           	moveq #0,d4
    3bd8:	3802           	move.w d2,d4
    3bda:	2f04           	move.l d4,-(sp)
    3bdc:	2f0e           	move.l a6,-(sp)
    3bde:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3be4:	4e95           	jsr (a5)
    3be6:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3bea:	3c02           	move.w d2,d6
    3bec:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3bee:	3f06           	move.w d6,-(sp)
    3bf0:	4267           	clr.w -(sp)
    3bf2:	486e 0030      	pea 48(a6)
    3bf6:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3bfc:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3bfe:	49eb 0003      	lea 3(a3),a4
    3c02:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3c06:	2c47           	movea.l d7,a6
    3c08:	7e23           	moveq #35,d7
    3c0a:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3c0c:	2f0c           	move.l a4,-(sp)
    3c0e:	2f04           	move.l d4,-(sp)
    3c10:	2f0a           	move.l a2,-(sp)
    3c12:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c18:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3c1a:	486c 0001      	pea 1(a4)
    3c1e:	2f04           	move.l d4,-(sp)
    3c20:	486a 0030      	pea 48(a2)
    3c24:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c2a:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c2c:	3406           	move.w d6,d2
    3c2e:	41ea 00c0      	lea 192(a2),a0
    3c32:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3c34:	4fef 0020      	lea 32(sp),sp
    3c38:	b9c7           	cmpa.l d7,a4
    3c3a:	673a           	beq.s 3c76 <ZoomTest+0x2206>
    3c3c:	244e           	movea.l a6,a2
    3c3e:	2c48           	movea.l a0,a6
    3c40:	7800           	moveq #0,d4
    3c42:	3806           	move.w d6,d4
    3c44:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3c46:	2f0c           	move.l a4,-(sp)
    3c48:	2f04           	move.l d4,-(sp)
    3c4a:	2f0a           	move.l a2,-(sp)
    3c4c:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c52:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3c54:	486c 0001      	pea 1(a4)
    3c58:	2f04           	move.l d4,-(sp)
    3c5a:	486a 0030      	pea 48(a2)
    3c5e:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c64:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c66:	3406           	move.w d6,d2
    3c68:	41ea 00c0      	lea 192(a2),a0
    3c6c:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3c6e:	4fef 0020      	lea 32(sp),sp
    3c72:	b9c7           	cmpa.l d7,a4
    3c74:	66c6           	bne.s 3c3c <ZoomTest+0x21cc>
    3c76:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    3c7a:	b6fc 00fb      	cmpa.w #251,a3
    3c7e:	674e           	beq.s 3cce <ZoomTest+0x225e>
    3c80:	2e0a           	move.l a2,d7
    3c82:	0687 0000 0120 	addi.l #288,d7
    3c88:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3c8a:	2f0b           	move.l a3,-(sp)
    3c8c:	7800           	moveq #0,d4
    3c8e:	3802           	move.w d2,d4
    3c90:	2f04           	move.l d4,-(sp)
    3c92:	2f0e           	move.l a6,-(sp)
    3c94:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3c9a:	4e95           	jsr (a5)
    3c9c:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3ca0:	3c02           	move.w d2,d6
    3ca2:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3ca4:	3f06           	move.w d6,-(sp)
    3ca6:	4267           	clr.w -(sp)
    3ca8:	486e 0030      	pea 48(a6)
    3cac:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3cb2:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3cb4:	49eb 0003      	lea 3(a3),a4
    3cb8:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3cbc:	2c47           	movea.l d7,a6
    3cbe:	7e23           	moveq #35,d7
    3cc0:	de8b           	add.l a3,d7
    3cc2:	6000 ff48      	bra.w 3c0c <ZoomTest+0x219c>
    3cc6:	7800           	moveq #0,d4
    3cc8:	3802           	move.w d2,d4
    3cca:	6000 e754      	bra.w 2420 <ZoomTest+0x9b0>
    3cce:	2845           	movea.l d5,a4
    3cd0:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    3cd2:	2f0b           	move.l a3,-(sp)
    3cd4:	7c00           	moveq #0,d6
    3cd6:	3c02           	move.w d2,d6
    3cd8:	2f06           	move.l d6,-(sp)
    3cda:	2f0e           	move.l a6,-(sp)
    3cdc:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3ce2:	4e95           	jsr (a5)
    3ce4:	4878 00fc      	pea fc <main+0xf6>
    3ce8:	2f04           	move.l d4,-(sp)
    3cea:	486a 0090      	pea 144(a2)
    3cee:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3cf4:	4e95           	jsr (a5)
    3cf6:	4fef 0020      	lea 32(sp),sp
    3cfa:	347c 00fd      	movea.w #253,a2
    3cfe:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3d00:	2f0a           	move.l a2,-(sp)
    3d02:	2f06           	move.l d6,-(sp)
    3d04:	2f0b           	move.l a3,-(sp)
    3d06:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d0c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3d0e:	486a 0001      	pea 1(a2)
    3d12:	2f06           	move.l d6,-(sp)
    3d14:	486b 0030      	pea 48(a3)
    3d18:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d1e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d20:	4642           	not.w d2
    3d22:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3d24:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3d28:	4fef 0020      	lea 32(sp),sp
    3d2c:	b4fc 010d      	cmpa.w #269,a2
    3d30:	6736           	beq.s 3d68 <ZoomTest+0x22f8>
    3d32:	7c00           	moveq #0,d6
    3d34:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3d36:	2f0a           	move.l a2,-(sp)
    3d38:	2f06           	move.l d6,-(sp)
    3d3a:	2f0b           	move.l a3,-(sp)
    3d3c:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d42:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3d44:	486a 0001      	pea 1(a2)
    3d48:	2f06           	move.l d6,-(sp)
    3d4a:	486b 0030      	pea 48(a3)
    3d4e:	4879 0001 6760 	pea 16760 <destlinezoom16>
    3d54:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3d56:	4642           	not.w d2
    3d58:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3d5a:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3d5e:	4fef 0020      	lea 32(sp),sp
    3d62:	b4fc 010d      	cmpa.w #269,a2
    3d66:	66ca           	bne.s 3d32 <ZoomTest+0x22c2>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    3d68:	4878 0001      	pea 1 <_start+0x1>
    3d6c:	4878 0010      	pea 10 <main+0xa>
    3d70:	2f0c           	move.l a4,-(sp)
    3d72:	2f03           	move.l d3,-(sp)
    3d74:	4eba d2f4      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3d78:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3d7e:	4eae ff1c      	jsr -228(a6)
    3d82:	4fef 0010      	lea 16(sp),sp
    3d86:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    3d8a:	7eff           	moveq #-1,d7
    3d8c:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3d90:	7400           	moveq #0,d2
    3d92:	3407           	move.w d7,d2
    3d94:	486a ffff      	pea -1(a2)
    3d98:	2f02           	move.l d2,-(sp)
    3d9a:	2f0b           	move.l a3,-(sp)
    3d9c:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3da2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    3da4:	2f0a           	move.l a2,-(sp)
    3da6:	2f02           	move.l d2,-(sp)
    3da8:	486b 0030      	pea 48(a3)
    3dac:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3db2:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3db4:	4647           	not.w d7
    3db6:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3db8:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    3dbc:	4fef 0020      	lea 32(sp),sp
    3dc0:	700b           	moveq #11,d0
    3dc2:	b08a           	cmp.l a2,d0
    3dc4:	66ca           	bne.s 3d90 <ZoomTest+0x2320>
    3dc6:	2a0c           	move.l a4,d5
    3dc8:	0685 0000 01e4 	addi.l #484,d5
    3dce:	367c 000a      	movea.w #10,a3
    3dd2:	2f4c 0034      	move.l a4,52(sp)
    3dd6:	2c0a           	move.l a2,d6
    3dd8:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3dda:	2f0b           	move.l a3,-(sp)
    3ddc:	3f07           	move.w d7,-(sp)
    3dde:	4267           	clr.w -(sp)
    3de0:	2f0a           	move.l a2,-(sp)
    3de2:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3de8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3dea:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    3dee:	3807           	move.w d7,d4
    3df0:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3df2:	49eb 0001      	lea 1(a3),a4
    3df6:	4fef 0010      	lea 16(sp),sp
    3dfa:	45ea 0690      	lea 1680(a2),a2
    3dfe:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3e00:	7400           	moveq #0,d2
    3e02:	3404           	move.w d4,d2
    3e04:	2f0c           	move.l a4,-(sp)
    3e06:	2f02           	move.l d2,-(sp)
    3e08:	2f0e           	move.l a6,-(sp)
    3e0a:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e10:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3e12:	486c 0001      	pea 1(a4)
    3e16:	2f02           	move.l d2,-(sp)
    3e18:	486e 0030      	pea 48(a6)
    3e1c:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e22:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3e24:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3e28:	4644           	not.w d4
    3e2a:	3e04           	move.w d4,d7
    3e2c:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3e2e:	4fef 0020      	lea 32(sp),sp
    3e32:	bdc5           	cmpa.l d5,a6
    3e34:	66ca           	bne.s 3e00 <ZoomTest+0x2390>
    3e36:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3e3a:	b6fc 00ff      	cmpa.w #255,a3
    3e3e:	669a           	bne.s 3dda <ZoomTest+0x236a>
    3e40:	286f 0034      	movea.l 52(sp),a4
    3e44:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3e46:	2f0b           	move.l a3,-(sp)
    3e48:	3f04           	move.w d4,-(sp)
    3e4a:	4267           	clr.w -(sp)
    3e4c:	486c 2fd4      	pea 12244(a4)
    3e50:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e56:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3e58:	4dec 3004      	lea 12292(a4),a6
    3e5c:	4fef 0010      	lea 16(sp),sp
    3e60:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e64:	2f0b           	move.l a3,-(sp)
    3e66:	2f02           	move.l d2,-(sp)
    3e68:	2f0e           	move.l a6,-(sp)
    3e6a:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e70:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3e72:	486b 0001      	pea 1(a3)
    3e76:	2f02           	move.l d2,-(sp)
    3e78:	486e 0030      	pea 48(a6)
    3e7c:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3e82:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3e84:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3e86:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3e8a:	4fef 0020      	lea 32(sp),sp
    3e8e:	b6fc 010e      	cmpa.w #270,a3
    3e92:	6736           	beq.s 3eca <ZoomTest+0x245a>
    3e94:	7400           	moveq #0,d2
    3e96:	3404           	move.w d4,d2
    3e98:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3e9a:	2f0b           	move.l a3,-(sp)
    3e9c:	2f02           	move.l d2,-(sp)
    3e9e:	2f0e           	move.l a6,-(sp)
    3ea0:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3ea6:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3ea8:	486b 0001      	pea 1(a3)
    3eac:	2f02           	move.l d2,-(sp)
    3eae:	486e 0030      	pea 48(a6)
    3eb2:	4879 0001 6734 	pea 16734 <destlinezoom17>
    3eb8:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3eba:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3ebc:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3ec0:	4fef 0020      	lea 32(sp),sp
    3ec4:	b6fc 010e      	cmpa.w #270,a3
    3ec8:	66ca           	bne.s 3e94 <ZoomTest+0x2424>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3eca:	4878 0001      	pea 1 <_start+0x1>
    3ece:	4878 0011      	pea 11 <main+0xb>
    3ed2:	2f03           	move.l d3,-(sp)
    3ed4:	2f0c           	move.l a4,-(sp)
    3ed6:	4eba d192      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3eda:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    3ee0:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3ee4:	42a7           	clr.l -(sp)
    3ee6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3eec:	2f2f 0044      	move.l 68(sp),-(sp)
    3ef0:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3ef6:	4e95           	jsr (a5)
    3ef8:	4fef 0020      	lea 32(sp),sp
    3efc:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3f00:	4242           	clr.w d2
    3f02:	2a2f 0044      	move.l 68(sp),d5
    3f06:	2c6f 0040      	movea.l 64(sp),a6
    3f0a:	2c2f 0038      	move.l 56(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3f0e:	7800           	moveq #0,d4
    3f10:	3802           	move.w d2,d4
    3f12:	2f0b           	move.l a3,-(sp)
    3f14:	2f04           	move.l d4,-(sp)
    3f16:	2f0e           	move.l a6,-(sp)
    3f18:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f1e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3f20:	486b 0001      	pea 1(a3)
    3f24:	2f04           	move.l d4,-(sp)
    3f26:	486e 0030      	pea 48(a6)
    3f2a:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f30:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3f32:	4642           	not.w d2
    3f34:	200e           	move.l a6,d0
    3f36:	0680 0000 0120 	addi.l #288,d0
    3f3c:	548b           	addq.l #2,a3
    3f3e:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3f40:	4fef 0020      	lea 32(sp),sp
    3f44:	7209           	moveq #9,d1
    3f46:	b28b           	cmp.l a3,d1
    3f48:	6740           	beq.s 3f8a <ZoomTest+0x251a>
    3f4a:	2c05           	move.l d5,d6
    3f4c:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3f4e:	7800           	moveq #0,d4
    3f50:	3802           	move.w d2,d4
    3f52:	2f0b           	move.l a3,-(sp)
    3f54:	2f04           	move.l d4,-(sp)
    3f56:	2f0e           	move.l a6,-(sp)
    3f58:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f5e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3f60:	486b 0001      	pea 1(a3)
    3f64:	2f04           	move.l d4,-(sp)
    3f66:	486e 0030      	pea 48(a6)
    3f6a:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3f70:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3f72:	4642           	not.w d2
    3f74:	200e           	move.l a6,d0
    3f76:	0680 0000 0120 	addi.l #288,d0
    3f7c:	548b           	addq.l #2,a3
    3f7e:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3f80:	4fef 0020      	lea 32(sp),sp
    3f84:	7209           	moveq #9,d1
    3f86:	b28b           	cmp.l a3,d1
    3f88:	66c0           	bne.s 3f4a <ZoomTest+0x24da>
    3f8a:	2f45 0044      	move.l d5,68(sp)
    3f8e:	2f46 0038      	move.l d6,56(sp)
    3f92:	2805           	move.l d5,d4
    3f94:	2646           	movea.l d6,a3
    3f96:	2c4a           	movea.l a2,a6
    3f98:	2a00           	move.l d0,d5
    3f9a:	7e24           	moveq #36,d7
    3f9c:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3f9e:	7c00           	moveq #0,d6
    3fa0:	3c02           	move.w d2,d6
    3fa2:	2f0e           	move.l a6,-(sp)
    3fa4:	2f06           	move.l d6,-(sp)
    3fa6:	2f0b           	move.l a3,-(sp)
    3fa8:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3fae:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3fb0:	486e 0001      	pea 1(a6)
    3fb4:	2f06           	move.l d6,-(sp)
    3fb6:	486b 0030      	pea 48(a3)
    3fba:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3fc0:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3fc2:	4642           	not.w d2
    3fc4:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3fc6:	4fef 0020      	lea 32(sp),sp
    3fca:	bdc7           	cmpa.l d7,a6
    3fcc:	673e           	beq.s 400c <ZoomTest+0x259c>
    3fce:	200b           	move.l a3,d0
    3fd0:	0680 0000 0120 	addi.l #288,d0
    3fd6:	2644           	movea.l d4,a3
    3fd8:	2805           	move.l d5,d4
    3fda:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3fdc:	7c00           	moveq #0,d6
    3fde:	3c02           	move.w d2,d6
    3fe0:	2f0e           	move.l a6,-(sp)
    3fe2:	2f06           	move.l d6,-(sp)
    3fe4:	2f0b           	move.l a3,-(sp)
    3fe6:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3fec:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3fee:	486e 0001      	pea 1(a6)
    3ff2:	2f06           	move.l d6,-(sp)
    3ff4:	486b 0030      	pea 48(a3)
    3ff8:	4879 0001 6708 	pea 16708 <destlinezoom18>
    3ffe:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    4000:	4642           	not.w d2
    4002:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    4004:	4fef 0020      	lea 32(sp),sp
    4008:	bdc7           	cmpa.l d7,a6
    400a:	66c2           	bne.s 3fce <ZoomTest+0x255e>
    400c:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    4010:	b4fc 0100      	cmpa.w #256,a2
    4014:	6718           	beq.s 402e <ZoomTest+0x25be>
    4016:	200b           	move.l a3,d0
    4018:	0680 0000 0120 	addi.l #288,d0
    401e:	2644           	movea.l d4,a3
    4020:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    4022:	2c4a           	movea.l a2,a6
    4024:	2a00           	move.l d0,d5
    4026:	7e24           	moveq #36,d7
    4028:	de8a           	add.l a2,d7
    402a:	6000 ff72      	bra.w 3f9e <ZoomTest+0x252e>
    402e:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    4030:	7800           	moveq #0,d4
    4032:	3802           	move.w d2,d4
    4034:	2f0a           	move.l a2,-(sp)
    4036:	2f04           	move.l d4,-(sp)
    4038:	2f0b           	move.l a3,-(sp)
    403a:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4040:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    4042:	486a 0001      	pea 1(a2)
    4046:	2f04           	move.l d4,-(sp)
    4048:	486b 0030      	pea 48(a3)
    404c:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4052:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4054:	4642           	not.w d2
    4056:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    4058:	4fef 0020      	lea 32(sp),sp
    405c:	b4fc 0108      	cmpa.w #264,a2
    4060:	673e           	beq.s 40a0 <ZoomTest+0x2630>
    4062:	200b           	move.l a3,d0
    4064:	0680 0000 00c0 	addi.l #192,d0
    406a:	2645           	movea.l d5,a3
    406c:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    406e:	7800           	moveq #0,d4
    4070:	3802           	move.w d2,d4
    4072:	2f0a           	move.l a2,-(sp)
    4074:	2f04           	move.l d4,-(sp)
    4076:	2f0b           	move.l a3,-(sp)
    4078:	4879 0001 6708 	pea 16708 <destlinezoom18>
    407e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    4080:	486a 0001      	pea 1(a2)
    4084:	2f04           	move.l d4,-(sp)
    4086:	486b 0030      	pea 48(a3)
    408a:	4879 0001 6708 	pea 16708 <destlinezoom18>
    4090:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    4092:	4642           	not.w d2
    4094:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    4096:	4fef 0020      	lea 32(sp),sp
    409a:	b4fc 0108      	cmpa.w #264,a2
    409e:	66c2           	bne.s 4062 <ZoomTest+0x25f2>
  TestRow( valsupposed, valactual, mask, 0);
    40a0:	42a7           	clr.l -(sp)
    40a2:	3f02           	move.w d2,-(sp)
    40a4:	4267           	clr.w -(sp)
    40a6:	2f05           	move.l d5,-(sp)
    40a8:	4879 0001 6708 	pea 16708 <destlinezoom18>
    40ae:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    40b0:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40b6:	224c           	movea.l a4,a1
    40b8:	203c 0000 3740 	move.l #14144,d0
    40be:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    40c2:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40c8:	2243           	movea.l d3,a1
    40ca:	203c 0000 3740 	move.l #14144,d0
    40d0:	4eae ff2e      	jsr -210(a6)
    40d4:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    40d8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40de:	203c 0001 1440 	move.l #70720,d0
    40e4:	7202           	moveq #2,d1
    40e6:	4eae ff3a      	jsr -198(a6)
    40ea:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    40ee:	6700 0394      	beq.w 4484 <ZoomTest+0x2a14>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    40f2:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    40f8:	203c 0001 1440 	move.l #70720,d0
    40fe:	7202           	moveq #2,d1
    4100:	4eae ff3a      	jsr -198(a6)
    4104:	2f40 0038      	move.l d0,56(sp)
  if( destination == 0) {
    4108:	6700 0408      	beq.w 4512 <ZoomTest+0x2aa2>
    410c:	242f 0034      	move.l 52(sp),d2
    4110:	0682 0000 ff00 	addi.l #65280,d2
    4116:	246f 0034      	movea.l 52(sp),a2
    411a:	4878 00f0      	pea f0 <main+0xea>
    411e:	4878 0055      	pea 55 <main+0x4f>
    4122:	2f0a           	move.l a2,-(sp)
    4124:	4eba 04c8      	jsr 45ee <memset>(pc)
    4128:	4878 00f0      	pea f0 <main+0xea>
    412c:	4878 00aa      	pea aa <main+0xa4>
    4130:	486a 00f0      	pea 240(a2)
    4134:	4eba 04b8      	jsr 45ee <memset>(pc)
    4138:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    413c:	4fef 0018      	lea 24(sp),sp
    4140:	b48a           	cmp.l a2,d2
    4142:	66d6           	bne.s 411a <ZoomTest+0x26aa>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    4144:	4878 0005      	pea 5 <_start+0x5>
    4148:	42a7           	clr.l -(sp)
    414a:	2f2f 0040      	move.l 64(sp),-(sp)
    414e:	2f2f 0040      	move.l 64(sp),-(sp)
    4152:	4eba cf16      	jsr 106a <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    4156:	2c79 0001 6a82 	movea.l 16a82 <GfxBase>,a6
    415c:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    4160:	202f 0048      	move.l 72(sp),d0
    4164:	0680 0000 11d4 	addi.l #4564,d0
    416a:	2f40 003c      	move.l d0,60(sp)
    416e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4172:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    4174:	7eff           	moveq #-1,d7
    4176:	4bfa c836      	lea 9ae <TestRow>(pc),a5
    417a:	41ef 0078      	lea 120(sp),a0
    417e:	2f48 0048      	move.l a0,72(sp)
    4182:	2f4d 0030      	move.l a5,48(sp)
    4186:	2a46           	movea.l d6,a5
    4188:	282f 002c      	move.l 44(sp),d4
    418c:	0684 ffff ef4a 	addi.l #-4278,d4
    4192:	3c0d           	move.w a5,d6
    4194:	0646 ffee      	addi.w #-18,d6
    4198:	307c 002a      	movea.w #42,a0
    419c:	d1ef 002c      	adda.l 44(sp),a0
    41a0:	2f48 0044      	move.l a0,68(sp)
    41a4:	2f4d 003c      	move.l a5,60(sp)
    41a8:	2844           	movea.l d4,a4
    41aa:	49ec ff10      	lea -240(a4),a4
    41ae:	41ec ffd6      	lea -42(a4),a0
    41b2:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    41b6:	4878 0064      	pea 64 <main+0x5e>
    41ba:	42a7           	clr.l -(sp)
    41bc:	486f 0080      	pea 128(sp)
    41c0:	4eba 042c      	jsr 45ee <memset>(pc)
  data[1] = numberofline;
    41c4:	3f46 0082      	move.w d6,130(sp)
    41c8:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    41cc:	7a00           	moveq #0,d5
  testpattern += 0;
    41ce:	4bf9 0001 69f4 	lea 169f4 <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    41d4:	301d           	move.w (a5)+,d0
    41d6:	bf40           	eor.w d7,d0
    41d8:	206f 0040      	movea.l 64(sp),a0
    41dc:	54af 0040      	addq.l #2,64(sp)
    41e0:	b058           	cmp.w (a0)+,d0
    41e2:	673c           	beq.s 4220 <ZoomTest+0x27b0>
      data[0] = i;
    41e4:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    41e8:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    41ee:	41f9 0001 4eed 	lea 14eed <incbin_startimage_end+0x49>,a0
    41f4:	43ef 0074      	lea 116(sp),a1
    41f8:	45f9 0000 47dc 	lea 47dc <PutChar>,a2
    41fe:	47ef 0078      	lea 120(sp),a3
    4202:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    4206:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    420c:	4eae ffc4      	jsr -60(a6)
    4210:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4216:	2200           	move.l d0,d1
    4218:	240b           	move.l a3,d2
    421a:	7664           	moveq #100,d3
    421c:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    4220:	5285           	addq.l #1,d5
    4222:	bbfc 0001 6a1e 	cmpa.l #92702,a5
    4228:	66aa           	bne.s 41d4 <ZoomTest+0x2764>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    422a:	3039 0001 6a1e 	move.w 16a1e <destlinezoom1+0x2a>,d0
    4230:	bf40           	eor.w d7,d0
    4232:	3214           	move.w (a4),d1
    4234:	b340           	eor.w d1,d0
    4236:	0240 ff00      	andi.w #-256,d0
    423a:	6600 00b4      	bne.w 42f0 <ZoomTest+0x2880>
        valactual += ZMLINESIZE/2;
    423e:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    4242:	b88c           	cmp.l a4,d4
    4244:	6600 ff68      	bne.w 41ae <ZoomTest+0x273e>
      mask = mask ^ 0xffff;
    4248:	4647           	not.w d7
    424a:	0684 0000 00f0 	addi.l #240,d4
    4250:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    4252:	b8af 0044      	cmp.l 68(sp),d4
    4256:	6600 ff50      	bne.w 41a8 <ZoomTest+0x2738>
    425a:	2a6f 003c      	movea.l 60(sp),a5
    425e:	246f 002c      	movea.l 44(sp),a2
    4262:	45ea ff10      	lea -240(a2),a2
    4266:	7600           	moveq #0,d3
    4268:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    426a:	2f0d           	move.l a5,-(sp)
    426c:	2f03           	move.l d3,-(sp)
    426e:	2f0a           	move.l a2,-(sp)
    4270:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    4276:	206f 0040      	movea.l 64(sp),a0
    427a:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    427c:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    4280:	4fef 0010      	lea 16(sp),sp
    4284:	b5ef 002c      	cmpa.l 44(sp),a2
    4288:	66e0           	bne.s 426a <ZoomTest+0x27fa>
    428a:	45ea 11d0      	lea 4560(a2),a2
    428e:	2f4a 002c      	move.l a2,44(sp)
    4292:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    4296:	bafc 011c      	cmpa.w #284,a5
    429a:	6600 feec      	bne.w 4188 <ZoomTest+0x2718>
    429e:	2a6f 0030      	movea.l 48(sp),a5
    42a2:	246f 0038      	movea.l 56(sp),a2
    42a6:	d5fc 0000 f964 	adda.l #63844,a2
    42ac:	243c 0000 0109 	move.l #265,d2
    42b2:	280a           	move.l a2,d4
    42b4:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    42ba:	2f02           	move.l d2,-(sp)
    42bc:	2f03           	move.l d3,-(sp)
    42be:	2f0a           	move.l a2,-(sp)
    42c0:	4879 0001 69f4 	pea 169f4 <destlinezoom1>
    42c6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    42c8:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    42cc:	4fef 0010      	lea 16(sp),sp
    42d0:	b88a           	cmp.l a2,d4
    42d2:	66e6           	bne.s 42ba <ZoomTest+0x284a>
    mask = mask ^ 0xffff;
    42d4:	4647           	not.w d7
    42d6:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    42d8:	0c82 0000 010d 	cmpi.l #269,d2
    42de:	6700 009e      	beq.w 437e <ZoomTest+0x290e>
    42e2:	7600           	moveq #0,d3
    42e4:	3607           	move.w d7,d3
    42e6:	280a           	move.l a2,d4
    42e8:	0684 0000 00f0 	addi.l #240,d4
    42ee:	60ca           	bra.s 42ba <ZoomTest+0x284a>
    data[0] = 21;
    42f0:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    42f6:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    42fc:	41f9 0001 4eed 	lea 14eed <incbin_startimage_end+0x49>,a0
    4302:	43ef 0074      	lea 116(sp),a1
    4306:	45f9 0000 47dc 	lea 47dc <PutChar>,a2
    430c:	47ef 0078      	lea 120(sp),a3
    4310:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    4314:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    431a:	4eae ffc4      	jsr -60(a6)
    431e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4324:	2200           	move.l d0,d1
    4326:	240b           	move.l a3,d2
    4328:	7664           	moveq #100,d3
    432a:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    432e:	7000           	moveq #0,d0
    4330:	3014           	move.w (a4),d0
    4332:	2f00           	move.l d0,-(sp)
    4334:	3039 0001 6a1e 	move.w 16a1e <destlinezoom1+0x2a>,d0
    433a:	2f00           	move.l d0,-(sp)
    433c:	4879 0001 4f1d 	pea 14f1d <incbin_startimage_end+0x79>
    4342:	4eba c602      	jsr 946 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    4346:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    434a:	4fef 000c      	lea 12(sp),sp
    434e:	b9c4           	cmpa.l d4,a4
    4350:	6700 fef6      	beq.w 4248 <ZoomTest+0x27d8>
    4354:	41ec ffd6      	lea -42(a4),a0
    4358:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    435c:	4878 0064      	pea 64 <main+0x5e>
    4360:	42a7           	clr.l -(sp)
    4362:	486f 0080      	pea 128(sp)
    4366:	4eba 0286      	jsr 45ee <memset>(pc)
  data[1] = numberofline;
    436a:	3f46 0082      	move.w d6,130(sp)
    436e:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    4372:	7a00           	moveq #0,d5
  testpattern += 0;
    4374:	4bf9 0001 69f4 	lea 169f4 <destlinezoom1>,a5
    437a:	6000 fe58      	bra.w 41d4 <ZoomTest+0x2764>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    437e:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    4384:	226f 0034      	movea.l 52(sp),a1
    4388:	203c 0001 1440 	move.l #70720,d0
    438e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    4392:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    4398:	226f 0038      	movea.l 56(sp),a1
    439c:	203c 0001 1440 	move.l #70720,d0
    43a2:	4eae ff2e      	jsr -210(a6)
}
    43a6:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    43aa:	4fef 00b0      	lea 176(sp),sp
    43ae:	4e75           	rts
  if( TestZoom102Batch( cl2test, position+1) == 0)
    43b0:	4878 004a      	pea 4a <main+0x44>
    43b4:	2f02           	move.l d2,-(sp)
    43b6:	49fa c732      	lea aea <TestZoom102Batch>(pc),a4
    43ba:	4e94           	jsr (a4)
    43bc:	508f           	addq.l #8,sp
    43be:	4a80           	tst.l d0
    43c0:	6700 db1e      	beq.w 1ee0 <ZoomTest+0x470>
  if( TestZoom102Batch( cl2test, position+36) == 0)
    43c4:	4878 006d      	pea 6d <main+0x67>
    43c8:	2f02           	move.l d2,-(sp)
    43ca:	4e94           	jsr (a4)
    43cc:	508f           	addq.l #8,sp
    43ce:	4a80           	tst.l d0
    43d0:	6700 db0e      	beq.w 1ee0 <ZoomTest+0x470>
  if( TestZoom102Batch( cl2test, position+69) == 0)
    43d4:	4878 008e      	pea 8e <main+0x88>
    43d8:	2f02           	move.l d2,-(sp)
    43da:	4e94           	jsr (a4)
    43dc:	508f           	addq.l #8,sp
    43de:	4a80           	tst.l d0
    43e0:	6700 dafe      	beq.w 1ee0 <ZoomTest+0x470>
  if( TestZoom102Batch( cl2test, position+102) == 0)
    43e4:	4878 00af      	pea af <main+0xa9>
    43e8:	2f02           	move.l d2,-(sp)
    43ea:	4e94           	jsr (a4)
    43ec:	508f           	addq.l #8,sp
    43ee:	4a80           	tst.l d0
    43f0:	6600 db0c      	bne.w 1efe <ZoomTest+0x48e>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    43f4:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    43fa:	4eae ffc4      	jsr -60(a6)
    43fe:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4404:	2200           	move.l d0,d1
    4406:	243c 0001 51ff 	move.l #86527,d2
    440c:	7625           	moveq #37,d3
    440e:	4eae ffd0      	jsr -48(a6)
    4412:	6000 daea      	bra.w 1efe <ZoomTest+0x48e>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    4416:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    441c:	4eae ffc4      	jsr -60(a6)
    4420:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4426:	2200           	move.l d0,d1
    4428:	243c 0001 52e4 	move.l #86756,d2
    442e:	7635           	moveq #53,d3
    4430:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    4434:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    443a:	203c 0000 3740 	move.l #14144,d0
    4440:	7202           	moveq #2,d1
    4442:	4eae ff3a      	jsr -198(a6)
    4446:	2600           	move.l d0,d3
  if( source == 0) {
    4448:	6600 dea4      	bne.w 22ee <ZoomTest+0x87e>
    Write(  Output(), 
    444c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4452:	4eae ffc4      	jsr -60(a6)
    4456:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    445c:	2200           	move.l d0,d1
    445e:	243c 0001 535b 	move.l #86875,d2
    4464:	7639           	moveq #57,d3
    4466:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    446a:	2c79 0001 6a8e 	movea.l 16a8e <SysBase>,a6
    4470:	203c 0001 1440 	move.l #70720,d0
    4476:	7202           	moveq #2,d1
    4478:	4eae ff3a      	jsr -198(a6)
    447c:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    4480:	6600 fc70      	bne.w 40f2 <ZoomTest+0x2682>
    Write(  Output(), 
    4484:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    448a:	4eae ffc4      	jsr -60(a6)
    448e:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4494:	2200           	move.l d0,d1
    4496:	243c 0001 535b 	move.l #86875,d2
    449c:	7639           	moveq #57,d3
    449e:	4eae ffd0      	jsr -48(a6)
}
    44a2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    44a6:	4fef 00b0      	lea 176(sp),sp
    44aa:	4e75           	rts
    Write(  Output(), 
    44ac:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44b2:	4eae ffc4      	jsr -60(a6)
    44b6:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44bc:	2200           	move.l d0,d1
    44be:	243c 0001 5257 	move.l #86615,d2
    44c4:	7636           	moveq #54,d3
    44c6:	4eae ffd0      	jsr -48(a6)
    return;
    44ca:	6000 dbd0      	bra.w 209c <ZoomTest+0x62c>
    Write(  Output(), 
    44ce:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44d4:	4eae ffc4      	jsr -60(a6)
    44d8:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44de:	2200           	move.l d0,d1
    44e0:	243c 0001 4fc5 	move.l #85957,d2
    44e6:	7639           	moveq #57,d3
    44e8:	4eae ffd0      	jsr -48(a6)
    return;
    44ec:	6000 d77c      	bra.w 1c6a <ZoomTest+0x1fa>
    Write(  Output(), 
    44f0:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    44f6:	4eae ffc4      	jsr -60(a6)
    44fa:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4500:	2200           	move.l d0,d1
    4502:	243c 0001 5395 	move.l #86933,d2
    4508:	763d           	moveq #61,d3
    450a:	4eae ffd0      	jsr -48(a6)
    return;
    450e:	6000 fbc8      	bra.w 40d8 <ZoomTest+0x2668>
    Write(  Output(), 
    4512:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4518:	4eae ffc4      	jsr -60(a6)
    451c:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4522:	2200           	move.l d0,d1
    4524:	243c 0001 5395 	move.l #86933,d2
    452a:	763d           	moveq #61,d3
    452c:	4eae ffd0      	jsr -48(a6)
}
    4530:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    4534:	4fef 00b0      	lea 176(sp),sp
    4538:	4e75           	rts
    Write(  Output(), 
    453a:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    4540:	4eae ffc4      	jsr -60(a6)
    4544:	2c79 0001 6a8a 	movea.l 16a8a <DOSBase>,a6
    454a:	2200           	move.l d0,d1
    454c:	243c 0001 4ffc 	move.l #86012,d2
    4552:	763d           	moveq #61,d3
    4554:	4eae ffd0      	jsr -48(a6)
    return;
    4558:	6000 d710      	bra.w 1c6a <ZoomTest+0x1fa>

0000455c <memcpy>:
{
    455c:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4560:	202f 0014      	move.l 20(sp),d0
    4564:	226f 0018      	movea.l 24(sp),a1
    4568:	222f 001c      	move.l 28(sp),d1
	while(len--)
    456c:	2601           	move.l d1,d3
    456e:	5383           	subq.l #1,d3
    4570:	4a81           	tst.l d1
    4572:	6762           	beq.s 45d6 <memcpy+0x7a>
    4574:	2040           	movea.l d0,a0
    4576:	5888           	addq.l #4,a0
    4578:	b1c9           	cmpa.l a1,a0
    457a:	53c2           	sl.s d2
    457c:	4402           	neg.b d2
    457e:	41e9 0004      	lea 4(a1),a0
    4582:	b1c0           	cmpa.l d0,a0
    4584:	53c4           	sl.s d4
    4586:	4404           	neg.b d4
    4588:	8404           	or.b d4,d2
    458a:	7808           	moveq #8,d4
    458c:	b883           	cmp.l d3,d4
    458e:	55c4           	sc.s d4
    4590:	4404           	neg.b d4
    4592:	c404           	and.b d4,d2
    4594:	6746           	beq.s 45dc <memcpy+0x80>
    4596:	2409           	move.l a1,d2
    4598:	8480           	or.l d0,d2
    459a:	7803           	moveq #3,d4
    459c:	c484           	and.l d4,d2
    459e:	663c           	bne.s 45dc <memcpy+0x80>
    45a0:	2049           	movea.l a1,a0
    45a2:	2440           	movea.l d0,a2
    45a4:	74fc           	moveq #-4,d2
    45a6:	c481           	and.l d1,d2
    45a8:	d489           	add.l a1,d2
		*d++ = *s++;
    45aa:	24d8           	move.l (a0)+,(a2)+
    45ac:	b488           	cmp.l a0,d2
    45ae:	66fa           	bne.s 45aa <memcpy+0x4e>
    45b0:	74fc           	moveq #-4,d2
    45b2:	c481           	and.l d1,d2
    45b4:	2040           	movea.l d0,a0
    45b6:	d1c2           	adda.l d2,a0
    45b8:	d3c2           	adda.l d2,a1
    45ba:	9682           	sub.l d2,d3
    45bc:	b481           	cmp.l d1,d2
    45be:	6716           	beq.s 45d6 <memcpy+0x7a>
    45c0:	1091           	move.b (a1),(a0)
	while(len--)
    45c2:	4a83           	tst.l d3
    45c4:	6710           	beq.s 45d6 <memcpy+0x7a>
		*d++ = *s++;
    45c6:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    45cc:	5383           	subq.l #1,d3
    45ce:	6706           	beq.s 45d6 <memcpy+0x7a>
		*d++ = *s++;
    45d0:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    45d6:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    45da:	4e75           	rts
    45dc:	2040           	movea.l d0,a0
    45de:	d289           	add.l a1,d1
		*d++ = *s++;
    45e0:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    45e2:	b289           	cmp.l a1,d1
    45e4:	67f0           	beq.s 45d6 <memcpy+0x7a>
		*d++ = *s++;
    45e6:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    45e8:	b289           	cmp.l a1,d1
    45ea:	66f4           	bne.s 45e0 <memcpy+0x84>
    45ec:	60e8           	bra.s 45d6 <memcpy+0x7a>

000045ee <memset>:
{
    45ee:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    45f2:	202f 0024      	move.l 36(sp),d0
    45f6:	2a2f 0028      	move.l 40(sp),d5
    45fa:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    45fe:	2809           	move.l a1,d4
    4600:	5384           	subq.l #1,d4
    4602:	b2fc 0000      	cmpa.w #0,a1
    4606:	6f00 00b0      	ble.w 46b8 <memset+0xca>
    460a:	1e05           	move.b d5,d7
    460c:	2200           	move.l d0,d1
    460e:	4481           	neg.l d1
    4610:	7403           	moveq #3,d2
    4612:	c282           	and.l d2,d1
    4614:	7c05           	moveq #5,d6
		*ptr++ = val;
    4616:	2440           	movea.l d0,a2
    4618:	bc84           	cmp.l d4,d6
    461a:	646a           	bcc.s 4686 <memset+0x98>
    461c:	4a81           	tst.l d1
    461e:	6724           	beq.s 4644 <memset+0x56>
    4620:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4622:	5384           	subq.l #1,d4
    4624:	7401           	moveq #1,d2
    4626:	b481           	cmp.l d1,d2
    4628:	671a           	beq.s 4644 <memset+0x56>
		*ptr++ = val;
    462a:	2440           	movea.l d0,a2
    462c:	548a           	addq.l #2,a2
    462e:	2040           	movea.l d0,a0
    4630:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4634:	5384           	subq.l #1,d4
    4636:	7403           	moveq #3,d2
    4638:	b481           	cmp.l d1,d2
    463a:	6608           	bne.s 4644 <memset+0x56>
		*ptr++ = val;
    463c:	528a           	addq.l #1,a2
    463e:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4642:	5384           	subq.l #1,d4
    4644:	2609           	move.l a1,d3
    4646:	9681           	sub.l d1,d3
    4648:	7c00           	moveq #0,d6
    464a:	1c05           	move.b d5,d6
    464c:	2406           	move.l d6,d2
    464e:	4842           	swap d2
    4650:	4242           	clr.w d2
    4652:	2042           	movea.l d2,a0
    4654:	2406           	move.l d6,d2
    4656:	e14a           	lsl.w #8,d2
    4658:	4842           	swap d2
    465a:	4242           	clr.w d2
    465c:	e18e           	lsl.l #8,d6
    465e:	2646           	movea.l d6,a3
    4660:	2c08           	move.l a0,d6
    4662:	8486           	or.l d6,d2
    4664:	2c0b           	move.l a3,d6
    4666:	8486           	or.l d6,d2
    4668:	1407           	move.b d7,d2
    466a:	2040           	movea.l d0,a0
    466c:	d1c1           	adda.l d1,a0
    466e:	72fc           	moveq #-4,d1
    4670:	c283           	and.l d3,d1
    4672:	d288           	add.l a0,d1
		*ptr++ = val;
    4674:	20c2           	move.l d2,(a0)+
    4676:	b1c1           	cmpa.l d1,a0
    4678:	66fa           	bne.s 4674 <memset+0x86>
    467a:	72fc           	moveq #-4,d1
    467c:	c283           	and.l d3,d1
    467e:	d5c1           	adda.l d1,a2
    4680:	9881           	sub.l d1,d4
    4682:	b283           	cmp.l d3,d1
    4684:	6732           	beq.s 46b8 <memset+0xca>
    4686:	1485           	move.b d5,(a2)
	while(len-- > 0)
    4688:	4a84           	tst.l d4
    468a:	6f2c           	ble.s 46b8 <memset+0xca>
		*ptr++ = val;
    468c:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4690:	7201           	moveq #1,d1
    4692:	b284           	cmp.l d4,d1
    4694:	6c22           	bge.s 46b8 <memset+0xca>
		*ptr++ = val;
    4696:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    469a:	7402           	moveq #2,d2
    469c:	b484           	cmp.l d4,d2
    469e:	6c18           	bge.s 46b8 <memset+0xca>
		*ptr++ = val;
    46a0:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    46a4:	7c03           	moveq #3,d6
    46a6:	bc84           	cmp.l d4,d6
    46a8:	6c0e           	bge.s 46b8 <memset+0xca>
		*ptr++ = val;
    46aa:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    46ae:	7204           	moveq #4,d1
    46b0:	b284           	cmp.l d4,d1
    46b2:	6c04           	bge.s 46b8 <memset+0xca>
		*ptr++ = val;
    46b4:	1545 0005      	move.b d5,5(a2)
}
    46b8:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    46bc:	4e75           	rts

000046be <strlen>:
{
    46be:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    46c2:	7000           	moveq #0,d0
	while(*s++)
    46c4:	4a10           	tst.b (a0)
    46c6:	6708           	beq.s 46d0 <strlen+0x12>
		t++;
    46c8:	5280           	addq.l #1,d0
	while(*s++)
    46ca:	4a30 0800      	tst.b (0,a0,d0.l)
    46ce:	66f8           	bne.s 46c8 <strlen+0xa>
}
    46d0:	4e75           	rts
    46d2:	4e71           	nop

000046d4 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    46d4:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    46d8:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    46dc:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    46e0:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    46e4:	d041           	add.w d1,d0
	swap	d0
    46e6:	4840           	swap d0
	clrw	d0
    46e8:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    46ea:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    46ee:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    46f2:	d081           	add.l d1,d0

	rts
    46f4:	4e75           	rts

000046f6 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    46f6:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    46f8:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    46fc:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4700:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4706:	6416           	bcc.s 471e <__udivsi3+0x28>
	movel	d0, d2
    4708:	2400           	move.l d0,d2
	clrw	d2
    470a:	4242           	clr.w d2
	swap	d2
    470c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    470e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4710:	3002           	move.w d2,d0
	swap	d0
    4712:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4714:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4718:	84c1           	divu.w d1,d2
	movew	d2, d0
    471a:	3002           	move.w d2,d0
	jra	6f
    471c:	6030           	bra.s 474e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    471e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4720:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4722:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4724:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    472a:	64f4           	bcc.s 4720 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    472c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    472e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4734:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    4736:	c2c0           	mulu.w d0,d1
	swap	d2
    4738:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    473a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    473c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    473e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4740:	660a           	bne.s 474c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4742:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4744:	6506           	bcs.s 474c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    4746:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    474a:	6302           	bls.s 474e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    474c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    474e:	241f           	move.l (sp)+,d2
	rts
    4750:	4e75           	rts

00004752 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    4752:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4754:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    4756:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    475a:	6a04           	bpl.s 4760 <__divsi3+0xe>
	negl	d1
    475c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    475e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4760:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4764:	6a04           	bpl.s 476a <__divsi3+0x18>
	negl	d0
    4766:	4480           	neg.l d0
	negb	d2
    4768:	4402           	neg.b d2

2:	movel	d1, sp@-
    476a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    476c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    476e:	6186           	bsr.s 46f6 <__udivsi3>
	addql	IMM (8), sp
    4770:	508f           	addq.l #8,sp

	tstb	d2
    4772:	4a02           	tst.b d2
	jpl	3f
    4774:	6a02           	bpl.s 4778 <__divsi3+0x26>
	negl	d0
    4776:	4480           	neg.l d0

3:	movel	sp@+, d2
    4778:	241f           	move.l (sp)+,d2
	rts
    477a:	4e75           	rts

0000477c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    477c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4780:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4784:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4786:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    4788:	61c8           	bsr.s 4752 <__divsi3>
	addql	IMM (8), sp
    478a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    478c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4790:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4792:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4794:	6100 ff3e      	bsr.w 46d4 <__mulsi3>
	addql	IMM (8), sp
    4798:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    479a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    479e:	9280           	sub.l d0,d1
	movel	d1, d0
    47a0:	2001           	move.l d1,d0
	rts
    47a2:	4e75           	rts

000047a4 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    47a4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    47a8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    47ac:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    47ae:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    47b0:	6100 ff44      	bsr.w 46f6 <__udivsi3>
	addql	IMM (8), sp
    47b4:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    47b6:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    47ba:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    47bc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    47be:	6100 ff14      	bsr.w 46d4 <__mulsi3>
	addql	IMM (8), sp
    47c2:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    47c4:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    47c8:	9280           	sub.l d0,d1
	movel	d1, d0
    47ca:	2001           	move.l d1,d0
	rts
    47cc:	4e75           	rts

000047ce <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    47ce:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    47d0:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    47d4:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    47d8:	2c5f           	movea.l (sp)+,a6
    rts
    47da:	4e75           	rts

000047dc <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    47dc:	16c0           	move.b d0,(a3)+
	rts
    47de:	4e75           	rts

000047e0 <saveregs>:
	...

0000481c <font2distance>:
    481c:	0505           	btst d2,d5
    481e:	0505           	btst d2,d5
    4820:	0505           	btst d2,d5
    4822:	0505           	btst d2,d5
    4824:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    4826:	0505           	btst d2,d5
    4828:	0505           	btst d2,d5
    482a:	0005 0505      	ori.b #5,d5
    482e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4830:	0505           	btst d2,d5
    4832:	0505           	btst d2,d5
    4834:	0505           	btst d2,d5
    4836:	0505           	btst d2,d5
    4838:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    483a:	0505           	btst d2,d5
    483c:	0505           	btst d2,d5
    483e:	0505           	btst d2,d5
    4840:	0505           	btst d2,d5
    4842:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4844:	0500           	btst d2,d0
    4846:	0505           	btst d2,d5
    4848:	0505           	btst d2,d5
    484a:	0505           	btst d2,d5
    484c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    484e:	0505           	btst d2,d5
    4850:	0505           	btst d2,d5
    4852:	0505           	btst d2,d5
    4854:	0505           	btst d2,d5
    4856:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    4858:	0505           	btst d2,d5
    485a:	0505           	btst d2,d5
    485c:	0503           	btst d2,d3
    485e:	0505           	btst d2,d5
    4860:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    4862:	0505           	btst d2,d5
    4864:	0500           	btst d2,d0
    4866:	0505           	btst d2,d5
    4868:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    486c:	0505           	btst d2,d5
    486e:	0503           	btst d2,d3
    4870:	0205 0507      	andi.b #7,d5
    4874:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    4876:	0505           	btst d2,d5
    4878:	0505           	btst d2,d5
    487a:	0505           	btst d2,d5
    487c:	0505           	btst d2,d5
    487e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4880:	0505           	btst d2,d5
    4882:	0505           	btst d2,d5
    4884:	0505           	btst d2,d5
    4886:	0505           	btst d2,d5
    4888:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    488a:	0505           	btst d2,d5
    488c:	0505           	btst d2,d5
    488e:	0505           	btst d2,d5
    4890:	0505           	btst d2,d5
    4892:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4894:	0505           	btst d2,d5
    4896:	0505           	btst d2,d5
    4898:	0505           	btst d2,d5
    489a:	0505           	btst d2,d5
    489c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    489e:	0505           	btst d2,d5
    48a0:	0505           	btst d2,d5
    48a2:	0505           	btst d2,d5
    48a4:	0505           	btst d2,d5
    48a6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48a8:	0505           	btst d2,d5
    48aa:	0505           	btst d2,d5
    48ac:	0505           	btst d2,d5
    48ae:	0505           	btst d2,d5
    48b0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48b2:	0505           	btst d2,d5
    48b4:	0505           	btst d2,d5
    48b6:	0505           	btst d2,d5
    48b8:	0505           	btst d2,d5
    48ba:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48bc:	0505           	btst d2,d5
    48be:	0505           	btst d2,d5
    48c0:	0505           	btst d2,d5
    48c2:	0505           	btst d2,d5
    48c4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48c6:	0505           	btst d2,d5
    48c8:	0505           	btst d2,d5
    48ca:	0505           	btst d2,d5
    48cc:	0505           	btst d2,d5
    48ce:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48d0:	0505           	btst d2,d5
    48d2:	0505           	btst d2,d5
    48d4:	0505           	btst d2,d5
    48d6:	0505           	btst d2,d5
    48d8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48da:	0505           	btst d2,d5
    48dc:	0505           	btst d2,d5
    48de:	0505           	btst d2,d5
    48e0:	0505           	btst d2,d5
    48e2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48e4:	0505           	btst d2,d5
    48e6:	0505           	btst d2,d5
    48e8:	0505           	btst d2,d5
    48ea:	0505           	btst d2,d5
    48ec:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48ee:	0505           	btst d2,d5
    48f0:	0505           	btst d2,d5
    48f2:	0505           	btst d2,d5
    48f4:	0505           	btst d2,d5
    48f6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    48f8:	0505           	btst d2,d5
    48fa:	0505           	btst d2,d5
    48fc:	0505           	btst d2,d5
    48fe:	0505           	btst d2,d5
    4900:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4902:	0505           	btst d2,d5
    4904:	0505           	btst d2,d5
    4906:	0505           	btst d2,d5
    4908:	0505           	btst d2,d5
    490a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    490c:	0505           	btst d2,d5
    490e:	0505           	btst d2,d5
    4910:	0505           	btst d2,d5
    4912:	0505           	btst d2,d5
    4914:	0505           	btst d2,d5

00004916 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    4916:	16c0           	move.b d0,(a3)+
  RTS
    4918:	4e75           	rts

0000491a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    491a:	48f9 7fff 0000 	movem.l d0-a6,47e0 <saveregs>
    4920:	47e0 
  lea 0xdff000,a5
    4922:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd7171>,a5
  move.l sp@(4),a0  //Fontlocation
    4928:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    492c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4930:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4934:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    4936:	082d 0006 0002 	btst #6,2(a5)

0000493c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    493c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    4942:	66f8           	bne.s 493c <st2wblit>

00004944 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4944:	7019           	moveq #25,d0
	sub.l d5,d5      
    4946:	9a85           	sub.l d5,d5

00004948 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    4948:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    494a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    494c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4950:	9dce           	suba.l a6,a6
	move.l d2, a6
    4952:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4954:	ddfc 0000 481c 	adda.l #18460,a6

	LSL  	#4,d2 	    //Fetch next char
    495a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    495c:	2842           	movea.l d2,a4


	move.l  #0,d4
    495e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    4960:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    4962:	3814           	move.w (a4),d4
	swap	d4
    4964:	4844           	swap d4
	lsr.l	d5, d4
    4966:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    4968:	8993           	or.l d4,(a3)
	clr.l	d4
    496a:	4284           	clr.l d4
	move.w  2(a4), d4
    496c:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4970:	4844           	swap d4
	lsr.l	d5, d4
    4972:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4974:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    4978:	4284           	clr.l d4
	move.w  4(a4), d4
    497a:	382c 0004      	move.w 4(a4),d4
	swap	d4
    497e:	4844           	swap d4
	lsr.l	d5, d4
    4980:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4982:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    4986:	4284           	clr.l d4
	move.w  6(a4), d4
    4988:	382c 0006      	move.w 6(a4),d4
	swap	d4
    498c:	4844           	swap d4
	lsr.l	d5, d4
    498e:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4990:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4994:	4284           	clr.l d4
	move.w  8(a4), d4
    4996:	382c 0008      	move.w 8(a4),d4
	swap	d4
    499a:	4844           	swap d4
	lsr.l	d5, d4
    499c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    499e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    49a2:	4284           	clr.l d4
	move.w  10(a4), d4
    49a4:	382c 000a      	move.w 10(a4),d4
	swap	d4
    49a8:	4844           	swap d4
	lsr.l	d5, d4
    49aa:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    49ac:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    49b0:	4284           	clr.l d4
	move.w  12(a4), d4
    49b2:	382c 000c      	move.w 12(a4),d4
	swap	d4
    49b6:	4844           	swap d4
	lsr.l	d5, d4
    49b8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    49ba:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    49be:	4284           	clr.l d4
	move.w  14(a4), d4
    49c0:	382c 000e      	move.w 14(a4),d4
	swap	d4
    49c4:	4844           	swap d4
	lsr.l	d5, d4
    49c6:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    49c8:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    49cc:	4284           	clr.l d4

	add.b   (a6), d5
    49ce:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    49d0:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    49d4:	6500 0006      	bcs.w 49dc <noadditionalchar>
	addq.w  #1, a3
    49d8:	524b           	addq.w #1,a3
	sub.w   #8,d5
    49da:	5145           	subq.w #8,d5

000049dc <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    49dc:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    49de:	51c8 ff68      	dbf d0,4948 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    49e2:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    49e6:	51cb ff5c      	dbf d3,4944 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    49ea:	4cfa 7fff fdf2 	movem.l 47e0 <saveregs>(pc),d0-a6

	RTS
    49f0:	4e75           	rts
