
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
      10:	23ce 0001 779e 	move.l a6,1779e <SysBase>
	hw = (struct Custom*)0xdff000;
      16:	23fc 00df f000 	move.l #14675968,1778e <hw>
      1c:	0001 778e 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      20:	43f9 0001 4fb8 	lea 14fb8 <incbin_startimage_end+0x530>,a1
      26:	7000           	moveq #0,d0
      28:	4eae fdd8      	jsr -552(a6)
      2c:	23c0 0001 7792 	move.l d0,17792 <GfxBase>
	if (!GfxBase)
      32:	6700 0730      	beq.w 764 <main+0x75e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      36:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
      3c:	43f9 0001 4fc9 	lea 14fc9 <incbin_startimage_end+0x541>,a1
      42:	7000           	moveq #0,d0
      44:	4eae fdd8      	jsr -552(a6)
      48:	23c0 0001 779a 	move.l d0,1779a <DOSBase>
	if (!DOSBase)
      4e:	6700 0708      	beq.w 758 <main+0x752>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      52:	4879 0001 4fd5 	pea 14fd5 <incbin_startimage_end+0x54d>
      58:	4eb9 0000 0946 	jsr 946 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      5e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
      64:	4eae ffc4      	jsr -60(a6)
      68:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
      6e:	2200           	move.l d0,d1
      70:	243c 0001 4ff1 	move.l #86001,d2
      76:	760f           	moveq #15,d3
      78:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
      82:	7232           	moveq #50,d1
      84:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      88:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
      8e:	4eae ffc4      	jsr -60(a6)
      92:	2079 0001 778e 	movea.l 1778e <hw>,a0
      98:	2628 0080      	move.l 128(a0),d3
      9c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
      a2:	2200           	move.l d0,d1
      a4:	243c 0001 5001 	move.l #86017,d2
      aa:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      ae:	49f9 0000 0b14 	lea b14 <ClBuild>,a4
      b4:	4e94           	jsr (a4)
      b6:	2440           	movea.l d0,a2
      b8:	23c0 0001 7780 	move.l d0,17780 <Copperlist1>
  DrawCopper = Copperlist1;
      be:	23c0 0001 7778 	move.l d0,17778 <DrawCopper>
  Copperlist2 = ClBuild();
      c4:	4e94           	jsr (a4)
      c6:	23c0 0001 7772 	move.l d0,17772 <Copperlist2>
  ViewCopper = Copperlist2;
      cc:	23c0 0001 7766 	move.l d0,17766 <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d2:	588f           	addq.l #4,sp
      d4:	2012           	move.l (a2),d0
      d6:	b0b9 0001 73d8 	cmp.l 173d8 <ClsSprites>,d0
      dc:	6600 060c      	bne.w 6ea <main+0x6e4>
      e0:	202a 0004      	move.l 4(a2),d0
      e4:	b0b9 0001 73dc 	cmp.l 173dc <ClsSprites+0x4>,d0
      ea:	6600 05fe      	bne.w 6ea <main+0x6e4>
      ee:	202a 0008      	move.l 8(a2),d0
      f2:	b0b9 0001 73e0 	cmp.l 173e0 <ClsSprites+0x8>,d0
      f8:	6600 05f0      	bne.w 6ea <main+0x6e4>
      fc:	202a 000c      	move.l 12(a2),d0
     100:	b0b9 0001 73e4 	cmp.l 173e4 <ClsSprites+0xc>,d0
     106:	6600 05e2      	bne.w 6ea <main+0x6e4>
     10a:	202a 0010      	move.l 16(a2),d0
     10e:	b0b9 0001 73e8 	cmp.l 173e8 <ClsSprites+0x10>,d0
     114:	6600 05d4      	bne.w 6ea <main+0x6e4>
     118:	202a 0014      	move.l 20(a2),d0
     11c:	b0b9 0001 73ec 	cmp.l 173ec <ClsSprites+0x14>,d0
     122:	6600 05c6      	bne.w 6ea <main+0x6e4>
     126:	202a 0018      	move.l 24(a2),d0
     12a:	b0b9 0001 73f0 	cmp.l 173f0 <ClsSprites+0x18>,d0
     130:	6600 05b8      	bne.w 6ea <main+0x6e4>
     134:	202a 001c      	move.l 28(a2),d0
     138:	b0b9 0001 73f4 	cmp.l 173f4 <ClsSprites+0x1c>,d0
     13e:	6600 05aa      	bne.w 6ea <main+0x6e4>
     142:	202a 0020      	move.l 32(a2),d0
     146:	b0b9 0001 73f8 	cmp.l 173f8 <ClsSprites+0x20>,d0
     14c:	6600 059c      	bne.w 6ea <main+0x6e4>
     150:	202a 0024      	move.l 36(a2),d0
     154:	b0b9 0001 73fc 	cmp.l 173fc <ClsSprites+0x24>,d0
     15a:	6600 058e      	bne.w 6ea <main+0x6e4>
     15e:	202a 0028      	move.l 40(a2),d0
     162:	b0b9 0001 7400 	cmp.l 17400 <ClsSprites+0x28>,d0
     168:	6600 0580      	bne.w 6ea <main+0x6e4>
     16c:	202a 002c      	move.l 44(a2),d0
     170:	b0b9 0001 7404 	cmp.l 17404 <ClsSprites+0x2c>,d0
     176:	6600 0572      	bne.w 6ea <main+0x6e4>
     17a:	202a 0030      	move.l 48(a2),d0
     17e:	b0b9 0001 7408 	cmp.l 17408 <ClsSprites+0x30>,d0
     184:	6600 0564      	bne.w 6ea <main+0x6e4>
     188:	202a 0034      	move.l 52(a2),d0
     18c:	b0b9 0001 740c 	cmp.l 1740c <ClsSprites+0x34>,d0
     192:	6600 0556      	bne.w 6ea <main+0x6e4>
     196:	202a 0038      	move.l 56(a2),d0
     19a:	b0b9 0001 7410 	cmp.l 17410 <ClsSprites+0x38>,d0
     1a0:	6600 0548      	bne.w 6ea <main+0x6e4>
     1a4:	246a 003c      	movea.l 60(a2),a2
     1a8:	b5f9 0001 7414 	cmpa.l 17414 <ClsSprites+0x3c>,a2
     1ae:	6600 053a      	bne.w 6ea <main+0x6e4>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b2:	2079 0001 7780 	movea.l 17780 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1b8:	2039 0001 73a8 	move.l 173a8 <ClScreen>,d0
     1be:	b0a8 0040      	cmp.l 64(a0),d0
     1c2:	6600 0548      	bne.w 70c <main+0x706>
     1c6:	2039 0001 73ac 	move.l 173ac <ClScreen+0x4>,d0
     1cc:	b0a8 0044      	cmp.l 68(a0),d0
     1d0:	6600 053a      	bne.w 70c <main+0x706>
     1d4:	2039 0001 73b0 	move.l 173b0 <ClScreen+0x8>,d0
     1da:	b0a8 0048      	cmp.l 72(a0),d0
     1de:	6600 052c      	bne.w 70c <main+0x706>
     1e2:	2028 004c      	move.l 76(a0),d0
     1e6:	b0b9 0001 73b4 	cmp.l 173b4 <ClScreen+0xc>,d0
     1ec:	6600 051e      	bne.w 70c <main+0x706>
     1f0:	2028 0050      	move.l 80(a0),d0
     1f4:	b0b9 0001 73b8 	cmp.l 173b8 <ClScreen+0x10>,d0
     1fa:	6600 0510      	bne.w 70c <main+0x706>
     1fe:	2028 0054      	move.l 84(a0),d0
     202:	b0b9 0001 73bc 	cmp.l 173bc <ClScreen+0x14>,d0
     208:	6600 0502      	bne.w 70c <main+0x706>
     20c:	2028 0058      	move.l 88(a0),d0
     210:	b0b9 0001 73c0 	cmp.l 173c0 <ClScreen+0x18>,d0
     216:	6600 04f4      	bne.w 70c <main+0x706>
     21a:	2028 005c      	move.l 92(a0),d0
     21e:	b0b9 0001 73c4 	cmp.l 173c4 <ClScreen+0x1c>,d0
     224:	6600 04e6      	bne.w 70c <main+0x706>
     228:	2028 0060      	move.l 96(a0),d0
     22c:	b0b9 0001 73c8 	cmp.l 173c8 <ClScreen+0x20>,d0
     232:	6600 04d8      	bne.w 70c <main+0x706>
     236:	2028 0064      	move.l 100(a0),d0
     23a:	b0b9 0001 73cc 	cmp.l 173cc <ClScreen+0x24>,d0
     240:	6600 04ca      	bne.w 70c <main+0x706>
     244:	2028 0068      	move.l 104(a0),d0
     248:	b0b9 0001 73d0 	cmp.l 173d0 <ClScreen+0x28>,d0
     24e:	6600 04bc      	bne.w 70c <main+0x706>
     252:	2068 006c      	movea.l 108(a0),a0
     256:	b1f9 0001 73d4 	cmpa.l 173d4 <ClScreen+0x2c>,a0
     25c:	6600 04ae      	bne.w 70c <main+0x706>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     260:	23fc 0004 0000 	move.l #262144,17786 <DrawBuffer>
     266:	0001 7786 
  ViewBuffer = (ULONG *)0x50000;
     26a:	23fc 0005 0000 	move.l #327680,1777c <ViewBuffer>
     270:	0001 777c 
  
  SetBplPointers();
     274:	45f9 0000 163c 	lea 163c <SetBplPointers>,a2
     27a:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27c:	0cb9 0005 0000 	cmpi.l #327680,17786 <DrawBuffer>
     282:	0001 7786 
     286:	6700 059a      	beq.w 822 <main+0x81c>
    Write( Output(), 
     28a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     290:	4eae ffc4      	jsr -60(a6)
     294:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     29a:	2200           	move.l d0,d1
     29c:	243c 0001 5004 	move.l #86020,d2
     2a2:	763b           	moveq #59,d3
     2a4:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2a8:	2079 0001 7780 	movea.l 17780 <Copperlist1>,a0
     2ae:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b4:	0070 
     2b6:	6724           	beq.s 2dc <main+0x2d6>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2b8:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     2be:	4eae ffc4      	jsr -60(a6)
     2c2:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     2c8:	2200           	move.l d0,d1
     2ca:	243c 0001 5040 	move.l #86080,d2
     2d0:	763c           	moveq #60,d3
     2d2:	4eae ffd0      	jsr -48(a6)
     2d6:	2079 0001 7780 	movea.l 17780 <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2dc:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e2:	0074 
     2e4:	6724           	beq.s 30a <main+0x304>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e6:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     2ec:	4eae ffc4      	jsr -60(a6)
     2f0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     2f6:	2200           	move.l d0,d1
     2f8:	243c 0001 507d 	move.l #86141,d2
     2fe:	763c           	moveq #60,d3
     300:	4eae ffd0      	jsr -48(a6)
     304:	2079 0001 7780 	movea.l 17780 <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30a:	2028 0078      	move.l 120(a0),d0
     30e:	b0b9 0001 7328 	cmp.l 17328 <ClColor>,d0
     314:	6600 053c      	bne.w 852 <main+0x84c>
     318:	2028 007c      	move.l 124(a0),d0
     31c:	b0b9 0001 732c 	cmp.l 1732c <ClColor+0x4>,d0
     322:	6600 052e      	bne.w 852 <main+0x84c>
  if( instructions[pos] == value ) 
     326:	70fe           	moveq #-2,d0
     328:	b0a8 0080      	cmp.l 128(a0),d0
     32c:	671e           	beq.s 34c <main+0x346>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     32e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     334:	4eae ffc4      	jsr -60(a6)
     338:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     33e:	2200           	move.l d0,d1
     340:	243c 0001 50dc 	move.l #86236,d2
     346:	7622           	moveq #34,d3
     348:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34c:	47f9 0000 1616 	lea 1616 <SwapCl>,a3
     352:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     354:	2039 0001 7778 	move.l 17778 <DrawCopper>,d0
     35a:	b0b9 0001 7772 	cmp.l 17772 <Copperlist2>,d0
     360:	671e           	beq.s 380 <main+0x37a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     362:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     368:	4eae ffc4      	jsr -60(a6)
     36c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     372:	2200           	move.l d0,d1
     374:	243c 0001 50ff 	move.l #86271,d2
     37a:	7615           	moveq #21,d3
     37c:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     380:	4e94           	jsr (a4)
     382:	23c0 0001 7780 	move.l d0,17780 <Copperlist1>
  Copperlist2 = ClBuild( );
     388:	4e94           	jsr (a4)
     38a:	23c0 0001 7772 	move.l d0,17772 <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     390:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     396:	203c 0000 c800 	move.l #51200,d0
     39c:	7202           	moveq #2,d1
     39e:	4eae ff3a      	jsr -198(a6)
     3a2:	23c0 0001 776e 	move.l d0,1776e <Bitplane1>
  if(Bitplane1 == 0) {
     3a8:	6700 0418      	beq.w 7c2 <main+0x7bc>
  ViewBuffer = Bitplane1;
     3ac:	23c0 0001 777c 	move.l d0,1777c <ViewBuffer>
  ViewCopper = Copperlist1;
     3b2:	23f9 0001 7780 	move.l 17780 <Copperlist1>,17766 <ViewCopper>
     3b8:	0001 7766 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     3bc:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     3c2:	203c 0000 c800 	move.l #51200,d0
     3c8:	7202           	moveq #2,d1
     3ca:	4eae ff3a      	jsr -198(a6)
     3ce:	23c0 0001 776a 	move.l d0,1776a <Bitplane2>
  if(Bitplane2 == 0) {
     3d4:	6700 03b8      	beq.w 78e <main+0x788>
  DrawBuffer = Bitplane2;
     3d8:	23c0 0001 7786 	move.l d0,17786 <DrawBuffer>
  DrawCopper = Copperlist2;
     3de:	23f9 0001 7772 	move.l 17772 <Copperlist2>,17778 <DrawCopper>
     3e4:	0001 7778 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3e8:	2039 0001 777c 	move.l 1777c <ViewBuffer>,d0
     3ee:	b0b9 0001 776e 	cmp.l 1776e <Bitplane1>,d0
     3f4:	671e           	beq.s 414 <main+0x40e>
    Write( Output(), 
     3f6:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     3fc:	4eae ffc4      	jsr -60(a6)
     400:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     406:	2200           	move.l d0,d1
     408:	243c 0001 5115 	move.l #86293,d2
     40e:	7638           	moveq #56,d3
     410:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     414:	2039 0001 7766 	move.l 17766 <ViewCopper>,d0
     41a:	b0b9 0001 7780 	cmp.l 17780 <Copperlist1>,d0
     420:	671e           	beq.s 440 <main+0x43a>
    Write( Output(), 
     422:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     428:	4eae ffc4      	jsr -60(a6)
     42c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     432:	2200           	move.l d0,d1
     434:	243c 0001 514e 	move.l #86350,d2
     43a:	763a           	moveq #58,d3
     43c:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     440:	4e92           	jsr (a2)
  SwapCl();
     442:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     444:	2079 0001 7766 	movea.l 17766 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44a:	7000           	moveq #0,d0
     44c:	3028 0072      	move.w 114(a0),d0
     450:	4840           	swap d0
     452:	4240           	clr.w d0
     454:	7200           	moveq #0,d1
     456:	3228 0076      	move.w 118(a0),d1
     45a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     45c:	b0b9 0001 776a 	cmp.l 1776a <Bitplane2>,d0
     462:	671e           	beq.s 482 <main+0x47c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     464:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     46a:	4eae ffc4      	jsr -60(a6)
     46e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     474:	2200           	move.l d0,d1
     476:	243c 0001 5189 	move.l #86409,d2
     47c:	7648           	moveq #72,d3
     47e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     482:	4e92           	jsr (a2)
  SwapCl();
     484:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     486:	2079 0001 7766 	movea.l 17766 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48c:	7000           	moveq #0,d0
     48e:	3028 0072      	move.w 114(a0),d0
     492:	4840           	swap d0
     494:	4240           	clr.w d0
     496:	7200           	moveq #0,d1
     498:	3228 0076      	move.w 118(a0),d1
     49c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49e:	b0b9 0001 776e 	cmp.l 1776e <Bitplane1>,d0
     4a4:	671e           	beq.s 4c4 <main+0x4be>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a6:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     4ac:	4eae ffc4      	jsr -60(a6)
     4b0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     4b6:	2200           	move.l d0,d1
     4b8:	243c 0001 51d2 	move.l #86482,d2
     4be:	7649           	moveq #73,d3
     4c0:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     4c4:	4e92           	jsr (a2)
  SwapCl();
     4c6:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     4c8:	2079 0001 7766 	movea.l 17766 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     4ce:	7000           	moveq #0,d0
     4d0:	3028 0072      	move.w 114(a0),d0
     4d4:	4840           	swap d0
     4d6:	4240           	clr.w d0
     4d8:	7200           	moveq #0,d1
     4da:	3228 0076      	move.w 118(a0),d1
     4de:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4e0:	b0b9 0001 776a 	cmp.l 1776a <Bitplane2>,d0
     4e6:	671e           	beq.s 506 <main+0x500>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e8:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     4ee:	4eae ffc4      	jsr -60(a6)
     4f2:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     4f8:	2200           	move.l d0,d1
     4fa:	243c 0001 521c 	move.l #86556,d2
     500:	7648           	moveq #72,d3
     502:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     506:	2f3c 0000 c800 	move.l #51200,-(sp)
     50c:	4878 0084      	pea 84 <main+0x7e>
     510:	4eb9 0000 1668 	jsr 1668 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     516:	4eb9 0000 1720 	jsr 1720 <ZoomTest>

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
     540:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     546:	23ee 0022 0001 	move.l 34(a6),17754 <ActiView>
     54c:	7754 
	OwnBlitter();
     54e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
     552:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     558:	4eae ff1c      	jsr -228(a6)
	Disable();
     55c:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     562:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
     566:	2679 0001 778e 	movea.l 1778e <hw>,a3
     56c:	302b 0010      	move.w 16(a3),d0
     570:	33c0 0001 7758 	move.w d0,17758 <SystemADKCON>
	SystemInts=hw->intenar;
     576:	302b 001c      	move.w 28(a3),d0
     57a:	33c0 0001 775c 	move.w d0,1775c <SystemInts>
	SystemDMA=hw->dmaconr;
     580:	302b 0002      	move.w 2(a3),d0
     584:	33c0 0001 775a 	move.w d0,1775a <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
     58a:	377c 7fff 009a 	move.w #32767,154(a3)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
     590:	377c 7fff 009c 	move.w #32767,156(a3)
	
	WaitVbl();
     596:	45f9 0000 16da 	lea 16da <WaitVbl>,a2
     59c:	4e92           	jsr (a2)
	WaitVbl();
     59e:	4e92           	jsr (a2)
	hw->dmacon=0x7fff;//Clear all DMA channels
     5a0:	377c 7fff 0096 	move.w #32767,150(a3)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
     5a6:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     5ac:	93c9           	suba.l a1,a1
     5ae:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     5b2:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     5b8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     5bc:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
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
     5dc:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     5e2:	082e 0000 0129 	btst #0,297(a6)
     5e8:	6700 0290      	beq.w 87a <main+0x874>
		vbr = (APTR)Supervisor((void*)getvbr);
     5ec:	7e1e           	moveq #30,d7
     5ee:	de8f           	add.l sp,d7
     5f0:	cf8d           	exg d7,a5
     5f2:	4eae ffe2      	jsr -30(a6)
     5f6:	cf8d           	exg d7,a5

	VBR=GetVBR();
     5f8:	23c0 0001 775e 	move.l d0,1775e <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     5fe:	2079 0001 775e 	movea.l 1775e <VBR.lto_priv.3>,a0
     604:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     608:	23cb 0001 7762 	move.l a3,17762 <SystemIrq>
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
     612:	2079 0001 778e 	movea.l 1778e <hw>,a0
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
     638:	2279 0001 775e 	movea.l 1775e <VBR.lto_priv.3>,a1
     63e:	234b 006c      	move.l a3,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
     642:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     648:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
     64e:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
     654:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
     65a:	3039 0001 775c 	move.w 1775c <SystemInts>,d0
     660:	0040 8000      	ori.w #-32768,d0
     664:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
     668:	3039 0001 775a 	move.w 1775a <SystemDMA>,d0
     66e:	0040 8000      	ori.w #-32768,d0
     672:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
     676:	3039 0001 7758 	move.w 17758 <SystemADKCON>,d0
     67c:	0040 8000      	ori.w #-32768,d0
     680:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
     684:	2279 0001 7754 	movea.l 17754 <ActiView>,a1
     68a:	4eae ff22      	jsr -222(a6)
	WaitTOF();
     68e:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     694:	4eae fef2      	jsr -270(a6)
	WaitTOF();
     698:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     69e:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
     6a2:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     6a8:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
     6ac:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     6b2:	4eae fe32      	jsr -462(a6)
	Enable();
     6b6:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     6bc:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
     6c0:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     6c6:	2279 0001 779a 	movea.l 1779a <DOSBase>,a1
     6cc:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
     6d0:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     6d6:	2279 0001 7792 	movea.l 17792 <GfxBase>,a1
     6dc:	4eae fe62      	jsr -414(a6)
}
     6e0:	7000           	moveq #0,d0
     6e2:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     6e6:	508f           	addq.l #8,sp
     6e8:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     6ea:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     6f0:	4eae ffc4      	jsr -60(a6)
     6f4:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     6fa:	2200           	move.l d0,d1
     6fc:	243c 0001 529c 	move.l #86684,d2
     702:	762c           	moveq #44,d3
     704:	4eae ffd0      	jsr -48(a6)
     708:	6000 faa8      	bra.w 1b2 <main+0x1ac>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     70c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     712:	4eae ffc4      	jsr -60(a6)
     716:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     71c:	2200           	move.l d0,d1
     71e:	243c 0001 5265 	move.l #86629,d2
     724:	7636           	moveq #54,d3
     726:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     72a:	23fc 0004 0000 	move.l #262144,17786 <DrawBuffer>
     730:	0001 7786 
  ViewBuffer = (ULONG *)0x50000;
     734:	23fc 0005 0000 	move.l #327680,1777c <ViewBuffer>
     73a:	0001 777c 
  SetBplPointers();
     73e:	45f9 0000 163c 	lea 163c <SetBplPointers>,a2
     744:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     746:	0cb9 0005 0000 	cmpi.l #327680,17786 <DrawBuffer>
     74c:	0001 7786 
     750:	6600 fb38      	bne.w 28a <main+0x284>
     754:	6000 00cc      	bra.w 822 <main+0x81c>
		Exit(0);
     758:	9dce           	suba.l a6,a6
     75a:	7200           	moveq #0,d1
     75c:	4eae ff70      	jsr -144(a6)
     760:	6000 f8f0      	bra.w 52 <main+0x4c>
		Exit(0);
     764:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     76a:	7200           	moveq #0,d1
     76c:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     770:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     776:	43f9 0001 4fc9 	lea 14fc9 <incbin_startimage_end+0x541>,a1
     77c:	7000           	moveq #0,d0
     77e:	4eae fdd8      	jsr -552(a6)
     782:	23c0 0001 779a 	move.l d0,1779a <DOSBase>
	if (!DOSBase)
     788:	6600 f8c8      	bne.w 52 <main+0x4c>
     78c:	60ca           	bra.s 758 <main+0x752>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     78e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     794:	4eae ffc4      	jsr -60(a6)
     798:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     79e:	2200           	move.l d0,d1
     7a0:	243c 0001 4b74 	move.l #84852,d2
     7a6:	7626           	moveq #38,d3
     7a8:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7ac:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     7b2:	7201           	moveq #1,d1
     7b4:	4eae ff70      	jsr -144(a6)
     7b8:	2039 0001 776a 	move.l 1776a <Bitplane2>,d0
     7be:	6000 fc18      	bra.w 3d8 <main+0x3d2>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     7c2:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     7c8:	4eae ffc4      	jsr -60(a6)
     7cc:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     7d2:	2200           	move.l d0,d1
     7d4:	243c 0001 4b4d 	move.l #84813,d2
     7da:	7626           	moveq #38,d3
     7dc:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     7e0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     7e6:	7201           	moveq #1,d1
     7e8:	4eae ff70      	jsr -144(a6)
     7ec:	2039 0001 776e 	move.l 1776e <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     7f2:	23c0 0001 777c 	move.l d0,1777c <ViewBuffer>
  ViewCopper = Copperlist1;
     7f8:	23f9 0001 7780 	move.l 17780 <Copperlist1>,17766 <ViewCopper>
     7fe:	0001 7766 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     802:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     808:	203c 0000 c800 	move.l #51200,d0
     80e:	7202           	moveq #2,d1
     810:	4eae ff3a      	jsr -198(a6)
     814:	23c0 0001 776a 	move.l d0,1776a <Bitplane2>
  if(Bitplane2 == 0) {
     81a:	6600 fbbc      	bne.w 3d8 <main+0x3d2>
     81e:	6000 ff6e      	bra.w 78e <main+0x788>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     822:	0cb9 0004 0000 	cmpi.l #262144,1777c <ViewBuffer>
     828:	0001 777c 
     82c:	6700 fa7a      	beq.w 2a8 <main+0x2a2>
    Write( Output(), 
     830:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     836:	4eae ffc4      	jsr -60(a6)
     83a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     840:	2200           	move.l d0,d1
     842:	243c 0001 5004 	move.l #86020,d2
     848:	763b           	moveq #59,d3
     84a:	4eae ffd0      	jsr -48(a6)
     84e:	6000 fa58      	bra.w 2a8 <main+0x2a2>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     852:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     858:	4eae ffc4      	jsr -60(a6)
     85c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     862:	2200           	move.l d0,d1
     864:	243c 0001 50ba 	move.l #86202,d2
     86a:	7621           	moveq #33,d3
     86c:	4eae ffd0      	jsr -48(a6)
     870:	2079 0001 7780 	movea.l 17780 <Copperlist1>,a0
     876:	6000 faae      	bra.w 326 <main+0x320>
	APTR vbr = 0;
     87a:	7000           	moveq #0,d0
	VBR=GetVBR();
     87c:	23c0 0001 775e 	move.l d0,1775e <VBR.lto_priv.3>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     882:	2079 0001 775e 	movea.l 1775e <VBR.lto_priv.3>,a0
     888:	2668 006c      	movea.l 108(a0),a3
	SystemIrq=GetInterruptHandler(); //store interrupt register
     88c:	23cb 0001 7762 	move.l a3,17762 <SystemIrq>
	WaitVbl();
     892:	4e92           	jsr (a2)
	WaitVbl();
     894:	4e92           	jsr (a2)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     896:	2079 0001 778e 	movea.l 1778e <hw>,a0
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
     8ba:	4879 0001 4abc 	pea 14abc <incbin_startimage_end+0x34>
     8c0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8465>
     8c4:	4878 0052      	pea 52 <main+0x4c>
     8c8:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee83c6>
     8ce:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     8d2:	203c 0001 4aa2 	move.l #84642,d0
     8d8:	4878 0001      	pea 1 <_start+0x1>
     8dc:	2f02           	move.l d2,-(sp)
     8de:	42a7           	clr.l -(sp)
     8e0:	2f00           	move.l d0,-(sp)
     8e2:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8465>
     8e6:	4878 0052      	pea 52 <main+0x4c>
     8ea:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee83c6>
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
     906:	4879 0001 4ac6 	pea 14ac6 <incbin_startimage_end+0x3e>
     90c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8465>
     910:	4878 0052      	pea 52 <main+0x4c>
     914:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee83c6>
     91a:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     91e:	203c 0001 4a89 	move.l #84617,d0
     924:	4878 0001      	pea 1 <_start+0x1>
     928:	2f02           	move.l d2,-(sp)
     92a:	42a7           	clr.l -(sp)
     92c:	2f00           	move.l d0,-(sp)
     92e:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffd8465>
     932:	4878 0052      	pea 52 <main+0x4c>
     936:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee83c6>
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
     94e:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee83c6>
     954:	6734           	beq.s 98a <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
     956:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     95c:	206f 0090      	movea.l 144(sp),a0
     960:	43ef 0094      	lea 148(sp),a1
     964:	45f9 0000 43c0 	lea 43c0 <PutChar>,a2
     96a:	47ef 000c      	lea 12(sp),a3
     96e:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     972:	2f0b           	move.l a3,-(sp)
     974:	4878 0056      	pea 56 <main+0x50>
     978:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee83c6>
     97e:	508f           	addq.l #8,sp
}
     980:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     984:	4fef 0080      	lea 128(sp),sp
     988:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
     98a:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     990:	206f 0090      	movea.l 144(sp),a0
     994:	43ef 0094      	lea 148(sp),a1
     998:	45f9 0000 43b2 	lea 43b2 <KPutCharX>,a2
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
     9cc:	4eba 3806      	jsr 41d4 <memset>(pc)
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
     9e4:	2e3c 0001 4ad1 	move.l #84689,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
     9ea:	301c           	move.w (a4)+,d0
     9ec:	bd40           	eor.w d6,d0
     9ee:	b05d           	cmp.w (a5)+,d0
     9f0:	6736           	beq.s a28 <TestRow+0x7a>
      data[0] = i;
     9f2:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
     9f6:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     9fc:	2047           	movea.l d7,a0
     9fe:	43ef 0030      	lea 48(sp),a1
     a02:	45f9 0000 43c0 	lea 43c0 <PutChar>,a2
     a08:	2645           	movea.l d5,a3
     a0a:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
     a0e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     a14:	4eae ffc4      	jsr -60(a6)
     a18:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
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
     a5e:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     a64:	41f9 0001 4ad1 	lea 14ad1 <incbin_startimage_end+0x49>,a0
     a6a:	43ef 0030      	lea 48(sp),a1
     a6e:	45f9 0000 43c0 	lea 43c0 <PutChar>,a2
     a74:	47ef 0034      	lea 52(sp),a3
     a78:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
     a7c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     a82:	4eae ffc4      	jsr -60(a6)
     a86:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
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
     aac:	4879 0001 4b01 	pea 14b01 <incbin_startimage_end+0x79>
     ab2:	4eba fe92      	jsr 946 <KPrintF>(pc)
     ab6:	4fef 000c      	lea 12(sp),sp
}
     aba:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     abe:	4fef 006c      	lea 108(sp),sp
     ac2:	4e75           	rts

00000ac4 <Vblankcounter>:
  Counter4Frames++;
     ac4:	52b9 0001 7796 	addq.l #1,17796 <Counter4Frames>
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

00000aea <TestCopperlistBatch>:
  for( int i=0;i<length;i++)
     aea:	226f 0008      	movea.l 8(sp),a1
     aee:	d3c9           	adda.l a1,a1
     af0:	d3c9           	adda.l a1,a1
     af2:	d3ef 0004      	adda.l 4(sp),a1
     af6:	206f 000c      	movea.l 12(sp),a0
     afa:	202f 0010      	move.l 16(sp),d0
     afe:	d080           	add.l d0,d0
     b00:	d080           	add.l d0,d0
     b02:	d088           	add.l a0,d0
    if( instructions[ pos+i] != batch[ i])
     b04:	b388           	cmpm.l (a0)+,(a1)+
     b06:	6608           	bne.s b10 <TestCopperlistBatch+0x26>
  for( int i=0;i<length;i++)
     b08:	b1c0           	cmpa.l d0,a0
     b0a:	66f8           	bne.s b04 <TestCopperlistBatch+0x1a>
  return 1;
     b0c:	7001           	moveq #1,d0
}
     b0e:	4e75           	rts
      return 0;
     b10:	7000           	moveq #0,d0
}
     b12:	4e75           	rts

00000b14 <ClBuild>:
ULONG * ClBuild() {
     b14:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
     b18:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
     b1e:	707b           	moveq #123,d0
     b20:	4600           	not.b d0
     b22:	7202           	moveq #2,d1
     b24:	4eae ff3a      	jsr -198(a6)
     b28:	2440           	movea.l d0,a2
  if( retval == 0) {
     b2a:	4a80           	tst.l d0
     b2c:	6700 010e      	beq.w c3c <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
     b30:	24b9 0001 73d8 	move.l 173d8 <ClsSprites>,(a2)
     b36:	2579 0001 73dc 	move.l 173dc <ClsSprites+0x4>,4(a2)
     b3c:	0004 
     b3e:	2579 0001 73e0 	move.l 173e0 <ClsSprites+0x8>,8(a2)
     b44:	0008 
     b46:	2579 0001 73e4 	move.l 173e4 <ClsSprites+0xc>,12(a2)
     b4c:	000c 
     b4e:	2579 0001 73e8 	move.l 173e8 <ClsSprites+0x10>,16(a2)
     b54:	0010 
     b56:	2579 0001 73ec 	move.l 173ec <ClsSprites+0x14>,20(a2)
     b5c:	0014 
     b5e:	2579 0001 73f0 	move.l 173f0 <ClsSprites+0x18>,24(a2)
     b64:	0018 
     b66:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x1c>,28(a2)
     b6c:	001c 
     b6e:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x20>,32(a2)
     b74:	0020 
     b76:	2579 0001 73fc 	move.l 173fc <ClsSprites+0x24>,36(a2)
     b7c:	0024 
     b7e:	2579 0001 7400 	move.l 17400 <ClsSprites+0x28>,40(a2)
     b84:	0028 
     b86:	2579 0001 7404 	move.l 17404 <ClsSprites+0x2c>,44(a2)
     b8c:	002c 
     b8e:	2579 0001 7408 	move.l 17408 <ClsSprites+0x30>,48(a2)
     b94:	0030 
     b96:	2579 0001 740c 	move.l 1740c <ClsSprites+0x34>,52(a2)
     b9c:	0034 
     b9e:	2579 0001 7410 	move.l 17410 <ClsSprites+0x38>,56(a2)
     ba4:	0038 
     ba6:	2579 0001 7414 	move.l 17414 <ClsSprites+0x3c>,60(a2)
     bac:	003c 
    *cl++ = *clpartinstruction++;
     bae:	2579 0001 73a8 	move.l 173a8 <ClScreen>,64(a2)
     bb4:	0040 
     bb6:	2579 0001 73ac 	move.l 173ac <ClScreen+0x4>,68(a2)
     bbc:	0044 
     bbe:	2579 0001 73b0 	move.l 173b0 <ClScreen+0x8>,72(a2)
     bc4:	0048 
     bc6:	2579 0001 73b4 	move.l 173b4 <ClScreen+0xc>,76(a2)
     bcc:	004c 
     bce:	2579 0001 73b8 	move.l 173b8 <ClScreen+0x10>,80(a2)
     bd4:	0050 
     bd6:	2579 0001 73bc 	move.l 173bc <ClScreen+0x14>,84(a2)
     bdc:	0054 
     bde:	2579 0001 73c0 	move.l 173c0 <ClScreen+0x18>,88(a2)
     be4:	0058 
     be6:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x1c>,92(a2)
     bec:	005c 
     bee:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x20>,96(a2)
     bf4:	0060 
     bf6:	2579 0001 73cc 	move.l 173cc <ClScreen+0x24>,100(a2)
     bfc:	0064 
     bfe:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x28>,104(a2)
     c04:	0068 
     c06:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x2c>,108(a2)
     c0c:	006c 
  *cl++ = 0x00e00000;
     c0e:	257c 00e0 0000 	move.l #14680064,112(a2)
     c14:	0070 
  *cl++ = 0x00e20000;
     c16:	257c 00e2 0000 	move.l #14811136,116(a2)
     c1c:	0074 
    *cl++ = *clpartinstruction++;
     c1e:	2579 0001 7328 	move.l 17328 <ClColor>,120(a2)
     c24:	0078 
     c26:	2579 0001 732c 	move.l 1732c <ClColor+0x4>,124(a2)
     c2c:	007c 
  *cl = 0xfffffffe;
     c2e:	70fe           	moveq #-2,d0
     c30:	2540 0080      	move.l d0,128(a2)
}
     c34:	200a           	move.l a2,d0
     c36:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     c3a:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     c3c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     c42:	4eae ffc4      	jsr -60(a6)
     c46:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     c4c:	2200           	move.l d0,d1
     c4e:	243c 0001 4b27 	move.l #84775,d2
     c54:	7628           	moveq #40,d3
     c56:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     c5a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
     c60:	7201           	moveq #1,d1
     c62:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     c66:	24b9 0001 73d8 	move.l 173d8 <ClsSprites>,(a2)
     c6c:	2579 0001 73dc 	move.l 173dc <ClsSprites+0x4>,4(a2)
     c72:	0004 
     c74:	2579 0001 73e0 	move.l 173e0 <ClsSprites+0x8>,8(a2)
     c7a:	0008 
     c7c:	2579 0001 73e4 	move.l 173e4 <ClsSprites+0xc>,12(a2)
     c82:	000c 
     c84:	2579 0001 73e8 	move.l 173e8 <ClsSprites+0x10>,16(a2)
     c8a:	0010 
     c8c:	2579 0001 73ec 	move.l 173ec <ClsSprites+0x14>,20(a2)
     c92:	0014 
     c94:	2579 0001 73f0 	move.l 173f0 <ClsSprites+0x18>,24(a2)
     c9a:	0018 
     c9c:	2579 0001 73f4 	move.l 173f4 <ClsSprites+0x1c>,28(a2)
     ca2:	001c 
     ca4:	2579 0001 73f8 	move.l 173f8 <ClsSprites+0x20>,32(a2)
     caa:	0020 
     cac:	2579 0001 73fc 	move.l 173fc <ClsSprites+0x24>,36(a2)
     cb2:	0024 
     cb4:	2579 0001 7400 	move.l 17400 <ClsSprites+0x28>,40(a2)
     cba:	0028 
     cbc:	2579 0001 7404 	move.l 17404 <ClsSprites+0x2c>,44(a2)
     cc2:	002c 
     cc4:	2579 0001 7408 	move.l 17408 <ClsSprites+0x30>,48(a2)
     cca:	0030 
     ccc:	2579 0001 740c 	move.l 1740c <ClsSprites+0x34>,52(a2)
     cd2:	0034 
     cd4:	2579 0001 7410 	move.l 17410 <ClsSprites+0x38>,56(a2)
     cda:	0038 
     cdc:	2579 0001 7414 	move.l 17414 <ClsSprites+0x3c>,60(a2)
     ce2:	003c 
    *cl++ = *clpartinstruction++;
     ce4:	2579 0001 73a8 	move.l 173a8 <ClScreen>,64(a2)
     cea:	0040 
     cec:	2579 0001 73ac 	move.l 173ac <ClScreen+0x4>,68(a2)
     cf2:	0044 
     cf4:	2579 0001 73b0 	move.l 173b0 <ClScreen+0x8>,72(a2)
     cfa:	0048 
     cfc:	2579 0001 73b4 	move.l 173b4 <ClScreen+0xc>,76(a2)
     d02:	004c 
     d04:	2579 0001 73b8 	move.l 173b8 <ClScreen+0x10>,80(a2)
     d0a:	0050 
     d0c:	2579 0001 73bc 	move.l 173bc <ClScreen+0x14>,84(a2)
     d12:	0054 
     d14:	2579 0001 73c0 	move.l 173c0 <ClScreen+0x18>,88(a2)
     d1a:	0058 
     d1c:	2579 0001 73c4 	move.l 173c4 <ClScreen+0x1c>,92(a2)
     d22:	005c 
     d24:	2579 0001 73c8 	move.l 173c8 <ClScreen+0x20>,96(a2)
     d2a:	0060 
     d2c:	2579 0001 73cc 	move.l 173cc <ClScreen+0x24>,100(a2)
     d32:	0064 
     d34:	2579 0001 73d0 	move.l 173d0 <ClScreen+0x28>,104(a2)
     d3a:	0068 
     d3c:	2579 0001 73d4 	move.l 173d4 <ClScreen+0x2c>,108(a2)
     d42:	006c 
  *cl++ = 0x00e00000;
     d44:	257c 00e0 0000 	move.l #14680064,112(a2)
     d4a:	0070 
  *cl++ = 0x00e20000;
     d4c:	257c 00e2 0000 	move.l #14811136,116(a2)
     d52:	0074 
    *cl++ = *clpartinstruction++;
     d54:	2579 0001 7328 	move.l 17328 <ClColor>,120(a2)
     d5a:	0078 
     d5c:	2579 0001 732c 	move.l 1732c <ClColor+0x4>,124(a2)
     d62:	007c 
  *cl = 0xfffffffe;
     d64:	70fe           	moveq #-2,d0
     d66:	2540 0080      	move.l d0,128(a2)
}
     d6a:	200a           	move.l a2,d0
     d6c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     d70:	4e75           	rts

00000d72 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     d72:	2079 0001 778e 	movea.l 1778e <hw>,a0
     d78:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     d7c:	3028 0002      	move.w 2(a0),d0
     d80:	0800 000e      	btst #14,d0
     d84:	66f6           	bne.s d7c <WaitBlt+0xa>
}
     d86:	4e75           	rts

00000d88 <Zoom_ZoomIntoPicture>:
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
     d88:	4fef ffe0      	lea -32(sp),sp
     d8c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
     d90:	282f 0058      	move.l 88(sp),d4
     d94:	262f 005c      	move.l 92(sp),d3
     d98:	3404           	move.w d4,d2
  WaitBlit();
     d9a:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     da0:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     da4:	2079 0001 778e 	movea.l 1778e <hw>,a0
     daa:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     db0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     db6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     dbc:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     dc2:	317c 002c 0066 	move.w #44,102(a0)
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
     dc8:	3044           	movea.w d4,a0
     dca:	d0c4           	adda.w d4,a0
     dcc:	3208           	move.w a0,d1
     dce:	d248           	add.w a0,d1
     dd0:	d244           	add.w d4,d1
     dd2:	3001           	move.w d1,d0
     dd4:	d041           	add.w d1,d0
     dd6:	0640 014c      	addi.w #332,d0
     dda:	3f40 0040      	move.w d0,64(sp)
  WORD shiftright = 9;
     dde:	3f7c 0009 0032 	move.w #9,50(sp)
  while( nextzoom > 22 * 16) {
     de4:	0c40 0160      	cmpi.w #352,d0
     de8:	631a           	bls.s e04 <Zoom_ZoomIntoPicture+0x7c>
  WORD shiftright = 9;
     dea:	327c 0009      	movea.w #9,a1
    nextzoom -= (19 + zoomnr);
     dee:	0640 ffed      	addi.w #-19,d0
     df2:	9042           	sub.w d2,d0
    shiftright--;
     df4:	5349           	subq.w #1,a1
  while( nextzoom > 22 * 16) {
     df6:	0c40 0160      	cmpi.w #352,d0
     dfa:	62f2           	bhi.s dee <Zoom_ZoomIntoPicture+0x66>
     dfc:	3f49 0032      	move.w a1,50(sp)
     e00:	3f40 0040      	move.w d0,64(sp)
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
     e04:	7012           	moveq #18,d0
     e06:	9041           	sub.w d1,d0
     e08:	3f40 0048      	move.w d0,72(sp)
  while( ZoomHorizontalStart < 0) {
     e0c:	6c00 0346      	bge.w 1154 <Zoom_ZoomIntoPicture+0x3cc>
     e10:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
     e12:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
     e14:	0641 0013      	addi.w #19,d1
     e18:	d242           	add.w d2,d1
      shifthoriz--;
     e1a:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
     e1c:	4a41           	tst.w d1
     e1e:	6df4           	blt.s e14 <Zoom_ZoomIntoPicture+0x8c>
     e20:	3f41 0048      	move.w d1,72(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
     e24:	3203           	move.w d3,d1
     e26:	d243           	add.w d3,d1
     e28:	d243           	add.w d3,d1
     e2a:	e749           	lsl.w #3,d1
     e2c:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
     e30:	3e03           	move.w d3,d7
     e32:	ed4f           	lsl.w #6,d7
     e34:	3207           	move.w d7,d1
     e36:	5441           	addq.w #2,d1
     e38:	3f41 0036      	move.w d1,54(sp)
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     e3c:	90c4           	suba.w d4,a0
     e3e:	3a48           	movea.w a0,a5
     e40:	4bed 0012      	lea 18(a5),a5
     e44:	7200           	moveq #0,d1
     e46:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     e4a:	c6c0           	mulu.w d0,d3
     e4c:	2003           	move.l d3,d0
     e4e:	d083           	add.l d3,d0
     e50:	d083           	add.l d3,d0
     e52:	e988           	lsl.l #4,d0
     e54:	206f 0050      	movea.l 80(sp),a0
     e58:	41f0 082c      	lea (44,a0,d0.l),a0
     e5c:	2f48 003c      	move.l a0,60(sp)
     e60:	702c           	moveq #44,d0
     e62:	d0af 0054      	add.l 84(sp),d0
     e66:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
     e6a:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
     e6e:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
     e74:	70ed           	moveq #-19,d0
     e76:	9042           	sub.w d2,d0
     e78:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
     e7c:	2841           	movea.l d1,a4
    ZoomHorizontal = ZoomHorizontalStart;
     e7e:	33ef 0048 0001 	move.w 72(sp),17776 <ZoomHorizontal>
     e84:	7776 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
     e86:	242f 003c      	move.l 60(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     e8a:	262f 0038      	move.l 56(sp),d3
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     e8e:	7c00           	moveq #0,d6
     e90:	3c2f 0046      	move.w 70(sp),d6
     e94:	2a06           	move.l d6,d5
     e96:	da86           	add.l d6,d5
     e98:	3f6f 0032 002c 	move.w 50(sp),44(sp)
     e9e:	382f 0032      	move.w 50(sp),d4
     ea2:	720c           	moveq #12,d1
     ea4:	e36c           	lsl.w d1,d4
     ea6:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
     eac:	7000           	moveq #0,d0
     eae:	302f 0030      	move.w 48(sp),d0
     eb2:	306f 0040      	movea.w 64(sp),a0
     eb6:	b1c0           	cmpa.l d0,a0
     eb8:	6e00 00e8      	bgt.w fa2 <Zoom_ZoomIntoPicture+0x21a>
  WaitBlit();
     ebc:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     ec0:	2079 0001 778e 	movea.l 1778e <hw>,a0
     ec6:	0644 09f0      	addi.w #2544,d4
     eca:	3144 0040      	move.w d4,64(a0)
  hw->bltcon1 = 0;
     ece:	317c 0000 0042 	move.w #0,66(a0)
     ed4:	3239 0001 7776 	move.w 17776 <ZoomHorizontal>,d1
    WORD linesleft = 272;
     eda:	383c 0110      	move.w #272,d4
     ede:	2f46 002c      	move.l d6,44(sp)
     ee2:	2645           	movea.l d5,a3
     ee4:	3c2f 0034      	move.w 52(sp),d6
        if( linesleft >= ZoomHorizontal+1) {
     ee8:	b841           	cmp.w d1,d4
     eea:	6f00 009a      	ble.w f86 <Zoom_ZoomIntoPicture+0x1fe>
          linesleft -= ZoomHorizontal;
     eee:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep; 
     ef0:	3001           	move.w d1,d0
     ef2:	c1c6           	muls.w d6,d0
        if( linesleft>0) {
     ef4:	0280 0000 ffff 	andi.l #65535,d0
     efa:	2440           	movea.l d0,a2
     efc:	d5c0           	adda.l d0,a2
     efe:	4a44           	tst.w d4
     f00:	6f2c           	ble.s f2e <Zoom_ZoomIntoPicture+0x1a6>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
     f02:	226f 002c      	movea.l 44(sp),a1
     f06:	d3c0           	adda.l d0,a1
     f08:	d3c9           	adda.l a1,a1
     f0a:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest +  size4blit;
     f0c:	4df2 3800      	lea (0,a2,d3.l),a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f10:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     f14:	3a28 0002      	move.w 2(a0),d5
     f18:	0805 000e      	btst #14,d5
     f1c:	66f6           	bne.s f14 <Zoom_ZoomIntoPicture+0x18c>
  hw->bltapt = (UWORD *) source;
     f1e:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f22:	214e 0054      	move.l a6,84(a0)
  hw->bltsize = height*64+2;
     f26:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
     f2c:	5344           	subq.w #1,d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     f2e:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f32:	3a28 0002      	move.w 2(a0),d5
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     f36:	3a28 0002      	move.w 2(a0),d5
     f3a:	0805 000e      	btst #14,d5
     f3e:	66f6           	bne.s f36 <Zoom_ZoomIntoPicture+0x1ae>
  hw->bltapt = (UWORD *) source;
     f40:	2149 0050      	move.l a1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     f44:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
     f48:	c3c7           	muls.w d7,d1
     f4a:	5441           	addq.w #2,d1
     f4c:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
     f50:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep; 
     f52:	d08c           	add.l a4,d0
     f54:	d080           	add.l d0,d0
     f56:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     f58:	320d           	move.w a5,d1
      while(linesleft > 0) {
     f5a:	4a44           	tst.w d4
     f5c:	6e8a           	bgt.s ee8 <Zoom_ZoomIntoPicture+0x160>
     f5e:	33cd 0001 7776 	move.w a5,17776 <ZoomHorizontal>
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     f64:	066f fff0 0030 	addi.w #-16,48(sp)
     f6a:	55af 003c      	subq.l #2,60(sp)
     f6e:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
     f72:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
     f78:	6600 ff04      	bne.w e7e <Zoom_ZoomIntoPicture+0xf6>
  }
  //ZoomHorizontal = 10;
}
     f7c:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
     f80:	4fef 0020      	lea 32(sp),sp
     f84:	4e75           	rts
        UWORD size4blit = ZoomHorizontal*onestep; 
     f86:	3006           	move.w d6,d0
     f88:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
     f8a:	0280 0000 ffff 	andi.l #65535,d0
     f90:	2440           	movea.l d0,a2
     f92:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep; 
     f94:	3204           	move.w d4,d1
          linesleft = 0;
     f96:	4244           	clr.w d4
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
     f98:	43f3 2800      	lea (0,a3,d2.l),a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     f9c:	3a28 0002      	move.w 2(a0),d5
     fa0:	6094           	bra.s f36 <Zoom_ZoomIntoPicture+0x1ae>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
     fa2:	366f 0040      	movea.w 64(sp),a3
     fa6:	96ef 0030      	suba.w 48(sp),a3
     faa:	534b           	subq.w #1,a3
  if( shiftright == 0) {
     fac:	302f 002c      	move.w 44(sp),d0
     fb0:	5340           	subq.w #1,d0
     fb2:	3f40 0032      	move.w d0,50(sp)
     fb6:	4a6f 002c      	tst.w 44(sp)
     fba:	6600 013c      	bne.w 10f8 <Zoom_ZoomIntoPicture+0x370>
    ZoomBlit_Increment4SrcA = 1;
     fbe:	33fc 0001 0001 	move.w #1,17784 <ZoomBlit_Increment4SrcA>
     fc4:	7784 
     fc6:	347c fde4      	movea.w #-540,a2
  WaitBlit(); 
     fca:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     fce:	2079 0001 778e 	movea.l 1778e <hw>,a0
     fd4:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
     fd8:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     fdc:	7000           	moveq #0,d0
     fde:	300b           	move.w a3,d0
     fe0:	7210           	moveq #16,d1
     fe2:	9280           	sub.l d0,d1
     fe4:	2001           	move.l d1,d0
     fe6:	7200           	moveq #0,d1
     fe8:	4641           	not.w d1
     fea:	e1a9           	lsl.l d0,d1
     fec:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
     ff0:	302f 004a      	move.w 74(sp),d0
     ff4:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     ff8:	7000           	moveq #0,d0
     ffa:	3039 0001 7784 	move.w 17784 <ZoomBlit_Increment4SrcA>,d0
    1000:	2c40           	movea.l d0,a6
    1002:	ddc0           	adda.l d0,a6
    1004:	3239 0001 7776 	move.w 17776 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    100a:	383c 0110      	move.w #272,d4
    100e:	2f46 0042      	move.l d6,66(sp)
        if( linesleft >= ZoomHorizontal+1) {
    1012:	b841           	cmp.w d1,d4
    1014:	6f00 00c2      	ble.w 10d8 <Zoom_ZoomIntoPicture+0x350>
          linesleft -= ZoomHorizontal;
    1018:	9841           	sub.w d1,d4
        UWORD size4blit = ZoomHorizontal*onestep;
    101a:	302f 0034      	move.w 52(sp),d0
    101e:	c1c1           	muls.w d1,d0
        if( linesleft>0) {
    1020:	0280 0000 ffff 	andi.l #65535,d0
    1026:	2440           	movea.l d0,a2
    1028:	d5c0           	adda.l d0,a2
    102a:	4a44           	tst.w d4
    102c:	6f34           	ble.s 1062 <Zoom_ZoomIntoPicture+0x2da>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    102e:	226f 0042      	movea.l 66(sp),a1
    1032:	d3c0           	adda.l d0,a1
    1034:	d3c9           	adda.l a1,a1
    1036:	d3c2           	adda.l d2,a1
          UWORD *tmpdest = pos4dest + size4blit;
    1038:	47f2 3800      	lea (0,a2,d3.l),a3
    103c:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    1040:	3c28 0002      	move.w 2(a0),d6
    1044:	0806 000e      	btst #14,d6
    1048:	66f6           	bne.s 1040 <Zoom_ZoomIntoPicture+0x2b8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    104a:	2c09           	move.l a1,d6
    104c:	dc8e           	add.l a6,d6
    104e:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    1052:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1056:	214b 0054      	move.l a3,84(a0)
  hw->bltsize = height*64+2;
    105a:	316f 0036 0058 	move.w 54(sp),88(a0)
          linesleft--;
    1060:	5344           	subq.w #1,d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1062:	2242           	movea.l d2,a1
    1064:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    1066:	3c28 0002      	move.w 2(a0),d6
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    106a:	3c28 0002      	move.w 2(a0),d6
    106e:	0806 000e      	btst #14,d6
    1072:	66f6           	bne.s 106a <Zoom_ZoomIntoPicture+0x2e2>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1074:	2c09           	move.l a1,d6
    1076:	dc8e           	add.l a6,d6
    1078:	2146 0050      	move.l d6,80(a0)
  hw->bltbpt = source;
    107c:	2149 004c      	move.l a1,76(a0)
  hw->bltdpt = destination;
    1080:	2143 0054      	move.l d3,84(a0)
  hw->bltsize = height*64+2;
    1084:	c3c7           	muls.w d7,d1
    1086:	5441           	addq.w #2,d1
    1088:	3141 0058      	move.w d1,88(a0)
        pos4source += size4blit;
    108c:	d48a           	add.l a2,d2
        pos4dest += size4blit + onestep;   
    108e:	d08c           	add.l a4,d0
    1090:	d080           	add.l d0,d0
    1092:	d680           	add.l d0,d3
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1094:	320d           	move.w a5,d1
      while( linesleft > 0) {
    1096:	4a44           	tst.w d4
    1098:	6e00 ff78      	bgt.w 1012 <Zoom_ZoomIntoPicture+0x28a>
    109c:	33cd 0001 7776 	move.w a5,17776 <ZoomHorizontal>
      if(shiftright < 0) {
    10a2:	4a6f 0032      	tst.w 50(sp)
    10a6:	6c00 febc      	bge.w f64 <Zoom_ZoomIntoPicture+0x1dc>
        shiftright += 16;
    10aa:	322f 002c      	move.w 44(sp),d1
    10ae:	0641 000f      	addi.w #15,d1
    10b2:	3f41 0032      	move.w d1,50(sp)
        shifttoleft = 1;
    10b6:	3f7c 0001 0046 	move.w #1,70(sp)
    startofword -= 16;
    10bc:	066f fff0 0030 	addi.w #-16,48(sp)
    10c2:	55af 003c      	subq.l #2,60(sp)
    10c6:	55af 0038      	subq.l #2,56(sp)
  for(int i=0;i<22;i++) {
    10ca:	0c6f fff0 0030 	cmpi.w #-16,48(sp)
    10d0:	6600 fdac      	bne.w e7e <Zoom_ZoomIntoPicture+0xf6>
    10d4:	6000 fea6      	bra.w f7c <Zoom_ZoomIntoPicture+0x1f4>
        UWORD size4blit = ZoomHorizontal*onestep;
    10d8:	302f 0034      	move.w 52(sp),d0
    10dc:	c1c4           	muls.w d4,d0
        if( linesleft>0) {
    10de:	0280 0000 ffff 	andi.l #65535,d0
    10e4:	2440           	movea.l d0,a2
    10e6:	d5c0           	adda.l d0,a2
        UWORD size4blit = ZoomHorizontal*onestep;
    10e8:	3204           	move.w d4,d1
          linesleft = 0;
    10ea:	4244           	clr.w d4
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    10ec:	2242           	movea.l d2,a1
    10ee:	d3c5           	adda.l d5,a1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    10f0:	3c28 0002      	move.w 2(a0),d6
    10f4:	6000 ff74      	bra.w 106a <Zoom_ZoomIntoPicture+0x2e2>
  ZoomBlit_Increment4SrcA = 0;
    10f8:	4279 0001 7784 	clr.w 17784 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    10fe:	720c           	moveq #12,d1
    1100:	e368           	lsl.w d1,d0
    1102:	3440           	movea.w d0,a2
    1104:	45ea 0de4      	lea 3556(a2),a2
  WaitBlit(); 
    1108:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    110c:	2079 0001 778e 	movea.l 1778e <hw>,a0
    1112:	3144 0042      	move.w d4,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1116:	314a 0040      	move.w a2,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    111a:	7000           	moveq #0,d0
    111c:	300b           	move.w a3,d0
    111e:	7210           	moveq #16,d1
    1120:	9280           	sub.l d0,d1
    1122:	2001           	move.l d1,d0
    1124:	7200           	moveq #0,d1
    1126:	4641           	not.w d1
    1128:	e1a9           	lsl.l d0,d1
    112a:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    112e:	302f 004a      	move.w 74(sp),d0
    1132:	d16f 0040      	add.w d0,64(sp)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1136:	7000           	moveq #0,d0
    1138:	3039 0001 7784 	move.w 17784 <ZoomBlit_Increment4SrcA>,d0
    113e:	2c40           	movea.l d0,a6
    1140:	ddc0           	adda.l d0,a6
    1142:	3239 0001 7776 	move.w 17776 <ZoomHorizontal>,d1
    WORD linesleft = 272;
    1148:	383c 0110      	move.w #272,d4
    114c:	2f46 0042      	move.l d6,66(sp)
    1150:	6000 fec0      	bra.w 1012 <Zoom_ZoomIntoPicture+0x28a>
  UWORD shifthoriz = 7;
    1154:	7007           	moveq #7,d0
    UWORD onestep = ZMLINESIZE/2*planes;
    1156:	3203           	move.w d3,d1
    1158:	d243           	add.w d3,d1
    115a:	d243           	add.w d3,d1
    115c:	e749           	lsl.w #3,d1
    115e:	3f41 0034      	move.w d1,52(sp)
  hw->bltsize = height*64+2;
    1162:	3e03           	move.w d3,d7
    1164:	ed4f           	lsl.w #6,d7
    1166:	3207           	move.w d7,d1
    1168:	5441           	addq.w #2,d1
    116a:	3f41 0036      	move.w d1,54(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    116e:	90c4           	suba.w d4,a0
    1170:	3a48           	movea.w a0,a5
    1172:	4bed 0012      	lea 18(a5),a5
    1176:	7200           	moveq #0,d1
    1178:	322f 0034      	move.w 52(sp),d1
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    117c:	c6c0           	mulu.w d0,d3
    117e:	2003           	move.l d3,d0
    1180:	d083           	add.l d3,d0
    1182:	d083           	add.l d3,d0
    1184:	e988           	lsl.l #4,d0
    1186:	206f 0050      	movea.l 80(sp),a0
    118a:	41f0 082c      	lea (44,a0,d0.l),a0
    118e:	2f48 003c      	move.l a0,60(sp)
    1192:	702c           	moveq #44,d0
    1194:	d0af 0054      	add.l 84(sp),d0
    1198:	2f40 0038      	move.l d0,56(sp)
  UWORD shifttoleft = 0;
    119c:	426f 0046      	clr.w 70(sp)
  UWORD startofword = 21*16;
    11a0:	3f7c 0150 0030 	move.w #336,48(sp)
      nextzoom -= (19 + zoomnr);
    11a6:	70ed           	moveq #-19,d0
    11a8:	9042           	sub.w d2,d0
    11aa:	3f40 004a      	move.w d0,74(sp)
    ZoomBlit_Increment4SrcA = 1;
    11ae:	2841           	movea.l d1,a4
    11b0:	6000 fccc      	bra.w e7e <Zoom_ZoomIntoPicture+0xf6>

000011b4 <Init_Blit>:
  hw->bltafwm = 0xffff;
    11b4:	2079 0001 778e 	movea.l 1778e <hw>,a0
    11ba:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    11c0:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    11c6:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    11cc:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    11d2:	317c 002c 0066 	move.w #44,102(a0)
}
    11d8:	4e75           	rts

000011da <ClbuildZoom>:
ULONG * ClbuildZoom() {
    11da:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    11de:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    11e4:	203c 0000 551c 	move.l #21788,d0
    11ea:	7202           	moveq #2,d1
    11ec:	4eae ff3a      	jsr -198(a6)
    11f0:	2640           	movea.l d0,a3
  if( retval == 0) {
    11f2:	4a80           	tst.l d0
    11f4:	6700 0180      	beq.w 1376 <ClbuildZoom+0x19c>
    *cl++ = *clpartinstruction++;
    11f8:	26b9 0001 73d8 	move.l 173d8 <ClsSprites>,(a3)
    11fe:	2779 0001 73dc 	move.l 173dc <ClsSprites+0x4>,4(a3)
    1204:	0004 
    1206:	2779 0001 73e0 	move.l 173e0 <ClsSprites+0x8>,8(a3)
    120c:	0008 
    120e:	2779 0001 73e4 	move.l 173e4 <ClsSprites+0xc>,12(a3)
    1214:	000c 
    1216:	2779 0001 73e8 	move.l 173e8 <ClsSprites+0x10>,16(a3)
    121c:	0010 
    121e:	2779 0001 73ec 	move.l 173ec <ClsSprites+0x14>,20(a3)
    1224:	0014 
    1226:	2779 0001 73f0 	move.l 173f0 <ClsSprites+0x18>,24(a3)
    122c:	0018 
    122e:	2779 0001 73f4 	move.l 173f4 <ClsSprites+0x1c>,28(a3)
    1234:	001c 
    1236:	2779 0001 73f8 	move.l 173f8 <ClsSprites+0x20>,32(a3)
    123c:	0020 
    123e:	2779 0001 73fc 	move.l 173fc <ClsSprites+0x24>,36(a3)
    1244:	0024 
    1246:	2779 0001 7400 	move.l 17400 <ClsSprites+0x28>,40(a3)
    124c:	0028 
    124e:	2779 0001 7404 	move.l 17404 <ClsSprites+0x2c>,44(a3)
    1254:	002c 
    1256:	2779 0001 7408 	move.l 17408 <ClsSprites+0x30>,48(a3)
    125c:	0030 
    125e:	2779 0001 740c 	move.l 1740c <ClsSprites+0x34>,52(a3)
    1264:	0034 
    1266:	2779 0001 7410 	move.l 17410 <ClsSprites+0x38>,56(a3)
    126c:	0038 
    126e:	2779 0001 7414 	move.l 17414 <ClsSprites+0x3c>,60(a3)
    1274:	003c 
    *cl++ = *clpartinstruction++;
    1276:	2779 0001 73a8 	move.l 173a8 <ClScreen>,64(a3)
    127c:	0040 
    127e:	2779 0001 73ac 	move.l 173ac <ClScreen+0x4>,68(a3)
    1284:	0044 
    1286:	2779 0001 73b0 	move.l 173b0 <ClScreen+0x8>,72(a3)
    128c:	0048 
    128e:	2779 0001 73b4 	move.l 173b4 <ClScreen+0xc>,76(a3)
    1294:	004c 
    1296:	2779 0001 73b8 	move.l 173b8 <ClScreen+0x10>,80(a3)
    129c:	0050 
    129e:	2779 0001 73bc 	move.l 173bc <ClScreen+0x14>,84(a3)
    12a4:	0054 
    12a6:	2779 0001 73c0 	move.l 173c0 <ClScreen+0x18>,88(a3)
    12ac:	0058 
    12ae:	2779 0001 73c4 	move.l 173c4 <ClScreen+0x1c>,92(a3)
    12b4:	005c 
    12b6:	2779 0001 73c8 	move.l 173c8 <ClScreen+0x20>,96(a3)
    12bc:	0060 
    12be:	2779 0001 73cc 	move.l 173cc <ClScreen+0x24>,100(a3)
    12c4:	0064 
    12c6:	2779 0001 73d0 	move.l 173d0 <ClScreen+0x28>,104(a3)
    12cc:	0068 
    12ce:	2779 0001 73d4 	move.l 173d4 <ClScreen+0x2c>,108(a3)
    12d4:	006c 
  *cl++ = 0x00e00000;
    12d6:	277c 00e0 0000 	move.l #14680064,112(a3)
    12dc:	0070 
  *cl++ = 0x00e20000;
    12de:	277c 00e2 0000 	move.l #14811136,116(a3)
    12e4:	0074 
  *cl++ = 0x00e40000;
    12e6:	277c 00e4 0000 	move.l #14942208,120(a3)
    12ec:	0078 
  *cl++ = 0x00e60000;
    12ee:	277c 00e6 0000 	move.l #15073280,124(a3)
    12f4:	007c 
  *cl++ = 0x00e80000;
    12f6:	277c 00e8 0000 	move.l #15204352,128(a3)
    12fc:	0080 
  *cl++ = 0x00ea0000;
    12fe:	277c 00ea 0000 	move.l #15335424,132(a3)
    1304:	0084 
  *cl++ = 0x00ec0000;
    1306:	277c 00ec 0000 	move.l #15466496,136(a3)
    130c:	0088 
  *cl++ = 0x00ee0000;
    130e:	277c 00ee 0000 	move.l #15597568,140(a3)
    1314:	008c 
  *cl++ = 0x00f00000;
    1316:	277c 00f0 0000 	move.l #15728640,144(a3)
    131c:	0090 
  *cl++ = 0x00f20000;
    131e:	277c 00f2 0000 	move.l #15859712,148(a3)
    1324:	0094 
  for(int i=0; i<32;i++)
    1326:	43eb 0098      	lea 152(a3),a1
  clpartinstruction = ClColor;
    132a:	41f9 0001 7328 	lea 17328 <ClColor>,a0
    *cl++ = *clpartinstruction++;
    1330:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
    1332:	b1fc 0001 73a8 	cmpa.l #95144,a0
    1338:	66f6           	bne.s 1330 <ClbuildZoom+0x156>
  *cl++ = 0x2c01ff00;
    133a:	45eb 011c      	lea 284(a3),a2
    133e:	277c 2c01 ff00 	move.l #738328320,280(a3)
    1344:	0118 
  for(int i2=0;i2<256;i2++) {
    1346:	200b           	move.l a3,d0
    1348:	0680 0000 551c 	addi.l #21788,d0
    134e:	224a           	movea.l a2,a1
    clpartinstruction = Cl102Zoom;
    1350:	41f9 0001 72d4 	lea 172d4 <Cl102Zoom>,a0
      *cl++ = *clpartinstruction++;
    1356:	22d8           	move.l (a0)+,(a1)+
    for( int i=0; i<21;i++)
    1358:	b1fc 0001 7328 	cmpa.l #95016,a0
    135e:	66f6           	bne.s 1356 <ClbuildZoom+0x17c>
    1360:	45ea 0054      	lea 84(a2),a2
  for(int i2=0;i2<256;i2++) {
    1364:	b08a           	cmp.l a2,d0
    1366:	66e6           	bne.s 134e <ClbuildZoom+0x174>
   *cl = 0xfffffffe;
    1368:	70fe           	moveq #-2,d0
    136a:	2740 551c      	move.l d0,21788(a3)
}
    136e:	200b           	move.l a3,d0
    1370:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    1374:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1376:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    137c:	4eae ffc4      	jsr -60(a6)
    1380:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1386:	2200           	move.l d0,d1
    1388:	243c 0001 4b27 	move.l #84775,d2
    138e:	7628           	moveq #40,d3
    1390:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1394:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    139a:	7201           	moveq #1,d1
    139c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    13a0:	26b9 0001 73d8 	move.l 173d8 <ClsSprites>,(a3)
    13a6:	2779 0001 73dc 	move.l 173dc <ClsSprites+0x4>,4(a3)
    13ac:	0004 
    13ae:	2779 0001 73e0 	move.l 173e0 <ClsSprites+0x8>,8(a3)
    13b4:	0008 
    13b6:	2779 0001 73e4 	move.l 173e4 <ClsSprites+0xc>,12(a3)
    13bc:	000c 
    13be:	2779 0001 73e8 	move.l 173e8 <ClsSprites+0x10>,16(a3)
    13c4:	0010 
    13c6:	2779 0001 73ec 	move.l 173ec <ClsSprites+0x14>,20(a3)
    13cc:	0014 
    13ce:	2779 0001 73f0 	move.l 173f0 <ClsSprites+0x18>,24(a3)
    13d4:	0018 
    13d6:	2779 0001 73f4 	move.l 173f4 <ClsSprites+0x1c>,28(a3)
    13dc:	001c 
    13de:	2779 0001 73f8 	move.l 173f8 <ClsSprites+0x20>,32(a3)
    13e4:	0020 
    13e6:	2779 0001 73fc 	move.l 173fc <ClsSprites+0x24>,36(a3)
    13ec:	0024 
    13ee:	2779 0001 7400 	move.l 17400 <ClsSprites+0x28>,40(a3)
    13f4:	0028 
    13f6:	2779 0001 7404 	move.l 17404 <ClsSprites+0x2c>,44(a3)
    13fc:	002c 
    13fe:	2779 0001 7408 	move.l 17408 <ClsSprites+0x30>,48(a3)
    1404:	0030 
    1406:	2779 0001 740c 	move.l 1740c <ClsSprites+0x34>,52(a3)
    140c:	0034 
    140e:	2779 0001 7410 	move.l 17410 <ClsSprites+0x38>,56(a3)
    1414:	0038 
    1416:	2779 0001 7414 	move.l 17414 <ClsSprites+0x3c>,60(a3)
    141c:	003c 
    *cl++ = *clpartinstruction++;
    141e:	2779 0001 73a8 	move.l 173a8 <ClScreen>,64(a3)
    1424:	0040 
    1426:	2779 0001 73ac 	move.l 173ac <ClScreen+0x4>,68(a3)
    142c:	0044 
    142e:	2779 0001 73b0 	move.l 173b0 <ClScreen+0x8>,72(a3)
    1434:	0048 
    1436:	2779 0001 73b4 	move.l 173b4 <ClScreen+0xc>,76(a3)
    143c:	004c 
    143e:	2779 0001 73b8 	move.l 173b8 <ClScreen+0x10>,80(a3)
    1444:	0050 
    1446:	2779 0001 73bc 	move.l 173bc <ClScreen+0x14>,84(a3)
    144c:	0054 
    144e:	2779 0001 73c0 	move.l 173c0 <ClScreen+0x18>,88(a3)
    1454:	0058 
    1456:	2779 0001 73c4 	move.l 173c4 <ClScreen+0x1c>,92(a3)
    145c:	005c 
    145e:	2779 0001 73c8 	move.l 173c8 <ClScreen+0x20>,96(a3)
    1464:	0060 
    1466:	2779 0001 73cc 	move.l 173cc <ClScreen+0x24>,100(a3)
    146c:	0064 
    146e:	2779 0001 73d0 	move.l 173d0 <ClScreen+0x28>,104(a3)
    1474:	0068 
    1476:	2779 0001 73d4 	move.l 173d4 <ClScreen+0x2c>,108(a3)
    147c:	006c 
  *cl++ = 0x00e00000;
    147e:	277c 00e0 0000 	move.l #14680064,112(a3)
    1484:	0070 
  *cl++ = 0x00e20000;
    1486:	277c 00e2 0000 	move.l #14811136,116(a3)
    148c:	0074 
  *cl++ = 0x00e40000;
    148e:	277c 00e4 0000 	move.l #14942208,120(a3)
    1494:	0078 
  *cl++ = 0x00e60000;
    1496:	277c 00e6 0000 	move.l #15073280,124(a3)
    149c:	007c 
  *cl++ = 0x00e80000;
    149e:	277c 00e8 0000 	move.l #15204352,128(a3)
    14a4:	0080 
  *cl++ = 0x00ea0000;
    14a6:	277c 00ea 0000 	move.l #15335424,132(a3)
    14ac:	0084 
  *cl++ = 0x00ec0000;
    14ae:	277c 00ec 0000 	move.l #15466496,136(a3)
    14b4:	0088 
  *cl++ = 0x00ee0000;
    14b6:	277c 00ee 0000 	move.l #15597568,140(a3)
    14bc:	008c 
  *cl++ = 0x00f00000;
    14be:	277c 00f0 0000 	move.l #15728640,144(a3)
    14c4:	0090 
  *cl++ = 0x00f20000;
    14c6:	277c 00f2 0000 	move.l #15859712,148(a3)
    14cc:	0094 
  for(int i=0; i<32;i++)
    14ce:	43eb 0098      	lea 152(a3),a1
  clpartinstruction = ClColor;
    14d2:	41f9 0001 7328 	lea 17328 <ClColor>,a0
    14d8:	6000 fe56      	bra.w 1330 <ClbuildZoom+0x156>

000014dc <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    14dc:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    14e0:	45fa fcf8      	lea 11da <ClbuildZoom>(pc),a2
    14e4:	4e92           	jsr (a2)
    14e6:	23c0 0001 7780 	move.l d0,17780 <Copperlist1>
  Copperlist2 = ClbuildZoom();
    14ec:	4e92           	jsr (a2)
    14ee:	23c0 0001 7772 	move.l d0,17772 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    14f4:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    14fa:	203c 0001 6800 	move.l #92160,d0
    1500:	7202           	moveq #2,d1
    1502:	4eae ff3a      	jsr -198(a6)
    1506:	23c0 0001 776e 	move.l d0,1776e <Bitplane1>
  if(Bitplane1 == 0) {
    150c:	6700 008c      	beq.w 159a <PrepareDisplayZoom+0xbe>
  DrawBuffer = Bitplane1;
    1510:	23c0 0001 7786 	move.l d0,17786 <DrawBuffer>
  DrawCopper = Copperlist1;
    1516:	23f9 0001 7780 	move.l 17780 <Copperlist1>,17778 <DrawCopper>
    151c:	0001 7778 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    1520:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1526:	203c 0001 6800 	move.l #92160,d0
    152c:	7202           	moveq #2,d1
    152e:	4eae ff3a      	jsr -198(a6)
    1532:	23c0 0001 776a 	move.l d0,1776a <Bitplane2>
  if(Bitplane2 == 0) {
    1538:	6718           	beq.s 1552 <PrepareDisplayZoom+0x76>
  ViewBuffer = Bitplane2;
    153a:	23c0 0001 777c 	move.l d0,1777c <ViewBuffer>
  ViewCopper = Copperlist2;
    1540:	23f9 0001 7772 	move.l 17772 <Copperlist2>,17766 <ViewCopper>
    1546:	0001 7766 
}
    154a:	7000           	moveq #0,d0
    154c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1550:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1552:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1558:	4eae ffc4      	jsr -60(a6)
    155c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1562:	2200           	move.l d0,d1
    1564:	243c 0001 4b74 	move.l #84852,d2
    156a:	7626           	moveq #38,d3
    156c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    1570:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1576:	7201           	moveq #1,d1
    1578:	4eae ff70      	jsr -144(a6)
    157c:	2039 0001 776a 	move.l 1776a <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    1582:	23c0 0001 777c 	move.l d0,1777c <ViewBuffer>
  ViewCopper = Copperlist2;
    1588:	23f9 0001 7772 	move.l 17772 <Copperlist2>,17766 <ViewCopper>
    158e:	0001 7766 
}
    1592:	7000           	moveq #0,d0
    1594:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    1598:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    159a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    15a0:	4eae ffc4      	jsr -60(a6)
    15a4:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    15aa:	2200           	move.l d0,d1
    15ac:	243c 0001 4b4d 	move.l #84813,d2
    15b2:	7626           	moveq #38,d3
    15b4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    15b8:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    15be:	7201           	moveq #1,d1
    15c0:	4eae ff70      	jsr -144(a6)
    15c4:	2039 0001 776e 	move.l 1776e <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    15ca:	23c0 0001 7786 	move.l d0,17786 <DrawBuffer>
  DrawCopper = Copperlist1;
    15d0:	23f9 0001 7780 	move.l 17780 <Copperlist1>,17778 <DrawCopper>
    15d6:	0001 7778 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    15da:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    15e0:	203c 0001 6800 	move.l #92160,d0
    15e6:	7202           	moveq #2,d1
    15e8:	4eae ff3a      	jsr -198(a6)
    15ec:	23c0 0001 776a 	move.l d0,1776a <Bitplane2>
  if(Bitplane2 == 0) {
    15f2:	6600 ff46      	bne.w 153a <PrepareDisplayZoom+0x5e>
    15f6:	6000 ff5a      	bra.w 1552 <PrepareDisplayZoom+0x76>

000015fa <Zoom_Init>:
void Zoom_Init() {
    15fa:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    15fc:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1602:	7004           	moveq #4,d0
    1604:	7202           	moveq #2,d1
    1606:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    160a:	33fc 0010 0001 	move.w #16,17776 <ZoomHorizontal>
    1610:	7776 
}
    1612:	2c5f           	movea.l (sp)+,a6
    1614:	4e75           	rts

00001616 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    1616:	2039 0001 7778 	move.l 17778 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    161c:	23f9 0001 7766 	move.l 17766 <ViewCopper>,17778 <DrawCopper>
    1622:	0001 7778 
  ViewCopper = (ULONG *)tmp;
    1626:	23c0 0001 7766 	move.l d0,17766 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    162c:	2079 0001 778e 	movea.l 1778e <hw>,a0
    1632:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    1636:	3140 0088      	move.w d0,136(a0)
}
    163a:	4e75           	rts

0000163c <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    163c:	2039 0001 7786 	move.l 17786 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    1642:	2079 0001 7778 	movea.l 17778 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    1648:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    164c:	2200           	move.l d0,d1
    164e:	4241           	clr.w d1
    1650:	4841           	swap d1
    1652:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    1656:	23f9 0001 777c 	move.l 1777c <ViewBuffer>,17786 <DrawBuffer>
    165c:	0001 7786 
  ViewBuffer = (ULONG *) tmp;
    1660:	23c0 0001 777c 	move.l d0,1777c <ViewBuffer>
}
    1666:	4e75           	rts

00001668 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    1668:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    166c:	262f 0010      	move.l 16(sp),d3
    1670:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    1674:	2279 0001 7780 	movea.l 17780 <Copperlist1>,a1
    167a:	b2fc 0000      	cmpa.w #0,a1
    167e:	670c           	beq.s 168c <FreeDisplay+0x24>
    1680:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1686:	2003           	move.l d3,d0
    1688:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    168c:	2279 0001 7772 	movea.l 17772 <Copperlist2>,a1
    1692:	b2fc 0000      	cmpa.w #0,a1
    1696:	670c           	beq.s 16a4 <FreeDisplay+0x3c>
    1698:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    169e:	2003           	move.l d3,d0
    16a0:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    16a4:	2279 0001 776e 	movea.l 1776e <Bitplane1>,a1
    16aa:	b2fc 0000      	cmpa.w #0,a1
    16ae:	670c           	beq.s 16bc <FreeDisplay+0x54>
    16b0:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    16b6:	2002           	move.l d2,d0
    16b8:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    16bc:	2279 0001 776a 	movea.l 1776a <Bitplane2>,a1
    16c2:	b2fc 0000      	cmpa.w #0,a1
    16c6:	670c           	beq.s 16d4 <FreeDisplay+0x6c>
    16c8:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    16ce:	2002           	move.l d2,d0
    16d0:	4eae ff2e      	jsr -210(a6)
}
    16d4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    16d8:	4e75           	rts

000016da <WaitVbl>:
void WaitVbl() {
    16da:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    16dc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd746a>,d0
    16e2:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    16e4:	2017           	move.l (sp),d0
    16e6:	0280 0001 ff00 	andi.l #130816,d0
    16ec:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    16ee:	2017           	move.l (sp),d0
    16f0:	0c80 0001 3700 	cmpi.l #79616,d0
    16f6:	67e4           	beq.s 16dc <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    16f8:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd746a>,d0
    16fe:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    1702:	202f 0004      	move.l 4(sp),d0
    1706:	0280 0001 ff00 	andi.l #130816,d0
    170c:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    1710:	202f 0004      	move.l 4(sp),d0
    1714:	0c80 0001 3700 	cmpi.l #79616,d0
    171a:	66dc           	bne.s 16f8 <WaitVbl+0x1e>
}
    171c:	508f           	addq.l #8,sp
    171e:	4e75           	rts

00001720 <ZoomTest>:
void ZoomTest() {
    1720:	4fef ff50      	lea -176(sp),sp
    1724:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
  hw->dmacon = 0b1000010000000000; //Blitter nasty
    1728:	2079 0001 778e 	movea.l 1778e <hw>,a0
    172e:	317c 8400 0096 	move.w #-31744,150(a0)
  Counter4Frames = 0;
    1734:	42b9 0001 7796 	clr.l 17796 <Counter4Frames>
  if ((vbint = AllocMem(sizeof(struct Interrupt),    
    173a:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1740:	7016           	moveq #22,d0
    1742:	223c 0001 0001 	move.l #65537,d1
    1748:	4eae ff3a      	jsr -198(a6)
    174c:	2440           	movea.l d0,a2
    174e:	4a80           	tst.l d0
    1750:	671a           	beq.s 176c <ZoomTest+0x4c>
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
    1752:	357c 02c4 0008 	move.w #708,8(a2)
    vbint->is_Node.ln_Name = "VertB-Example";
    1758:	257c 0001 4b9b 	move.l #84891,10(a2)
    175e:	000a 
    vbint->is_Data = NULL;
    1760:	42aa 000e      	clr.l 14(a2)
    vbint->is_Code = Vblankcounter;
    1764:	257c 0000 0ac4 	move.l #2756,18(a2)
    176a:	0012 
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    176c:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1772:	203c 0001 1440 	move.l #70720,d0
    1778:	7202           	moveq #2,d1
    177a:	4eae ff3a      	jsr -198(a6)
    177e:	2800           	move.l d0,d4
  if( source == 0) {
    1780:	6700 2932      	beq.w 40b4 <ZoomTest+0x2994>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    1784:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    178a:	203c 0001 1440 	move.l #70720,d0
    1790:	7202           	moveq #2,d1
    1792:	4eae ff3a      	jsr -198(a6)
    1796:	2a00           	move.l d0,d5
  if( destination == 0) {
    1798:	6700 2964      	beq.w 40fe <ZoomTest+0x29de>
    179c:	2004           	move.l d4,d0
    179e:	0680 0000 3300 	addi.l #13056,d0
    17a4:	2044           	movea.l d4,a0
      *tmp4source++ = 0x55555555;
    17a6:	20bc 5555 5555 	move.l #1431655765,(a0)
    17ac:	217c 5555 5555 	move.l #1431655765,4(a0)
    17b2:	0004 
    17b4:	217c 5555 5555 	move.l #1431655765,8(a0)
    17ba:	0008 
    17bc:	217c 5555 5555 	move.l #1431655765,12(a0)
    17c2:	000c 
    17c4:	217c 5555 5555 	move.l #1431655765,16(a0)
    17ca:	0010 
    17cc:	217c 5555 5555 	move.l #1431655765,20(a0)
    17d2:	0014 
    17d4:	217c 5555 5555 	move.l #1431655765,24(a0)
    17da:	0018 
    17dc:	217c 5555 5555 	move.l #1431655765,28(a0)
    17e2:	001c 
    17e4:	217c 5555 5555 	move.l #1431655765,32(a0)
    17ea:	0020 
    17ec:	217c 5555 5555 	move.l #1431655765,36(a0)
    17f2:	0024 
    17f4:	217c 5555 5555 	move.l #1431655765,40(a0)
    17fa:	0028 
    17fc:	217c 5555 5555 	move.l #1431655765,44(a0)
    1802:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1804:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    180a:	0030 
    180c:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1812:	0034 
    1814:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    181a:	0038 
    181c:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1822:	003c 
    1824:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    182a:	0040 
    182c:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1832:	0044 
    1834:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    183a:	0048 
    183c:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1842:	004c 
    1844:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    184a:	0050 
    184c:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    1852:	0054 
    1854:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    185a:	0058 
    185c:	41e8 0060      	lea 96(a0),a0
    1860:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    1866:	fffc 
  for(int i=0;i<128+8;i++) {
    1868:	b1c0           	cmpa.l d0,a0
    186a:	6600 ff3a      	bne.w 17a6 <ZoomTest+0x86>
  WaitVbl();
    186e:	4eba fe6a      	jsr 16da <WaitVbl>(pc)
  Init_Blit();
    1872:	4eba f940      	jsr 11b4 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1876:	33fc 0001 0001 	move.w #1,17784 <ZoomBlit_Increment4SrcA>
    187c:	7784 
  WaitBlit(); 
    187e:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1884:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1888:	2079 0001 778e 	movea.l 1778e <hw>,a0
    188e:	317c 0000 0042 	move.w #0,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1894:	317c fde4 0040 	move.w #-540,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    189a:	317c fff8 0070 	move.w #-8,112(a0)
  AddIntServer(INTB_VERTB, vbint);
    18a0:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    18a6:	7005           	moveq #5,d0
    18a8:	224a           	movea.l a2,a1
    18aa:	4eae ff58      	jsr -168(a6)
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    18ae:	4878 0005      	pea 5 <_start+0x5>
    18b2:	42a7           	clr.l -(sp)
    18b4:	2f05           	move.l d5,-(sp)
    18b6:	2f04           	move.l d4,-(sp)
    18b8:	4eba f4ce      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  RemIntServer(INTB_VERTB, vbint);
    18bc:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    18c2:	7005           	moveq #5,d0
    18c4:	224a           	movea.l a2,a1
    18c6:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 7)
    18ca:	4fef 0010      	lea 16(sp),sp
    18ce:	7007           	moveq #7,d0
    18d0:	b0b9 0001 7796 	cmp.l 17796 <Counter4Frames>,d0
    18d6:	6c1e           	bge.s 18f6 <ZoomTest+0x1d6>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
    18d8:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    18de:	4eae ffc4      	jsr -60(a6)
    18e2:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    18e8:	2200           	move.l d0,d1
    18ea:	243c 0001 4c1c 	move.l #85020,d2
    18f0:	761f           	moveq #31,d3
    18f2:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272*5);
    18f6:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    18fc:	2244           	movea.l d4,a1
    18fe:	203c 0001 1440 	move.l #70720,d0
    1904:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272*5);
    1908:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    190e:	2245           	movea.l d5,a1
    1910:	203c 0001 1440 	move.l #70720,d0
    1916:	4eae ff2e      	jsr -210(a6)
  PrepareDisplayZoom();
    191a:	4bfa fbc0      	lea 14dc <PrepareDisplayZoom>(pc),a5
    191e:	4e95           	jsr (a5)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    1920:	4878 0010      	pea 10 <main+0xa>
    1924:	4879 0001 73d8 	pea 173d8 <ClsSprites>
    192a:	42a7           	clr.l -(sp)
    192c:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1932:	47fa f1b6      	lea aea <TestCopperlistBatch>(pc),a3
    1936:	4e93           	jsr (a3)
    1938:	4fef 0010      	lea 16(sp),sp
    193c:	4a80           	tst.l d0
    193e:	661e           	bne.s 195e <ZoomTest+0x23e>
    Write( Output(), 
    1940:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1946:	4eae ffc4      	jsr -60(a6)
    194a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1950:	2200           	move.l d0,d1
    1952:	243c 0001 4c3c 	move.l #85052,d2
    1958:	7645           	moveq #69,d3
    195a:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    195e:	4878 000c      	pea c <main+0x6>
    1962:	4879 0001 73a8 	pea 173a8 <ClScreen>
    1968:	4878 0010      	pea 10 <main+0xa>
    196c:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1972:	4e93           	jsr (a3)
    1974:	4fef 0010      	lea 16(sp),sp
    1978:	4a80           	tst.l d0
    197a:	661e           	bne.s 199a <ZoomTest+0x27a>
    Write( Output(), 
    197c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1982:	4eae ffc4      	jsr -60(a6)
    1986:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    198c:	2200           	move.l d0,d1
    198e:	243c 0001 4c82 	move.l #85122,d2
    1994:	7646           	moveq #70,d3
    1996:	4eae ffd0      	jsr -48(a6)

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
    199a:	2079 0001 7778 	movea.l 17778 <DrawCopper>,a0
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    UWORD lowword = (ULONG)plane2set & 0xffff;
    *posofcopper = highword;
    19a0:	317c 0004 0072 	move.w #4,114(a0)
    posofcopper += 2;
    *posofcopper = lowword;
    19a6:	4268 0076      	clr.w 118(a0)
    *posofcopper = highword;
    19aa:	317c 0004 007a 	move.w #4,122(a0)
    *posofcopper = lowword;
    19b0:	317c 0030 007e 	move.w #48,126(a0)
    *posofcopper = highword;
    19b6:	317c 0004 0082 	move.w #4,130(a0)
    *posofcopper = lowword;
    19bc:	317c 0060 0086 	move.w #96,134(a0)
    *posofcopper = highword;
    19c2:	317c 0004 008a 	move.w #4,138(a0)
    *posofcopper = lowword;
    19c8:	317c 0090 008e 	move.w #144,142(a0)
    *posofcopper = highword;
    19ce:	317c 0004 0092 	move.w #4,146(a0)
    *posofcopper = lowword;
    19d4:	317c 00c0 0096 	move.w #192,150(a0)
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
    19da:	23fc 0005 0000 	move.l #327680,17786 <DrawBuffer>
    19e0:	0001 7786 
  ViewBuffer = (ULONG *) tmp;
    19e4:	23fc 0004 0000 	move.l #262144,1777c <ViewBuffer>
    19ea:	0001 777c 
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    19ee:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    19f4:	4878 001c      	pea 1c <main+0x16>
    19f8:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    19fe:	45fa f0cc      	lea acc <TestCopperlistPos>(pc),a2
    1a02:	4e92           	jsr (a2)
    1a04:	4fef 000c      	lea 12(sp),sp
    1a08:	4a80           	tst.l d0
    1a0a:	661e           	bne.s 1a2a <ZoomTest+0x30a>
    Write(Output(), 
    1a0c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1a12:	4eae ffc4      	jsr -60(a6)
    1a16:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1a1c:	2200           	move.l d0,d1
    1a1e:	243c 0001 4cc9 	move.l #85193,d2
    1a24:	763c           	moveq #60,d3
    1a26:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    1a2a:	2f3c 00e2 0000 	move.l #14811136,-(sp)
    1a30:	4878 001d      	pea 1d <main+0x17>
    1a34:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1a3a:	4e92           	jsr (a2)
    1a3c:	4fef 000c      	lea 12(sp),sp
    1a40:	4a80           	tst.l d0
    1a42:	661e           	bne.s 1a62 <ZoomTest+0x342>
    Write(Output(), 
    1a44:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1a4a:	4eae ffc4      	jsr -60(a6)
    1a4e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1a54:	2200           	move.l d0,d1
    1a56:	243c 0001 4d06 	move.l #85254,d2
    1a5c:	763c           	moveq #60,d3
    1a5e:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    1a62:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    1a68:	4878 001e      	pea 1e <main+0x18>
    1a6c:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1a72:	4e92           	jsr (a2)
    1a74:	4fef 000c      	lea 12(sp),sp
    1a78:	4a80           	tst.l d0
    1a7a:	661e           	bne.s 1a9a <ZoomTest+0x37a>
    Write(Output(), 
    1a7c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1a82:	4eae ffc4      	jsr -60(a6)
    1a86:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1a8c:	2200           	move.l d0,d1
    1a8e:	243c 0001 4d43 	move.l #85315,d2
    1a94:	763c           	moveq #60,d3
    1a96:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60030) == 0)
    1a9a:	2f3c 00e6 0030 	move.l #15073328,-(sp)
    1aa0:	4878 001f      	pea 1f <main+0x19>
    1aa4:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1aaa:	4e92           	jsr (a2)
    1aac:	4fef 000c      	lea 12(sp),sp
    1ab0:	4a80           	tst.l d0
    1ab2:	661e           	bne.s 1ad2 <ZoomTest+0x3b2>
    Write(Output(), 
    1ab4:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1aba:	4eae ffc4      	jsr -60(a6)
    1abe:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1ac4:	2200           	move.l d0,d1
    1ac6:	243c 0001 4d80 	move.l #85376,d2
    1acc:	763c           	moveq #60,d3
    1ace:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    1ad2:	4878 0020      	pea 20 <main+0x1a>
    1ad6:	4879 0001 7328 	pea 17328 <ClColor>
    1adc:	4878 0026      	pea 26 <main+0x20>
    1ae0:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1ae6:	4e93           	jsr (a3)
    1ae8:	4fef 0010      	lea 16(sp),sp
    1aec:	4a80           	tst.l d0
    1aee:	661e           	bne.s 1b0e <ZoomTest+0x3ee>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    1af0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1af6:	4eae ffc4      	jsr -60(a6)
    1afa:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1b00:	2200           	move.l d0,d1
    1b02:	243c 0001 4dbd 	move.l #85437,d2
    1b08:	7625           	moveq #37,d3
    1b0a:	4eae ffd0      	jsr -48(a6)
  if(  TestCopperlistBatch(  Copperlist1, 71, Cl102Zoom, 21) == 0)
    1b0e:	4878 0015      	pea 15 <main+0xf>
    1b12:	4879 0001 72d4 	pea 172d4 <Cl102Zoom>
    1b18:	4878 0047      	pea 47 <main+0x41>
    1b1c:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1b22:	4e93           	jsr (a3)
    1b24:	4fef 0010      	lea 16(sp),sp
    1b28:	4a80           	tst.l d0
    1b2a:	661e           	bne.s 1b4a <ZoomTest+0x42a>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36);
    1b2c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1b32:	4eae ffc4      	jsr -60(a6)
    1b36:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1b3c:	2200           	move.l d0,d1
    1b3e:	243c 0001 4de3 	move.l #85475,d2
    1b44:	7624           	moveq #36,d3
    1b46:	4eae ffd0      	jsr -48(a6)
  if( TestCopperlistPos( Copperlist1, 256*21+71, 0xfffffffe) == 0)
    1b4a:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd8464>
    1b4e:	4878 1547      	pea 1547 <PrepareDisplayZoom+0x6b>
    1b52:	2f39 0001 7780 	move.l 17780 <Copperlist1>,-(sp)
    1b58:	4e92           	jsr (a2)
    1b5a:	4fef 000c      	lea 12(sp),sp
    1b5e:	4a80           	tst.l d0
    1b60:	661e           	bne.s 1b80 <ZoomTest+0x460>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    1b62:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1b68:	4eae ffc4      	jsr -60(a6)
    1b6c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1b72:	2200           	move.l d0,d1
    1b74:	243c 0001 4e08 	move.l #85512,d2
    1b7a:	7632           	moveq #50,d3
    1b7c:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    1b80:	2f3c 0001 6800 	move.l #92160,-(sp)
    1b86:	4878 551c      	pea 551c <incbin_startimage_start+0x994>
    1b8a:	47fa fadc      	lea 1668 <FreeDisplay>(pc),a3
    1b8e:	4e93           	jsr (a3)
  Zoom_Init();
    1b90:	49fa fa68      	lea 15fa <Zoom_Init>(pc),a4
    1b94:	4e94           	jsr (a4)
  PrepareDisplayZoom();
    1b96:	4e95           	jsr (a5)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    1b98:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1b9e:	203c 0000 c800 	move.l #51200,d0
    1ba4:	7202           	moveq #2,d1
    1ba6:	4eae ff3a      	jsr -198(a6)
    1baa:	2040           	movea.l d0,a0
    1bac:	23c0 0001 778a 	move.l d0,1778a <Zoom_Source>
  if( Zoom_Source == 0) {
    1bb2:	508f           	addq.l #8,sp
    1bb4:	6700 24dc      	beq.w 4092 <ZoomTest+0x2972>
  *tstsource++ = 0x0000;
    1bb8:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    1bba:	317c 0080 0002 	move.w #128,2(a0)
  *tstsource = 0x1000;
    1bc0:	317c 1000 0030 	move.w #4096,48(a0)
  *tstsource = 0x8e88;
    1bc6:	317c 8e88 0032 	move.w #-29048,50(a0)
  *tstsource++ = 0x0000;
    1bcc:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
    1bd0:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
    1bd6:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1bdc:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    1be0:	4eba f5d2      	jsr 11b4 <Init_Blit>(pc)
    ZoomBlit_Increment4SrcA = 1;
    1be4:	33fc 0001 0001 	move.w #1,17784 <ZoomBlit_Increment4SrcA>
    1bea:	7784 
  WaitBlit(); 
    1bec:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1bf2:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    1bf6:	2479 0001 778e 	movea.l 1778e <hw>,a2
    1bfc:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
    1c02:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1c08:	357c ff00 0070 	move.w #-256,112(a2)
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    1c0e:	2639 0001 7786 	move.l 17786 <DrawBuffer>,d3
    1c14:	2439 0001 778a 	move.l 1778a <Zoom_Source>,d2
  WaitBlt();
    1c1a:	4eba f156      	jsr d72 <WaitBlt>(pc)
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    1c1e:	7000           	moveq #0,d0
    1c20:	3039 0001 7784 	move.w 17784 <ZoomBlit_Increment4SrcA>,d0
    1c26:	d080           	add.l d0,d0
    1c28:	d082           	add.l d2,d0
    1c2a:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
    1c2e:	2542 004c      	move.l d2,76(a2)
  hw->bltdpt = destination;
    1c32:	2543 0054      	move.l d3,84(a2)
  hw->bltsize = height*64+2;
    1c36:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
    1c3c:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1c42:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    1c46:	2479 0001 7786 	movea.l 17786 <DrawBuffer>,a2
  if( *destination != 0x0180) {
    1c4c:	0c6a 0180 0002 	cmpi.w #384,2(a2)
    1c52:	671e           	beq.s 1c72 <ZoomTest+0x552>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    1c54:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1c5a:	4eae ffc4      	jsr -60(a6)
    1c5e:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1c64:	2200           	move.l d0,d1
    1c66:	243c 0001 4e73 	move.l #85619,d2
    1c6c:	761c           	moveq #28,d3
    1c6e:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x1d88)
    1c72:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
    1c78:	671e           	beq.s 1c98 <ZoomTest+0x578>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    1c7a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1c80:	4eae ffc4      	jsr -60(a6)
    1c84:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1c8a:	2200           	move.l d0,d1
    1c8c:	243c 0001 4e90 	move.l #85648,d2
    1c92:	761c           	moveq #28,d3
    1c94:	4eae ffd0      	jsr -48(a6)
  if( *destination != 0x01ff) {
    1c98:	2079 0001 7786 	movea.l 17786 <DrawBuffer>,a0
    1c9e:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
    1ca4:	671e           	beq.s 1cc4 <ZoomTest+0x5a4>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    1ca6:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1cac:	4eae ffc4      	jsr -60(a6)
    1cb0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1cb6:	2200           	move.l d0,d1
    1cb8:	243c 0001 4ead 	move.l #85677,d2
    1cbe:	761a           	moveq #26,d3
    1cc0:	4eae ffd0      	jsr -48(a6)
  FreeMem( Zoom_Source, 40*256*5);
    1cc4:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1cca:	2279 0001 778a 	movea.l 1778a <Zoom_Source>,a1
    1cd0:	203c 0000 c800 	move.l #51200,d0
    1cd6:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    1cda:	2f3c 0001 6800 	move.l #92160,-(sp)
    1ce0:	4878 551c      	pea 551c <incbin_startimage_start+0x994>
    1ce4:	4e93           	jsr (a3)
    1ce6:	508f           	addq.l #8,sp
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    1ce8:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1cee:	203c 0000 05a0 	move.l #1440,d0
    1cf4:	7202           	moveq #2,d1
    1cf6:	4eae ff3a      	jsr -198(a6)
    1cfa:	2440           	movea.l d0,a2
  if( source == 0) {
    1cfc:	4a80           	tst.l d0
    1cfe:	6700 22fc      	beq.w 3ffc <ZoomTest+0x28dc>
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    1d02:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1d08:	203c 0000 05a0 	move.l #1440,d0
    1d0e:	7202           	moveq #2,d1
    1d10:	4eae ff3a      	jsr -198(a6)
    1d14:	2640           	movea.l d0,a3
  if( destination == 0) {
    1d16:	4a80           	tst.l d0
    1d18:	6700 22e2      	beq.w 3ffc <ZoomTest+0x28dc>
    *tmp++ = 0;
    1d1c:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
    1d1e:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
    1d24:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
    1d2a:	426a 0006      	clr.w 6(a2)
    *tmp++ = 0;
    1d2e:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
    1d32:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
    1d38:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
    1d3e:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
    1d42:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
    1d46:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
    1d4c:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
    1d52:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
    1d56:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
    1d5a:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
    1d60:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
    1d66:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
    1d6a:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
    1d6e:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
    1d74:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
    1d7a:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
    1d7e:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
    1d82:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
    1d88:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
    1d8e:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
    1d92:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
    1d96:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
    1d9c:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
    1da2:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
    1da6:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
    1daa:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
    1db0:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
    1db6:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
    1dba:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
    1dbe:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
    1dc4:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
    1dca:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
    1dce:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
    1dd2:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
    1dd8:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
    1dde:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
    1de2:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
    1de6:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
    1dec:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
    1df2:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
    1df6:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
    1dfa:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
    1e00:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
    1e06:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
    1e0a:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
    1e0e:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
    1e14:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
    1e1a:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
    1e1e:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
    1e22:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
    1e28:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
    1e2e:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
    1e32:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
    1e36:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
    1e3c:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
    1e42:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
    1e46:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
    1e4a:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
    1e50:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
    1e56:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
    1e5a:	4878 05a0      	pea 5a0 <main+0x59a>
    1e5e:	42a7           	clr.l -(sp)
    1e60:	2f00           	move.l d0,-(sp)
    1e62:	4eba 2370      	jsr 41d4 <memset>(pc)
  WaitBlit();
    1e66:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1e6c:	4eae ff1c      	jsr -228(a6)
  Zoom_Init();
    1e70:	4e94           	jsr (a4)
  WaitBlit();
    1e72:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1e78:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    1e7c:	2879 0001 778e 	movea.l 1778e <hw>,a4
    1e82:	397c 39f0 0040 	move.w #14832,64(a4)
  hw->bltcon1 = 0;
    1e88:	397c 0000 0042 	move.w #0,66(a4)
  WaitBlt();
    1e8e:	4eba eee2      	jsr d72 <WaitBlt>(pc)
  hw->bltapt = (UWORD *) source;
    1e92:	200a           	move.l a2,d0
    1e94:	5480           	addq.l #2,d0
    1e96:	2940 0050      	move.l d0,80(a4)
  hw->bltdpt = (UWORD *) destination;
    1e9a:	294b 0054      	move.l a3,84(a4)
  hw->bltsize = height*64+2;
    1e9e:	397c 0402 0058 	move.w #1026,88(a4)
  WaitBlit();
    1ea4:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    1eaa:	4eae ff1c      	jsr -228(a6)
  if( *tmp != 0x5555) 
    1eae:	4fef 000c      	lea 12(sp),sp
    1eb2:	0c6b 5555 0002 	cmpi.w #21845,2(a3)
    1eb8:	671e           	beq.s 1ed8 <ZoomTest+0x7b8>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    1eba:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1ec0:	4eae ffc4      	jsr -60(a6)
    1ec4:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1eca:	2200           	move.l d0,d1
    1ecc:	243c 0001 4efe 	move.l #85758,d2
    1ed2:	761f           	moveq #31,d3
    1ed4:	4eae ffd0      	jsr -48(a6)
  if( *tmp != 0xaaaa)
    1ed8:	0c6b aaaa 0032 	cmpi.w #-21846,50(a3)
    1ede:	671e           	beq.s 1efe <ZoomTest+0x7de>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    1ee0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1ee6:	4eae ffc4      	jsr -60(a6)
    1eea:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    1ef0:	2200           	move.l d0,d1
    1ef2:	243c 0001 4f1e 	move.l #85790,d2
    1ef8:	7620           	moveq #32,d3
    1efa:	4eae ffd0      	jsr -48(a6)
  FreeMem( source,ZMLINESIZE*30);
    1efe:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1f04:	224a           	movea.l a2,a1
    1f06:	203c 0000 05a0 	move.l #1440,d0
    1f0c:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    1f10:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1f16:	224b           	movea.l a3,a1
    1f18:	203c 0000 05a0 	move.l #1440,d0
    1f1e:	4eae ff2e      	jsr -210(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1f22:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1f28:	203c 0000 3740 	move.l #14144,d0
    1f2e:	7202           	moveq #2,d1
    1f30:	4eae ff3a      	jsr -198(a6)
    1f34:	2600           	move.l d0,d3
  if( source == 0) {
    1f36:	6700 20fa      	beq.w 4032 <ZoomTest+0x2912>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    1f3a:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    1f40:	203c 0000 3740 	move.l #14144,d0
    1f46:	7202           	moveq #2,d1
    1f48:	4eae ff3a      	jsr -198(a6)
    1f4c:	2840           	movea.l d0,a4
  if( destination == 0) {
    1f4e:	4a80           	tst.l d0
    1f50:	6700 21ce      	beq.w 4120 <ZoomTest+0x2a00>
    1f54:	2003           	move.l d3,d0
    1f56:	0680 0000 3300 	addi.l #13056,d0
    1f5c:	2043           	movea.l d3,a0
      *tmp4source++ = 0x55555555;
    1f5e:	20bc 5555 5555 	move.l #1431655765,(a0)
    1f64:	217c 5555 5555 	move.l #1431655765,4(a0)
    1f6a:	0004 
    1f6c:	217c 5555 5555 	move.l #1431655765,8(a0)
    1f72:	0008 
    1f74:	217c 5555 5555 	move.l #1431655765,12(a0)
    1f7a:	000c 
    1f7c:	217c 5555 5555 	move.l #1431655765,16(a0)
    1f82:	0010 
    1f84:	217c 5555 5555 	move.l #1431655765,20(a0)
    1f8a:	0014 
    1f8c:	217c 5555 5555 	move.l #1431655765,24(a0)
    1f92:	0018 
    1f94:	217c 5555 5555 	move.l #1431655765,28(a0)
    1f9a:	001c 
    1f9c:	217c 5555 5555 	move.l #1431655765,32(a0)
    1fa2:	0020 
    1fa4:	217c 5555 5555 	move.l #1431655765,36(a0)
    1faa:	0024 
    1fac:	217c 5555 5555 	move.l #1431655765,40(a0)
    1fb2:	0028 
    1fb4:	217c 5555 5555 	move.l #1431655765,44(a0)
    1fba:	002c 
      *tmp4source++ = 0xaaaaaaaa;
    1fbc:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
    1fc2:	0030 
    1fc4:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
    1fca:	0034 
    1fcc:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
    1fd2:	0038 
    1fd4:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
    1fda:	003c 
    1fdc:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
    1fe2:	0040 
    1fe4:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
    1fea:	0044 
    1fec:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
    1ff2:	0048 
    1ff4:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
    1ffa:	004c 
    1ffc:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
    2002:	0050 
    2004:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
    200a:	0054 
    200c:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
    2012:	0058 
    2014:	41e8 0060      	lea 96(a0),a0
    2018:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
    201e:	fffc 
  for(int i=0;i<128+8;i++) {
    2020:	b1c0           	cmpa.l d0,a0
    2022:	6600 ff3a      	bne.w 1f5e <ZoomTest+0x83e>
  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    2026:	4878 0001      	pea 1 <_start+0x1>
    202a:	42a7           	clr.l -(sp)
    202c:	2f0c           	move.l a4,-(sp)
    202e:	2f03           	move.l d3,-(sp)
    2030:	4eba ed56      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2034:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    203a:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    203e:	41ec 0004      	lea 4(a4),a0
    2042:	2f48 0044      	move.l a0,68(sp)
  for(int i=0;i<14;i++) {
    2046:	41ec 0364      	lea 868(a4),a0
    204a:	2f48 004c      	move.l a0,76(sp)
    204e:	2a08           	move.l a0,d5
    2050:	4fef 0010      	lea 16(sp),sp
  UWORD *valactual = destination+2; 
    2054:	367c 0012      	movea.w #18,a3
  UWORD mask = 0xffff;
    2058:	74ff           	moveq #-1,d2
    205a:	7800           	moveq #0,d4
    205c:	4644           	not.w d4
    205e:	4bfa e94e      	lea 9ae <TestRow>(pc),a5
    2062:	2445           	movea.l d5,a2
    2064:	45ea fca0      	lea -864(a2),a2
    2068:	4deb ffee      	lea -18(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*19);
    206c:	2f0e           	move.l a6,-(sp)
    206e:	2f04           	move.l d4,-(sp)
    2070:	2f0a           	move.l a2,-(sp)
    2072:	4879 0001 7704 	pea 17704 <destlinezoom1>
    2078:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    207a:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    207e:	4642           	not.w d2
    2080:	528e           	addq.l #1,a6
    for(int i2=0;i2<18;i2++) { 
    2082:	4fef 0010      	lea 16(sp),sp
    2086:	ba8a           	cmp.l a2,d5
    2088:	6600 1888      	bne.w 3912 <ZoomTest+0x21f2>
    TestRow( valsupposed, valactual, mask, 18+i*19);
    208c:	2f0b           	move.l a3,-(sp)
    208e:	7800           	moveq #0,d4
    2090:	3802           	move.w d2,d4
    2092:	2f04           	move.l d4,-(sp)
    2094:	2f0a           	move.l a2,-(sp)
    2096:	4879 0001 7704 	pea 17704 <destlinezoom1>
    209c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    209e:	2a0a           	move.l a2,d5
    20a0:	0685 0000 0390 	addi.l #912,d5
    20a6:	47eb 0013      	lea 19(a3),a3
  for(int i=0;i<14;i++) {
    20aa:	4fef 0010      	lea 16(sp),sp
    20ae:	b6fc 011c      	cmpa.w #284,a3
    20b2:	66ae           	bne.s 2062 <ZoomTest+0x942>
    20b4:	41ec 31e4      	lea 12772(a4),a0
    20b8:	2f48 0030      	move.l a0,48(sp)
    20bc:	2448           	movea.l a0,a2
    20be:	2a3c 0000 0109 	move.l #265,d5
    TestRow( valsupposed, valactual, mask, i2+265);
    20c4:	2f05           	move.l d5,-(sp)
    20c6:	2f04           	move.l d4,-(sp)
    20c8:	2f0a           	move.l a2,-(sp)
    20ca:	4879 0001 7704 	pea 17704 <destlinezoom1>
    20d0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    20d2:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    20d6:	4642           	not.w d2
    20d8:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    20da:	4fef 0010      	lea 16(sp),sp
    20de:	0c85 0000 010d 	cmpi.l #269,d5
    20e4:	6726           	beq.s 210c <ZoomTest+0x9ec>
    20e6:	7800           	moveq #0,d4
    20e8:	3802           	move.w d2,d4
    TestRow( valsupposed, valactual, mask, i2+265);
    20ea:	2f05           	move.l d5,-(sp)
    20ec:	2f04           	move.l d4,-(sp)
    20ee:	2f0a           	move.l a2,-(sp)
    20f0:	4879 0001 7704 	pea 17704 <destlinezoom1>
    20f6:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    20f8:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    20fc:	4642           	not.w d2
    20fe:	5285           	addq.l #1,d5
  for(int i2=0;i2<4;i2++) { 
    2100:	4fef 0010      	lea 16(sp),sp
    2104:	0c85 0000 010d 	cmpi.l #269,d5
    210a:	66da           	bne.s 20e6 <ZoomTest+0x9c6>
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    210c:	4878 0001      	pea 1 <_start+0x1>
    2110:	4878 0001      	pea 1 <_start+0x1>
    2114:	2f03           	move.l d3,-(sp)
    2116:	2f0c           	move.l a4,-(sp)
    2118:	4eba ec6e      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    211c:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    2122:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    2126:	2003           	move.l d3,d0
    2128:	5880           	addq.l #4,d0
    212a:	2f40 003c      	move.l d0,60(sp)
    212e:	4fef 0010      	lea 16(sp),sp
    2132:	2440           	movea.l d0,a2
  for(int i2=0;i2<11;i2++) { 
    2134:	7800           	moveq #0,d4
  mask = 0x0000;
    2136:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    2138:	2f04           	move.l d4,-(sp)
    213a:	3f02           	move.w d2,-(sp)
    213c:	4267           	clr.w -(sp)
    213e:	2f0a           	move.l a2,-(sp)
    2140:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    2146:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2148:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    214c:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    214e:	5284           	addq.l #1,d4
    2150:	4fef 0010      	lea 16(sp),sp
    2154:	720b           	moveq #11,d1
    2156:	b284           	cmp.l d4,d1
    2158:	66de           	bne.s 2138 <ZoomTest+0xa18>
  TestRow( valsupposed, valactual, 0xffff, 8);
    215a:	4878 0008      	pea 8 <main+0x2>
    215e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2164:	2003           	move.l d3,d0
    2166:	0680 0000 0214 	addi.l #532,d0
    216c:	2f40 0068      	move.l d0,104(sp)
    2170:	2f00           	move.l d0,-(sp)
    2172:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    2178:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 9);
    217a:	4878 0009      	pea 9 <main+0x3>
    217e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2184:	2043           	movea.l d3,a0
    2186:	4868 0244      	pea 580(a0)
    218a:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    2190:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 10);
    2192:	4fef 0020      	lea 32(sp),sp
    2196:	4878 000a      	pea a <main+0x4>
    219a:	42a7           	clr.l -(sp)
    219c:	2043           	movea.l d3,a0
    219e:	4868 0274      	pea 628(a0)
    21a2:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    21a8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 11);
    21aa:	4878 000b      	pea b <main+0x5>
    21ae:	42a7           	clr.l -(sp)
    21b0:	2043           	movea.l d3,a0
    21b2:	4868 02a4      	pea 676(a0)
    21b6:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    21bc:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    21be:	2c03           	move.l d3,d6
    21c0:	0686 0000 05d4 	addi.l #1492,d6
    21c6:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    21ca:	2e06           	move.l d6,d7
    21cc:	367c 0018      	movea.w #24,a3
    21d0:	7a00           	moveq #0,d5
    21d2:	3a02           	move.w d2,d5
    21d4:	2447           	movea.l d7,a2
    21d6:	45ea fd00      	lea -768(a2),a2
    21da:	4deb fff3      	lea -13(a3),a6
    21de:	2805           	move.l d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    21e0:	2f0e           	move.l a6,-(sp)
    21e2:	2f04           	move.l d4,-(sp)
    21e4:	2f0a           	move.l a2,-(sp)
    21e6:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    21ec:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    21ee:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    21f2:	4642           	not.w d2
    21f4:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    21f6:	4fef 0010      	lea 16(sp),sp
    21fa:	be8a           	cmp.l a2,d7
    21fc:	6722           	beq.s 2220 <ZoomTest+0xb00>
    21fe:	7800           	moveq #0,d4
    2200:	3802           	move.w d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    2202:	2f0e           	move.l a6,-(sp)
    2204:	2f04           	move.l d4,-(sp)
    2206:	2f0a           	move.l a2,-(sp)
    2208:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    220e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2210:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2214:	4642           	not.w d2
    2216:	528e           	addq.l #1,a6
    for(int i2=0;i2<16;i2++) {  
    2218:	4fef 0010      	lea 16(sp),sp
    221c:	be8a           	cmp.l a2,d7
    221e:	66de           	bne.s 21fe <ZoomTest+0xade>
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    2220:	7a00           	moveq #0,d5
    2222:	3a02           	move.w d2,d5
    2224:	2f0b           	move.l a3,-(sp)
    2226:	2f05           	move.l d5,-(sp)
    2228:	2f0a           	move.l a2,-(sp)
    222a:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    2230:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    2232:	486b 0001      	pea 1(a3)
    2236:	2f05           	move.l d5,-(sp)
    2238:	486a 0030      	pea 48(a2)
    223c:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    2242:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    2244:	4fef 0020      	lea 32(sp),sp
    2248:	486b 0002      	pea 2(a3)
    224c:	2f04           	move.l d4,-(sp)
    224e:	486a 0060      	pea 96(a2)
    2252:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    2258:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    225a:	486b 0003      	pea 3(a3)
    225e:	2f04           	move.l d4,-(sp)
    2260:	486a 0090      	pea 144(a2)
    2264:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    226a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    226c:	2e0a           	move.l a2,d7
    226e:	0687 0000 03c0 	addi.l #960,d7
    2274:	47eb 0011      	lea 17(a3),a3
  for(int i=0;i<12;i++) {
    2278:	4fef 0020      	lea 32(sp),sp
    227c:	b6fc 00e4      	cmpa.w #228,a3
    2280:	6600 ff52      	bne.w 21d4 <ZoomTest+0xab4>
    2284:	2003           	move.l d3,d0
    2286:	0680 0000 2fd4 	addi.l #12244,d0
    228c:	2f40 0064      	move.l d0,100(sp)
    2290:	2440           	movea.l d0,a2
  for(int i2=0;i2<15;i2++) { 
    2292:	7800           	moveq #0,d4
    TestRow( valsupposed, valactual, mask, i2);
    2294:	2f04           	move.l d4,-(sp)
    2296:	2f05           	move.l d5,-(sp)
    2298:	2f0a           	move.l a2,-(sp)
    229a:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    22a0:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    22a2:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    22a6:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    22a8:	5284           	addq.l #1,d4
    22aa:	4fef 0010      	lea 16(sp),sp
    22ae:	720f           	moveq #15,d1
    22b0:	b284           	cmp.l d4,d1
    22b2:	6724           	beq.s 22d8 <ZoomTest+0xbb8>
    22b4:	7a00           	moveq #0,d5
    22b6:	3a02           	move.w d2,d5
    TestRow( valsupposed, valactual, mask, i2);
    22b8:	2f04           	move.l d4,-(sp)
    22ba:	2f05           	move.l d5,-(sp)
    22bc:	2f0a           	move.l a2,-(sp)
    22be:	4879 0001 76d8 	pea 176d8 <destlinezoom2>
    22c4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    22c6:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    22ca:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    22cc:	5284           	addq.l #1,d4
    22ce:	4fef 0010      	lea 16(sp),sp
    22d2:	720f           	moveq #15,d1
    22d4:	b284           	cmp.l d4,d1
    22d6:	66dc           	bne.s 22b4 <ZoomTest+0xb94>
  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    22d8:	4878 0001      	pea 1 <_start+0x1>
    22dc:	4878 0002      	pea 2 <_start+0x2>
    22e0:	2f0c           	move.l a4,-(sp)
    22e2:	2f03           	move.l d3,-(sp)
    22e4:	4eba eaa2      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    22e8:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    22ee:	4eae ff1c      	jsr -228(a6)
    22f2:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    22f6:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<4;i2++) { 
    22fa:	7400           	moveq #0,d2
  mask = 0xffff;
    22fc:	78ff           	moveq #-1,d4
    TestRow( valsupposed, valactual, mask, i2);
    22fe:	2f02           	move.l d2,-(sp)
    2300:	3f04           	move.w d4,-(sp)
    2302:	4267           	clr.w -(sp)
    2304:	2f0a           	move.l a2,-(sp)
    2306:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    230c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    230e:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    2312:	4644           	not.w d4
  for(int i2=0;i2<4;i2++) { 
    2314:	5282           	addq.l #1,d2
    2316:	4fef 0010      	lea 16(sp),sp
    231a:	7004           	moveq #4,d0
    231c:	b082           	cmp.l d2,d0
    231e:	66de           	bne.s 22fe <ZoomTest+0xbde>
  TestRow( valsupposed, valactual, 0xffff, 0+4);
    2320:	4878 0004      	pea 4 <_start+0x4>
    2324:	2f3c 0000 ffff 	move.l #65535,-(sp)
    232a:	486c 00c4      	pea 196(a4)
    232e:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2334:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    2336:	4878 0005      	pea 5 <_start+0x5>
    233a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2340:	486c 00f4      	pea 244(a4)
    2344:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    234a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    234c:	4fef 0020      	lea 32(sp),sp
    2350:	4878 0006      	pea 6 <main>
    2354:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    2356:	41ec 0124      	lea 292(a4),a0
    235a:	2f48 005c      	move.l a0,92(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    235e:	2f08           	move.l a0,-(sp)
    2360:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2366:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    2368:	4878 0007      	pea 7 <main+0x1>
    236c:	42a7           	clr.l -(sp)
    236e:	486c 0154      	pea 340(a4)
    2372:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2378:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    237a:	4fef 0020      	lea 32(sp),sp
    237e:	4878 0008      	pea 8 <main+0x2>
    2382:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2388:	486c 0184      	pea 388(a4)
    238c:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2392:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2394:	4878 0009      	pea 9 <main+0x3>
    2398:	2f3c 0000 ffff 	move.l #65535,-(sp)
    239e:	486c 01b4      	pea 436(a4)
    23a2:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    23a8:	4e95           	jsr (a5)
  for(int i=0;i<12;i++) {
    23aa:	280c           	move.l a4,d4
    23ac:	0684 0000 04b4 	addi.l #1204,d4
    23b2:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    23b6:	367c 0018      	movea.w #24,a3
    23ba:	7a00           	moveq #0,d5
    23bc:	74ff           	moveq #-1,d2
    23be:	2444           	movea.l d4,a2
    23c0:	45ea fd30      	lea -720(a2),a2
    23c4:	4deb fff1      	lea -15(a3),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    23c8:	2f0e           	move.l a6,-(sp)
    23ca:	2f05           	move.l d5,-(sp)
    23cc:	2f0a           	move.l a2,-(sp)
    23ce:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    23d4:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    23d6:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    23da:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    23dc:	4fef 0010      	lea 16(sp),sp
    23e0:	b88a           	cmp.l a2,d4
    23e2:	6722           	beq.s 2406 <ZoomTest+0xce6>
    23e4:	7a00           	moveq #0,d5
    23e6:	3a02           	move.w d2,d5
    23e8:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    23ea:	2f0e           	move.l a6,-(sp)
    23ec:	2f05           	move.l d5,-(sp)
    23ee:	2f0a           	move.l a2,-(sp)
    23f0:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    23f6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    23f8:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    23fc:	528e           	addq.l #1,a6
    for(int i2=0;i2<15;i2++) {  
    23fe:	4fef 0010      	lea 16(sp),sp
    2402:	b88a           	cmp.l a2,d4
    2404:	66de           	bne.s 23e4 <ZoomTest+0xcc4>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    2406:	7800           	moveq #0,d4
    2408:	3802           	move.w d2,d4
    240a:	2f0b           	move.l a3,-(sp)
    240c:	2f04           	move.l d4,-(sp)
    240e:	2f0a           	move.l a2,-(sp)
    2410:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2416:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    2418:	486b 0001      	pea 1(a3)
    241c:	2f04           	move.l d4,-(sp)
    241e:	486a 0030      	pea 48(a2)
    2422:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2428:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    242a:	4fef 0020      	lea 32(sp),sp
    242e:	486b 0002      	pea 2(a3)
    2432:	2f05           	move.l d5,-(sp)
    2434:	486a 0060      	pea 96(a2)
    2438:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    243e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    2440:	486b 0003      	pea 3(a3)
    2444:	2f05           	move.l d5,-(sp)
    2446:	486a 0090      	pea 144(a2)
    244a:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2450:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2452:	4fef 0020      	lea 32(sp),sp
    2456:	486b 0004      	pea 4(a3)
    245a:	2f04           	move.l d4,-(sp)
    245c:	486a 00c0      	pea 192(a2)
    2460:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2466:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2468:	486b 0005      	pea 5(a3)
    246c:	2f04           	move.l d4,-(sp)
    246e:	486a 00f0      	pea 240(a2)
    2472:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    2478:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    247a:	280a           	move.l a2,d4
    247c:	0684 0000 03f0 	addi.l #1008,d4
    2482:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2486:	4fef 0020      	lea 32(sp),sp
    248a:	b6fc 0114      	cmpa.w #276,a3
    248e:	6600 ff2e      	bne.w 23be <ZoomTest+0xc9e>
    2492:	45ec 3124      	lea 12580(a4),a2
    2496:	283c 0000 0105 	move.l #261,d4
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    249c:	2f04           	move.l d4,-(sp)
    249e:	2f05           	move.l d5,-(sp)
    24a0:	2f0a           	move.l a2,-(sp)
    24a2:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    24a8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    24aa:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    24ae:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    24b0:	4fef 0010      	lea 16(sp),sp
    24b4:	0c84 0000 010d 	cmpi.l #269,d4
    24ba:	6726           	beq.s 24e2 <ZoomTest+0xdc2>
    24bc:	7a00           	moveq #0,d5
    24be:	3a02           	move.w d2,d5
    24c0:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    24c2:	2f04           	move.l d4,-(sp)
    24c4:	2f05           	move.l d5,-(sp)
    24c6:	2f0a           	move.l a2,-(sp)
    24c8:	4879 0001 76ac 	pea 176ac <destlinezoom3>
    24ce:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    24d0:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    24d4:	5284           	addq.l #1,d4
  for(int i2=0;i2<8;i2++) {  
    24d6:	4fef 0010      	lea 16(sp),sp
    24da:	0c84 0000 010d 	cmpi.l #269,d4
    24e0:	66da           	bne.s 24bc <ZoomTest+0xd9c>
  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    24e2:	4878 0001      	pea 1 <_start+0x1>
    24e6:	4878 0003      	pea 3 <_start+0x3>
    24ea:	2f03           	move.l d3,-(sp)
    24ec:	2f0c           	move.l a4,-(sp)
    24ee:	4eba e898      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    24f2:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    24f8:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    24fc:	4878 0007      	pea 7 <main+0x1>
    2500:	42a7           	clr.l -(sp)
    2502:	2f2f 0044      	move.l 68(sp),-(sp)
    2506:	4879 0001 7680 	pea 17680 <destlinezoom4>
    250c:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    250e:	7034           	moveq #52,d0
    2510:	d083           	add.l d3,d0
    2512:	2f40 0060      	move.l d0,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    2516:	4fef 0020      	lea 32(sp),sp
    251a:	4878 0008      	pea 8 <main+0x2>
    251e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2524:	2f00           	move.l d0,-(sp)
    2526:	4879 0001 7680 	pea 17680 <destlinezoom4>
    252c:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    252e:	7264           	moveq #100,d1
    2530:	d283           	add.l d3,d1
    2532:	2f41 0060      	move.l d1,96(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    2536:	4878 0009      	pea 9 <main+0x3>
    253a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2540:	2f01           	move.l d1,-(sp)
    2542:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2548:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    254a:	2003           	move.l d3,d0
    254c:	0680 0000 0094 	addi.l #148,d0
    2552:	2f40 0058      	move.l d0,88(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    2556:	4fef 0020      	lea 32(sp),sp
    255a:	4878 0008      	pea 8 <main+0x2>
    255e:	42a7           	clr.l -(sp)
    2560:	2f00           	move.l d0,-(sp)
    2562:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2568:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    256a:	4878 0009      	pea 9 <main+0x3>
    256e:	42a7           	clr.l -(sp)
    2570:	2043           	movea.l d3,a0
    2572:	4868 00c4      	pea 196(a0)
    2576:	4879 0001 7680 	pea 17680 <destlinezoom4>
    257c:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    257e:	2003           	move.l d3,d0
    2580:	0680 0000 00f4 	addi.l #244,d0
    2586:	2f40 0064      	move.l d0,100(sp)
  for(int i=0;i<12;i++) {
    258a:	2e03           	move.l d3,d7
    258c:	0687 0000 0394 	addi.l #916,d7
    2592:	4fef 0020      	lea 32(sp),sp
  valactual += ZMLINESIZE/2;
    2596:	367c 0018      	movea.w #24,a3
  mask = 0xffff;
    259a:	7aff           	moveq #-1,d5
    259c:	7400           	moveq #0,d2
    259e:	4642           	not.w d2
    25a0:	2447           	movea.l d7,a2
    25a2:	45ea fd60      	lea -672(a2),a2
    25a6:	4deb fff1      	lea -15(a3),a6
    25aa:	2802           	move.l d2,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    25ac:	2f0e           	move.l a6,-(sp)
    25ae:	2f04           	move.l d4,-(sp)
    25b0:	2f0a           	move.l a2,-(sp)
    25b2:	4879 0001 7680 	pea 17680 <destlinezoom4>
    25b8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    25ba:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    25be:	4645           	not.w d5
    25c0:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    25c2:	4fef 0010      	lea 16(sp),sp
    25c6:	be8a           	cmp.l a2,d7
    25c8:	6722           	beq.s 25ec <ZoomTest+0xecc>
    25ca:	7800           	moveq #0,d4
    25cc:	3805           	move.w d5,d4
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    25ce:	2f0e           	move.l a6,-(sp)
    25d0:	2f04           	move.l d4,-(sp)
    25d2:	2f0a           	move.l a2,-(sp)
    25d4:	4879 0001 7680 	pea 17680 <destlinezoom4>
    25da:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    25dc:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    25e0:	4645           	not.w d5
    25e2:	528e           	addq.l #1,a6
    for(int i2=0;i2<14;i2++) {  
    25e4:	4fef 0010      	lea 16(sp),sp
    25e8:	be8a           	cmp.l a2,d7
    25ea:	66de           	bne.s 25ca <ZoomTest+0xeaa>
    TestRow( valsupposed, valactual, mask, i*21+9+15);
    25ec:	7400           	moveq #0,d2
    25ee:	3405           	move.w d5,d2
    25f0:	2f0b           	move.l a3,-(sp)
    25f2:	2f02           	move.l d2,-(sp)
    25f4:	2f0a           	move.l a2,-(sp)
    25f6:	4879 0001 7680 	pea 17680 <destlinezoom4>
    25fc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    25fe:	486b 0001      	pea 1(a3)
    2602:	2f02           	move.l d2,-(sp)
    2604:	486a 0030      	pea 48(a2)
    2608:	4879 0001 7680 	pea 17680 <destlinezoom4>
    260e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    2610:	4fef 0020      	lea 32(sp),sp
    2614:	486b 0002      	pea 2(a3)
    2618:	2f04           	move.l d4,-(sp)
    261a:	486a 0060      	pea 96(a2)
    261e:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2624:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    2626:	486b 0003      	pea 3(a3)
    262a:	2f04           	move.l d4,-(sp)
    262c:	486a 0090      	pea 144(a2)
    2630:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2636:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2638:	4deb 0004      	lea 4(a3),a6
    263c:	4fef 001c      	lea 28(sp),sp
    2640:	2e8e           	move.l a6,(sp)
    2642:	2f02           	move.l d2,-(sp)
    2644:	486a 00c0      	pea 192(a2)
    2648:	4879 0001 7680 	pea 17680 <destlinezoom4>
    264e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2650:	2e0b           	move.l a3,d7
    2652:	5a87           	addq.l #5,d7
    2654:	2f07           	move.l d7,-(sp)
    2656:	2f02           	move.l d2,-(sp)
    2658:	486a 00f0      	pea 240(a2)
    265c:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2662:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    2664:	4fef 001c      	lea 28(sp),sp
    2668:	2e8e           	move.l a6,(sp)
    266a:	2f04           	move.l d4,-(sp)
    266c:	486a 0120      	pea 288(a2)
    2670:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2676:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    2678:	2f07           	move.l d7,-(sp)
    267a:	2f04           	move.l d4,-(sp)
    267c:	486a 0150      	pea 336(a2)
    2680:	4879 0001 7680 	pea 17680 <destlinezoom4>
    2686:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2688:	2e0a           	move.l a2,d7
    268a:	0687 0000 0420 	addi.l #1056,d7
    2690:	47eb 0015      	lea 21(a3),a3
  for(int i=0;i<12;i++) {
    2694:	4fef 0020      	lea 32(sp),sp
    2698:	b6fc 0114      	cmpa.w #276,a3
    269c:	6600 ff02      	bne.w 25a0 <ZoomTest+0xe80>
  TestRow( valsupposed, valactual, mask, 269);
    26a0:	4878 010d      	pea 10d <main+0x107>
    26a4:	2f02           	move.l d2,-(sp)
    26a6:	2043           	movea.l d3,a0
    26a8:	4868 3274      	pea 12916(a0)
    26ac:	4879 0001 7680 	pea 17680 <destlinezoom4>
    26b2:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    26b4:	4878 0001      	pea 1 <_start+0x1>
    26b8:	4878 0004      	pea 4 <_start+0x4>
    26bc:	2f0c           	move.l a4,-(sp)
    26be:	2f03           	move.l d3,-(sp)
    26c0:	4eba e6c6      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    26c4:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    26ca:	4eae ff1c      	jsr -228(a6)
    26ce:	4fef 0020      	lea 32(sp),sp
  valactual = destination+2; 
    26d2:	266f 0034      	movea.l 52(sp),a3
  for(int i2=0;i2<13;i2++) {  
    26d6:	95ca           	suba.l a2,a2
  mask = 0x0000;
    26d8:	4245           	clr.w d5
    TestRow( valsupposed, valactual, mask, i2);
    26da:	7400           	moveq #0,d2
    26dc:	3405           	move.w d5,d2
    26de:	2f0a           	move.l a2,-(sp)
    26e0:	2f02           	move.l d2,-(sp)
    26e2:	2f0b           	move.l a3,-(sp)
    26e4:	4879 0001 7654 	pea 17654 <destlinezoom5>
    26ea:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    26ec:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    26f0:	4645           	not.w d5
  for(int i2=0;i2<13;i2++) {  
    26f2:	528a           	addq.l #1,a2
    26f4:	4fef 0010      	lea 16(sp),sp
    26f8:	700d           	moveq #13,d0
    26fa:	b08a           	cmp.l a2,d0
    26fc:	66dc           	bne.s 26da <ZoomTest+0xfba>
    26fe:	7800           	moveq #0,d4
    2700:	3805           	move.w d5,d4
  TestRow( valsupposed, valactual, mask, 12);   
    2702:	4878 000c      	pea c <main+0x6>
    2706:	2f04           	move.l d4,-(sp)
    2708:	486c 0274      	pea 628(a4)
    270c:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2712:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 13);
    2714:	4878 000d      	pea d <main+0x7>
    2718:	2f04           	move.l d4,-(sp)
    271a:	486c 02a4      	pea 676(a4)
    271e:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2724:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 14);
    2726:	4fef 0020      	lea 32(sp),sp
    272a:	4878 000e      	pea e <main+0x8>
    272e:	2f02           	move.l d2,-(sp)
    2730:	486c 02d4      	pea 724(a4)
    2734:	4879 0001 7654 	pea 17654 <destlinezoom5>
    273a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 15);
    273c:	4878 000f      	pea f <main+0x9>
    2740:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2742:	41ec 0304      	lea 772(a4),a0
    2746:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 15);
    274a:	2f08           	move.l a0,-(sp)
    274c:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2752:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 16);
    2754:	4fef 0020      	lea 32(sp),sp
    2758:	4878 0010      	pea 10 <main+0xa>
    275c:	2f04           	move.l d4,-(sp)
    275e:	486c 0334      	pea 820(a4)
    2762:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2768:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 17);
    276a:	4878 0011      	pea 11 <main+0xb>
    276e:	2f04           	move.l d4,-(sp)
    2770:	2f2f 0054      	move.l 84(sp),-(sp)
    2774:	4879 0001 7654 	pea 17654 <destlinezoom5>
    277a:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 18);
    277c:	4fef 0020      	lea 32(sp),sp
    2780:	4878 0012      	pea 12 <main+0xc>
    2784:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    2786:	41ec 0394      	lea 916(a4),a0
    278a:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 18);
    278e:	2f08           	move.l a0,-(sp)
    2790:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2796:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 19);
    2798:	4878 0013      	pea 13 <main+0xd>
    279c:	2f02           	move.l d2,-(sp)
    279e:	486c 03c4      	pea 964(a4)
    27a2:	4879 0001 7654 	pea 17654 <destlinezoom5>
    27a8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 20);
    27aa:	4fef 0020      	lea 32(sp),sp
    27ae:	4878 0014      	pea 14 <main+0xe>
    27b2:	2f04           	move.l d4,-(sp)
    27b4:	486c 03f4      	pea 1012(a4)
    27b8:	4879 0001 7654 	pea 17654 <destlinezoom5>
    27be:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 21);
    27c0:	4878 0015      	pea 15 <main+0xf>
    27c4:	2f04           	move.l d4,-(sp)
    27c6:	486c 0424      	pea 1060(a4)
    27ca:	4879 0001 7654 	pea 17654 <destlinezoom5>
    27d0:	4e95           	jsr (a5)
  for(int i=0;i<10;i++) {
    27d2:	280c           	move.l a4,d4
    27d4:	0684 0000 06c4 	addi.l #1732,d4
    27da:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    27de:	347c 0023      	movea.w #35,a2
    27e2:	2644           	movea.l d4,a3
    27e4:	47eb fd90      	lea -624(a3),a3
    27e8:	4dea fff3      	lea -13(a2),a6
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    27ec:	2f0e           	move.l a6,-(sp)
    27ee:	2f02           	move.l d2,-(sp)
    27f0:	2f0b           	move.l a3,-(sp)
    27f2:	4879 0001 7654 	pea 17654 <destlinezoom5>
    27f8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    27fa:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    27fe:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2800:	4fef 0010      	lea 16(sp),sp
    2804:	b88b           	cmp.l a3,d4
    2806:	6722           	beq.s 282a <ZoomTest+0x110a>
    2808:	7400           	moveq #0,d2
    280a:	3405           	move.w d5,d2
    280c:	4645           	not.w d5
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    280e:	2f0e           	move.l a6,-(sp)
    2810:	2f02           	move.l d2,-(sp)
    2812:	2f0b           	move.l a3,-(sp)
    2814:	4879 0001 7654 	pea 17654 <destlinezoom5>
    281a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    281c:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    2820:	528e           	addq.l #1,a6
    for(int i2=0;i2<13;i2++) {  
    2822:	4fef 0010      	lea 16(sp),sp
    2826:	b88b           	cmp.l a3,d4
    2828:	66de           	bne.s 2808 <ZoomTest+0x10e8>
    TestRow( valsupposed, valactual, mask, i*21+22+13);
    282a:	7800           	moveq #0,d4
    282c:	3805           	move.w d5,d4
    282e:	2f0a           	move.l a2,-(sp)
    2830:	2f04           	move.l d4,-(sp)
    2832:	2f0b           	move.l a3,-(sp)
    2834:	4879 0001 7654 	pea 17654 <destlinezoom5>
    283a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    283c:	486a 0001      	pea 1(a2)
    2840:	2f04           	move.l d4,-(sp)
    2842:	486b 0030      	pea 48(a3)
    2846:	4879 0001 7654 	pea 17654 <destlinezoom5>
    284c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    284e:	4fef 0020      	lea 32(sp),sp
    2852:	486a 0002      	pea 2(a2)
    2856:	2f02           	move.l d2,-(sp)
    2858:	486b 0060      	pea 96(a3)
    285c:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2862:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    2864:	486a 0003      	pea 3(a2)
    2868:	2f02           	move.l d2,-(sp)
    286a:	486b 0090      	pea 144(a3)
    286e:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2874:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    2876:	4fef 0020      	lea 32(sp),sp
    287a:	486a 0004      	pea 4(a2)
    287e:	2f04           	move.l d4,-(sp)
    2880:	486b 00c0      	pea 192(a3)
    2884:	4879 0001 7654 	pea 17654 <destlinezoom5>
    288a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    288c:	486a 0005      	pea 5(a2)
    2890:	2f04           	move.l d4,-(sp)
    2892:	486b 00f0      	pea 240(a3)
    2896:	4879 0001 7654 	pea 17654 <destlinezoom5>
    289c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    289e:	4fef 0020      	lea 32(sp),sp
    28a2:	486a 0006      	pea 6(a2)
    28a6:	2f02           	move.l d2,-(sp)
    28a8:	486b 0120      	pea 288(a3)
    28ac:	4879 0001 7654 	pea 17654 <destlinezoom5>
    28b2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    28b4:	486a 0007      	pea 7(a2)
    28b8:	2f02           	move.l d2,-(sp)
    28ba:	486b 0150      	pea 336(a3)
    28be:	4879 0001 7654 	pea 17654 <destlinezoom5>
    28c4:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    28c6:	4fef 0020      	lea 32(sp),sp
    28ca:	486a 0008      	pea 8(a2)
    28ce:	2f04           	move.l d4,-(sp)
    28d0:	486b 0180      	pea 384(a3)
    28d4:	4879 0001 7654 	pea 17654 <destlinezoom5>
    28da:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    28dc:	486a 0009      	pea 9(a2)
    28e0:	2f04           	move.l d4,-(sp)
    28e2:	486b 01b0      	pea 432(a3)
    28e6:	4879 0001 7654 	pea 17654 <destlinezoom5>
    28ec:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    28ee:	280b           	move.l a3,d4
    28f0:	0684 0000 0450 	addi.l #1104,d4
    28f6:	45ea 0015      	lea 21(a2),a2
  for(int i=0;i<10;i++) {
    28fa:	4fef 0020      	lea 32(sp),sp
    28fe:	b4fc 00f5      	cmpa.w #245,a2
    2902:	6600 fede      	bne.w 27e2 <ZoomTest+0x10c2>
    2906:	47ec 2f74      	lea 12148(a4),a3
    290a:	7e02           	moveq #2,d7
    290c:	4607           	not.b d7
    TestRow( valsupposed, valactual, mask, i2+253);
    290e:	2f07           	move.l d7,-(sp)
    2910:	2f02           	move.l d2,-(sp)
    2912:	2f0b           	move.l a3,-(sp)
    2914:	4879 0001 7654 	pea 17654 <destlinezoom5>
    291a:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    291c:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2920:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2922:	4fef 0010      	lea 16(sp),sp
    2926:	0c87 0000 010a 	cmpi.l #266,d7
    292c:	6726           	beq.s 2954 <ZoomTest+0x1234>
    292e:	7400           	moveq #0,d2
    2930:	3405           	move.w d5,d2
    2932:	4645           	not.w d5
    TestRow( valsupposed, valactual, mask, i2+253);
    2934:	2f07           	move.l d7,-(sp)
    2936:	2f02           	move.l d2,-(sp)
    2938:	2f0b           	move.l a3,-(sp)
    293a:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2940:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2942:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    2946:	5287           	addq.l #1,d7
  for(int i2=0;i2<13;i2++) {  
    2948:	4fef 0010      	lea 16(sp),sp
    294c:	0c87 0000 010a 	cmpi.l #266,d7
    2952:	66da           	bne.s 292e <ZoomTest+0x120e>
    2954:	0285 0000 ffff 	andi.l #65535,d5
  TestRow( valsupposed, valactual, mask, 266);
    295a:	2f07           	move.l d7,-(sp)
    295c:	2f05           	move.l d5,-(sp)
    295e:	2f2f 0038      	move.l 56(sp),-(sp)
    2962:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2968:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 267);
    296a:	4878 010b      	pea 10b <main+0x105>
    296e:	2f05           	move.l d5,-(sp)
  valactual += ZMLINESIZE/2;
    2970:	41ec 3214      	lea 12820(a4),a0
    2974:	2f48 0070      	move.l a0,112(sp)
  TestRow( valsupposed, valactual, mask, 267);
    2978:	2f08           	move.l a0,-(sp)
    297a:	4879 0001 7654 	pea 17654 <destlinezoom5>
    2980:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    2982:	4fef 0020      	lea 32(sp),sp
    2986:	4878 010c      	pea 10c <main+0x106>
    298a:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    298c:	41ec 3244      	lea 12868(a4),a0
    2990:	2f48 0064      	move.l a0,100(sp)
  TestRow( valsupposed, valactual, mask, 268);
    2994:	2f08           	move.l a0,-(sp)
    2996:	4879 0001 7654 	pea 17654 <destlinezoom5>
    299c:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    299e:	4878 010d      	pea 10d <main+0x107>
    29a2:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    29a4:	41ec 3274      	lea 12916(a4),a0
    29a8:	2f48 0054      	move.l a0,84(sp)
  TestRow( valsupposed, valactual, mask, 269);
    29ac:	2f08           	move.l a0,-(sp)
    29ae:	4879 0001 7654 	pea 17654 <destlinezoom5>
    29b4:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    29b6:	4fef 0020      	lea 32(sp),sp
    29ba:	4878 0001      	pea 1 <_start+0x1>
    29be:	4878 0005      	pea 5 <_start+0x5>
    29c2:	2f03           	move.l d3,-(sp)
    29c4:	2f0c           	move.l a4,-(sp)
    29c6:	4eba e3c0      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    29ca:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    29d0:	4eae ff1c      	jsr -228(a6)
    29d4:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    29d8:	266f 002c      	movea.l 44(sp),a3
  for(int i2=0;i2<7;i2++) {  
    29dc:	7800           	moveq #0,d4
  mask = 0x0000;
    29de:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    29e0:	2f04           	move.l d4,-(sp)
    29e2:	3f02           	move.w d2,-(sp)
    29e4:	4267           	clr.w -(sp)
    29e6:	2f0b           	move.l a3,-(sp)
    29e8:	4879 0001 7628 	pea 17628 <destlinezoom6>
    29ee:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    29f0:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    29f4:	4642           	not.w d2
  for(int i2=0;i2<7;i2++) {  
    29f6:	5284           	addq.l #1,d4
    29f8:	4fef 0010      	lea 16(sp),sp
    29fc:	7007           	moveq #7,d0
    29fe:	b084           	cmp.l d4,d0
    2a00:	66de           	bne.s 29e0 <ZoomTest+0x12c0>
    2a02:	2c43           	movea.l d3,a6
    2a04:	4dee 0154      	lea 340(a6),a6
    2a08:	367c 0007      	movea.w #7,a3
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    2a0c:	7800           	moveq #0,d4
    2a0e:	3802           	move.w d2,d4
    2a10:	2f0b           	move.l a3,-(sp)
    2a12:	2f04           	move.l d4,-(sp)
    2a14:	2f0e           	move.l a6,-(sp)
    2a16:	4879 0001 7628 	pea 17628 <destlinezoom6>
    2a1c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    2a1e:	486b 0001      	pea 1(a3)
    2a22:	2f04           	move.l d4,-(sp)
    2a24:	486e 0030      	pea 48(a6)
    2a28:	4879 0001 7628 	pea 17628 <destlinezoom6>
    2a2e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2a30:	4642           	not.w d2
    2a32:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2a34:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<6;i++) {
    2a38:	4fef 0020      	lea 32(sp),sp
    2a3c:	7213           	moveq #19,d1
    2a3e:	b28b           	cmp.l a3,d1
    2a40:	66ca           	bne.s 2a0c <ZoomTest+0x12ec>
    2a42:	2a0a           	move.l a2,d5
    2a44:	2c46           	movea.l d6,a6
    2a46:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    2a4a:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    2a4c:	2f04           	move.l d4,-(sp)
    2a4e:	3f02           	move.w d2,-(sp)
    2a50:	4267           	clr.w -(sp)
    2a52:	2f0e           	move.l a6,-(sp)
    2a54:	4879 0001 7628 	pea 17628 <destlinezoom6>
    2a5a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2a5c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2a60:	4642           	not.w d2
    2a62:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    2a64:	4fef 0010      	lea 16(sp),sp
    2a68:	bc8e           	cmp.l a6,d6
    2a6a:	66e0           	bne.s 2a4c <ZoomTest+0x132c>
    2a6c:	347c 001f      	movea.w #31,a2
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    2a70:	7800           	moveq #0,d4
    2a72:	3802           	move.w d2,d4
    2a74:	2f0a           	move.l a2,-(sp)
    2a76:	2f04           	move.l d4,-(sp)
    2a78:	2f0e           	move.l a6,-(sp)
    2a7a:	4879 0001 7628 	pea 17628 <destlinezoom6>
    2a80:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    2a82:	486a 0001      	pea 1(a2)
    2a86:	2f04           	move.l d4,-(sp)
    2a88:	486e 0030      	pea 48(a6)
    2a8c:	4879 0001 7628 	pea 17628 <destlinezoom6>
    2a92:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2a94:	4642           	not.w d2
    2a96:	45ea 0018      	lea 24(a2),a2
      valactual += ZMLINESIZE/2;
    2a9a:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    2a9e:	4fef 0020      	lea 32(sp),sp
    2aa2:	b4fc 00af      	cmpa.w #175,a2
    2aa6:	66c8           	bne.s 2a70 <ZoomTest+0x1350>
    2aa8:	0686 0000 0480 	addi.l #1152,d6
    2aae:	47eb 0018      	lea 24(a3),a3
  for(int i=0;i<10;i++) {
    2ab2:	b6fc 0103      	cmpa.w #259,a3
    2ab6:	668c           	bne.s 2a44 <ZoomTest+0x1324>
    2ab8:	2445           	movea.l d5,a2
    2aba:	2c43           	movea.l d3,a6
    2abc:	4dee 3094      	lea 12436(a6),a6
    2ac0:	283c 0000 0102 	move.l #258,d4
    TestRow( valsupposed, valactual, mask, 258+i2);
    2ac6:	2f04           	move.l d4,-(sp)
    2ac8:	3f02           	move.w d2,-(sp)
    2aca:	4267           	clr.w -(sp)
    2acc:	2f0e           	move.l a6,-(sp)
    2ace:	4879 0001 7628 	pea 17628 <destlinezoom6>
    2ad4:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2ad6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2ada:	4642           	not.w d2
    2adc:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    2ade:	4fef 0010      	lea 16(sp),sp
    2ae2:	0c84 0000 010d 	cmpi.l #269,d4
    2ae8:	66dc           	bne.s 2ac6 <ZoomTest+0x13a6>
  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    2aea:	4878 0001      	pea 1 <_start+0x1>
    2aee:	4878 0006      	pea 6 <main>
    2af2:	2f0c           	move.l a4,-(sp)
    2af4:	2f03           	move.l d3,-(sp)
    2af6:	4eba e290      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2afa:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    2b00:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2b04:	42a7           	clr.l -(sp)
    2b06:	42a7           	clr.l -(sp)
    2b08:	2f2f 004c      	move.l 76(sp),-(sp)
    2b0c:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2b12:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    2b14:	41ec 0034      	lea 52(a4),a0
    2b18:	2f48 0068      	move.l a0,104(sp)
    2b1c:	4fef 0020      	lea 32(sp),sp
    2b20:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2b24:	7eff           	moveq #-1,d7
    2b26:	280a           	move.l a2,d4
    2b28:	2448           	movea.l a0,a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2b2a:	7400           	moveq #0,d2
    2b2c:	3407           	move.w d7,d2
    2b2e:	2f0e           	move.l a6,-(sp)
    2b30:	2f02           	move.l d2,-(sp)
    2b32:	2f0a           	move.l a2,-(sp)
    2b34:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2b3a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2b3c:	486e 0001      	pea 1(a6)
    2b40:	2f02           	move.l d2,-(sp)
    2b42:	486a 0030      	pea 48(a2)
    2b46:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2b4c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2b4e:	4647           	not.w d7
    2b50:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2b52:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2b56:	4fef 0020      	lea 32(sp),sp
    2b5a:	700f           	moveq #15,d0
    2b5c:	b08e           	cmp.l a6,d0
    2b5e:	66ca           	bne.s 2b2a <ZoomTest+0x140a>
    2b60:	240c           	move.l a4,d2
    2b62:	0682 0000 04e4 	addi.l #1252,d2
    2b68:	2a04           	move.l d4,d5
    2b6a:	2c0b           	move.l a3,d6
    2b6c:	264e           	movea.l a6,a3
    2b6e:	2c42           	movea.l d2,a6
    2b70:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    2b74:	280b           	move.l a3,d4
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    2b76:	2f04           	move.l d4,-(sp)
    2b78:	3f07           	move.w d7,-(sp)
    2b7a:	4267           	clr.w -(sp)
    2b7c:	2f0e           	move.l a6,-(sp)
    2b7e:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2b84:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2b86:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2b8a:	4647           	not.w d7
    2b8c:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    2b8e:	4fef 0010      	lea 16(sp),sp
    2b92:	b48e           	cmp.l a6,d2
    2b94:	66e0           	bne.s 2b76 <ZoomTest+0x1456>
    2b96:	347c 001a      	movea.w #26,a2
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    2b9a:	7800           	moveq #0,d4
    2b9c:	3807           	move.w d7,d4
    2b9e:	2f0a           	move.l a2,-(sp)
    2ba0:	2f04           	move.l d4,-(sp)
    2ba2:	2f0e           	move.l a6,-(sp)
    2ba4:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2baa:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    2bac:	2f0a           	move.l a2,-(sp)
    2bae:	2f04           	move.l d4,-(sp)
    2bb0:	486e 0030      	pea 48(a6)
    2bb4:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2bba:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2bbc:	4647           	not.w d7
    2bbe:	45ea 0019      	lea 25(a2),a2
      valactual += ZMLINESIZE/2;
    2bc2:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    2bc6:	4fef 0020      	lea 32(sp),sp
    2bca:	b4fc 00c9      	cmpa.w #201,a2
    2bce:	66ca           	bne.s 2b9a <ZoomTest+0x147a>
    2bd0:	0682 0000 04b0 	addi.l #1200,d2
    2bd6:	47eb 0019      	lea 25(a3),a3
  for(int i=0;i<10;i++) {
    2bda:	b6fc 0109      	cmpa.w #265,a3
    2bde:	668e           	bne.s 2b6e <ZoomTest+0x144e>
    2be0:	2445           	movea.l d5,a2
    2be2:	2646           	movea.l d6,a3
    2be4:	4dec 31b4      	lea 12724(a4),a6
    2be8:	243c 0000 0100 	move.l #256,d2
    TestRow( valsupposed, valactual, mask, 256+i2);
    2bee:	2f02           	move.l d2,-(sp)
    2bf0:	3f07           	move.w d7,-(sp)
    2bf2:	4267           	clr.w -(sp)
    2bf4:	2f0e           	move.l a6,-(sp)
    2bf6:	4879 0001 75fc 	pea 175fc <destlinezoom7>
    2bfc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2bfe:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2c02:	4647           	not.w d7
    2c04:	5282           	addq.l #1,d2
  for(int i2=0;i2<5;i2++) {  
    2c06:	4fef 0010      	lea 16(sp),sp
    2c0a:	0c82 0000 0105 	cmpi.l #261,d2
    2c10:	66dc           	bne.s 2bee <ZoomTest+0x14ce>
  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    2c12:	4878 0001      	pea 1 <_start+0x1>
    2c16:	4878 0007      	pea 7 <main+0x1>
    2c1a:	2f03           	move.l d3,-(sp)
    2c1c:	2f0c           	move.l a4,-(sp)
    2c1e:	4eba e168      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2c22:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    2c28:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2c2c:	42a7           	clr.l -(sp)
    2c2e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2c34:	2f2f 0044      	move.l 68(sp),-(sp)
    2c38:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2c3e:	4e95           	jsr (a5)
    2c40:	4fef 0020      	lea 32(sp),sp
    2c44:	2f6f 0038 0030 	move.l 56(sp),48(sp)
  valactual += ZMLINESIZE/2;
    2c4a:	242f 0040      	move.l 64(sp),d2
  TestRow( valsupposed, valactual, mask, 0);
    2c4e:	7801           	moveq #1,d4
  mask = mask ^ 0xffff;
    2c50:	4245           	clr.w d5
    2c52:	2c2f 0030      	move.l 48(sp),d6
    2c56:	2c44           	movea.l d4,a6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2c58:	7800           	moveq #0,d4
    2c5a:	3805           	move.w d5,d4
    2c5c:	2f0e           	move.l a6,-(sp)
    2c5e:	2f04           	move.l d4,-(sp)
    2c60:	2f02           	move.l d2,-(sp)
    2c62:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2c68:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2c6a:	486e 0001      	pea 1(a6)
    2c6e:	2f04           	move.l d4,-(sp)
    2c70:	2042           	movea.l d2,a0
    2c72:	4868 0030      	pea 48(a0)
    2c76:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2c7c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2c7e:	4645           	not.w d5
    2c80:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2c82:	4fef 0020      	lea 32(sp),sp
    2c86:	700b           	moveq #11,d0
    2c88:	b08e           	cmp.l a6,d0
    2c8a:	6740           	beq.s 2ccc <ZoomTest+0x15ac>
    2c8c:	2002           	move.l d2,d0
    2c8e:	0680 0000 00c0 	addi.l #192,d0
    2c94:	2406           	move.l d6,d2
    2c96:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2c98:	7800           	moveq #0,d4
    2c9a:	3805           	move.w d5,d4
    2c9c:	2f0e           	move.l a6,-(sp)
    2c9e:	2f04           	move.l d4,-(sp)
    2ca0:	2f02           	move.l d2,-(sp)
    2ca2:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2ca8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2caa:	486e 0001      	pea 1(a6)
    2cae:	2f04           	move.l d4,-(sp)
    2cb0:	2042           	movea.l d2,a0
    2cb2:	4868 0030      	pea 48(a0)
    2cb6:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2cbc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2cbe:	4645           	not.w d5
    2cc0:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    2cc2:	4fef 0020      	lea 32(sp),sp
    2cc6:	700b           	moveq #11,d0
    2cc8:	b08e           	cmp.l a6,d0
    2cca:	66c0           	bne.s 2c8c <ZoomTest+0x156c>
    2ccc:	2f46 0030      	move.l d6,48(sp)
    2cd0:	280e           	move.l a6,d4
    2cd2:	2e06           	move.l d6,d7
    2cd4:	0687 0000 01e0 	addi.l #480,d7
    2cda:	327c 0015      	movea.w #21,a1
    2cde:	2f4a 006c      	move.l a2,108(sp)
    2ce2:	2f4b 0070      	move.l a3,112(sp)
    2ce6:	2449           	movea.l a1,a2
    2ce8:	2c47           	movea.l d7,a6
    2cea:	4dee fe20      	lea -480(a6),a6
    2cee:	47ea fff6      	lea -10(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    2cf2:	2f0b           	move.l a3,-(sp)
    2cf4:	3f05           	move.w d5,-(sp)
    2cf6:	4267           	clr.w -(sp)
    2cf8:	2f0e           	move.l a6,-(sp)
    2cfa:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2d00:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2d02:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2d06:	4645           	not.w d5
    2d08:	528b           	addq.l #1,a3
    for(int i2=0;i2<10;i2++) {  
    2d0a:	4fef 0010      	lea 16(sp),sp
    2d0e:	be8e           	cmp.l a6,d7
    2d10:	66e0           	bne.s 2cf2 <ZoomTest+0x15d2>
    2d12:	240a           	move.l a2,d2
    2d14:	2c0e           	move.l a6,d6
    2d16:	0686 0000 0300 	addi.l #768,d6
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    2d1c:	7200           	moveq #0,d1
    2d1e:	3205           	move.w d5,d1
    2d20:	2641           	movea.l d1,a3
    2d22:	2f02           	move.l d2,-(sp)
    2d24:	2f0b           	move.l a3,-(sp)
    2d26:	2f0e           	move.l a6,-(sp)
    2d28:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2d2e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    2d30:	2f02           	move.l d2,-(sp)
    2d32:	2f0b           	move.l a3,-(sp)
    2d34:	486e 0030      	pea 48(a6)
    2d38:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2d3e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2d40:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2d44:	4645           	not.w d5
    2d46:	5282           	addq.l #1,d2
    for(int i2=0;i2<8;i2++) {
    2d48:	4fef 0020      	lea 32(sp),sp
    2d4c:	bc8e           	cmp.l a6,d6
    2d4e:	66cc           	bne.s 2d1c <ZoomTest+0x15fc>
    2d50:	0687 0000 04e0 	addi.l #1248,d7
    2d56:	45ea 001a      	lea 26(a2),a2
  for(int i=0;i<9;i++) {
    2d5a:	b4fc 00ff      	cmpa.w #255,a2
    2d5e:	6688           	bne.s 2ce8 <ZoomTest+0x15c8>
    2d60:	246f 006c      	movea.l 108(sp),a2
    2d64:	266f 0070      	movea.l 112(sp),a3
    2d68:	2c2f 0030      	move.l 48(sp),d6
    2d6c:	0686 0000 2be0 	addi.l #11232,d6
    2d72:	240a           	move.l a2,d2
    2d74:	2c46           	movea.l d6,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2d76:	2f02           	move.l d2,-(sp)
    2d78:	3f05           	move.w d5,-(sp)
    2d7a:	4267           	clr.w -(sp)
    2d7c:	2f0e           	move.l a6,-(sp)
    2d7e:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2d84:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2d86:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2d8a:	4645           	not.w d5
    2d8c:	5282           	addq.l #1,d2
  for(int i2=0;i2<10;i2++) {  
    2d8e:	4fef 0010      	lea 16(sp),sp
    2d92:	0c82 0000 00ff 	cmpi.l #255,d2
    2d98:	66dc           	bne.s 2d76 <ZoomTest+0x1656>
    2d9a:	2c2f 0030      	move.l 48(sp),d6
    2d9e:	0686 0000 2dc0 	addi.l #11712,d6
    2da4:	2c42           	movea.l d2,a6
    2da6:	2e0a           	move.l a2,d7
    2da8:	2446           	movea.l d6,a2
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    2daa:	7c00           	moveq #0,d6
    2dac:	3c05           	move.w d5,d6
    2dae:	2f0e           	move.l a6,-(sp)
    2db0:	2f06           	move.l d6,-(sp)
    2db2:	2f0a           	move.l a2,-(sp)
    2db4:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2dba:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    2dbc:	486e 0001      	pea 1(a6)
    2dc0:	2f06           	move.l d6,-(sp)
    2dc2:	486a 0030      	pea 48(a2)
    2dc6:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2dcc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2dce:	4645           	not.w d5
    2dd0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2dd2:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<7;i++) {
    2dd6:	4fef 0020      	lea 32(sp),sp
    2dda:	bcfc 010d      	cmpa.w #269,a6
    2dde:	66ca           	bne.s 2daa <ZoomTest+0x168a>
    2de0:	2447           	movea.l d7,a2
  TestRow( valsupposed, valactual, mask, 269);
    2de2:	2f0e           	move.l a6,-(sp)
    2de4:	3f05           	move.w d5,-(sp)
    2de6:	4267           	clr.w -(sp)
    2de8:	206f 0038      	movea.l 56(sp),a0
    2dec:	4868 3060      	pea 12384(a0)
    2df0:	4879 0001 75d0 	pea 175d0 <destlinezoom8>
    2df6:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    2df8:	4878 0001      	pea 1 <_start+0x1>
    2dfc:	4878 0008      	pea 8 <main+0x2>
    2e00:	2f0c           	move.l a4,-(sp)
    2e02:	2f03           	move.l d3,-(sp)
    2e04:	4eba df82      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2e08:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    2e0e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2e12:	4fef 001c      	lea 28(sp),sp
    2e16:	4297           	clr.l (sp)
    2e18:	42a7           	clr.l -(sp)
    2e1a:	2f2f 003c      	move.l 60(sp),-(sp)
    2e1e:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2e24:	4e95           	jsr (a5)
    2e26:	4fef 0010      	lea 16(sp),sp
    2e2a:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    2e2e:	7cff           	moveq #-1,d6
    2e30:	2e0a           	move.l a2,d7
    2e32:	246f 0048      	movea.l 72(sp),a2
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    2e36:	7a00           	moveq #0,d5
    2e38:	3a06           	move.w d6,d5
    2e3a:	2f0e           	move.l a6,-(sp)
    2e3c:	2f05           	move.l d5,-(sp)
    2e3e:	2f0a           	move.l a2,-(sp)
    2e40:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2e46:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    2e48:	486e 0001      	pea 1(a6)
    2e4c:	2f05           	move.l d5,-(sp)
    2e4e:	486a 0030      	pea 48(a2)
    2e52:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2e58:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2e5a:	4646           	not.w d6
    2e5c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2e5e:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<3;i++) {
    2e62:	4fef 0020      	lea 32(sp),sp
    2e66:	7007           	moveq #7,d0
    2e68:	b08e           	cmp.l a6,d0
    2e6a:	66ca           	bne.s 2e36 <ZoomTest+0x1716>
    2e6c:	2a2f 004c      	move.l 76(sp),d5
    2e70:	307c 0014      	movea.w #20,a0
    2e74:	2f47 0030      	move.l d7,48(sp)
    2e78:	2f4b 0048      	move.l a3,72(sp)
    2e7c:	2f42 004c      	move.l d2,76(sp)
    2e80:	2448           	movea.l a0,a2
    2e82:	2c45           	movea.l d5,a6
    2e84:	4dee fe50      	lea -432(a6),a6
    2e88:	47ea fff7      	lea -9(a2),a3
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    2e8c:	2f0b           	move.l a3,-(sp)
    2e8e:	3f06           	move.w d6,-(sp)
    2e90:	4267           	clr.w -(sp)
    2e92:	2f0e           	move.l a6,-(sp)
    2e94:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2e9a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2e9c:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    2ea0:	4646           	not.w d6
    2ea2:	528b           	addq.l #1,a3
    for(int i2=0;i2<9;i2++) {  
    2ea4:	4fef 0010      	lea 16(sp),sp
    2ea8:	ba8e           	cmp.l a6,d5
    2eaa:	66e0           	bne.s 2e8c <ZoomTest+0x176c>
    2eac:	2e0a           	move.l a2,d7
    2eae:	47ea 0009      	lea 9(a2),a3
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    2eb2:	7400           	moveq #0,d2
    2eb4:	3406           	move.w d6,d2
    2eb6:	2f07           	move.l d7,-(sp)
    2eb8:	2f02           	move.l d2,-(sp)
    2eba:	2f0e           	move.l a6,-(sp)
    2ebc:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2ec2:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    2ec4:	5287           	addq.l #1,d7
    2ec6:	2f07           	move.l d7,-(sp)
    2ec8:	2f02           	move.l d2,-(sp)
    2eca:	486e 0030      	pea 48(a6)
    2ece:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2ed4:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    2ed6:	4646           	not.w d6
      valactual += ZMLINESIZE/2;
    2ed8:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    2edc:	4fef 0020      	lea 32(sp),sp
    2ee0:	be8b           	cmp.l a3,d7
    2ee2:	66ce           	bne.s 2eb2 <ZoomTest+0x1792>
    2ee4:	0685 0000 0510 	addi.l #1296,d5
    2eea:	45ea 001b      	lea 27(a2),a2
  for(int i=0;i<9;i++) {
    2eee:	b4fc 0107      	cmpa.w #263,a2
    2ef2:	668e           	bne.s 2e82 <ZoomTest+0x1762>
    2ef4:	246f 0030      	movea.l 48(sp),a2
    2ef8:	266f 0048      	movea.l 72(sp),a3
    2efc:	242f 004c      	move.l 76(sp),d2
    2f00:	41ec 2ee4      	lea 12004(a4),a0
    2f04:	2f48 0030      	move.l a0,48(sp)
    2f08:	2c48           	movea.l a0,a6
    TestRow( valsupposed, valactual, mask, 245+i2);
    2f0a:	2f0a           	move.l a2,-(sp)
    2f0c:	3f06           	move.w d6,-(sp)
    2f0e:	4267           	clr.w -(sp)
    2f10:	2f0e           	move.l a6,-(sp)
    2f12:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2f18:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    2f1a:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2f1e:	4646           	not.w d6
    2f20:	528a           	addq.l #1,a2
  for(int i2=0;i2<9;i2++) {  
    2f22:	4fef 0010      	lea 16(sp),sp
    2f26:	b4fc 00fe      	cmpa.w #254,a2
    2f2a:	66de           	bne.s 2f0a <ZoomTest+0x17ea>
    2f2c:	45ec 3094      	lea 12436(a4),a2
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    2f30:	7a00           	moveq #0,d5
    2f32:	3a06           	move.w d6,d5
    2f34:	2f0b           	move.l a3,-(sp)
    2f36:	2f05           	move.l d5,-(sp)
    2f38:	2f0a           	move.l a2,-(sp)
    2f3a:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2f40:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    2f42:	486b 0001      	pea 1(a3)
    2f46:	2f05           	move.l d5,-(sp)
    2f48:	486a 0030      	pea 48(a2)
    2f4c:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2f52:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    2f54:	4646           	not.w d6
    2f56:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2f58:	45ea 0060      	lea 96(a2),a2
  for(int i=0;i<5;i++) {
    2f5c:	4fef 0020      	lea 32(sp),sp
    2f60:	b6fc 010d      	cmpa.w #269,a3
    2f64:	66ca           	bne.s 2f30 <ZoomTest+0x1810>
  TestRow( valsupposed, valactual, mask, 269);
    2f66:	2f0b           	move.l a3,-(sp)
    2f68:	3f06           	move.w d6,-(sp)
    2f6a:	4267           	clr.w -(sp)
    2f6c:	2f2f 0044      	move.l 68(sp),-(sp)
    2f70:	4879 0001 75a4 	pea 175a4 <destlinezoom9>
    2f76:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    2f78:	4878 0001      	pea 1 <_start+0x1>
    2f7c:	4878 0009      	pea 9 <main+0x3>
    2f80:	2f03           	move.l d3,-(sp)
    2f82:	2f0c           	move.l a4,-(sp)
    2f84:	4eba de02      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    2f88:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    2f8e:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    2f92:	4fef 001c      	lea 28(sp),sp
    2f96:	4297           	clr.l (sp)
    2f98:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2f9e:	2f2f 0034      	move.l 52(sp),-(sp)
    2fa2:	4879 0001 7578 	pea 17578 <destlinezoom10>
    2fa8:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 1);   
    2faa:	4878 0001      	pea 1 <_start+0x1>
    2fae:	42a7           	clr.l -(sp)
    2fb0:	2f2f 0058      	move.l 88(sp),-(sp)
    2fb4:	4879 0001 7578 	pea 17578 <destlinezoom10>
    2fba:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 2);
    2fbc:	4fef 0020      	lea 32(sp),sp
    2fc0:	4878 0002      	pea 2 <_start+0x2>
    2fc4:	42a7           	clr.l -(sp)
    2fc6:	2f2f 0058      	move.l 88(sp),-(sp)
    2fca:	4879 0001 7578 	pea 17578 <destlinezoom10>
    2fd0:	4e95           	jsr (a5)
  for(int i=0;i<9;i++) {
    2fd2:	2a2f 0070      	move.l 112(sp),d5
    2fd6:	4fef 0010      	lea 16(sp),sp
  mask = mask ^ 0xffff;
    2fda:	7eff           	moveq #-1,d7
    2fdc:	2644           	movea.l d4,a3
    2fde:	2445           	movea.l d5,a2
    2fe0:	45ea fe80      	lea -384(a2),a2
    2fe4:	280b           	move.l a3,d4
    2fe6:	5184           	subq.l #8,d4
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    2fe8:	2f04           	move.l d4,-(sp)
    2fea:	3f07           	move.w d7,-(sp)
    2fec:	4267           	clr.w -(sp)
    2fee:	2f0a           	move.l a2,-(sp)
    2ff0:	4879 0001 7578 	pea 17578 <destlinezoom10>
    2ff6:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    2ff8:	45ea 0030      	lea 48(a2),a2
      mask = mask ^ 0xffff;
    2ffc:	4647           	not.w d7
    2ffe:	5284           	addq.l #1,d4
    for(int i2=0;i2<8;i2++) {  
    3000:	4fef 0010      	lea 16(sp),sp
    3004:	ba8a           	cmp.l a2,d5
    3006:	66e0           	bne.s 2fe8 <ZoomTest+0x18c8>
    3008:	280b           	move.l a3,d4
    300a:	4dea 03c0      	lea 960(a2),a6
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    300e:	7c00           	moveq #0,d6
    3010:	3c07           	move.w d7,d6
    3012:	2f04           	move.l d4,-(sp)
    3014:	2f06           	move.l d6,-(sp)
    3016:	2f0a           	move.l a2,-(sp)
    3018:	4879 0001 7578 	pea 17578 <destlinezoom10>
    301e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    3020:	2f04           	move.l d4,-(sp)
    3022:	2f06           	move.l d6,-(sp)
    3024:	486a 0030      	pea 48(a2)
    3028:	4879 0001 7578 	pea 17578 <destlinezoom10>
    302e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3030:	45ea 0060      	lea 96(a2),a2
      mask = mask ^ 0xffff;
    3034:	4647           	not.w d7
    3036:	5284           	addq.l #1,d4
    for(int i2=0;i2<10;i2++) {
    3038:	4fef 0020      	lea 32(sp),sp
    303c:	bdca           	cmpa.l a2,a6
    303e:	66ce           	bne.s 300e <ZoomTest+0x18ee>
    3040:	0685 0000 0540 	addi.l #1344,d5
    3046:	47eb 001c      	lea 28(a3),a3
  for(int i=0;i<9;i++) {
    304a:	b6fc 0107      	cmpa.w #263,a3
    304e:	668e           	bne.s 2fde <ZoomTest+0x18be>
    3050:	246f 0064      	movea.l 100(sp),a2
    TestRow( valsupposed, valactual, mask, 255+i2);
    3054:	2f02           	move.l d2,-(sp)
    3056:	3f07           	move.w d7,-(sp)
    3058:	4267           	clr.w -(sp)
    305a:	2f0a           	move.l a2,-(sp)
    305c:	4879 0001 7578 	pea 17578 <destlinezoom10>
    3062:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3064:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3068:	4647           	not.w d7
    306a:	5282           	addq.l #1,d2
  for(int i2=0;i2<8;i2++) {  
    306c:	4fef 0010      	lea 16(sp),sp
    3070:	0c82 0000 0107 	cmpi.l #263,d2
    3076:	66dc           	bne.s 3054 <ZoomTest+0x1934>
    3078:	2c43           	movea.l d3,a6
    307a:	4dee 3154      	lea 12628(a6),a6
    307e:	347c 0108      	movea.w #264,a2
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    3082:	7400           	moveq #0,d2
    3084:	3407           	move.w d7,d2
    3086:	486a ffff      	pea -1(a2)
    308a:	2f02           	move.l d2,-(sp)
    308c:	2f0e           	move.l a6,-(sp)
    308e:	4879 0001 7578 	pea 17578 <destlinezoom10>
    3094:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    3096:	2f0a           	move.l a2,-(sp)
    3098:	2f02           	move.l d2,-(sp)
    309a:	486e 0030      	pea 48(a6)
    309e:	4879 0001 7578 	pea 17578 <destlinezoom10>
    30a4:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    30a6:	4647           	not.w d7
    30a8:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    30aa:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    30ae:	4fef 0020      	lea 32(sp),sp
    30b2:	b4fc 010e      	cmpa.w #270,a2
    30b6:	66ca           	bne.s 3082 <ZoomTest+0x1962>
  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    30b8:	4878 0001      	pea 1 <_start+0x1>
    30bc:	4878 000a      	pea a <main+0x4>
    30c0:	2f0c           	move.l a4,-(sp)
    30c2:	2f03           	move.l d3,-(sp)
    30c4:	4eba dcc2      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    30c8:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    30ce:	4eae ff1c      	jsr -228(a6)
    30d2:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    30d6:	246f 0034      	movea.l 52(sp),a2
  for(int i2=0;i2<6;i2++) {  
    30da:	7800           	moveq #0,d4
  mask = 0xffff;
    30dc:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    30de:	2f04           	move.l d4,-(sp)
    30e0:	3f02           	move.w d2,-(sp)
    30e2:	4267           	clr.w -(sp)
    30e4:	2f0a           	move.l a2,-(sp)
    30e6:	4879 0001 754c 	pea 1754c <destlinezoom11>
    30ec:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    30ee:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    30f2:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    30f4:	5284           	addq.l #1,d4
    30f6:	4fef 0010      	lea 16(sp),sp
    30fa:	7006           	moveq #6,d0
    30fc:	b084           	cmp.l d4,d0
    30fe:	66de           	bne.s 30de <ZoomTest+0x19be>
    3100:	266f 0054      	movea.l 84(sp),a3
    3104:	347c 0006      	movea.w #6,a2
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    3108:	7800           	moveq #0,d4
    310a:	3802           	move.w d2,d4
    310c:	2f0a           	move.l a2,-(sp)
    310e:	2f04           	move.l d4,-(sp)
    3110:	2f0b           	move.l a3,-(sp)
    3112:	4879 0001 754c 	pea 1754c <destlinezoom11>
    3118:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    311a:	486a 0001      	pea 1(a2)
    311e:	2f04           	move.l d4,-(sp)
    3120:	486b 0030      	pea 48(a3)
    3124:	4879 0001 754c 	pea 1754c <destlinezoom11>
    312a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    312c:	4642           	not.w d2
    312e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3130:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    3134:	4fef 0020      	lea 32(sp),sp
    3138:	721c           	moveq #28,d1
    313a:	b28a           	cmp.l a2,d1
    313c:	66ca           	bne.s 3108 <ZoomTest+0x19e8>
    313e:	280c           	move.l a4,d4
    3140:	0684 0000 0694 	addi.l #1684,d4
    3146:	347c 0023      	movea.w #35,a2
    314a:	2644           	movea.l d4,a3
    314c:	47eb feb0      	lea -336(a3),a3
    3150:	2a0a           	move.l a2,d5
    3152:	5f85           	subq.l #7,d5
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    3154:	2f05           	move.l d5,-(sp)
    3156:	3f02           	move.w d2,-(sp)
    3158:	4267           	clr.w -(sp)
    315a:	2f0b           	move.l a3,-(sp)
    315c:	4879 0001 754c 	pea 1754c <destlinezoom11>
    3162:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3164:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    3168:	4642           	not.w d2
    316a:	5285           	addq.l #1,d5
    for(int i2=0;i2<7;i2++) {  
    316c:	4fef 0010      	lea 16(sp),sp
    3170:	b88b           	cmp.l a3,d4
    3172:	66e0           	bne.s 3154 <ZoomTest+0x1a34>
    3174:	2c4a           	movea.l a2,a6
    3176:	2c0b           	move.l a3,d6
    3178:	0686 0000 0420 	addi.l #1056,d6
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    317e:	7a00           	moveq #0,d5
    3180:	3a02           	move.w d2,d5
    3182:	2f0e           	move.l a6,-(sp)
    3184:	2f05           	move.l d5,-(sp)
    3186:	2f0b           	move.l a3,-(sp)
    3188:	4879 0001 754c 	pea 1754c <destlinezoom11>
    318e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    3190:	486e ffe8      	pea -24(a6)
    3194:	2f05           	move.l d5,-(sp)
    3196:	486b 0030      	pea 48(a3)
    319a:	4879 0001 754c 	pea 1754c <destlinezoom11>
    31a0:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    31a2:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    31a6:	4642           	not.w d2
    31a8:	548e           	addq.l #2,a6
    for(int i2=0;i2<11;i2++) {
    31aa:	4fef 0020      	lea 32(sp),sp
    31ae:	bc8b           	cmp.l a3,d6
    31b0:	66cc           	bne.s 317e <ZoomTest+0x1a5e>
    31b2:	0684 0000 0570 	addi.l #1392,d4
    31b8:	45ea 001d      	lea 29(a2),a2
  for(int i=0;i<8;i++) {
    31bc:	b4fc 010b      	cmpa.w #267,a2
    31c0:	6688           	bne.s 314a <ZoomTest+0x1a2a>
    31c2:	45ec 30c4      	lea 12484(a4),a2
    31c6:	2a3c 0000 0104 	move.l #260,d5
    TestRow( valsupposed, valactual, mask, 260+i2);
    31cc:	7800           	moveq #0,d4
    31ce:	3802           	move.w d2,d4
    31d0:	2f05           	move.l d5,-(sp)
    31d2:	2f04           	move.l d4,-(sp)
    31d4:	2f0a           	move.l a2,-(sp)
    31d6:	4879 0001 754c 	pea 1754c <destlinezoom11>
    31dc:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    31de:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    31e2:	4642           	not.w d2
    31e4:	5285           	addq.l #1,d5
  for(int i2=0;i2<7;i2++) {  
    31e6:	4fef 0010      	lea 16(sp),sp
    31ea:	0c85 0000 010b 	cmpi.l #267,d5
    31f0:	66da           	bne.s 31cc <ZoomTest+0x1aac>
    31f2:	0282 0000 ffff 	andi.l #65535,d2
  TestRow( valsupposed, valactual, mask, 267);   
    31f8:	2f05           	move.l d5,-(sp)
    31fa:	2f02           	move.l d2,-(sp)
    31fc:	2f2f 0060      	move.l 96(sp),-(sp)
    3200:	4879 0001 754c 	pea 1754c <destlinezoom11>
    3206:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 268);
    3208:	4878 010c      	pea 10c <main+0x106>
    320c:	2f02           	move.l d2,-(sp)
    320e:	2f2f 0074      	move.l 116(sp),-(sp)
    3212:	4879 0001 754c 	pea 1754c <destlinezoom11>
    3218:	4e95           	jsr (a5)
  TestRow( valsupposed, valactual, mask, 269);
    321a:	4fef 0020      	lea 32(sp),sp
    321e:	4878 010d      	pea 10d <main+0x107>
    3222:	2f04           	move.l d4,-(sp)
    3224:	2f2f 0044      	move.l 68(sp),-(sp)
    3228:	4879 0001 754c 	pea 1754c <destlinezoom11>
    322e:	4e95           	jsr (a5)
  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    3230:	4878 0001      	pea 1 <_start+0x1>
    3234:	4878 000b      	pea b <main+0x5>
    3238:	2f03           	move.l d3,-(sp)
    323a:	2f0c           	move.l a4,-(sp)
    323c:	4eba db4a      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3240:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    3246:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    324a:	4fef 001c      	lea 28(sp),sp
    324e:	4297           	clr.l (sp)
    3250:	42a7           	clr.l -(sp)
    3252:	2f2f 0034      	move.l 52(sp),-(sp)
    3256:	4879 0001 7520 	pea 17520 <destlinezoom12>
    325c:	4e95           	jsr (a5)
    325e:	4fef 0010      	lea 16(sp),sp
    3262:	282f 0038      	move.l 56(sp),d4
  valactual += ZMLINESIZE/2;
    3266:	266f 0040      	movea.l 64(sp),a3
  TestRow( valsupposed, valactual, mask, 0);
    326a:	347c 0001      	movea.w #1,a2
  mask = mask ^ 0xffff;
    326e:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3270:	7a00           	moveq #0,d5
    3272:	3a02           	move.w d2,d5
    3274:	2f0a           	move.l a2,-(sp)
    3276:	2f05           	move.l d5,-(sp)
    3278:	2f0b           	move.l a3,-(sp)
    327a:	4879 0001 7520 	pea 17520 <destlinezoom12>
    3280:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3282:	486a 0001      	pea 1(a2)
    3286:	2f05           	move.l d5,-(sp)
    3288:	486b 0030      	pea 48(a3)
    328c:	4879 0001 7520 	pea 17520 <destlinezoom12>
    3292:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3294:	4642           	not.w d2
    3296:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    3298:	4fef 0020      	lea 32(sp),sp
    329c:	7019           	moveq #25,d0
    329e:	b08a           	cmp.l a2,d0
    32a0:	673e           	beq.s 32e0 <ZoomTest+0x1bc0>
    32a2:	200b           	move.l a3,d0
    32a4:	0680 0000 00c0 	addi.l #192,d0
    32aa:	2644           	movea.l d4,a3
    32ac:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    32ae:	7a00           	moveq #0,d5
    32b0:	3a02           	move.w d2,d5
    32b2:	2f0a           	move.l a2,-(sp)
    32b4:	2f05           	move.l d5,-(sp)
    32b6:	2f0b           	move.l a3,-(sp)
    32b8:	4879 0001 7520 	pea 17520 <destlinezoom12>
    32be:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    32c0:	486a 0001      	pea 1(a2)
    32c4:	2f05           	move.l d5,-(sp)
    32c6:	486b 0030      	pea 48(a3)
    32ca:	4879 0001 7520 	pea 17520 <destlinezoom12>
    32d0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    32d2:	4642           	not.w d2
    32d4:	548a           	addq.l #2,a2
  for(int i2=0;i2<12;i2++) {
    32d6:	4fef 0020      	lea 32(sp),sp
    32da:	7019           	moveq #25,d0
    32dc:	b08a           	cmp.l a2,d0
    32de:	66c2           	bne.s 32a2 <ZoomTest+0x1b82>
    32e0:	2a04           	move.l d4,d5
    32e2:	0685 0000 0120 	addi.l #288,d5
    32e8:	347c 001f      	movea.w #31,a2
    32ec:	2645           	movea.l d5,a3
    32ee:	47eb fee0      	lea -288(a3),a3
    32f2:	2c0a           	move.l a2,d6
    32f4:	5d86           	subq.l #6,d6
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    32f6:	2f06           	move.l d6,-(sp)
    32f8:	3f02           	move.w d2,-(sp)
    32fa:	4267           	clr.w -(sp)
    32fc:	2f0b           	move.l a3,-(sp)
    32fe:	4879 0001 7520 	pea 17520 <destlinezoom12>
    3304:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3306:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    330a:	4642           	not.w d2
    330c:	5286           	addq.l #1,d6
    for(int i2=0;i2<6;i2++) {  
    330e:	4fef 0010      	lea 16(sp),sp
    3312:	ba8b           	cmp.l a3,d5
    3314:	66e0           	bne.s 32f6 <ZoomTest+0x1bd6>
    3316:	2c4a           	movea.l a2,a6
    3318:	2e0b           	move.l a3,d7
    331a:	0687 0000 0480 	addi.l #1152,d7
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    3320:	7c00           	moveq #0,d6
    3322:	3c02           	move.w d2,d6
    3324:	2f0e           	move.l a6,-(sp)
    3326:	2f06           	move.l d6,-(sp)
    3328:	2f0b           	move.l a3,-(sp)
    332a:	4879 0001 7520 	pea 17520 <destlinezoom12>
    3330:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    3332:	486e 0001      	pea 1(a6)
    3336:	2f06           	move.l d6,-(sp)
    3338:	486b 0030      	pea 48(a3)
    333c:	4879 0001 7520 	pea 17520 <destlinezoom12>
    3342:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3344:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    3348:	4642           	not.w d2
    334a:	548e           	addq.l #2,a6
    for(int i2=0;i2<12;i2++) {
    334c:	4fef 0020      	lea 32(sp),sp
    3350:	be8b           	cmp.l a3,d7
    3352:	66cc           	bne.s 3320 <ZoomTest+0x1c00>
    3354:	0685 0000 05a0 	addi.l #1440,d5
    335a:	45ea 001e      	lea 30(a2),a2
  for(int i=0;i<8;i++) {
    335e:	b4fc 010f      	cmpa.w #271,a2
    3362:	6688           	bne.s 32ec <ZoomTest+0x1bcc>
    3364:	2444           	movea.l d4,a2
    3366:	45ea 2d00      	lea 11520(a2),a2
    336a:	283c 0000 0104 	move.l #260,d4
    TestRow( valsupposed, valactual, mask, 260+i2);
    3370:	2f04           	move.l d4,-(sp)
    3372:	3f02           	move.w d2,-(sp)
    3374:	4267           	clr.w -(sp)
    3376:	2f0a           	move.l a2,-(sp)
    3378:	4879 0001 7520 	pea 17520 <destlinezoom12>
    337e:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    3380:	45ea 0030      	lea 48(a2),a2
    mask = mask ^ 0xffff;
    3384:	4642           	not.w d2
    3386:	5284           	addq.l #1,d4
  for(int i2=0;i2<5;i2++) {  
    3388:	4fef 0010      	lea 16(sp),sp
    338c:	0c84 0000 0109 	cmpi.l #265,d4
    3392:	66dc           	bne.s 3370 <ZoomTest+0x1c50>
  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    3394:	4878 0001      	pea 1 <_start+0x1>
    3398:	4878 000c      	pea c <main+0x6>
    339c:	2f0c           	move.l a4,-(sp)
    339e:	2f03           	move.l d3,-(sp)
    33a0:	4eba d9e6      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    33a4:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    33aa:	4eae ff1c      	jsr -228(a6)
    33ae:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    33b2:	266f 0034      	movea.l 52(sp),a3
  WaitBlit();
    33b6:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    33ba:	7cff           	moveq #-1,d6
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    33bc:	7400           	moveq #0,d2
    33be:	3406           	move.w d6,d2
    33c0:	486a ffff      	pea -1(a2)
    33c4:	2f02           	move.l d2,-(sp)
    33c6:	2f0b           	move.l a3,-(sp)
    33c8:	4879 0001 74f4 	pea 174f4 <destlinezoom13>
    33ce:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    33d0:	2f0a           	move.l a2,-(sp)
    33d2:	2f02           	move.l d2,-(sp)
    33d4:	486b 0030      	pea 48(a3)
    33d8:	4879 0001 74f4 	pea 174f4 <destlinezoom13>
    33de:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    33e0:	4646           	not.w d6
    33e2:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    33e4:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<11;i2++) {
    33e8:	4fef 0020      	lea 32(sp),sp
    33ec:	7217           	moveq #23,d1
    33ee:	b28a           	cmp.l a2,d1
    33f0:	66ca           	bne.s 33bc <ZoomTest+0x1c9c>
    33f2:	240c           	move.l a4,d2
    33f4:	0682 0000 0514 	addi.l #1300,d2
    33fa:	3c7c 001b      	movea.w #27,a6
    33fe:	2a0a           	move.l a2,d5
    3400:	2642           	movea.l d2,a3
    3402:	47eb ff10      	lea -240(a3),a3
    3406:	280e           	move.l a6,d4
    3408:	5b84           	subq.l #5,d4
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    340a:	2f04           	move.l d4,-(sp)
    340c:	3f06           	move.w d6,-(sp)
    340e:	4267           	clr.w -(sp)
    3410:	2f0b           	move.l a3,-(sp)
    3412:	4879 0001 74f4 	pea 174f4 <destlinezoom13>
    3418:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    341a:	47eb 0030      	lea 48(a3),a3
      mask = mask ^ 0xffff;
    341e:	4646           	not.w d6
    3420:	5284           	addq.l #1,d4
    for(int i2=0;i2<5;i2++) {  
    3422:	4fef 0010      	lea 16(sp),sp
    3426:	b48b           	cmp.l a3,d2
    3428:	66e0           	bne.s 340a <ZoomTest+0x1cea>
    342a:	244e           	movea.l a6,a2
    342c:	2e0b           	move.l a3,d7
    342e:	0687 0000 04e0 	addi.l #1248,d7
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    3434:	7800           	moveq #0,d4
    3436:	3806           	move.w d6,d4
    3438:	2f0a           	move.l a2,-(sp)
    343a:	2f04           	move.l d4,-(sp)
    343c:	2f0b           	move.l a3,-(sp)
    343e:	4879 0001 74f4 	pea 174f4 <destlinezoom13>
    3444:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    3446:	486a 0001      	pea 1(a2)
    344a:	2f04           	move.l d4,-(sp)
    344c:	486b 0030      	pea 48(a3)
    3450:	4879 0001 74f4 	pea 174f4 <destlinezoom13>
    3456:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3458:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    345c:	4646           	not.w d6
    345e:	548a           	addq.l #2,a2
    for(int i2=0;i2<13;i2++) {
    3460:	4fef 0020      	lea 32(sp),sp
    3464:	be8b           	cmp.l a3,d7
    3466:	66cc           	bne.s 3434 <ZoomTest+0x1d14>
    3468:	0682 0000 05d0 	addi.l #1488,d2
    346e:	4dee 001f      	lea 31(a6),a6
  for(int i=0;i<8;i++) {
    3472:	bcfc 0113      	cmpa.w #275,a6
    3476:	6688           	bne.s 3400 <ZoomTest+0x1ce0>
    3478:	2445           	movea.l d5,a2
  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    347a:	4878 0001      	pea 1 <_start+0x1>
    347e:	4878 000d      	pea d <main+0x7>
    3482:	2f03           	move.l d3,-(sp)
    3484:	2f0c           	move.l a4,-(sp)
    3486:	4eba d900      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    348a:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    3490:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3494:	42a7           	clr.l -(sp)
    3496:	2f3c 0000 ffff 	move.l #65535,-(sp)
    349c:	2f2f 0044      	move.l 68(sp),-(sp)
    34a0:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    34a6:	4e95           	jsr (a5)
    34a8:	4fef 0020      	lea 32(sp),sp
    34ac:	242f 0038      	move.l 56(sp),d2
  valactual += ZMLINESIZE/2; 
    34b0:	2c6f 0040      	movea.l 64(sp),a6
  TestRow( valsupposed, valactual, mask, 0);   
    34b4:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff; 
    34b8:	4247           	clr.w d7
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    34ba:	7800           	moveq #0,d4
    34bc:	3807           	move.w d7,d4
    34be:	2f0b           	move.l a3,-(sp)
    34c0:	2f04           	move.l d4,-(sp)
    34c2:	2f0e           	move.l a6,-(sp)
    34c4:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    34ca:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    34cc:	486b 0001      	pea 1(a3)
    34d0:	2f04           	move.l d4,-(sp)
    34d2:	486e 0030      	pea 48(a6)
    34d6:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    34dc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    34de:	4647           	not.w d7
    34e0:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    34e2:	4fef 0020      	lea 32(sp),sp
    34e6:	7013           	moveq #19,d0
    34e8:	b08b           	cmp.l a3,d0
    34ea:	673e           	beq.s 352a <ZoomTest+0x1e0a>
    34ec:	200e           	move.l a6,d0
    34ee:	0680 0000 00c0 	addi.l #192,d0
    34f4:	2c42           	movea.l d2,a6
    34f6:	2400           	move.l d0,d2
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    34f8:	7800           	moveq #0,d4
    34fa:	3807           	move.w d7,d4
    34fc:	2f0b           	move.l a3,-(sp)
    34fe:	2f04           	move.l d4,-(sp)
    3500:	2f0e           	move.l a6,-(sp)
    3502:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    3508:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    350a:	486b 0001      	pea 1(a3)
    350e:	2f04           	move.l d4,-(sp)
    3510:	486e 0030      	pea 48(a6)
    3514:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    351a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    351c:	4647           	not.w d7
    351e:	548b           	addq.l #2,a3
  for(int i2=0;i2<9;i2++) {
    3520:	4fef 0020      	lea 32(sp),sp
    3524:	7013           	moveq #19,d0
    3526:	b08b           	cmp.l a3,d0
    3528:	66c2           	bne.s 34ec <ZoomTest+0x1dcc>
    352a:	2802           	move.l d2,d4
    352c:	0684 0000 00c0 	addi.l #192,d4
    3532:	2c0b           	move.l a3,d6
    3534:	2c44           	movea.l d4,a6
    3536:	4dee ff40      	lea -192(a6),a6
    353a:	2a0a           	move.l a2,d5
    353c:	5985           	subq.l #4,d5
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    353e:	2f05           	move.l d5,-(sp)
    3540:	3f07           	move.w d7,-(sp)
    3542:	4267           	clr.w -(sp)
    3544:	2f0e           	move.l a6,-(sp)
    3546:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    354c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    354e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    3552:	4647           	not.w d7
    3554:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    3556:	4fef 0010      	lea 16(sp),sp
    355a:	b88e           	cmp.l a6,d4
    355c:	66e0           	bne.s 353e <ZoomTest+0x1e1e>
    355e:	264a           	movea.l a2,a3
    3560:	41ee 0540      	lea 1344(a6),a0
    3564:	2f48 003c      	move.l a0,60(sp)
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    3568:	7a00           	moveq #0,d5
    356a:	3a07           	move.w d7,d5
    356c:	2f0b           	move.l a3,-(sp)
    356e:	2f05           	move.l d5,-(sp)
    3570:	2f0e           	move.l a6,-(sp)
    3572:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    3578:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    357a:	486b 0001      	pea 1(a3)
    357e:	2f05           	move.l d5,-(sp)
    3580:	486e 0030      	pea 48(a6)
    3584:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    358a:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    358c:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3590:	4647           	not.w d7
    3592:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    3594:	4fef 0020      	lea 32(sp),sp
    3598:	bdef 003c      	cmpa.l 60(sp),a6
    359c:	66ca           	bne.s 3568 <ZoomTest+0x1e48>
    359e:	0684 0000 0600 	addi.l #1536,d4
    35a4:	45ea 0020      	lea 32(a2),a2
  for(int i=0;i<7;i++) {
    35a8:	b4fc 00f7      	cmpa.w #247,a2
    35ac:	6686           	bne.s 3534 <ZoomTest+0x1e14>
    35ae:	2646           	movea.l d6,a3
    35b0:	2c42           	movea.l d2,a6
    35b2:	4dee 2a00      	lea 10752(a6),a6
    35b6:	347c 00f3      	movea.w #243,a2
    TestRow( valsupposed, valactual, mask, 243+i2);
    35ba:	2f0a           	move.l a2,-(sp)
    35bc:	3f07           	move.w d7,-(sp)
    35be:	4267           	clr.w -(sp)
    35c0:	2f0e           	move.l a6,-(sp)
    35c2:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    35c8:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    35ca:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    35ce:	4647           	not.w d7
    35d0:	528a           	addq.l #1,a2
  for(int i2=0;i2<4;i2++) {  
    35d2:	4fef 0010      	lea 16(sp),sp
    35d6:	b4fc 00f7      	cmpa.w #247,a2
    35da:	66de           	bne.s 35ba <ZoomTest+0x1e9a>
    35dc:	0682 0000 2ac0 	addi.l #10944,d2
    35e2:	2c4a           	movea.l a2,a6
    35e4:	280a           	move.l a2,d4
    35e6:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    35e8:	7400           	moveq #0,d2
    35ea:	3407           	move.w d7,d2
    35ec:	2f0e           	move.l a6,-(sp)
    35ee:	2f02           	move.l d2,-(sp)
    35f0:	2f0a           	move.l a2,-(sp)
    35f2:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    35f8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    35fa:	486e 0001      	pea 1(a6)
    35fe:	2f02           	move.l d2,-(sp)
    3600:	486a 0030      	pea 48(a2)
    3604:	4879 0001 74c8 	pea 174c8 <destlinezoom14>
    360a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    360c:	4647           	not.w d7
    360e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3610:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<12;i2++) {
    3614:	4fef 0020      	lea 32(sp),sp
    3618:	bcfc 010f      	cmpa.w #271,a6
    361c:	66ca           	bne.s 35e8 <ZoomTest+0x1ec8>
  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    361e:	4878 0001      	pea 1 <_start+0x1>
    3622:	4878 000e      	pea e <main+0x8>
    3626:	2f0c           	move.l a4,-(sp)
    3628:	2f03           	move.l d3,-(sp)
    362a:	4eba d75c      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    362e:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    3634:	4eae ff1c      	jsr -228(a6)
    3638:	4fef 0010      	lea 16(sp),sp
  valactual = destination+2; 
    363c:	242f 0034      	move.l 52(sp),d2
  WaitBlit();
    3640:	3c7c 0001      	movea.w #1,a6
  mask = 0x0000;
    3644:	4246           	clr.w d6
    3646:	2442           	movea.l d2,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3648:	7400           	moveq #0,d2
    364a:	3406           	move.w d6,d2
    364c:	486e ffff      	pea -1(a6)
    3650:	2f02           	move.l d2,-(sp)
    3652:	2f0a           	move.l a2,-(sp)
    3654:	4879 0001 749c 	pea 1749c <destlinezoom15>
    365a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    365c:	2f0e           	move.l a6,-(sp)
    365e:	2f02           	move.l d2,-(sp)
    3660:	486a 0030      	pea 48(a2)
    3664:	4879 0001 749c 	pea 1749c <destlinezoom15>
    366a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    366c:	4646           	not.w d6
    366e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    3670:	45ea 0060      	lea 96(a2),a2
  for(int i2=0;i2<8;i2++) {
    3674:	4fef 0020      	lea 32(sp),sp
    3678:	7011           	moveq #17,d0
    367a:	b08e           	cmp.l a6,d0
    367c:	66ca           	bne.s 3648 <ZoomTest+0x1f28>
    367e:	2444           	movea.l d4,a2
    3680:	242f 0068      	move.l 104(sp),d2
    3684:	2c42           	movea.l d2,a6
    3686:	4dee ff70      	lea -144(a6),a6
    368a:	280b           	move.l a3,d4
    368c:	5784           	subq.l #3,d4
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    368e:	2f04           	move.l d4,-(sp)
    3690:	3f06           	move.w d6,-(sp)
    3692:	4267           	clr.w -(sp)
    3694:	2f0e           	move.l a6,-(sp)
    3696:	4879 0001 749c 	pea 1749c <destlinezoom15>
    369c:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    369e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    36a2:	4646           	not.w d6
    36a4:	5284           	addq.l #1,d4
    for(int i2=0;i2<3;i2++) {  
    36a6:	4fef 0010      	lea 16(sp),sp
    36aa:	b48e           	cmp.l a6,d2
    36ac:	66e0           	bne.s 368e <ZoomTest+0x1f6e>
    36ae:	280b           	move.l a3,d4
    36b0:	2e0e           	move.l a6,d7
    36b2:	0687 0000 05a0 	addi.l #1440,d7
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    36b8:	7a00           	moveq #0,d5
    36ba:	3a06           	move.w d6,d5
    36bc:	2f04           	move.l d4,-(sp)
    36be:	2f05           	move.l d5,-(sp)
    36c0:	2f0e           	move.l a6,-(sp)
    36c2:	4879 0001 749c 	pea 1749c <destlinezoom15>
    36c8:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    36ca:	2f04           	move.l d4,-(sp)
    36cc:	2f05           	move.l d5,-(sp)
    36ce:	486e 0030      	pea 48(a6)
    36d2:	4879 0001 749c 	pea 1749c <destlinezoom15>
    36d8:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    36da:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    36de:	4646           	not.w d6
    36e0:	5484           	addq.l #2,d4
    for(int i2=0;i2<15;i2++) {
    36e2:	4fef 0020      	lea 32(sp),sp
    36e6:	be8e           	cmp.l a6,d7
    36e8:	66ce           	bne.s 36b8 <ZoomTest+0x1f98>
    36ea:	0682 0000 0630 	addi.l #1584,d2
    36f0:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    36f4:	b6fc 00fa      	cmpa.w #250,a3
    36f8:	668a           	bne.s 3684 <ZoomTest+0x1f64>
    36fa:	47ec 2e54      	lea 11860(a4),a3
    TestRow( valsupposed, valactual, mask, 247+i2);
    36fe:	2f0a           	move.l a2,-(sp)
    3700:	3f06           	move.w d6,-(sp)
    3702:	4267           	clr.w -(sp)
    3704:	2f0b           	move.l a3,-(sp)
    3706:	4879 0001 749c 	pea 1749c <destlinezoom15>
    370c:	4e95           	jsr (a5)
    valactual += ZMLINESIZE/2;
    370e:	47eb 0030      	lea 48(a3),a3
    mask = mask ^ 0xffff;
    3712:	4646           	not.w d6
    3714:	528a           	addq.l #1,a2
  for(int i2=0;i2<3;i2++) {  
    3716:	4fef 0010      	lea 16(sp),sp
    371a:	b4fc 00fa      	cmpa.w #250,a2
    371e:	66de           	bne.s 36fe <ZoomTest+0x1fde>
    3720:	266f 0030      	movea.l 48(sp),a3
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    3724:	7400           	moveq #0,d2
    3726:	3406           	move.w d6,d2
    3728:	2f0a           	move.l a2,-(sp)
    372a:	2f02           	move.l d2,-(sp)
    372c:	2f0b           	move.l a3,-(sp)
    372e:	4879 0001 749c 	pea 1749c <destlinezoom15>
    3734:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    3736:	486a 0001      	pea 1(a2)
    373a:	2f02           	move.l d2,-(sp)
    373c:	486b 0030      	pea 48(a3)
    3740:	4879 0001 749c 	pea 1749c <destlinezoom15>
    3746:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3748:	4646           	not.w d6
    374a:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    374c:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<10;i2++) {
    3750:	4fef 0020      	lea 32(sp),sp
    3754:	b4fc 010e      	cmpa.w #270,a2
    3758:	66ca           	bne.s 3724 <ZoomTest+0x2004>
  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    375a:	4878 0001      	pea 1 <_start+0x1>
    375e:	4878 000f      	pea f <main+0x9>
    3762:	2f03           	move.l d3,-(sp)
    3764:	2f0c           	move.l a4,-(sp)
    3766:	4eba d620      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    376a:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    3770:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);   
    3774:	42a7           	clr.l -(sp)
    3776:	42a7           	clr.l -(sp)
    3778:	2f2f 0044      	move.l 68(sp),-(sp)
    377c:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3782:	4e95           	jsr (a5)
    3784:	4fef 0020      	lea 32(sp),sp
    3788:	246f 0044      	movea.l 68(sp),a2
    378c:	2c6f 0038      	movea.l 56(sp),a6
  valactual += ZMLINESIZE/2;
    3790:	282f 0040      	move.l 64(sp),d4
  TestRow( valsupposed, valactual, mask, 0);   
    3794:	97cb           	suba.l a3,a3
  mask = mask ^ 0xffff;
    3796:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    3798:	7a00           	moveq #0,d5
    379a:	3a02           	move.w d2,d5
    379c:	2f0b           	move.l a3,-(sp)
    379e:	2f05           	move.l d5,-(sp)
    37a0:	2f04           	move.l d4,-(sp)
    37a2:	4879 0001 7470 	pea 17470 <destlinezoom16>
    37a8:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    37aa:	486b 0001      	pea 1(a3)
    37ae:	2f05           	move.l d5,-(sp)
    37b0:	2044           	movea.l d4,a0
    37b2:	4868 0030      	pea 48(a0)
    37b6:	4879 0001 7470 	pea 17470 <destlinezoom16>
    37bc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    37be:	4642           	not.w d2
    37c0:	2004           	move.l d4,d0
    37c2:	0680 0000 0120 	addi.l #288,d0
    37c8:	548b           	addq.l #2,a3
    37ca:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    37cc:	4fef 0020      	lea 32(sp),sp
    37d0:	720c           	moveq #12,d1
    37d2:	b28b           	cmp.l a3,d1
    37d4:	6742           	beq.s 3818 <ZoomTest+0x20f8>
    37d6:	2c4a           	movea.l a2,a6
    37d8:	2440           	movea.l d0,a2
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    37da:	7a00           	moveq #0,d5
    37dc:	3a02           	move.w d2,d5
    37de:	2f0b           	move.l a3,-(sp)
    37e0:	2f05           	move.l d5,-(sp)
    37e2:	2f04           	move.l d4,-(sp)
    37e4:	4879 0001 7470 	pea 17470 <destlinezoom16>
    37ea:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    37ec:	486b 0001      	pea 1(a3)
    37f0:	2f05           	move.l d5,-(sp)
    37f2:	2044           	movea.l d4,a0
    37f4:	4868 0030      	pea 48(a0)
    37f8:	4879 0001 7470 	pea 17470 <destlinezoom16>
    37fe:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3800:	4642           	not.w d2
    3802:	2004           	move.l d4,d0
    3804:	0680 0000 0120 	addi.l #288,d0
    380a:	548b           	addq.l #2,a3
    380c:	280e           	move.l a6,d4
  for(int i2=0;i2<6;i2++) {
    380e:	4fef 0020      	lea 32(sp),sp
    3812:	720c           	moveq #12,d1
    3814:	b28b           	cmp.l a3,d1
    3816:	66be           	bne.s 37d6 <ZoomTest+0x20b6>
    3818:	367c 000d      	movea.w #13,a3
    381c:	2e00           	move.l d0,d7
    381e:	2a0c           	move.l a4,d5
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3820:	2f0b           	move.l a3,-(sp)
    3822:	7800           	moveq #0,d4
    3824:	3802           	move.w d2,d4
    3826:	2f04           	move.l d4,-(sp)
    3828:	2f0e           	move.l a6,-(sp)
    382a:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3830:	4e95           	jsr (a5)
    3832:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    3836:	3c02           	move.w d2,d6
    3838:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    383a:	3f06           	move.w d6,-(sp)
    383c:	4267           	clr.w -(sp)
    383e:	486e 0030      	pea 48(a6)
    3842:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3848:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    384a:	49eb 0003      	lea 3(a3),a4
    384e:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3852:	2c47           	movea.l d7,a6
    3854:	7e23           	moveq #35,d7
    3856:	de8b           	add.l a3,d7
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3858:	2f0c           	move.l a4,-(sp)
    385a:	2f04           	move.l d4,-(sp)
    385c:	2f0a           	move.l a2,-(sp)
    385e:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3864:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    3866:	486c 0001      	pea 1(a4)
    386a:	2f04           	move.l d4,-(sp)
    386c:	486a 0030      	pea 48(a2)
    3870:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3876:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3878:	3406           	move.w d6,d2
    387a:	41ea 00c0      	lea 192(a2),a0
    387e:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    3880:	4fef 0020      	lea 32(sp),sp
    3884:	b9c7           	cmpa.l d7,a4
    3886:	673a           	beq.s 38c2 <ZoomTest+0x21a2>
    3888:	244e           	movea.l a6,a2
    388a:	2c48           	movea.l a0,a6
    388c:	7800           	moveq #0,d4
    388e:	3806           	move.w d6,d4
    3890:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    3892:	2f0c           	move.l a4,-(sp)
    3894:	2f04           	move.l d4,-(sp)
    3896:	2f0a           	move.l a2,-(sp)
    3898:	4879 0001 7470 	pea 17470 <destlinezoom16>
    389e:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    38a0:	486c 0001      	pea 1(a4)
    38a4:	2f04           	move.l d4,-(sp)
    38a6:	486a 0030      	pea 48(a2)
    38aa:	4879 0001 7470 	pea 17470 <destlinezoom16>
    38b0:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    38b2:	3406           	move.w d6,d2
    38b4:	41ea 00c0      	lea 192(a2),a0
    38b8:	548c           	addq.l #2,a4
    for(int i2=0;i2<16;i2++) {
    38ba:	4fef 0020      	lea 32(sp),sp
    38be:	b9c7           	cmpa.l d7,a4
    38c0:	66c6           	bne.s 3888 <ZoomTest+0x2168>
    38c2:	47eb 0022      	lea 34(a3),a3
  for(int i=0;i<7;i++) {
    38c6:	b6fc 00fb      	cmpa.w #251,a3
    38ca:	674e           	beq.s 391a <ZoomTest+0x21fa>
    38cc:	2e0a           	move.l a2,d7
    38ce:	0687 0000 0120 	addi.l #288,d7
    38d4:	2448           	movea.l a0,a2
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    38d6:	2f0b           	move.l a3,-(sp)
    38d8:	7800           	moveq #0,d4
    38da:	3802           	move.w d2,d4
    38dc:	2f04           	move.l d4,-(sp)
    38de:	2f0e           	move.l a6,-(sp)
    38e0:	4879 0001 7470 	pea 17470 <destlinezoom16>
    38e6:	4e95           	jsr (a5)
    38e8:	486b 0001      	pea 1(a3)
      mask = mask ^ 0xffff;
    38ec:	3c02           	move.w d2,d6
    38ee:	4646           	not.w d6
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    38f0:	3f06           	move.w d6,-(sp)
    38f2:	4267           	clr.w -(sp)
    38f4:	486e 0030      	pea 48(a6)
    38f8:	4879 0001 7470 	pea 17470 <destlinezoom16>
    38fe:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3900:	49eb 0003      	lea 3(a3),a4
    3904:	4fef 0020      	lea 32(sp),sp
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    3908:	2c47           	movea.l d7,a6
    390a:	7e23           	moveq #35,d7
    390c:	de8b           	add.l a3,d7
    390e:	6000 ff48      	bra.w 3858 <ZoomTest+0x2138>
    3912:	7800           	moveq #0,d4
    3914:	3802           	move.w d2,d4
    3916:	6000 e754      	bra.w 206c <ZoomTest+0x94c>
    391a:	2845           	movea.l d5,a4
    391c:	2a08           	move.l a0,d5
    TestRow( valsupposed, valactual, mask, 251+i2);
    391e:	2f0b           	move.l a3,-(sp)
    3920:	7c00           	moveq #0,d6
    3922:	3c02           	move.w d2,d6
    3924:	2f06           	move.l d6,-(sp)
    3926:	2f0e           	move.l a6,-(sp)
    3928:	4879 0001 7470 	pea 17470 <destlinezoom16>
    392e:	4e95           	jsr (a5)
    3930:	4878 00fc      	pea fc <main+0xf6>
    3934:	2f04           	move.l d4,-(sp)
    3936:	486a 0090      	pea 144(a2)
    393a:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3940:	4e95           	jsr (a5)
    3942:	4fef 0020      	lea 32(sp),sp
    3946:	347c 00fd      	movea.w #253,a2
    394a:	2645           	movea.l d5,a3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    394c:	2f0a           	move.l a2,-(sp)
    394e:	2f06           	move.l d6,-(sp)
    3950:	2f0b           	move.l a3,-(sp)
    3952:	4879 0001 7470 	pea 17470 <destlinezoom16>
    3958:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    395a:	486a 0001      	pea 1(a2)
    395e:	2f06           	move.l d6,-(sp)
    3960:	486b 0030      	pea 48(a3)
    3964:	4879 0001 7470 	pea 17470 <destlinezoom16>
    396a:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    396c:	4642           	not.w d2
    396e:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3970:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    3974:	4fef 0020      	lea 32(sp),sp
    3978:	b4fc 010d      	cmpa.w #269,a2
    397c:	6736           	beq.s 39b4 <ZoomTest+0x2294>
    397e:	7c00           	moveq #0,d6
    3980:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    3982:	2f0a           	move.l a2,-(sp)
    3984:	2f06           	move.l d6,-(sp)
    3986:	2f0b           	move.l a3,-(sp)
    3988:	4879 0001 7470 	pea 17470 <destlinezoom16>
    398e:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    3990:	486a 0001      	pea 1(a2)
    3994:	2f06           	move.l d6,-(sp)
    3996:	486b 0030      	pea 48(a3)
    399a:	4879 0001 7470 	pea 17470 <destlinezoom16>
    39a0:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    39a2:	4642           	not.w d2
    39a4:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    39a6:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    39aa:	4fef 0020      	lea 32(sp),sp
    39ae:	b4fc 010d      	cmpa.w #269,a2
    39b2:	66ca           	bne.s 397e <ZoomTest+0x225e>
  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    39b4:	4878 0001      	pea 1 <_start+0x1>
    39b8:	4878 0010      	pea 10 <main+0xa>
    39bc:	2f0c           	move.l a4,-(sp)
    39be:	2f03           	move.l d3,-(sp)
    39c0:	4eba d3c6      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    39c4:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    39ca:	4eae ff1c      	jsr -228(a6)
    39ce:	4fef 0010      	lea 16(sp),sp
    39d2:	347c 0001      	movea.w #1,a2
  mask = 0xffff;
    39d6:	7eff           	moveq #-1,d7
    39d8:	266f 0034      	movea.l 52(sp),a3
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    39dc:	7400           	moveq #0,d2
    39de:	3407           	move.w d7,d2
    39e0:	486a ffff      	pea -1(a2)
    39e4:	2f02           	move.l d2,-(sp)
    39e6:	2f0b           	move.l a3,-(sp)
    39e8:	4879 0001 7444 	pea 17444 <destlinezoom17>
    39ee:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    39f0:	2f0a           	move.l a2,-(sp)
    39f2:	2f02           	move.l d2,-(sp)
    39f4:	486b 0030      	pea 48(a3)
    39f8:	4879 0001 7444 	pea 17444 <destlinezoom17>
    39fe:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3a00:	4647           	not.w d7
    3a02:	548a           	addq.l #2,a2
    valactual += ZMLINESIZE/2;
    3a04:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<5;i2++) {
    3a08:	4fef 0020      	lea 32(sp),sp
    3a0c:	700b           	moveq #11,d0
    3a0e:	b08a           	cmp.l a2,d0
    3a10:	66ca           	bne.s 39dc <ZoomTest+0x22bc>
    3a12:	2a0c           	move.l a4,d5
    3a14:	0685 0000 01e4 	addi.l #484,d5
    3a1a:	367c 000a      	movea.w #10,a3
    3a1e:	2f4c 0034      	move.l a4,52(sp)
    3a22:	2c0a           	move.l a2,d6
    3a24:	2445           	movea.l d5,a2
      TestRow( valsupposed, valactual, mask, 10+i*35);
    3a26:	2f0b           	move.l a3,-(sp)
    3a28:	3f07           	move.w d7,-(sp)
    3a2a:	4267           	clr.w -(sp)
    3a2c:	2f0a           	move.l a2,-(sp)
    3a2e:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3a34:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a36:	4dea 0030      	lea 48(a2),a6
      mask = mask ^ 0xffff;
    3a3a:	3807           	move.w d7,d4
    3a3c:	4644           	not.w d4
    for(int i2=0;i2<17;i2++) {
    3a3e:	49eb 0001      	lea 1(a3),a4
    3a42:	4fef 0010      	lea 16(sp),sp
    3a46:	45ea 0690      	lea 1680(a2),a2
    3a4a:	2a0a           	move.l a2,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3a4c:	7400           	moveq #0,d2
    3a4e:	3404           	move.w d4,d2
    3a50:	2f0c           	move.l a4,-(sp)
    3a52:	2f02           	move.l d2,-(sp)
    3a54:	2f0e           	move.l a6,-(sp)
    3a56:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3a5c:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3a5e:	486c 0001      	pea 1(a4)
    3a62:	2f02           	move.l d2,-(sp)
    3a64:	486e 0030      	pea 48(a6)
    3a68:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3a6e:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3a70:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    3a74:	4644           	not.w d4
    3a76:	3e04           	move.w d4,d7
    3a78:	548c           	addq.l #2,a4
    for(int i2=0;i2<17;i2++) {
    3a7a:	4fef 0020      	lea 32(sp),sp
    3a7e:	bdc5           	cmpa.l d5,a6
    3a80:	66ca           	bne.s 3a4c <ZoomTest+0x232c>
    3a82:	47eb 0023      	lea 35(a3),a3
  for(int i=0;i<7;i++) {
    3a86:	b6fc 00ff      	cmpa.w #255,a3
    3a8a:	669a           	bne.s 3a26 <ZoomTest+0x2306>
    3a8c:	286f 0034      	movea.l 52(sp),a4
    3a90:	2446           	movea.l d6,a2
  TestRow( valsupposed, valactual, mask, 255);
    3a92:	2f0b           	move.l a3,-(sp)
    3a94:	3f04           	move.w d4,-(sp)
    3a96:	4267           	clr.w -(sp)
    3a98:	486c 2fd4      	pea 12244(a4)
    3a9c:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3aa2:	4e95           	jsr (a5)
  valactual += ZMLINESIZE/2;
    3aa4:	4dec 3004      	lea 12292(a4),a6
    3aa8:	4fef 0010      	lea 16(sp),sp
    3aac:	367c 0100      	movea.w #256,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3ab0:	2f0b           	move.l a3,-(sp)
    3ab2:	2f02           	move.l d2,-(sp)
    3ab4:	2f0e           	move.l a6,-(sp)
    3ab6:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3abc:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3abe:	486b 0001      	pea 1(a3)
    3ac2:	2f02           	move.l d2,-(sp)
    3ac4:	486e 0030      	pea 48(a6)
    3ac8:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3ace:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ad0:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3ad2:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3ad6:	4fef 0020      	lea 32(sp),sp
    3ada:	b6fc 010e      	cmpa.w #270,a3
    3ade:	6736           	beq.s 3b16 <ZoomTest+0x23f6>
    3ae0:	7400           	moveq #0,d2
    3ae2:	3404           	move.w d4,d2
    3ae4:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3ae6:	2f0b           	move.l a3,-(sp)
    3ae8:	2f02           	move.l d2,-(sp)
    3aea:	2f0e           	move.l a6,-(sp)
    3aec:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3af2:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3af4:	486b 0001      	pea 1(a3)
    3af8:	2f02           	move.l d2,-(sp)
    3afa:	486e 0030      	pea 48(a6)
    3afe:	4879 0001 7444 	pea 17444 <destlinezoom17>
    3b04:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b06:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    3b08:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<7;i2++) {
    3b0c:	4fef 0020      	lea 32(sp),sp
    3b10:	b6fc 010e      	cmpa.w #270,a3
    3b14:	66ca           	bne.s 3ae0 <ZoomTest+0x23c0>
  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    3b16:	4878 0001      	pea 1 <_start+0x1>
    3b1a:	4878 0011      	pea 11 <main+0xb>
    3b1e:	2f03           	move.l d3,-(sp)
    3b20:	2f0c           	move.l a4,-(sp)
    3b22:	4eba d264      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3b26:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    3b2c:	4eae ff1c      	jsr -228(a6)
  TestRow( valsupposed, valactual, mask, 0);
    3b30:	42a7           	clr.l -(sp)
    3b32:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3b38:	2f2f 0044      	move.l 68(sp),-(sp)
    3b3c:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3b42:	4e95           	jsr (a5)
    3b44:	4fef 0020      	lea 32(sp),sp
    3b48:	367c 0001      	movea.w #1,a3
  mask = mask ^ 0xffff;
    3b4c:	4242           	clr.w d2
    3b4e:	2c6f 0040      	movea.l 64(sp),a6
    3b52:	2a2f 0044      	move.l 68(sp),d5
    3b56:	2c2f 0038      	move.l 56(sp),d6
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3b5a:	7800           	moveq #0,d4
    3b5c:	3802           	move.w d2,d4
    3b5e:	2f0b           	move.l a3,-(sp)
    3b60:	2f04           	move.l d4,-(sp)
    3b62:	2f0e           	move.l a6,-(sp)
    3b64:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3b6a:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3b6c:	486b 0001      	pea 1(a3)
    3b70:	2f04           	move.l d4,-(sp)
    3b72:	486e 0030      	pea 48(a6)
    3b76:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3b7c:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3b7e:	4642           	not.w d2
    3b80:	200e           	move.l a6,d0
    3b82:	0680 0000 0120 	addi.l #288,d0
    3b88:	548b           	addq.l #2,a3
    3b8a:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3b8c:	4fef 0020      	lea 32(sp),sp
    3b90:	7209           	moveq #9,d1
    3b92:	b28b           	cmp.l a3,d1
    3b94:	6740           	beq.s 3bd6 <ZoomTest+0x24b6>
    3b96:	2c05           	move.l d5,d6
    3b98:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    3b9a:	7800           	moveq #0,d4
    3b9c:	3802           	move.w d2,d4
    3b9e:	2f0b           	move.l a3,-(sp)
    3ba0:	2f04           	move.l d4,-(sp)
    3ba2:	2f0e           	move.l a6,-(sp)
    3ba4:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3baa:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    3bac:	486b 0001      	pea 1(a3)
    3bb0:	2f04           	move.l d4,-(sp)
    3bb2:	486e 0030      	pea 48(a6)
    3bb6:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3bbc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3bbe:	4642           	not.w d2
    3bc0:	200e           	move.l a6,d0
    3bc2:	0680 0000 0120 	addi.l #288,d0
    3bc8:	548b           	addq.l #2,a3
    3bca:	2c46           	movea.l d6,a6
  for(int i2=0;i2<4;i2++) {
    3bcc:	4fef 0020      	lea 32(sp),sp
    3bd0:	7209           	moveq #9,d1
    3bd2:	b28b           	cmp.l a3,d1
    3bd4:	66c0           	bne.s 3b96 <ZoomTest+0x2476>
    3bd6:	2f45 0044      	move.l d5,68(sp)
    3bda:	2f46 0038      	move.l d6,56(sp)
    3bde:	2805           	move.l d5,d4
    3be0:	2646           	movea.l d6,a3
    3be2:	2c4a           	movea.l a2,a6
    3be4:	2a00           	move.l d0,d5
    3be6:	7e24           	moveq #36,d7
    3be8:	de8a           	add.l a2,d7
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3bea:	7c00           	moveq #0,d6
    3bec:	3c02           	move.w d2,d6
    3bee:	2f0e           	move.l a6,-(sp)
    3bf0:	2f06           	move.l d6,-(sp)
    3bf2:	2f0b           	move.l a3,-(sp)
    3bf4:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3bfa:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3bfc:	486e 0001      	pea 1(a6)
    3c00:	2f06           	move.l d6,-(sp)
    3c02:	486b 0030      	pea 48(a3)
    3c06:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3c0c:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c0e:	4642           	not.w d2
    3c10:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3c12:	4fef 0020      	lea 32(sp),sp
    3c16:	bdc7           	cmpa.l d7,a6
    3c18:	673e           	beq.s 3c58 <ZoomTest+0x2538>
    3c1a:	200b           	move.l a3,d0
    3c1c:	0680 0000 0120 	addi.l #288,d0
    3c22:	2644           	movea.l d4,a3
    3c24:	2805           	move.l d5,d4
    3c26:	2a00           	move.l d0,d5
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    3c28:	7c00           	moveq #0,d6
    3c2a:	3c02           	move.w d2,d6
    3c2c:	2f0e           	move.l a6,-(sp)
    3c2e:	2f06           	move.l d6,-(sp)
    3c30:	2f0b           	move.l a3,-(sp)
    3c32:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3c38:	4e95           	jsr (a5)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    3c3a:	486e 0001      	pea 1(a6)
    3c3e:	2f06           	move.l d6,-(sp)
    3c40:	486b 0030      	pea 48(a3)
    3c44:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3c4a:	4e95           	jsr (a5)
      mask = mask ^ 0xffff;
    3c4c:	4642           	not.w d2
    3c4e:	548e           	addq.l #2,a6
    for(int i2=0;i2<18;i2++) {
    3c50:	4fef 0020      	lea 32(sp),sp
    3c54:	bdc7           	cmpa.l d7,a6
    3c56:	66c2           	bne.s 3c1a <ZoomTest+0x24fa>
    3c58:	45ea 0023      	lea 35(a2),a2
  for(int i=0;i<7;i++) {  
    3c5c:	b4fc 0100      	cmpa.w #256,a2
    3c60:	6718           	beq.s 3c7a <ZoomTest+0x255a>
    3c62:	200b           	move.l a3,d0
    3c64:	0680 0000 0120 	addi.l #288,d0
    3c6a:	2644           	movea.l d4,a3
    3c6c:	2805           	move.l d5,d4
  for(int i2=0;i2<4;i2++) {
    3c6e:	2c4a           	movea.l a2,a6
    3c70:	2a00           	move.l d0,d5
    3c72:	7e24           	moveq #36,d7
    3c74:	de8a           	add.l a2,d7
    3c76:	6000 ff72      	bra.w 3bea <ZoomTest+0x24ca>
    3c7a:	2644           	movea.l d4,a3
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3c7c:	7800           	moveq #0,d4
    3c7e:	3802           	move.w d2,d4
    3c80:	2f0a           	move.l a2,-(sp)
    3c82:	2f04           	move.l d4,-(sp)
    3c84:	2f0b           	move.l a3,-(sp)
    3c86:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3c8c:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3c8e:	486a 0001      	pea 1(a2)
    3c92:	2f04           	move.l d4,-(sp)
    3c94:	486b 0030      	pea 48(a3)
    3c98:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3c9e:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3ca0:	4642           	not.w d2
    3ca2:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3ca4:	4fef 0020      	lea 32(sp),sp
    3ca8:	b4fc 0108      	cmpa.w #264,a2
    3cac:	673e           	beq.s 3cec <ZoomTest+0x25cc>
    3cae:	200b           	move.l a3,d0
    3cb0:	0680 0000 00c0 	addi.l #192,d0
    3cb6:	2645           	movea.l d5,a3
    3cb8:	2a00           	move.l d0,d5
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    3cba:	7800           	moveq #0,d4
    3cbc:	3802           	move.w d2,d4
    3cbe:	2f0a           	move.l a2,-(sp)
    3cc0:	2f04           	move.l d4,-(sp)
    3cc2:	2f0b           	move.l a3,-(sp)
    3cc4:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3cca:	4e95           	jsr (a5)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    3ccc:	486a 0001      	pea 1(a2)
    3cd0:	2f04           	move.l d4,-(sp)
    3cd2:	486b 0030      	pea 48(a3)
    3cd6:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3cdc:	4e95           	jsr (a5)
    mask = mask ^ 0xffff;
    3cde:	4642           	not.w d2
    3ce0:	548a           	addq.l #2,a2
  for(int i2=0;i2<4;i2++) {
    3ce2:	4fef 0020      	lea 32(sp),sp
    3ce6:	b4fc 0108      	cmpa.w #264,a2
    3cea:	66c2           	bne.s 3cae <ZoomTest+0x258e>
  TestRow( valsupposed, valactual, mask, 0);
    3cec:	42a7           	clr.l -(sp)
    3cee:	3f02           	move.w d2,-(sp)
    3cf0:	4267           	clr.w -(sp)
    3cf2:	2f05           	move.l d5,-(sp)
    3cf4:	4879 0001 7418 	pea 17418 <destlinezoom18>
    3cfa:	4e95           	jsr (a5)
  FreeMem( source, (ZMLINESIZE+4)*272);
    3cfc:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3d02:	224c           	movea.l a4,a1
    3d04:	203c 0000 3740 	move.l #14144,d0
    3d0a:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    3d0e:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3d14:	2243           	movea.l d3,a1
    3d16:	203c 0000 3740 	move.l #14144,d0
    3d1c:	4eae ff2e      	jsr -210(a6)
    3d20:	4fef 0010      	lea 16(sp),sp
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3d24:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3d2a:	203c 0001 1440 	move.l #70720,d0
    3d30:	7202           	moveq #2,d1
    3d32:	4eae ff3a      	jsr -198(a6)
    3d36:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    3d3a:	6700 032e      	beq.w 406a <ZoomTest+0x294a>
  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    3d3e:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3d44:	203c 0001 1440 	move.l #70720,d0
    3d4a:	7202           	moveq #2,d1
    3d4c:	4eae ff3a      	jsr -198(a6)
    3d50:	2f40 0038      	move.l d0,56(sp)
  if( destination == 0) {
    3d54:	6700 0380      	beq.w 40d6 <ZoomTest+0x29b6>
    3d58:	242f 0034      	move.l 52(sp),d2
    3d5c:	0682 0000 ff00 	addi.l #65280,d2
    3d62:	246f 0034      	movea.l 52(sp),a2
    3d66:	4878 00f0      	pea f0 <main+0xea>
    3d6a:	4878 0055      	pea 55 <main+0x4f>
    3d6e:	2f0a           	move.l a2,-(sp)
    3d70:	4eba 0462      	jsr 41d4 <memset>(pc)
    3d74:	4878 00f0      	pea f0 <main+0xea>
    3d78:	4878 00aa      	pea aa <main+0xa4>
    3d7c:	486a 00f0      	pea 240(a2)
    3d80:	4eba 0452      	jsr 41d4 <memset>(pc)
    3d84:	45ea 01e0      	lea 480(a2),a2
  for(int i=0;i<128+8;i++) {
    3d88:	4fef 0018      	lea 24(sp),sp
    3d8c:	b48a           	cmp.l a2,d2
    3d8e:	66d6           	bne.s 3d66 <ZoomTest+0x2646>
  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    3d90:	4878 0005      	pea 5 <_start+0x5>
    3d94:	42a7           	clr.l -(sp)
    3d96:	2f2f 0040      	move.l 64(sp),-(sp)
    3d9a:	2f2f 0040      	move.l 64(sp),-(sp)
    3d9e:	4eba cfe8      	jsr d88 <Zoom_ZoomIntoPicture>(pc)
  WaitBlit();
    3da2:	2c79 0001 7792 	movea.l 17792 <GfxBase>,a6
    3da8:	4eae ff1c      	jsr -228(a6)
  for(int i=0;i<14;i++) {
    3dac:	202f 0048      	move.l 72(sp),d0
    3db0:	0680 0000 11d4 	addi.l #4564,d0
    3db6:	2f40 003c      	move.l d0,60(sp)
    3dba:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3dbe:	7c12           	moveq #18,d6
  UWORD mask = 0xffff;
    3dc0:	7eff           	moveq #-1,d7
    3dc2:	4bfa cbea      	lea 9ae <TestRow>(pc),a5
    3dc6:	41ef 0078      	lea 120(sp),a0
    3dca:	2f48 0048      	move.l a0,72(sp)
    3dce:	2f4d 0030      	move.l a5,48(sp)
    3dd2:	2a46           	movea.l d6,a5
    3dd4:	282f 002c      	move.l 44(sp),d4
    3dd8:	0684 ffff ef4a 	addi.l #-4278,d4
    3dde:	3c0d           	move.w a5,d6
    3de0:	0646 ffee      	addi.w #-18,d6
    3de4:	307c 002a      	movea.w #42,a0
    3de8:	d1ef 002c      	adda.l 44(sp),a0
    3dec:	2f48 0044      	move.l a0,68(sp)
    3df0:	2f4d 003c      	move.l a5,60(sp)
    3df4:	2844           	movea.l d4,a4
    3df6:	49ec ff10      	lea -240(a4),a4
    3dfa:	41ec ffd6      	lea -42(a4),a0
    3dfe:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3e02:	4878 0064      	pea 64 <main+0x5e>
    3e06:	42a7           	clr.l -(sp)
    3e08:	486f 0080      	pea 128(sp)
    3e0c:	4eba 03c6      	jsr 41d4 <memset>(pc)
  data[1] = numberofline;
    3e10:	3f46 0082      	move.w d6,130(sp)
    3e14:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3e18:	7a00           	moveq #0,d5
  testpattern += 0;
    3e1a:	4bf9 0001 7704 	lea 17704 <destlinezoom1>,a5
    if( (*testpattern++ ^ xormask) != *destination++) {
    3e20:	301d           	move.w (a5)+,d0
    3e22:	bf40           	eor.w d7,d0
    3e24:	206f 0040      	movea.l 64(sp),a0
    3e28:	54af 0040      	addq.l #2,64(sp)
    3e2c:	b058           	cmp.w (a0)+,d0
    3e2e:	673c           	beq.s 3e6c <ZoomTest+0x274c>
      data[0] = i;
    3e30:	3f45 0074      	move.w d5,116(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    3e34:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3e3a:	41f9 0001 4ad1 	lea 14ad1 <incbin_startimage_end+0x49>,a0
    3e40:	43ef 0074      	lea 116(sp),a1
    3e44:	45f9 0000 43c0 	lea 43c0 <PutChar>,a2
    3e4a:	47ef 0078      	lea 120(sp),a3
    3e4e:	4eae fdf6      	jsr -522(a6)
      Write(  Output(), str, 100);
    3e52:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    3e58:	4eae ffc4      	jsr -60(a6)
    3e5c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    3e62:	2200           	move.l d0,d1
    3e64:	240b           	move.l a3,d2
    3e66:	7664           	moveq #100,d3
    3e68:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    3e6c:	5285           	addq.l #1,d5
    3e6e:	bbfc 0001 772e 	cmpa.l #96046,a5
    3e74:	66aa           	bne.s 3e20 <ZoomTest+0x2700>
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    3e76:	3039 0001 772e 	move.w 1772e <destlinezoom1+0x2a>,d0
    3e7c:	bf40           	eor.w d7,d0
    3e7e:	3214           	move.w (a4),d1
    3e80:	b340           	eor.w d1,d0
    3e82:	0240 ff00      	andi.w #-256,d0
    3e86:	6600 00b4      	bne.w 3f3c <ZoomTest+0x281c>
        valactual += ZMLINESIZE/2;
    3e8a:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    3e8e:	b9c4           	cmpa.l d4,a4
    3e90:	6600 ff68      	bne.w 3dfa <ZoomTest+0x26da>
      mask = mask ^ 0xffff;
    3e94:	4647           	not.w d7
    3e96:	0684 0000 00f0 	addi.l #240,d4
    3e9c:	5246           	addq.w #1,d6
    for(int i2=0;i2<18;i2++) { 
    3e9e:	b8af 0044      	cmp.l 68(sp),d4
    3ea2:	6600 ff50      	bne.w 3df4 <ZoomTest+0x26d4>
    3ea6:	2a6f 003c      	movea.l 60(sp),a5
    3eaa:	246f 002c      	movea.l 44(sp),a2
    3eae:	45ea ff10      	lea -240(a2),a2
    3eb2:	7600           	moveq #0,d3
    3eb4:	3607           	move.w d7,d3
      TestRow( valsupposed, valactual, mask, 18+i*19);
    3eb6:	2f0d           	move.l a5,-(sp)
    3eb8:	2f03           	move.l d3,-(sp)
    3eba:	2f0a           	move.l a2,-(sp)
    3ebc:	4879 0001 7704 	pea 17704 <destlinezoom1>
    3ec2:	206f 0040      	movea.l 64(sp),a0
    3ec6:	4e90           	jsr (a0)
      valactual += ZMLINESIZE/2;
    3ec8:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    3ecc:	4fef 0010      	lea 16(sp),sp
    3ed0:	b5ef 002c      	cmpa.l 44(sp),a2
    3ed4:	66e0           	bne.s 3eb6 <ZoomTest+0x2796>
    3ed6:	45ea 11d0      	lea 4560(a2),a2
    3eda:	2f4a 002c      	move.l a2,44(sp)
    3ede:	4bed 0013      	lea 19(a5),a5
  for(int i=0;i<14;i++) {
    3ee2:	bafc 011c      	cmpa.w #284,a5
    3ee6:	6600 feec      	bne.w 3dd4 <ZoomTest+0x26b4>
    3eea:	2a6f 0030      	movea.l 48(sp),a5
    3eee:	246f 0038      	movea.l 56(sp),a2
    3ef2:	d5fc 0000 f964 	adda.l #63844,a2
    3ef8:	243c 0000 0109 	move.l #265,d2
    3efe:	280a           	move.l a2,d4
    3f00:	0684 0000 00f0 	addi.l #240,d4
      TestRow( valsupposed, valactual, mask, i2+265);
    3f06:	2f02           	move.l d2,-(sp)
    3f08:	2f03           	move.l d3,-(sp)
    3f0a:	2f0a           	move.l a2,-(sp)
    3f0c:	4879 0001 7704 	pea 17704 <destlinezoom1>
    3f12:	4e95           	jsr (a5)
      valactual += ZMLINESIZE/2;
    3f14:	45ea 0030      	lea 48(a2),a2
    for( int i3=0;i3<5;i3++) {
    3f18:	4fef 0010      	lea 16(sp),sp
    3f1c:	b88a           	cmp.l a2,d4
    3f1e:	66e6           	bne.s 3f06 <ZoomTest+0x27e6>
    mask = mask ^ 0xffff;
    3f20:	4647           	not.w d7
    3f22:	5282           	addq.l #1,d2
  for(int i2=0;i2<4;i2++) { 
    3f24:	0c82 0000 010d 	cmpi.l #269,d2
    3f2a:	6700 009e      	beq.w 3fca <ZoomTest+0x28aa>
    3f2e:	7600           	moveq #0,d3
    3f30:	3607           	move.w d7,d3
    3f32:	280a           	move.l a2,d4
    3f34:	0684 0000 00f0 	addi.l #240,d4
    3f3a:	60ca           	bra.s 3f06 <ZoomTest+0x27e6>
    data[0] = 21;
    3f3c:	3f7c 0015 0074 	move.w #21,116(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    3f42:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3f48:	41f9 0001 4ad1 	lea 14ad1 <incbin_startimage_end+0x49>,a0
    3f4e:	43ef 0074      	lea 116(sp),a1
    3f52:	45f9 0000 43c0 	lea 43c0 <PutChar>,a2
    3f58:	47ef 0078      	lea 120(sp),a3
    3f5c:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    3f60:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    3f66:	4eae ffc4      	jsr -60(a6)
    3f6a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    3f70:	2200           	move.l d0,d1
    3f72:	240b           	move.l a3,d2
    3f74:	7664           	moveq #100,d3
    3f76:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    3f7a:	7000           	moveq #0,d0
    3f7c:	3014           	move.w (a4),d0
    3f7e:	2f00           	move.l d0,-(sp)
    3f80:	3039 0001 772e 	move.w 1772e <destlinezoom1+0x2a>,d0
    3f86:	2f00           	move.l d0,-(sp)
    3f88:	4879 0001 4b01 	pea 14b01 <incbin_startimage_end+0x79>
    3f8e:	4eba c9b6      	jsr 946 <KPrintF>(pc)
        valactual += ZMLINESIZE/2;
    3f92:	49ec 0030      	lea 48(a4),a4
      for( int i3=0;i3<5;i3++) {
    3f96:	4fef 000c      	lea 12(sp),sp
    3f9a:	b9c4           	cmpa.l d4,a4
    3f9c:	6700 fef6      	beq.w 3e94 <ZoomTest+0x2774>
    3fa0:	41ec ffd6      	lea -42(a4),a0
    3fa4:	2f48 0040      	move.l a0,64(sp)
  char str[ 100] = { 0 };
    3fa8:	4878 0064      	pea 64 <main+0x5e>
    3fac:	42a7           	clr.l -(sp)
    3fae:	486f 0080      	pea 128(sp)
    3fb2:	4eba 0220      	jsr 41d4 <memset>(pc)
  data[1] = numberofline;
    3fb6:	3f46 0082      	move.w d6,130(sp)
    3fba:	4fef 000c      	lea 12(sp),sp
  for(int i=0;i<21;i++) {
    3fbe:	7a00           	moveq #0,d5
  testpattern += 0;
    3fc0:	4bf9 0001 7704 	lea 17704 <destlinezoom1>,a5
    3fc6:	6000 fe58      	bra.w 3e20 <ZoomTest+0x2700>
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    3fca:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3fd0:	226f 0034      	movea.l 52(sp),a1
    3fd4:	203c 0001 1440 	move.l #70720,d0
    3fda:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    3fde:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    3fe4:	226f 0038      	movea.l 56(sp),a1
    3fe8:	203c 0001 1440 	move.l #70720,d0
    3fee:	4eae ff2e      	jsr -210(a6)
}
    3ff2:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3ff6:	4fef 00b0      	lea 176(sp),sp
    3ffa:	4e75           	rts
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    3ffc:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4002:	4eae ffc4      	jsr -60(a6)
    4006:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    400c:	2200           	move.l d0,d1
    400e:	243c 0001 4ec8 	move.l #85704,d2
    4014:	7635           	moveq #53,d3
    4016:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    401a:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    4020:	203c 0000 3740 	move.l #14144,d0
    4026:	7202           	moveq #2,d1
    4028:	4eae ff3a      	jsr -198(a6)
    402c:	2600           	move.l d0,d3
  if( source == 0) {
    402e:	6600 df0a      	bne.w 1f3a <ZoomTest+0x81a>
    Write(  Output(), 
    4032:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4038:	4eae ffc4      	jsr -60(a6)
    403c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4042:	2200           	move.l d0,d1
    4044:	243c 0001 4f3f 	move.l #85823,d2
    404a:	7639           	moveq #57,d3
    404c:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    4050:	2c79 0001 779e 	movea.l 1779e <SysBase>,a6
    4056:	203c 0001 1440 	move.l #70720,d0
    405c:	7202           	moveq #2,d1
    405e:	4eae ff3a      	jsr -198(a6)
    4062:	2f40 0034      	move.l d0,52(sp)
  if( source == 0) {
    4066:	6600 fcd6      	bne.w 3d3e <ZoomTest+0x261e>
    Write(  Output(), 
    406a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4070:	4eae ffc4      	jsr -60(a6)
    4074:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    407a:	2200           	move.l d0,d1
    407c:	243c 0001 4f3f 	move.l #85823,d2
    4082:	7639           	moveq #57,d3
    4084:	4eae ffd0      	jsr -48(a6)
}
    4088:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    408c:	4fef 00b0      	lea 176(sp),sp
    4090:	4e75           	rts
    Write(  Output(), 
    4092:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4098:	4eae ffc4      	jsr -60(a6)
    409c:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    40a2:	2200           	move.l d0,d1
    40a4:	243c 0001 4e3b 	move.l #85563,d2
    40aa:	7636           	moveq #54,d3
    40ac:	4eae ffd0      	jsr -48(a6)
    return;
    40b0:	6000 dc36      	bra.w 1ce8 <ZoomTest+0x5c8>
    Write(  Output(), 
    40b4:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    40ba:	4eae ffc4      	jsr -60(a6)
    40be:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    40c4:	2200           	move.l d0,d1
    40c6:	243c 0001 4ba9 	move.l #84905,d2
    40cc:	7639           	moveq #57,d3
    40ce:	4eae ffd0      	jsr -48(a6)
    return;
    40d2:	6000 d846      	bra.w 191a <ZoomTest+0x1fa>
    Write(  Output(), 
    40d6:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    40dc:	4eae ffc4      	jsr -60(a6)
    40e0:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    40e6:	2200           	move.l d0,d1
    40e8:	243c 0001 4f79 	move.l #85881,d2
    40ee:	763d           	moveq #61,d3
    40f0:	4eae ffd0      	jsr -48(a6)
}
    40f4:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    40f8:	4fef 00b0      	lea 176(sp),sp
    40fc:	4e75           	rts
    Write(  Output(), 
    40fe:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4104:	4eae ffc4      	jsr -60(a6)
    4108:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    410e:	2200           	move.l d0,d1
    4110:	243c 0001 4be0 	move.l #84960,d2
    4116:	763d           	moveq #61,d3
    4118:	4eae ffd0      	jsr -48(a6)
    return;
    411c:	6000 d7fc      	bra.w 191a <ZoomTest+0x1fa>
    Write(  Output(), 
    4120:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4126:	4eae ffc4      	jsr -60(a6)
    412a:	2c79 0001 779a 	movea.l 1779a <DOSBase>,a6
    4130:	2200           	move.l d0,d1
    4132:	243c 0001 4f79 	move.l #85881,d2
    4138:	763d           	moveq #61,d3
    413a:	4eae ffd0      	jsr -48(a6)
    return;
    413e:	6000 fbe4      	bra.w 3d24 <ZoomTest+0x2604>

00004142 <memcpy>:
{
    4142:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4146:	202f 0014      	move.l 20(sp),d0
    414a:	226f 0018      	movea.l 24(sp),a1
    414e:	222f 001c      	move.l 28(sp),d1
	while(len--)
    4152:	2601           	move.l d1,d3
    4154:	5383           	subq.l #1,d3
    4156:	4a81           	tst.l d1
    4158:	6762           	beq.s 41bc <memcpy+0x7a>
    415a:	2040           	movea.l d0,a0
    415c:	5888           	addq.l #4,a0
    415e:	b1c9           	cmpa.l a1,a0
    4160:	53c2           	sl.s d2
    4162:	4402           	neg.b d2
    4164:	41e9 0004      	lea 4(a1),a0
    4168:	b1c0           	cmpa.l d0,a0
    416a:	53c4           	sl.s d4
    416c:	4404           	neg.b d4
    416e:	8404           	or.b d4,d2
    4170:	7808           	moveq #8,d4
    4172:	b883           	cmp.l d3,d4
    4174:	55c4           	sc.s d4
    4176:	4404           	neg.b d4
    4178:	c404           	and.b d4,d2
    417a:	6746           	beq.s 41c2 <memcpy+0x80>
    417c:	2409           	move.l a1,d2
    417e:	8480           	or.l d0,d2
    4180:	7803           	moveq #3,d4
    4182:	c484           	and.l d4,d2
    4184:	663c           	bne.s 41c2 <memcpy+0x80>
    4186:	2049           	movea.l a1,a0
    4188:	2440           	movea.l d0,a2
    418a:	74fc           	moveq #-4,d2
    418c:	c481           	and.l d1,d2
    418e:	d489           	add.l a1,d2
		*d++ = *s++;
    4190:	24d8           	move.l (a0)+,(a2)+
    4192:	b488           	cmp.l a0,d2
    4194:	66fa           	bne.s 4190 <memcpy+0x4e>
    4196:	74fc           	moveq #-4,d2
    4198:	c481           	and.l d1,d2
    419a:	2040           	movea.l d0,a0
    419c:	d1c2           	adda.l d2,a0
    419e:	d3c2           	adda.l d2,a1
    41a0:	9682           	sub.l d2,d3
    41a2:	b481           	cmp.l d1,d2
    41a4:	6716           	beq.s 41bc <memcpy+0x7a>
    41a6:	1091           	move.b (a1),(a0)
	while(len--)
    41a8:	4a83           	tst.l d3
    41aa:	6710           	beq.s 41bc <memcpy+0x7a>
		*d++ = *s++;
    41ac:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    41b2:	5383           	subq.l #1,d3
    41b4:	6706           	beq.s 41bc <memcpy+0x7a>
		*d++ = *s++;
    41b6:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    41bc:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    41c0:	4e75           	rts
    41c2:	2040           	movea.l d0,a0
    41c4:	d289           	add.l a1,d1
		*d++ = *s++;
    41c6:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    41c8:	b289           	cmp.l a1,d1
    41ca:	67f0           	beq.s 41bc <memcpy+0x7a>
		*d++ = *s++;
    41cc:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    41ce:	b289           	cmp.l a1,d1
    41d0:	66f4           	bne.s 41c6 <memcpy+0x84>
    41d2:	60e8           	bra.s 41bc <memcpy+0x7a>

000041d4 <memset>:
{
    41d4:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    41d8:	202f 0024      	move.l 36(sp),d0
    41dc:	2a2f 0028      	move.l 40(sp),d5
    41e0:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    41e4:	2809           	move.l a1,d4
    41e6:	5384           	subq.l #1,d4
    41e8:	b2fc 0000      	cmpa.w #0,a1
    41ec:	6f00 00b0      	ble.w 429e <memset+0xca>
    41f0:	1e05           	move.b d5,d7
    41f2:	2200           	move.l d0,d1
    41f4:	4481           	neg.l d1
    41f6:	7403           	moveq #3,d2
    41f8:	c282           	and.l d2,d1
    41fa:	7c05           	moveq #5,d6
		*ptr++ = val;
    41fc:	2440           	movea.l d0,a2
    41fe:	bc84           	cmp.l d4,d6
    4200:	646a           	bcc.s 426c <memset+0x98>
    4202:	4a81           	tst.l d1
    4204:	6724           	beq.s 422a <memset+0x56>
    4206:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4208:	5384           	subq.l #1,d4
    420a:	7401           	moveq #1,d2
    420c:	b481           	cmp.l d1,d2
    420e:	671a           	beq.s 422a <memset+0x56>
		*ptr++ = val;
    4210:	2440           	movea.l d0,a2
    4212:	548a           	addq.l #2,a2
    4214:	2040           	movea.l d0,a0
    4216:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    421a:	5384           	subq.l #1,d4
    421c:	7403           	moveq #3,d2
    421e:	b481           	cmp.l d1,d2
    4220:	6608           	bne.s 422a <memset+0x56>
		*ptr++ = val;
    4222:	528a           	addq.l #1,a2
    4224:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4228:	5384           	subq.l #1,d4
    422a:	2609           	move.l a1,d3
    422c:	9681           	sub.l d1,d3
    422e:	7c00           	moveq #0,d6
    4230:	1c05           	move.b d5,d6
    4232:	2406           	move.l d6,d2
    4234:	4842           	swap d2
    4236:	4242           	clr.w d2
    4238:	2042           	movea.l d2,a0
    423a:	2406           	move.l d6,d2
    423c:	e14a           	lsl.w #8,d2
    423e:	4842           	swap d2
    4240:	4242           	clr.w d2
    4242:	e18e           	lsl.l #8,d6
    4244:	2646           	movea.l d6,a3
    4246:	2c08           	move.l a0,d6
    4248:	8486           	or.l d6,d2
    424a:	2c0b           	move.l a3,d6
    424c:	8486           	or.l d6,d2
    424e:	1407           	move.b d7,d2
    4250:	2040           	movea.l d0,a0
    4252:	d1c1           	adda.l d1,a0
    4254:	72fc           	moveq #-4,d1
    4256:	c283           	and.l d3,d1
    4258:	d288           	add.l a0,d1
		*ptr++ = val;
    425a:	20c2           	move.l d2,(a0)+
    425c:	b1c1           	cmpa.l d1,a0
    425e:	66fa           	bne.s 425a <memset+0x86>
    4260:	72fc           	moveq #-4,d1
    4262:	c283           	and.l d3,d1
    4264:	d5c1           	adda.l d1,a2
    4266:	9881           	sub.l d1,d4
    4268:	b283           	cmp.l d3,d1
    426a:	6732           	beq.s 429e <memset+0xca>
    426c:	1485           	move.b d5,(a2)
	while(len-- > 0)
    426e:	4a84           	tst.l d4
    4270:	6f2c           	ble.s 429e <memset+0xca>
		*ptr++ = val;
    4272:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    4276:	7201           	moveq #1,d1
    4278:	b284           	cmp.l d4,d1
    427a:	6c22           	bge.s 429e <memset+0xca>
		*ptr++ = val;
    427c:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    4280:	7402           	moveq #2,d2
    4282:	b484           	cmp.l d4,d2
    4284:	6c18           	bge.s 429e <memset+0xca>
		*ptr++ = val;
    4286:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    428a:	7c03           	moveq #3,d6
    428c:	bc84           	cmp.l d4,d6
    428e:	6c0e           	bge.s 429e <memset+0xca>
		*ptr++ = val;
    4290:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    4294:	7204           	moveq #4,d1
    4296:	b284           	cmp.l d4,d1
    4298:	6c04           	bge.s 429e <memset+0xca>
		*ptr++ = val;
    429a:	1545 0005      	move.b d5,5(a2)
}
    429e:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    42a2:	4e75           	rts

000042a4 <strlen>:
{
    42a4:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    42a8:	7000           	moveq #0,d0
	while(*s++)
    42aa:	4a10           	tst.b (a0)
    42ac:	6708           	beq.s 42b6 <strlen+0x12>
		t++;
    42ae:	5280           	addq.l #1,d0
	while(*s++)
    42b0:	4a30 0800      	tst.b (0,a0,d0.l)
    42b4:	66f8           	bne.s 42ae <strlen+0xa>
}
    42b6:	4e75           	rts

000042b8 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    42b8:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    42bc:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    42c0:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    42c4:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    42c8:	d041           	add.w d1,d0
	swap	d0
    42ca:	4840           	swap d0
	clrw	d0
    42cc:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    42ce:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    42d2:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    42d6:	d081           	add.l d1,d0

	rts
    42d8:	4e75           	rts

000042da <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    42da:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    42dc:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    42e0:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    42e4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    42ea:	6416           	bcc.s 4302 <__udivsi3+0x28>
	movel	d0, d2
    42ec:	2400           	move.l d0,d2
	clrw	d2
    42ee:	4242           	clr.w d2
	swap	d2
    42f0:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    42f2:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    42f4:	3002           	move.w d2,d0
	swap	d0
    42f6:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    42f8:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    42fc:	84c1           	divu.w d1,d2
	movew	d2, d0
    42fe:	3002           	move.w d2,d0
	jra	6f
    4300:	6030           	bra.s 4332 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    4302:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4304:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4306:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4308:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    430e:	64f4           	bcc.s 4304 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    4310:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    4312:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4318:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    431a:	c2c0           	mulu.w d0,d1
	swap	d2
    431c:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    431e:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    4320:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    4322:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4324:	660a           	bne.s 4330 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4326:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4328:	6506           	bcs.s 4330 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    432a:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    432e:	6302           	bls.s 4332 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    4330:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    4332:	241f           	move.l (sp)+,d2
	rts
    4334:	4e75           	rts

00004336 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    4336:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4338:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    433a:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    433e:	6a04           	bpl.s 4344 <__divsi3+0xe>
	negl	d1
    4340:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    4342:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4344:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4348:	6a04           	bpl.s 434e <__divsi3+0x18>
	negl	d0
    434a:	4480           	neg.l d0
	negb	d2
    434c:	4402           	neg.b d2

2:	movel	d1, sp@-
    434e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4350:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    4352:	6186           	bsr.s 42da <__udivsi3>
	addql	IMM (8), sp
    4354:	508f           	addq.l #8,sp

	tstb	d2
    4356:	4a02           	tst.b d2
	jpl	3f
    4358:	6a02           	bpl.s 435c <__divsi3+0x26>
	negl	d0
    435a:	4480           	neg.l d0

3:	movel	sp@+, d2
    435c:	241f           	move.l (sp)+,d2
	rts
    435e:	4e75           	rts

00004360 <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4360:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    4364:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4368:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    436a:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    436c:	61c8           	bsr.s 4336 <__divsi3>
	addql	IMM (8), sp
    436e:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    4370:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    4374:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4376:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    4378:	6100 ff3e      	bsr.w 42b8 <__mulsi3>
	addql	IMM (8), sp
    437c:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    437e:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    4382:	9280           	sub.l d0,d1
	movel	d1, d0
    4384:	2001           	move.l d1,d0
	rts
    4386:	4e75           	rts

00004388 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    4388:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    438c:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    4390:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    4392:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    4394:	6100 ff44      	bsr.w 42da <__udivsi3>
	addql	IMM (8), sp
    4398:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    439a:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    439e:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    43a0:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    43a2:	6100 ff14      	bsr.w 42b8 <__mulsi3>
	addql	IMM (8), sp
    43a6:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    43a8:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    43ac:	9280           	sub.l d0,d1
	movel	d1, d0
    43ae:	2001           	move.l d1,d0
	rts
    43b0:	4e75           	rts

000043b2 <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    43b2:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    43b4:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    43b8:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    43bc:	2c5f           	movea.l (sp)+,a6
    rts
    43be:	4e75           	rts

000043c0 <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    43c0:	16c0           	move.b d0,(a3)+
	rts
    43c2:	4e75           	rts

000043c4 <saveregs>:
	...

00004400 <font2distance>:
    4400:	0505           	btst d2,d5
    4402:	0505           	btst d2,d5
    4404:	0505           	btst d2,d5
    4406:	0505           	btst d2,d5
    4408:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    440a:	0505           	btst d2,d5
    440c:	0505           	btst d2,d5
    440e:	0005 0505      	ori.b #5,d5
    4412:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4414:	0505           	btst d2,d5
    4416:	0505           	btst d2,d5
    4418:	0505           	btst d2,d5
    441a:	0505           	btst d2,d5
    441c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    441e:	0505           	btst d2,d5
    4420:	0505           	btst d2,d5
    4422:	0505           	btst d2,d5
    4424:	0505           	btst d2,d5
    4426:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4428:	0500           	btst d2,d0
    442a:	0505           	btst d2,d5
    442c:	0505           	btst d2,d5
    442e:	0505           	btst d2,d5
    4430:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    4432:	0505           	btst d2,d5
    4434:	0505           	btst d2,d5
    4436:	0505           	btst d2,d5
    4438:	0505           	btst d2,d5
    443a:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    443c:	0505           	btst d2,d5
    443e:	0505           	btst d2,d5
    4440:	0503           	btst d2,d3
    4442:	0505           	btst d2,d5
    4444:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    4446:	0505           	btst d2,d5
    4448:	0500           	btst d2,d0
    444a:	0505           	btst d2,d5
    444c:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4450:	0505           	btst d2,d5
    4452:	0503           	btst d2,d3
    4454:	0205 0507      	andi.b #7,d5
    4458:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    445a:	0505           	btst d2,d5
    445c:	0505           	btst d2,d5
    445e:	0505           	btst d2,d5
    4460:	0505           	btst d2,d5
    4462:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4464:	0505           	btst d2,d5
    4466:	0505           	btst d2,d5
    4468:	0505           	btst d2,d5
    446a:	0505           	btst d2,d5
    446c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    446e:	0505           	btst d2,d5
    4470:	0505           	btst d2,d5
    4472:	0505           	btst d2,d5
    4474:	0505           	btst d2,d5
    4476:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4478:	0505           	btst d2,d5
    447a:	0505           	btst d2,d5
    447c:	0505           	btst d2,d5
    447e:	0505           	btst d2,d5
    4480:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4482:	0505           	btst d2,d5
    4484:	0505           	btst d2,d5
    4486:	0505           	btst d2,d5
    4488:	0505           	btst d2,d5
    448a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    448c:	0505           	btst d2,d5
    448e:	0505           	btst d2,d5
    4490:	0505           	btst d2,d5
    4492:	0505           	btst d2,d5
    4494:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4496:	0505           	btst d2,d5
    4498:	0505           	btst d2,d5
    449a:	0505           	btst d2,d5
    449c:	0505           	btst d2,d5
    449e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44a0:	0505           	btst d2,d5
    44a2:	0505           	btst d2,d5
    44a4:	0505           	btst d2,d5
    44a6:	0505           	btst d2,d5
    44a8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44aa:	0505           	btst d2,d5
    44ac:	0505           	btst d2,d5
    44ae:	0505           	btst d2,d5
    44b0:	0505           	btst d2,d5
    44b2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44b4:	0505           	btst d2,d5
    44b6:	0505           	btst d2,d5
    44b8:	0505           	btst d2,d5
    44ba:	0505           	btst d2,d5
    44bc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44be:	0505           	btst d2,d5
    44c0:	0505           	btst d2,d5
    44c2:	0505           	btst d2,d5
    44c4:	0505           	btst d2,d5
    44c6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44c8:	0505           	btst d2,d5
    44ca:	0505           	btst d2,d5
    44cc:	0505           	btst d2,d5
    44ce:	0505           	btst d2,d5
    44d0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44d2:	0505           	btst d2,d5
    44d4:	0505           	btst d2,d5
    44d6:	0505           	btst d2,d5
    44d8:	0505           	btst d2,d5
    44da:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44dc:	0505           	btst d2,d5
    44de:	0505           	btst d2,d5
    44e0:	0505           	btst d2,d5
    44e2:	0505           	btst d2,d5
    44e4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44e6:	0505           	btst d2,d5
    44e8:	0505           	btst d2,d5
    44ea:	0505           	btst d2,d5
    44ec:	0505           	btst d2,d5
    44ee:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    44f0:	0505           	btst d2,d5
    44f2:	0505           	btst d2,d5
    44f4:	0505           	btst d2,d5
    44f6:	0505           	btst d2,d5
    44f8:	0505           	btst d2,d5

000044fa <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    44fa:	16c0           	move.b d0,(a3)+
  RTS
    44fc:	4e75           	rts

000044fe <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    44fe:	48f9 7fff 0000 	movem.l d0-a6,43c4 <saveregs>
    4504:	43c4 
  lea 0xdff000,a5
    4506:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd7466>,a5
  move.l sp@(4),a0  //Fontlocation
    450c:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4510:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4514:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4518:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    451a:	082d 0006 0002 	btst #6,2(a5)

00004520 <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4520:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    4526:	66f8           	bne.s 4520 <st2wblit>

00004528 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4528:	7019           	moveq #25,d0
	sub.l d5,d5      
    452a:	9a85           	sub.l d5,d5

0000452c <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    452c:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    452e:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4530:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4534:	9dce           	suba.l a6,a6
	move.l d2, a6
    4536:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4538:	ddfc 0000 4400 	adda.l #17408,a6

	LSL  	#4,d2 	    //Fetch next char
    453e:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4540:	2842           	movea.l d2,a4


	move.l  #0,d4
    4542:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    4544:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    4546:	3814           	move.w (a4),d4
	swap	d4
    4548:	4844           	swap d4
	lsr.l	d5, d4
    454a:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    454c:	8993           	or.l d4,(a3)
	clr.l	d4
    454e:	4284           	clr.l d4
	move.w  2(a4), d4
    4550:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4554:	4844           	swap d4
	lsr.l	d5, d4
    4556:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4558:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    455c:	4284           	clr.l d4
	move.w  4(a4), d4
    455e:	382c 0004      	move.w 4(a4),d4
	swap	d4
    4562:	4844           	swap d4
	lsr.l	d5, d4
    4564:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4566:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    456a:	4284           	clr.l d4
	move.w  6(a4), d4
    456c:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4570:	4844           	swap d4
	lsr.l	d5, d4
    4572:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4574:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4578:	4284           	clr.l d4
	move.w  8(a4), d4
    457a:	382c 0008      	move.w 8(a4),d4
	swap	d4
    457e:	4844           	swap d4
	lsr.l	d5, d4
    4580:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    4582:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4586:	4284           	clr.l d4
	move.w  10(a4), d4
    4588:	382c 000a      	move.w 10(a4),d4
	swap	d4
    458c:	4844           	swap d4
	lsr.l	d5, d4
    458e:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    4590:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4594:	4284           	clr.l d4
	move.w  12(a4), d4
    4596:	382c 000c      	move.w 12(a4),d4
	swap	d4
    459a:	4844           	swap d4
	lsr.l	d5, d4
    459c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    459e:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    45a2:	4284           	clr.l d4
	move.w  14(a4), d4
    45a4:	382c 000e      	move.w 14(a4),d4
	swap	d4
    45a8:	4844           	swap d4
	lsr.l	d5, d4
    45aa:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    45ac:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    45b0:	4284           	clr.l d4

	add.b   (a6), d5
    45b2:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    45b4:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    45b8:	6500 0006      	bcs.w 45c0 <noadditionalchar>
	addq.w  #1, a3
    45bc:	524b           	addq.w #1,a3
	sub.w   #8,d5
    45be:	5145           	subq.w #8,d5

000045c0 <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    45c0:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    45c2:	51c8 ff68      	dbf d0,452c <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    45c6:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    45ca:	51cb ff5c      	dbf d3,4528 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    45ce:	4cfa 7fff fdf2 	movem.l 43c4 <saveregs>(pc),d0-a6

	RTS
    45d4:	4e75           	rts
