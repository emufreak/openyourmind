
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

  UWORD test = 99;
  /*UWORD *bp = 0x200;
  *bp = test;*/
  ULONG tmp = 4;
  SysBase = *((struct ExecBase**)tmp);
       a:	2c78 0004      	movea.l 4 <_start+0x4>,a6
       e:	23ce 0001 983c 	move.l a6,1983c <SysBase>
	hw = (struct Custom*)0xdff000;
      14:	23fc 00df f000 	move.l #14675968,19820 <hw>
      1a:	0001 9820 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      1e:	43f9 0001 76d4 	lea 176d4 <incbin_swfont_end+0x42e>,a1
      24:	7000           	moveq #0,d0
      26:	4eae fdd8      	jsr -552(a6)
      2a:	23c0 0001 9834 	move.l d0,19834 <GfxBase>
	if (!GfxBase)
      30:	6700 053a      	beq.w 56c <main+0x566>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      34:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
      3a:	43f9 0001 76e5 	lea 176e5 <incbin_swfont_end+0x43f>,a1
      40:	7000           	moveq #0,d0
      42:	4eae fdd8      	jsr -552(a6)
      46:	23c0 0001 9838 	move.l d0,19838 <DOSBase>
	if (!DOSBase)
      4c:	6700 050c      	beq.w 55a <main+0x554>
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      50:	2c40           	movea.l d0,a6
      52:	4eae ffc4      	jsr -60(a6)
      56:	2079 0001 9820 	movea.l 19820 <hw>,a0
      5c:	2628 0080      	move.l 128(a0),d3
      60:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
      66:	2200           	move.l d0,d1
      68:	243c 0001 76f1 	move.l #95985,d2
      6e:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      72:	49f9 0000 6110 	lea 6110 <ClBuild>,a4
      78:	4e94           	jsr (a4)
      7a:	23c0 0001 982c 	move.l d0,1982c <Copperlist1>
  DrawCopper = Copperlist1;
      80:	23c0 0001 9824 	move.l d0,19824 <DrawCopper>
  Copperlist2 = ClBuild();
      86:	4e94           	jsr (a4)
      88:	23c0 0001 981c 	move.l d0,1981c <Copperlist2>
  ViewCopper = Copperlist2;
      8e:	23c0 0001 9810 	move.l d0,19810 <ViewCopper>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
      94:	2079 0001 982c 	movea.l 1982c <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
      9a:	2010           	move.l (a0),d0
      9c:	b0b9 0001 976c 	cmp.l 1976c <ClsSprites>,d0
      a2:	6600 0442      	bne.w 4e6 <main+0x4e0>
      a6:	2028 0004      	move.l 4(a0),d0
      aa:	b0b9 0001 9770 	cmp.l 19770 <ClsSprites+0x4>,d0
      b0:	6600 0434      	bne.w 4e6 <main+0x4e0>
      b4:	2028 0008      	move.l 8(a0),d0
      b8:	b0b9 0001 9774 	cmp.l 19774 <ClsSprites+0x8>,d0
      be:	6600 0426      	bne.w 4e6 <main+0x4e0>
      c2:	2028 000c      	move.l 12(a0),d0
      c6:	b0b9 0001 9778 	cmp.l 19778 <ClsSprites+0xc>,d0
      cc:	6600 0418      	bne.w 4e6 <main+0x4e0>
      d0:	2028 0010      	move.l 16(a0),d0
      d4:	b0b9 0001 977c 	cmp.l 1977c <ClsSprites+0x10>,d0
      da:	6600 040a      	bne.w 4e6 <main+0x4e0>
      de:	2028 0014      	move.l 20(a0),d0
      e2:	b0b9 0001 9780 	cmp.l 19780 <ClsSprites+0x14>,d0
      e8:	6600 03fc      	bne.w 4e6 <main+0x4e0>
      ec:	2028 0018      	move.l 24(a0),d0
      f0:	b0b9 0001 9784 	cmp.l 19784 <ClsSprites+0x18>,d0
      f6:	6600 03ee      	bne.w 4e6 <main+0x4e0>
      fa:	2028 001c      	move.l 28(a0),d0
      fe:	b0b9 0001 9788 	cmp.l 19788 <ClsSprites+0x1c>,d0
     104:	6600 03e0      	bne.w 4e6 <main+0x4e0>
     108:	2028 0020      	move.l 32(a0),d0
     10c:	b0b9 0001 978c 	cmp.l 1978c <ClsSprites+0x20>,d0
     112:	6600 03d2      	bne.w 4e6 <main+0x4e0>
     116:	2028 0024      	move.l 36(a0),d0
     11a:	b0b9 0001 9790 	cmp.l 19790 <ClsSprites+0x24>,d0
     120:	6600 03c4      	bne.w 4e6 <main+0x4e0>
     124:	2028 0028      	move.l 40(a0),d0
     128:	b0b9 0001 9794 	cmp.l 19794 <ClsSprites+0x28>,d0
     12e:	6600 03b6      	bne.w 4e6 <main+0x4e0>
     132:	2028 002c      	move.l 44(a0),d0
     136:	b0b9 0001 9798 	cmp.l 19798 <ClsSprites+0x2c>,d0
     13c:	6600 03a8      	bne.w 4e6 <main+0x4e0>
     140:	2028 0030      	move.l 48(a0),d0
     144:	b0b9 0001 979c 	cmp.l 1979c <ClsSprites+0x30>,d0
     14a:	6600 039a      	bne.w 4e6 <main+0x4e0>
     14e:	2028 0034      	move.l 52(a0),d0
     152:	b0b9 0001 97a0 	cmp.l 197a0 <ClsSprites+0x34>,d0
     158:	6600 038c      	bne.w 4e6 <main+0x4e0>
     15c:	2028 0038      	move.l 56(a0),d0
     160:	b0b9 0001 97a4 	cmp.l 197a4 <ClsSprites+0x38>,d0
     166:	6600 037e      	bne.w 4e6 <main+0x4e0>
     16a:	2028 003c      	move.l 60(a0),d0
     16e:	b0b9 0001 97a8 	cmp.l 197a8 <ClsSprites+0x3c>,d0
     174:	6600 0370      	bne.w 4e6 <main+0x4e0>
     178:	2039 0001 973c 	move.l 1973c <ClScreen>,d0
     17e:	b0a8 0040      	cmp.l 64(a0),d0
     182:	6600 038a      	bne.w 50e <main+0x508>
     186:	2039 0001 9740 	move.l 19740 <ClScreen+0x4>,d0
     18c:	b0a8 0044      	cmp.l 68(a0),d0
     190:	6600 037c      	bne.w 50e <main+0x508>
     194:	2039 0001 9744 	move.l 19744 <ClScreen+0x8>,d0
     19a:	b0a8 0048      	cmp.l 72(a0),d0
     19e:	6600 036e      	bne.w 50e <main+0x508>
     1a2:	2028 004c      	move.l 76(a0),d0
     1a6:	b0b9 0001 9748 	cmp.l 19748 <ClScreen+0xc>,d0
     1ac:	6600 0360      	bne.w 50e <main+0x508>
     1b0:	2028 0050      	move.l 80(a0),d0
     1b4:	b0b9 0001 974c 	cmp.l 1974c <ClScreen+0x10>,d0
     1ba:	6600 0352      	bne.w 50e <main+0x508>
     1be:	2028 0054      	move.l 84(a0),d0
     1c2:	b0b9 0001 9750 	cmp.l 19750 <ClScreen+0x14>,d0
     1c8:	6600 0344      	bne.w 50e <main+0x508>
     1cc:	2028 0058      	move.l 88(a0),d0
     1d0:	b0b9 0001 9754 	cmp.l 19754 <ClScreen+0x18>,d0
     1d6:	6600 0336      	bne.w 50e <main+0x508>
     1da:	2028 005c      	move.l 92(a0),d0
     1de:	b0b9 0001 9758 	cmp.l 19758 <ClScreen+0x1c>,d0
     1e4:	6600 0328      	bne.w 50e <main+0x508>
     1e8:	2028 0060      	move.l 96(a0),d0
     1ec:	b0b9 0001 975c 	cmp.l 1975c <ClScreen+0x20>,d0
     1f2:	6600 031a      	bne.w 50e <main+0x508>
     1f6:	2028 0064      	move.l 100(a0),d0
     1fa:	b0b9 0001 9760 	cmp.l 19760 <ClScreen+0x24>,d0
     200:	6600 030c      	bne.w 50e <main+0x508>
     204:	2028 0068      	move.l 104(a0),d0
     208:	b0b9 0001 9764 	cmp.l 19764 <ClScreen+0x28>,d0
     20e:	6600 02fe      	bne.w 50e <main+0x508>
     212:	2068 006c      	movea.l 108(a0),a0
     216:	b1f9 0001 9768 	cmpa.l 19768 <ClScreen+0x2c>,a0
     21c:	6600 02f0      	bne.w 50e <main+0x508>
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     220:	23fc 0004 0000 	move.l #262144,19830 <DrawBuffer>
     226:	0001 9830 
  ViewBuffer = (ULONG *)0x50000;
     22a:	23fc 0005 0000 	move.l #327680,19828 <ViewBuffer>
     230:	0001 9828 
  
  SetBplPointers();
     234:	45f9 0000 672a 	lea 672a <SetBplPointers>,a2
     23a:	4e92           	jsr (a2)
  
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     23c:	0cb9 0005 0000 	cmpi.l #327680,19830 <DrawBuffer>
     242:	0001 9830 
     246:	6700 03e2      	beq.w 62a <main+0x624>
    Write( Output(), 
     24a:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     250:	4eae ffc4      	jsr -60(a6)
     254:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     25a:	2200           	move.l d0,d1
     25c:	243c 0001 76f4 	move.l #95988,d2
     262:	763b           	moveq #59,d3
     264:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     268:	2079 0001 982c 	movea.l 1982c <Copperlist1>,a0
     26e:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     274:	0070 
     276:	6724           	beq.s 29c <main+0x296>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     278:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     27e:	4eae ffc4      	jsr -60(a6)
     282:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     288:	2200           	move.l d0,d1
     28a:	243c 0001 7730 	move.l #96048,d2
     290:	763c           	moveq #60,d3
     292:	4eae ffd0      	jsr -48(a6)
     296:	2079 0001 982c 	movea.l 1982c <Copperlist1>,a0
  if( instructions[pos] == value ) 
     29c:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2a2:	0074 
     2a4:	6724           	beq.s 2ca <main+0x2c4>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2a6:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     2ac:	4eae ffc4      	jsr -60(a6)
     2b0:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     2b6:	2200           	move.l d0,d1
     2b8:	243c 0001 776d 	move.l #96109,d2
     2be:	763c           	moveq #60,d3
     2c0:	4eae ffd0      	jsr -48(a6)
     2c4:	2079 0001 982c 	movea.l 1982c <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     2ca:	2028 0078      	move.l 120(a0),d0
     2ce:	b0b9 0001 96bc 	cmp.l 196bc <ClColor>,d0
     2d4:	6600 0384      	bne.w 65a <main+0x654>
     2d8:	2028 007c      	move.l 124(a0),d0
     2dc:	b0b9 0001 96c0 	cmp.l 196c0 <ClColor+0x4>,d0
     2e2:	6600 0376      	bne.w 65a <main+0x654>
  if( instructions[pos] == value ) 
     2e6:	70fe           	moveq #-2,d0
     2e8:	b0a8 0080      	cmp.l 128(a0),d0
     2ec:	671e           	beq.s 30c <main+0x306>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     2ee:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     2f4:	4eae ffc4      	jsr -60(a6)
     2f8:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     2fe:	2200           	move.l d0,d1
     300:	243c 0001 77cc 	move.l #96204,d2
     306:	7622           	moveq #34,d3
     308:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     30c:	47f9 0000 6704 	lea 6704 <SwapCl>,a3
     312:	4e93           	jsr (a3)
  
  if( DrawCopper != Copperlist2)
     314:	2039 0001 9824 	move.l 19824 <DrawCopper>,d0
     31a:	b0b9 0001 981c 	cmp.l 1981c <Copperlist2>,d0
     320:	671e           	beq.s 340 <main+0x33a>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     322:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     328:	4eae ffc4      	jsr -60(a6)
     32c:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     332:	2200           	move.l d0,d1
     334:	243c 0001 77ef 	move.l #96239,d2
     33a:	7615           	moveq #21,d3
     33c:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild( );
     340:	4e94           	jsr (a4)
     342:	23c0 0001 982c 	move.l d0,1982c <Copperlist1>
  Copperlist2 = ClBuild( );
     348:	4e94           	jsr (a4)
     34a:	23c0 0001 981c 	move.l d0,1981c <Copperlist2>
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
     350:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
     356:	203c 0000 c800 	move.l #51200,d0
     35c:	7202           	moveq #2,d1
     35e:	4eae ff3a      	jsr -198(a6)
     362:	23c0 0001 9818 	move.l d0,19818 <Bitplane1>
  if(Bitplane1 == 0) {
     368:	6700 0260      	beq.w 5ca <main+0x5c4>
  ViewBuffer = Bitplane1;
     36c:	23c0 0001 9828 	move.l d0,19828 <ViewBuffer>
  ViewCopper = Copperlist1;
     372:	23f9 0001 982c 	move.l 1982c <Copperlist1>,19810 <ViewCopper>
     378:	0001 9810 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     37c:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
     382:	203c 0000 c800 	move.l #51200,d0
     388:	7202           	moveq #2,d1
     38a:	4eae ff3a      	jsr -198(a6)
     38e:	23c0 0001 9814 	move.l d0,19814 <Bitplane2>
  if(Bitplane2 == 0) {
     394:	6700 0200      	beq.w 596 <main+0x590>
  DrawBuffer = Bitplane2;
     398:	23c0 0001 9830 	move.l d0,19830 <DrawBuffer>
  DrawCopper = Copperlist2;
     39e:	23f9 0001 981c 	move.l 1981c <Copperlist2>,19824 <DrawCopper>
     3a4:	0001 9824 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
     3a8:	2039 0001 9828 	move.l 19828 <ViewBuffer>,d0
     3ae:	b0b9 0001 9818 	cmp.l 19818 <Bitplane1>,d0
     3b4:	671e           	beq.s 3d4 <main+0x3ce>
    Write( Output(), 
     3b6:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     3bc:	4eae ffc4      	jsr -60(a6)
     3c0:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     3c6:	2200           	move.l d0,d1
     3c8:	243c 0001 7805 	move.l #96261,d2
     3ce:	7638           	moveq #56,d3
     3d0:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
     3d4:	2039 0001 9810 	move.l 19810 <ViewCopper>,d0
     3da:	b0b9 0001 982c 	cmp.l 1982c <Copperlist1>,d0
     3e0:	671e           	beq.s 400 <main+0x3fa>
    Write( Output(), 
     3e2:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     3e8:	4eae ffc4      	jsr -60(a6)
     3ec:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     3f2:	2200           	move.l d0,d1
     3f4:	243c 0001 783e 	move.l #96318,d2
     3fa:	763a           	moveq #58,d3
     3fc:	4eae ffd0      	jsr -48(a6)
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
     400:	4e92           	jsr (a2)
  SwapCl();
     402:	4e93           	jsr (a3)
  UWORD *copword = ViewCopper;
     404:	2079 0001 9810 	movea.l 19810 <ViewCopper>,a0
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     40a:	7000           	moveq #0,d0
     40c:	3028 0072      	move.w 114(a0),d0
     410:	4840           	swap d0
     412:	4240           	clr.w d0
     414:	7200           	moveq #0,d1
     416:	3228 0076      	move.w 118(a0),d1
     41a:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     41c:	b0b9 0001 9814 	cmp.l 19814 <Bitplane2>,d0
     422:	671e           	beq.s 442 <main+0x43c>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     424:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     42a:	4eae ffc4      	jsr -60(a6)
     42e:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     434:	2200           	move.l d0,d1
     436:	243c 0001 7879 	move.l #96377,d2
     43c:	7648           	moveq #72,d3
     43e:	4eae ffd0      	jsr -48(a6)
                                                   " after first frame.\n", 72);
  SetBplPointers();
     442:	4e92           	jsr (a2)
  SwapCl();
     444:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     446:	2079 0001 9810 	movea.l 19810 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     44c:	7000           	moveq #0,d0
     44e:	3028 0072      	move.w 114(a0),d0
     452:	4840           	swap d0
     454:	4240           	clr.w d0
     456:	7200           	moveq #0,d1
     458:	3228 0076      	move.w 118(a0),d1
     45c:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     45e:	b0b9 0001 9818 	cmp.l 19818 <Bitplane1>,d0
     464:	671e           	beq.s 484 <main+0x47e>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     466:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     46c:	4eae ffc4      	jsr -60(a6)
     470:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     476:	2200           	move.l d0,d1
     478:	243c 0001 78c2 	move.l #96450,d2
     47e:	7649           	moveq #73,d3
     480:	4eae ffd0      	jsr -48(a6)
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
     484:	4e92           	jsr (a2)
  SwapCl();
     486:	4e93           	jsr (a3)

  copword = (UWORD *) ViewCopper;
     488:	2079 0001 9810 	movea.l 19810 <ViewCopper>,a0
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
     48e:	7000           	moveq #0,d0
     490:	3028 0072      	move.w 114(a0),d0
     494:	4840           	swap d0
     496:	4240           	clr.w d0
     498:	7200           	moveq #0,d1
     49a:	3228 0076      	move.w 118(a0),d1
     49e:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4a0:	b0b9 0001 9814 	cmp.l 19814 <Bitplane2>,d0
     4a6:	671e           	beq.s 4c6 <main+0x4c0>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4a8:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     4ae:	4eae ffc4      	jsr -60(a6)
     4b2:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     4b8:	2200           	move.l d0,d1
     4ba:	243c 0001 790c 	move.l #96524,d2
     4c0:	7648           	moveq #72,d3
     4c2:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     4c6:	2f3c 0000 c800 	move.l #51200,-(sp)
     4cc:	4878 0084      	pea 84 <main+0x7e>
     4d0:	4eb9 0000 6756 	jsr 6756 <FreeDisplay>
#include "coppertests.h"
#include "swscrollertest.h"

void RunTests() {
    TestCopperList();
    ZoomTest();
     4d6:	4eb9 0000 21cc 	jsr 21cc <ZoomTest>
     4dc:	508f           	addq.l #8,sp

	//FreeSystem();

	/*CloseLibrary((struct Library*)DOSBase);
	CloseLibrary((struct Library*)GfxBase);*/
}
     4de:	7000           	moveq #0,d0
     4e0:	4cdf 5c0c      	movem.l (sp)+,d2-d3/a2-a4/a6
     4e4:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     4e6:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     4ec:	4eae ffc4      	jsr -60(a6)
     4f0:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     4f6:	2200           	move.l d0,d1
     4f8:	243c 0001 798c 	move.l #96652,d2
     4fe:	762c           	moveq #44,d3
     500:	4eae ffd0      	jsr -48(a6)
     504:	2079 0001 982c 	movea.l 1982c <Copperlist1>,a0
     50a:	6000 fc6c      	bra.w 178 <main+0x172>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
     50e:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     514:	4eae ffc4      	jsr -60(a6)
     518:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     51e:	2200           	move.l d0,d1
     520:	243c 0001 7955 	move.l #96597,d2
     526:	7636           	moveq #54,d3
     528:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
     52c:	23fc 0004 0000 	move.l #262144,19830 <DrawBuffer>
     532:	0001 9830 
  ViewBuffer = (ULONG *)0x50000;
     536:	23fc 0005 0000 	move.l #327680,19828 <ViewBuffer>
     53c:	0001 9828 
  SetBplPointers();
     540:	45f9 0000 672a 	lea 672a <SetBplPointers>,a2
     546:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     548:	0cb9 0005 0000 	cmpi.l #327680,19830 <DrawBuffer>
     54e:	0001 9830 
     552:	6600 fcf6      	bne.w 24a <main+0x244>
     556:	6000 00d2      	bra.w 62a <main+0x624>
		Exit(0);
     55a:	9dce           	suba.l a6,a6
     55c:	7200           	moveq #0,d1
     55e:	4eae ff70      	jsr -144(a6)
     562:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     568:	6000 fae6      	bra.w 50 <main+0x4a>
		Exit(0);
     56c:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     572:	7200           	moveq #0,d1
     574:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
     578:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
     57e:	43f9 0001 76e5 	lea 176e5 <incbin_swfont_end+0x43f>,a1
     584:	7000           	moveq #0,d0
     586:	4eae fdd8      	jsr -552(a6)
     58a:	23c0 0001 9838 	move.l d0,19838 <DOSBase>
	if (!DOSBase)
     590:	6600 fabe      	bne.w 50 <main+0x4a>
     594:	60c4           	bra.s 55a <main+0x554>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
     596:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     59c:	4eae ffc4      	jsr -60(a6)
     5a0:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     5a6:	2200           	move.l d0,d1
     5a8:	243c 0001 6ca8 	move.l #93352,d2
     5ae:	7626           	moveq #38,d3
     5b0:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     5b4:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     5ba:	7201           	moveq #1,d1
     5bc:	4eae ff70      	jsr -144(a6)
     5c0:	2039 0001 9814 	move.l 19814 <Bitplane2>,d0
     5c6:	6000 fdd0      	bra.w 398 <main+0x392>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
     5ca:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     5d0:	4eae ffc4      	jsr -60(a6)
     5d4:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     5da:	2200           	move.l d0,d1
     5dc:	243c 0001 6c81 	move.l #93313,d2
     5e2:	7626           	moveq #38,d3
     5e4:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     5e8:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     5ee:	7201           	moveq #1,d1
     5f0:	4eae ff70      	jsr -144(a6)
     5f4:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
  ViewBuffer = Bitplane1;
     5fa:	23c0 0001 9828 	move.l d0,19828 <ViewBuffer>
  ViewCopper = Copperlist1;
     600:	23f9 0001 982c 	move.l 1982c <Copperlist1>,19810 <ViewCopper>
     606:	0001 9810 
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
     60a:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
     610:	203c 0000 c800 	move.l #51200,d0
     616:	7202           	moveq #2,d1
     618:	4eae ff3a      	jsr -198(a6)
     61c:	23c0 0001 9814 	move.l d0,19814 <Bitplane2>
  if(Bitplane2 == 0) {
     622:	6600 fd74      	bne.w 398 <main+0x392>
     626:	6000 ff6e      	bra.w 596 <main+0x590>
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     62a:	0cb9 0004 0000 	cmpi.l #262144,19828 <ViewBuffer>
     630:	0001 9828 
     634:	6700 fc32      	beq.w 268 <main+0x262>
    Write( Output(), 
     638:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     63e:	4eae ffc4      	jsr -60(a6)
     642:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     648:	2200           	move.l d0,d1
     64a:	243c 0001 76f4 	move.l #95988,d2
     650:	763b           	moveq #59,d3
     652:	4eae ffd0      	jsr -48(a6)
     656:	6000 fc10      	bra.w 268 <main+0x262>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     65a:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     660:	4eae ffc4      	jsr -60(a6)
     664:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
     66a:	2200           	move.l d0,d1
     66c:	243c 0001 77aa 	move.l #96170,d2
     672:	7621           	moveq #33,d3
     674:	4eae ffd0      	jsr -48(a6)
     678:	2079 0001 982c 	movea.l 1982c <Copperlist1>,a0
     67e:	6000 fc66      	bra.w 2e6 <main+0x2e0>
     682:	4e71           	nop

00000684 <interruptHandler>:
#include "zoom.h"
#include "zoom102.h"

volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
     684:	598f           	subq.l #4,sp
     686:	2f08           	move.l a0,-(sp)
     688:	2f00           	move.l d0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     68a:	2079 0001 9820 	movea.l 19820 <hw>,a0
     690:	317c 0020 009c 	move.w #32,156(a0)
     696:	2079 0001 9820 	movea.l 19820 <hw>,a0
     69c:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	frameCounter++;
     6a2:	2039 0001 97d2 	move.l 197d2 <frameCounter>,d0
     6a8:	5280           	addq.l #1,d0
     6aa:	23c0 0001 97d2 	move.l d0,197d2 <frameCounter>
  UWORD *bp = 0x200;
     6b0:	2f7c 0000 0200 	move.l #512,8(sp)
     6b6:	0008 
  *bp = 0;
     6b8:	206f 0008      	movea.l 8(sp),a0
     6bc:	4250           	clr.w (a0)
  //Zoom_VblankHandler();
}
     6be:	201f           	move.l (sp)+,d0
     6c0:	205f           	movea.l (sp)+,a0
     6c2:	588f           	addq.l #4,sp
     6c4:	4e73           	rte

000006c6 <RunDemo>:

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     6c6:	2079 0001 9820 	movea.l 19820 <hw>,a0
     6cc:	317c 87ff 0096 	move.w #-30721,150(a0)
  //             1001001111100000	; copper,bitplane,blitter DMA

  /*hw->dmacon =   
  0x87e0;*/
	//SetInterruptHandler((APTR)interruptHandler);
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     6d2:	2079 0001 9820 	movea.l 19820 <hw>,a0
     6d8:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     6de:	2079 0001 9820 	movea.l 19820 <hw>,a0
     6e4:	317c 0020 009c 	move.w #32,156(a0)
     6ea:	6008           	bra.s 6f4 <RunDemo+0x2e>
  //PrepareDisplay();

	while(Zoom_Counter < 1000) {
		WaitVbl();
     6ec:	4eba 5cba      	jsr 63a8 <WaitVbl>(pc)
    RunFrame();
     6f0:	4eba 0038      	jsr 72a <RunFrame>(pc)
	while(Zoom_Counter < 1000) {
     6f4:	3039 0001 97d0 	move.w 197d0 <Zoom_Counter>,d0
     6fa:	0c40 03e7      	cmpi.w #999,d0
     6fe:	63ec           	bls.s 6ec <RunDemo+0x26>
	}
  Zoom_Dealloc();
     700:	4eba 0b56      	jsr 1258 <Zoom_Dealloc>(pc)

	//SetInterruptHandler((APTR)interruptHandler);
}
     704:	4e75           	rts

00000706 <SetInterrupt>:

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     706:	487a ff7c      	pea 684 <interruptHandler>(pc)
     70a:	4eba 60d2      	jsr 67de <SetInterruptHandler>(pc)
     70e:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     710:	2079 0001 9820 	movea.l 19820 <hw>,a0
     716:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     71c:	2079 0001 9820 	movea.l 19820 <hw>,a0
     722:	317c 0020 009c 	move.w #32,156(a0)
}
     728:	4e75           	rts

0000072a <RunFrame>:

void RunFrame() {
     72a:	4fef fff0      	lea -16(sp),sp
     72e:	2f0e           	move.l a6,-(sp)
  Zoom_Blit4ZoomFinished = 0;
     730:	4279 0001 97b8 	clr.w 197b8 <Zoom_Blit4ZoomFinished>
  UWORD tmp = Zoom_LevelOfZoom;
     736:	3f79 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,18(sp)
     73c:	0012 
  if(Zoom_LevelOfZoom == 0)
     73e:	3039 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,d0
     744:	4a40           	tst.w d0
     746:	6632           	bne.s 77a <RunFrame+0x50>
    CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
     748:	2f79 0001 97b0 	move.l 197b0 <Zoom_StartImage>,14(sp)
     74e:	000e 
     750:	2f79 0001 9830 	move.l 19830 <DrawBuffer>,10(sp)
     756:	000a 
     758:	2f7c 0000 ff00 	move.l #65280,6(sp)
     75e:	0006 
     760:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     766:	2c40           	movea.l d0,a6
     768:	206f 000e      	movea.l 14(sp),a0
     76c:	226f 000a      	movea.l 10(sp),a1
     770:	202f 0006      	move.l 6(sp),d0
     774:	4eae fd8a      	jsr -630(a6)
     778:	602c           	bra.s 7a6 <RunFrame+0x7c>
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );
     77a:	3039 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,d0
     780:	3000           	move.w d0,d0
     782:	0280 0000 ffff 	andi.l #65535,d0
     788:	2079 0001 9830 	movea.l 19830 <DrawBuffer>,a0
     78e:	2239 0001 9828 	move.l 19828 <ViewBuffer>,d1
     794:	4878 0005      	pea 5 <_start+0x5>
     798:	2f00           	move.l d0,-(sp)
     79a:	2f08           	move.l a0,-(sp)
     79c:	2f01           	move.l d1,-(sp)
     79e:	4eba 12ec      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
     7a2:	4fef 0010      	lea 16(sp),sp

  Zoom_Blit4ZoomFinished = 1;
     7a6:	33fc 0001 0001 	move.w #1,197b8 <Zoom_Blit4ZoomFinished>
     7ac:	97b8 
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  while( tmp == Zoom_LevelOfZoom) { }
     7ae:	3039 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,d0
     7b4:	b06f 0012      	cmp.w 18(sp),d0
     7b8:	67f4           	beq.s 7ae <RunFrame+0x84>
     7ba:	2c5f           	movea.l (sp)+,a6
     7bc:	4fef 0010      	lea 16(sp),sp
     7c0:	4e75           	rts

000007c2 <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     7c2:	4fef fff4      	lea -12(sp),sp
     7c6:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     7c8:	42af 000c      	clr.l 12(sp)
     7cc:	601e           	bra.s 7ec <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     7ce:	202f 0018      	move.l 24(sp),d0
     7d2:	2200           	move.l d0,d1
     7d4:	5481           	addq.l #2,d1
     7d6:	2f41 0018      	move.l d1,24(sp)
     7da:	2040           	movea.l d0,a0
     7dc:	3010           	move.w (a0),d0
     7de:	206f 0014      	movea.l 20(sp),a0
     7e2:	3080           	move.w d0,(a0)
    copperlist += 2;
     7e4:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     7e8:	52af 000c      	addq.l #1,12(sp)
     7ec:	7005           	moveq #5,d0
     7ee:	b0af 000c      	cmp.l 12(sp),d0
     7f2:	6cda           	bge.s 7ce <Zoom_InsertShift+0xc>
  }
  copperlist--;
     7f4:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     7f8:	222f 0018      	move.l 24(sp),d1
     7fc:	2401           	move.l d1,d2
     7fe:	5482           	addq.l #2,d2
     800:	2f42 0018      	move.l d2,24(sp)
     804:	202f 0014      	move.l 20(sp),d0
     808:	2400           	move.l d0,d2
     80a:	5482           	addq.l #2,d2
     80c:	2f42 0014      	move.l d2,20(sp)
     810:	2041           	movea.l d1,a0
     812:	3210           	move.w (a0),d1
     814:	2040           	movea.l d0,a0
     816:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     818:	202f 0018      	move.l 24(sp),d0
     81c:	2200           	move.l d0,d1
     81e:	5481           	addq.l #2,d1
     820:	2f41 0018      	move.l d1,24(sp)
     824:	2040           	movea.l d0,a0
     826:	3010           	move.w (a0),d0
     828:	206f 0014      	movea.l 20(sp),a0
     82c:	3080           	move.w d0,(a0)
  copperlist += 2;
     82e:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     832:	42af 0008      	clr.l 8(sp)
     836:	601e           	bra.s 856 <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     838:	202f 0018      	move.l 24(sp),d0
     83c:	2200           	move.l d0,d1
     83e:	5481           	addq.l #2,d1
     840:	2f41 0018      	move.l d1,24(sp)
     844:	2040           	movea.l d0,a0
     846:	3010           	move.w (a0),d0
     848:	206f 0014      	movea.l 20(sp),a0
     84c:	3080           	move.w d0,(a0)
    copperlist += 2;
     84e:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     852:	52af 0008      	addq.l #1,8(sp)
     856:	7009           	moveq #9,d0
     858:	b0af 0008      	cmp.l 8(sp),d0
     85c:	6cda           	bge.s 838 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     85e:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     862:	222f 0018      	move.l 24(sp),d1
     866:	2401           	move.l d1,d2
     868:	5482           	addq.l #2,d2
     86a:	2f42 0018      	move.l d2,24(sp)
     86e:	202f 0014      	move.l 20(sp),d0
     872:	2400           	move.l d0,d2
     874:	5482           	addq.l #2,d2
     876:	2f42 0014      	move.l d2,20(sp)
     87a:	2041           	movea.l d1,a0
     87c:	3210           	move.w (a0),d1
     87e:	2040           	movea.l d0,a0
     880:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     882:	202f 0018      	move.l 24(sp),d0
     886:	2200           	move.l d0,d1
     888:	5481           	addq.l #2,d1
     88a:	2f41 0018      	move.l d1,24(sp)
     88e:	2040           	movea.l d0,a0
     890:	3010           	move.w (a0),d0
     892:	206f 0014      	movea.l 20(sp),a0
     896:	3080           	move.w d0,(a0)
  copperlist += 2;
     898:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     89c:	42af 0004      	clr.l 4(sp)
     8a0:	601e           	bra.s 8c0 <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     8a2:	202f 0018      	move.l 24(sp),d0
     8a6:	2200           	move.l d0,d1
     8a8:	5481           	addq.l #2,d1
     8aa:	2f41 0018      	move.l d1,24(sp)
     8ae:	2040           	movea.l d0,a0
     8b0:	3010           	move.w (a0),d0
     8b2:	206f 0014      	movea.l 20(sp),a0
     8b6:	3080           	move.w d0,(a0)
    copperlist += 2;
     8b8:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     8bc:	52af 0004      	addq.l #1,4(sp)
     8c0:	7006           	moveq #6,d0
     8c2:	b0af 0004      	cmp.l 4(sp),d0
     8c6:	6cda           	bge.s 8a2 <Zoom_InsertShift+0xe0>
  }
}
     8c8:	241f           	move.l (sp)+,d2
     8ca:	4fef 000c      	lea 12(sp),sp
     8ce:	4e75           	rts

000008d0 <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
     8d0:	518f           	subq.l #8,sp
     8d2:	202f 000c      	move.l 12(sp),d0
     8d6:	3000           	move.w d0,d0
     8d8:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     8dc:	7200           	moveq #0,d1
     8de:	322f 0002      	move.w 2(sp),d1
     8e2:	2001           	move.l d1,d0
     8e4:	d080           	add.l d0,d0
     8e6:	d081           	add.l d1,d0
     8e8:	2200           	move.l d0,d1
     8ea:	e789           	lsl.l #3,d1
     8ec:	d081           	add.l d1,d0
     8ee:	e788           	lsl.l #3,d0
     8f0:	2200           	move.l d0,d1
     8f2:	0681 0001 8228 	addi.l #98856,d1
     8f8:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     8fc:	202f 0010      	move.l 16(sp),d0
     900:	0680 0000 012a 	addi.l #298,d0
     906:	2f2f 0004      	move.l 4(sp),-(sp)
     90a:	2f00           	move.l d0,-(sp)
     90c:	4eba feb4      	jsr 7c2 <Zoom_InsertShift>(pc)
     910:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     912:	7236           	moveq #54,d1
     914:	d2af 0004      	add.l 4(sp),d1
     918:	202f 0010      	move.l 16(sp),d0
     91c:	0680 0000 01a2 	addi.l #418,d0
     922:	2f01           	move.l d1,-(sp)
     924:	2f00           	move.l d0,-(sp)
     926:	4eba fe9a      	jsr 7c2 <Zoom_InsertShift>(pc)
     92a:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     92c:	726c           	moveq #108,d1
     92e:	d2af 0004      	add.l 4(sp),d1
     932:	202f 0010      	move.l 16(sp),d0
     936:	0680 0000 0212 	addi.l #530,d0
     93c:	2f01           	move.l d1,-(sp)
     93e:	2f00           	move.l d0,-(sp)
     940:	4eba fe80      	jsr 7c2 <Zoom_InsertShift>(pc)
     944:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     946:	222f 0004      	move.l 4(sp),d1
     94a:	0681 0000 00a2 	addi.l #162,d1
     950:	202f 0010      	move.l 16(sp),d0
     954:	0680 0000 0282 	addi.l #642,d0
     95a:	2f01           	move.l d1,-(sp)
     95c:	2f00           	move.l d0,-(sp)
     95e:	4eba fe62      	jsr 7c2 <Zoom_InsertShift>(pc)
     962:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     964:	508f           	addq.l #8,sp
     966:	4e75           	rts

00000968 <Test_Zoom2>:
#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
     968:	4fef fea0      	lea -352(sp),sp
     96c:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  UWORD size4buffer = 40*544*ZMBPLDEPTH;
     970:	3f7c a900 015a 	move.w #-22272,346(sp)
  UWORD size4target = 44*272*ZMBPLDEPTH;
     976:	3f7c e9c0 0158 	move.w #-5696,344(sp)
  ULONG *pic1 = AllocMem( size4buffer, MEMF_CHIP);
     97c:	7000           	moveq #0,d0
     97e:	302f 015a      	move.w 346(sp),d0
     982:	2f40 0154      	move.l d0,340(sp)
     986:	7002           	moveq #2,d0
     988:	2f40 0150      	move.l d0,336(sp)
     98c:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     992:	2c40           	movea.l d0,a6
     994:	202f 0154      	move.l 340(sp),d0
     998:	222f 0150      	move.l 336(sp),d1
     99c:	4eae ff3a      	jsr -198(a6)
     9a0:	2f40 014c      	move.l d0,332(sp)
     9a4:	202f 014c      	move.l 332(sp),d0
     9a8:	2f40 0148      	move.l d0,328(sp)
  if( pic1 == 0) {
     9ac:	4aaf 0148      	tst.l 328(sp)
     9b0:	6646           	bne.s 9f8 <Test_Zoom2+0x90>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic1\n", 38);
     9b2:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     9b8:	2c40           	movea.l d0,a6
     9ba:	4eae ffc4      	jsr -60(a6)
     9be:	2f40 0144      	move.l d0,324(sp)
     9c2:	202f 0144      	move.l 324(sp),d0
     9c6:	2f40 0140      	move.l d0,320(sp)
     9ca:	2f7c 0000 6c82 	move.l #27778,316(sp)
     9d0:	013c 
     9d2:	7226           	moveq #38,d1
     9d4:	2f41 0138      	move.l d1,312(sp)
     9d8:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     9de:	2c40           	movea.l d0,a6
     9e0:	222f 0140      	move.l 320(sp),d1
     9e4:	242f 013c      	move.l 316(sp),d2
     9e8:	262f 0138      	move.l 312(sp),d3
     9ec:	4eae ffd0      	jsr -48(a6)
     9f0:	2f40 0134      	move.l d0,308(sp)
     9f4:	6000 0402      	bra.w df8 <Test_Zoom2+0x490>
    return;
  }
  ULONG *pic2 = AllocMem( size4buffer*2,MEMF_CHIP);
     9f8:	7000           	moveq #0,d0
     9fa:	302f 015a      	move.w 346(sp),d0
     9fe:	d080           	add.l d0,d0
     a00:	2f40 0130      	move.l d0,304(sp)
     a04:	7002           	moveq #2,d0
     a06:	2f40 012c      	move.l d0,300(sp)
     a0a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     a10:	2c40           	movea.l d0,a6
     a12:	202f 0130      	move.l 304(sp),d0
     a16:	222f 012c      	move.l 300(sp),d1
     a1a:	4eae ff3a      	jsr -198(a6)
     a1e:	2f40 0128      	move.l d0,296(sp)
     a22:	202f 0128      	move.l 296(sp),d0
     a26:	2f40 0124      	move.l d0,292(sp)
  if( pic2 == 0) {
     a2a:	4aaf 0124      	tst.l 292(sp)
     a2e:	6646           	bne.s a76 <Test_Zoom2+0x10e>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic2\n", 38);
     a30:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     a36:	2c40           	movea.l d0,a6
     a38:	4eae ffc4      	jsr -60(a6)
     a3c:	2f40 0120      	move.l d0,288(sp)
     a40:	202f 0120      	move.l 288(sp),d0
     a44:	2f40 011c      	move.l d0,284(sp)
     a48:	2f7c 0000 6ca9 	move.l #27817,280(sp)
     a4e:	0118 
     a50:	7226           	moveq #38,d1
     a52:	2f41 0114      	move.l d1,276(sp)
     a56:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     a5c:	2c40           	movea.l d0,a6
     a5e:	222f 011c      	move.l 284(sp),d1
     a62:	242f 0118      	move.l 280(sp),d2
     a66:	262f 0114      	move.l 276(sp),d3
     a6a:	4eae ffd0      	jsr -48(a6)
     a6e:	2f40 0110      	move.l d0,272(sp)
     a72:	6000 0384      	bra.w df8 <Test_Zoom2+0x490>
    return;
  }
  ULONG *target = AllocMem( size4target, MEMF_CHIP);
     a76:	7000           	moveq #0,d0
     a78:	302f 0158      	move.w 344(sp),d0
     a7c:	2f40 010c      	move.l d0,268(sp)
     a80:	7002           	moveq #2,d0
     a82:	2f40 0108      	move.l d0,264(sp)
     a86:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     a8c:	2c40           	movea.l d0,a6
     a8e:	202f 010c      	move.l 268(sp),d0
     a92:	222f 0108      	move.l 264(sp),d1
     a96:	4eae ff3a      	jsr -198(a6)
     a9a:	2f40 0104      	move.l d0,260(sp)
     a9e:	202f 0104      	move.l 260(sp),d0
     aa2:	2f40 0100      	move.l d0,256(sp)
  UWORD *bp = 0x200;
     aa6:	2f7c 0000 0200 	move.l #512,252(sp)
     aac:	00fc 
  *bp = 0;
     aae:	206f 00fc      	movea.l 252(sp),a0
     ab2:	4250           	clr.w (a0)
  if( target == 0) {
     ab4:	4aaf 0100      	tst.l 256(sp)
     ab8:	6646           	bne.s b00 <Test_Zoom2+0x198>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
     aba:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     ac0:	2c40           	movea.l d0,a6
     ac2:	4eae ffc4      	jsr -60(a6)
     ac6:	2f40 00f8      	move.l d0,248(sp)
     aca:	202f 00f8      	move.l 248(sp),d0
     ace:	2f40 00f4      	move.l d0,244(sp)
     ad2:	2f7c 0000 6cd0 	move.l #27856,240(sp)
     ad8:	00f0 
     ada:	7228           	moveq #40,d1
     adc:	2f41 00ec      	move.l d1,236(sp)
     ae0:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     ae6:	2c40           	movea.l d0,a6
     ae8:	222f 00f4      	move.l 244(sp),d1
     aec:	242f 00f0      	move.l 240(sp),d2
     af0:	262f 00ec      	move.l 236(sp),d3
     af4:	4eae ffd0      	jsr -48(a6)
     af8:	2f40 00e8      	move.l d0,232(sp)
     afc:	6000 02fa      	bra.w df8 <Test_Zoom2+0x490>
    return;
  }
  Zoom_Zl4Words = AllocMem( 21*8, MEMF_ANY);
     b00:	2f7c 0000 00a8 	move.l #168,228(sp)
     b06:	00e4 
     b08:	42af 00e0      	clr.l 224(sp)
     b0c:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     b12:	2c40           	movea.l d0,a6
     b14:	202f 00e4      	move.l 228(sp),d0
     b18:	222f 00e0      	move.l 224(sp),d1
     b1c:	4eae ff3a      	jsr -198(a6)
     b20:	2f40 00dc      	move.l d0,220(sp)
     b24:	202f 00dc      	move.l 220(sp),d0
     b28:	23c0 0001 97e2 	move.l d0,197e2 <Zoom_Zl4Words>
  if( Zoom_Zl4Words == 0) {
     b2e:	2039 0001 97e2 	move.l 197e2 <Zoom_Zl4Words>,d0
     b34:	4a80           	tst.l d0
     b36:	6646           	bne.s b7e <Test_Zoom2+0x216>
    Write( Output(), "Test_Zoom2: Cannot alloc mem for Zoom_Zl4Words\n", 40);
     b38:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     b3e:	2c40           	movea.l d0,a6
     b40:	4eae ffc4      	jsr -60(a6)
     b44:	2f40 00d8      	move.l d0,216(sp)
     b48:	202f 00d8      	move.l 216(sp),d0
     b4c:	2f40 00d4      	move.l d0,212(sp)
     b50:	2f7c 0000 6cf9 	move.l #27897,208(sp)
     b56:	00d0 
     b58:	7028           	moveq #40,d0
     b5a:	2f40 00cc      	move.l d0,204(sp)
     b5e:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     b64:	2c40           	movea.l d0,a6
     b66:	222f 00d4      	move.l 212(sp),d1
     b6a:	242f 00d0      	move.l 208(sp),d2
     b6e:	262f 00cc      	move.l 204(sp),d3
     b72:	4eae ffd0      	jsr -48(a6)
     b76:	2f40 00c8      	move.l d0,200(sp)
     b7a:	6000 027c      	bra.w df8 <Test_Zoom2+0x490>
    return;
  }
  
  UWORD *pos2write = Zoom_Zl4Words;
     b7e:	2f79 0001 97e2 	move.l 197e2 <Zoom_Zl4Words>,368(sp)
     b84:	0170 
  for( int i=0;i<14;i++) {
     b86:	42af 016c      	clr.l 364(sp)
     b8a:	603a           	bra.s bc6 <Test_Zoom2+0x25e>
    *pos2write++ = 4;
     b8c:	202f 0170      	move.l 368(sp),d0
     b90:	2200           	move.l d0,d1
     b92:	5481           	addq.l #2,d1
     b94:	2f41 0170      	move.l d1,368(sp)
     b98:	2040           	movea.l d0,a0
     b9a:	30bc 0004      	move.w #4,(a0)
    *pos2write++ = 4;
     b9e:	202f 0170      	move.l 368(sp),d0
     ba2:	2200           	move.l d0,d1
     ba4:	5481           	addq.l #2,d1
     ba6:	2f41 0170      	move.l d1,368(sp)
     baa:	2040           	movea.l d0,a0
     bac:	30bc 0004      	move.w #4,(a0)
    *pos2write++ = 8;
     bb0:	202f 0170      	move.l 368(sp),d0
     bb4:	2200           	move.l d0,d1
     bb6:	5481           	addq.l #2,d1
     bb8:	2f41 0170      	move.l d1,368(sp)
     bbc:	2040           	movea.l d0,a0
     bbe:	30bc 0008      	move.w #8,(a0)
  for( int i=0;i<14;i++) {
     bc2:	52af 016c      	addq.l #1,364(sp)
     bc6:	700d           	moveq #13,d0
     bc8:	b0af 016c      	cmp.l 364(sp),d0
     bcc:	6cbe           	bge.s b8c <Test_Zoom2+0x224>
  }
  //16   16 ffff
  //8+16 40 ff00
  //8+16 64 0000
  Utils_FillLong( pic1, 0x0, size4buffer);
     bce:	7000           	moveq #0,d0
     bd0:	302f 015a      	move.w 346(sp),d0
     bd4:	2f00           	move.l d0,-(sp)
     bd6:	42a7           	clr.l -(sp)
     bd8:	2f2f 0150      	move.l 336(sp),-(sp)
     bdc:	4eba 57a2      	jsr 6380 <Utils_FillLong>(pc)
     be0:	4fef 000c      	lea 12(sp),sp
  Utils_FillLong( pic2, 0x0000ffff, size4buffer*2);
     be4:	7000           	moveq #0,d0
     be6:	302f 015a      	move.w 346(sp),d0
     bea:	d080           	add.l d0,d0
     bec:	2f00           	move.l d0,-(sp)
     bee:	2f3c 0000 ffff 	move.l #65535,-(sp)
     bf4:	2f2f 012c      	move.l 300(sp),-(sp)
     bf8:	4eba 5786      	jsr 6380 <Utils_FillLong>(pc)
     bfc:	4fef 000c      	lea 12(sp),sp
  //Utils_FillLong( pic2, 0x0000ffff, size4buffer*2);

  
  for( int i=1;i<=1;i++) {
     c00:	7201           	moveq #1,d1
     c02:	2f41 0168      	move.l d1,360(sp)
     c06:	6000 0178      	bra.w d80 <Test_Zoom2+0x418>
    Zoom_ZoomIntoPicture2( (UWORD *)pic1, (UWORD *) pic2,(UWORD *) target, i, 
     c0a:	202f 0168      	move.l 360(sp),d0
     c0e:	3000           	move.w d0,d0
     c10:	0280 0000 ffff 	andi.l #65535,d0
     c16:	4878 0005      	pea 5 <_start+0x5>
     c1a:	2f00           	move.l d0,-(sp)
     c1c:	2f2f 0108      	move.l 264(sp),-(sp)
     c20:	2f2f 0130      	move.l 304(sp),-(sp)
     c24:	2f2f 0158      	move.l 344(sp),-(sp)
     c28:	4eba 129a      	jsr 1ec4 <Zoom_ZoomIntoPicture2>(pc)
     c2c:	4fef 0014      	lea 20(sp),sp
                                                                             5);
    UWORD *bp = 0x200;
     c30:	2f7c 0000 0200 	move.l #512,196(sp)
     c36:	00c4 
    *bp = 0;
     c38:	206f 00c4      	movea.l 196(sp),a0
     c3c:	4250           	clr.w (a0)
    UWORD *pos = (UWORD *) target + 1;
     c3e:	202f 0100      	move.l 256(sp),d0
     c42:	5480           	addq.l #2,d0
     c44:	2f40 0164      	move.l d0,356(sp)
    //ULONG pattern = 0xffff << (16 - i*2);
    UWORD pattern[3] = { 0x0, 0xff00, 0xffff };
     c48:	426f 007e      	clr.w 126(sp)
     c4c:	3f7c ff00 0080 	move.w #-256,128(sp)
     c52:	3f7c ffff 0082 	move.w #-1,130(sp)
    for( int i2=0;i2<7;i2++) {
     c58:	42af 0160      	clr.l 352(sp)
     c5c:	6000 0114      	bra.w d72 <Test_Zoom2+0x40a>
      for( int i3=0; i3<3;i3++) {
     c60:	42af 015c      	clr.l 348(sp)
     c64:	6000 00fe      	bra.w d64 <Test_Zoom2+0x3fc>
        if(*pos++ != pattern[i3])  {
     c68:	202f 0164      	move.l 356(sp),d0
     c6c:	2200           	move.l d0,d1
     c6e:	5481           	addq.l #2,d1
     c70:	2f41 0164      	move.l d1,356(sp)
     c74:	2040           	movea.l d0,a0
     c76:	3210           	move.w (a0),d1
     c78:	202f 015c      	move.l 348(sp),d0
     c7c:	d080           	add.l d0,d0
     c7e:	41ef 0174      	lea 372(sp),a0
     c82:	d088           	add.l a0,d0
     c84:	2040           	movea.l d0,a0
     c86:	41e8 ff0a      	lea -246(a0),a0
     c8a:	3010           	move.w (a0),d0
     c8c:	b041           	cmp.w d1,d0
     c8e:	6700 00d0      	beq.w d60 <Test_Zoom2+0x3f8>
          pos--;
     c92:	55af 0164      	subq.l #2,356(sp)
          UWORD data[3];
          char str[100];
          data[0] = i;
     c96:	202f 0168      	move.l 360(sp),d0
     c9a:	3f40 0078      	move.w d0,120(sp)
          data[1] = i2*3+i3;
     c9e:	222f 0160      	move.l 352(sp),d1
     ca2:	3001           	move.w d1,d0
     ca4:	d040           	add.w d0,d0
     ca6:	d240           	add.w d0,d1
     ca8:	202f 015c      	move.l 348(sp),d0
     cac:	d041           	add.w d1,d0
     cae:	3f40 007a      	move.w d0,122(sp)
          data[2] = *pos;
     cb2:	206f 0164      	movea.l 356(sp),a0
     cb6:	3010           	move.w (a0),d0
     cb8:	3f40 007c      	move.w d0,124(sp)
          pos++;
     cbc:	54af 0164      	addq.l #2,356(sp)
          
          RawDoFmt( "Test_Zoom2: Pattern for zoomlevel %d, byte %d messed up."
     cc0:	2f7c 0000 6d29 	move.l #27945,192(sp)
     cc6:	00c0 
     cc8:	203c 0000 0174 	move.l #372,d0
     cce:	d08f           	add.l sp,d0
     cd0:	0680 ffff ff04 	addi.l #-252,d0
     cd6:	2f40 00bc      	move.l d0,188(sp)
     cda:	2f7c 0000 6a6c 	move.l #27244,184(sp)
     ce0:	00b8 
     ce2:	223c 0000 0174 	move.l #372,d1
     ce8:	d28f           	add.l sp,d1
     cea:	0681 ffff fea0 	addi.l #-352,d1
     cf0:	2f41 00b4      	move.l d1,180(sp)
     cf4:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     cfa:	2c40           	movea.l d0,a6
     cfc:	206f 00c0      	movea.l 192(sp),a0
     d00:	226f 00bc      	movea.l 188(sp),a1
     d04:	246f 00b8      	movea.l 184(sp),a2
     d08:	266f 00b4      	movea.l 180(sp),a3
     d0c:	4eae fdf6      	jsr -522(a6)
     d10:	2f40 00b0      	move.l d0,176(sp)
                                      "Result was %x.\n", data, PutChar, str);
          Write( Output(), str, 66);
     d14:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     d1a:	2c40           	movea.l d0,a6
     d1c:	4eae ffc4      	jsr -60(a6)
     d20:	2f40 00ac      	move.l d0,172(sp)
     d24:	202f 00ac      	move.l 172(sp),d0
     d28:	2f40 00a8      	move.l d0,168(sp)
     d2c:	203c 0000 0174 	move.l #372,d0
     d32:	d08f           	add.l sp,d0
     d34:	0680 ffff fea0 	addi.l #-352,d0
     d3a:	2f40 00a4      	move.l d0,164(sp)
     d3e:	7242           	moveq #66,d1
     d40:	2f41 00a0      	move.l d1,160(sp)
     d44:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
     d4a:	2c40           	movea.l d0,a6
     d4c:	222f 00a8      	move.l 168(sp),d1
     d50:	242f 00a4      	move.l 164(sp),d2
     d54:	262f 00a0      	move.l 160(sp),d3
     d58:	4eae ffd0      	jsr -48(a6)
     d5c:	2f40 009c      	move.l d0,156(sp)
      for( int i3=0; i3<3;i3++) {
     d60:	52af 015c      	addq.l #1,348(sp)
     d64:	7002           	moveq #2,d0
     d66:	b0af 015c      	cmp.l 348(sp),d0
     d6a:	6c00 fefc      	bge.w c68 <Test_Zoom2+0x300>
    for( int i2=0;i2<7;i2++) {
     d6e:	52af 0160      	addq.l #1,352(sp)
     d72:	7206           	moveq #6,d1
     d74:	b2af 0160      	cmp.l 352(sp),d1
     d78:	6c00 fee6      	bge.w c60 <Test_Zoom2+0x2f8>
  for( int i=1;i<=1;i++) {
     d7c:	52af 0168      	addq.l #1,360(sp)
     d80:	7001           	moveq #1,d0
     d82:	b0af 0168      	cmp.l 360(sp),d0
     d86:	6c00 fe82      	bge.w c0a <Test_Zoom2+0x2a2>
        }
      }
    }
  }
  FreeMem( pic1, size4buffer);
     d8a:	2f6f 0148 0098 	move.l 328(sp),152(sp)
     d90:	7000           	moveq #0,d0
     d92:	302f 015a      	move.w 346(sp),d0
     d96:	2f40 0094      	move.l d0,148(sp)
     d9a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     da0:	2c40           	movea.l d0,a6
     da2:	226f 0098      	movea.l 152(sp),a1
     da6:	202f 0094      	move.l 148(sp),d0
     daa:	4eae ff2e      	jsr -210(a6)
  FreeMem( pic2, size4buffer*2);
     dae:	2f6f 0124 0090 	move.l 292(sp),144(sp)
     db4:	7000           	moveq #0,d0
     db6:	302f 015a      	move.w 346(sp),d0
     dba:	d080           	add.l d0,d0
     dbc:	2f40 008c      	move.l d0,140(sp)
     dc0:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     dc6:	2c40           	movea.l d0,a6
     dc8:	226f 0090      	movea.l 144(sp),a1
     dcc:	202f 008c      	move.l 140(sp),d0
     dd0:	4eae ff2e      	jsr -210(a6)
  FreeMem( target, size4target);
     dd4:	2f6f 0100 0088 	move.l 256(sp),136(sp)
     dda:	7000           	moveq #0,d0
     ddc:	302f 0158      	move.w 344(sp),d0
     de0:	2f40 0084      	move.l d0,132(sp)
     de4:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     dea:	2c40           	movea.l d0,a6
     dec:	226f 0088      	movea.l 136(sp),a1
     df0:	202f 0084      	move.l 132(sp),d0
     df4:	4eae ff2e      	jsr -210(a6)
     df8:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
     dfc:	4fef 0160      	lea 352(sp),sp
     e00:	4e75           	rts

00000e02 <Zoom_VblankHandler>:
UWORD *Zoom_Zl4Words;


void Zoom_VblankHandler() {
  
  Zoom_Counter++;
     e02:	3039 0001 97d0 	move.w 197d0 <Zoom_Counter>,d0
     e08:	5240           	addq.w #1,d0
     e0a:	33c0 0001 97d0 	move.w d0,197d0 <Zoom_Counter>
  SwapCl();
     e10:	4eba 58f2      	jsr 6704 <SwapCl>(pc)
  Zoom_MouseReleased = 1;
     e14:	33fc 0001 0001 	move.w #1,197b4 <Zoom_MouseReleased>
     e1a:	97b4 
  if( MouseLeft())
     e1c:	4eba 5550      	jsr 636e <MouseLeft>(pc)
     e20:	4a40           	tst.w d0
     e22:	6708           	beq.s e2c <Zoom_VblankHandler+0x2a>
    Zoom_Mousepressed = 1;
     e24:	33fc 0001 0001 	move.w #1,197b6 <Zoom_Mousepressed>
     e2a:	97b6 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
     e2c:	3039 0001 97b6 	move.w 197b6 <Zoom_Mousepressed>,d0
     e32:	0c40 0001      	cmpi.w #1,d0
     e36:	6616           	bne.s e4e <Zoom_VblankHandler+0x4c>
     e38:	4eba 5534      	jsr 636e <MouseLeft>(pc)
     e3c:	4a40           	tst.w d0
     e3e:	660e           	bne.s e4e <Zoom_VblankHandler+0x4c>
    Zoom_MouseReleased = 1;
     e40:	33fc 0001 0001 	move.w #1,197b4 <Zoom_MouseReleased>
     e46:	97b4 
    Zoom_Mousepressed = 0;
     e48:	4279 0001 97b6 	clr.w 197b6 <Zoom_Mousepressed>
  }
    if( Zoom_MouseReleased == 1) {
     e4e:	3039 0001 97b4 	move.w 197b4 <Zoom_MouseReleased>,d0
     e54:	0c40 0001      	cmpi.w #1,d0
     e58:	666c           	bne.s ec6 <Zoom_VblankHandler+0xc4>
      Zoom_MouseReleased = 0;
     e5a:	4279 0001 97b4 	clr.w 197b4 <Zoom_MouseReleased>
      if( Zoom_LevelOf102Zoom == 0) {
     e60:	3039 0001 97bc 	move.w 197bc <Zoom_LevelOf102Zoom>,d0
     e66:	4a40           	tst.w d0
     e68:	664e           	bne.s eb8 <Zoom_VblankHandler+0xb6>
 
        if( Zoom_LevelOfZoom == 17)
     e6a:	3039 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,d0
     e70:	0c40 0011      	cmpi.w #17,d0
     e74:	660a           	bne.s e80 <Zoom_VblankHandler+0x7e>
          Zoom_LevelOfZoom = 0;
     e76:	33fc 0000 0001 	move.w #0,197ba <Zoom_LevelOfZoom>
     e7c:	97ba 
     e7e:	600e           	bra.s e8e <Zoom_VblankHandler+0x8c>
        else
          Zoom_LevelOfZoom++;
     e80:	3039 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,d0
     e86:	5240           	addq.w #1,d0
     e88:	33c0 0001 97ba 	move.w d0,197ba <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = MaxZoom102[Zoom_LevelOfZoom] - 2;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
     e8e:	3039 0001 97ba 	move.w 197ba <Zoom_LevelOfZoom>,d0
     e94:	3000           	move.w d0,d0
     e96:	0280 0000 ffff 	andi.l #65535,d0
     e9c:	2240           	movea.l d0,a1
     e9e:	d3c0           	adda.l d0,a1
     ea0:	41f9 0001 9128 	lea 19128 <MaxZoom102>,a0
     ea6:	3031 8800      	move.w (0,a1,a0.l),d0
     eaa:	5540           	subq.w #2,d0
     eac:	33c0 0001 97bc 	move.w d0,197bc <Zoom_LevelOf102Zoom>
        Zoom_SwapBuffers();
     eb2:	4eba 0fee      	jsr 1ea2 <Zoom_SwapBuffers>(pc)
     eb6:	600e           	bra.s ec6 <Zoom_VblankHandler+0xc4>
      } else 
        Zoom_LevelOf102Zoom--;
     eb8:	3039 0001 97bc 	move.w 197bc <Zoom_LevelOf102Zoom>,d0
     ebe:	5340           	subq.w #1,d0
     ec0:	33c0 0001 97bc 	move.w d0,197bc <Zoom_LevelOf102Zoom>
    }
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
     ec6:	2239 0001 9824 	move.l 19824 <DrawCopper>,d1
     ecc:	3039 0001 97bc 	move.w 197bc <Zoom_LevelOf102Zoom>,d0
     ed2:	3000           	move.w d0,d0
     ed4:	0280 0000 ffff 	andi.l #65535,d0
     eda:	2f01           	move.l d1,-(sp)
     edc:	2f00           	move.l d0,-(sp)
     ede:	4eba f9f0      	jsr 8d0 <Zoom_Shrink102>(pc)
     ee2:	508f           	addq.l #8,sp
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
     ee4:	2239 0001 9824 	move.l 19824 <DrawCopper>,d1
     eea:	2039 0001 9828 	move.l 19828 <ViewBuffer>,d0
     ef0:	2f01           	move.l d1,-(sp)
     ef2:	2f00           	move.l d0,-(sp)
     ef4:	4eba 0f30      	jsr 1e26 <Zoom_SetBplPointers>(pc)
     ef8:	508f           	addq.l #8,sp
 
}
     efa:	4e75           	rts

00000efc <Zoom_LoadImage>:

void Zoom_LoadImage( ULONG *destination) {  
     efc:	4fef fff4      	lea -12(sp),sp
     f00:	2f0e           	move.l a6,-(sp)
  CopyMem( startimage, destination, ZMBPLSIZE);
     f02:	2f79 0001 917c 	move.l 1917c <startimage>,12(sp)
     f08:	000c 
     f0a:	2f6f 0014 0008 	move.l 20(sp),8(sp)
     f10:	2f7c 0000 ff00 	move.l #65280,4(sp)
     f16:	0004 
     f18:	2039 0001 983c 	move.l 1983c <SysBase>,d0
     f1e:	2c40           	movea.l d0,a6
     f20:	206f 000c      	movea.l 12(sp),a0
     f24:	226f 0008      	movea.l 8(sp),a1
     f28:	202f 0004      	move.l 4(sp),d0
     f2c:	4eae fd90      	jsr -624(a6)
}
     f30:	2c5f           	movea.l (sp)+,a6
     f32:	4fef 000c      	lea 12(sp),sp
     f36:	4e75           	rts

00000f38 <Zoom_CopyWord>:

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
     f38:	598f           	subq.l #4,sp
     f3a:	202f 0010      	move.l 16(sp),d0
     f3e:	3000           	move.w d0,d0
     f40:	3f40 0002      	move.w d0,2(sp)

  WaitBlt();
     f44:	4eba 5882      	jsr 67c8 <WaitBlt>(pc)

  hw->bltapt = (UWORD *) source;
     f48:	2079 0001 9820 	movea.l 19820 <hw>,a0
     f4e:	216f 0008 0050 	move.l 8(sp),80(a0)
  hw->bltdpt = (UWORD *) destination;
     f54:	2079 0001 9820 	movea.l 19820 <hw>,a0
     f5a:	216f 000c 0054 	move.l 12(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     f60:	302f 0002      	move.w 2(sp),d0
     f64:	ed48           	lsl.w #6,d0
     f66:	2079 0001 9820 	movea.l 19820 <hw>,a0
     f6c:	5440           	addq.w #2,d0
     f6e:	3140 0058      	move.w d0,88(a0)

}
     f72:	588f           	addq.l #4,sp
     f74:	4e75           	rts

00000f76 <Zoom_ZoomBlit>:

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {
     f76:	518f           	subq.l #8,sp
     f78:	202f 0014      	move.l 20(sp),d0
     f7c:	3000           	move.w d0,d0
     f7e:	3f40 0002      	move.w d0,2(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
     f82:	3039 0001 97ca 	move.w 197ca <ZoomBlit_Increment4SrcA>,d0
     f88:	3000           	move.w d0,d0
     f8a:	0280 0000 ffff 	andi.l #65535,d0
     f90:	d080           	add.l d0,d0
     f92:	222f 000c      	move.l 12(sp),d1
     f96:	d280           	add.l d0,d1
     f98:	2f41 0004      	move.l d1,4(sp)
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  WaitBlt();
     f9c:	4eba 582a      	jsr 67c8 <WaitBlt>(pc)
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = blta;
     fa0:	2079 0001 9820 	movea.l 19820 <hw>,a0
     fa6:	216f 0004 0050 	move.l 4(sp),80(a0)
  hw->bltbpt = source;
     fac:	2079 0001 9820 	movea.l 19820 <hw>,a0
     fb2:	216f 000c 004c 	move.l 12(sp),76(a0)
  hw->bltdpt = destination;
     fb8:	2079 0001 9820 	movea.l 19820 <hw>,a0
     fbe:	216f 0010 0054 	move.l 16(sp),84(a0)
  hw->bltsize = (height<<6)+2;
     fc4:	302f 0002      	move.w 2(sp),d0
     fc8:	ed48           	lsl.w #6,d0
     fca:	2079 0001 9820 	movea.l 19820 <hw>,a0
     fd0:	5440           	addq.w #2,d0
     fd2:	3140 0058      	move.w d0,88(a0)

}
     fd6:	508f           	addq.l #8,sp
     fd8:	4e75           	rts

00000fda <Zoom_ZoomBlit2>:

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod) {
     fda:	4fef fff4      	lea -12(sp),sp
     fde:	206f 001c      	movea.l 28(sp),a0
     fe2:	222f 0020      	move.l 32(sp),d1
     fe6:	202f 0024      	move.l 36(sp),d0
     fea:	3048           	movea.w a0,a0
     fec:	3f48 0004      	move.w a0,4(sp)
     ff0:	3201           	move.w d1,d1
     ff2:	3f41 0002      	move.w d1,2(sp)
     ff6:	3000           	move.w d0,d0
     ff8:	3e80           	move.w d0,(sp)

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  UWORD *bp = 0x200;
     ffa:	2f7c 0000 0200 	move.l #512,8(sp)
    1000:	0008 
  *bp = 0;
    1002:	206f 0008      	movea.l 8(sp),a0
    1006:	4250           	clr.w (a0)
  UWORD bltsize = (height << 6) + 2;
    1008:	302f 0004      	move.w 4(sp),d0
    100c:	ed48           	lsl.w #6,d0
    100e:	3200           	move.w d0,d1
    1010:	5441           	addq.w #2,d1
    1012:	3f41 0006      	move.w d1,6(sp)
  
  /*UWORD *bp = 0x200;
  *bp = 0;*/
  WaitBlt();
    1016:	4eba 57b0      	jsr 67c8 <WaitBlt>(pc)
  1101
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  hw->bltamod = bltamod;
    101a:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1020:	316f 0002 0064 	move.w 2(sp),100(a0)
  hw->bltbmod = bltbmod;  
    1026:	2079 0001 9820 	movea.l 19820 <hw>,a0
    102c:	3157 0062      	move.w (sp),98(a0)
  hw->bltapt = src4a;
    1030:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1036:	216f 0010 0050 	move.l 16(sp),80(a0)
  hw->bltbpt = src4b;
    103c:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1042:	216f 0014 004c 	move.l 20(sp),76(a0)
  hw->bltdpt = dst;
    1048:	2079 0001 9820 	movea.l 19820 <hw>,a0
    104e:	216f 0018 0054 	move.l 24(sp),84(a0)
  hw->bltsize = (height<<6)+2;
    1054:	302f 0004      	move.w 4(sp),d0
    1058:	ed48           	lsl.w #6,d0
    105a:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1060:	5440           	addq.w #2,d0
    1062:	3140 0058      	move.w d0,88(a0)

}
    1066:	4fef 000c      	lea 12(sp),sp
    106a:	4e75           	rts

0000106c <Zoom_InitRun>:


void Zoom_InitRun() {
    106c:	4fef ffc8      	lea -56(sp),sp
    1070:	2f0e           	move.l a6,-(sp)
    
  Zoom_Counter = 0;
    1072:	4279 0001 97d0 	clr.w 197d0 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1078:	7004           	moveq #4,d0
    107a:	2f40 0038      	move.l d0,56(sp)
    107e:	7002           	moveq #2,d0
    1080:	2f40 0034      	move.l d0,52(sp)
    1084:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    108a:	2c40           	movea.l d0,a6
    108c:	202f 0038      	move.l 56(sp),d0
    1090:	222f 0034      	move.l 52(sp),d1
    1094:	4eae ff3a      	jsr -198(a6)
    1098:	2f40 0030      	move.l d0,48(sp)
    109c:	202f 0030      	move.l 48(sp),d0
    10a0:	23c0 0001 97c2 	move.l d0,197c2 <Zoom_ZoomBlitMask>
  Zoom_LevelOf102Zoom = 15;
    10a6:	33fc 000f 0001 	move.w #15,197bc <Zoom_LevelOf102Zoom>
    10ac:	97bc 
  ZoomHorizontal = 16;
    10ae:	33fc 0010 0001 	move.w #16,197c0 <ZoomHorizontal>
    10b4:	97c0 
  Zoom_PrepareDisplay();
    10b6:	4eba 01dc      	jsr 1294 <Zoom_PrepareDisplay>(pc)
  Zoom_StartImage = startimage;
    10ba:	2039 0001 917c 	move.l 1917c <startimage>,d0
    10c0:	23c0 0001 97b0 	move.l d0,197b0 <Zoom_StartImage>
  Zoom_LoadImage( Bitplane1);
    10c6:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
    10cc:	2f00           	move.l d0,-(sp)
    10ce:	4eba fe2c      	jsr efc <Zoom_LoadImage>(pc)
    10d2:	588f           	addq.l #4,sp
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
    10d4:	2239 0001 9814 	move.l 19814 <Bitplane2>,d1
    10da:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
    10e0:	4878 0005      	pea 5 <_start+0x5>
    10e4:	42a7           	clr.l -(sp)
    10e6:	2f01           	move.l d1,-(sp)
    10e8:	2f00           	move.l d0,-(sp)
    10ea:	4eba 09a0      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    10ee:	4fef 0010      	lea 16(sp),sp
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
    10f2:	2f79 0001 9814 	move.l 19814 <Bitplane2>,44(sp)
    10f8:	002c 
    10fa:	2f79 0001 9818 	move.l 19818 <Bitplane1>,40(sp)
    1100:	0028 
    1102:	2f7c 0000 ff00 	move.l #65280,36(sp)
    1108:	0024 
    110a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1110:	2c40           	movea.l d0,a6
    1112:	206f 002c      	movea.l 44(sp),a0
    1116:	226f 0028      	movea.l 40(sp),a1
    111a:	202f 0024      	move.l 36(sp),d0
    111e:	4eae fd90      	jsr -624(a6)
  CopyMem( Bitplane2, startimage, ZMBPLSIZE);
    1122:	2f79 0001 9814 	move.l 19814 <Bitplane2>,32(sp)
    1128:	0020 
    112a:	2f79 0001 917c 	move.l 1917c <startimage>,28(sp)
    1130:	001c 
    1132:	2f7c 0000 ff00 	move.l #65280,24(sp)
    1138:	0018 
    113a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1140:	2c40           	movea.l d0,a6
    1142:	206f 0020      	movea.l 32(sp),a0
    1146:	226f 001c      	movea.l 28(sp),a1
    114a:	202f 0018      	move.l 24(sp),d0
    114e:	4eae fd90      	jsr -624(a6)
  
  Zoom_Shrink102( 15, Copperlist1);
    1152:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    1158:	2f00           	move.l d0,-(sp)
    115a:	4878 000f      	pea f <main+0x9>
    115e:	4eba f770      	jsr 8d0 <Zoom_Shrink102>(pc)
    1162:	508f           	addq.l #8,sp
  Zoom_Shrink102( 15, Copperlist2);
    1164:	2039 0001 981c 	move.l 1981c <Copperlist2>,d0
    116a:	2f00           	move.l d0,-(sp)
    116c:	4878 000f      	pea f <main+0x9>
    1170:	4eba f75e      	jsr 8d0 <Zoom_Shrink102>(pc)
    1174:	508f           	addq.l #8,sp
  Zoom_LevelOfZoom = 1;
    1176:	33fc 0001 0001 	move.w #1,197ba <Zoom_LevelOfZoom>
    117c:	97ba 
  Zoom_Direction = 1;                                                  
    117e:	33fc 0001 0001 	move.w #1,197be <Zoom_Direction>
    1184:	97be 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
    1186:	7016           	moveq #22,d0
    1188:	2f40 0014      	move.l d0,20(sp)
    118c:	2f7c 0001 0001 	move.l #65537,16(sp)
    1192:	0010 
    1194:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    119a:	2c40           	movea.l d0,a6
    119c:	202f 0014      	move.l 20(sp),d0
    11a0:	222f 0010      	move.l 16(sp),d1
    11a4:	4eae ff3a      	jsr -198(a6)
    11a8:	2f40 000c      	move.l d0,12(sp)
    11ac:	202f 000c      	move.l 12(sp),d0
    11b0:	23c0 0001 97cc 	move.l d0,197cc <Zoom_vbint>
    11b6:	2039 0001 97cc 	move.l 197cc <Zoom_vbint>,d0
    11bc:	4a80           	tst.l d0
    11be:	673e           	beq.s 11fe <Zoom_InitRun+0x192>
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    11c0:	2079 0001 97cc 	movea.l 197cc <Zoom_vbint>,a0
    11c6:	117c 0002 0008 	move.b #2,8(a0)
    Zoom_vbint->is_Node.ln_Pri = -60;
    11cc:	2079 0001 97cc 	movea.l 197cc <Zoom_vbint>,a0
    11d2:	117c ffc4 0009 	move.b #-60,9(a0)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    11d8:	2079 0001 97cc 	movea.l 197cc <Zoom_vbint>,a0
    11de:	217c 0001 6c73 	move.l #93299,10(a0)
    11e4:	000a 
    Zoom_vbint->is_Data = NULL;
    11e6:	2079 0001 97cc 	movea.l 197cc <Zoom_vbint>,a0
    11ec:	42a8 000e      	clr.l 14(a0)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
    11f0:	2079 0001 97cc 	movea.l 197cc <Zoom_vbint>,a0
    11f6:	217c 0000 0e02 	move.l #3586,18(a0)
    11fc:	0012 
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
    11fe:	7005           	moveq #5,d0
    1200:	2f40 0008      	move.l d0,8(sp)
    1204:	2f79 0001 97cc 	move.l 197cc <Zoom_vbint>,4(sp)
    120a:	0004 
    120c:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1212:	2c40           	movea.l d0,a6
    1214:	202f 0008      	move.l 8(sp),d0
    1218:	226f 0004      	movea.l 4(sp),a1
    121c:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
    1220:	2239 0001 9810 	move.l 19810 <ViewCopper>,d1
    1226:	2039 0001 9828 	move.l 19828 <ViewBuffer>,d0
    122c:	2f01           	move.l d1,-(sp)
    122e:	2f00           	move.l d0,-(sp)
    1230:	4eba 0bf4      	jsr 1e26 <Zoom_SetBplPointers>(pc)
    1234:	508f           	addq.l #8,sp
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
    1236:	2239 0001 9824 	move.l 19824 <DrawCopper>,d1
    123c:	2039 0001 9828 	move.l 19828 <ViewBuffer>,d0
    1242:	2f01           	move.l d1,-(sp)
    1244:	2f00           	move.l d0,-(sp)
    1246:	4eba 0bde      	jsr 1e26 <Zoom_SetBplPointers>(pc)
    124a:	508f           	addq.l #8,sp
  SwapCl();
    124c:	4eba 54b6      	jsr 6704 <SwapCl>(pc)
  
}
    1250:	2c5f           	movea.l (sp)+,a6
    1252:	4fef 0038      	lea 56(sp),sp
    1256:	4e75           	rts

00001258 <Zoom_Dealloc>:

void Zoom_Dealloc() {
    1258:	518f           	subq.l #8,sp
    125a:	2f0e           	move.l a6,-(sp)
  RemIntServer(INTB_VERTB, Zoom_vbint);
    125c:	7005           	moveq #5,d0
    125e:	2f40 0008      	move.l d0,8(sp)
    1262:	2f79 0001 97cc 	move.l 197cc <Zoom_vbint>,4(sp)
    1268:	0004 
    126a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1270:	2c40           	movea.l d0,a6
    1272:	202f 0008      	move.l 8(sp),d0
    1276:	226f 0004      	movea.l 4(sp),a1
    127a:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    127e:	2f3c 0000 ff00 	move.l #65280,-(sp)
    1284:	4878 031c      	pea 31c <main+0x316>
    1288:	4eba 54cc      	jsr 6756 <FreeDisplay>(pc)
    128c:	508f           	addq.l #8,sp
}
    128e:	2c5f           	movea.l (sp)+,a6
    1290:	508f           	addq.l #8,sp
    1292:	4e75           	rts

00001294 <Zoom_PrepareDisplay>:
  
int Zoom_PrepareDisplay() {
    1294:	4fef ffb8      	lea -72(sp),sp
    1298:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Copperlist1 = ClbuildZoom( );
    129c:	4eba 01be      	jsr 145c <ClbuildZoom>(pc)
    12a0:	23c0 0001 982c 	move.l d0,1982c <Copperlist1>
  Copperlist2 = ClbuildZoom( );
    12a6:	4eba 01b4      	jsr 145c <ClbuildZoom>(pc)
    12aa:	23c0 0001 981c 	move.l d0,1981c <Copperlist2>
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    12b0:	2f7c 0000 ff00 	move.l #65280,80(sp)
    12b6:	0050 
    12b8:	7002           	moveq #2,d0
    12ba:	2f40 004c      	move.l d0,76(sp)
    12be:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    12c4:	2c40           	movea.l d0,a6
    12c6:	202f 0050      	move.l 80(sp),d0
    12ca:	222f 004c      	move.l 76(sp),d1
    12ce:	4eae ff3a      	jsr -198(a6)
    12d2:	2f40 0048      	move.l d0,72(sp)
    12d6:	202f 0048      	move.l 72(sp),d0
    12da:	23c0 0001 9818 	move.l d0,19818 <Bitplane1>
  if(Bitplane1 == 0) {
    12e0:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
    12e6:	4a80           	tst.l d0
    12e8:	6658           	bne.s 1342 <Zoom_PrepareDisplay+0xae>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    12ea:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    12f0:	2c40           	movea.l d0,a6
    12f2:	4eae ffc4      	jsr -60(a6)
    12f6:	2f40 0044      	move.l d0,68(sp)
    12fa:	202f 0044      	move.l 68(sp),d0
    12fe:	2f40 0040      	move.l d0,64(sp)
    1302:	2f7c 0001 6c81 	move.l #93313,60(sp)
    1308:	003c 
    130a:	7026           	moveq #38,d0
    130c:	2f40 0038      	move.l d0,56(sp)
    1310:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    1316:	2c40           	movea.l d0,a6
    1318:	222f 0040      	move.l 64(sp),d1
    131c:	242f 003c      	move.l 60(sp),d2
    1320:	262f 0038      	move.l 56(sp),d3
    1324:	4eae ffd0      	jsr -48(a6)
    1328:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    132c:	7001           	moveq #1,d0
    132e:	2f40 0030      	move.l d0,48(sp)
    1332:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    1338:	2c40           	movea.l d0,a6
    133a:	222f 0030      	move.l 48(sp),d1
    133e:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1342:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
    1348:	23c0 0001 9830 	move.l d0,19830 <DrawBuffer>
  DrawCopper = Copperlist1;
    134e:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    1354:	23c0 0001 9824 	move.l d0,19824 <DrawCopper>
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
    135a:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1360:	002c 
    1362:	7002           	moveq #2,d0
    1364:	2f40 0028      	move.l d0,40(sp)
    1368:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    136e:	2c40           	movea.l d0,a6
    1370:	202f 002c      	move.l 44(sp),d0
    1374:	222f 0028      	move.l 40(sp),d1
    1378:	4eae ff3a      	jsr -198(a6)
    137c:	2f40 0024      	move.l d0,36(sp)
    1380:	202f 0024      	move.l 36(sp),d0
    1384:	23c0 0001 9814 	move.l d0,19814 <Bitplane2>
  if(Bitplane2 == 0) {
    138a:	2039 0001 9814 	move.l 19814 <Bitplane2>,d0
    1390:	4a80           	tst.l d0
    1392:	6658           	bne.s 13ec <Zoom_PrepareDisplay+0x158>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    1394:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    139a:	2c40           	movea.l d0,a6
    139c:	4eae ffc4      	jsr -60(a6)
    13a0:	2f40 0020      	move.l d0,32(sp)
    13a4:	202f 0020      	move.l 32(sp),d0
    13a8:	2f40 001c      	move.l d0,28(sp)
    13ac:	2f7c 0001 6ca8 	move.l #93352,24(sp)
    13b2:	0018 
    13b4:	7026           	moveq #38,d0
    13b6:	2f40 0014      	move.l d0,20(sp)
    13ba:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    13c0:	2c40           	movea.l d0,a6
    13c2:	222f 001c      	move.l 28(sp),d1
    13c6:	242f 0018      	move.l 24(sp),d2
    13ca:	262f 0014      	move.l 20(sp),d3
    13ce:	4eae ffd0      	jsr -48(a6)
    13d2:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    13d6:	7001           	moveq #1,d0
    13d8:	2f40 000c      	move.l d0,12(sp)
    13dc:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    13e2:	2c40           	movea.l d0,a6
    13e4:	222f 000c      	move.l 12(sp),d1
    13e8:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    13ec:	2039 0001 9814 	move.l 19814 <Bitplane2>,d0
    13f2:	23c0 0001 9828 	move.l d0,19828 <ViewBuffer>
  ViewCopper = Copperlist2;
    13f8:	2039 0001 981c 	move.l 1981c <Copperlist2>,d0
    13fe:	23c0 0001 9810 	move.l d0,19810 <ViewCopper>
  return 0;
    1404:	7000           	moveq #0,d0
}
    1406:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    140a:	4fef 0048      	lea 72(sp),sp
    140e:	4e75           	rts

00001410 <Zoom_Init>:

void Zoom_Init() {
    1410:	4fef fff4      	lea -12(sp),sp
    1414:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    1416:	7004           	moveq #4,d0
    1418:	2f40 000c      	move.l d0,12(sp)
    141c:	7002           	moveq #2,d0
    141e:	2f40 0008      	move.l d0,8(sp)
    1422:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1428:	2c40           	movea.l d0,a6
    142a:	202f 000c      	move.l 12(sp),d0
    142e:	222f 0008      	move.l 8(sp),d1
    1432:	4eae ff3a      	jsr -198(a6)
    1436:	2f40 0004      	move.l d0,4(sp)
    143a:	202f 0004      	move.l 4(sp),d0
    143e:	23c0 0001 97c2 	move.l d0,197c2 <Zoom_ZoomBlitMask>
  ZoomHorizontal = 16;
    1444:	33fc 0010 0001 	move.w #16,197c0 <ZoomHorizontal>
    144a:	97c0 
  Zoom_LevelOf102Zoom = 15;
    144c:	33fc 000f 0001 	move.w #15,197bc <Zoom_LevelOf102Zoom>
    1452:	97bc 
}
    1454:	2c5f           	movea.l (sp)+,a6
    1456:	4fef 000c      	lea 12(sp),sp
    145a:	4e75           	rts

0000145c <ClbuildZoom>:


ULONG * ClbuildZoom() {
    145c:	4fef ffac      	lea -84(sp),sp
    1460:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    1464:	2f7c 0000 031c 	move.l #796,68(sp)
    146a:	0044 
    146c:	7002           	moveq #2,d0
    146e:	2f40 0040      	move.l d0,64(sp)
    1472:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1478:	2c40           	movea.l d0,a6
    147a:	202f 0044      	move.l 68(sp),d0
    147e:	222f 0040      	move.l 64(sp),d1
    1482:	4eae ff3a      	jsr -198(a6)
    1486:	2f40 003c      	move.l d0,60(sp)
    148a:	202f 003c      	move.l 60(sp),d0
    148e:	2f40 0038      	move.l d0,56(sp)
  
  if( retval == 0) {
    1492:	4aaf 0038      	tst.l 56(sp)
    1496:	6658           	bne.s 14f0 <ClbuildZoom+0x94>
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    1498:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    149e:	2c40           	movea.l d0,a6
    14a0:	4eae ffc4      	jsr -60(a6)
    14a4:	2f40 0034      	move.l d0,52(sp)
    14a8:	202f 0034      	move.l 52(sp),d0
    14ac:	2f40 0030      	move.l d0,48(sp)
    14b0:	2f7c 0001 6ccf 	move.l #93391,44(sp)
    14b6:	002c 
    14b8:	7228           	moveq #40,d1
    14ba:	2f41 0028      	move.l d1,40(sp)
    14be:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    14c4:	2c40           	movea.l d0,a6
    14c6:	222f 0030      	move.l 48(sp),d1
    14ca:	242f 002c      	move.l 44(sp),d2
    14ce:	262f 0028      	move.l 40(sp),d3
    14d2:	4eae ffd0      	jsr -48(a6)
    14d6:	2f40 0024      	move.l d0,36(sp)
    Exit(1);
    14da:	7401           	moveq #1,d2
    14dc:	2f42 0020      	move.l d2,32(sp)
    14e0:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    14e6:	2c40           	movea.l d0,a6
    14e8:	222f 0020      	move.l 32(sp),d1
    14ec:	4eae ff70      	jsr -144(a6)
  }
  ULONG *cl = retval;
    14f0:	2f6f 0038 005c 	move.l 56(sp),92(sp)
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
    14f6:	2f7c 0001 976c 	move.l #104300,88(sp)
    14fc:	0058 
  for(int i=0; i<16;i++)
    14fe:	42af 0054      	clr.l 84(sp)
    1502:	6024           	bra.s 1528 <ClbuildZoom+0xcc>
    *cl++ = *clpartinstruction++;
    1504:	222f 0058      	move.l 88(sp),d1
    1508:	2001           	move.l d1,d0
    150a:	5880           	addq.l #4,d0
    150c:	2f40 0058      	move.l d0,88(sp)
    1510:	202f 005c      	move.l 92(sp),d0
    1514:	2400           	move.l d0,d2
    1516:	5882           	addq.l #4,d2
    1518:	2f42 005c      	move.l d2,92(sp)
    151c:	2041           	movea.l d1,a0
    151e:	2210           	move.l (a0),d1
    1520:	2040           	movea.l d0,a0
    1522:	2081           	move.l d1,(a0)
  for(int i=0; i<16;i++)
    1524:	52af 0054      	addq.l #1,84(sp)
    1528:	700f           	moveq #15,d0
    152a:	b0af 0054      	cmp.l 84(sp),d0
    152e:	6cd4           	bge.s 1504 <ClbuildZoom+0xa8>
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
    1530:	2f7c 0001 973c 	move.l #104252,88(sp)
    1536:	0058 
  for(int i=0; i<12;i++)
    1538:	42af 0050      	clr.l 80(sp)
    153c:	6024           	bra.s 1562 <ClbuildZoom+0x106>
    *cl++ = *clpartinstruction++;
    153e:	222f 0058      	move.l 88(sp),d1
    1542:	2401           	move.l d1,d2
    1544:	5882           	addq.l #4,d2
    1546:	2f42 0058      	move.l d2,88(sp)
    154a:	202f 005c      	move.l 92(sp),d0
    154e:	2400           	move.l d0,d2
    1550:	5882           	addq.l #4,d2
    1552:	2f42 005c      	move.l d2,92(sp)
    1556:	2041           	movea.l d1,a0
    1558:	2210           	move.l (a0),d1
    155a:	2040           	movea.l d0,a0
    155c:	2081           	move.l d1,(a0)
  for(int i=0; i<12;i++)
    155e:	52af 0050      	addq.l #1,80(sp)
    1562:	700b           	moveq #11,d0
    1564:	b0af 0050      	cmp.l 80(sp),d0
    1568:	6cd4           	bge.s 153e <ClbuildZoom+0xe2>
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
    156a:	202f 005c      	move.l 92(sp),d0
    156e:	2200           	move.l d0,d1
    1570:	5881           	addq.l #4,d1
    1572:	2f41 005c      	move.l d1,92(sp)
    1576:	2040           	movea.l d0,a0
    1578:	20bc 00e0 0000 	move.l #14680064,(a0)
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
    157e:	202f 005c      	move.l 92(sp),d0
    1582:	2200           	move.l d0,d1
    1584:	5881           	addq.l #4,d1
    1586:	2f41 005c      	move.l d1,92(sp)
    158a:	2040           	movea.l d0,a0
    158c:	20bc 00e2 0000 	move.l #14811136,(a0)
  *cl++ = 0x00e40000;
    1592:	202f 005c      	move.l 92(sp),d0
    1596:	2200           	move.l d0,d1
    1598:	5881           	addq.l #4,d1
    159a:	2f41 005c      	move.l d1,92(sp)
    159e:	2040           	movea.l d0,a0
    15a0:	20bc 00e4 0000 	move.l #14942208,(a0)
  *cl++ = 0x00e60000;
    15a6:	202f 005c      	move.l 92(sp),d0
    15aa:	2200           	move.l d0,d1
    15ac:	5881           	addq.l #4,d1
    15ae:	2f41 005c      	move.l d1,92(sp)
    15b2:	2040           	movea.l d0,a0
    15b4:	20bc 00e6 0000 	move.l #15073280,(a0)
  *cl++ = 0x00e80000;
    15ba:	202f 005c      	move.l 92(sp),d0
    15be:	2200           	move.l d0,d1
    15c0:	5881           	addq.l #4,d1
    15c2:	2f41 005c      	move.l d1,92(sp)
    15c6:	2040           	movea.l d0,a0
    15c8:	20bc 00e8 0000 	move.l #15204352,(a0)
  *cl++ = 0x00ea0000;
    15ce:	202f 005c      	move.l 92(sp),d0
    15d2:	2200           	move.l d0,d1
    15d4:	5881           	addq.l #4,d1
    15d6:	2f41 005c      	move.l d1,92(sp)
    15da:	2040           	movea.l d0,a0
    15dc:	20bc 00ea 0000 	move.l #15335424,(a0)
  *cl++ = 0x00ec0000;
    15e2:	202f 005c      	move.l 92(sp),d0
    15e6:	2200           	move.l d0,d1
    15e8:	5881           	addq.l #4,d1
    15ea:	2f41 005c      	move.l d1,92(sp)
    15ee:	2040           	movea.l d0,a0
    15f0:	20bc 00ec 0000 	move.l #15466496,(a0)
  *cl++ = 0x00ee0000;
    15f6:	202f 005c      	move.l 92(sp),d0
    15fa:	2200           	move.l d0,d1
    15fc:	5881           	addq.l #4,d1
    15fe:	2f41 005c      	move.l d1,92(sp)
    1602:	2040           	movea.l d0,a0
    1604:	20bc 00ee 0000 	move.l #15597568,(a0)
  *cl++ = 0x00f00000;
    160a:	202f 005c      	move.l 92(sp),d0
    160e:	2200           	move.l d0,d1
    1610:	5881           	addq.l #4,d1
    1612:	2f41 005c      	move.l d1,92(sp)
    1616:	2040           	movea.l d0,a0
    1618:	20bc 00f0 0000 	move.l #15728640,(a0)
  *cl++ = 0x00f20000;
    161e:	202f 005c      	move.l 92(sp),d0
    1622:	2200           	move.l d0,d1
    1624:	5881           	addq.l #4,d1
    1626:	2f41 005c      	move.l d1,92(sp)
    162a:	2040           	movea.l d0,a0
    162c:	20bc 00f2 0000 	move.l #15859712,(a0)

  clpartinstruction = ClColor;
    1632:	2f7c 0001 96bc 	move.l #104124,88(sp)
    1638:	0058 
  for(int i=0; i<32;i++)
    163a:	42af 004c      	clr.l 76(sp)
    163e:	6024           	bra.s 1664 <ClbuildZoom+0x208>
    *cl++ = *clpartinstruction++;
    1640:	222f 0058      	move.l 88(sp),d1
    1644:	2001           	move.l d1,d0
    1646:	5880           	addq.l #4,d0
    1648:	2f40 0058      	move.l d0,88(sp)
    164c:	202f 005c      	move.l 92(sp),d0
    1650:	2400           	move.l d0,d2
    1652:	5882           	addq.l #4,d2
    1654:	2f42 005c      	move.l d2,92(sp)
    1658:	2041           	movea.l d1,a0
    165a:	2210           	move.l (a0),d1
    165c:	2040           	movea.l d0,a0
    165e:	2081           	move.l d1,(a0)
  for(int i=0; i<32;i++)
    1660:	52af 004c      	addq.l #1,76(sp)
    1664:	701f           	moveq #31,d0
    1666:	b0af 004c      	cmp.l 76(sp),d0
    166a:	6cd4           	bge.s 1640 <ClbuildZoom+0x1e4>
  
  ULONG cop2 = cl+3;
    166c:	700c           	moveq #12,d0
    166e:	d0af 005c      	add.l 92(sp),d0
    1672:	2f40 001c      	move.l d0,28(sp)
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
    1676:	202f 001c      	move.l 28(sp),d0
    167a:	4240           	clr.w d0
    167c:	4840           	swap d0
    167e:	2200           	move.l d0,d1
    1680:	0681 0084 0000 	addi.l #8650752,d1
    1686:	2f41 0018      	move.l d1,24(sp)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
    168a:	202f 001c      	move.l 28(sp),d0
    168e:	0280 0000 ffff 	andi.l #65535,d0
    1694:	2400           	move.l d0,d2
    1696:	0682 0086 0000 	addi.l #8781824,d2
    169c:	2f42 0014      	move.l d2,20(sp)
  clpartinstruction = Cl102ZoomInit;
    16a0:	2f7c 0001 8000 	move.l #98304,88(sp)
    16a6:	0058 
  *cl++ = cop2lch;
    16a8:	202f 005c      	move.l 92(sp),d0
    16ac:	2200           	move.l d0,d1
    16ae:	5881           	addq.l #4,d1
    16b0:	2f41 005c      	move.l d1,92(sp)
    16b4:	2040           	movea.l d0,a0
    16b6:	20af 0018      	move.l 24(sp),(a0)
  *cl++ = cop2lcl;
    16ba:	202f 005c      	move.l 92(sp),d0
    16be:	2200           	move.l d0,d1
    16c0:	5881           	addq.l #4,d1
    16c2:	2f41 005c      	move.l d1,92(sp)
    16c6:	2040           	movea.l d0,a0
    16c8:	20af 0014      	move.l 20(sp),(a0)
  *cl++ = 0x2c01ff00;
    16cc:	202f 005c      	move.l 92(sp),d0
    16d0:	2200           	move.l d0,d1
    16d2:	5881           	addq.l #4,d1
    16d4:	2f41 005c      	move.l d1,92(sp)
    16d8:	2040           	movea.l d0,a0
    16da:	20bc 2c01 ff00 	move.l #738328320,(a0)

  ULONG cop2br1 = cop2 + ( (30)<<2);
    16e0:	7078           	moveq #120,d0
    16e2:	d0af 001c      	add.l 28(sp),d0
    16e6:	2f40 0010      	move.l d0,16(sp)
  ULONG cop2br2 = cop2 + ( (86)<<2);
    16ea:	222f 001c      	move.l 28(sp),d1
    16ee:	0681 0000 0158 	addi.l #344,d1
    16f4:	2f41 000c      	move.l d1,12(sp)
  clpartinstruction = Cl102ZoomRepeat;
    16f8:	2f7c 0001 800c 	move.l #98316,88(sp)
    16fe:	0058 
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
    1700:	202f 0010      	move.l 16(sp),d0
    1704:	4240           	clr.w d0
    1706:	4840           	swap d0
    1708:	307c 0070      	movea.w #112,a0
    170c:	d1ef 0058      	adda.l 88(sp),a0
    1710:	0680 0084 0000 	addi.l #8650752,d0
    1716:	2080           	move.l d0,(a0)
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
    1718:	202f 0010      	move.l 16(sp),d0
    171c:	0280 0000 ffff 	andi.l #65535,d0
    1722:	307c 0074      	movea.w #116,a0
    1726:	d1ef 0058      	adda.l 88(sp),a0
    172a:	0680 0086 0000 	addi.l #8781824,d0
    1730:	2080           	move.l d0,(a0)
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
    1732:	202f 000c      	move.l 12(sp),d0
    1736:	4240           	clr.w d0
    1738:	4840           	swap d0
    173a:	206f 0058      	movea.l 88(sp),a0
    173e:	41e8 0150      	lea 336(a0),a0
    1742:	0680 0084 0000 	addi.l #8650752,d0
    1748:	2080           	move.l d0,(a0)
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
    174a:	202f 000c      	move.l 12(sp),d0
    174e:	0280 0000 ffff 	andi.l #65535,d0
    1754:	206f 0058      	movea.l 88(sp),a0
    1758:	41e8 0154      	lea 340(a0),a0
    175c:	0680 0086 0000 	addi.l #8781824,d0
    1762:	2080           	move.l d0,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    1764:	42af 0048      	clr.l 72(sp)
    1768:	6024           	bra.s 178e <ClbuildZoom+0x332>
    *cl++ = *clpartinstruction++;
    176a:	222f 0058      	move.l 88(sp),d1
    176e:	2401           	move.l d1,d2
    1770:	5882           	addq.l #4,d2
    1772:	2f42 0058      	move.l d2,88(sp)
    1776:	202f 005c      	move.l 92(sp),d0
    177a:	2400           	move.l d0,d2
    177c:	5882           	addq.l #4,d2
    177e:	2f42 005c      	move.l d2,92(sp)
    1782:	2041           	movea.l d1,a0
    1784:	2210           	move.l (a0),d1
    1786:	2040           	movea.l d0,a0
    1788:	2081           	move.l d1,(a0)
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
    178a:	52af 0048      	addq.l #1,72(sp)
    178e:	7071           	moveq #113,d0
    1790:	b0af 0048      	cmp.l 72(sp),d0
    1794:	6cd4           	bge.s 176a <ClbuildZoom+0x30e>

   *cl++ = 0xfffffffe;
    1796:	202f 005c      	move.l 92(sp),d0
    179a:	2200           	move.l d0,d1
    179c:	5881           	addq.l #4,d1
    179e:	2f41 005c      	move.l d1,92(sp)
    17a2:	74fe           	moveq #-2,d2
    17a4:	2040           	movea.l d0,a0
    17a6:	2082           	move.l d2,(a0)

  return retval;
    17a8:	202f 0038      	move.l 56(sp),d0
}
    17ac:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    17b0:	4fef 0054      	lea 84(sp),sp
    17b4:	4e75           	rts

000017b6 <PrepareDisplayZoom>:

 int PrepareDisplayZoom() {
    17b6:	4fef ffb8      	lea -72(sp),sp
    17ba:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Copperlist1 = ClbuildZoom();
    17be:	4eba fc9c      	jsr 145c <ClbuildZoom>(pc)
    17c2:	23c0 0001 982c 	move.l d0,1982c <Copperlist1>
  Copperlist2 = ClbuildZoom();
    17c8:	4eba fc92      	jsr 145c <ClbuildZoom>(pc)
    17cc:	23c0 0001 981c 	move.l d0,1981c <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    17d2:	2f7c 0000 ff00 	move.l #65280,80(sp)
    17d8:	0050 
    17da:	7002           	moveq #2,d0
    17dc:	2f40 004c      	move.l d0,76(sp)
    17e0:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    17e6:	2c40           	movea.l d0,a6
    17e8:	202f 0050      	move.l 80(sp),d0
    17ec:	222f 004c      	move.l 76(sp),d1
    17f0:	4eae ff3a      	jsr -198(a6)
    17f4:	2f40 0048      	move.l d0,72(sp)
    17f8:	202f 0048      	move.l 72(sp),d0
    17fc:	23c0 0001 9818 	move.l d0,19818 <Bitplane1>
  if(Bitplane1 == 0) {
    1802:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
    1808:	4a80           	tst.l d0
    180a:	6658           	bne.s 1864 <PrepareDisplayZoom+0xae>
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    180c:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    1812:	2c40           	movea.l d0,a6
    1814:	4eae ffc4      	jsr -60(a6)
    1818:	2f40 0044      	move.l d0,68(sp)
    181c:	202f 0044      	move.l 68(sp),d0
    1820:	2f40 0040      	move.l d0,64(sp)
    1824:	2f7c 0001 6c81 	move.l #93313,60(sp)
    182a:	003c 
    182c:	7026           	moveq #38,d0
    182e:	2f40 0038      	move.l d0,56(sp)
    1832:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    1838:	2c40           	movea.l d0,a6
    183a:	222f 0040      	move.l 64(sp),d1
    183e:	242f 003c      	move.l 60(sp),d2
    1842:	262f 0038      	move.l 56(sp),d3
    1846:	4eae ffd0      	jsr -48(a6)
    184a:	2f40 0034      	move.l d0,52(sp)
    Exit(1);
    184e:	7001           	moveq #1,d0
    1850:	2f40 0030      	move.l d0,48(sp)
    1854:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    185a:	2c40           	movea.l d0,a6
    185c:	222f 0030      	move.l 48(sp),d1
    1860:	4eae ff70      	jsr -144(a6)
  }
  DrawBuffer = Bitplane1;
    1864:	2039 0001 9818 	move.l 19818 <Bitplane1>,d0
    186a:	23c0 0001 9830 	move.l d0,19830 <DrawBuffer>
  DrawCopper = Copperlist1;
    1870:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    1876:	23c0 0001 9824 	move.l d0,19824 <DrawCopper>
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    187c:	2f7c 0000 ff00 	move.l #65280,44(sp)
    1882:	002c 
    1884:	7002           	moveq #2,d0
    1886:	2f40 0028      	move.l d0,40(sp)
    188a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    1890:	2c40           	movea.l d0,a6
    1892:	202f 002c      	move.l 44(sp),d0
    1896:	222f 0028      	move.l 40(sp),d1
    189a:	4eae ff3a      	jsr -198(a6)
    189e:	2f40 0024      	move.l d0,36(sp)
    18a2:	202f 0024      	move.l 36(sp),d0
    18a6:	23c0 0001 9814 	move.l d0,19814 <Bitplane2>
  if(Bitplane2 == 0) {
    18ac:	2039 0001 9814 	move.l 19814 <Bitplane2>,d0
    18b2:	4a80           	tst.l d0
    18b4:	6658           	bne.s 190e <PrepareDisplayZoom+0x158>
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    18b6:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    18bc:	2c40           	movea.l d0,a6
    18be:	4eae ffc4      	jsr -60(a6)
    18c2:	2f40 0020      	move.l d0,32(sp)
    18c6:	202f 0020      	move.l 32(sp),d0
    18ca:	2f40 001c      	move.l d0,28(sp)
    18ce:	2f7c 0001 6ca8 	move.l #93352,24(sp)
    18d4:	0018 
    18d6:	7026           	moveq #38,d0
    18d8:	2f40 0014      	move.l d0,20(sp)
    18dc:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    18e2:	2c40           	movea.l d0,a6
    18e4:	222f 001c      	move.l 28(sp),d1
    18e8:	242f 0018      	move.l 24(sp),d2
    18ec:	262f 0014      	move.l 20(sp),d3
    18f0:	4eae ffd0      	jsr -48(a6)
    18f4:	2f40 0010      	move.l d0,16(sp)
    Exit(1);
    18f8:	7001           	moveq #1,d0
    18fa:	2f40 000c      	move.l d0,12(sp)
    18fe:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    1904:	2c40           	movea.l d0,a6
    1906:	222f 000c      	move.l 12(sp),d1
    190a:	4eae ff70      	jsr -144(a6)
  }
  ViewBuffer = Bitplane2;
    190e:	2039 0001 9814 	move.l 19814 <Bitplane2>,d0
    1914:	23c0 0001 9828 	move.l d0,19828 <ViewBuffer>
  ViewCopper = Copperlist2;
    191a:	2039 0001 981c 	move.l 1981c <Copperlist2>,d0
    1920:	23c0 0001 9810 	move.l d0,19810 <ViewCopper>
  /*SwapCl();
  Zoom_SetBplPointers();
  SwapCl();
  Zoom_SetBplPointers();*/
  return 0;
    1926:	7000           	moveq #0,d0
}
    1928:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    192c:	4fef 0048      	lea 72(sp),sp
    1930:	4e75           	rts

00001932 <Init_Blit>:

void Init_Blit() {
  hw->bltafwm = 0xffff;
    1932:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1938:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    193e:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1944:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    194a:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1950:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    1956:	2079 0001 9820 	movea.l 19820 <hw>,a0
    195c:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    1962:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1968:	317c 002c 0066 	move.w #44,102(a0)
}
    196e:	4e75           	rts

00001970 <Init_Blit2>:


void Init_Blit2() {
  hw->bltafwm = 0xffff;
    1970:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1976:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    197c:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1982:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = 36;
    1988:	2079 0001 9820 	movea.l 19820 <hw>,a0
    198e:	317c 0024 0064 	move.w #36,100(a0)
  hw->bltbmod = 76;
    1994:	2079 0001 9820 	movea.l 19820 <hw>,a0
    199a:	317c 004c 0062 	move.w #76,98(a0)
  hw->bltdmod = ZMLINESIZE2 - 4;
    19a0:	2079 0001 9820 	movea.l 19820 <hw>,a0
    19a6:	317c 0028 0066 	move.w #40,102(a0)
}
    19ac:	4e75           	rts

000019ae <Init_ZoomBlit>:

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
    19ae:	4fef fff4      	lea -12(sp),sp
    19b2:	206f 0010      	movea.l 16(sp),a0
    19b6:	222f 0014      	move.l 20(sp),d1
    19ba:	202f 0018      	move.l 24(sp),d0
    19be:	3048           	movea.w a0,a0
    19c0:	3f48 0004      	move.w a0,4(sp)
    19c4:	3201           	move.w d1,d1
    19c6:	3f41 0002      	move.w d1,2(sp)
    19ca:	3000           	move.w d0,d0
    19cc:	3e80           	move.w d0,(sp)
  ZoomBlit_Increment4SrcA = 0;
    19ce:	4279 0001 97ca 	clr.w 197ca <ZoomBlit_Increment4SrcA>

  UWORD colnr = nextzoom - startofword - 1;                                                                          
    19d4:	302f 0002      	move.w 2(sp),d0
    19d8:	906f 0004      	sub.w 4(sp),d0
    19dc:	3200           	move.w d0,d1
    19de:	5341           	subq.w #1,d1
    19e0:	3f41 0008      	move.w d1,8(sp)
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
    19e4:	3017           	move.w (sp),d0
    19e6:	720c           	moveq #12,d1
    19e8:	e368           	lsl.w d1,d0
    19ea:	3f40 0006      	move.w d0,6(sp)
  UWORD shifta;
  if( shiftright == 0) {
    19ee:	4a57           	tst.w (sp)
    19f0:	6610           	bne.s 1a02 <Init_ZoomBlit+0x54>
    ZoomBlit_Increment4SrcA = 1;
    19f2:	33fc 0001 0001 	move.w #1,197ca <ZoomBlit_Increment4SrcA>
    19f8:	97ca 
    shifta = 15 << 12;
    19fa:	3f7c f000 000a 	move.w #-4096,10(sp)
    1a00:	600c           	bra.s 1a0e <Init_ZoomBlit+0x60>
  } else {
    shifta = (shiftright - 1) << 12;
    1a02:	3017           	move.w (sp),d0
    1a04:	5340           	subq.w #1,d0
    1a06:	720c           	moveq #12,d1
    1a08:	e368           	lsl.w d1,d0
    1a0a:	3f40 000a      	move.w d0,10(sp)
  }
  WaitBlt(); 
    1a0e:	4eba 4db8      	jsr 67c8 <WaitBlt>(pc)
  hw->bltcon1 = shiftb; 
    1a12:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1a18:	316f 0006 0042 	move.w 6(sp),66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    1a1e:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1a24:	302f 000a      	move.w 10(sp),d0
    1a28:	0640 0de4      	addi.w #3556,d0
    1a2c:	3140 0040      	move.w d0,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    1a30:	7000           	moveq #0,d0
    1a32:	302f 0008      	move.w 8(sp),d0
    1a36:	7210           	moveq #16,d1
    1a38:	9280           	sub.l d0,d1
    1a3a:	7000           	moveq #0,d0
    1a3c:	4640           	not.w d0
    1a3e:	e3a8           	lsl.l d1,d0
    1a40:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1a46:	2000           	move.l d0,d0
    1a48:	3140 0070      	move.w d0,112(a0)
}
    1a4c:	4fef 000c      	lea 12(sp),sp
    1a50:	4e75           	rts

00001a52 <Init_Copy>:

void Init_Copy( WORD shift) {
    1a52:	598f           	subq.l #4,sp
    1a54:	202f 0008      	move.l 8(sp),d0
    1a58:	3000           	move.w d0,d0
    1a5a:	3e80           	move.w d0,(sp)
  UWORD shiftright = shift << 12;
    1a5c:	3017           	move.w (sp),d0
    1a5e:	720c           	moveq #12,d1
    1a60:	e368           	lsl.w d1,d0
    1a62:	3f40 0002      	move.w d0,2(sp)
  WaitBlt();
    1a66:	4eba 4d60      	jsr 67c8 <WaitBlt>(pc)
  hw->bltcon0 = 0x9f0 + shiftright;
    1a6a:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1a70:	302f 0002      	move.w 2(sp),d0
    1a74:	0640 09f0      	addi.w #2544,d0
    1a78:	3140 0040      	move.w d0,64(a0)
  hw->bltcon1 = 0;
    1a7c:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1a82:	317c 0000 0042 	move.w #0,66(a0)
}
    1a88:	588f           	addq.l #4,sp
    1a8a:	4e75           	rts

00001a8c <Zoom_ZoomIntoPicture>:

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
    1a8c:	4fef ffcc      	lea -52(sp),sp
    1a90:	222f 0040      	move.l 64(sp),d1
    1a94:	202f 0044      	move.l 68(sp),d0
    1a98:	3201           	move.w d1,d1
    1a9a:	3f41 0002      	move.w d1,2(sp)
    1a9e:	3000           	move.w d0,d0
    1aa0:	3e80           	move.w d0,(sp)
  
  WaitBlt();  
    1aa2:	4eba 4d24      	jsr 67c8 <WaitBlt>(pc)
  Init_Blit();
    1aa6:	4eba fe8a      	jsr 1932 <Init_Blit>(pc)
  WORD shiftright = 9;
    1aaa:	3f7c 0009 0032 	move.w #9,50(sp)
  UWORD shifthoriz = 7;
    1ab0:	3f7c 0007 0030 	move.w #7,48(sp)
  UWORD startofword = 21*16;
    1ab6:	3f7c 0150 002e 	move.w #336,46(sp)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    1abc:	322f 0002      	move.w 2(sp),d1
    1ac0:	3001           	move.w d1,d0
    1ac2:	d040           	add.w d0,d0
    1ac4:	d040           	add.w d0,d0
    1ac6:	d041           	add.w d1,d0
    1ac8:	d040           	add.w d0,d0
    1aca:	0640 014c      	addi.w #332,d0
    1ace:	3f40 002c      	move.w d0,44(sp)
    1ad2:	601a           	bra.s 1aee <Zoom_ZoomIntoPicture+0x62>
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    1ad4:	302f 002c      	move.w 44(sp),d0
    1ad8:	906f 0002      	sub.w 2(sp),d0
    1adc:	0640 ffed      	addi.w #-19,d0
    1ae0:	3f40 002c      	move.w d0,44(sp)
    shiftright--;
    1ae4:	302f 0032      	move.w 50(sp),d0
    1ae8:	5340           	subq.w #1,d0
    1aea:	3f40 0032      	move.w d0,50(sp)
  while( nextzoom > 22 * 16) {
    1aee:	0c6f 0160 002c 	cmpi.w #352,44(sp)
    1af4:	6ede           	bgt.s 1ad4 <Zoom_ZoomIntoPicture+0x48>
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
    1af6:	426f 002a      	clr.w 42(sp)
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    1afa:	322f 0002      	move.w 2(sp),d1
    1afe:	3001           	move.w d1,d0
    1b00:	d040           	add.w d0,d0
    1b02:	d040           	add.w d0,d0
    1b04:	d041           	add.w d1,d0
    1b06:	4440           	neg.w d0
    1b08:	0640 0012      	addi.w #18,d0
    1b0c:	3f40 0028      	move.w d0,40(sp)
    1b10:	601c           	bra.s 1b2e <Zoom_ZoomIntoPicture+0xa2>
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    1b12:	302f 0028      	move.w 40(sp),d0
    1b16:	d06f 0002      	add.w 2(sp),d0
    1b1a:	0640 0013      	addi.w #19,d0
    1b1e:	3f40 0028      	move.w d0,40(sp)
      shifthoriz--;
    1b22:	302f 0030      	move.w 48(sp),d0
    1b26:	3200           	move.w d0,d1
    1b28:	5341           	subq.w #1,d1
    1b2a:	3f41 0030      	move.w d1,48(sp)
  while( ZoomHorizontalStart < 0) {
    1b2e:	4a6f 0028      	tst.w 40(sp)
    1b32:	6dde           	blt.s 1b12 <Zoom_ZoomIntoPicture+0x86>
  } 

  for(int i=0;i<22;i++) {
    1b34:	42af 0024      	clr.l 36(sp)
    1b38:	6000 02dc      	bra.w 1e16 <Zoom_ZoomIntoPicture+0x38a>

    ZoomHorizontal = ZoomHorizontalStart;
    1b3c:	33ef 0028 0001 	move.w 40(sp),197c0 <ZoomHorizontal>
    1b42:	97c0 

    WORD linesleft = 272;
    1b44:	3f7c 0110 0022 	move.w #272,34(sp)
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    1b4a:	7000           	moveq #0,d0
    1b4c:	302f 0030      	move.w 48(sp),d0
    1b50:	7200           	moveq #0,d1
    1b52:	3217           	move.w (sp),d1
    1b54:	2f01           	move.l d1,-(sp)
    1b56:	2f00           	move.l d0,-(sp)
    1b58:	4eb9 0000 6964 	jsr 6964 <__mulsi3>
    1b5e:	508f           	addq.l #8,sp
    1b60:	2200           	move.l d0,d1
    1b62:	2001           	move.l d1,d0
    1b64:	d080           	add.l d0,d0
    1b66:	d081           	add.l d1,d0
    1b68:	e788           	lsl.l #3,d0
    1b6a:	2200           	move.l d0,d1
    1b6c:	202f 0024      	move.l 36(sp),d0
    1b70:	2041           	movea.l d1,a0
    1b72:	91c0           	suba.l d0,a0
    1b74:	41e8 0016      	lea 22(a0),a0
    1b78:	2008           	move.l a0,d0
    1b7a:	d088           	add.l a0,d0
    1b7c:	222f 0038      	move.l 56(sp),d1
    1b80:	d280           	add.l d0,d1
    1b82:	2f41 001e      	move.l d1,30(sp)
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    1b86:	222f 0024      	move.l 36(sp),d1
    1b8a:	7000           	moveq #0,d0
    1b8c:	9081           	sub.l d1,d0
    1b8e:	d080           	add.l d0,d0
    1b90:	2040           	movea.l d0,a0
    1b92:	41e8 002c      	lea 44(a0),a0
    1b96:	202f 003c      	move.l 60(sp),d0
    1b9a:	d088           	add.l a0,d0
    1b9c:	2f40 001a      	move.l d0,26(sp)
    
    UWORD onestep = ZMLINESIZE/2*planes;
    1ba0:	3217           	move.w (sp),d1
    1ba2:	3001           	move.w d1,d0
    1ba4:	d040           	add.w d0,d0
    1ba6:	d041           	add.w d1,d0
    1ba8:	e748           	lsl.w #3,d0
    1baa:	3f40 0018      	move.w d0,24(sp)
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    1bae:	7000           	moveq #0,d0
    1bb0:	302f 002e      	move.w 46(sp),d0
    1bb4:	306f 002c      	movea.w 44(sp),a0
    1bb8:	b1c0           	cmpa.l d0,a0
    1bba:	6e00 010a      	bgt.w 1cc6 <Zoom_ZoomIntoPicture+0x23a>
      Init_Copy( shiftright);
    1bbe:	306f 0032      	movea.w 50(sp),a0
    1bc2:	2f08           	move.l a0,-(sp)
    1bc4:	4eba fe8c      	jsr 1a52 <Init_Copy>(pc)
    1bc8:	588f           	addq.l #4,sp
    1bca:	6000 00ee      	bra.w 1cba <Zoom_ZoomIntoPicture+0x22e>
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1bce:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1bd4:	b06f 0022      	cmp.w 34(sp),d0
    1bd8:	6c16           	bge.s 1bf0 <Zoom_ZoomIntoPicture+0x164>
          linesleft -= ZoomHorizontal;
    1bda:	322f 0022      	move.w 34(sp),d1
    1bde:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1be4:	3041           	movea.w d1,a0
    1be6:	90c0           	suba.w d0,a0
    1be8:	3008           	move.w a0,d0
    1bea:	3f40 0022      	move.w d0,34(sp)
    1bee:	600c           	bra.s 1bfc <Zoom_ZoomIntoPicture+0x170>
        } else {
          ZoomHorizontal = linesleft;
    1bf0:	33ef 0022 0001 	move.w 34(sp),197c0 <ZoomHorizontal>
    1bf6:	97c0 
          linesleft = 0;
    1bf8:	426f 0022      	clr.w 34(sp)
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
    1bfc:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1c02:	322f 0018      	move.w 24(sp),d1
    1c06:	c3c0           	muls.w d0,d1
    1c08:	3f41 0016      	move.w d1,22(sp)
        //Add aditional line
        if( linesleft>0) {
    1c0c:	4a6f 0022      	tst.w 34(sp)
    1c10:	6f4c           	ble.s 1c5e <Zoom_ZoomIntoPicture+0x1d2>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1c12:	7200           	moveq #0,d1
    1c14:	322f 0016      	move.w 22(sp),d1
    1c18:	7000           	moveq #0,d0
    1c1a:	302f 002a      	move.w 42(sp),d0
    1c1e:	d081           	add.l d1,d0
    1c20:	d080           	add.l d0,d0
    1c22:	222f 001e      	move.l 30(sp),d1
    1c26:	d280           	add.l d0,d1
    1c28:	2f41 0012      	move.l d1,18(sp)
          UWORD *tmpdest = pos4dest +  size4blit;
    1c2c:	7000           	moveq #0,d0
    1c2e:	302f 0016      	move.w 22(sp),d0
    1c32:	d080           	add.l d0,d0
    1c34:	222f 001a      	move.l 26(sp),d1
    1c38:	d280           	add.l d0,d1
    1c3a:	2f41 000e      	move.l d1,14(sp)
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
    1c3e:	7000           	moveq #0,d0
    1c40:	3017           	move.w (sp),d0
    1c42:	2f00           	move.l d0,-(sp)
    1c44:	2f2f 0012      	move.l 18(sp),-(sp)
    1c48:	2f2f 001a      	move.l 26(sp),-(sp)
    1c4c:	4eba f2ea      	jsr f38 <Zoom_CopyWord>(pc)
    1c50:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1c54:	302f 0022      	move.w 34(sp),d0
    1c58:	5340           	subq.w #1,d0
    1c5a:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1c5e:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1c64:	c1d7           	muls.w (sp),d0
    1c66:	7200           	moveq #0,d1
    1c68:	3200           	move.w d0,d1
    1c6a:	7000           	moveq #0,d0
    1c6c:	302f 002a      	move.w 42(sp),d0
    1c70:	d080           	add.l d0,d0
    1c72:	d0af 001e      	add.l 30(sp),d0
    1c76:	2f01           	move.l d1,-(sp)
    1c78:	2f2f 001e      	move.l 30(sp),-(sp)
    1c7c:	2f00           	move.l d0,-(sp)
    1c7e:	4eba f2b8      	jsr f38 <Zoom_CopyWord>(pc)
    1c82:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1c86:	7000           	moveq #0,d0
    1c88:	302f 0016      	move.w 22(sp),d0
    1c8c:	d080           	add.l d0,d0
    1c8e:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep; 
    1c92:	7200           	moveq #0,d1
    1c94:	322f 0016      	move.w 22(sp),d1
    1c98:	7000           	moveq #0,d0
    1c9a:	302f 0018      	move.w 24(sp),d0
    1c9e:	d081           	add.l d1,d0
    1ca0:	d080           	add.l d0,d0
    1ca2:	d1af 001a      	add.l d0,26(sp)
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1ca6:	302f 0002      	move.w 2(sp),d0
    1caa:	d040           	add.w d0,d0
    1cac:	906f 0002      	sub.w 2(sp),d0
    1cb0:	0640 0012      	addi.w #18,d0
    1cb4:	33c0 0001 97c0 	move.w d0,197c0 <ZoomHorizontal>
      while(linesleft > 0) {
    1cba:	4a6f 0022      	tst.w 34(sp)
    1cbe:	6e00 ff0e      	bgt.w 1bce <Zoom_ZoomIntoPicture+0x142>
    1cc2:	6000 0148      	bra.w 1e0c <Zoom_ZoomIntoPicture+0x380>
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
    1cc6:	326f 0032      	movea.w 50(sp),a1
    1cca:	306f 002c      	movea.w 44(sp),a0
    1cce:	7000           	moveq #0,d0
    1cd0:	302f 002e      	move.w 46(sp),d0
    1cd4:	2f09           	move.l a1,-(sp)
    1cd6:	2f08           	move.l a0,-(sp)
    1cd8:	2f00           	move.l d0,-(sp)
    1cda:	4eba fcd2      	jsr 19ae <Init_ZoomBlit>(pc)
    1cde:	4fef 000c      	lea 12(sp),sp
      nextzoom -= (19 + zoomnr);
    1ce2:	302f 002c      	move.w 44(sp),d0
    1ce6:	906f 0002      	sub.w 2(sp),d0
    1cea:	0640 ffed      	addi.w #-19,d0
    1cee:	3f40 002c      	move.w d0,44(sp)
    1cf2:	6000 00ee      	bra.w 1de2 <Zoom_ZoomIntoPicture+0x356>
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
    1cf6:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1cfc:	b06f 0022      	cmp.w 34(sp),d0
    1d00:	6c16           	bge.s 1d18 <Zoom_ZoomIntoPicture+0x28c>
          linesleft -= ZoomHorizontal;
    1d02:	322f 0022      	move.w 34(sp),d1
    1d06:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1d0c:	3041           	movea.w d1,a0
    1d0e:	90c0           	suba.w d0,a0
    1d10:	3008           	move.w a0,d0
    1d12:	3f40 0022      	move.w d0,34(sp)
    1d16:	600c           	bra.s 1d24 <Zoom_ZoomIntoPicture+0x298>
        } else {
          ZoomHorizontal = linesleft;
    1d18:	33ef 0022 0001 	move.w 34(sp),197c0 <ZoomHorizontal>
    1d1e:	97c0 
          linesleft = 0;
    1d20:	426f 0022      	clr.w 34(sp)
        }
        UWORD size4blit = ZoomHorizontal*onestep;
    1d24:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1d2a:	322f 0018      	move.w 24(sp),d1
    1d2e:	c3c0           	muls.w d0,d1
    1d30:	3f41 000c      	move.w d1,12(sp)
        //Add aditional line
        if( linesleft>0) {
    1d34:	4a6f 0022      	tst.w 34(sp)
    1d38:	6f4c           	ble.s 1d86 <Zoom_ZoomIntoPicture+0x2fa>
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
    1d3a:	7200           	moveq #0,d1
    1d3c:	322f 000c      	move.w 12(sp),d1
    1d40:	7000           	moveq #0,d0
    1d42:	302f 002a      	move.w 42(sp),d0
    1d46:	d081           	add.l d1,d0
    1d48:	d080           	add.l d0,d0
    1d4a:	222f 001e      	move.l 30(sp),d1
    1d4e:	d280           	add.l d0,d1
    1d50:	2f41 0008      	move.l d1,8(sp)
          UWORD *tmpdest = pos4dest + size4blit;
    1d54:	7000           	moveq #0,d0
    1d56:	302f 000c      	move.w 12(sp),d0
    1d5a:	d080           	add.l d0,d0
    1d5c:	222f 001a      	move.l 26(sp),d1
    1d60:	d280           	add.l d0,d1
    1d62:	2f41 0004      	move.l d1,4(sp)
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
    1d66:	7000           	moveq #0,d0
    1d68:	3017           	move.w (sp),d0
    1d6a:	2f00           	move.l d0,-(sp)
    1d6c:	2f2f 0008      	move.l 8(sp),-(sp)
    1d70:	2f2f 0010      	move.l 16(sp),-(sp)
    1d74:	4eba f200      	jsr f76 <Zoom_ZoomBlit>(pc)
    1d78:	4fef 000c      	lea 12(sp),sp
          linesleft--;
    1d7c:	302f 0022      	move.w 34(sp),d0
    1d80:	5340           	subq.w #1,d0
    1d82:	3f40 0022      	move.w d0,34(sp)
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
    1d86:	3039 0001 97c0 	move.w 197c0 <ZoomHorizontal>,d0
    1d8c:	c1d7           	muls.w (sp),d0
    1d8e:	7200           	moveq #0,d1
    1d90:	3200           	move.w d0,d1
    1d92:	7000           	moveq #0,d0
    1d94:	302f 002a      	move.w 42(sp),d0
    1d98:	d080           	add.l d0,d0
    1d9a:	d0af 001e      	add.l 30(sp),d0
    1d9e:	2f01           	move.l d1,-(sp)
    1da0:	2f2f 001e      	move.l 30(sp),-(sp)
    1da4:	2f00           	move.l d0,-(sp)
    1da6:	4eba f1ce      	jsr f76 <Zoom_ZoomBlit>(pc)
    1daa:	4fef 000c      	lea 12(sp),sp
        pos4source += size4blit;
    1dae:	7000           	moveq #0,d0
    1db0:	302f 000c      	move.w 12(sp),d0
    1db4:	d080           	add.l d0,d0
    1db6:	d1af 001e      	add.l d0,30(sp)
        pos4dest += size4blit + onestep;   
    1dba:	7200           	moveq #0,d1
    1dbc:	322f 000c      	move.w 12(sp),d1
    1dc0:	7000           	moveq #0,d0
    1dc2:	302f 0018      	move.w 24(sp),d0
    1dc6:	d081           	add.l d1,d0
    1dc8:	d080           	add.l d0,d0
    1dca:	d1af 001a      	add.l d0,26(sp)
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    1dce:	302f 0002      	move.w 2(sp),d0
    1dd2:	d040           	add.w d0,d0
    1dd4:	906f 0002      	sub.w 2(sp),d0
    1dd8:	0640 0012      	addi.w #18,d0
    1ddc:	33c0 0001 97c0 	move.w d0,197c0 <ZoomHorizontal>
      while( linesleft > 0) {
    1de2:	4a6f 0022      	tst.w 34(sp)
    1de6:	6e00 ff0e      	bgt.w 1cf6 <Zoom_ZoomIntoPicture+0x26a>
      }
      shiftright--;  
    1dea:	302f 0032      	move.w 50(sp),d0
    1dee:	5340           	subq.w #1,d0
    1df0:	3f40 0032      	move.w d0,50(sp)
      if(shiftright < 0) {
    1df4:	4a6f 0032      	tst.w 50(sp)
    1df8:	6c12           	bge.s 1e0c <Zoom_ZoomIntoPicture+0x380>
        shiftright += 16;
    1dfa:	302f 0032      	move.w 50(sp),d0
    1dfe:	0640 0010      	addi.w #16,d0
    1e02:	3f40 0032      	move.w d0,50(sp)
        shifttoleft = 1;
    1e06:	3f7c 0001 002a 	move.w #1,42(sp)
      }
    }
    startofword -= 16;
    1e0c:	066f fff0 002e 	addi.w #-16,46(sp)
  for(int i=0;i<22;i++) {
    1e12:	52af 0024      	addq.l #1,36(sp)
    1e16:	7015           	moveq #21,d0
    1e18:	b0af 0024      	cmp.l 36(sp),d0
    1e1c:	6c00 fd1e      	bge.w 1b3c <Zoom_ZoomIntoPicture+0xb0>
  }
}
    1e20:	4fef 0034      	lea 52(sp),sp
    1e24:	4e75           	rts

00001e26 <Zoom_SetBplPointers>:

void Zoom_SetBplPointers( ULONG *buffer, ULONG *copper) {
    1e26:	4fef fff0      	lea -16(sp),sp
  ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
    1e2a:	3039 0001 97bc 	move.w 197bc <Zoom_LevelOf102Zoom>,d0
    1e30:	e248           	lsr.w #1,d0
    1e32:	3000           	move.w d0,d0
    1e34:	0280 0000 ffff 	andi.l #65535,d0
    1e3a:	7208           	moveq #8,d1
    1e3c:	9280           	sub.l d0,d1
    1e3e:	2001           	move.l d1,d0
    1e40:	2200           	move.l d0,d1
    1e42:	2001           	move.l d1,d0
    1e44:	e988           	lsl.l #4,d0
    1e46:	9081           	sub.l d1,d0
    1e48:	e988           	lsl.l #4,d0
    1e4a:	5880           	addq.l #4,d0
    1e4c:	d0af 0014      	add.l 20(sp),d0
    1e50:	2f40 000c      	move.l d0,12(sp)
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
    1e54:	7072           	moveq #114,d0
    1e56:	d0af 0018      	add.l 24(sp),d0
    1e5a:	2f40 0008      	move.l d0,8(sp)
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e5e:	42af 0004      	clr.l 4(sp)
    1e62:	6030           	bra.s 1e94 <Zoom_SetBplPointers+0x6e>
    UWORD highword = (ULONG)plane2set >> 16;
    1e64:	202f 000c      	move.l 12(sp),d0
    1e68:	4240           	clr.w d0
    1e6a:	4840           	swap d0
    1e6c:	3f40 0002      	move.w d0,2(sp)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1e70:	3eaf 000e      	move.w 14(sp),(sp)
    *posofcopper = highword;
    1e74:	206f 0008      	movea.l 8(sp),a0
    1e78:	30af 0002      	move.w 2(sp),(a0)
    posofcopper += 2;
    1e7c:	58af 0008      	addq.l #4,8(sp)
    *posofcopper = lowword;
    1e80:	206f 0008      	movea.l 8(sp),a0
    1e84:	3097           	move.w (sp),(a0)
    posofcopper += 2;
    1e86:	58af 0008      	addq.l #4,8(sp)
    plane2set += ZMLINESIZE; //Next plane (interleaved)
    1e8a:	7230           	moveq #48,d1
    1e8c:	d3af 000c      	add.l d1,12(sp)
  for(int i=0;i<ZMBPLDEPTH;i++) {
    1e90:	52af 0004      	addq.l #1,4(sp)
    1e94:	7004           	moveq #4,d0
    1e96:	b0af 0004      	cmp.l 4(sp),d0
    1e9a:	6cc8           	bge.s 1e64 <Zoom_SetBplPointers+0x3e>
  }
  
}
    1e9c:	4fef 0010      	lea 16(sp),sp
    1ea0:	4e75           	rts

00001ea2 <Zoom_SwapBuffers>:

void Zoom_SwapBuffers() {
    1ea2:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawBuffer;
    1ea4:	2039 0001 9830 	move.l 19830 <DrawBuffer>,d0
    1eaa:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
    1eac:	2039 0001 9828 	move.l 19828 <ViewBuffer>,d0
    1eb2:	23c0 0001 9830 	move.l d0,19830 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1eb8:	2017           	move.l (sp),d0
    1eba:	23c0 0001 9828 	move.l d0,19828 <ViewBuffer>
}
    1ec0:	588f           	addq.l #4,sp
    1ec2:	4e75           	rts

00001ec4 <Zoom_ZoomIntoPicture2>:

void Zoom_ZoomIntoPicture2( UWORD *source1, UWORD *source2, UWORD *target, 
  UWORD levelofzoom, UWORD nrofplanes) {
    1ec4:	4fef ffcc      	lea -52(sp),sp
    1ec8:	2f02           	move.l d2,-(sp)
    1eca:	222f 0048      	move.l 72(sp),d1
    1ece:	202f 004c      	move.l 76(sp),d0
    1ed2:	3201           	move.w d1,d1
    1ed4:	3f41 0008      	move.w d1,8(sp)
    1ed8:	3000           	move.w d0,d0
    1eda:	3f40 0006      	move.w d0,6(sp)

  
  UWORD posx4a = 320-7*(levelofzoom-1);
    1ede:	302f 0008      	move.w 8(sp),d0
    1ee2:	3200           	move.w d0,d1
    1ee4:	e748           	lsl.w #3,d0
    1ee6:	3401           	move.w d1,d2
    1ee8:	9440           	sub.w d0,d2
    1eea:	3002           	move.w d2,d0
    1eec:	3040           	movea.w d0,a0
    1eee:	41e8 0147      	lea 327(a0),a0
    1ef2:	3f48 0036      	move.w a0,54(sp)
  UWORD posx4b = 640-14*( levelofzoom-1);
    1ef6:	322f 0008      	move.w 8(sp),d1
    1efa:	3001           	move.w d1,d0
    1efc:	e749           	lsl.w #3,d1
    1efe:	9041           	sub.w d1,d0
    1f00:	d040           	add.w d0,d0
    1f02:	3200           	move.w d0,d1
    1f04:	0641 028e      	addi.w #654,d1
    1f08:	3f41 0034      	move.w d1,52(sp)
  UWORD ystart = 8*levelofzoom;
    1f0c:	302f 0008      	move.w 8(sp),d0
    1f10:	e748           	lsl.w #3,d0
    1f12:	3f40 001c      	move.w d0,28(sp)
  target = target + 21;
    1f16:	742a           	moveq #42,d2
    1f18:	d5af 0044      	add.l d2,68(sp)
  ULONG pos4astart = ( ULONG)source1 + ystart * 40;
    1f1c:	7200           	moveq #0,d1
    1f1e:	322f 001c      	move.w 28(sp),d1
    1f22:	2001           	move.l d1,d0
    1f24:	d080           	add.l d0,d0
    1f26:	d080           	add.l d0,d0
    1f28:	d081           	add.l d1,d0
    1f2a:	e788           	lsl.l #3,d0
    1f2c:	2200           	move.l d0,d1
    1f2e:	202f 003c      	move.l 60(sp),d0
    1f32:	2401           	move.l d1,d2
    1f34:	d480           	add.l d0,d2
    1f36:	2f42 0018      	move.l d2,24(sp)
  ULONG pos4bstart = ( ULONG)source2 + ystart * 80;
    1f3a:	7200           	moveq #0,d1
    1f3c:	322f 001c      	move.w 28(sp),d1
    1f40:	2001           	move.l d1,d0
    1f42:	d080           	add.l d0,d0
    1f44:	d080           	add.l d0,d0
    1f46:	d081           	add.l d1,d0
    1f48:	e988           	lsl.l #4,d0
    1f4a:	2200           	move.l d0,d1
    1f4c:	202f 0040      	move.l 64(sp),d0
    1f50:	2401           	move.l d1,d2
    1f52:	d480           	add.l d0,d2
    1f54:	2f42 0014      	move.l d2,20(sp)
  UWORD *zl4word = Zoom_Zl4Words + 21 * (levelofzoom) - 1;
    1f58:	2079 0001 97e2 	movea.l 197e2 <Zoom_Zl4Words>,a0
    1f5e:	7200           	moveq #0,d1
    1f60:	322f 0008      	move.w 8(sp),d1
    1f64:	2001           	move.l d1,d0
    1f66:	d080           	add.l d0,d0
    1f68:	d081           	add.l d1,d0
    1f6a:	2200           	move.l d0,d1
    1f6c:	e789           	lsl.l #3,d1
    1f6e:	9280           	sub.l d0,d1
    1f70:	2001           	move.l d1,d0
    1f72:	d081           	add.l d1,d0
    1f74:	2200           	move.l d0,d1
    1f76:	2001           	move.l d1,d0
    1f78:	5580           	subq.l #2,d0
    1f7a:	d1c0           	adda.l d0,a0
    1f7c:	2f48 0030      	move.l a0,48(sp)
  WaitBlt();
    1f80:	4eba 4846      	jsr 67c8 <WaitBlt>(pc)
  hw->bltafwm = 0xffff;
    1f84:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1f8a:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    1f90:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1f96:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltdmod = ZMLINESIZE2 - 2;
    1f9c:	2079 0001 9820 	movea.l 19820 <hw>,a0
    1fa2:	317c 002a 0066 	move.w #42,102(a0)
  for(int i=1;i<=21;i++) {
    1fa8:	7001           	moveq #1,d0
    1faa:	2f40 002c      	move.l d0,44(sp)
    1fae:	6000 020a      	bra.w 21ba <Zoom_ZoomIntoPicture2+0x2f6>
    UWORD *targetpos = target - i;
    1fb2:	202f 002c      	move.l 44(sp),d0
    1fb6:	d080           	add.l d0,d0
    1fb8:	4480           	neg.l d0
    1fba:	222f 0044      	move.l 68(sp),d1
    1fbe:	d280           	add.l d0,d1
    1fc0:	2f41 0028      	move.l d1,40(sp)
    UWORD nrofpixels = 16 - *zl4word;
    1fc4:	206f 0030      	movea.l 48(sp),a0
    1fc8:	3010           	move.w (a0),d0
    1fca:	7410           	moveq #16,d2
    1fcc:	9440           	sub.w d0,d2
    1fce:	3f42 0012      	move.w d2,18(sp)
    posx4a -= nrofpixels;
    1fd2:	302f 0012      	move.w 18(sp),d0
    1fd6:	916f 0036      	sub.w d0,54(sp)
    posx4b -= nrofpixels*2;
    1fda:	302f 0012      	move.w 18(sp),d0
    1fde:	d040           	add.w d0,d0
    1fe0:	916f 0034      	sub.w d0,52(sp)
    ULONG pos4a = pos4astart + ( ( posx4a - 1) >> 4) * 2;
    1fe4:	7000           	moveq #0,d0
    1fe6:	302f 0036      	move.w 54(sp),d0
    1fea:	5380           	subq.l #1,d0
    1fec:	e880           	asr.l #4,d0
    1fee:	d080           	add.l d0,d0
    1ff0:	222f 0018      	move.l 24(sp),d1
    1ff4:	d280           	add.l d0,d1
    1ff6:	2f41 0024      	move.l d1,36(sp)
    ULONG pos4b = pos4bstart + ( ( posx4b - 1) >> 4) * 2;
    1ffa:	7000           	moveq #0,d0
    1ffc:	302f 0034      	move.w 52(sp),d0
    2000:	5380           	subq.l #1,d0
    2002:	e880           	asr.l #4,d0
    2004:	d080           	add.l d0,d0
    2006:	242f 0014      	move.l 20(sp),d2
    200a:	d480           	add.l d0,d2
    200c:	2f42 0020      	move.l d2,32(sp)
    //shift channel a = R of (17 + zl - pos)/16
    UWORD shifta = ( ( 17 + *zl4word - ( posx4a & 0xf)) & 0xf) << 12;
    2010:	206f 0030      	movea.l 48(sp),a0
    2014:	3010           	move.w (a0),d0
    2016:	7200           	moveq #0,d1
    2018:	3200           	move.w d0,d1
    201a:	7000           	moveq #0,d0
    201c:	302f 0036      	move.w 54(sp),d0
    2020:	2041           	movea.l d1,a0
    2022:	91c0           	suba.l d0,a0
    2024:	41e8 0011      	lea 17(a0),a0
    2028:	2008           	move.l a0,d0
    202a:	720c           	moveq #12,d1
    202c:	e3a8           	lsl.l d1,d0
    202e:	3f40 0010      	move.w d0,16(sp)
    //shift channel b = R of (17 - pos)/16 
    UWORD shiftb = ( (16  - ( posx4b & 0xf)) & 0xf) << 12;
    2032:	7000           	moveq #0,d0
    2034:	302f 0034      	move.w 52(sp),d0
    2038:	4480           	neg.l d0
    203a:	740c           	moveq #12,d2
    203c:	e5a8           	lsl.l d2,d0
    203e:	3f40 000e      	move.w d0,14(sp)
    UWORD bltcon0 = 0xde4 + shifta;
    2042:	306f 0010      	movea.w 16(sp),a0
    2046:	41e8 0de4      	lea 3556(a0),a0
    204a:	3f48 000c      	move.w a0,12(sp)
    UWORD linesleft = 271;
    204e:	3f7c 010f 001e 	move.w #271,30(sp)
    UWORD lines2write;
    WaitBlt();
    2054:	4eba 4772      	jsr 67c8 <WaitBlt>(pc)
    hw->bltcon1 = shiftb; 
    2058:	2079 0001 9820 	movea.l 19820 <hw>,a0
    205e:	316f 000e 0042 	move.w 14(sp),66(a0)
    hw->bltcon0 = bltcon0;
    2064:	2079 0001 9820 	movea.l 19820 <hw>,a0
    206a:	316f 000c 0040 	move.w 12(sp),64(a0)
    hw->bltcdat = 0xffff >> (*zl4word--*2);
    2070:	202f 0030      	move.l 48(sp),d0
    2074:	2200           	move.l d0,d1
    2076:	5581           	subq.l #2,d1
    2078:	2f41 0030      	move.l d1,48(sp)
    207c:	2040           	movea.l d0,a0
    207e:	3010           	move.w (a0),d0
    2080:	3000           	move.w d0,d0
    2082:	0280 0000 ffff 	andi.l #65535,d0
    2088:	d080           	add.l d0,d0
    208a:	7200           	moveq #0,d1
    208c:	4641           	not.w d1
    208e:	2401           	move.l d1,d2
    2090:	e0a2           	asr.l d0,d2
    2092:	2002           	move.l d2,d0
    2094:	2079 0001 9820 	movea.l 19820 <hw>,a0
    209a:	2000           	move.l d0,d0
    209c:	3140 0070      	move.w d0,112(a0)
    20a0:	6000 010c      	bra.w 21ae <Zoom_ZoomIntoPicture2+0x2ea>
    while (linesleft > 0) {
      lines2write = 2*levelofzoom;
    20a4:	302f 0008      	move.w 8(sp),d0
    20a8:	d040           	add.w d0,d0
    20aa:	3f40 000a      	move.w d0,10(sp)
      lines2write = linesleft > lines2write ? lines2write : linesleft;
    20ae:	322f 000a      	move.w 10(sp),d1
    20b2:	302f 001e      	move.w 30(sp),d0
    20b6:	b240           	cmp.w d0,d1
    20b8:	6402           	bcc.s 20bc <Zoom_ZoomIntoPicture2+0x1f8>
    20ba:	3001           	move.w d1,d0
    20bc:	3f40 000a      	move.w d0,10(sp)
      Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 36, 76);
    20c0:	7000           	moveq #0,d0
    20c2:	302f 000a      	move.w 10(sp),d0
    20c6:	206f 0020      	movea.l 32(sp),a0
    20ca:	222f 0024      	move.l 36(sp),d1
    20ce:	4878 004c      	pea 4c <main+0x46>
    20d2:	4878 0024      	pea 24 <main+0x1e>
    20d6:	2f00           	move.l d0,-(sp)
    20d8:	2f2f 0034      	move.l 52(sp),-(sp)
    20dc:	2f08           	move.l a0,-(sp)
    20de:	2f01           	move.l d1,-(sp)
    20e0:	4eba eef8      	jsr fda <Zoom_ZoomBlit2>(pc)
    20e4:	4fef 0018      	lea 24(sp),sp
      pos4a += 40 * lines2write;
    20e8:	7200           	moveq #0,d1
    20ea:	322f 000a      	move.w 10(sp),d1
    20ee:	2001           	move.l d1,d0
    20f0:	d080           	add.l d0,d0
    20f2:	d080           	add.l d0,d0
    20f4:	d081           	add.l d1,d0
    20f6:	e788           	lsl.l #3,d0
    20f8:	d1af 0024      	add.l d0,36(sp)
      pos4b += 80 * lines2write;
    20fc:	7200           	moveq #0,d1
    20fe:	322f 000a      	move.w 10(sp),d1
    2102:	2001           	move.l d1,d0
    2104:	d080           	add.l d0,d0
    2106:	d080           	add.l d0,d0
    2108:	d081           	add.l d1,d0
    210a:	e988           	lsl.l #4,d0
    210c:	d1af 0020      	add.l d0,32(sp)
      targetpos += lines2write * ZMLINESIZE2/2;
    2110:	7200           	moveq #0,d1
    2112:	322f 000a      	move.w 10(sp),d1
    2116:	2001           	move.l d1,d0
    2118:	d080           	add.l d0,d0
    211a:	d081           	add.l d1,d0
    211c:	d080           	add.l d0,d0
    211e:	d080           	add.l d0,d0
    2120:	9081           	sub.l d1,d0
    2122:	d080           	add.l d0,d0
    2124:	d080           	add.l d0,d0
    2126:	d1af 0028      	add.l d0,40(sp)
      linesleft -= lines2write;
    212a:	302f 000a      	move.w 10(sp),d0
    212e:	916f 001e      	sub.w d0,30(sp)
      if( linesleft == 0) break;
    2132:	4a6f 001e      	tst.w 30(sp)
    2136:	677e           	beq.s 21b6 <Zoom_ZoomIntoPicture2+0x2f2>
      lines2write = 16 - levelofzoom * 2;
    2138:	7000           	moveq #0,d0
    213a:	302f 0008      	move.w 8(sp),d0
    213e:	7208           	moveq #8,d1
    2140:	9280           	sub.l d0,d1
    2142:	2001           	move.l d1,d0
    2144:	2000           	move.l d0,d0
    2146:	d040           	add.w d0,d0
    2148:	3f40 000a      	move.w d0,10(sp)
      lines2write = linesleft > lines2write ? lines2write : linesleft;
    214c:	322f 000a      	move.w 10(sp),d1
    2150:	302f 001e      	move.w 30(sp),d0
    2154:	b240           	cmp.w d0,d1
    2156:	6402           	bcc.s 215a <Zoom_ZoomIntoPicture2+0x296>
    2158:	3001           	move.w d1,d0
    215a:	3f40 000a      	move.w d0,10(sp)
      if( lines2write > 0) {
    215e:	4a6f 000a      	tst.w 10(sp)
    2162:	674a           	beq.s 21ae <Zoom_ZoomIntoPicture2+0x2ea>
        Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 76, 156);
    2164:	7000           	moveq #0,d0
    2166:	302f 000a      	move.w 10(sp),d0
    216a:	206f 0020      	movea.l 32(sp),a0
    216e:	222f 0024      	move.l 36(sp),d1
    2172:	4878 009c      	pea 9c <main+0x96>
    2176:	4878 004c      	pea 4c <main+0x46>
    217a:	2f00           	move.l d0,-(sp)
    217c:	2f2f 0034      	move.l 52(sp),-(sp)
    2180:	2f08           	move.l a0,-(sp)
    2182:	2f01           	move.l d1,-(sp)
    2184:	4eba ee54      	jsr fda <Zoom_ZoomBlit2>(pc)
    2188:	4fef 0018      	lea 24(sp),sp
        targetpos += lines2write * ZMLINESIZE2/2;
    218c:	7200           	moveq #0,d1
    218e:	322f 000a      	move.w 10(sp),d1
    2192:	2001           	move.l d1,d0
    2194:	d080           	add.l d0,d0
    2196:	d081           	add.l d1,d0
    2198:	d080           	add.l d0,d0
    219a:	d080           	add.l d0,d0
    219c:	9081           	sub.l d1,d0
    219e:	d080           	add.l d0,d0
    21a0:	d080           	add.l d0,d0
    21a2:	d1af 0028      	add.l d0,40(sp)
        linesleft -= lines2write;
    21a6:	342f 000a      	move.w 10(sp),d2
    21aa:	956f 001e      	sub.w d2,30(sp)
    while (linesleft > 0) {
    21ae:	4a6f 001e      	tst.w 30(sp)
    21b2:	6600 fef0      	bne.w 20a4 <Zoom_ZoomIntoPicture2+0x1e0>
  for(int i=1;i<=21;i++) {
    21b6:	52af 002c      	addq.l #1,44(sp)
    21ba:	7015           	moveq #21,d0
    21bc:	b0af 002c      	cmp.l 44(sp),d0
    21c0:	6c00 fdf0      	bge.w 1fb2 <Zoom_ZoomIntoPicture2+0xee>
      }
    }
  }
}
    21c4:	241f           	move.l (sp)+,d2
    21c6:	4fef 0034      	lea 52(sp),sp
    21ca:	4e75           	rts

000021cc <ZoomTest>:
#include "utilsasm.h"
#include <string.h>
#include "zoomtest2.h"

void ZoomTest() {
  TestZoomSpeed();
    21cc:	4eba 001c      	jsr 21ea <TestZoomSpeed>(pc)
  ZoomTestDisplay();
    21d0:	4eba 00ac      	jsr 227e <ZoomTestDisplay>(pc)
  TestBlitleftOfZoom();
    21d4:	4eba 056e      	jsr 2744 <TestBlitleftOfZoom>(pc)
  TestCopyWord();
    21d8:	4eba 0800      	jsr 29da <TestCopyWord>(pc)
  TestZoom4Picture();
    21dc:	4eba 0dea      	jsr 2fc8 <TestZoom4Picture>(pc)
  TestZoom4PictureOn5Planes();
    21e0:	4eba 0af2      	jsr 2cd4 <TestZoom4PictureOn5Planes>(pc)
  Test_Zoom2();
    21e4:	4eba e782      	jsr 968 <Test_Zoom2>(pc)
}
    21e8:	4e75           	rts

000021ea <TestZoomSpeed>:

int Counter4Frames;

void TestZoomSpeed() {
    21ea:	4fef ffe8      	lea -24(sp),sp
    21ee:	48e7 3002      	movem.l d2-d3/a6,-(sp)

 	TakeSystem();
    21f2:	4eba 42fe      	jsr 64f2 <TakeSystem>(pc)
	WaitVbl();
    21f6:	4eba 41b0      	jsr 63a8 <WaitVbl>(pc)
  //               fedcba9876543210
  hw->dmacon = 0b1000011111100000;
    21fa:	2079 0001 9820 	movea.l 19820 <hw>,a0
    2200:	317c 87e0 0096 	move.w #-30752,150(a0)
  Zoom_InitRun(); 
    2206:	4eba ee64      	jsr 106c <Zoom_InitRun>(pc)

  int success = 1;
    220a:	7001           	moveq #1,d0
    220c:	2f40 0020      	move.l d0,32(sp)
  RunFrame();
    2210:	4eba e518      	jsr 72a <RunFrame>(pc)
  if( Zoom_Counter >= 9) success = 0;
    2214:	3039 0001 97d0 	move.w 197d0 <Zoom_Counter>,d0
    221a:	0c40 0008      	cmpi.w #8,d0
    221e:	6304           	bls.s 2224 <TestZoomSpeed+0x3a>
    2220:	42af 0020      	clr.l 32(sp)
    
  Zoom_Dealloc();
    2224:	4eba f032      	jsr 1258 <Zoom_Dealloc>(pc)
  FreeSystem();
    2228:	4eba 41c4      	jsr 63ee <FreeSystem>(pc)

  if(success == 0) Write( Output(), "Testzoomspeed takes too long.\n", 28);
    222c:	4aaf 0020      	tst.l 32(sp)
    2230:	6642           	bne.s 2274 <TestZoomSpeed+0x8a>
    2232:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2238:	2c40           	movea.l d0,a6
    223a:	4eae ffc4      	jsr -60(a6)
    223e:	2f40 001c      	move.l d0,28(sp)
    2242:	202f 001c      	move.l 28(sp),d0
    2246:	2f40 0018      	move.l d0,24(sp)
    224a:	2f7c 0001 72a7 	move.l #94887,20(sp)
    2250:	0014 
    2252:	701c           	moveq #28,d0
    2254:	2f40 0010      	move.l d0,16(sp)
    2258:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    225e:	2c40           	movea.l d0,a6
    2260:	222f 0018      	move.l 24(sp),d1
    2264:	242f 0014      	move.l 20(sp),d2
    2268:	262f 0010      	move.l 16(sp),d3
    226c:	4eae ffd0      	jsr -48(a6)
    2270:	2f40 000c      	move.l d0,12(sp)

  //AddIntServer(INTB_VERTB, vbint);
  //RemIntServer(INTB_VERTB, vbint);
  
}
    2274:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2278:	4fef 0018      	lea 24(sp),sp
    227c:	4e75           	rts

0000227e <ZoomTestDisplay>:

void ZoomTestDisplay() {
    227e:	4fef ff38      	lea -200(sp),sp
    2282:	48e7 3002      	movem.l d2-d3/a6,-(sp)

  Zoom_Init();
    2286:	4eba f188      	jsr 1410 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    228a:	4eba f52a      	jsr 17b6 <PrepareDisplayZoom>(pc)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    228e:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    2294:	4878 0010      	pea 10 <main+0xa>
    2298:	4879 0001 976c 	pea 1976c <ClsSprites>
    229e:	42a7           	clr.l -(sp)
    22a0:	2f00           	move.l d0,-(sp)
    22a2:	4eba 3e2e      	jsr 60d2 <TestCopperlistBatch>(pc)
    22a6:	4fef 0010      	lea 16(sp),sp
    22aa:	4a80           	tst.l d0
    22ac:	6642           	bne.s 22f0 <ZoomTestDisplay+0x72>
    Write( Output(), 
    22ae:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    22b4:	2c40           	movea.l d0,a6
    22b6:	4eae ffc4      	jsr -60(a6)
    22ba:	2f40 00d0      	move.l d0,208(sp)
    22be:	202f 00d0      	move.l 208(sp),d0
    22c2:	2f40 00cc      	move.l d0,204(sp)
    22c6:	2f7c 0001 72c6 	move.l #94918,200(sp)
    22cc:	00c8 
    22ce:	7045           	moveq #69,d0
    22d0:	2f40 00c4      	move.l d0,196(sp)
    22d4:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    22da:	2c40           	movea.l d0,a6
    22dc:	222f 00cc      	move.l 204(sp),d1
    22e0:	242f 00c8      	move.l 200(sp),d2
    22e4:	262f 00c4      	move.l 196(sp),d3
    22e8:	4eae ffd0      	jsr -48(a6)
    22ec:	2f40 00c0      	move.l d0,192(sp)
       "ZoomCopperlist: Sprite section of copper starting on pos 0 messed up\n", 
                                                                            69);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    22f0:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    22f6:	4878 000c      	pea c <main+0x6>
    22fa:	4879 0001 973c 	pea 1973c <ClScreen>
    2300:	4878 0010      	pea 10 <main+0xa>
    2304:	2f00           	move.l d0,-(sp)
    2306:	4eba 3dca      	jsr 60d2 <TestCopperlistBatch>(pc)
    230a:	4fef 0010      	lea 16(sp),sp
    230e:	4a80           	tst.l d0
    2310:	6642           	bne.s 2354 <ZoomTestDisplay+0xd6>
    Write( Output(), 
    2312:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2318:	2c40           	movea.l d0,a6
    231a:	4eae ffc4      	jsr -60(a6)
    231e:	2f40 00bc      	move.l d0,188(sp)
    2322:	202f 00bc      	move.l 188(sp),d0
    2326:	2f40 00b8      	move.l d0,184(sp)
    232a:	2f7c 0001 730c 	move.l #94988,180(sp)
    2330:	00b4 
    2332:	7046           	moveq #70,d0
    2334:	2f40 00b0      	move.l d0,176(sp)
    2338:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    233e:	2c40           	movea.l d0,a6
    2340:	222f 00b8      	move.l 184(sp),d1
    2344:	242f 00b4      	move.l 180(sp),d2
    2348:	262f 00b0      	move.l 176(sp),d3
    234c:	4eae ffd0      	jsr -48(a6)
    2350:	2f40 00ac      	move.l d0,172(sp)
      "ZoomCopperlist: Screen section of copper starting on pos 16 messed up\n",
                                                                            70);
  DrawBuffer = (ULONG *) 0x40000;
    2354:	23fc 0004 0000 	move.l #262144,19830 <DrawBuffer>
    235a:	0001 9830 
  ViewBuffer = (ULONG *) 0x50000;
    235e:	23fc 0005 0000 	move.l #327680,19828 <ViewBuffer>
    2364:	0001 9828 
  Zoom_SetBplPointers( DrawBuffer, DrawCopper);
    2368:	2239 0001 9824 	move.l 19824 <DrawCopper>,d1
    236e:	2039 0001 9830 	move.l 19830 <DrawBuffer>,d0
    2374:	2f01           	move.l d1,-(sp)
    2376:	2f00           	move.l d0,-(sp)
    2378:	4eba faac      	jsr 1e26 <Zoom_SetBplPointers>(pc)
    237c:	508f           	addq.l #8,sp
  Zoom_SwapBuffers();
    237e:	4eba fb22      	jsr 1ea2 <Zoom_SwapBuffers>(pc)
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    2382:	2039 0001 9830 	move.l 19830 <DrawBuffer>,d0
    2388:	0c80 0005 0000 	cmpi.l #327680,d0
    238e:	660e           	bne.s 239e <ZoomTestDisplay+0x120>
    2390:	2039 0001 9828 	move.l 19828 <ViewBuffer>,d0
    2396:	0c80 0004 0000 	cmpi.l #262144,d0
    239c:	6742           	beq.s 23e0 <ZoomTestDisplay+0x162>
    Write( Output(), 
    239e:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    23a4:	2c40           	movea.l d0,a6
    23a6:	4eae ffc4      	jsr -60(a6)
    23aa:	2f40 00a8      	move.l d0,168(sp)
    23ae:	202f 00a8      	move.l 168(sp),d0
    23b2:	2f40 00a4      	move.l d0,164(sp)
    23b6:	2f7c 0001 7353 	move.l #95059,160(sp)
    23bc:	00a0 
    23be:	703b           	moveq #59,d0
    23c0:	2f40 009c      	move.l d0,156(sp)
    23c4:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    23ca:	2c40           	movea.l d0,a6
    23cc:	222f 00a4      	move.l 164(sp),d1
    23d0:	242f 00a0      	move.l 160(sp),d2
    23d4:	262f 009c      	move.l 156(sp),d3
    23d8:	4eae ffd0      	jsr -48(a6)
    23dc:	2f40 0098      	move.l d0,152(sp)
            "ZoomCopperlist: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    23e0:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    23e6:	2f3c 00e0 0004 	move.l #14680068,-(sp)
    23ec:	4878 001c      	pea 1c <main+0x16>
    23f0:	2f00           	move.l d0,-(sp)
    23f2:	4eba 3cc0      	jsr 60b4 <TestCopperlistPos>(pc)
    23f6:	4fef 000c      	lea 12(sp),sp
    23fa:	4a80           	tst.l d0
    23fc:	6642           	bne.s 2440 <ZoomTestDisplay+0x1c2>
    Write(Output(), 
    23fe:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2404:	2c40           	movea.l d0,a6
    2406:	4eae ffc4      	jsr -60(a6)
    240a:	2f40 0094      	move.l d0,148(sp)
    240e:	202f 0094      	move.l 148(sp),d0
    2412:	2f40 0090      	move.l d0,144(sp)
    2416:	2f7c 0001 738f 	move.l #95119,140(sp)
    241c:	008c 
    241e:	703c           	moveq #60,d0
    2420:	2f40 0088      	move.l d0,136(sp)
    2424:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    242a:	2c40           	movea.l d0,a6
    242c:	222f 0090      	move.l 144(sp),d1
    2430:	242f 008c      	move.l 140(sp),d2
    2434:	262f 0088      	move.l 136(sp),d3
    2438:	4eae ffd0      	jsr -48(a6)
    243c:	2f40 0084      	move.l d0,132(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e200f4) == 0)
    2440:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    2446:	2f3c 00e2 00f4 	move.l #14811380,-(sp)
    244c:	4878 001d      	pea 1d <main+0x17>
    2450:	2f00           	move.l d0,-(sp)
    2452:	4eba 3c60      	jsr 60b4 <TestCopperlistPos>(pc)
    2456:	4fef 000c      	lea 12(sp),sp
    245a:	4a80           	tst.l d0
    245c:	6642           	bne.s 24a0 <ZoomTestDisplay+0x222>
    Write(Output(), 
    245e:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2464:	2c40           	movea.l d0,a6
    2466:	4eae ffc4      	jsr -60(a6)
    246a:	2f40 0080      	move.l d0,128(sp)
    246e:	202f 0080      	move.l 128(sp),d0
    2472:	2f40 007c      	move.l d0,124(sp)
    2476:	2f7c 0001 73cc 	move.l #95180,120(sp)
    247c:	0078 
    247e:	703c           	moveq #60,d0
    2480:	2f40 0074      	move.l d0,116(sp)
    2484:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    248a:	2c40           	movea.l d0,a6
    248c:	222f 007c      	move.l 124(sp),d1
    2490:	242f 0078      	move.l 120(sp),d2
    2494:	262f 0074      	move.l 116(sp),d3
    2498:	4eae ffd0      	jsr -48(a6)
    249c:	2f40 0070      	move.l d0,112(sp)
           "ZoomCopperlist: Problem in Copperlist bpl1pl should be 00f4\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    24a0:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    24a6:	2f3c 00e4 0004 	move.l #14942212,-(sp)
    24ac:	4878 001e      	pea 1e <main+0x18>
    24b0:	2f00           	move.l d0,-(sp)
    24b2:	4eba 3c00      	jsr 60b4 <TestCopperlistPos>(pc)
    24b6:	4fef 000c      	lea 12(sp),sp
    24ba:	4a80           	tst.l d0
    24bc:	6642           	bne.s 2500 <ZoomTestDisplay+0x282>
    Write(Output(), 
    24be:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    24c4:	2c40           	movea.l d0,a6
    24c6:	4eae ffc4      	jsr -60(a6)
    24ca:	2f40 006c      	move.l d0,108(sp)
    24ce:	202f 006c      	move.l 108(sp),d0
    24d2:	2f40 0068      	move.l d0,104(sp)
    24d6:	2f7c 0001 7409 	move.l #95241,100(sp)
    24dc:	0064 
    24de:	703c           	moveq #60,d0
    24e0:	2f40 0060      	move.l d0,96(sp)
    24e4:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    24ea:	2c40           	movea.l d0,a6
    24ec:	222f 0068      	move.l 104(sp),d1
    24f0:	242f 0064      	move.l 100(sp),d2
    24f4:	262f 0060      	move.l 96(sp),d3
    24f8:	4eae ffd0      	jsr -48(a6)
    24fc:	2f40 005c      	move.l d0,92(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e60124) == 0)
    2500:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    2506:	2f3c 00e6 0124 	move.l #15073572,-(sp)
    250c:	4878 001f      	pea 1f <main+0x19>
    2510:	2f00           	move.l d0,-(sp)
    2512:	4eba 3ba0      	jsr 60b4 <TestCopperlistPos>(pc)
    2516:	4fef 000c      	lea 12(sp),sp
    251a:	4a80           	tst.l d0
    251c:	6642           	bne.s 2560 <ZoomTestDisplay+0x2e2>
    Write(Output(), 
    251e:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2524:	2c40           	movea.l d0,a6
    2526:	4eae ffc4      	jsr -60(a6)
    252a:	2f40 0058      	move.l d0,88(sp)
    252e:	202f 0058      	move.l 88(sp),d0
    2532:	2f40 0054      	move.l d0,84(sp)
    2536:	2f7c 0001 7446 	move.l #95302,80(sp)
    253c:	0050 
    253e:	703c           	moveq #60,d0
    2540:	2f40 004c      	move.l d0,76(sp)
    2544:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    254a:	2c40           	movea.l d0,a6
    254c:	222f 0054      	move.l 84(sp),d1
    2550:	242f 0050      	move.l 80(sp),d2
    2554:	262f 004c      	move.l 76(sp),d3
    2558:	4eae ffd0      	jsr -48(a6)
    255c:	2f40 0048      	move.l d0,72(sp)
           "ZoomCopperlist: Problem in Copperlist bpl2pl should be 0034\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 38, ClColor, 32) == 0)
    2560:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    2566:	4878 0020      	pea 20 <main+0x1a>
    256a:	4879 0001 96bc 	pea 196bc <ClColor>
    2570:	4878 0026      	pea 26 <main+0x20>
    2574:	2f00           	move.l d0,-(sp)
    2576:	4eba 3b5a      	jsr 60d2 <TestCopperlistBatch>(pc)
    257a:	4fef 0010      	lea 16(sp),sp
    257e:	4a80           	tst.l d0
    2580:	6642           	bne.s 25c4 <ZoomTestDisplay+0x346>
    Write(Output(), "ZoomCopperlist: Colorpart messed up.\n", 37);
    2582:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2588:	2c40           	movea.l d0,a6
    258a:	4eae ffc4      	jsr -60(a6)
    258e:	2f40 0044      	move.l d0,68(sp)
    2592:	202f 0044      	move.l 68(sp),d0
    2596:	2f40 0040      	move.l d0,64(sp)
    259a:	2f7c 0001 7483 	move.l #95363,60(sp)
    25a0:	003c 
    25a2:	7025           	moveq #37,d0
    25a4:	2f40 0038      	move.l d0,56(sp)
    25a8:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    25ae:	2c40           	movea.l d0,a6
    25b0:	222f 0040      	move.l 64(sp),d1
    25b4:	242f 003c      	move.l 60(sp),d2
    25b8:	262f 0038      	move.l 56(sp),d3
    25bc:	4eae ffd0      	jsr -48(a6)
    25c0:	2f40 0034      	move.l d0,52(sp)

  /*if(  TestCopperlistBatch(  Copperlist1, 71, Cl102ZoomRepeat, 21) == 0)
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 36); */
  
  Zoom_Shrink102( 15, (UWORD *) Copperlist1);
    25c4:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    25ca:	2f00           	move.l d0,-(sp)
    25cc:	4878 000f      	pea f <main+0x9>
    25d0:	4eba e2fe      	jsr 8d0 <Zoom_Shrink102>(pc)
    25d4:	508f           	addq.l #8,sp
  if( TestCopperListZoom102( Copperlist1, 73, Cl102ZoomTest) == 0)
    25d6:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    25dc:	4879 0001 9180 	pea 19180 <Cl102ZoomTest>
    25e2:	4878 0049      	pea 49 <main+0x43>
    25e6:	2f00           	move.l d0,-(sp)
    25e8:	4eba 00c4      	jsr 26ae <TestCopperListZoom102>(pc)
    25ec:	4fef 000c      	lea 12(sp),sp
    25f0:	4a80           	tst.l d0
    25f2:	6642           	bne.s 2636 <ZoomTestDisplay+0x3b8>
    Write(Output(), "ZoomCopperlist: Zoompart messed up.\n", 37);
    25f4:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    25fa:	2c40           	movea.l d0,a6
    25fc:	4eae ffc4      	jsr -60(a6)
    2600:	2f40 0030      	move.l d0,48(sp)
    2604:	202f 0030      	move.l 48(sp),d0
    2608:	2f40 002c      	move.l d0,44(sp)
    260c:	2f7c 0001 74a9 	move.l #95401,40(sp)
    2612:	0028 
    2614:	7025           	moveq #37,d0
    2616:	2f40 0024      	move.l d0,36(sp)
    261a:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2620:	2c40           	movea.l d0,a6
    2622:	222f 002c      	move.l 44(sp),d1
    2626:	242f 0028      	move.l 40(sp),d2
    262a:	262f 0024      	move.l 36(sp),d3
    262e:	4eae ffd0      	jsr -48(a6)
    2632:	2f40 0020      	move.l d0,32(sp)

  if( TestCopperlistPos( Copperlist1, 73+114, 0xfffffffe) == 0)
    2636:	2039 0001 982c 	move.l 1982c <Copperlist1>,d0
    263c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffd3e44>
    2640:	4878 00bb      	pea bb <main+0xb5>
    2644:	2f00           	move.l d0,-(sp)
    2646:	4eba 3a6c      	jsr 60b4 <TestCopperlistPos>(pc)
    264a:	4fef 000c      	lea 12(sp),sp
    264e:	4a80           	tst.l d0
    2650:	6642           	bne.s 2694 <ZoomTestDisplay+0x416>
    Write( Output(), "ZoomCopperlist: Copperlist End not correctly set.\n", 50);
    2652:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2658:	2c40           	movea.l d0,a6
    265a:	4eae ffc4      	jsr -60(a6)
    265e:	2f40 001c      	move.l d0,28(sp)
    2662:	202f 001c      	move.l 28(sp),d0
    2666:	2f40 0018      	move.l d0,24(sp)
    266a:	2f7c 0001 74ce 	move.l #95438,20(sp)
    2670:	0014 
    2672:	7032           	moveq #50,d0
    2674:	2f40 0010      	move.l d0,16(sp)
    2678:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    267e:	2c40           	movea.l d0,a6
    2680:	222f 0018      	move.l 24(sp),d1
    2684:	242f 0014      	move.l 20(sp),d2
    2688:	262f 0010      	move.l 16(sp),d3
    268c:	4eae ffd0      	jsr -48(a6)
    2690:	2f40 000c      	move.l d0,12(sp)

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    2694:	2f3c 0000 ff00 	move.l #65280,-(sp)
    269a:	4878 031c      	pea 31c <main+0x316>
    269e:	4eba 40b6      	jsr 6756 <FreeDisplay>(pc)
    26a2:	508f           	addq.l #8,sp

}
    26a4:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    26a8:	4fef 00c8      	lea 200(sp),sp
    26ac:	4e75           	rts

000026ae <TestCopperListZoom102>:

int TestCopperListZoom102( ULONG *cl2test, UWORD position, 
                                                           ULONG *template4cl) {
    26ae:	598f           	subq.l #4,sp
    26b0:	202f 000c      	move.l 12(sp),d0
    26b4:	3000           	move.w d0,d0
    26b6:	3f40 0002      	move.w d0,2(sp)
  if( TestCopperlistBatch( cl2test, position, template4cl, 28) == 0)
    26ba:	7000           	moveq #0,d0
    26bc:	302f 0002      	move.w 2(sp),d0
    26c0:	4878 001c      	pea 1c <main+0x16>
    26c4:	2f2f 0014      	move.l 20(sp),-(sp)
    26c8:	2f00           	move.l d0,-(sp)
    26ca:	2f2f 0014      	move.l 20(sp),-(sp)
    26ce:	4eba 3a02      	jsr 60d2 <TestCopperlistBatch>(pc)
    26d2:	4fef 0010      	lea 16(sp),sp
    26d6:	4a80           	tst.l d0
    26d8:	6604           	bne.s 26de <TestCopperListZoom102+0x30>
    return 0;
    26da:	7000           	moveq #0,d0
    26dc:	6062           	bra.s 2740 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+30, template4cl+30, 54) == 0)
    26de:	7078           	moveq #120,d0
    26e0:	d0af 0010      	add.l 16(sp),d0
    26e4:	7200           	moveq #0,d1
    26e6:	322f 0002      	move.w 2(sp),d1
    26ea:	307c 001e      	movea.w #30,a0
    26ee:	d1c1           	adda.l d1,a0
    26f0:	4878 0036      	pea 36 <main+0x30>
    26f4:	2f00           	move.l d0,-(sp)
    26f6:	2f08           	move.l a0,-(sp)
    26f8:	2f2f 0014      	move.l 20(sp),-(sp)
    26fc:	4eba 39d4      	jsr 60d2 <TestCopperlistBatch>(pc)
    2700:	4fef 0010      	lea 16(sp),sp
    2704:	4a80           	tst.l d0
    2706:	6604           	bne.s 270c <TestCopperListZoom102+0x5e>
    return 0;
    2708:	7000           	moveq #0,d0
    270a:	6034           	bra.s 2740 <TestCopperListZoom102+0x92>
  if( TestCopperlistBatch( cl2test, position+86, template4cl+86, 28) == 0)
    270c:	202f 0010      	move.l 16(sp),d0
    2710:	0680 0000 0158 	addi.l #344,d0
    2716:	7200           	moveq #0,d1
    2718:	322f 0002      	move.w 2(sp),d1
    271c:	307c 0056      	movea.w #86,a0
    2720:	d1c1           	adda.l d1,a0
    2722:	4878 001c      	pea 1c <main+0x16>
    2726:	2f00           	move.l d0,-(sp)
    2728:	2f08           	move.l a0,-(sp)
    272a:	2f2f 0014      	move.l 20(sp),-(sp)
    272e:	4eba 39a2      	jsr 60d2 <TestCopperlistBatch>(pc)
    2732:	4fef 0010      	lea 16(sp),sp
    2736:	4a80           	tst.l d0
    2738:	6604           	bne.s 273e <TestCopperListZoom102+0x90>
    return 0;
    273a:	7000           	moveq #0,d0
    273c:	6002           	bra.s 2740 <TestCopperListZoom102+0x92>
 
  return 1;
    273e:	7001           	moveq #1,d0
}
    2740:	588f           	addq.l #4,sp
    2742:	4e75           	rts

00002744 <TestBlitleftOfZoom>:

void TestBlitleftOfZoom() {
    2744:	4fef ff94      	lea -108(sp),sp
    2748:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  Zoom_Init();
    274c:	4eba ecc2      	jsr 1410 <Zoom_Init>(pc)
  PrepareDisplayZoom();
    2750:	4eba f064      	jsr 17b6 <PrepareDisplayZoom>(pc)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    2754:	2f7c 0000 c800 	move.l #51200,116(sp)
    275a:	0074 
    275c:	7002           	moveq #2,d0
    275e:	2f40 0070      	move.l d0,112(sp)
    2762:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2768:	2c40           	movea.l d0,a6
    276a:	202f 0074      	move.l 116(sp),d0
    276e:	222f 0070      	move.l 112(sp),d1
    2772:	4eae ff3a      	jsr -198(a6)
    2776:	2f40 006c      	move.l d0,108(sp)
    277a:	202f 006c      	move.l 108(sp),d0
    277e:	23c0 0001 97c6 	move.l d0,197c6 <Zoom_Source>
  if( Zoom_Source == 0) {
    2784:	2039 0001 97c6 	move.l 197c6 <Zoom_Source>,d0
    278a:	4a80           	tst.l d0
    278c:	6646           	bne.s 27d4 <TestBlitleftOfZoom+0x90>
    Write(  Output(), 
    278e:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2794:	2c40           	movea.l d0,a6
    2796:	4eae ffc4      	jsr -60(a6)
    279a:	2f40 0068      	move.l d0,104(sp)
    279e:	202f 0068      	move.l 104(sp),d0
    27a2:	2f40 0064      	move.l d0,100(sp)
    27a6:	2f7c 0001 7501 	move.l #95489,96(sp)
    27ac:	0060 
    27ae:	7236           	moveq #54,d1
    27b0:	2f41 005c      	move.l d1,92(sp)
    27b4:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    27ba:	2c40           	movea.l d0,a6
    27bc:	222f 0064      	move.l 100(sp),d1
    27c0:	242f 0060      	move.l 96(sp),d2
    27c4:	262f 005c      	move.l 92(sp),d3
    27c8:	4eae ffd0      	jsr -48(a6)
    27cc:	2f40 0058      	move.l d0,88(sp)
    27d0:	6000 01fe      	bra.w 29d0 <TestBlitleftOfZoom+0x28c>
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  
  UWORD *tstsource = Zoom_Source;
    27d4:	2f79 0001 97c6 	move.l 197c6 <Zoom_Source>,84(sp)
    27da:	0054 
  *tstsource++ = 0x0000;
    27dc:	202f 0054      	move.l 84(sp),d0
    27e0:	2200           	move.l d0,d1
    27e2:	5481           	addq.l #2,d1
    27e4:	2f41 0054      	move.l d1,84(sp)
    27e8:	2040           	movea.l d0,a0
    27ea:	4250           	clr.w (a0)
  *tstsource = 0x0080;
    27ec:	206f 0054      	movea.l 84(sp),a0
    27f0:	30bc 0080      	move.w #128,(a0)
  tstsource += ZMLINESIZE/2-1;
    27f4:	702e           	moveq #46,d0
    27f6:	d1af 0054      	add.l d0,84(sp)
  *tstsource = 0x1000;
    27fa:	206f 0054      	movea.l 84(sp),a0
    27fe:	30bc 1000      	move.w #4096,(a0)
  tstsource++;
    2802:	54af 0054      	addq.l #2,84(sp)
  *tstsource = 0x8e88;
    2806:	206f 0054      	movea.l 84(sp),a0
    280a:	30bc 8e88      	move.w #-29048,(a0)
  tstsource += ZMLINESIZE/2-1;
    280e:	722e           	moveq #46,d1
    2810:	d3af 0054      	add.l d1,84(sp)

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
    2814:	2039 0001 97c6 	move.l 197c6 <Zoom_Source>,d0
    281a:	2200           	move.l d0,d1
    281c:	0681 0000 17d0 	addi.l #6096,d1
    2822:	2f41 0054      	move.l d1,84(sp)
  *tstsource++ = 0x0000;
    2826:	202f 0054      	move.l 84(sp),d0
    282a:	2200           	move.l d0,d1
    282c:	5481           	addq.l #2,d1
    282e:	2f41 0054      	move.l d1,84(sp)
    2832:	2040           	movea.l d0,a0
    2834:	4250           	clr.w (a0)
  *tstsource = 0x00ff;
    2836:	206f 0054      	movea.l 84(sp),a0
    283a:	30bc 00ff      	move.w #255,(a0)
  WaitBlit();
    283e:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    2844:	2c40           	movea.l d0,a6
    2846:	4eae ff1c      	jsr -228(a6)
  Init_Blit();
    284a:	4eba f0e6      	jsr 1932 <Init_Blit>(pc)
  Init_ZoomBlit( 7, 16, 0);
    284e:	42a7           	clr.l -(sp)
    2850:	4878 0010      	pea 10 <main+0xa>
    2854:	4878 0007      	pea 7 <main+0x1>
    2858:	4eba f154      	jsr 19ae <Init_ZoomBlit>(pc)
    285c:	4fef 000c      	lea 12(sp),sp
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
    2860:	2239 0001 9830 	move.l 19830 <DrawBuffer>,d1
    2866:	2039 0001 97c6 	move.l 197c6 <Zoom_Source>,d0
    286c:	4878 0080      	pea 80 <main+0x7a>
    2870:	2f01           	move.l d1,-(sp)
    2872:	2f00           	move.l d0,-(sp)
    2874:	4eba e700      	jsr f76 <Zoom_ZoomBlit>(pc)
    2878:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    287c:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    2882:	2c40           	movea.l d0,a6
    2884:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
    2888:	2039 0001 9830 	move.l 19830 <DrawBuffer>,d0
    288e:	2200           	move.l d0,d1
    2890:	5481           	addq.l #2,d1
    2892:	2f41 0050      	move.l d1,80(sp)
  if( *destination != 0x0180) {
    2896:	206f 0050      	movea.l 80(sp),a0
    289a:	3010           	move.w (a0),d0
    289c:	0c40 0180      	cmpi.w #384,d0
    28a0:	6742           	beq.s 28e4 <TestBlitleftOfZoom+0x1a0>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
    28a2:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    28a8:	2c40           	movea.l d0,a6
    28aa:	4eae ffc4      	jsr -60(a6)
    28ae:	2f40 004c      	move.l d0,76(sp)
    28b2:	202f 004c      	move.l 76(sp),d0
    28b6:	2f40 0048      	move.l d0,72(sp)
    28ba:	2f7c 0001 7539 	move.l #95545,68(sp)
    28c0:	0044 
    28c2:	701c           	moveq #28,d0
    28c4:	2f40 0040      	move.l d0,64(sp)
    28c8:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    28ce:	2c40           	movea.l d0,a6
    28d0:	222f 0048      	move.l 72(sp),d1
    28d4:	242f 0044      	move.l 68(sp),d2
    28d8:	262f 0040      	move.l 64(sp),d3
    28dc:	4eae ffd0      	jsr -48(a6)
    28e0:	2f40 003c      	move.l d0,60(sp)
  }
  destination += ZMLINESIZE/2;
    28e4:	7230           	moveq #48,d1
    28e6:	d3af 0050      	add.l d1,80(sp)
  if( *destination != 0x1d88)
    28ea:	206f 0050      	movea.l 80(sp),a0
    28ee:	3010           	move.w (a0),d0
    28f0:	0c40 1d88      	cmpi.w #7560,d0
    28f4:	6742           	beq.s 2938 <TestBlitleftOfZoom+0x1f4>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
    28f6:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    28fc:	2c40           	movea.l d0,a6
    28fe:	4eae ffc4      	jsr -60(a6)
    2902:	2f40 0038      	move.l d0,56(sp)
    2906:	202f 0038      	move.l 56(sp),d0
    290a:	2f40 0034      	move.l d0,52(sp)
    290e:	2f7c 0001 7556 	move.l #95574,48(sp)
    2914:	0030 
    2916:	701c           	moveq #28,d0
    2918:	2f40 002c      	move.l d0,44(sp)
    291c:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2922:	2c40           	movea.l d0,a6
    2924:	222f 0034      	move.l 52(sp),d1
    2928:	242f 0030      	move.l 48(sp),d2
    292c:	262f 002c      	move.l 44(sp),d3
    2930:	4eae ffd0      	jsr -48(a6)
    2934:	2f40 0028      	move.l d0,40(sp)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
    2938:	2039 0001 9830 	move.l 19830 <DrawBuffer>,d0
    293e:	2200           	move.l d0,d1
    2940:	0681 0000 17d0 	addi.l #6096,d1
    2946:	2f41 0050      	move.l d1,80(sp)
  destination++;
    294a:	54af 0050      	addq.l #2,80(sp)
  if( *destination != 0x01ff) {
    294e:	206f 0050      	movea.l 80(sp),a0
    2952:	3010           	move.w (a0),d0
    2954:	0c40 01ff      	cmpi.w #511,d0
    2958:	6742           	beq.s 299c <TestBlitleftOfZoom+0x258>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
    295a:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2960:	2c40           	movea.l d0,a6
    2962:	4eae ffc4      	jsr -60(a6)
    2966:	2f40 0024      	move.l d0,36(sp)
    296a:	202f 0024      	move.l 36(sp),d0
    296e:	2f40 0020      	move.l d0,32(sp)
    2972:	2f7c 0001 7573 	move.l #95603,28(sp)
    2978:	001c 
    297a:	701a           	moveq #26,d0
    297c:	2f40 0018      	move.l d0,24(sp)
    2980:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2986:	2c40           	movea.l d0,a6
    2988:	222f 0020      	move.l 32(sp),d1
    298c:	242f 001c      	move.l 28(sp),d2
    2990:	262f 0018      	move.l 24(sp),d3
    2994:	4eae ffd0      	jsr -48(a6)
    2998:	2f40 0014      	move.l d0,20(sp)
  }
  FreeMem( Zoom_Source, 40*256*5);
    299c:	2f79 0001 97c6 	move.l 197c6 <Zoom_Source>,16(sp)
    29a2:	0010 
    29a4:	2f7c 0000 c800 	move.l #51200,12(sp)
    29aa:	000c 
    29ac:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    29b2:	2c40           	movea.l d0,a6
    29b4:	226f 0010      	movea.l 16(sp),a1
    29b8:	202f 000c      	move.l 12(sp),d0
    29bc:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
    29c0:	2f3c 0000 ff00 	move.l #65280,-(sp)
    29c6:	4878 031c      	pea 31c <main+0x316>
    29ca:	4eba 3d8a      	jsr 6756 <FreeDisplay>(pc)
    29ce:	508f           	addq.l #8,sp
}
    29d0:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    29d4:	4fef 006c      	lea 108(sp),sp
    29d8:	4e75           	rts

000029da <TestCopyWord>:

void TestCopyWord() {
    29da:	4fef ff74      	lea -140(sp),sp
    29de:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    29e2:	2f7c 0000 05a0 	move.l #1440,136(sp)
    29e8:	0088 
    29ea:	7002           	moveq #2,d0
    29ec:	2f40 0084      	move.l d0,132(sp)
    29f0:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    29f6:	2c40           	movea.l d0,a6
    29f8:	202f 0088      	move.l 136(sp),d0
    29fc:	222f 0084      	move.l 132(sp),d1
    2a00:	4eae ff3a      	jsr -198(a6)
    2a04:	2f40 0080      	move.l d0,128(sp)
    2a08:	202f 0080      	move.l 128(sp),d0
    2a0c:	2f40 007c      	move.l d0,124(sp)
  if( source == 0) {
    2a10:	4aaf 007c      	tst.l 124(sp)
    2a14:	6646           	bne.s 2a5c <TestCopyWord+0x82>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    2a16:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2a1c:	2c40           	movea.l d0,a6
    2a1e:	4eae ffc4      	jsr -60(a6)
    2a22:	2f40 0078      	move.l d0,120(sp)
    2a26:	202f 0078      	move.l 120(sp),d0
    2a2a:	2f40 0074      	move.l d0,116(sp)
    2a2e:	2f7c 0001 758e 	move.l #95630,112(sp)
    2a34:	0070 
    2a36:	7235           	moveq #53,d1
    2a38:	2f41 006c      	move.l d1,108(sp)
    2a3c:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2a42:	2c40           	movea.l d0,a6
    2a44:	222f 0074      	move.l 116(sp),d1
    2a48:	242f 0070      	move.l 112(sp),d2
    2a4c:	262f 006c      	move.l 108(sp),d3
    2a50:	4eae ffd0      	jsr -48(a6)
    2a54:	2f40 0068      	move.l d0,104(sp)
    2a58:	6000 0270      	bra.w 2cca <TestCopyWord+0x2f0>
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
    2a5c:	2f7c 0000 05a0 	move.l #1440,100(sp)
    2a62:	0064 
    2a64:	7002           	moveq #2,d0
    2a66:	2f40 0060      	move.l d0,96(sp)
    2a6a:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2a70:	2c40           	movea.l d0,a6
    2a72:	202f 0064      	move.l 100(sp),d0
    2a76:	222f 0060      	move.l 96(sp),d1
    2a7a:	4eae ff3a      	jsr -198(a6)
    2a7e:	2f40 005c      	move.l d0,92(sp)
    2a82:	202f 005c      	move.l 92(sp),d0
    2a86:	2f40 0058      	move.l d0,88(sp)
  if( destination == 0) {
    2a8a:	4aaf 0058      	tst.l 88(sp)
    2a8e:	6646           	bne.s 2ad6 <TestCopyWord+0xfc>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    2a90:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2a96:	2c40           	movea.l d0,a6
    2a98:	4eae ffc4      	jsr -60(a6)
    2a9c:	2f40 0054      	move.l d0,84(sp)
    2aa0:	202f 0054      	move.l 84(sp),d0
    2aa4:	2f40 0050      	move.l d0,80(sp)
    2aa8:	2f7c 0001 758e 	move.l #95630,76(sp)
    2aae:	004c 
    2ab0:	7235           	moveq #53,d1
    2ab2:	2f41 0048      	move.l d1,72(sp)
    2ab6:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2abc:	2c40           	movea.l d0,a6
    2abe:	222f 0050      	move.l 80(sp),d1
    2ac2:	242f 004c      	move.l 76(sp),d2
    2ac6:	262f 0048      	move.l 72(sp),d3
    2aca:	4eae ffd0      	jsr -48(a6)
    2ace:	2f40 0044      	move.l d0,68(sp)
    2ad2:	6000 01f6      	bra.w 2cca <TestCopyWord+0x2f0>
                                                                            53);
    return;
  }
  
  UWORD *tmp = source;
    2ad6:	2f6f 007c 0094 	move.l 124(sp),148(sp)
  for( int i=0; i<8;i++) {
    2adc:	42af 0090      	clr.l 144(sp)
    2ae0:	6000 0086      	bra.w 2b68 <TestCopyWord+0x18e>
    *tmp++ = 0;
    2ae4:	202f 0094      	move.l 148(sp),d0
    2ae8:	2200           	move.l d0,d1
    2aea:	5481           	addq.l #2,d1
    2aec:	2f41 0094      	move.l d1,148(sp)
    2af0:	2040           	movea.l d0,a0
    2af2:	4250           	clr.w (a0)
    *tmp++ = 0xaaaa;
    2af4:	202f 0094      	move.l 148(sp),d0
    2af8:	2200           	move.l d0,d1
    2afa:	5481           	addq.l #2,d1
    2afc:	2f41 0094      	move.l d1,148(sp)
    2b00:	2040           	movea.l d0,a0
    2b02:	30bc aaaa      	move.w #-21846,(a0)
    *tmp++ = 0xaaaa;
    2b06:	202f 0094      	move.l 148(sp),d0
    2b0a:	2200           	move.l d0,d1
    2b0c:	5481           	addq.l #2,d1
    2b0e:	2f41 0094      	move.l d1,148(sp)
    2b12:	2040           	movea.l d0,a0
    2b14:	30bc aaaa      	move.w #-21846,(a0)
    *tmp = 0;
    2b18:	206f 0094      	movea.l 148(sp),a0
    2b1c:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    2b1e:	702a           	moveq #42,d0
    2b20:	d1af 0094      	add.l d0,148(sp)
    *tmp++ = 0;
    2b24:	202f 0094      	move.l 148(sp),d0
    2b28:	2200           	move.l d0,d1
    2b2a:	5481           	addq.l #2,d1
    2b2c:	2f41 0094      	move.l d1,148(sp)
    2b30:	2040           	movea.l d0,a0
    2b32:	4250           	clr.w (a0)
    *tmp++ = 0x5555;
    2b34:	202f 0094      	move.l 148(sp),d0
    2b38:	2200           	move.l d0,d1
    2b3a:	5481           	addq.l #2,d1
    2b3c:	2f41 0094      	move.l d1,148(sp)
    2b40:	2040           	movea.l d0,a0
    2b42:	30bc 5555      	move.w #21845,(a0)
    *tmp++ = 0x5555;
    2b46:	202f 0094      	move.l 148(sp),d0
    2b4a:	2200           	move.l d0,d1
    2b4c:	5481           	addq.l #2,d1
    2b4e:	2f41 0094      	move.l d1,148(sp)
    2b52:	2040           	movea.l d0,a0
    2b54:	30bc 5555      	move.w #21845,(a0)
    *tmp = 0;
    2b58:	206f 0094      	movea.l 148(sp),a0
    2b5c:	4250           	clr.w (a0)
    tmp += ZMLINESIZE/2-3;
    2b5e:	702a           	moveq #42,d0
    2b60:	d1af 0094      	add.l d0,148(sp)
  for( int i=0; i<8;i++) {
    2b64:	52af 0090      	addq.l #1,144(sp)
    2b68:	7207           	moveq #7,d1
    2b6a:	b2af 0090      	cmp.l 144(sp),d1
    2b6e:	6c00 ff74      	bge.w 2ae4 <TestCopyWord+0x10a>
  }
  tmp = destination;
    2b72:	2f6f 0058 0094 	move.l 88(sp),148(sp)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    2b78:	42af 008c      	clr.l 140(sp)
    2b7c:	6014           	bra.s 2b92 <TestCopyWord+0x1b8>
    *tmp++ = 0;
    2b7e:	202f 0094      	move.l 148(sp),d0
    2b82:	2200           	move.l d0,d1
    2b84:	5481           	addq.l #2,d1
    2b86:	2f41 0094      	move.l d1,148(sp)
    2b8a:	2040           	movea.l d0,a0
    2b8c:	4250           	clr.w (a0)
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    2b8e:	52af 008c      	addq.l #1,140(sp)
    2b92:	0caf 0000 02cf 	cmpi.l #719,140(sp)
    2b98:	008c 
    2b9a:	6fe2           	ble.s 2b7e <TestCopyWord+0x1a4>
  }

  WaitBlit();
    2b9c:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    2ba2:	2c40           	movea.l d0,a6
    2ba4:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
    2ba8:	4eba e866      	jsr 1410 <Zoom_Init>(pc)
  Init_Copy( 3);
    2bac:	4878 0003      	pea 3 <_start+0x3>
    2bb0:	4eba eea0      	jsr 1a52 <Init_Copy>(pc)
    2bb4:	588f           	addq.l #4,sp
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
    2bb6:	202f 007c      	move.l 124(sp),d0
    2bba:	5480           	addq.l #2,d0
    2bbc:	4878 0010      	pea 10 <main+0xa>
    2bc0:	2f2f 005c      	move.l 92(sp),-(sp)
    2bc4:	2f00           	move.l d0,-(sp)
    2bc6:	4eba e370      	jsr f38 <Zoom_CopyWord>(pc)
    2bca:	4fef 000c      	lea 12(sp),sp
  WaitBlit();
    2bce:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    2bd4:	2c40           	movea.l d0,a6
    2bd6:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
    2bda:	202f 0058      	move.l 88(sp),d0
    2bde:	5480           	addq.l #2,d0
    2be0:	2f40 0094      	move.l d0,148(sp)
  if( *tmp != 0x5555) 
    2be4:	206f 0094      	movea.l 148(sp),a0
    2be8:	3010           	move.w (a0),d0
    2bea:	0c40 5555      	cmpi.w #21845,d0
    2bee:	6742           	beq.s 2c32 <TestCopyWord+0x258>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
    2bf0:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2bf6:	2c40           	movea.l d0,a6
    2bf8:	4eae ffc4      	jsr -60(a6)
    2bfc:	2f40 0040      	move.l d0,64(sp)
    2c00:	202f 0040      	move.l 64(sp),d0
    2c04:	2f40 003c      	move.l d0,60(sp)
    2c08:	2f7c 0001 75c4 	move.l #95684,56(sp)
    2c0e:	0038 
    2c10:	721f           	moveq #31,d1
    2c12:	2f41 0034      	move.l d1,52(sp)
    2c16:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2c1c:	2c40           	movea.l d0,a6
    2c1e:	222f 003c      	move.l 60(sp),d1
    2c22:	242f 0038      	move.l 56(sp),d2
    2c26:	262f 0034      	move.l 52(sp),d3
    2c2a:	4eae ffd0      	jsr -48(a6)
    2c2e:	2f40 0030      	move.l d0,48(sp)
  tmp += ZMLINESIZE/2;
    2c32:	7030           	moveq #48,d0
    2c34:	d1af 0094      	add.l d0,148(sp)
  if( *tmp != 0xaaaa)
    2c38:	206f 0094      	movea.l 148(sp),a0
    2c3c:	3010           	move.w (a0),d0
    2c3e:	0c40 aaaa      	cmpi.w #-21846,d0
    2c42:	6742           	beq.s 2c86 <TestCopyWord+0x2ac>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
    2c44:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2c4a:	2c40           	movea.l d0,a6
    2c4c:	4eae ffc4      	jsr -60(a6)
    2c50:	2f40 002c      	move.l d0,44(sp)
    2c54:	202f 002c      	move.l 44(sp),d0
    2c58:	2f40 0028      	move.l d0,40(sp)
    2c5c:	2f7c 0001 75e4 	move.l #95716,36(sp)
    2c62:	0024 
    2c64:	7220           	moveq #32,d1
    2c66:	2f41 0020      	move.l d1,32(sp)
    2c6a:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2c70:	2c40           	movea.l d0,a6
    2c72:	222f 0028      	move.l 40(sp),d1
    2c76:	242f 0024      	move.l 36(sp),d2
    2c7a:	262f 0020      	move.l 32(sp),d3
    2c7e:	4eae ffd0      	jsr -48(a6)
    2c82:	2f40 001c      	move.l d0,28(sp)
  
  FreeMem( source,ZMLINESIZE*30);
    2c86:	2f6f 007c 0018 	move.l 124(sp),24(sp)
    2c8c:	2f7c 0000 05a0 	move.l #1440,20(sp)
    2c92:	0014 
    2c94:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2c9a:	2c40           	movea.l d0,a6
    2c9c:	226f 0018      	movea.l 24(sp),a1
    2ca0:	202f 0014      	move.l 20(sp),d0
    2ca4:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
    2ca8:	2f6f 0058 0010 	move.l 88(sp),16(sp)
    2cae:	2f7c 0000 05a0 	move.l #1440,12(sp)
    2cb4:	000c 
    2cb6:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2cbc:	2c40           	movea.l d0,a6
    2cbe:	226f 0010      	movea.l 16(sp),a1
    2cc2:	202f 000c      	move.l 12(sp),d0
    2cc6:	4eae ff2e      	jsr -210(a6)
}
    2cca:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2cce:	4fef 008c      	lea 140(sp),sp
    2cd2:	4e75           	rts

00002cd4 <TestZoom4PictureOn5Planes>:
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */


void TestZoom4PictureOn5Planes() {
    2cd4:	4fef ff74      	lea -140(sp),sp
    2cd8:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    2cdc:	2f7c 0001 1440 	move.l #70720,102(sp)
    2ce2:	0066 
    2ce4:	7002           	moveq #2,d0
    2ce6:	2f40 0062      	move.l d0,98(sp)
    2cea:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2cf0:	2c40           	movea.l d0,a6
    2cf2:	202f 0066      	move.l 102(sp),d0
    2cf6:	222f 0062      	move.l 98(sp),d1
    2cfa:	4eae ff3a      	jsr -198(a6)
    2cfe:	2f40 005e      	move.l d0,94(sp)
    2d02:	202f 005e      	move.l 94(sp),d0
    2d06:	2f40 005a      	move.l d0,90(sp)
  if( source == 0) {
    2d0a:	4aaf 005a      	tst.l 90(sp)
    2d0e:	6646           	bne.s 2d56 <TestZoom4PictureOn5Planes+0x82>
    Write(  Output(), 
    2d10:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2d16:	2c40           	movea.l d0,a6
    2d18:	4eae ffc4      	jsr -60(a6)
    2d1c:	2f40 0056      	move.l d0,86(sp)
    2d20:	202f 0056      	move.l 86(sp),d0
    2d24:	2f40 0052      	move.l d0,82(sp)
    2d28:	2f7c 0001 7605 	move.l #95749,78(sp)
    2d2e:	004e 
    2d30:	7239           	moveq #57,d1
    2d32:	2f41 004a      	move.l d1,74(sp)
    2d36:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2d3c:	2c40           	movea.l d0,a6
    2d3e:	222f 0052      	move.l 82(sp),d1
    2d42:	242f 004e      	move.l 78(sp),d2
    2d46:	262f 004a      	move.l 74(sp),d3
    2d4a:	4eae ffd0      	jsr -48(a6)
    2d4e:	2f40 0046      	move.l d0,70(sp)
    2d52:	6000 026a      	bra.w 2fbe <TestZoom4PictureOn5Planes+0x2ea>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272*5, MEMF_CHIP);
    2d56:	2f7c 0001 1440 	move.l #70720,66(sp)
    2d5c:	0042 
    2d5e:	7002           	moveq #2,d0
    2d60:	2f40 003e      	move.l d0,62(sp)
    2d64:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2d6a:	2c40           	movea.l d0,a6
    2d6c:	202f 0042      	move.l 66(sp),d0
    2d70:	222f 003e      	move.l 62(sp),d1
    2d74:	4eae ff3a      	jsr -198(a6)
    2d78:	2f40 003a      	move.l d0,58(sp)
    2d7c:	202f 003a      	move.l 58(sp),d0
    2d80:	2f40 0036      	move.l d0,54(sp)
  if( destination == 0) {
    2d84:	4aaf 0036      	tst.l 54(sp)
    2d88:	6646           	bne.s 2dd0 <TestZoom4PictureOn5Planes+0xfc>
    Write(  Output(), 
    2d8a:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2d90:	2c40           	movea.l d0,a6
    2d92:	4eae ffc4      	jsr -60(a6)
    2d96:	2f40 0032      	move.l d0,50(sp)
    2d9a:	202f 0032      	move.l 50(sp),d0
    2d9e:	2f40 002e      	move.l d0,46(sp)
    2da2:	2f7c 0001 763f 	move.l #95807,42(sp)
    2da8:	002a 
    2daa:	723d           	moveq #61,d1
    2dac:	2f41 0026      	move.l d1,38(sp)
    2db0:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    2db6:	2c40           	movea.l d0,a6
    2db8:	222f 002e      	move.l 46(sp),d1
    2dbc:	242f 002a      	move.l 42(sp),d2
    2dc0:	262f 0026      	move.l 38(sp),d3
    2dc4:	4eae ffd0      	jsr -48(a6)
    2dc8:	2f40 0022      	move.l d0,34(sp)
    2dcc:	6000 01f0      	bra.w 2fbe <TestZoom4PictureOn5Planes+0x2ea>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    2dd0:	2f6f 005a 0094 	move.l 90(sp),148(sp)
  for(int i=0;i<128+8;i++) {
    2dd6:	42af 0090      	clr.l 144(sp)
    2dda:	6050           	bra.s 2e2c <TestZoom4PictureOn5Planes+0x158>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    2ddc:	42af 008c      	clr.l 140(sp)
    2de0:	6018           	bra.s 2dfa <TestZoom4PictureOn5Planes+0x126>
      *tmp4source++ = 0x55555555;
    2de2:	202f 0094      	move.l 148(sp),d0
    2de6:	2200           	move.l d0,d1
    2de8:	5881           	addq.l #4,d1
    2dea:	2f41 0094      	move.l d1,148(sp)
    2dee:	2040           	movea.l d0,a0
    2df0:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    2df6:	52af 008c      	addq.l #1,140(sp)
    2dfa:	703b           	moveq #59,d0
    2dfc:	b0af 008c      	cmp.l 140(sp),d0
    2e00:	6ce0           	bge.s 2de2 <TestZoom4PictureOn5Planes+0x10e>
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    2e02:	42af 0088      	clr.l 136(sp)
    2e06:	6018           	bra.s 2e20 <TestZoom4PictureOn5Planes+0x14c>
      *tmp4source++ = 0xaaaaaaaa;
    2e08:	202f 0094      	move.l 148(sp),d0
    2e0c:	2200           	move.l d0,d1
    2e0e:	5881           	addq.l #4,d1
    2e10:	2f41 0094      	move.l d1,148(sp)
    2e14:	2040           	movea.l d0,a0
    2e16:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
    2e1c:	52af 0088      	addq.l #1,136(sp)
    2e20:	703b           	moveq #59,d0
    2e22:	b0af 0088      	cmp.l 136(sp),d0
    2e26:	6ce0           	bge.s 2e08 <TestZoom4PictureOn5Planes+0x134>
  for(int i=0;i<128+8;i++) {
    2e28:	52af 0090      	addq.l #1,144(sp)
    2e2c:	0caf 0000 0087 	cmpi.l #135,144(sp)
    2e32:	0090 
    2e34:	6fa6           	ble.s 2ddc <TestZoom4PictureOn5Planes+0x108>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 5);
    2e36:	4878 0005      	pea 5 <_start+0x5>
    2e3a:	42a7           	clr.l -(sp)
    2e3c:	2f2f 003e      	move.l 62(sp),-(sp)
    2e40:	2f2f 0066      	move.l 102(sp),-(sp)
    2e44:	4eba ec46      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    2e48:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    2e4c:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    2e52:	2c40           	movea.l d0,a6
    2e54:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    2e58:	222f 0036      	move.l 54(sp),d1
    2e5c:	5881           	addq.l #4,d1
    2e5e:	2f41 0084      	move.l d1,132(sp)
  UWORD *valsupposed = destlinezoom1;
    2e62:	2f7c 0001 93a4 	move.l #103332,30(sp)
    2e68:	001e 
  UWORD mask = 0xffff;
    2e6a:	3f7c ffff 0082 	move.w #-1,130(sp)
  for(int i=0;i<14;i++) {
    2e70:	42af 007e      	clr.l 126(sp)
    2e74:	6000 00a8      	bra.w 2f1e <TestZoom4PictureOn5Planes+0x24a>
    for(int i2=0;i2<18;i2++) { 
    2e78:	42af 007a      	clr.l 122(sp)
    2e7c:	604e           	bra.s 2ecc <TestZoom4PictureOn5Planes+0x1f8>
      for( int i3=0;i3<5;i3++) {
    2e7e:	42af 0076      	clr.l 118(sp)
    2e82:	6038           	bra.s 2ebc <TestZoom4PictureOn5Planes+0x1e8>
        TestRow( valsupposed, valactual, mask, i2+i*19);
    2e84:	222f 007e      	move.l 126(sp),d1
    2e88:	2001           	move.l d1,d0
    2e8a:	e788           	lsl.l #3,d0
    2e8c:	d081           	add.l d1,d0
    2e8e:	d080           	add.l d0,d0
    2e90:	d081           	add.l d1,d0
    2e92:	2200           	move.l d0,d1
    2e94:	d2af 007a      	add.l 122(sp),d1
    2e98:	7000           	moveq #0,d0
    2e9a:	302f 0082      	move.w 130(sp),d0
    2e9e:	2f01           	move.l d1,-(sp)
    2ea0:	2f00           	move.l d0,-(sp)
    2ea2:	2f2f 008c      	move.l 140(sp),-(sp)
    2ea6:	2f2f 002a      	move.l 42(sp),-(sp)
    2eaa:	4eba 2f92      	jsr 5e3e <TestRow>(pc)
    2eae:	4fef 0010      	lea 16(sp),sp
        valactual += ZMLINESIZE/2;
    2eb2:	7030           	moveq #48,d0
    2eb4:	d1af 0084      	add.l d0,132(sp)
      for( int i3=0;i3<5;i3++) {
    2eb8:	52af 0076      	addq.l #1,118(sp)
    2ebc:	7204           	moveq #4,d1
    2ebe:	b2af 0076      	cmp.l 118(sp),d1
    2ec2:	6cc0           	bge.s 2e84 <TestZoom4PictureOn5Planes+0x1b0>
      }
      mask = mask ^ 0xffff;
    2ec4:	466f 0082      	not.w 130(sp)
    for(int i2=0;i2<18;i2++) { 
    2ec8:	52af 007a      	addq.l #1,122(sp)
    2ecc:	7011           	moveq #17,d0
    2ece:	b0af 007a      	cmp.l 122(sp),d0
    2ed2:	6caa           	bge.s 2e7e <TestZoom4PictureOn5Planes+0x1aa>
    }
    for( int i3=0;i3<5;i3++) {
    2ed4:	42af 0072      	clr.l 114(sp)
    2ed8:	6038           	bra.s 2f12 <TestZoom4PictureOn5Planes+0x23e>
      TestRow( valsupposed, valactual, mask, 18+i*19);
    2eda:	222f 007e      	move.l 126(sp),d1
    2ede:	2001           	move.l d1,d0
    2ee0:	e788           	lsl.l #3,d0
    2ee2:	d081           	add.l d1,d0
    2ee4:	d080           	add.l d0,d0
    2ee6:	2040           	movea.l d0,a0
    2ee8:	d1c1           	adda.l d1,a0
    2eea:	41e8 0012      	lea 18(a0),a0
    2eee:	7000           	moveq #0,d0
    2ef0:	302f 0082      	move.w 130(sp),d0
    2ef4:	2f08           	move.l a0,-(sp)
    2ef6:	2f00           	move.l d0,-(sp)
    2ef8:	2f2f 008c      	move.l 140(sp),-(sp)
    2efc:	2f2f 002a      	move.l 42(sp),-(sp)
    2f00:	4eba 2f3c      	jsr 5e3e <TestRow>(pc)
    2f04:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    2f08:	7230           	moveq #48,d1
    2f0a:	d3af 0084      	add.l d1,132(sp)
    for( int i3=0;i3<5;i3++) {
    2f0e:	52af 0072      	addq.l #1,114(sp)
    2f12:	7004           	moveq #4,d0
    2f14:	b0af 0072      	cmp.l 114(sp),d0
    2f18:	6cc0           	bge.s 2eda <TestZoom4PictureOn5Planes+0x206>
  for(int i=0;i<14;i++) {
    2f1a:	52af 007e      	addq.l #1,126(sp)
    2f1e:	720d           	moveq #13,d1
    2f20:	b2af 007e      	cmp.l 126(sp),d1
    2f24:	6c00 ff52      	bge.w 2e78 <TestZoom4PictureOn5Planes+0x1a4>
    }
  }
  for(int i2=0;i2<4;i2++) { 
    2f28:	42af 006e      	clr.l 110(sp)
    2f2c:	6044           	bra.s 2f72 <TestZoom4PictureOn5Planes+0x29e>
    for( int i3=0;i3<5;i3++) {
    2f2e:	42af 006a      	clr.l 106(sp)
    2f32:	602e           	bra.s 2f62 <TestZoom4PictureOn5Planes+0x28e>
      TestRow( valsupposed, valactual, mask, i2+265);
    2f34:	222f 006e      	move.l 110(sp),d1
    2f38:	0681 0000 0109 	addi.l #265,d1
    2f3e:	7000           	moveq #0,d0
    2f40:	302f 0082      	move.w 130(sp),d0
    2f44:	2f01           	move.l d1,-(sp)
    2f46:	2f00           	move.l d0,-(sp)
    2f48:	2f2f 008c      	move.l 140(sp),-(sp)
    2f4c:	2f2f 002a      	move.l 42(sp),-(sp)
    2f50:	4eba 2eec      	jsr 5e3e <TestRow>(pc)
    2f54:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    2f58:	7030           	moveq #48,d0
    2f5a:	d1af 0084      	add.l d0,132(sp)
    for( int i3=0;i3<5;i3++) {
    2f5e:	52af 006a      	addq.l #1,106(sp)
    2f62:	7204           	moveq #4,d1
    2f64:	b2af 006a      	cmp.l 106(sp),d1
    2f68:	6cca           	bge.s 2f34 <TestZoom4PictureOn5Planes+0x260>
    }
    mask = mask ^ 0xffff;
    2f6a:	466f 0082      	not.w 130(sp)
  for(int i2=0;i2<4;i2++) { 
    2f6e:	52af 006e      	addq.l #1,110(sp)
    2f72:	7003           	moveq #3,d0
    2f74:	b0af 006e      	cmp.l 110(sp),d0
    2f78:	6cb4           	bge.s 2f2e <TestZoom4PictureOn5Planes+0x25a>
  } 
  FreeMem( source, (ZMLINESIZE+4)*272*5);
    2f7a:	2f6f 005a 001a 	move.l 90(sp),26(sp)
    2f80:	2f7c 0001 1440 	move.l #70720,22(sp)
    2f86:	0016 
    2f88:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2f8e:	2c40           	movea.l d0,a6
    2f90:	226f 001a      	movea.l 26(sp),a1
    2f94:	202f 0016      	move.l 22(sp),d0
    2f98:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272*5);
    2f9c:	2f6f 0036 0012 	move.l 54(sp),18(sp)
    2fa2:	2f7c 0001 1440 	move.l #70720,14(sp)
    2fa8:	000e 
    2faa:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2fb0:	2c40           	movea.l d0,a6
    2fb2:	226f 0012      	movea.l 18(sp),a1
    2fb6:	202f 000e      	move.l 14(sp),d0
    2fba:	4eae ff2e      	jsr -210(a6)
}
    2fbe:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    2fc2:	4fef 008c      	lea 140(sp),sp
    2fc6:	4e75           	rts

00002fc8 <TestZoom4Picture>:

void TestZoom4Picture() {
    2fc8:	4fef fe30      	lea -464(sp),sp
    2fcc:	48e7 3002      	movem.l d2-d3/a6,-(sp)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    2fd0:	2f7c 0000 3740 	move.l #14144,106(sp)
    2fd6:	006a 
    2fd8:	7002           	moveq #2,d0
    2fda:	2f40 0066      	move.l d0,102(sp)
    2fde:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    2fe4:	2c40           	movea.l d0,a6
    2fe6:	202f 006a      	move.l 106(sp),d0
    2fea:	222f 0066      	move.l 102(sp),d1
    2fee:	4eae ff3a      	jsr -198(a6)
    2ff2:	2f40 0062      	move.l d0,98(sp)
    2ff6:	202f 0062      	move.l 98(sp),d0
    2ffa:	2f40 005e      	move.l d0,94(sp)
  if( source == 0) {
    2ffe:	4aaf 005e      	tst.l 94(sp)
    3002:	6646           	bne.s 304a <TestZoom4Picture+0x82>
    Write(  Output(), 
    3004:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    300a:	2c40           	movea.l d0,a6
    300c:	4eae ffc4      	jsr -60(a6)
    3010:	2f40 005a      	move.l d0,90(sp)
    3014:	202f 005a      	move.l 90(sp),d0
    3018:	2f40 0056      	move.l d0,86(sp)
    301c:	2f7c 0001 7605 	move.l #95749,82(sp)
    3022:	0052 
    3024:	7239           	moveq #57,d1
    3026:	2f41 004e      	move.l d1,78(sp)
    302a:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    3030:	2c40           	movea.l d0,a6
    3032:	222f 0056      	move.l 86(sp),d1
    3036:	242f 0052      	move.l 82(sp),d2
    303a:	262f 004e      	move.l 78(sp),d3
    303e:	4eae ffd0      	jsr -48(a6)
    3042:	2f40 004a      	move.l d0,74(sp)
    3046:	6000 2dec      	bra.w 5e34 <TestZoom4Picture+0x2e6c>
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    304a:	2f7c 0000 3740 	move.l #14144,70(sp)
    3050:	0046 
    3052:	7402           	moveq #2,d2
    3054:	2f42 0042      	move.l d2,66(sp)
    3058:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    305e:	2c40           	movea.l d0,a6
    3060:	202f 0046      	move.l 70(sp),d0
    3064:	222f 0042      	move.l 66(sp),d1
    3068:	4eae ff3a      	jsr -198(a6)
    306c:	2f40 003e      	move.l d0,62(sp)
    3070:	202f 003e      	move.l 62(sp),d0
    3074:	2f40 003a      	move.l d0,58(sp)
  if( destination == 0) {
    3078:	4aaf 003a      	tst.l 58(sp)
    307c:	6646           	bne.s 30c4 <TestZoom4Picture+0xfc>
    Write(  Output(), 
    307e:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    3084:	2c40           	movea.l d0,a6
    3086:	4eae ffc4      	jsr -60(a6)
    308a:	2f40 0036      	move.l d0,54(sp)
    308e:	202f 0036      	move.l 54(sp),d0
    3092:	2f40 0032      	move.l d0,50(sp)
    3096:	2f7c 0001 763f 	move.l #95807,46(sp)
    309c:	002e 
    309e:	703d           	moveq #61,d0
    30a0:	2f40 002a      	move.l d0,42(sp)
    30a4:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    30aa:	2c40           	movea.l d0,a6
    30ac:	222f 0032      	move.l 50(sp),d1
    30b0:	242f 002e      	move.l 46(sp),d2
    30b4:	262f 002a      	move.l 42(sp),d3
    30b8:	4eae ffd0      	jsr -48(a6)
    30bc:	2f40 0026      	move.l d0,38(sp)
    30c0:	6000 2d72      	bra.w 5e34 <TestZoom4Picture+0x2e6c>
          "TestZoom4Picture: Memory for Destination cannot be allocated.\n",61);
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
    30c4:	2f6f 005e 01d8 	move.l 94(sp),472(sp)
  for(int i=0;i<128+8;i++) {
    30ca:	42af 01d4      	clr.l 468(sp)
    30ce:	6050           	bra.s 3120 <TestZoom4Picture+0x158>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    30d0:	42af 01d0      	clr.l 464(sp)
    30d4:	6018           	bra.s 30ee <TestZoom4Picture+0x126>
      *tmp4source++ = 0x55555555;
    30d6:	202f 01d8      	move.l 472(sp),d0
    30da:	2200           	move.l d0,d1
    30dc:	5881           	addq.l #4,d1
    30de:	2f41 01d8      	move.l d1,472(sp)
    30e2:	2040           	movea.l d0,a0
    30e4:	20bc 5555 5555 	move.l #1431655765,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    30ea:	52af 01d0      	addq.l #1,464(sp)
    30ee:	700b           	moveq #11,d0
    30f0:	b0af 01d0      	cmp.l 464(sp),d0
    30f4:	6ce0           	bge.s 30d6 <TestZoom4Picture+0x10e>
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    30f6:	42af 01cc      	clr.l 460(sp)
    30fa:	6018           	bra.s 3114 <TestZoom4Picture+0x14c>
      *tmp4source++ = 0xaaaaaaaa;
    30fc:	202f 01d8      	move.l 472(sp),d0
    3100:	2200           	move.l d0,d1
    3102:	5881           	addq.l #4,d1
    3104:	2f41 01d8      	move.l d1,472(sp)
    3108:	2040           	movea.l d0,a0
    310a:	20bc aaaa aaaa 	move.l #-1431655766,(a0)
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
    3110:	52af 01cc      	addq.l #1,460(sp)
    3114:	700b           	moveq #11,d0
    3116:	b0af 01cc      	cmp.l 460(sp),d0
    311a:	6ce0           	bge.s 30fc <TestZoom4Picture+0x134>
  for(int i=0;i<128+8;i++) {
    311c:	52af 01d4      	addq.l #1,468(sp)
    3120:	0caf 0000 0087 	cmpi.l #135,468(sp)
    3126:	01d4 
    3128:	6fa6           	ble.s 30d0 <TestZoom4Picture+0x108>
  }

  Zoom_ZoomIntoPicture( source, destination, 0, 1);
    312a:	4878 0001      	pea 1 <_start+0x1>
    312e:	42a7           	clr.l -(sp)
    3130:	2f2f 0042      	move.l 66(sp),-(sp)
    3134:	2f2f 006a      	move.l 106(sp),-(sp)
    3138:	4eba e952      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    313c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3140:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    3146:	2c40           	movea.l d0,a6
    3148:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
    314c:	222f 003a      	move.l 58(sp),d1
    3150:	5881           	addq.l #4,d1
    3152:	2f41 01c8      	move.l d1,456(sp)
  UWORD *valsupposed = destlinezoom1;
    3156:	2f7c 0001 93a4 	move.l #103332,34(sp)
    315c:	0022 
  UWORD mask = 0xffff;
    315e:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<14;i++) {
    3164:	42af 01c2      	clr.l 450(sp)
    3168:	6000 0084      	bra.w 31ee <TestZoom4Picture+0x226>
    for(int i2=0;i2<18;i2++) { 
    316c:	42af 01be      	clr.l 446(sp)
    3170:	603c           	bra.s 31ae <TestZoom4Picture+0x1e6>
      TestRow( valsupposed, valactual, mask, i2+i*19);
    3172:	222f 01c2      	move.l 450(sp),d1
    3176:	2001           	move.l d1,d0
    3178:	e788           	lsl.l #3,d0
    317a:	d081           	add.l d1,d0
    317c:	d080           	add.l d0,d0
    317e:	d081           	add.l d1,d0
    3180:	2200           	move.l d0,d1
    3182:	d2af 01be      	add.l 446(sp),d1
    3186:	7000           	moveq #0,d0
    3188:	302f 01c6      	move.w 454(sp),d0
    318c:	2f01           	move.l d1,-(sp)
    318e:	2f00           	move.l d0,-(sp)
    3190:	2f2f 01d0      	move.l 464(sp),-(sp)
    3194:	2f2f 002e      	move.l 46(sp),-(sp)
    3198:	4eba 2ca4      	jsr 5e3e <TestRow>(pc)
    319c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    31a0:	7430           	moveq #48,d2
    31a2:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    31a6:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) { 
    31aa:	52af 01be      	addq.l #1,446(sp)
    31ae:	7011           	moveq #17,d0
    31b0:	b0af 01be      	cmp.l 446(sp),d0
    31b4:	6cbc           	bge.s 3172 <TestZoom4Picture+0x1aa>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
    31b6:	222f 01c2      	move.l 450(sp),d1
    31ba:	2001           	move.l d1,d0
    31bc:	e788           	lsl.l #3,d0
    31be:	d081           	add.l d1,d0
    31c0:	d080           	add.l d0,d0
    31c2:	2040           	movea.l d0,a0
    31c4:	d1c1           	adda.l d1,a0
    31c6:	41e8 0012      	lea 18(a0),a0
    31ca:	7000           	moveq #0,d0
    31cc:	302f 01c6      	move.w 454(sp),d0
    31d0:	2f08           	move.l a0,-(sp)
    31d2:	2f00           	move.l d0,-(sp)
    31d4:	2f2f 01d0      	move.l 464(sp),-(sp)
    31d8:	2f2f 002e      	move.l 46(sp),-(sp)
    31dc:	4eba 2c60      	jsr 5e3e <TestRow>(pc)
    31e0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    31e4:	7230           	moveq #48,d1
    31e6:	d3af 01c8      	add.l d1,456(sp)
  for(int i=0;i<14;i++) {
    31ea:	52af 01c2      	addq.l #1,450(sp)
    31ee:	740d           	moveq #13,d2
    31f0:	b4af 01c2      	cmp.l 450(sp),d2
    31f4:	6c00 ff76      	bge.w 316c <TestZoom4Picture+0x1a4>
  }

  for(int i2=0;i2<4;i2++) { 
    31f8:	42af 01ba      	clr.l 442(sp)
    31fc:	6032           	bra.s 3230 <TestZoom4Picture+0x268>
    TestRow( valsupposed, valactual, mask, i2+265);
    31fe:	222f 01ba      	move.l 442(sp),d1
    3202:	0681 0000 0109 	addi.l #265,d1
    3208:	7000           	moveq #0,d0
    320a:	302f 01c6      	move.w 454(sp),d0
    320e:	2f01           	move.l d1,-(sp)
    3210:	2f00           	move.l d0,-(sp)
    3212:	2f2f 01d0      	move.l 464(sp),-(sp)
    3216:	2f2f 002e      	move.l 46(sp),-(sp)
    321a:	4eba 2c22      	jsr 5e3e <TestRow>(pc)
    321e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3222:	7030           	moveq #48,d0
    3224:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3228:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    322c:	52af 01ba      	addq.l #1,442(sp)
    3230:	7203           	moveq #3,d1
    3232:	b2af 01ba      	cmp.l 442(sp),d1
    3236:	6cc6           	bge.s 31fe <TestZoom4Picture+0x236>
  }
  
  UWORD *tmp = source;
    3238:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    323e:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    3244:	2f6f 001e 003a 	move.l 30(sp),58(sp)
  
  Zoom_ZoomIntoPicture( source, destination, 1, 1);
    324a:	4878 0001      	pea 1 <_start+0x1>
    324e:	4878 0001      	pea 1 <_start+0x1>
    3252:	2f2f 0042      	move.l 66(sp),-(sp)
    3256:	2f2f 006a      	move.l 106(sp),-(sp)
    325a:	4eba e830      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    325e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3262:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    3268:	2c40           	movea.l d0,a6
    326a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    326e:	242f 003a      	move.l 58(sp),d2
    3272:	5882           	addq.l #4,d2
    3274:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom2;
    3278:	2f7c 0001 93d0 	move.l #103376,34(sp)
    327e:	0022 
  mask = 0x0000;
    3280:	426f 01c6      	clr.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    3284:	42af 01b6      	clr.l 438(sp)
    3288:	602a           	bra.s 32b4 <TestZoom4Picture+0x2ec>
    TestRow( valsupposed, valactual, mask, i2);
    328a:	7000           	moveq #0,d0
    328c:	302f 01c6      	move.w 454(sp),d0
    3290:	2f2f 01b6      	move.l 438(sp),-(sp)
    3294:	2f00           	move.l d0,-(sp)
    3296:	2f2f 01d0      	move.l 464(sp),-(sp)
    329a:	2f2f 002e      	move.l 46(sp),-(sp)
    329e:	4eba 2b9e      	jsr 5e3e <TestRow>(pc)
    32a2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    32a6:	7030           	moveq #48,d0
    32a8:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    32ac:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) { 
    32b0:	52af 01b6      	addq.l #1,438(sp)
    32b4:	720a           	moveq #10,d1
    32b6:	b2af 01b6      	cmp.l 438(sp),d1
    32ba:	6cce           	bge.s 328a <TestZoom4Picture+0x2c2>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    32bc:	4878 0008      	pea 8 <main+0x2>
    32c0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    32c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    32ca:	2f2f 002e      	move.l 46(sp),-(sp)
    32ce:	4eba 2b6e      	jsr 5e3e <TestRow>(pc)
    32d2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    32d6:	7430           	moveq #48,d2
    32d8:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 9);
    32dc:	4878 0009      	pea 9 <main+0x3>
    32e0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    32e6:	2f2f 01d0      	move.l 464(sp),-(sp)
    32ea:	2f2f 002e      	move.l 46(sp),-(sp)
    32ee:	4eba 2b4e      	jsr 5e3e <TestRow>(pc)
    32f2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    32f6:	7030           	moveq #48,d0
    32f8:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 10);
    32fc:	4878 000a      	pea a <main+0x4>
    3300:	42a7           	clr.l -(sp)
    3302:	2f2f 01d0      	move.l 464(sp),-(sp)
    3306:	2f2f 002e      	move.l 46(sp),-(sp)
    330a:	4eba 2b32      	jsr 5e3e <TestRow>(pc)
    330e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3312:	7230           	moveq #48,d1
    3314:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 11);
    3318:	4878 000b      	pea b <main+0x5>
    331c:	42a7           	clr.l -(sp)
    331e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3322:	2f2f 002e      	move.l 46(sp),-(sp)
    3326:	4eba 2b16      	jsr 5e3e <TestRow>(pc)
    332a:	4fef 0010      	lea 16(sp),sp

  valactual += ZMLINESIZE/2;
    332e:	7430           	moveq #48,d2
    3330:	d5af 01c8      	add.l d2,456(sp)
  for(int i=0;i<12;i++) {
    3334:	42af 01b2      	clr.l 434(sp)
    3338:	6000 0118      	bra.w 3452 <TestZoom4Picture+0x48a>
    for(int i2=0;i2<16;i2++) {  
    333c:	42af 01ae      	clr.l 430(sp)
    3340:	603c           	bra.s 337e <TestZoom4Picture+0x3b6>
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    3342:	222f 01b2      	move.l 434(sp),d1
    3346:	2001           	move.l d1,d0
    3348:	e988           	lsl.l #4,d0
    334a:	d081           	add.l d1,d0
    334c:	2040           	movea.l d0,a0
    334e:	d1ef 01ae      	adda.l 430(sp),a0
    3352:	41e8 000b      	lea 11(a0),a0
    3356:	7000           	moveq #0,d0
    3358:	302f 01c6      	move.w 454(sp),d0
    335c:	2f08           	move.l a0,-(sp)
    335e:	2f00           	move.l d0,-(sp)
    3360:	2f2f 01d0      	move.l 464(sp),-(sp)
    3364:	2f2f 002e      	move.l 46(sp),-(sp)
    3368:	4eba 2ad4      	jsr 5e3e <TestRow>(pc)
    336c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3370:	7030           	moveq #48,d0
    3372:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3376:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {  
    337a:	52af 01ae      	addq.l #1,430(sp)
    337e:	720f           	moveq #15,d1
    3380:	b2af 01ae      	cmp.l 430(sp),d1
    3384:	6cbc           	bge.s 3342 <TestZoom4Picture+0x37a>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    3386:	222f 01b2      	move.l 434(sp),d1
    338a:	2001           	move.l d1,d0
    338c:	e988           	lsl.l #4,d0
    338e:	2040           	movea.l d0,a0
    3390:	d1c1           	adda.l d1,a0
    3392:	41e8 0018      	lea 24(a0),a0
    3396:	7000           	moveq #0,d0
    3398:	302f 01c6      	move.w 454(sp),d0
    339c:	2f08           	move.l a0,-(sp)
    339e:	2f00           	move.l d0,-(sp)
    33a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    33a4:	2f2f 002e      	move.l 46(sp),-(sp)
    33a8:	4eba 2a94      	jsr 5e3e <TestRow>(pc)
    33ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    33b0:	7430           	moveq #48,d2
    33b2:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    33b6:	222f 01b2      	move.l 434(sp),d1
    33ba:	2001           	move.l d1,d0
    33bc:	e988           	lsl.l #4,d0
    33be:	2040           	movea.l d0,a0
    33c0:	d1c1           	adda.l d1,a0
    33c2:	41e8 0019      	lea 25(a0),a0
    33c6:	7000           	moveq #0,d0
    33c8:	302f 01c6      	move.w 454(sp),d0
    33cc:	2f08           	move.l a0,-(sp)
    33ce:	2f00           	move.l d0,-(sp)
    33d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    33d4:	2f2f 002e      	move.l 46(sp),-(sp)
    33d8:	4eba 2a64      	jsr 5e3e <TestRow>(pc)
    33dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    33e0:	7030           	moveq #48,d0
    33e2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    33e6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    33ea:	222f 01b2      	move.l 434(sp),d1
    33ee:	2001           	move.l d1,d0
    33f0:	e988           	lsl.l #4,d0
    33f2:	2040           	movea.l d0,a0
    33f4:	d1c1           	adda.l d1,a0
    33f6:	41e8 001a      	lea 26(a0),a0
    33fa:	7000           	moveq #0,d0
    33fc:	302f 01c6      	move.w 454(sp),d0
    3400:	2f08           	move.l a0,-(sp)
    3402:	2f00           	move.l d0,-(sp)
    3404:	2f2f 01d0      	move.l 464(sp),-(sp)
    3408:	2f2f 002e      	move.l 46(sp),-(sp)
    340c:	4eba 2a30      	jsr 5e3e <TestRow>(pc)
    3410:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3414:	7230           	moveq #48,d1
    3416:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    341a:	222f 01b2      	move.l 434(sp),d1
    341e:	2001           	move.l d1,d0
    3420:	e988           	lsl.l #4,d0
    3422:	2040           	movea.l d0,a0
    3424:	d1c1           	adda.l d1,a0
    3426:	41e8 001b      	lea 27(a0),a0
    342a:	7000           	moveq #0,d0
    342c:	302f 01c6      	move.w 454(sp),d0
    3430:	2f08           	move.l a0,-(sp)
    3432:	2f00           	move.l d0,-(sp)
    3434:	2f2f 01d0      	move.l 464(sp),-(sp)
    3438:	2f2f 002e      	move.l 46(sp),-(sp)
    343c:	4eba 2a00      	jsr 5e3e <TestRow>(pc)
    3440:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3444:	7430           	moveq #48,d2
    3446:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    344a:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    344e:	52af 01b2      	addq.l #1,434(sp)
    3452:	700b           	moveq #11,d0
    3454:	b0af 01b2      	cmp.l 434(sp),d0
    3458:	6c00 fee2      	bge.w 333c <TestZoom4Picture+0x374>
    
  }

  for(int i2=0;i2<15;i2++) { 
    345c:	42af 01aa      	clr.l 426(sp)
    3460:	602a           	bra.s 348c <TestZoom4Picture+0x4c4>
    TestRow( valsupposed, valactual, mask, i2);
    3462:	7000           	moveq #0,d0
    3464:	302f 01c6      	move.w 454(sp),d0
    3468:	2f2f 01aa      	move.l 426(sp),-(sp)
    346c:	2f00           	move.l d0,-(sp)
    346e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3472:	2f2f 002e      	move.l 46(sp),-(sp)
    3476:	4eba 29c6      	jsr 5e3e <TestRow>(pc)
    347a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    347e:	7230           	moveq #48,d1
    3480:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3484:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<15;i2++) { 
    3488:	52af 01aa      	addq.l #1,426(sp)
    348c:	740e           	moveq #14,d2
    348e:	b4af 01aa      	cmp.l 426(sp),d2
    3492:	6cce           	bge.s 3462 <TestZoom4Picture+0x49a>
  }

  tmp = source;
    3494:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    349a:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    34a0:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 2, 1);
    34a6:	4878 0001      	pea 1 <_start+0x1>
    34aa:	4878 0002      	pea 2 <_start+0x2>
    34ae:	2f2f 0042      	move.l 66(sp),-(sp)
    34b2:	2f2f 006a      	move.l 106(sp),-(sp)
    34b6:	4eba e5d4      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    34ba:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    34be:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    34c4:	2c40           	movea.l d0,a6
    34c6:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    34ca:	202f 003a      	move.l 58(sp),d0
    34ce:	5880           	addq.l #4,d0
    34d0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom3;
    34d4:	2f7c 0001 93fc 	move.l #103420,34(sp)
    34da:	0022 
  mask = 0xffff;
    34dc:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<4;i2++) { 
    34e2:	42af 01a6      	clr.l 422(sp)
    34e6:	602a           	bra.s 3512 <TestZoom4Picture+0x54a>
    TestRow( valsupposed, valactual, mask, i2);
    34e8:	7000           	moveq #0,d0
    34ea:	302f 01c6      	move.w 454(sp),d0
    34ee:	2f2f 01a6      	move.l 422(sp),-(sp)
    34f2:	2f00           	move.l d0,-(sp)
    34f4:	2f2f 01d0      	move.l 464(sp),-(sp)
    34f8:	2f2f 002e      	move.l 46(sp),-(sp)
    34fc:	4eba 2940      	jsr 5e3e <TestRow>(pc)
    3500:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3504:	7230           	moveq #48,d1
    3506:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    350a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) { 
    350e:	52af 01a6      	addq.l #1,422(sp)
    3512:	7403           	moveq #3,d2
    3514:	b4af 01a6      	cmp.l 422(sp),d2
    3518:	6cce           	bge.s 34e8 <TestZoom4Picture+0x520>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    351a:	4878 0004      	pea 4 <_start+0x4>
    351e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3524:	2f2f 01d0      	move.l 464(sp),-(sp)
    3528:	2f2f 002e      	move.l 46(sp),-(sp)
    352c:	4eba 2910      	jsr 5e3e <TestRow>(pc)
    3530:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3534:	7030           	moveq #48,d0
    3536:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    353a:	4878 0005      	pea 5 <_start+0x5>
    353e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3544:	2f2f 01d0      	move.l 464(sp),-(sp)
    3548:	2f2f 002e      	move.l 46(sp),-(sp)
    354c:	4eba 28f0      	jsr 5e3e <TestRow>(pc)
    3550:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3554:	7230           	moveq #48,d1
    3556:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    355a:	4878 0006      	pea 6 <main>
    355e:	42a7           	clr.l -(sp)
    3560:	2f2f 01d0      	move.l 464(sp),-(sp)
    3564:	2f2f 002e      	move.l 46(sp),-(sp)
    3568:	4eba 28d4      	jsr 5e3e <TestRow>(pc)
    356c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3570:	7430           	moveq #48,d2
    3572:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    3576:	4878 0007      	pea 7 <main+0x1>
    357a:	42a7           	clr.l -(sp)
    357c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3580:	2f2f 002e      	move.l 46(sp),-(sp)
    3584:	4eba 28b8      	jsr 5e3e <TestRow>(pc)
    3588:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    358c:	7030           	moveq #48,d0
    358e:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    3592:	4878 0008      	pea 8 <main+0x2>
    3596:	2f3c 0000 ffff 	move.l #65535,-(sp)
    359c:	2f2f 01d0      	move.l 464(sp),-(sp)
    35a0:	2f2f 002e      	move.l 46(sp),-(sp)
    35a4:	4eba 2898      	jsr 5e3e <TestRow>(pc)
    35a8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    35ac:	7230           	moveq #48,d1
    35ae:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    35b2:	4878 0009      	pea 9 <main+0x3>
    35b6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    35bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    35c0:	2f2f 002e      	move.l 46(sp),-(sp)
    35c4:	4eba 2878      	jsr 5e3e <TestRow>(pc)
    35c8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    35cc:	7430           	moveq #48,d2
    35ce:	d5af 01c8      	add.l d2,456(sp)

  mask = 0x0000;
    35d2:	426f 01c6      	clr.w 454(sp)
  for(int i=0;i<12;i++) {
    35d6:	42af 01a2      	clr.l 418(sp)
    35da:	6000 01aa      	bra.w 3786 <TestZoom4Picture+0x7be>
    for(int i2=0;i2<15;i2++) {  
    35de:	42af 019e      	clr.l 414(sp)
    35e2:	6046           	bra.s 362a <TestZoom4Picture+0x662>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    35e4:	222f 01a2      	move.l 418(sp),d1
    35e8:	2001           	move.l d1,d0
    35ea:	d080           	add.l d0,d0
    35ec:	d081           	add.l d1,d0
    35ee:	2200           	move.l d0,d1
    35f0:	e789           	lsl.l #3,d1
    35f2:	2401           	move.l d1,d2
    35f4:	9480           	sub.l d0,d2
    35f6:	2002           	move.l d2,d0
    35f8:	2040           	movea.l d0,a0
    35fa:	d1ef 019e      	adda.l 414(sp),a0
    35fe:	41e8 0009      	lea 9(a0),a0
    3602:	7000           	moveq #0,d0
    3604:	302f 01c6      	move.w 454(sp),d0
    3608:	2f08           	move.l a0,-(sp)
    360a:	2f00           	move.l d0,-(sp)
    360c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3610:	2f2f 002e      	move.l 46(sp),-(sp)
    3614:	4eba 2828      	jsr 5e3e <TestRow>(pc)
    3618:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    361c:	7030           	moveq #48,d0
    361e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3622:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {  
    3626:	52af 019e      	addq.l #1,414(sp)
    362a:	720e           	moveq #14,d1
    362c:	b2af 019e      	cmp.l 414(sp),d1
    3630:	6cb2           	bge.s 35e4 <TestZoom4Picture+0x61c>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    3632:	222f 01a2      	move.l 418(sp),d1
    3636:	2001           	move.l d1,d0
    3638:	d080           	add.l d0,d0
    363a:	d081           	add.l d1,d0
    363c:	2200           	move.l d0,d1
    363e:	e789           	lsl.l #3,d1
    3640:	2041           	movea.l d1,a0
    3642:	91c0           	suba.l d0,a0
    3644:	41e8 0018      	lea 24(a0),a0
    3648:	7000           	moveq #0,d0
    364a:	302f 01c6      	move.w 454(sp),d0
    364e:	2f08           	move.l a0,-(sp)
    3650:	2f00           	move.l d0,-(sp)
    3652:	2f2f 01d0      	move.l 464(sp),-(sp)
    3656:	2f2f 002e      	move.l 46(sp),-(sp)
    365a:	4eba 27e2      	jsr 5e3e <TestRow>(pc)
    365e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3662:	7430           	moveq #48,d2
    3664:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    3668:	222f 01a2      	move.l 418(sp),d1
    366c:	2001           	move.l d1,d0
    366e:	d080           	add.l d0,d0
    3670:	d081           	add.l d1,d0
    3672:	2200           	move.l d0,d1
    3674:	e789           	lsl.l #3,d1
    3676:	2041           	movea.l d1,a0
    3678:	91c0           	suba.l d0,a0
    367a:	41e8 0019      	lea 25(a0),a0
    367e:	7000           	moveq #0,d0
    3680:	302f 01c6      	move.w 454(sp),d0
    3684:	2f08           	move.l a0,-(sp)
    3686:	2f00           	move.l d0,-(sp)
    3688:	2f2f 01d0      	move.l 464(sp),-(sp)
    368c:	2f2f 002e      	move.l 46(sp),-(sp)
    3690:	4eba 27ac      	jsr 5e3e <TestRow>(pc)
    3694:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3698:	7030           	moveq #48,d0
    369a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    369e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    36a2:	222f 01a2      	move.l 418(sp),d1
    36a6:	2001           	move.l d1,d0
    36a8:	d080           	add.l d0,d0
    36aa:	d081           	add.l d1,d0
    36ac:	2200           	move.l d0,d1
    36ae:	e789           	lsl.l #3,d1
    36b0:	2041           	movea.l d1,a0
    36b2:	91c0           	suba.l d0,a0
    36b4:	41e8 001a      	lea 26(a0),a0
    36b8:	7000           	moveq #0,d0
    36ba:	302f 01c6      	move.w 454(sp),d0
    36be:	2f08           	move.l a0,-(sp)
    36c0:	2f00           	move.l d0,-(sp)
    36c2:	2f2f 01d0      	move.l 464(sp),-(sp)
    36c6:	2f2f 002e      	move.l 46(sp),-(sp)
    36ca:	4eba 2772      	jsr 5e3e <TestRow>(pc)
    36ce:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    36d2:	7230           	moveq #48,d1
    36d4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    36d8:	222f 01a2      	move.l 418(sp),d1
    36dc:	2001           	move.l d1,d0
    36de:	d080           	add.l d0,d0
    36e0:	d081           	add.l d1,d0
    36e2:	2200           	move.l d0,d1
    36e4:	e789           	lsl.l #3,d1
    36e6:	2041           	movea.l d1,a0
    36e8:	91c0           	suba.l d0,a0
    36ea:	41e8 001b      	lea 27(a0),a0
    36ee:	7000           	moveq #0,d0
    36f0:	302f 01c6      	move.w 454(sp),d0
    36f4:	2f08           	move.l a0,-(sp)
    36f6:	2f00           	move.l d0,-(sp)
    36f8:	2f2f 01d0      	move.l 464(sp),-(sp)
    36fc:	2f2f 002e      	move.l 46(sp),-(sp)
    3700:	4eba 273c      	jsr 5e3e <TestRow>(pc)
    3704:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3708:	7430           	moveq #48,d2
    370a:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    370e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    3712:	222f 01a2      	move.l 418(sp),d1
    3716:	2001           	move.l d1,d0
    3718:	d080           	add.l d0,d0
    371a:	d081           	add.l d1,d0
    371c:	2200           	move.l d0,d1
    371e:	e789           	lsl.l #3,d1
    3720:	2041           	movea.l d1,a0
    3722:	91c0           	suba.l d0,a0
    3724:	41e8 001c      	lea 28(a0),a0
    3728:	7000           	moveq #0,d0
    372a:	302f 01c6      	move.w 454(sp),d0
    372e:	2f08           	move.l a0,-(sp)
    3730:	2f00           	move.l d0,-(sp)
    3732:	2f2f 01d0      	move.l 464(sp),-(sp)
    3736:	2f2f 002e      	move.l 46(sp),-(sp)
    373a:	4eba 2702      	jsr 5e3e <TestRow>(pc)
    373e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3742:	7030           	moveq #48,d0
    3744:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    3748:	222f 01a2      	move.l 418(sp),d1
    374c:	2001           	move.l d1,d0
    374e:	d080           	add.l d0,d0
    3750:	d081           	add.l d1,d0
    3752:	2200           	move.l d0,d1
    3754:	e789           	lsl.l #3,d1
    3756:	2041           	movea.l d1,a0
    3758:	91c0           	suba.l d0,a0
    375a:	41e8 001d      	lea 29(a0),a0
    375e:	7000           	moveq #0,d0
    3760:	302f 01c6      	move.w 454(sp),d0
    3764:	2f08           	move.l a0,-(sp)
    3766:	2f00           	move.l d0,-(sp)
    3768:	2f2f 01d0      	move.l 464(sp),-(sp)
    376c:	2f2f 002e      	move.l 46(sp),-(sp)
    3770:	4eba 26cc      	jsr 5e3e <TestRow>(pc)
    3774:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3778:	7230           	moveq #48,d1
    377a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    377e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    3782:	52af 01a2      	addq.l #1,418(sp)
    3786:	740b           	moveq #11,d2
    3788:	b4af 01a2      	cmp.l 418(sp),d2
    378c:	6c00 fe50      	bge.w 35de <TestZoom4Picture+0x616>
  }

  for(int i2=0;i2<8;i2++) {  
    3790:	42af 019a      	clr.l 410(sp)
    3794:	6032           	bra.s 37c8 <TestZoom4Picture+0x800>
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    3796:	222f 019a      	move.l 410(sp),d1
    379a:	0681 0000 0105 	addi.l #261,d1
    37a0:	7000           	moveq #0,d0
    37a2:	302f 01c6      	move.w 454(sp),d0
    37a6:	2f01           	move.l d1,-(sp)
    37a8:	2f00           	move.l d0,-(sp)
    37aa:	2f2f 01d0      	move.l 464(sp),-(sp)
    37ae:	2f2f 002e      	move.l 46(sp),-(sp)
    37b2:	4eba 268a      	jsr 5e3e <TestRow>(pc)
    37b6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    37ba:	7030           	moveq #48,d0
    37bc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    37c0:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    37c4:	52af 019a      	addq.l #1,410(sp)
    37c8:	7207           	moveq #7,d1
    37ca:	b2af 019a      	cmp.l 410(sp),d1
    37ce:	6cc6           	bge.s 3796 <TestZoom4Picture+0x7ce>
  }

  tmp = source;
    37d0:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    37d6:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    37dc:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 3,1 );
    37e2:	4878 0001      	pea 1 <_start+0x1>
    37e6:	4878 0003      	pea 3 <_start+0x3>
    37ea:	2f2f 0042      	move.l 66(sp),-(sp)
    37ee:	2f2f 006a      	move.l 106(sp),-(sp)
    37f2:	4eba e298      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    37f6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    37fa:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    3800:	2c40           	movea.l d0,a6
    3802:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    3806:	242f 003a      	move.l 58(sp),d2
    380a:	5882           	addq.l #4,d2
    380c:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom4;
    3810:	2f7c 0001 9428 	move.l #103464,34(sp)
    3816:	0022 
  mask = 0x0000;
    3818:	426f 01c6      	clr.w 454(sp)
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    381c:	4878 0007      	pea 7 <main+0x1>
    3820:	42a7           	clr.l -(sp)
    3822:	2f2f 01d0      	move.l 464(sp),-(sp)
    3826:	2f2f 002e      	move.l 46(sp),-(sp)
    382a:	4eba 2612      	jsr 5e3e <TestRow>(pc)
    382e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3832:	7030           	moveq #48,d0
    3834:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    3838:	4878 0008      	pea 8 <main+0x2>
    383c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3842:	2f2f 01d0      	move.l 464(sp),-(sp)
    3846:	2f2f 002e      	move.l 46(sp),-(sp)
    384a:	4eba 25f2      	jsr 5e3e <TestRow>(pc)
    384e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3852:	7230           	moveq #48,d1
    3854:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    3858:	4878 0009      	pea 9 <main+0x3>
    385c:	2f3c 0000 ffff 	move.l #65535,-(sp)
    3862:	2f2f 01d0      	move.l 464(sp),-(sp)
    3866:	2f2f 002e      	move.l 46(sp),-(sp)
    386a:	4eba 25d2      	jsr 5e3e <TestRow>(pc)
    386e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3872:	7430           	moveq #48,d2
    3874:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    3878:	4878 0008      	pea 8 <main+0x2>
    387c:	42a7           	clr.l -(sp)
    387e:	2f2f 01d0      	move.l 464(sp),-(sp)
    3882:	2f2f 002e      	move.l 46(sp),-(sp)
    3886:	4eba 25b6      	jsr 5e3e <TestRow>(pc)
    388a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    388e:	7030           	moveq #48,d0
    3890:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    3894:	4878 0009      	pea 9 <main+0x3>
    3898:	42a7           	clr.l -(sp)
    389a:	2f2f 01d0      	move.l 464(sp),-(sp)
    389e:	2f2f 002e      	move.l 46(sp),-(sp)
    38a2:	4eba 259a      	jsr 5e3e <TestRow>(pc)
    38a6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    38aa:	7230           	moveq #48,d1
    38ac:	d3af 01c8      	add.l d1,456(sp)

  mask = 0xffff;
    38b0:	3f7c ffff 01c6 	move.w #-1,454(sp)
  for(int i=0;i<12;i++) {
    38b6:	42af 0196      	clr.l 406(sp)
    38ba:	6000 021a      	bra.w 3ad6 <TestZoom4Picture+0xb0e>
    for(int i2=0;i2<14;i2++) {  
    38be:	42af 0192      	clr.l 402(sp)
    38c2:	6046           	bra.s 390a <TestZoom4Picture+0x942>
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    38c4:	222f 0196      	move.l 406(sp),d1
    38c8:	2001           	move.l d1,d0
    38ca:	d080           	add.l d0,d0
    38cc:	d081           	add.l d1,d0
    38ce:	2200           	move.l d0,d1
    38d0:	e789           	lsl.l #3,d1
    38d2:	2401           	move.l d1,d2
    38d4:	9480           	sub.l d0,d2
    38d6:	2002           	move.l d2,d0
    38d8:	2040           	movea.l d0,a0
    38da:	d1ef 0192      	adda.l 402(sp),a0
    38de:	41e8 0009      	lea 9(a0),a0
    38e2:	7000           	moveq #0,d0
    38e4:	302f 01c6      	move.w 454(sp),d0
    38e8:	2f08           	move.l a0,-(sp)
    38ea:	2f00           	move.l d0,-(sp)
    38ec:	2f2f 01d0      	move.l 464(sp),-(sp)
    38f0:	2f2f 002e      	move.l 46(sp),-(sp)
    38f4:	4eba 2548      	jsr 5e3e <TestRow>(pc)
    38f8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    38fc:	7030           	moveq #48,d0
    38fe:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3902:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {  
    3906:	52af 0192      	addq.l #1,402(sp)
    390a:	720d           	moveq #13,d1
    390c:	b2af 0192      	cmp.l 402(sp),d1
    3910:	6cb2           	bge.s 38c4 <TestZoom4Picture+0x8fc>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    3912:	222f 0196      	move.l 406(sp),d1
    3916:	2001           	move.l d1,d0
    3918:	d080           	add.l d0,d0
    391a:	d081           	add.l d1,d0
    391c:	2200           	move.l d0,d1
    391e:	e789           	lsl.l #3,d1
    3920:	2041           	movea.l d1,a0
    3922:	91c0           	suba.l d0,a0
    3924:	41e8 0018      	lea 24(a0),a0
    3928:	7000           	moveq #0,d0
    392a:	302f 01c6      	move.w 454(sp),d0
    392e:	2f08           	move.l a0,-(sp)
    3930:	2f00           	move.l d0,-(sp)
    3932:	2f2f 01d0      	move.l 464(sp),-(sp)
    3936:	2f2f 002e      	move.l 46(sp),-(sp)
    393a:	4eba 2502      	jsr 5e3e <TestRow>(pc)
    393e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3942:	7430           	moveq #48,d2
    3944:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    3948:	222f 0196      	move.l 406(sp),d1
    394c:	2001           	move.l d1,d0
    394e:	d080           	add.l d0,d0
    3950:	d081           	add.l d1,d0
    3952:	2200           	move.l d0,d1
    3954:	e789           	lsl.l #3,d1
    3956:	2041           	movea.l d1,a0
    3958:	91c0           	suba.l d0,a0
    395a:	41e8 0019      	lea 25(a0),a0
    395e:	7000           	moveq #0,d0
    3960:	302f 01c6      	move.w 454(sp),d0
    3964:	2f08           	move.l a0,-(sp)
    3966:	2f00           	move.l d0,-(sp)
    3968:	2f2f 01d0      	move.l 464(sp),-(sp)
    396c:	2f2f 002e      	move.l 46(sp),-(sp)
    3970:	4eba 24cc      	jsr 5e3e <TestRow>(pc)
    3974:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3978:	7030           	moveq #48,d0
    397a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    397e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    3982:	222f 0196      	move.l 406(sp),d1
    3986:	2001           	move.l d1,d0
    3988:	d080           	add.l d0,d0
    398a:	d081           	add.l d1,d0
    398c:	2200           	move.l d0,d1
    398e:	e789           	lsl.l #3,d1
    3990:	2041           	movea.l d1,a0
    3992:	91c0           	suba.l d0,a0
    3994:	41e8 001a      	lea 26(a0),a0
    3998:	7000           	moveq #0,d0
    399a:	302f 01c6      	move.w 454(sp),d0
    399e:	2f08           	move.l a0,-(sp)
    39a0:	2f00           	move.l d0,-(sp)
    39a2:	2f2f 01d0      	move.l 464(sp),-(sp)
    39a6:	2f2f 002e      	move.l 46(sp),-(sp)
    39aa:	4eba 2492      	jsr 5e3e <TestRow>(pc)
    39ae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    39b2:	7230           	moveq #48,d1
    39b4:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    39b8:	222f 0196      	move.l 406(sp),d1
    39bc:	2001           	move.l d1,d0
    39be:	d080           	add.l d0,d0
    39c0:	d081           	add.l d1,d0
    39c2:	2200           	move.l d0,d1
    39c4:	e789           	lsl.l #3,d1
    39c6:	2041           	movea.l d1,a0
    39c8:	91c0           	suba.l d0,a0
    39ca:	41e8 001b      	lea 27(a0),a0
    39ce:	7000           	moveq #0,d0
    39d0:	302f 01c6      	move.w 454(sp),d0
    39d4:	2f08           	move.l a0,-(sp)
    39d6:	2f00           	move.l d0,-(sp)
    39d8:	2f2f 01d0      	move.l 464(sp),-(sp)
    39dc:	2f2f 002e      	move.l 46(sp),-(sp)
    39e0:	4eba 245c      	jsr 5e3e <TestRow>(pc)
    39e4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    39e8:	7430           	moveq #48,d2
    39ea:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    39ee:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    39f2:	222f 0196      	move.l 406(sp),d1
    39f6:	2001           	move.l d1,d0
    39f8:	d080           	add.l d0,d0
    39fa:	d081           	add.l d1,d0
    39fc:	2200           	move.l d0,d1
    39fe:	e789           	lsl.l #3,d1
    3a00:	2041           	movea.l d1,a0
    3a02:	91c0           	suba.l d0,a0
    3a04:	41e8 001c      	lea 28(a0),a0
    3a08:	7000           	moveq #0,d0
    3a0a:	302f 01c6      	move.w 454(sp),d0
    3a0e:	2f08           	move.l a0,-(sp)
    3a10:	2f00           	move.l d0,-(sp)
    3a12:	2f2f 01d0      	move.l 464(sp),-(sp)
    3a16:	2f2f 002e      	move.l 46(sp),-(sp)
    3a1a:	4eba 2422      	jsr 5e3e <TestRow>(pc)
    3a1e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3a22:	7030           	moveq #48,d0
    3a24:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    3a28:	222f 0196      	move.l 406(sp),d1
    3a2c:	2001           	move.l d1,d0
    3a2e:	d080           	add.l d0,d0
    3a30:	d081           	add.l d1,d0
    3a32:	2200           	move.l d0,d1
    3a34:	e789           	lsl.l #3,d1
    3a36:	2041           	movea.l d1,a0
    3a38:	91c0           	suba.l d0,a0
    3a3a:	41e8 001d      	lea 29(a0),a0
    3a3e:	7000           	moveq #0,d0
    3a40:	302f 01c6      	move.w 454(sp),d0
    3a44:	2f08           	move.l a0,-(sp)
    3a46:	2f00           	move.l d0,-(sp)
    3a48:	2f2f 01d0      	move.l 464(sp),-(sp)
    3a4c:	2f2f 002e      	move.l 46(sp),-(sp)
    3a50:	4eba 23ec      	jsr 5e3e <TestRow>(pc)
    3a54:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3a58:	7230           	moveq #48,d1
    3a5a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3a5e:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    3a62:	222f 0196      	move.l 406(sp),d1
    3a66:	2001           	move.l d1,d0
    3a68:	d080           	add.l d0,d0
    3a6a:	d081           	add.l d1,d0
    3a6c:	2200           	move.l d0,d1
    3a6e:	e789           	lsl.l #3,d1
    3a70:	2041           	movea.l d1,a0
    3a72:	91c0           	suba.l d0,a0
    3a74:	41e8 001c      	lea 28(a0),a0
    3a78:	7000           	moveq #0,d0
    3a7a:	302f 01c6      	move.w 454(sp),d0
    3a7e:	2f08           	move.l a0,-(sp)
    3a80:	2f00           	move.l d0,-(sp)
    3a82:	2f2f 01d0      	move.l 464(sp),-(sp)
    3a86:	2f2f 002e      	move.l 46(sp),-(sp)
    3a8a:	4eba 23b2      	jsr 5e3e <TestRow>(pc)
    3a8e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3a92:	7430           	moveq #48,d2
    3a94:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    3a98:	222f 0196      	move.l 406(sp),d1
    3a9c:	2001           	move.l d1,d0
    3a9e:	d080           	add.l d0,d0
    3aa0:	d081           	add.l d1,d0
    3aa2:	2200           	move.l d0,d1
    3aa4:	e789           	lsl.l #3,d1
    3aa6:	2041           	movea.l d1,a0
    3aa8:	91c0           	suba.l d0,a0
    3aaa:	41e8 001d      	lea 29(a0),a0
    3aae:	7000           	moveq #0,d0
    3ab0:	302f 01c6      	move.w 454(sp),d0
    3ab4:	2f08           	move.l a0,-(sp)
    3ab6:	2f00           	move.l d0,-(sp)
    3ab8:	2f2f 01d0      	move.l 464(sp),-(sp)
    3abc:	2f2f 002e      	move.l 46(sp),-(sp)
    3ac0:	4eba 237c      	jsr 5e3e <TestRow>(pc)
    3ac4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3ac8:	7030           	moveq #48,d0
    3aca:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3ace:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<12;i++) {
    3ad2:	52af 0196      	addq.l #1,406(sp)
    3ad6:	720b           	moveq #11,d1
    3ad8:	b2af 0196      	cmp.l 406(sp),d1
    3adc:	6c00 fde0      	bge.w 38be <TestZoom4Picture+0x8f6>
  }

  TestRow( valsupposed, valactual, mask, 269);
    3ae0:	7000           	moveq #0,d0
    3ae2:	302f 01c6      	move.w 454(sp),d0
    3ae6:	4878 010d      	pea 10d <main+0x107>
    3aea:	2f00           	move.l d0,-(sp)
    3aec:	2f2f 01d0      	move.l 464(sp),-(sp)
    3af0:	2f2f 002e      	move.l 46(sp),-(sp)
    3af4:	4eba 2348      	jsr 5e3e <TestRow>(pc)
    3af8:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3afc:	7430           	moveq #48,d2
    3afe:	d5af 01c8      	add.l d2,456(sp)
  
  tmp = source;
    3b02:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    3b08:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    3b0e:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 4, 1);
    3b14:	4878 0001      	pea 1 <_start+0x1>
    3b18:	4878 0004      	pea 4 <_start+0x4>
    3b1c:	2f2f 0042      	move.l 66(sp),-(sp)
    3b20:	2f2f 006a      	move.l 106(sp),-(sp)
    3b24:	4eba df66      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    3b28:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    3b2c:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    3b32:	2c40           	movea.l d0,a6
    3b34:	4eae ff1c      	jsr -228(a6)

  valactual = destination+2; 
    3b38:	202f 003a      	move.l 58(sp),d0
    3b3c:	5880           	addq.l #4,d0
    3b3e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom5;
    3b42:	2f7c 0001 9454 	move.l #103508,34(sp)
    3b48:	0022 
  mask = 0x0000;
    3b4a:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<13;i2++) {  
    3b4e:	42af 018e      	clr.l 398(sp)
    3b52:	602a           	bra.s 3b7e <TestZoom4Picture+0xbb6>
    TestRow( valsupposed, valactual, mask, i2);
    3b54:	7000           	moveq #0,d0
    3b56:	302f 01c6      	move.w 454(sp),d0
    3b5a:	2f2f 018e      	move.l 398(sp),-(sp)
    3b5e:	2f00           	move.l d0,-(sp)
    3b60:	2f2f 01d0      	move.l 464(sp),-(sp)
    3b64:	2f2f 002e      	move.l 46(sp),-(sp)
    3b68:	4eba 22d4      	jsr 5e3e <TestRow>(pc)
    3b6c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3b70:	7230           	moveq #48,d1
    3b72:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3b76:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    3b7a:	52af 018e      	addq.l #1,398(sp)
    3b7e:	740c           	moveq #12,d2
    3b80:	b4af 018e      	cmp.l 398(sp),d2
    3b84:	6cce           	bge.s 3b54 <TestZoom4Picture+0xb8c>
  }

  TestRow( valsupposed, valactual, mask, 12);   
    3b86:	7000           	moveq #0,d0
    3b88:	302f 01c6      	move.w 454(sp),d0
    3b8c:	4878 000c      	pea c <main+0x6>
    3b90:	2f00           	move.l d0,-(sp)
    3b92:	2f2f 01d0      	move.l 464(sp),-(sp)
    3b96:	2f2f 002e      	move.l 46(sp),-(sp)
    3b9a:	4eba 22a2      	jsr 5e3e <TestRow>(pc)
    3b9e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3ba2:	7030           	moveq #48,d0
    3ba4:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 13);
    3ba8:	7000           	moveq #0,d0
    3baa:	302f 01c6      	move.w 454(sp),d0
    3bae:	4878 000d      	pea d <main+0x7>
    3bb2:	2f00           	move.l d0,-(sp)
    3bb4:	2f2f 01d0      	move.l 464(sp),-(sp)
    3bb8:	2f2f 002e      	move.l 46(sp),-(sp)
    3bbc:	4eba 2280      	jsr 5e3e <TestRow>(pc)
    3bc0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3bc4:	7230           	moveq #48,d1
    3bc6:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    3bca:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 14);
    3bce:	7000           	moveq #0,d0
    3bd0:	302f 01c6      	move.w 454(sp),d0
    3bd4:	4878 000e      	pea e <main+0x8>
    3bd8:	2f00           	move.l d0,-(sp)
    3bda:	2f2f 01d0      	move.l 464(sp),-(sp)
    3bde:	2f2f 002e      	move.l 46(sp),-(sp)
    3be2:	4eba 225a      	jsr 5e3e <TestRow>(pc)
    3be6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3bea:	7430           	moveq #48,d2
    3bec:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, mask, 15);
    3bf0:	7000           	moveq #0,d0
    3bf2:	302f 01c6      	move.w 454(sp),d0
    3bf6:	4878 000f      	pea f <main+0x9>
    3bfa:	2f00           	move.l d0,-(sp)
    3bfc:	2f2f 01d0      	move.l 464(sp),-(sp)
    3c00:	2f2f 002e      	move.l 46(sp),-(sp)
    3c04:	4eba 2238      	jsr 5e3e <TestRow>(pc)
    3c08:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3c0c:	7030           	moveq #48,d0
    3c0e:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    3c12:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 16);
    3c16:	7000           	moveq #0,d0
    3c18:	302f 01c6      	move.w 454(sp),d0
    3c1c:	4878 0010      	pea 10 <main+0xa>
    3c20:	2f00           	move.l d0,-(sp)
    3c22:	2f2f 01d0      	move.l 464(sp),-(sp)
    3c26:	2f2f 002e      	move.l 46(sp),-(sp)
    3c2a:	4eba 2212      	jsr 5e3e <TestRow>(pc)
    3c2e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3c32:	7230           	moveq #48,d1
    3c34:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 17);
    3c38:	7000           	moveq #0,d0
    3c3a:	302f 01c6      	move.w 454(sp),d0
    3c3e:	4878 0011      	pea 11 <main+0xb>
    3c42:	2f00           	move.l d0,-(sp)
    3c44:	2f2f 01d0      	move.l 464(sp),-(sp)
    3c48:	2f2f 002e      	move.l 46(sp),-(sp)
    3c4c:	4eba 21f0      	jsr 5e3e <TestRow>(pc)
    3c50:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3c54:	7430           	moveq #48,d2
    3c56:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    3c5a:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 18);
    3c5e:	7000           	moveq #0,d0
    3c60:	302f 01c6      	move.w 454(sp),d0
    3c64:	4878 0012      	pea 12 <main+0xc>
    3c68:	2f00           	move.l d0,-(sp)
    3c6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3c6e:	2f2f 002e      	move.l 46(sp),-(sp)
    3c72:	4eba 21ca      	jsr 5e3e <TestRow>(pc)
    3c76:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3c7a:	7030           	moveq #48,d0
    3c7c:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 19);
    3c80:	7000           	moveq #0,d0
    3c82:	302f 01c6      	move.w 454(sp),d0
    3c86:	4878 0013      	pea 13 <main+0xd>
    3c8a:	2f00           	move.l d0,-(sp)
    3c8c:	2f2f 01d0      	move.l 464(sp),-(sp)
    3c90:	2f2f 002e      	move.l 46(sp),-(sp)
    3c94:	4eba 21a8      	jsr 5e3e <TestRow>(pc)
    3c98:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3c9c:	7230           	moveq #48,d1
    3c9e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    3ca2:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 20);
    3ca6:	7000           	moveq #0,d0
    3ca8:	302f 01c6      	move.w 454(sp),d0
    3cac:	4878 0014      	pea 14 <main+0xe>
    3cb0:	2f00           	move.l d0,-(sp)
    3cb2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3cb6:	2f2f 002e      	move.l 46(sp),-(sp)
    3cba:	4eba 2182      	jsr 5e3e <TestRow>(pc)
    3cbe:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3cc2:	7430           	moveq #48,d2
    3cc4:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, mask, 21);
    3cc8:	7000           	moveq #0,d0
    3cca:	302f 01c6      	move.w 454(sp),d0
    3cce:	4878 0015      	pea 15 <main+0xf>
    3cd2:	2f00           	move.l d0,-(sp)
    3cd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    3cd8:	2f2f 002e      	move.l 46(sp),-(sp)
    3cdc:	4eba 2160      	jsr 5e3e <TestRow>(pc)
    3ce0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3ce4:	7030           	moveq #48,d0
    3ce6:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    3cea:	466f 01c6      	not.w 454(sp)


  for(int i=0;i<10;i++) {
    3cee:	42af 018a      	clr.l 394(sp)
    3cf2:	6000 028a      	bra.w 3f7e <TestZoom4Picture+0xfb6>
    for(int i2=0;i2<13;i2++) {  
    3cf6:	42af 0186      	clr.l 390(sp)
    3cfa:	6046           	bra.s 3d42 <TestZoom4Picture+0xd7a>
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    3cfc:	222f 018a      	move.l 394(sp),d1
    3d00:	2001           	move.l d1,d0
    3d02:	d080           	add.l d0,d0
    3d04:	d081           	add.l d1,d0
    3d06:	2200           	move.l d0,d1
    3d08:	e789           	lsl.l #3,d1
    3d0a:	2401           	move.l d1,d2
    3d0c:	9480           	sub.l d0,d2
    3d0e:	2002           	move.l d2,d0
    3d10:	2040           	movea.l d0,a0
    3d12:	d1ef 0186      	adda.l 390(sp),a0
    3d16:	41e8 0016      	lea 22(a0),a0
    3d1a:	7000           	moveq #0,d0
    3d1c:	302f 01c6      	move.w 454(sp),d0
    3d20:	2f08           	move.l a0,-(sp)
    3d22:	2f00           	move.l d0,-(sp)
    3d24:	2f2f 01d0      	move.l 464(sp),-(sp)
    3d28:	2f2f 002e      	move.l 46(sp),-(sp)
    3d2c:	4eba 2110      	jsr 5e3e <TestRow>(pc)
    3d30:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    3d34:	7030           	moveq #48,d0
    3d36:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    3d3a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {  
    3d3e:	52af 0186      	addq.l #1,390(sp)
    3d42:	720c           	moveq #12,d1
    3d44:	b2af 0186      	cmp.l 390(sp),d1
    3d48:	6cb2           	bge.s 3cfc <TestZoom4Picture+0xd34>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    3d4a:	222f 018a      	move.l 394(sp),d1
    3d4e:	2001           	move.l d1,d0
    3d50:	d080           	add.l d0,d0
    3d52:	d081           	add.l d1,d0
    3d54:	2200           	move.l d0,d1
    3d56:	e789           	lsl.l #3,d1
    3d58:	2041           	movea.l d1,a0
    3d5a:	91c0           	suba.l d0,a0
    3d5c:	41e8 0023      	lea 35(a0),a0
    3d60:	7000           	moveq #0,d0
    3d62:	302f 01c6      	move.w 454(sp),d0
    3d66:	2f08           	move.l a0,-(sp)
    3d68:	2f00           	move.l d0,-(sp)
    3d6a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3d6e:	2f2f 002e      	move.l 46(sp),-(sp)
    3d72:	4eba 20ca      	jsr 5e3e <TestRow>(pc)
    3d76:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3d7a:	7430           	moveq #48,d2
    3d7c:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    3d80:	222f 018a      	move.l 394(sp),d1
    3d84:	2001           	move.l d1,d0
    3d86:	d080           	add.l d0,d0
    3d88:	d081           	add.l d1,d0
    3d8a:	2200           	move.l d0,d1
    3d8c:	e789           	lsl.l #3,d1
    3d8e:	2041           	movea.l d1,a0
    3d90:	91c0           	suba.l d0,a0
    3d92:	41e8 0024      	lea 36(a0),a0
    3d96:	7000           	moveq #0,d0
    3d98:	302f 01c6      	move.w 454(sp),d0
    3d9c:	2f08           	move.l a0,-(sp)
    3d9e:	2f00           	move.l d0,-(sp)
    3da0:	2f2f 01d0      	move.l 464(sp),-(sp)
    3da4:	2f2f 002e      	move.l 46(sp),-(sp)
    3da8:	4eba 2094      	jsr 5e3e <TestRow>(pc)
    3dac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3db0:	7030           	moveq #48,d0
    3db2:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3db6:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    3dba:	222f 018a      	move.l 394(sp),d1
    3dbe:	2001           	move.l d1,d0
    3dc0:	d080           	add.l d0,d0
    3dc2:	d081           	add.l d1,d0
    3dc4:	2200           	move.l d0,d1
    3dc6:	e789           	lsl.l #3,d1
    3dc8:	2041           	movea.l d1,a0
    3dca:	91c0           	suba.l d0,a0
    3dcc:	41e8 0025      	lea 37(a0),a0
    3dd0:	7000           	moveq #0,d0
    3dd2:	302f 01c6      	move.w 454(sp),d0
    3dd6:	2f08           	move.l a0,-(sp)
    3dd8:	2f00           	move.l d0,-(sp)
    3dda:	2f2f 01d0      	move.l 464(sp),-(sp)
    3dde:	2f2f 002e      	move.l 46(sp),-(sp)
    3de2:	4eba 205a      	jsr 5e3e <TestRow>(pc)
    3de6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3dea:	7230           	moveq #48,d1
    3dec:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    3df0:	222f 018a      	move.l 394(sp),d1
    3df4:	2001           	move.l d1,d0
    3df6:	d080           	add.l d0,d0
    3df8:	d081           	add.l d1,d0
    3dfa:	2200           	move.l d0,d1
    3dfc:	e789           	lsl.l #3,d1
    3dfe:	2041           	movea.l d1,a0
    3e00:	91c0           	suba.l d0,a0
    3e02:	41e8 0026      	lea 38(a0),a0
    3e06:	7000           	moveq #0,d0
    3e08:	302f 01c6      	move.w 454(sp),d0
    3e0c:	2f08           	move.l a0,-(sp)
    3e0e:	2f00           	move.l d0,-(sp)
    3e10:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e14:	2f2f 002e      	move.l 46(sp),-(sp)
    3e18:	4eba 2024      	jsr 5e3e <TestRow>(pc)
    3e1c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e20:	7430           	moveq #48,d2
    3e22:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    3e26:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    3e2a:	222f 018a      	move.l 394(sp),d1
    3e2e:	2001           	move.l d1,d0
    3e30:	d080           	add.l d0,d0
    3e32:	d081           	add.l d1,d0
    3e34:	2200           	move.l d0,d1
    3e36:	e789           	lsl.l #3,d1
    3e38:	2041           	movea.l d1,a0
    3e3a:	91c0           	suba.l d0,a0
    3e3c:	41e8 0027      	lea 39(a0),a0
    3e40:	7000           	moveq #0,d0
    3e42:	302f 01c6      	move.w 454(sp),d0
    3e46:	2f08           	move.l a0,-(sp)
    3e48:	2f00           	move.l d0,-(sp)
    3e4a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e4e:	2f2f 002e      	move.l 46(sp),-(sp)
    3e52:	4eba 1fea      	jsr 5e3e <TestRow>(pc)
    3e56:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e5a:	7030           	moveq #48,d0
    3e5c:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    3e60:	222f 018a      	move.l 394(sp),d1
    3e64:	2001           	move.l d1,d0
    3e66:	d080           	add.l d0,d0
    3e68:	d081           	add.l d1,d0
    3e6a:	2200           	move.l d0,d1
    3e6c:	e789           	lsl.l #3,d1
    3e6e:	2041           	movea.l d1,a0
    3e70:	91c0           	suba.l d0,a0
    3e72:	41e8 0028      	lea 40(a0),a0
    3e76:	7000           	moveq #0,d0
    3e78:	302f 01c6      	move.w 454(sp),d0
    3e7c:	2f08           	move.l a0,-(sp)
    3e7e:	2f00           	move.l d0,-(sp)
    3e80:	2f2f 01d0      	move.l 464(sp),-(sp)
    3e84:	2f2f 002e      	move.l 46(sp),-(sp)
    3e88:	4eba 1fb4      	jsr 5e3e <TestRow>(pc)
    3e8c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3e90:	7230           	moveq #48,d1
    3e92:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3e96:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    3e9a:	222f 018a      	move.l 394(sp),d1
    3e9e:	2001           	move.l d1,d0
    3ea0:	d080           	add.l d0,d0
    3ea2:	d081           	add.l d1,d0
    3ea4:	2200           	move.l d0,d1
    3ea6:	e789           	lsl.l #3,d1
    3ea8:	2041           	movea.l d1,a0
    3eaa:	91c0           	suba.l d0,a0
    3eac:	41e8 0029      	lea 41(a0),a0
    3eb0:	7000           	moveq #0,d0
    3eb2:	302f 01c6      	move.w 454(sp),d0
    3eb6:	2f08           	move.l a0,-(sp)
    3eb8:	2f00           	move.l d0,-(sp)
    3eba:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ebe:	2f2f 002e      	move.l 46(sp),-(sp)
    3ec2:	4eba 1f7a      	jsr 5e3e <TestRow>(pc)
    3ec6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3eca:	7430           	moveq #48,d2
    3ecc:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    3ed0:	222f 018a      	move.l 394(sp),d1
    3ed4:	2001           	move.l d1,d0
    3ed6:	d080           	add.l d0,d0
    3ed8:	d081           	add.l d1,d0
    3eda:	2200           	move.l d0,d1
    3edc:	e789           	lsl.l #3,d1
    3ede:	2041           	movea.l d1,a0
    3ee0:	91c0           	suba.l d0,a0
    3ee2:	41e8 002a      	lea 42(a0),a0
    3ee6:	7000           	moveq #0,d0
    3ee8:	302f 01c6      	move.w 454(sp),d0
    3eec:	2f08           	move.l a0,-(sp)
    3eee:	2f00           	move.l d0,-(sp)
    3ef0:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ef4:	2f2f 002e      	move.l 46(sp),-(sp)
    3ef8:	4eba 1f44      	jsr 5e3e <TestRow>(pc)
    3efc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f00:	7030           	moveq #48,d0
    3f02:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    3f06:	466f 01c6      	not.w 454(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    3f0a:	222f 018a      	move.l 394(sp),d1
    3f0e:	2001           	move.l d1,d0
    3f10:	d080           	add.l d0,d0
    3f12:	d081           	add.l d1,d0
    3f14:	2200           	move.l d0,d1
    3f16:	e789           	lsl.l #3,d1
    3f18:	2041           	movea.l d1,a0
    3f1a:	91c0           	suba.l d0,a0
    3f1c:	41e8 002b      	lea 43(a0),a0
    3f20:	7000           	moveq #0,d0
    3f22:	302f 01c6      	move.w 454(sp),d0
    3f26:	2f08           	move.l a0,-(sp)
    3f28:	2f00           	move.l d0,-(sp)
    3f2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f2e:	2f2f 002e      	move.l 46(sp),-(sp)
    3f32:	4eba 1f0a      	jsr 5e3e <TestRow>(pc)
    3f36:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f3a:	7230           	moveq #48,d1
    3f3c:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    3f40:	222f 018a      	move.l 394(sp),d1
    3f44:	2001           	move.l d1,d0
    3f46:	d080           	add.l d0,d0
    3f48:	d081           	add.l d1,d0
    3f4a:	2200           	move.l d0,d1
    3f4c:	e789           	lsl.l #3,d1
    3f4e:	2041           	movea.l d1,a0
    3f50:	91c0           	suba.l d0,a0
    3f52:	41e8 002c      	lea 44(a0),a0
    3f56:	7000           	moveq #0,d0
    3f58:	302f 01c6      	move.w 454(sp),d0
    3f5c:	2f08           	move.l a0,-(sp)
    3f5e:	2f00           	move.l d0,-(sp)
    3f60:	2f2f 01d0      	move.l 464(sp),-(sp)
    3f64:	2f2f 002e      	move.l 46(sp),-(sp)
    3f68:	4eba 1ed4      	jsr 5e3e <TestRow>(pc)
    3f6c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3f70:	7430           	moveq #48,d2
    3f72:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    3f76:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<10;i++) {
    3f7a:	52af 018a      	addq.l #1,394(sp)
    3f7e:	7009           	moveq #9,d0
    3f80:	b0af 018a      	cmp.l 394(sp),d0
    3f84:	6c00 fd70      	bge.w 3cf6 <TestZoom4Picture+0xd2e>
  }

  for(int i2=0;i2<13;i2++) {  
    3f88:	42af 0182      	clr.l 386(sp)
    3f8c:	6032           	bra.s 3fc0 <TestZoom4Picture+0xff8>
    TestRow( valsupposed, valactual, mask, i2+253);
    3f8e:	222f 0182      	move.l 386(sp),d1
    3f92:	0681 0000 00fd 	addi.l #253,d1
    3f98:	7000           	moveq #0,d0
    3f9a:	302f 01c6      	move.w 454(sp),d0
    3f9e:	2f01           	move.l d1,-(sp)
    3fa0:	2f00           	move.l d0,-(sp)
    3fa2:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fa6:	2f2f 002e      	move.l 46(sp),-(sp)
    3faa:	4eba 1e92      	jsr 5e3e <TestRow>(pc)
    3fae:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    3fb2:	7230           	moveq #48,d1
    3fb4:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    3fb8:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<13;i2++) {  
    3fbc:	52af 0182      	addq.l #1,386(sp)
    3fc0:	740c           	moveq #12,d2
    3fc2:	b4af 0182      	cmp.l 386(sp),d2
    3fc6:	6cc6           	bge.s 3f8e <TestZoom4Picture+0xfc6>
  }

  TestRow( valsupposed, valactual, mask, 266);
    3fc8:	7000           	moveq #0,d0
    3fca:	302f 01c6      	move.w 454(sp),d0
    3fce:	4878 010a      	pea 10a <main+0x104>
    3fd2:	2f00           	move.l d0,-(sp)
    3fd4:	2f2f 01d0      	move.l 464(sp),-(sp)
    3fd8:	2f2f 002e      	move.l 46(sp),-(sp)
    3fdc:	4eba 1e60      	jsr 5e3e <TestRow>(pc)
    3fe0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    3fe4:	7030           	moveq #48,d0
    3fe6:	d1af 01c8      	add.l d0,456(sp)
  TestRow( valsupposed, valactual, mask, 267);
    3fea:	7000           	moveq #0,d0
    3fec:	302f 01c6      	move.w 454(sp),d0
    3ff0:	4878 010b      	pea 10b <main+0x105>
    3ff4:	2f00           	move.l d0,-(sp)
    3ff6:	2f2f 01d0      	move.l 464(sp),-(sp)
    3ffa:	2f2f 002e      	move.l 46(sp),-(sp)
    3ffe:	4eba 1e3e      	jsr 5e3e <TestRow>(pc)
    4002:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4006:	7230           	moveq #48,d1
    4008:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    400c:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4010:	7000           	moveq #0,d0
    4012:	302f 01c6      	move.w 454(sp),d0
    4016:	4878 010c      	pea 10c <main+0x106>
    401a:	2f00           	move.l d0,-(sp)
    401c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4020:	2f2f 002e      	move.l 46(sp),-(sp)
    4024:	4eba 1e18      	jsr 5e3e <TestRow>(pc)
    4028:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    402c:	7430           	moveq #48,d2
    402e:	d5af 01c8      	add.l d2,456(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4032:	7000           	moveq #0,d0
    4034:	302f 01c6      	move.w 454(sp),d0
    4038:	4878 010d      	pea 10d <main+0x107>
    403c:	2f00           	move.l d0,-(sp)
    403e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4042:	2f2f 002e      	move.l 46(sp),-(sp)
    4046:	4eba 1df6      	jsr 5e3e <TestRow>(pc)
    404a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    404e:	7030           	moveq #48,d0
    4050:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4054:	466f 01c6      	not.w 454(sp)

  tmp = source;
    4058:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    405e:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4064:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 5, 1);
    406a:	4878 0001      	pea 1 <_start+0x1>
    406e:	4878 0005      	pea 5 <_start+0x5>
    4072:	2f2f 0042      	move.l 66(sp),-(sp)
    4076:	2f2f 006a      	move.l 106(sp),-(sp)
    407a:	4eba da10      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    407e:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4082:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    4088:	2c40           	movea.l d0,a6
    408a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    408e:	222f 003a      	move.l 58(sp),d1
    4092:	5881           	addq.l #4,d1
    4094:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom6;
    4098:	2f7c 0001 9480 	move.l #103552,34(sp)
    409e:	0022 
  mask = 0x0000;
    40a0:	426f 01c6      	clr.w 454(sp)
 
  for(int i2=0;i2<7;i2++) {  
    40a4:	42af 017e      	clr.l 382(sp)
    40a8:	602a           	bra.s 40d4 <TestZoom4Picture+0x110c>
    TestRow( valsupposed, valactual, mask, i2);
    40aa:	7000           	moveq #0,d0
    40ac:	302f 01c6      	move.w 454(sp),d0
    40b0:	2f2f 017e      	move.l 382(sp),-(sp)
    40b4:	2f00           	move.l d0,-(sp)
    40b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    40ba:	2f2f 002e      	move.l 46(sp),-(sp)
    40be:	4eba 1d7e      	jsr 5e3e <TestRow>(pc)
    40c2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    40c6:	7430           	moveq #48,d2
    40c8:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    40cc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    40d0:	52af 017e      	addq.l #1,382(sp)
    40d4:	7006           	moveq #6,d0
    40d6:	b0af 017e      	cmp.l 382(sp),d0
    40da:	6cce           	bge.s 40aa <TestZoom4Picture+0x10e2>
  }

  for(int i=0;i<6;i++) {
    40dc:	42af 017a      	clr.l 378(sp)
    40e0:	605c           	bra.s 413e <TestZoom4Picture+0x1176>
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    40e2:	202f 017a      	move.l 378(sp),d0
    40e6:	d080           	add.l d0,d0
    40e8:	2200           	move.l d0,d1
    40ea:	5e81           	addq.l #7,d1
    40ec:	7000           	moveq #0,d0
    40ee:	302f 01c6      	move.w 454(sp),d0
    40f2:	2f01           	move.l d1,-(sp)
    40f4:	2f00           	move.l d0,-(sp)
    40f6:	2f2f 01d0      	move.l 464(sp),-(sp)
    40fa:	2f2f 002e      	move.l 46(sp),-(sp)
    40fe:	4eba 1d3e      	jsr 5e3e <TestRow>(pc)
    4102:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4106:	7230           	moveq #48,d1
    4108:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    410c:	202f 017a      	move.l 378(sp),d0
    4110:	5880           	addq.l #4,d0
    4112:	d080           	add.l d0,d0
    4114:	2200           	move.l d0,d1
    4116:	7000           	moveq #0,d0
    4118:	302f 01c6      	move.w 454(sp),d0
    411c:	2f01           	move.l d1,-(sp)
    411e:	2f00           	move.l d0,-(sp)
    4120:	2f2f 01d0      	move.l 464(sp),-(sp)
    4124:	2f2f 002e      	move.l 46(sp),-(sp)
    4128:	4eba 1d14      	jsr 5e3e <TestRow>(pc)
    412c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4130:	7430           	moveq #48,d2
    4132:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4136:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<6;i++) {
    413a:	52af 017a      	addq.l #1,378(sp)
    413e:	7005           	moveq #5,d0
    4140:	b0af 017a      	cmp.l 378(sp),d0
    4144:	6c9c           	bge.s 40e2 <TestZoom4Picture+0x111a>
  }

  for(int i=0;i<10;i++) {
    4146:	42af 0176      	clr.l 374(sp)
    414a:	6000 00ce      	bra.w 421a <TestZoom4Picture+0x1252>
    for(int i2=0;i2<12;i2++) {  
    414e:	42af 0172      	clr.l 370(sp)
    4152:	6040           	bra.s 4194 <TestZoom4Picture+0x11cc>
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    4154:	307c 0013      	movea.w #19,a0
    4158:	d1ef 0172      	adda.l 370(sp),a0
    415c:	222f 0176      	move.l 374(sp),d1
    4160:	2001           	move.l d1,d0
    4162:	d080           	add.l d0,d0
    4164:	d081           	add.l d1,d0
    4166:	e788           	lsl.l #3,d0
    4168:	2208           	move.l a0,d1
    416a:	d280           	add.l d0,d1
    416c:	7000           	moveq #0,d0
    416e:	302f 01c6      	move.w 454(sp),d0
    4172:	2f01           	move.l d1,-(sp)
    4174:	2f00           	move.l d0,-(sp)
    4176:	2f2f 01d0      	move.l 464(sp),-(sp)
    417a:	2f2f 002e      	move.l 46(sp),-(sp)
    417e:	4eba 1cbe      	jsr 5e3e <TestRow>(pc)
    4182:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4186:	7230           	moveq #48,d1
    4188:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    418c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {  
    4190:	52af 0172      	addq.l #1,370(sp)
    4194:	740b           	moveq #11,d2
    4196:	b4af 0172      	cmp.l 370(sp),d2
    419a:	6cb8           	bge.s 4154 <TestZoom4Picture+0x118c>
    }
    for(int i=0;i<6;i++) {
    419c:	42af 016e      	clr.l 366(sp)
    41a0:	606c           	bra.s 420e <TestZoom4Picture+0x1246>
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    41a2:	222f 016e      	move.l 366(sp),d1
    41a6:	2001           	move.l d1,d0
    41a8:	d080           	add.l d0,d0
    41aa:	d081           	add.l d1,d0
    41ac:	e788           	lsl.l #3,d0
    41ae:	2040           	movea.l d0,a0
    41b0:	41e8 001f      	lea 31(a0),a0
    41b4:	7000           	moveq #0,d0
    41b6:	302f 01c6      	move.w 454(sp),d0
    41ba:	2f08           	move.l a0,-(sp)
    41bc:	2f00           	move.l d0,-(sp)
    41be:	2f2f 01d0      	move.l 464(sp),-(sp)
    41c2:	2f2f 002e      	move.l 46(sp),-(sp)
    41c6:	4eba 1c76      	jsr 5e3e <TestRow>(pc)
    41ca:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    41ce:	7030           	moveq #48,d0
    41d0:	d1af 01c8      	add.l d0,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*24);
    41d4:	222f 016e      	move.l 366(sp),d1
    41d8:	2001           	move.l d1,d0
    41da:	d080           	add.l d0,d0
    41dc:	d081           	add.l d1,d0
    41de:	e788           	lsl.l #3,d0
    41e0:	2040           	movea.l d0,a0
    41e2:	41e8 0020      	lea 32(a0),a0
    41e6:	7000           	moveq #0,d0
    41e8:	302f 01c6      	move.w 454(sp),d0
    41ec:	2f08           	move.l a0,-(sp)
    41ee:	2f00           	move.l d0,-(sp)
    41f0:	2f2f 01d0      	move.l 464(sp),-(sp)
    41f4:	2f2f 002e      	move.l 46(sp),-(sp)
    41f8:	4eba 1c44      	jsr 5e3e <TestRow>(pc)
    41fc:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4200:	7230           	moveq #48,d1
    4202:	d3af 01c8      	add.l d1,456(sp)
      mask = mask ^ 0xffff;
    4206:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<6;i++) {
    420a:	52af 016e      	addq.l #1,366(sp)
    420e:	7405           	moveq #5,d2
    4210:	b4af 016e      	cmp.l 366(sp),d2
    4214:	6c8c           	bge.s 41a2 <TestZoom4Picture+0x11da>
  for(int i=0;i<10;i++) {
    4216:	52af 0176      	addq.l #1,374(sp)
    421a:	7009           	moveq #9,d0
    421c:	b0af 0176      	cmp.l 374(sp),d0
    4220:	6c00 ff2c      	bge.w 414e <TestZoom4Picture+0x1186>
    }
  }

  for(int i2=0;i2<11;i2++) {  
    4224:	42af 016a      	clr.l 362(sp)
    4228:	6032           	bra.s 425c <TestZoom4Picture+0x1294>
    TestRow( valsupposed, valactual, mask, 258+i2);
    422a:	222f 016a      	move.l 362(sp),d1
    422e:	0681 0000 0102 	addi.l #258,d1
    4234:	7000           	moveq #0,d0
    4236:	302f 01c6      	move.w 454(sp),d0
    423a:	2f01           	move.l d1,-(sp)
    423c:	2f00           	move.l d0,-(sp)
    423e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4242:	2f2f 002e      	move.l 46(sp),-(sp)
    4246:	4eba 1bf6      	jsr 5e3e <TestRow>(pc)
    424a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    424e:	7230           	moveq #48,d1
    4250:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4254:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {  
    4258:	52af 016a      	addq.l #1,362(sp)
    425c:	740a           	moveq #10,d2
    425e:	b4af 016a      	cmp.l 362(sp),d2
    4262:	6cc6           	bge.s 422a <TestZoom4Picture+0x1262>
  }

  tmp = source;
    4264:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    426a:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4270:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 6, 1);
    4276:	4878 0001      	pea 1 <_start+0x1>
    427a:	4878 0006      	pea 6 <main>
    427e:	2f2f 0042      	move.l 66(sp),-(sp)
    4282:	2f2f 006a      	move.l 106(sp),-(sp)
    4286:	4eba d804      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    428a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    428e:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    4294:	2c40           	movea.l d0,a6
    4296:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    429a:	202f 003a      	move.l 58(sp),d0
    429e:	5880           	addq.l #4,d0
    42a0:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom7;
    42a4:	2f7c 0001 94ac 	move.l #103596,34(sp)
    42aa:	0022 
  mask = 0x0000;
    42ac:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    42b0:	7000           	moveq #0,d0
    42b2:	302f 01c6      	move.w 454(sp),d0
    42b6:	42a7           	clr.l -(sp)
    42b8:	2f00           	move.l d0,-(sp)
    42ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    42be:	2f2f 002e      	move.l 46(sp),-(sp)
    42c2:	4eba 1b7a      	jsr 5e3e <TestRow>(pc)
    42c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    42ca:	7230           	moveq #48,d1
    42cc:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    42d0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    42d4:	42af 0166      	clr.l 358(sp)
    42d8:	605c           	bra.s 4336 <TestZoom4Picture+0x136e>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    42da:	202f 0166      	move.l 358(sp),d0
    42de:	d080           	add.l d0,d0
    42e0:	2200           	move.l d0,d1
    42e2:	5281           	addq.l #1,d1
    42e4:	7000           	moveq #0,d0
    42e6:	302f 01c6      	move.w 454(sp),d0
    42ea:	2f01           	move.l d1,-(sp)
    42ec:	2f00           	move.l d0,-(sp)
    42ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    42f2:	2f2f 002e      	move.l 46(sp),-(sp)
    42f6:	4eba 1b46      	jsr 5e3e <TestRow>(pc)
    42fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    42fe:	7430           	moveq #48,d2
    4300:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    4304:	202f 0166      	move.l 358(sp),d0
    4308:	5280           	addq.l #1,d0
    430a:	d080           	add.l d0,d0
    430c:	2200           	move.l d0,d1
    430e:	7000           	moveq #0,d0
    4310:	302f 01c6      	move.w 454(sp),d0
    4314:	2f01           	move.l d1,-(sp)
    4316:	2f00           	move.l d0,-(sp)
    4318:	2f2f 01d0      	move.l 464(sp),-(sp)
    431c:	2f2f 002e      	move.l 46(sp),-(sp)
    4320:	4eba 1b1c      	jsr 5e3e <TestRow>(pc)
    4324:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4328:	7030           	moveq #48,d0
    432a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    432e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    4332:	52af 0166      	addq.l #1,358(sp)
    4336:	7206           	moveq #6,d1
    4338:	b2af 0166      	cmp.l 358(sp),d1
    433c:	6c9c           	bge.s 42da <TestZoom4Picture+0x1312>
  }

  for(int i=0;i<10;i++) {
    433e:	42af 0162      	clr.l 354(sp)
    4342:	6000 00d4      	bra.w 4418 <TestZoom4Picture+0x1450>
    for(int i2=0;i2<11;i2++) {  
    4346:	42af 015e      	clr.l 350(sp)
    434a:	6042           	bra.s 438e <TestZoom4Picture+0x13c6>
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    434c:	307c 000f      	movea.w #15,a0
    4350:	d1ef 015e      	adda.l 350(sp),a0
    4354:	222f 0162      	move.l 354(sp),d1
    4358:	2001           	move.l d1,d0
    435a:	d080           	add.l d0,d0
    435c:	d081           	add.l d1,d0
    435e:	e788           	lsl.l #3,d0
    4360:	d081           	add.l d1,d0
    4362:	2208           	move.l a0,d1
    4364:	d280           	add.l d0,d1
    4366:	7000           	moveq #0,d0
    4368:	302f 01c6      	move.w 454(sp),d0
    436c:	2f01           	move.l d1,-(sp)
    436e:	2f00           	move.l d0,-(sp)
    4370:	2f2f 01d0      	move.l 464(sp),-(sp)
    4374:	2f2f 002e      	move.l 46(sp),-(sp)
    4378:	4eba 1ac4      	jsr 5e3e <TestRow>(pc)
    437c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4380:	7430           	moveq #48,d2
    4382:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    4386:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {  
    438a:	52af 015e      	addq.l #1,350(sp)
    438e:	700a           	moveq #10,d0
    4390:	b0af 015e      	cmp.l 350(sp),d0
    4394:	6cb6           	bge.s 434c <TestZoom4Picture+0x1384>
    }
    for(int i=0;i<7;i++) {
    4396:	42af 015a      	clr.l 346(sp)
    439a:	6070           	bra.s 440c <TestZoom4Picture+0x1444>
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    439c:	222f 015a      	move.l 346(sp),d1
    43a0:	2001           	move.l d1,d0
    43a2:	d080           	add.l d0,d0
    43a4:	d081           	add.l d1,d0
    43a6:	e788           	lsl.l #3,d0
    43a8:	2040           	movea.l d0,a0
    43aa:	d1c1           	adda.l d1,a0
    43ac:	41e8 001a      	lea 26(a0),a0
    43b0:	7000           	moveq #0,d0
    43b2:	302f 01c6      	move.w 454(sp),d0
    43b6:	2f08           	move.l a0,-(sp)
    43b8:	2f00           	move.l d0,-(sp)
    43ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    43be:	2f2f 002e      	move.l 46(sp),-(sp)
    43c2:	4eba 1a7a      	jsr 5e3e <TestRow>(pc)
    43c6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    43ca:	7230           	moveq #48,d1
    43cc:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 26+i*25);
    43d0:	222f 015a      	move.l 346(sp),d1
    43d4:	2001           	move.l d1,d0
    43d6:	d080           	add.l d0,d0
    43d8:	d081           	add.l d1,d0
    43da:	e788           	lsl.l #3,d0
    43dc:	2040           	movea.l d0,a0
    43de:	d1c1           	adda.l d1,a0
    43e0:	41e8 001a      	lea 26(a0),a0
    43e4:	7000           	moveq #0,d0
    43e6:	302f 01c6      	move.w 454(sp),d0
    43ea:	2f08           	move.l a0,-(sp)
    43ec:	2f00           	move.l d0,-(sp)
    43ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    43f2:	2f2f 002e      	move.l 46(sp),-(sp)
    43f6:	4eba 1a46      	jsr 5e3e <TestRow>(pc)
    43fa:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    43fe:	7430           	moveq #48,d2
    4400:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    4404:	466f 01c6      	not.w 454(sp)
    for(int i=0;i<7;i++) {
    4408:	52af 015a      	addq.l #1,346(sp)
    440c:	7006           	moveq #6,d0
    440e:	b0af 015a      	cmp.l 346(sp),d0
    4412:	6c88           	bge.s 439c <TestZoom4Picture+0x13d4>
  for(int i=0;i<10;i++) {
    4414:	52af 0162      	addq.l #1,354(sp)
    4418:	7209           	moveq #9,d1
    441a:	b2af 0162      	cmp.l 354(sp),d1
    441e:	6c00 ff26      	bge.w 4346 <TestZoom4Picture+0x137e>
    }
  }

  for(int i2=0;i2<5;i2++) {  
    4422:	42af 0156      	clr.l 342(sp)
    4426:	6032           	bra.s 445a <TestZoom4Picture+0x1492>
    TestRow( valsupposed, valactual, mask, 256+i2);
    4428:	222f 0156      	move.l 342(sp),d1
    442c:	0681 0000 0100 	addi.l #256,d1
    4432:	7000           	moveq #0,d0
    4434:	302f 01c6      	move.w 454(sp),d0
    4438:	2f01           	move.l d1,-(sp)
    443a:	2f00           	move.l d0,-(sp)
    443c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4440:	2f2f 002e      	move.l 46(sp),-(sp)
    4444:	4eba 19f8      	jsr 5e3e <TestRow>(pc)
    4448:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    444c:	7430           	moveq #48,d2
    444e:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4452:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    4456:	52af 0156      	addq.l #1,342(sp)
    445a:	7004           	moveq #4,d0
    445c:	b0af 0156      	cmp.l 342(sp),d0
    4460:	6cc6           	bge.s 4428 <TestZoom4Picture+0x1460>
  }

  tmp = source;
    4462:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    4468:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    446e:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 7, 1);
    4474:	4878 0001      	pea 1 <_start+0x1>
    4478:	4878 0007      	pea 7 <main+0x1>
    447c:	2f2f 0042      	move.l 66(sp),-(sp)
    4480:	2f2f 006a      	move.l 106(sp),-(sp)
    4484:	4eba d606      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    4488:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    448c:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    4492:	2c40           	movea.l d0,a6
    4494:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4498:	222f 003a      	move.l 58(sp),d1
    449c:	5881           	addq.l #4,d1
    449e:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom8;
    44a2:	2f7c 0001 94d8 	move.l #103640,34(sp)
    44a8:	0022 
  mask = 0xffff;
    44aa:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    44b0:	7000           	moveq #0,d0
    44b2:	302f 01c6      	move.w 454(sp),d0
    44b6:	42a7           	clr.l -(sp)
    44b8:	2f00           	move.l d0,-(sp)
    44ba:	2f2f 01d0      	move.l 464(sp),-(sp)
    44be:	2f2f 002e      	move.l 46(sp),-(sp)
    44c2:	4eba 197a      	jsr 5e3e <TestRow>(pc)
    44c6:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    44ca:	7430           	moveq #48,d2
    44cc:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    44d0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    44d4:	42af 0152      	clr.l 338(sp)
    44d8:	605c           	bra.s 4536 <TestZoom4Picture+0x156e>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    44da:	202f 0152      	move.l 338(sp),d0
    44de:	d080           	add.l d0,d0
    44e0:	2200           	move.l d0,d1
    44e2:	5281           	addq.l #1,d1
    44e4:	7000           	moveq #0,d0
    44e6:	302f 01c6      	move.w 454(sp),d0
    44ea:	2f01           	move.l d1,-(sp)
    44ec:	2f00           	move.l d0,-(sp)
    44ee:	2f2f 01d0      	move.l 464(sp),-(sp)
    44f2:	2f2f 002e      	move.l 46(sp),-(sp)
    44f6:	4eba 1946      	jsr 5e3e <TestRow>(pc)
    44fa:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    44fe:	7030           	moveq #48,d0
    4500:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    4504:	202f 0152      	move.l 338(sp),d0
    4508:	5280           	addq.l #1,d0
    450a:	d080           	add.l d0,d0
    450c:	2200           	move.l d0,d1
    450e:	7000           	moveq #0,d0
    4510:	302f 01c6      	move.w 454(sp),d0
    4514:	2f01           	move.l d1,-(sp)
    4516:	2f00           	move.l d0,-(sp)
    4518:	2f2f 01d0      	move.l 464(sp),-(sp)
    451c:	2f2f 002e      	move.l 46(sp),-(sp)
    4520:	4eba 191c      	jsr 5e3e <TestRow>(pc)
    4524:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4528:	7230           	moveq #48,d1
    452a:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    452e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    4532:	52af 0152      	addq.l #1,338(sp)
    4536:	7404           	moveq #4,d2
    4538:	b4af 0152      	cmp.l 338(sp),d2
    453c:	6c9c           	bge.s 44da <TestZoom4Picture+0x1512>
  }

  for(int i=0;i<9;i++) {
    453e:	42af 014e      	clr.l 334(sp)
    4542:	6000 00f0      	bra.w 4634 <TestZoom4Picture+0x166c>
    for(int i2=0;i2<10;i2++) {  
    4546:	42af 014a      	clr.l 330(sp)
    454a:	6046           	bra.s 4592 <TestZoom4Picture+0x15ca>
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    454c:	307c 000b      	movea.w #11,a0
    4550:	d1ef 014a      	adda.l 330(sp),a0
    4554:	222f 014e      	move.l 334(sp),d1
    4558:	2001           	move.l d1,d0
    455a:	d080           	add.l d0,d0
    455c:	d081           	add.l d1,d0
    455e:	d080           	add.l d0,d0
    4560:	d080           	add.l d0,d0
    4562:	d081           	add.l d1,d0
    4564:	d080           	add.l d0,d0
    4566:	2208           	move.l a0,d1
    4568:	d280           	add.l d0,d1
    456a:	7000           	moveq #0,d0
    456c:	302f 01c6      	move.w 454(sp),d0
    4570:	2f01           	move.l d1,-(sp)
    4572:	2f00           	move.l d0,-(sp)
    4574:	2f2f 01d0      	move.l 464(sp),-(sp)
    4578:	2f2f 002e      	move.l 46(sp),-(sp)
    457c:	4eba 18c0      	jsr 5e3e <TestRow>(pc)
    4580:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4584:	7030           	moveq #48,d0
    4586:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    458a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {  
    458e:	52af 014a      	addq.l #1,330(sp)
    4592:	7209           	moveq #9,d1
    4594:	b2af 014a      	cmp.l 330(sp),d1
    4598:	6cb2           	bge.s 454c <TestZoom4Picture+0x1584>
    }
    for(int i2=0;i2<8;i2++) {
    459a:	42af 0146      	clr.l 326(sp)
    459e:	6000 0086      	bra.w 4626 <TestZoom4Picture+0x165e>
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    45a2:	222f 014e      	move.l 334(sp),d1
    45a6:	2001           	move.l d1,d0
    45a8:	d080           	add.l d0,d0
    45aa:	d081           	add.l d1,d0
    45ac:	d080           	add.l d0,d0
    45ae:	d080           	add.l d0,d0
    45b0:	d081           	add.l d1,d0
    45b2:	d080           	add.l d0,d0
    45b4:	2040           	movea.l d0,a0
    45b6:	41e8 0015      	lea 21(a0),a0
    45ba:	2208           	move.l a0,d1
    45bc:	d2af 0146      	add.l 326(sp),d1
    45c0:	7000           	moveq #0,d0
    45c2:	302f 01c6      	move.w 454(sp),d0
    45c6:	2f01           	move.l d1,-(sp)
    45c8:	2f00           	move.l d0,-(sp)
    45ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    45ce:	2f2f 002e      	move.l 46(sp),-(sp)
    45d2:	4eba 186a      	jsr 5e3e <TestRow>(pc)
    45d6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    45da:	7430           	moveq #48,d2
    45dc:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    45e0:	222f 014e      	move.l 334(sp),d1
    45e4:	2001           	move.l d1,d0
    45e6:	d080           	add.l d0,d0
    45e8:	d081           	add.l d1,d0
    45ea:	d080           	add.l d0,d0
    45ec:	d080           	add.l d0,d0
    45ee:	d081           	add.l d1,d0
    45f0:	d080           	add.l d0,d0
    45f2:	2040           	movea.l d0,a0
    45f4:	41e8 0015      	lea 21(a0),a0
    45f8:	2208           	move.l a0,d1
    45fa:	d2af 0146      	add.l 326(sp),d1
    45fe:	7000           	moveq #0,d0
    4600:	302f 01c6      	move.w 454(sp),d0
    4604:	2f01           	move.l d1,-(sp)
    4606:	2f00           	move.l d0,-(sp)
    4608:	2f2f 01d0      	move.l 464(sp),-(sp)
    460c:	2f2f 002e      	move.l 46(sp),-(sp)
    4610:	4eba 182c      	jsr 5e3e <TestRow>(pc)
    4614:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4618:	7030           	moveq #48,d0
    461a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    461e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {
    4622:	52af 0146      	addq.l #1,326(sp)
    4626:	7207           	moveq #7,d1
    4628:	b2af 0146      	cmp.l 326(sp),d1
    462c:	6c00 ff74      	bge.w 45a2 <TestZoom4Picture+0x15da>
  for(int i=0;i<9;i++) {
    4630:	52af 014e      	addq.l #1,334(sp)
    4634:	7408           	moveq #8,d2
    4636:	b4af 014e      	cmp.l 334(sp),d2
    463a:	6c00 ff0a      	bge.w 4546 <TestZoom4Picture+0x157e>
    }
  }

  for(int i2=0;i2<10;i2++) {  
    463e:	42af 0142      	clr.l 322(sp)
    4642:	6032           	bra.s 4676 <TestZoom4Picture+0x16ae>
    TestRow( valsupposed, valactual, mask, 245+i2);
    4644:	222f 0142      	move.l 322(sp),d1
    4648:	0681 0000 00f5 	addi.l #245,d1
    464e:	7000           	moveq #0,d0
    4650:	302f 01c6      	move.w 454(sp),d0
    4654:	2f01           	move.l d1,-(sp)
    4656:	2f00           	move.l d0,-(sp)
    4658:	2f2f 01d0      	move.l 464(sp),-(sp)
    465c:	2f2f 002e      	move.l 46(sp),-(sp)
    4660:	4eba 17dc      	jsr 5e3e <TestRow>(pc)
    4664:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4668:	7030           	moveq #48,d0
    466a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    466e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {  
    4672:	52af 0142      	addq.l #1,322(sp)
    4676:	7209           	moveq #9,d1
    4678:	b2af 0142      	cmp.l 322(sp),d1
    467c:	6cc6           	bge.s 4644 <TestZoom4Picture+0x167c>
  }
  for(int i=0;i<7;i++) {
    467e:	42af 013e      	clr.l 318(sp)
    4682:	6064           	bra.s 46e8 <TestZoom4Picture+0x1720>
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    4684:	202f 013e      	move.l 318(sp),d0
    4688:	d080           	add.l d0,d0
    468a:	2200           	move.l d0,d1
    468c:	0681 0000 00ff 	addi.l #255,d1
    4692:	7000           	moveq #0,d0
    4694:	302f 01c6      	move.w 454(sp),d0
    4698:	2f01           	move.l d1,-(sp)
    469a:	2f00           	move.l d0,-(sp)
    469c:	2f2f 01d0      	move.l 464(sp),-(sp)
    46a0:	2f2f 002e      	move.l 46(sp),-(sp)
    46a4:	4eba 1798      	jsr 5e3e <TestRow>(pc)
    46a8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46ac:	7430           	moveq #48,d2
    46ae:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 256+i*2);
    46b2:	202f 013e      	move.l 318(sp),d0
    46b6:	0680 0000 0080 	addi.l #128,d0
    46bc:	d080           	add.l d0,d0
    46be:	2200           	move.l d0,d1
    46c0:	7000           	moveq #0,d0
    46c2:	302f 01c6      	move.w 454(sp),d0
    46c6:	2f01           	move.l d1,-(sp)
    46c8:	2f00           	move.l d0,-(sp)
    46ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    46ce:	2f2f 002e      	move.l 46(sp),-(sp)
    46d2:	4eba 176a      	jsr 5e3e <TestRow>(pc)
    46d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    46da:	7030           	moveq #48,d0
    46dc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    46e0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<7;i++) {
    46e4:	52af 013e      	addq.l #1,318(sp)
    46e8:	7206           	moveq #6,d1
    46ea:	b2af 013e      	cmp.l 318(sp),d1
    46ee:	6c94           	bge.s 4684 <TestZoom4Picture+0x16bc>
  }
  TestRow( valsupposed, valactual, mask, 269);
    46f0:	7000           	moveq #0,d0
    46f2:	302f 01c6      	move.w 454(sp),d0
    46f6:	4878 010d      	pea 10d <main+0x107>
    46fa:	2f00           	move.l d0,-(sp)
    46fc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4700:	2f2f 002e      	move.l 46(sp),-(sp)
    4704:	4eba 1738      	jsr 5e3e <TestRow>(pc)
    4708:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    470c:	7430           	moveq #48,d2
    470e:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    4712:	466f 01c6      	not.w 454(sp)
 
  tmp = source;
    4716:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    471c:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4722:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 8, 1);
    4728:	4878 0001      	pea 1 <_start+0x1>
    472c:	4878 0008      	pea 8 <main+0x2>
    4730:	2f2f 0042      	move.l 66(sp),-(sp)
    4734:	2f2f 006a      	move.l 106(sp),-(sp)
    4738:	4eba d352      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    473c:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4740:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    4746:	2c40           	movea.l d0,a6
    4748:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    474c:	202f 003a      	move.l 58(sp),d0
    4750:	5880           	addq.l #4,d0
    4752:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom9;
    4756:	2f7c 0001 9504 	move.l #103684,34(sp)
    475c:	0022 
  mask = 0x0000;
    475e:	426f 01c6      	clr.w 454(sp)
 
  TestRow( valsupposed, valactual, mask, 0);
    4762:	7000           	moveq #0,d0
    4764:	302f 01c6      	move.w 454(sp),d0
    4768:	42a7           	clr.l -(sp)
    476a:	2f00           	move.l d0,-(sp)
    476c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4770:	2f2f 002e      	move.l 46(sp),-(sp)
    4774:	4eba 16c8      	jsr 5e3e <TestRow>(pc)
    4778:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    477c:	7230           	moveq #48,d1
    477e:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    4782:	466f 01c6      	not.w 454(sp)
  
  for(int i=0;i<3;i++) {
    4786:	42af 013a      	clr.l 314(sp)
    478a:	605c           	bra.s 47e8 <TestZoom4Picture+0x1820>
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    478c:	202f 013a      	move.l 314(sp),d0
    4790:	d080           	add.l d0,d0
    4792:	2200           	move.l d0,d1
    4794:	5281           	addq.l #1,d1
    4796:	7000           	moveq #0,d0
    4798:	302f 01c6      	move.w 454(sp),d0
    479c:	2f01           	move.l d1,-(sp)
    479e:	2f00           	move.l d0,-(sp)
    47a0:	2f2f 01d0      	move.l 464(sp),-(sp)
    47a4:	2f2f 002e      	move.l 46(sp),-(sp)
    47a8:	4eba 1694      	jsr 5e3e <TestRow>(pc)
    47ac:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47b0:	7430           	moveq #48,d2
    47b2:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    47b6:	202f 013a      	move.l 314(sp),d0
    47ba:	5280           	addq.l #1,d0
    47bc:	d080           	add.l d0,d0
    47be:	2200           	move.l d0,d1
    47c0:	7000           	moveq #0,d0
    47c2:	302f 01c6      	move.w 454(sp),d0
    47c6:	2f01           	move.l d1,-(sp)
    47c8:	2f00           	move.l d0,-(sp)
    47ca:	2f2f 01d0      	move.l 464(sp),-(sp)
    47ce:	2f2f 002e      	move.l 46(sp),-(sp)
    47d2:	4eba 166a      	jsr 5e3e <TestRow>(pc)
    47d6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    47da:	7030           	moveq #48,d0
    47dc:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    47e0:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    47e4:	52af 013a      	addq.l #1,314(sp)
    47e8:	7202           	moveq #2,d1
    47ea:	b2af 013a      	cmp.l 314(sp),d1
    47ee:	6c9c           	bge.s 478c <TestZoom4Picture+0x17c4>
  }

  for(int i=0;i<9;i++) {
    47f0:	42af 0136      	clr.l 310(sp)
    47f4:	6000 00ea      	bra.w 48e0 <TestZoom4Picture+0x1918>
    for(int i2=0;i2<9;i2++) {  
    47f8:	42af 0132      	clr.l 306(sp)
    47fc:	6044           	bra.s 4842 <TestZoom4Picture+0x187a>
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    47fe:	307c 000b      	movea.w #11,a0
    4802:	d1ef 0132      	adda.l 306(sp),a0
    4806:	222f 0136      	move.l 310(sp),d1
    480a:	2001           	move.l d1,d0
    480c:	d080           	add.l d0,d0
    480e:	d081           	add.l d1,d0
    4810:	2200           	move.l d0,d1
    4812:	e789           	lsl.l #3,d1
    4814:	d081           	add.l d1,d0
    4816:	2208           	move.l a0,d1
    4818:	d280           	add.l d0,d1
    481a:	7000           	moveq #0,d0
    481c:	302f 01c6      	move.w 454(sp),d0
    4820:	2f01           	move.l d1,-(sp)
    4822:	2f00           	move.l d0,-(sp)
    4824:	2f2f 01d0      	move.l 464(sp),-(sp)
    4828:	2f2f 002e      	move.l 46(sp),-(sp)
    482c:	4eba 1610      	jsr 5e3e <TestRow>(pc)
    4830:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4834:	7430           	moveq #48,d2
    4836:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    483a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {  
    483e:	52af 0132      	addq.l #1,306(sp)
    4842:	7008           	moveq #8,d0
    4844:	b0af 0132      	cmp.l 306(sp),d0
    4848:	6cb4           	bge.s 47fe <TestZoom4Picture+0x1836>
    }
    
    for(int i2=0;i2<9;i2++) {
    484a:	42af 012e      	clr.l 302(sp)
    484e:	6000 0082      	bra.w 48d2 <TestZoom4Picture+0x190a>
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    4852:	222f 0136      	move.l 310(sp),d1
    4856:	2001           	move.l d1,d0
    4858:	d080           	add.l d0,d0
    485a:	d081           	add.l d1,d0
    485c:	2200           	move.l d0,d1
    485e:	e789           	lsl.l #3,d1
    4860:	2040           	movea.l d0,a0
    4862:	d1c1           	adda.l d1,a0
    4864:	41e8 0014      	lea 20(a0),a0
    4868:	2208           	move.l a0,d1
    486a:	d2af 012e      	add.l 302(sp),d1
    486e:	7000           	moveq #0,d0
    4870:	302f 01c6      	move.w 454(sp),d0
    4874:	2f01           	move.l d1,-(sp)
    4876:	2f00           	move.l d0,-(sp)
    4878:	2f2f 01d0      	move.l 464(sp),-(sp)
    487c:	2f2f 002e      	move.l 46(sp),-(sp)
    4880:	4eba 15bc      	jsr 5e3e <TestRow>(pc)
    4884:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4888:	7230           	moveq #48,d1
    488a:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    488e:	222f 0136      	move.l 310(sp),d1
    4892:	2001           	move.l d1,d0
    4894:	d080           	add.l d0,d0
    4896:	d081           	add.l d1,d0
    4898:	2200           	move.l d0,d1
    489a:	e789           	lsl.l #3,d1
    489c:	2040           	movea.l d0,a0
    489e:	d1c1           	adda.l d1,a0
    48a0:	41e8 0015      	lea 21(a0),a0
    48a4:	2208           	move.l a0,d1
    48a6:	d2af 012e      	add.l 302(sp),d1
    48aa:	7000           	moveq #0,d0
    48ac:	302f 01c6      	move.w 454(sp),d0
    48b0:	2f01           	move.l d1,-(sp)
    48b2:	2f00           	move.l d0,-(sp)
    48b4:	2f2f 01d0      	move.l 464(sp),-(sp)
    48b8:	2f2f 002e      	move.l 46(sp),-(sp)
    48bc:	4eba 1580      	jsr 5e3e <TestRow>(pc)
    48c0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    48c4:	7430           	moveq #48,d2
    48c6:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    48ca:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<9;i2++) {
    48ce:	52af 012e      	addq.l #1,302(sp)
    48d2:	7008           	moveq #8,d0
    48d4:	b0af 012e      	cmp.l 302(sp),d0
    48d8:	6c00 ff78      	bge.w 4852 <TestZoom4Picture+0x188a>
  for(int i=0;i<9;i++) {
    48dc:	52af 0136      	addq.l #1,310(sp)
    48e0:	7208           	moveq #8,d1
    48e2:	b2af 0136      	cmp.l 310(sp),d1
    48e6:	6c00 ff10      	bge.w 47f8 <TestZoom4Picture+0x1830>
    }
  }

  for(int i2=0;i2<9;i2++) {  
    48ea:	42af 012a      	clr.l 298(sp)
    48ee:	6032           	bra.s 4922 <TestZoom4Picture+0x195a>
    TestRow( valsupposed, valactual, mask, 245+i2);
    48f0:	222f 012a      	move.l 298(sp),d1
    48f4:	0681 0000 00f5 	addi.l #245,d1
    48fa:	7000           	moveq #0,d0
    48fc:	302f 01c6      	move.w 454(sp),d0
    4900:	2f01           	move.l d1,-(sp)
    4902:	2f00           	move.l d0,-(sp)
    4904:	2f2f 01d0      	move.l 464(sp),-(sp)
    4908:	2f2f 002e      	move.l 46(sp),-(sp)
    490c:	4eba 1530      	jsr 5e3e <TestRow>(pc)
    4910:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4914:	7430           	moveq #48,d2
    4916:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    491a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {  
    491e:	52af 012a      	addq.l #1,298(sp)
    4922:	7008           	moveq #8,d0
    4924:	b0af 012a      	cmp.l 298(sp),d0
    4928:	6cc6           	bge.s 48f0 <TestZoom4Picture+0x1928>
  }
  for(int i=0;i<5;i++) {
    492a:	42af 0126      	clr.l 294(sp)
    492e:	6064           	bra.s 4994 <TestZoom4Picture+0x19cc>
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    4930:	202f 0126      	move.l 294(sp),d0
    4934:	d080           	add.l d0,d0
    4936:	2200           	move.l d0,d1
    4938:	0681 0000 0103 	addi.l #259,d1
    493e:	7000           	moveq #0,d0
    4940:	302f 01c6      	move.w 454(sp),d0
    4944:	2f01           	move.l d1,-(sp)
    4946:	2f00           	move.l d0,-(sp)
    4948:	2f2f 01d0      	move.l 464(sp),-(sp)
    494c:	2f2f 002e      	move.l 46(sp),-(sp)
    4950:	4eba 14ec      	jsr 5e3e <TestRow>(pc)
    4954:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4958:	7230           	moveq #48,d1
    495a:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 260+i*2);
    495e:	202f 0126      	move.l 294(sp),d0
    4962:	0680 0000 0082 	addi.l #130,d0
    4968:	d080           	add.l d0,d0
    496a:	2200           	move.l d0,d1
    496c:	7000           	moveq #0,d0
    496e:	302f 01c6      	move.w 454(sp),d0
    4972:	2f01           	move.l d1,-(sp)
    4974:	2f00           	move.l d0,-(sp)
    4976:	2f2f 01d0      	move.l 464(sp),-(sp)
    497a:	2f2f 002e      	move.l 46(sp),-(sp)
    497e:	4eba 14be      	jsr 5e3e <TestRow>(pc)
    4982:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4986:	7430           	moveq #48,d2
    4988:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    498c:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<5;i++) {
    4990:	52af 0126      	addq.l #1,294(sp)
    4994:	7004           	moveq #4,d0
    4996:	b0af 0126      	cmp.l 294(sp),d0
    499a:	6c94           	bge.s 4930 <TestZoom4Picture+0x1968>
  }
  TestRow( valsupposed, valactual, mask, 269);
    499c:	7000           	moveq #0,d0
    499e:	302f 01c6      	move.w 454(sp),d0
    49a2:	4878 010d      	pea 10d <main+0x107>
    49a6:	2f00           	move.l d0,-(sp)
    49a8:	2f2f 01d0      	move.l 464(sp),-(sp)
    49ac:	2f2f 002e      	move.l 46(sp),-(sp)
    49b0:	4eba 148c      	jsr 5e3e <TestRow>(pc)
    49b4:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    49b8:	7230           	moveq #48,d1
    49ba:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    49be:	466f 01c6      	not.w 454(sp)

  tmp = source;
    49c2:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    49c8:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    49ce:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 9, 1);
    49d4:	4878 0001      	pea 1 <_start+0x1>
    49d8:	4878 0009      	pea 9 <main+0x3>
    49dc:	2f2f 0042      	move.l 66(sp),-(sp)
    49e0:	2f2f 006a      	move.l 106(sp),-(sp)
    49e4:	4eba d0a6      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    49e8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    49ec:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    49f2:	2c40           	movea.l d0,a6
    49f4:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    49f8:	242f 003a      	move.l 58(sp),d2
    49fc:	5882           	addq.l #4,d2
    49fe:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom10;
    4a02:	2f7c 0001 9530 	move.l #103728,34(sp)
    4a08:	0022 

  mask = 0xffff;
    4a0a:	3f7c ffff 01c6 	move.w #-1,454(sp)
  TestRow( valsupposed, valactual, mask, 0);
    4a10:	7000           	moveq #0,d0
    4a12:	302f 01c6      	move.w 454(sp),d0
    4a16:	42a7           	clr.l -(sp)
    4a18:	2f00           	move.l d0,-(sp)
    4a1a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a1e:	2f2f 002e      	move.l 46(sp),-(sp)
    4a22:	4eba 141a      	jsr 5e3e <TestRow>(pc)
    4a26:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a2a:	7030           	moveq #48,d0
    4a2c:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    4a30:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 1);   
    4a34:	7000           	moveq #0,d0
    4a36:	302f 01c6      	move.w 454(sp),d0
    4a3a:	4878 0001      	pea 1 <_start+0x1>
    4a3e:	2f00           	move.l d0,-(sp)
    4a40:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a44:	2f2f 002e      	move.l 46(sp),-(sp)
    4a48:	4eba 13f4      	jsr 5e3e <TestRow>(pc)
    4a4c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a50:	7230           	moveq #48,d1
    4a52:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 2);
    4a56:	7000           	moveq #0,d0
    4a58:	302f 01c6      	move.w 454(sp),d0
    4a5c:	4878 0002      	pea 2 <_start+0x2>
    4a60:	2f00           	move.l d0,-(sp)
    4a62:	2f2f 01d0      	move.l 464(sp),-(sp)
    4a66:	2f2f 002e      	move.l 46(sp),-(sp)
    4a6a:	4eba 13d2      	jsr 5e3e <TestRow>(pc)
    4a6e:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4a72:	7430           	moveq #48,d2
    4a74:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    4a78:	466f 01c6      	not.w 454(sp)

  for(int i=0;i<9;i++) {
    4a7c:	42af 0122      	clr.l 290(sp)
    4a80:	6000 00e0      	bra.w 4b62 <TestZoom4Picture+0x1b9a>
    for(int i2=0;i2<8;i2++) {  
    4a84:	42af 011e      	clr.l 286(sp)
    4a88:	6040           	bra.s 4aca <TestZoom4Picture+0x1b02>
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    4a8a:	206f 011e      	movea.l 286(sp),a0
    4a8e:	5688           	addq.l #3,a0
    4a90:	222f 0122      	move.l 290(sp),d1
    4a94:	2001           	move.l d1,d0
    4a96:	e788           	lsl.l #3,d0
    4a98:	9081           	sub.l d1,d0
    4a9a:	d080           	add.l d0,d0
    4a9c:	d080           	add.l d0,d0
    4a9e:	2208           	move.l a0,d1
    4aa0:	d280           	add.l d0,d1
    4aa2:	7000           	moveq #0,d0
    4aa4:	302f 01c6      	move.w 454(sp),d0
    4aa8:	2f01           	move.l d1,-(sp)
    4aaa:	2f00           	move.l d0,-(sp)
    4aac:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ab0:	2f2f 002e      	move.l 46(sp),-(sp)
    4ab4:	4eba 1388      	jsr 5e3e <TestRow>(pc)
    4ab8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4abc:	7030           	moveq #48,d0
    4abe:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4ac2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<8;i2++) {  
    4ac6:	52af 011e      	addq.l #1,286(sp)
    4aca:	7207           	moveq #7,d1
    4acc:	b2af 011e      	cmp.l 286(sp),d1
    4ad0:	6cb8           	bge.s 4a8a <TestZoom4Picture+0x1ac2>
    }
    
    for(int i2=0;i2<10;i2++) {
    4ad2:	42af 011a      	clr.l 282(sp)
    4ad6:	607c           	bra.s 4b54 <TestZoom4Picture+0x1b8c>
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    4ad8:	222f 0122      	move.l 290(sp),d1
    4adc:	2001           	move.l d1,d0
    4ade:	e788           	lsl.l #3,d0
    4ae0:	9081           	sub.l d1,d0
    4ae2:	d080           	add.l d0,d0
    4ae4:	d080           	add.l d0,d0
    4ae6:	2040           	movea.l d0,a0
    4ae8:	41e8 000b      	lea 11(a0),a0
    4aec:	2208           	move.l a0,d1
    4aee:	d2af 011a      	add.l 282(sp),d1
    4af2:	7000           	moveq #0,d0
    4af4:	302f 01c6      	move.w 454(sp),d0
    4af8:	2f01           	move.l d1,-(sp)
    4afa:	2f00           	move.l d0,-(sp)
    4afc:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b00:	2f2f 002e      	move.l 46(sp),-(sp)
    4b04:	4eba 1338      	jsr 5e3e <TestRow>(pc)
    4b08:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4b0c:	7430           	moveq #48,d2
    4b0e:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    4b12:	222f 0122      	move.l 290(sp),d1
    4b16:	2001           	move.l d1,d0
    4b18:	e788           	lsl.l #3,d0
    4b1a:	9081           	sub.l d1,d0
    4b1c:	d080           	add.l d0,d0
    4b1e:	d080           	add.l d0,d0
    4b20:	2040           	movea.l d0,a0
    4b22:	41e8 000b      	lea 11(a0),a0
    4b26:	2208           	move.l a0,d1
    4b28:	d2af 011a      	add.l 282(sp),d1
    4b2c:	7000           	moveq #0,d0
    4b2e:	302f 01c6      	move.w 454(sp),d0
    4b32:	2f01           	move.l d1,-(sp)
    4b34:	2f00           	move.l d0,-(sp)
    4b36:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b3a:	2f2f 002e      	move.l 46(sp),-(sp)
    4b3e:	4eba 12fe      	jsr 5e3e <TestRow>(pc)
    4b42:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4b46:	7030           	moveq #48,d0
    4b48:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4b4c:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<10;i2++) {
    4b50:	52af 011a      	addq.l #1,282(sp)
    4b54:	7209           	moveq #9,d1
    4b56:	b2af 011a      	cmp.l 282(sp),d1
    4b5a:	6c00 ff7c      	bge.w 4ad8 <TestZoom4Picture+0x1b10>
  for(int i=0;i<9;i++) {
    4b5e:	52af 0122      	addq.l #1,290(sp)
    4b62:	7408           	moveq #8,d2
    4b64:	b4af 0122      	cmp.l 290(sp),d2
    4b68:	6c00 ff1a      	bge.w 4a84 <TestZoom4Picture+0x1abc>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    4b6c:	42af 0116      	clr.l 278(sp)
    4b70:	6032           	bra.s 4ba4 <TestZoom4Picture+0x1bdc>
    TestRow( valsupposed, valactual, mask, 255+i2);
    4b72:	222f 0116      	move.l 278(sp),d1
    4b76:	0681 0000 00ff 	addi.l #255,d1
    4b7c:	7000           	moveq #0,d0
    4b7e:	302f 01c6      	move.w 454(sp),d0
    4b82:	2f01           	move.l d1,-(sp)
    4b84:	2f00           	move.l d0,-(sp)
    4b86:	2f2f 01d0      	move.l 464(sp),-(sp)
    4b8a:	2f2f 002e      	move.l 46(sp),-(sp)
    4b8e:	4eba 12ae      	jsr 5e3e <TestRow>(pc)
    4b92:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4b96:	7030           	moveq #48,d0
    4b98:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4b9c:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {  
    4ba0:	52af 0116      	addq.l #1,278(sp)
    4ba4:	7207           	moveq #7,d1
    4ba6:	b2af 0116      	cmp.l 278(sp),d1
    4baa:	6cc6           	bge.s 4b72 <TestZoom4Picture+0x1baa>
  }
  for(int i=0;i<3;i++) {
    4bac:	42af 0112      	clr.l 274(sp)
    4bb0:	6064           	bra.s 4c16 <TestZoom4Picture+0x1c4e>
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    4bb2:	202f 0112      	move.l 274(sp),d0
    4bb6:	d080           	add.l d0,d0
    4bb8:	2200           	move.l d0,d1
    4bba:	0681 0000 0107 	addi.l #263,d1
    4bc0:	7000           	moveq #0,d0
    4bc2:	302f 01c6      	move.w 454(sp),d0
    4bc6:	2f01           	move.l d1,-(sp)
    4bc8:	2f00           	move.l d0,-(sp)
    4bca:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bce:	2f2f 002e      	move.l 46(sp),-(sp)
    4bd2:	4eba 126a      	jsr 5e3e <TestRow>(pc)
    4bd6:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4bda:	7430           	moveq #48,d2
    4bdc:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 264+i*2);
    4be0:	202f 0112      	move.l 274(sp),d0
    4be4:	0680 0000 0084 	addi.l #132,d0
    4bea:	d080           	add.l d0,d0
    4bec:	2200           	move.l d0,d1
    4bee:	7000           	moveq #0,d0
    4bf0:	302f 01c6      	move.w 454(sp),d0
    4bf4:	2f01           	move.l d1,-(sp)
    4bf6:	2f00           	move.l d0,-(sp)
    4bf8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4bfc:	2f2f 002e      	move.l 46(sp),-(sp)
    4c00:	4eba 123c      	jsr 5e3e <TestRow>(pc)
    4c04:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c08:	7030           	moveq #48,d0
    4c0a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c0e:	466f 01c6      	not.w 454(sp)
  for(int i=0;i<3;i++) {
    4c12:	52af 0112      	addq.l #1,274(sp)
    4c16:	7202           	moveq #2,d1
    4c18:	b2af 0112      	cmp.l 274(sp),d1
    4c1c:	6c94           	bge.s 4bb2 <TestZoom4Picture+0x1bea>
  }

  tmp = source;
    4c1e:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    4c24:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4c2a:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 10, 1);
    4c30:	4878 0001      	pea 1 <_start+0x1>
    4c34:	4878 000a      	pea a <main+0x4>
    4c38:	2f2f 0042      	move.l 66(sp),-(sp)
    4c3c:	2f2f 006a      	move.l 106(sp),-(sp)
    4c40:	4eba ce4a      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    4c44:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4c48:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    4c4e:	2c40           	movea.l d0,a6
    4c50:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4c54:	242f 003a      	move.l 58(sp),d2
    4c58:	5882           	addq.l #4,d2
    4c5a:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom11;
    4c5e:	2f7c 0001 955c 	move.l #103772,34(sp)
    4c64:	0022 

  mask = 0xffff;
    4c66:	3f7c ffff 01c6 	move.w #-1,454(sp)
 
  for(int i2=0;i2<6;i2++) {  
    4c6c:	42af 010e      	clr.l 270(sp)
    4c70:	602a           	bra.s 4c9c <TestZoom4Picture+0x1cd4>
    TestRow( valsupposed, valactual, mask, i2);
    4c72:	7000           	moveq #0,d0
    4c74:	302f 01c6      	move.w 454(sp),d0
    4c78:	2f2f 010e      	move.l 270(sp),-(sp)
    4c7c:	2f00           	move.l d0,-(sp)
    4c7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4c82:	2f2f 002e      	move.l 46(sp),-(sp)
    4c86:	4eba 11b6      	jsr 5e3e <TestRow>(pc)
    4c8a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4c8e:	7030           	moveq #48,d0
    4c90:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4c94:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {  
    4c98:	52af 010e      	addq.l #1,270(sp)
    4c9c:	7205           	moveq #5,d1
    4c9e:	b2af 010e      	cmp.l 270(sp),d1
    4ca2:	6cce           	bge.s 4c72 <TestZoom4Picture+0x1caa>
  }

  for(int i2=0;i2<11;i2++) {
    4ca4:	42af 010a      	clr.l 266(sp)
    4ca8:	605c           	bra.s 4d06 <TestZoom4Picture+0x1d3e>
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    4caa:	202f 010a      	move.l 266(sp),d0
    4cae:	5680           	addq.l #3,d0
    4cb0:	d080           	add.l d0,d0
    4cb2:	2200           	move.l d0,d1
    4cb4:	7000           	moveq #0,d0
    4cb6:	302f 01c6      	move.w 454(sp),d0
    4cba:	2f01           	move.l d1,-(sp)
    4cbc:	2f00           	move.l d0,-(sp)
    4cbe:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cc2:	2f2f 002e      	move.l 46(sp),-(sp)
    4cc6:	4eba 1176      	jsr 5e3e <TestRow>(pc)
    4cca:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cce:	7430           	moveq #48,d2
    4cd0:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    4cd4:	202f 010a      	move.l 266(sp),d0
    4cd8:	d080           	add.l d0,d0
    4cda:	2200           	move.l d0,d1
    4cdc:	5e81           	addq.l #7,d1
    4cde:	7000           	moveq #0,d0
    4ce0:	302f 01c6      	move.w 454(sp),d0
    4ce4:	2f01           	move.l d1,-(sp)
    4ce6:	2f00           	move.l d0,-(sp)
    4ce8:	2f2f 01d0      	move.l 464(sp),-(sp)
    4cec:	2f2f 002e      	move.l 46(sp),-(sp)
    4cf0:	4eba 114c      	jsr 5e3e <TestRow>(pc)
    4cf4:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4cf8:	7030           	moveq #48,d0
    4cfa:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    4cfe:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    4d02:	52af 010a      	addq.l #1,266(sp)
    4d06:	720a           	moveq #10,d1
    4d08:	b2af 010a      	cmp.l 266(sp),d1
    4d0c:	6c9c           	bge.s 4caa <TestZoom4Picture+0x1ce2>
  }

  for(int i=0;i<8;i++) {
    4d0e:	42af 0106      	clr.l 262(sp)
    4d12:	6000 00f2      	bra.w 4e06 <TestZoom4Picture+0x1e3e>
    for(int i2=0;i2<7;i2++) {  
    4d16:	42af 0102      	clr.l 258(sp)
    4d1a:	6044           	bra.s 4d60 <TestZoom4Picture+0x1d98>
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    4d1c:	307c 001c      	movea.w #28,a0
    4d20:	d1ef 0102      	adda.l 258(sp),a0
    4d24:	222f 0106      	move.l 262(sp),d1
    4d28:	2001           	move.l d1,d0
    4d2a:	e788           	lsl.l #3,d0
    4d2c:	9081           	sub.l d1,d0
    4d2e:	d080           	add.l d0,d0
    4d30:	d080           	add.l d0,d0
    4d32:	d081           	add.l d1,d0
    4d34:	2208           	move.l a0,d1
    4d36:	d280           	add.l d0,d1
    4d38:	7000           	moveq #0,d0
    4d3a:	302f 01c6      	move.w 454(sp),d0
    4d3e:	2f01           	move.l d1,-(sp)
    4d40:	2f00           	move.l d0,-(sp)
    4d42:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d46:	2f2f 002e      	move.l 46(sp),-(sp)
    4d4a:	4eba 10f2      	jsr 5e3e <TestRow>(pc)
    4d4e:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4d52:	7430           	moveq #48,d2
    4d54:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    4d58:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<7;i2++) {  
    4d5c:	52af 0102      	addq.l #1,258(sp)
    4d60:	7006           	moveq #6,d0
    4d62:	b0af 0102      	cmp.l 258(sp),d0
    4d66:	6cb4           	bge.s 4d1c <TestZoom4Picture+0x1d54>
    }
    
    for(int i2=0;i2<11;i2++) {
    4d68:	42af 00fe      	clr.l 254(sp)
    4d6c:	6000 008a      	bra.w 4df8 <TestZoom4Picture+0x1e30>
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    4d70:	222f 0106      	move.l 262(sp),d1
    4d74:	2001           	move.l d1,d0
    4d76:	e788           	lsl.l #3,d0
    4d78:	9081           	sub.l d1,d0
    4d7a:	d080           	add.l d0,d0
    4d7c:	d080           	add.l d0,d0
    4d7e:	2040           	movea.l d0,a0
    4d80:	d1c1           	adda.l d1,a0
    4d82:	41e8 0023      	lea 35(a0),a0
    4d86:	202f 00fe      	move.l 254(sp),d0
    4d8a:	d080           	add.l d0,d0
    4d8c:	2208           	move.l a0,d1
    4d8e:	d280           	add.l d0,d1
    4d90:	7000           	moveq #0,d0
    4d92:	302f 01c6      	move.w 454(sp),d0
    4d96:	2f01           	move.l d1,-(sp)
    4d98:	2f00           	move.l d0,-(sp)
    4d9a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4d9e:	2f2f 002e      	move.l 46(sp),-(sp)
    4da2:	4eba 109a      	jsr 5e3e <TestRow>(pc)
    4da6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4daa:	7230           	moveq #48,d1
    4dac:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    4db0:	222f 0106      	move.l 262(sp),d1
    4db4:	2001           	move.l d1,d0
    4db6:	e788           	lsl.l #3,d0
    4db8:	9081           	sub.l d1,d0
    4dba:	d080           	add.l d0,d0
    4dbc:	d080           	add.l d0,d0
    4dbe:	2040           	movea.l d0,a0
    4dc0:	d1c1           	adda.l d1,a0
    4dc2:	41e8 000b      	lea 11(a0),a0
    4dc6:	202f 00fe      	move.l 254(sp),d0
    4dca:	d080           	add.l d0,d0
    4dcc:	2208           	move.l a0,d1
    4dce:	d280           	add.l d0,d1
    4dd0:	7000           	moveq #0,d0
    4dd2:	302f 01c6      	move.w 454(sp),d0
    4dd6:	2f01           	move.l d1,-(sp)
    4dd8:	2f00           	move.l d0,-(sp)
    4dda:	2f2f 01d0      	move.l 464(sp),-(sp)
    4dde:	2f2f 002e      	move.l 46(sp),-(sp)
    4de2:	4eba 105a      	jsr 5e3e <TestRow>(pc)
    4de6:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4dea:	7430           	moveq #48,d2
    4dec:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    4df0:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<11;i2++) {
    4df4:	52af 00fe      	addq.l #1,254(sp)
    4df8:	700a           	moveq #10,d0
    4dfa:	b0af 00fe      	cmp.l 254(sp),d0
    4dfe:	6c00 ff70      	bge.w 4d70 <TestZoom4Picture+0x1da8>
  for(int i=0;i<8;i++) {
    4e02:	52af 0106      	addq.l #1,262(sp)
    4e06:	7207           	moveq #7,d1
    4e08:	b2af 0106      	cmp.l 262(sp),d1
    4e0c:	6c00 ff08      	bge.w 4d16 <TestZoom4Picture+0x1d4e>
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    4e10:	42af 00fa      	clr.l 250(sp)
    4e14:	6032           	bra.s 4e48 <TestZoom4Picture+0x1e80>
    TestRow( valsupposed, valactual, mask, 260+i2);
    4e16:	222f 00fa      	move.l 250(sp),d1
    4e1a:	0681 0000 0104 	addi.l #260,d1
    4e20:	7000           	moveq #0,d0
    4e22:	302f 01c6      	move.w 454(sp),d0
    4e26:	2f01           	move.l d1,-(sp)
    4e28:	2f00           	move.l d0,-(sp)
    4e2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e2e:	2f2f 002e      	move.l 46(sp),-(sp)
    4e32:	4eba 100a      	jsr 5e3e <TestRow>(pc)
    4e36:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4e3a:	7430           	moveq #48,d2
    4e3c:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    4e40:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {  
    4e44:	52af 00fa      	addq.l #1,250(sp)
    4e48:	7006           	moveq #6,d0
    4e4a:	b0af 00fa      	cmp.l 250(sp),d0
    4e4e:	6cc6           	bge.s 4e16 <TestZoom4Picture+0x1e4e>
  }
  TestRow( valsupposed, valactual, mask, 267);   
    4e50:	7000           	moveq #0,d0
    4e52:	302f 01c6      	move.w 454(sp),d0
    4e56:	4878 010b      	pea 10b <main+0x105>
    4e5a:	2f00           	move.l d0,-(sp)
    4e5c:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e60:	2f2f 002e      	move.l 46(sp),-(sp)
    4e64:	4eba 0fd8      	jsr 5e3e <TestRow>(pc)
    4e68:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4e6c:	7230           	moveq #48,d1
    4e6e:	d3af 01c8      	add.l d1,456(sp)
  TestRow( valsupposed, valactual, mask, 268);
    4e72:	7000           	moveq #0,d0
    4e74:	302f 01c6      	move.w 454(sp),d0
    4e78:	4878 010c      	pea 10c <main+0x106>
    4e7c:	2f00           	move.l d0,-(sp)
    4e7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4e82:	2f2f 002e      	move.l 46(sp),-(sp)
    4e86:	4eba 0fb6      	jsr 5e3e <TestRow>(pc)
    4e8a:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4e8e:	7430           	moveq #48,d2
    4e90:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    4e94:	466f 01c6      	not.w 454(sp)
  TestRow( valsupposed, valactual, mask, 269);
    4e98:	7000           	moveq #0,d0
    4e9a:	302f 01c6      	move.w 454(sp),d0
    4e9e:	4878 010d      	pea 10d <main+0x107>
    4ea2:	2f00           	move.l d0,-(sp)
    4ea4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4ea8:	2f2f 002e      	move.l 46(sp),-(sp)
    4eac:	4eba 0f90      	jsr 5e3e <TestRow>(pc)
    4eb0:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4eb4:	7030           	moveq #48,d0
    4eb6:	d1af 01c8      	add.l d0,456(sp)
  
  tmp = source;
    4eba:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    4ec0:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    4ec6:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 11, 1);
    4ecc:	4878 0001      	pea 1 <_start+0x1>
    4ed0:	4878 000b      	pea b <main+0x5>
    4ed4:	2f2f 0042      	move.l 66(sp),-(sp)
    4ed8:	2f2f 006a      	move.l 106(sp),-(sp)
    4edc:	4eba cbae      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    4ee0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    4ee4:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    4eea:	2c40           	movea.l d0,a6
    4eec:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    4ef0:	222f 003a      	move.l 58(sp),d1
    4ef4:	5881           	addq.l #4,d1
    4ef6:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom12;
    4efa:	2f7c 0001 9588 	move.l #103816,34(sp)
    4f00:	0022 

  mask = 0x0;
    4f02:	426f 01c6      	clr.w 454(sp)
   
  TestRow( valsupposed, valactual, mask, 0);
    4f06:	7000           	moveq #0,d0
    4f08:	302f 01c6      	move.w 454(sp),d0
    4f0c:	42a7           	clr.l -(sp)
    4f0e:	2f00           	move.l d0,-(sp)
    4f10:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f14:	2f2f 002e      	move.l 46(sp),-(sp)
    4f18:	4eba 0f24      	jsr 5e3e <TestRow>(pc)
    4f1c:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    4f20:	7430           	moveq #48,d2
    4f22:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    4f26:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<12;i2++) {
    4f2a:	42af 00f6      	clr.l 246(sp)
    4f2e:	605c           	bra.s 4f8c <TestZoom4Picture+0x1fc4>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    4f30:	202f 00f6      	move.l 246(sp),d0
    4f34:	d080           	add.l d0,d0
    4f36:	2200           	move.l d0,d1
    4f38:	5281           	addq.l #1,d1
    4f3a:	7000           	moveq #0,d0
    4f3c:	302f 01c6      	move.w 454(sp),d0
    4f40:	2f01           	move.l d1,-(sp)
    4f42:	2f00           	move.l d0,-(sp)
    4f44:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f48:	2f2f 002e      	move.l 46(sp),-(sp)
    4f4c:	4eba 0ef0      	jsr 5e3e <TestRow>(pc)
    4f50:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f54:	7030           	moveq #48,d0
    4f56:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    4f5a:	202f 00f6      	move.l 246(sp),d0
    4f5e:	5280           	addq.l #1,d0
    4f60:	d080           	add.l d0,d0
    4f62:	2200           	move.l d0,d1
    4f64:	7000           	moveq #0,d0
    4f66:	302f 01c6      	move.w 454(sp),d0
    4f6a:	2f01           	move.l d1,-(sp)
    4f6c:	2f00           	move.l d0,-(sp)
    4f6e:	2f2f 01d0      	move.l 464(sp),-(sp)
    4f72:	2f2f 002e      	move.l 46(sp),-(sp)
    4f76:	4eba 0ec6      	jsr 5e3e <TestRow>(pc)
    4f7a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    4f7e:	7230           	moveq #48,d1
    4f80:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    4f84:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    4f88:	52af 00f6      	addq.l #1,246(sp)
    4f8c:	740b           	moveq #11,d2
    4f8e:	b4af 00f6      	cmp.l 246(sp),d2
    4f92:	6c9c           	bge.s 4f30 <TestZoom4Picture+0x1f68>
  } 

  for(int i=0;i<8;i++) {
    4f94:	42af 00f2      	clr.l 242(sp)
    4f98:	6000 00e6      	bra.w 5080 <TestZoom4Picture+0x20b8>
    for(int i2=0;i2<6;i2++) {  
    4f9c:	42af 00ee      	clr.l 238(sp)
    4fa0:	6040           	bra.s 4fe2 <TestZoom4Picture+0x201a>
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    4fa2:	307c 0019      	movea.w #25,a0
    4fa6:	d1ef 00ee      	adda.l 238(sp),a0
    4faa:	222f 00f2      	move.l 242(sp),d1
    4fae:	2001           	move.l d1,d0
    4fb0:	e988           	lsl.l #4,d0
    4fb2:	9081           	sub.l d1,d0
    4fb4:	d080           	add.l d0,d0
    4fb6:	2208           	move.l a0,d1
    4fb8:	d280           	add.l d0,d1
    4fba:	7000           	moveq #0,d0
    4fbc:	302f 01c6      	move.w 454(sp),d0
    4fc0:	2f01           	move.l d1,-(sp)
    4fc2:	2f00           	move.l d0,-(sp)
    4fc4:	2f2f 01d0      	move.l 464(sp),-(sp)
    4fc8:	2f2f 002e      	move.l 46(sp),-(sp)
    4fcc:	4eba 0e70      	jsr 5e3e <TestRow>(pc)
    4fd0:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    4fd4:	7030           	moveq #48,d0
    4fd6:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    4fda:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<6;i2++) {  
    4fde:	52af 00ee      	addq.l #1,238(sp)
    4fe2:	7205           	moveq #5,d1
    4fe4:	b2af 00ee      	cmp.l 238(sp),d1
    4fe8:	6cb8           	bge.s 4fa2 <TestZoom4Picture+0x1fda>
    }
    
    for(int i2=0;i2<12;i2++) {
    4fea:	42af 00ea      	clr.l 234(sp)
    4fee:	6000 0082      	bra.w 5072 <TestZoom4Picture+0x20aa>
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    4ff2:	222f 00f2      	move.l 242(sp),d1
    4ff6:	2001           	move.l d1,d0
    4ff8:	e988           	lsl.l #4,d0
    4ffa:	9081           	sub.l d1,d0
    4ffc:	d080           	add.l d0,d0
    4ffe:	2040           	movea.l d0,a0
    5000:	41e8 001f      	lea 31(a0),a0
    5004:	202f 00ea      	move.l 234(sp),d0
    5008:	d080           	add.l d0,d0
    500a:	2208           	move.l a0,d1
    500c:	d280           	add.l d0,d1
    500e:	7000           	moveq #0,d0
    5010:	302f 01c6      	move.w 454(sp),d0
    5014:	2f01           	move.l d1,-(sp)
    5016:	2f00           	move.l d0,-(sp)
    5018:	2f2f 01d0      	move.l 464(sp),-(sp)
    501c:	2f2f 002e      	move.l 46(sp),-(sp)
    5020:	4eba 0e1c      	jsr 5e3e <TestRow>(pc)
    5024:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5028:	7430           	moveq #48,d2
    502a:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    502e:	222f 00f2      	move.l 242(sp),d1
    5032:	2001           	move.l d1,d0
    5034:	e988           	lsl.l #4,d0
    5036:	9081           	sub.l d1,d0
    5038:	d080           	add.l d0,d0
    503a:	2040           	movea.l d0,a0
    503c:	41e8 0020      	lea 32(a0),a0
    5040:	202f 00ea      	move.l 234(sp),d0
    5044:	d080           	add.l d0,d0
    5046:	2208           	move.l a0,d1
    5048:	d280           	add.l d0,d1
    504a:	7000           	moveq #0,d0
    504c:	302f 01c6      	move.w 454(sp),d0
    5050:	2f01           	move.l d1,-(sp)
    5052:	2f00           	move.l d0,-(sp)
    5054:	2f2f 01d0      	move.l 464(sp),-(sp)
    5058:	2f2f 002e      	move.l 46(sp),-(sp)
    505c:	4eba 0de0      	jsr 5e3e <TestRow>(pc)
    5060:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5064:	7030           	moveq #48,d0
    5066:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    506a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<12;i2++) {
    506e:	52af 00ea      	addq.l #1,234(sp)
    5072:	720b           	moveq #11,d1
    5074:	b2af 00ea      	cmp.l 234(sp),d1
    5078:	6c00 ff78      	bge.w 4ff2 <TestZoom4Picture+0x202a>
  for(int i=0;i<8;i++) {
    507c:	52af 00f2      	addq.l #1,242(sp)
    5080:	7407           	moveq #7,d2
    5082:	b4af 00f2      	cmp.l 242(sp),d2
    5086:	6c00 ff14      	bge.w 4f9c <TestZoom4Picture+0x1fd4>
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    508a:	42af 00e6      	clr.l 230(sp)
    508e:	6032           	bra.s 50c2 <TestZoom4Picture+0x20fa>
    TestRow( valsupposed, valactual, mask, 260+i2);
    5090:	222f 00e6      	move.l 230(sp),d1
    5094:	0681 0000 0104 	addi.l #260,d1
    509a:	7000           	moveq #0,d0
    509c:	302f 01c6      	move.w 454(sp),d0
    50a0:	2f01           	move.l d1,-(sp)
    50a2:	2f00           	move.l d0,-(sp)
    50a4:	2f2f 01d0      	move.l 464(sp),-(sp)
    50a8:	2f2f 002e      	move.l 46(sp),-(sp)
    50ac:	4eba 0d90      	jsr 5e3e <TestRow>(pc)
    50b0:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    50b4:	7030           	moveq #48,d0
    50b6:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    50ba:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {  
    50be:	52af 00e6      	addq.l #1,230(sp)
    50c2:	7204           	moveq #4,d1
    50c4:	b2af 00e6      	cmp.l 230(sp),d1
    50c8:	6cc6           	bge.s 5090 <TestZoom4Picture+0x20c8>
  }

  tmp = source;
    50ca:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    50d0:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    50d6:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 12, 1);
    50dc:	4878 0001      	pea 1 <_start+0x1>
    50e0:	4878 000c      	pea c <main+0x6>
    50e4:	2f2f 0042      	move.l 66(sp),-(sp)
    50e8:	2f2f 006a      	move.l 106(sp),-(sp)
    50ec:	4eba c99e      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    50f0:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    50f4:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    50fa:	2c40           	movea.l d0,a6
    50fc:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5100:	242f 003a      	move.l 58(sp),d2
    5104:	5882           	addq.l #4,d2
    5106:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom13;
    510a:	2f7c 0001 95b4 	move.l #103860,34(sp)
    5110:	0022 

  mask = 0xffff;
    5112:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<11;i2++) {
    5118:	42af 00e2      	clr.l 226(sp)
    511c:	605a           	bra.s 5178 <TestZoom4Picture+0x21b0>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    511e:	202f 00e2      	move.l 226(sp),d0
    5122:	d080           	add.l d0,d0
    5124:	2200           	move.l d0,d1
    5126:	7000           	moveq #0,d0
    5128:	302f 01c6      	move.w 454(sp),d0
    512c:	2f01           	move.l d1,-(sp)
    512e:	2f00           	move.l d0,-(sp)
    5130:	2f2f 01d0      	move.l 464(sp),-(sp)
    5134:	2f2f 002e      	move.l 46(sp),-(sp)
    5138:	4eba 0d04      	jsr 5e3e <TestRow>(pc)
    513c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5140:	7030           	moveq #48,d0
    5142:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5146:	202f 00e2      	move.l 226(sp),d0
    514a:	d080           	add.l d0,d0
    514c:	2200           	move.l d0,d1
    514e:	5281           	addq.l #1,d1
    5150:	7000           	moveq #0,d0
    5152:	302f 01c6      	move.w 454(sp),d0
    5156:	2f01           	move.l d1,-(sp)
    5158:	2f00           	move.l d0,-(sp)
    515a:	2f2f 01d0      	move.l 464(sp),-(sp)
    515e:	2f2f 002e      	move.l 46(sp),-(sp)
    5162:	4eba 0cda      	jsr 5e3e <TestRow>(pc)
    5166:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    516a:	7230           	moveq #48,d1
    516c:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5170:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<11;i2++) {
    5174:	52af 00e2      	addq.l #1,226(sp)
    5178:	740a           	moveq #10,d2
    517a:	b4af 00e2      	cmp.l 226(sp),d2
    517e:	6c9e           	bge.s 511e <TestZoom4Picture+0x2156>
  } 

  for(int i=0;i<8;i++) {
    5180:	42af 00de      	clr.l 222(sp)
    5184:	6000 00de      	bra.w 5264 <TestZoom4Picture+0x229c>
    for(int i2=0;i2<5;i2++) {  
    5188:	42af 00da      	clr.l 218(sp)
    518c:	603e           	bra.s 51cc <TestZoom4Picture+0x2204>
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    518e:	307c 0016      	movea.w #22,a0
    5192:	d1ef 00da      	adda.l 218(sp),a0
    5196:	222f 00de      	move.l 222(sp),d1
    519a:	2001           	move.l d1,d0
    519c:	eb88           	lsl.l #5,d0
    519e:	9081           	sub.l d1,d0
    51a0:	2208           	move.l a0,d1
    51a2:	d280           	add.l d0,d1
    51a4:	7000           	moveq #0,d0
    51a6:	302f 01c6      	move.w 454(sp),d0
    51aa:	2f01           	move.l d1,-(sp)
    51ac:	2f00           	move.l d0,-(sp)
    51ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    51b2:	2f2f 002e      	move.l 46(sp),-(sp)
    51b6:	4eba 0c86      	jsr 5e3e <TestRow>(pc)
    51ba:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    51be:	7030           	moveq #48,d0
    51c0:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    51c4:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<5;i2++) {  
    51c8:	52af 00da      	addq.l #1,218(sp)
    51cc:	7204           	moveq #4,d1
    51ce:	b2af 00da      	cmp.l 218(sp),d1
    51d2:	6cba           	bge.s 518e <TestZoom4Picture+0x21c6>
    }
    
    for(int i2=0;i2<13;i2++) {
    51d4:	42af 00d6      	clr.l 214(sp)
    51d8:	607c           	bra.s 5256 <TestZoom4Picture+0x228e>
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    51da:	222f 00de      	move.l 222(sp),d1
    51de:	2001           	move.l d1,d0
    51e0:	eb88           	lsl.l #5,d0
    51e2:	2040           	movea.l d0,a0
    51e4:	91c1           	suba.l d1,a0
    51e6:	41e8 001b      	lea 27(a0),a0
    51ea:	202f 00d6      	move.l 214(sp),d0
    51ee:	d080           	add.l d0,d0
    51f0:	2208           	move.l a0,d1
    51f2:	d280           	add.l d0,d1
    51f4:	7000           	moveq #0,d0
    51f6:	302f 01c6      	move.w 454(sp),d0
    51fa:	2f01           	move.l d1,-(sp)
    51fc:	2f00           	move.l d0,-(sp)
    51fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5202:	2f2f 002e      	move.l 46(sp),-(sp)
    5206:	4eba 0c36      	jsr 5e3e <TestRow>(pc)
    520a:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    520e:	7430           	moveq #48,d2
    5210:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    5214:	222f 00de      	move.l 222(sp),d1
    5218:	2001           	move.l d1,d0
    521a:	eb88           	lsl.l #5,d0
    521c:	2040           	movea.l d0,a0
    521e:	91c1           	suba.l d1,a0
    5220:	41e8 001c      	lea 28(a0),a0
    5224:	202f 00d6      	move.l 214(sp),d0
    5228:	d080           	add.l d0,d0
    522a:	2208           	move.l a0,d1
    522c:	d280           	add.l d0,d1
    522e:	7000           	moveq #0,d0
    5230:	302f 01c6      	move.w 454(sp),d0
    5234:	2f01           	move.l d1,-(sp)
    5236:	2f00           	move.l d0,-(sp)
    5238:	2f2f 01d0      	move.l 464(sp),-(sp)
    523c:	2f2f 002e      	move.l 46(sp),-(sp)
    5240:	4eba 0bfc      	jsr 5e3e <TestRow>(pc)
    5244:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5248:	7030           	moveq #48,d0
    524a:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    524e:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<13;i2++) {
    5252:	52af 00d6      	addq.l #1,214(sp)
    5256:	720c           	moveq #12,d1
    5258:	b2af 00d6      	cmp.l 214(sp),d1
    525c:	6c00 ff7c      	bge.w 51da <TestZoom4Picture+0x2212>
  for(int i=0;i<8;i++) {
    5260:	52af 00de      	addq.l #1,222(sp)
    5264:	7407           	moveq #7,d2
    5266:	b4af 00de      	cmp.l 222(sp),d2
    526a:	6c00 ff1c      	bge.w 5188 <TestZoom4Picture+0x21c0>
    }
  } 

  tmp = source;
    526e:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    5274:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    527a:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 13, 1);
    5280:	4878 0001      	pea 1 <_start+0x1>
    5284:	4878 000d      	pea d <main+0x7>
    5288:	2f2f 0042      	move.l 66(sp),-(sp)
    528c:	2f2f 006a      	move.l 106(sp),-(sp)
    5290:	4eba c7fa      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    5294:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5298:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    529e:	2c40           	movea.l d0,a6
    52a0:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    52a4:	202f 003a      	move.l 58(sp),d0
    52a8:	5880           	addq.l #4,d0
    52aa:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom14;
    52ae:	2f7c 0001 95e0 	move.l #103904,34(sp)
    52b4:	0022 

  mask = 0xffff;
    52b6:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    52bc:	7000           	moveq #0,d0
    52be:	302f 01c6      	move.w 454(sp),d0
    52c2:	42a7           	clr.l -(sp)
    52c4:	2f00           	move.l d0,-(sp)
    52c6:	2f2f 01d0      	move.l 464(sp),-(sp)
    52ca:	2f2f 002e      	move.l 46(sp),-(sp)
    52ce:	4eba 0b6e      	jsr 5e3e <TestRow>(pc)
    52d2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2; 
    52d6:	7230           	moveq #48,d1
    52d8:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff; 
    52dc:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<9;i2++) {
    52e0:	42af 00d2      	clr.l 210(sp)
    52e4:	605c           	bra.s 5342 <TestZoom4Picture+0x237a>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    52e6:	202f 00d2      	move.l 210(sp),d0
    52ea:	d080           	add.l d0,d0
    52ec:	2200           	move.l d0,d1
    52ee:	5281           	addq.l #1,d1
    52f0:	7000           	moveq #0,d0
    52f2:	302f 01c6      	move.w 454(sp),d0
    52f6:	2f01           	move.l d1,-(sp)
    52f8:	2f00           	move.l d0,-(sp)
    52fa:	2f2f 01d0      	move.l 464(sp),-(sp)
    52fe:	2f2f 002e      	move.l 46(sp),-(sp)
    5302:	4eba 0b3a      	jsr 5e3e <TestRow>(pc)
    5306:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    530a:	7430           	moveq #48,d2
    530c:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5310:	202f 00d2      	move.l 210(sp),d0
    5314:	5280           	addq.l #1,d0
    5316:	d080           	add.l d0,d0
    5318:	2200           	move.l d0,d1
    531a:	7000           	moveq #0,d0
    531c:	302f 01c6      	move.w 454(sp),d0
    5320:	2f01           	move.l d1,-(sp)
    5322:	2f00           	move.l d0,-(sp)
    5324:	2f2f 01d0      	move.l 464(sp),-(sp)
    5328:	2f2f 002e      	move.l 46(sp),-(sp)
    532c:	4eba 0b10      	jsr 5e3e <TestRow>(pc)
    5330:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5334:	7030           	moveq #48,d0
    5336:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    533a:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<9;i2++) {
    533e:	52af 00d2      	addq.l #1,210(sp)
    5342:	7208           	moveq #8,d1
    5344:	b2af 00d2      	cmp.l 210(sp),d1
    5348:	6c9c           	bge.s 52e6 <TestZoom4Picture+0x231e>
  } 

  for(int i=0;i<7;i++) {
    534a:	42af 00ce      	clr.l 206(sp)
    534e:	6000 00cc      	bra.w 541c <TestZoom4Picture+0x2454>
    for(int i2=0;i2<4;i2++) {  
    5352:	42af 00ca      	clr.l 202(sp)
    5356:	6036           	bra.s 538e <TestZoom4Picture+0x23c6>
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    5358:	7213           	moveq #19,d1
    535a:	d2af 00ca      	add.l 202(sp),d1
    535e:	202f 00ce      	move.l 206(sp),d0
    5362:	eb88           	lsl.l #5,d0
    5364:	d280           	add.l d0,d1
    5366:	7000           	moveq #0,d0
    5368:	302f 01c6      	move.w 454(sp),d0
    536c:	2f01           	move.l d1,-(sp)
    536e:	2f00           	move.l d0,-(sp)
    5370:	2f2f 01d0      	move.l 464(sp),-(sp)
    5374:	2f2f 002e      	move.l 46(sp),-(sp)
    5378:	4eba 0ac4      	jsr 5e3e <TestRow>(pc)
    537c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5380:	7430           	moveq #48,d2
    5382:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5386:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<4;i2++) {  
    538a:	52af 00ca      	addq.l #1,202(sp)
    538e:	7003           	moveq #3,d0
    5390:	b0af 00ca      	cmp.l 202(sp),d0
    5394:	6cc2           	bge.s 5358 <TestZoom4Picture+0x2390>
    }
    
    for(int i2=0;i2<14;i2++) {
    5396:	42af 00c6      	clr.l 198(sp)
    539a:	6074           	bra.s 5410 <TestZoom4Picture+0x2448>
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    539c:	202f 00ce      	move.l 206(sp),d0
    53a0:	eb88           	lsl.l #5,d0
    53a2:	307c 0017      	movea.w #23,a0
    53a6:	d1c0           	adda.l d0,a0
    53a8:	202f 00c6      	move.l 198(sp),d0
    53ac:	d080           	add.l d0,d0
    53ae:	2208           	move.l a0,d1
    53b0:	d280           	add.l d0,d1
    53b2:	7000           	moveq #0,d0
    53b4:	302f 01c6      	move.w 454(sp),d0
    53b8:	2f01           	move.l d1,-(sp)
    53ba:	2f00           	move.l d0,-(sp)
    53bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    53c0:	2f2f 002e      	move.l 46(sp),-(sp)
    53c4:	4eba 0a78      	jsr 5e3e <TestRow>(pc)
    53c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    53cc:	7230           	moveq #48,d1
    53ce:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    53d2:	202f 00ce      	move.l 206(sp),d0
    53d6:	eb88           	lsl.l #5,d0
    53d8:	307c 0018      	movea.w #24,a0
    53dc:	d1c0           	adda.l d0,a0
    53de:	202f 00c6      	move.l 198(sp),d0
    53e2:	d080           	add.l d0,d0
    53e4:	2208           	move.l a0,d1
    53e6:	d280           	add.l d0,d1
    53e8:	7000           	moveq #0,d0
    53ea:	302f 01c6      	move.w 454(sp),d0
    53ee:	2f01           	move.l d1,-(sp)
    53f0:	2f00           	move.l d0,-(sp)
    53f2:	2f2f 01d0      	move.l 464(sp),-(sp)
    53f6:	2f2f 002e      	move.l 46(sp),-(sp)
    53fa:	4eba 0a42      	jsr 5e3e <TestRow>(pc)
    53fe:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5402:	7430           	moveq #48,d2
    5404:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5408:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<14;i2++) {
    540c:	52af 00c6      	addq.l #1,198(sp)
    5410:	700d           	moveq #13,d0
    5412:	b0af 00c6      	cmp.l 198(sp),d0
    5416:	6c84           	bge.s 539c <TestZoom4Picture+0x23d4>
  for(int i=0;i<7;i++) {
    5418:	52af 00ce      	addq.l #1,206(sp)
    541c:	7206           	moveq #6,d1
    541e:	b2af 00ce      	cmp.l 206(sp),d1
    5422:	6c00 ff2e      	bge.w 5352 <TestZoom4Picture+0x238a>
    }
  }

  for(int i2=0;i2<4;i2++) {  
    5426:	42af 00c2      	clr.l 194(sp)
    542a:	6032           	bra.s 545e <TestZoom4Picture+0x2496>
    TestRow( valsupposed, valactual, mask, 243+i2);
    542c:	222f 00c2      	move.l 194(sp),d1
    5430:	0681 0000 00f3 	addi.l #243,d1
    5436:	7000           	moveq #0,d0
    5438:	302f 01c6      	move.w 454(sp),d0
    543c:	2f01           	move.l d1,-(sp)
    543e:	2f00           	move.l d0,-(sp)
    5440:	2f2f 01d0      	move.l 464(sp),-(sp)
    5444:	2f2f 002e      	move.l 46(sp),-(sp)
    5448:	4eba 09f4      	jsr 5e3e <TestRow>(pc)
    544c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5450:	7430           	moveq #48,d2
    5452:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    5456:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {  
    545a:	52af 00c2      	addq.l #1,194(sp)
    545e:	7003           	moveq #3,d0
    5460:	b0af 00c2      	cmp.l 194(sp),d0
    5464:	6cc6           	bge.s 542c <TestZoom4Picture+0x2464>
  }

  for(int i2=0;i2<12;i2++) {
    5466:	42af 00be      	clr.l 190(sp)
    546a:	6060           	bra.s 54cc <TestZoom4Picture+0x2504>
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    546c:	202f 00be      	move.l 190(sp),d0
    5470:	d080           	add.l d0,d0
    5472:	2200           	move.l d0,d1
    5474:	0681 0000 00f7 	addi.l #247,d1
    547a:	7000           	moveq #0,d0
    547c:	302f 01c6      	move.w 454(sp),d0
    5480:	2f01           	move.l d1,-(sp)
    5482:	2f00           	move.l d0,-(sp)
    5484:	2f2f 01d0      	move.l 464(sp),-(sp)
    5488:	2f2f 002e      	move.l 46(sp),-(sp)
    548c:	4eba 09b0      	jsr 5e3e <TestRow>(pc)
    5490:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5494:	7230           	moveq #48,d1
    5496:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    549a:	707c           	moveq #124,d0
    549c:	d0af 00be      	add.l 190(sp),d0
    54a0:	d080           	add.l d0,d0
    54a2:	2200           	move.l d0,d1
    54a4:	7000           	moveq #0,d0
    54a6:	302f 01c6      	move.w 454(sp),d0
    54aa:	2f01           	move.l d1,-(sp)
    54ac:	2f00           	move.l d0,-(sp)
    54ae:	2f2f 01d0      	move.l 464(sp),-(sp)
    54b2:	2f2f 002e      	move.l 46(sp),-(sp)
    54b6:	4eba 0986      	jsr 5e3e <TestRow>(pc)
    54ba:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    54be:	7430           	moveq #48,d2
    54c0:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    54c4:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<12;i2++) {
    54c8:	52af 00be      	addq.l #1,190(sp)
    54cc:	700b           	moveq #11,d0
    54ce:	b0af 00be      	cmp.l 190(sp),d0
    54d2:	6c98           	bge.s 546c <TestZoom4Picture+0x24a4>
  }

  tmp = source;
    54d4:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    54da:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    54e0:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 14, 1);
    54e6:	4878 0001      	pea 1 <_start+0x1>
    54ea:	4878 000e      	pea e <main+0x8>
    54ee:	2f2f 0042      	move.l 66(sp),-(sp)
    54f2:	2f2f 006a      	move.l 106(sp),-(sp)
    54f6:	4eba c594      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    54fa:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    54fe:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    5504:	2c40           	movea.l d0,a6
    5506:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    550a:	222f 003a      	move.l 58(sp),d1
    550e:	5881           	addq.l #4,d1
    5510:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom15;
    5514:	2f7c 0001 960c 	move.l #103948,34(sp)
    551a:	0022 

  mask = 0x0000;
    551c:	426f 01c6      	clr.w 454(sp)

  for(int i2=0;i2<8;i2++) {
    5520:	42af 00ba      	clr.l 186(sp)
    5524:	605a           	bra.s 5580 <TestZoom4Picture+0x25b8>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    5526:	202f 00ba      	move.l 186(sp),d0
    552a:	d080           	add.l d0,d0
    552c:	2200           	move.l d0,d1
    552e:	7000           	moveq #0,d0
    5530:	302f 01c6      	move.w 454(sp),d0
    5534:	2f01           	move.l d1,-(sp)
    5536:	2f00           	move.l d0,-(sp)
    5538:	2f2f 01d0      	move.l 464(sp),-(sp)
    553c:	2f2f 002e      	move.l 46(sp),-(sp)
    5540:	4eba 08fc      	jsr 5e3e <TestRow>(pc)
    5544:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5548:	7430           	moveq #48,d2
    554a:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    554e:	202f 00ba      	move.l 186(sp),d0
    5552:	d080           	add.l d0,d0
    5554:	2200           	move.l d0,d1
    5556:	5281           	addq.l #1,d1
    5558:	7000           	moveq #0,d0
    555a:	302f 01c6      	move.w 454(sp),d0
    555e:	2f01           	move.l d1,-(sp)
    5560:	2f00           	move.l d0,-(sp)
    5562:	2f2f 01d0      	move.l 464(sp),-(sp)
    5566:	2f2f 002e      	move.l 46(sp),-(sp)
    556a:	4eba 08d2      	jsr 5e3e <TestRow>(pc)
    556e:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5572:	7030           	moveq #48,d0
    5574:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5578:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    557c:	52af 00ba      	addq.l #1,186(sp)
    5580:	7207           	moveq #7,d1
    5582:	b2af 00ba      	cmp.l 186(sp),d1
    5586:	6c9e           	bge.s 5526 <TestZoom4Picture+0x255e>
  }

  for(int i=0;i<7;i++) {
    5588:	42af 00b6      	clr.l 182(sp)
    558c:	6000 00de      	bra.w 566c <TestZoom4Picture+0x26a4>
    for(int i2=0;i2<3;i2++) {  
    5590:	42af 00b2      	clr.l 178(sp)
    5594:	603e           	bra.s 55d4 <TestZoom4Picture+0x260c>
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    5596:	307c 0010      	movea.w #16,a0
    559a:	d1ef 00b2      	adda.l 178(sp),a0
    559e:	222f 00b6      	move.l 182(sp),d1
    55a2:	2001           	move.l d1,d0
    55a4:	eb88           	lsl.l #5,d0
    55a6:	d081           	add.l d1,d0
    55a8:	2208           	move.l a0,d1
    55aa:	d280           	add.l d0,d1
    55ac:	7000           	moveq #0,d0
    55ae:	302f 01c6      	move.w 454(sp),d0
    55b2:	2f01           	move.l d1,-(sp)
    55b4:	2f00           	move.l d0,-(sp)
    55b6:	2f2f 01d0      	move.l 464(sp),-(sp)
    55ba:	2f2f 002e      	move.l 46(sp),-(sp)
    55be:	4eba 087e      	jsr 5e3e <TestRow>(pc)
    55c2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    55c6:	7430           	moveq #48,d2
    55c8:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    55cc:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<3;i2++) {  
    55d0:	52af 00b2      	addq.l #1,178(sp)
    55d4:	7002           	moveq #2,d0
    55d6:	b0af 00b2      	cmp.l 178(sp),d0
    55da:	6cba           	bge.s 5596 <TestZoom4Picture+0x25ce>
    }
    
    for(int i2=0;i2<15;i2++) {
    55dc:	42af 00ae      	clr.l 174(sp)
    55e0:	607c           	bra.s 565e <TestZoom4Picture+0x2696>
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    55e2:	222f 00b6      	move.l 182(sp),d1
    55e6:	2001           	move.l d1,d0
    55e8:	eb88           	lsl.l #5,d0
    55ea:	2040           	movea.l d0,a0
    55ec:	d1c1           	adda.l d1,a0
    55ee:	41e8 0013      	lea 19(a0),a0
    55f2:	202f 00ae      	move.l 174(sp),d0
    55f6:	d080           	add.l d0,d0
    55f8:	2208           	move.l a0,d1
    55fa:	d280           	add.l d0,d1
    55fc:	7000           	moveq #0,d0
    55fe:	302f 01c6      	move.w 454(sp),d0
    5602:	2f01           	move.l d1,-(sp)
    5604:	2f00           	move.l d0,-(sp)
    5606:	2f2f 01d0      	move.l 464(sp),-(sp)
    560a:	2f2f 002e      	move.l 46(sp),-(sp)
    560e:	4eba 082e      	jsr 5e3e <TestRow>(pc)
    5612:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5616:	7230           	moveq #48,d1
    5618:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    561c:	222f 00b6      	move.l 182(sp),d1
    5620:	2001           	move.l d1,d0
    5622:	eb88           	lsl.l #5,d0
    5624:	2040           	movea.l d0,a0
    5626:	d1c1           	adda.l d1,a0
    5628:	41e8 0013      	lea 19(a0),a0
    562c:	202f 00ae      	move.l 174(sp),d0
    5630:	d080           	add.l d0,d0
    5632:	2208           	move.l a0,d1
    5634:	d280           	add.l d0,d1
    5636:	7000           	moveq #0,d0
    5638:	302f 01c6      	move.w 454(sp),d0
    563c:	2f01           	move.l d1,-(sp)
    563e:	2f00           	move.l d0,-(sp)
    5640:	2f2f 01d0      	move.l 464(sp),-(sp)
    5644:	2f2f 002e      	move.l 46(sp),-(sp)
    5648:	4eba 07f4      	jsr 5e3e <TestRow>(pc)
    564c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5650:	7430           	moveq #48,d2
    5652:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5656:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<15;i2++) {
    565a:	52af 00ae      	addq.l #1,174(sp)
    565e:	700e           	moveq #14,d0
    5660:	b0af 00ae      	cmp.l 174(sp),d0
    5664:	6c00 ff7c      	bge.w 55e2 <TestZoom4Picture+0x261a>
  for(int i=0;i<7;i++) {
    5668:	52af 00b6      	addq.l #1,182(sp)
    566c:	7206           	moveq #6,d1
    566e:	b2af 00b6      	cmp.l 182(sp),d1
    5672:	6c00 ff1c      	bge.w 5590 <TestZoom4Picture+0x25c8>
    }
  }

  for(int i2=0;i2<3;i2++) {  
    5676:	42af 00aa      	clr.l 170(sp)
    567a:	6032           	bra.s 56ae <TestZoom4Picture+0x26e6>
    TestRow( valsupposed, valactual, mask, 247+i2);
    567c:	222f 00aa      	move.l 170(sp),d1
    5680:	0681 0000 00f7 	addi.l #247,d1
    5686:	7000           	moveq #0,d0
    5688:	302f 01c6      	move.w 454(sp),d0
    568c:	2f01           	move.l d1,-(sp)
    568e:	2f00           	move.l d0,-(sp)
    5690:	2f2f 01d0      	move.l 464(sp),-(sp)
    5694:	2f2f 002e      	move.l 46(sp),-(sp)
    5698:	4eba 07a4      	jsr 5e3e <TestRow>(pc)
    569c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56a0:	7430           	moveq #48,d2
    56a2:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    56a6:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<3;i2++) {  
    56aa:	52af 00aa      	addq.l #1,170(sp)
    56ae:	7002           	moveq #2,d0
    56b0:	b0af 00aa      	cmp.l 170(sp),d0
    56b4:	6cc6           	bge.s 567c <TestZoom4Picture+0x26b4>
  }

  for(int i2=0;i2<10;i2++) {
    56b6:	42af 00a6      	clr.l 166(sp)
    56ba:	6060           	bra.s 571c <TestZoom4Picture+0x2754>
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    56bc:	707d           	moveq #125,d0
    56be:	d0af 00a6      	add.l 166(sp),d0
    56c2:	d080           	add.l d0,d0
    56c4:	2200           	move.l d0,d1
    56c6:	7000           	moveq #0,d0
    56c8:	302f 01c6      	move.w 454(sp),d0
    56cc:	2f01           	move.l d1,-(sp)
    56ce:	2f00           	move.l d0,-(sp)
    56d0:	2f2f 01d0      	move.l 464(sp),-(sp)
    56d4:	2f2f 002e      	move.l 46(sp),-(sp)
    56d8:	4eba 0764      	jsr 5e3e <TestRow>(pc)
    56dc:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    56e0:	7230           	moveq #48,d1
    56e2:	d3af 01c8      	add.l d1,456(sp)
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    56e6:	202f 00a6      	move.l 166(sp),d0
    56ea:	d080           	add.l d0,d0
    56ec:	2200           	move.l d0,d1
    56ee:	0681 0000 00fb 	addi.l #251,d1
    56f4:	7000           	moveq #0,d0
    56f6:	302f 01c6      	move.w 454(sp),d0
    56fa:	2f01           	move.l d1,-(sp)
    56fc:	2f00           	move.l d0,-(sp)
    56fe:	2f2f 01d0      	move.l 464(sp),-(sp)
    5702:	2f2f 002e      	move.l 46(sp),-(sp)
    5706:	4eba 0736      	jsr 5e3e <TestRow>(pc)
    570a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    570e:	7430           	moveq #48,d2
    5710:	d5af 01c8      	add.l d2,456(sp)
    mask = mask ^ 0xffff;
    5714:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<10;i2++) {
    5718:	52af 00a6      	addq.l #1,166(sp)
    571c:	7009           	moveq #9,d0
    571e:	b0af 00a6      	cmp.l 166(sp),d0
    5722:	6c98           	bge.s 56bc <TestZoom4Picture+0x26f4>
  }

  tmp = source;
    5724:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    572a:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    5730:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 15, 1);
    5736:	4878 0001      	pea 1 <_start+0x1>
    573a:	4878 000f      	pea f <main+0x9>
    573e:	2f2f 0042      	move.l 66(sp),-(sp)
    5742:	2f2f 006a      	move.l 106(sp),-(sp)
    5746:	4eba c344      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    574a:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    574e:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    5754:	2c40           	movea.l d0,a6
    5756:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    575a:	222f 003a      	move.l 58(sp),d1
    575e:	5881           	addq.l #4,d1
    5760:	2f41 01c8      	move.l d1,456(sp)
  valsupposed = destlinezoom16;
    5764:	2f7c 0001 9638 	move.l #103992,34(sp)
    576a:	0022 

  mask = 0x0000;
    576c:	426f 01c6      	clr.w 454(sp)

  TestRow( valsupposed, valactual, mask, 0);   
    5770:	7000           	moveq #0,d0
    5772:	302f 01c6      	move.w 454(sp),d0
    5776:	42a7           	clr.l -(sp)
    5778:	2f00           	move.l d0,-(sp)
    577a:	2f2f 01d0      	move.l 464(sp),-(sp)
    577e:	2f2f 002e      	move.l 46(sp),-(sp)
    5782:	4eba 06ba      	jsr 5e3e <TestRow>(pc)
    5786:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    578a:	7430           	moveq #48,d2
    578c:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    5790:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    5794:	42af 00a2      	clr.l 162(sp)
    5798:	605a           	bra.s 57f4 <TestZoom4Picture+0x282c>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    579a:	202f 00a2      	move.l 162(sp),d0
    579e:	d080           	add.l d0,d0
    57a0:	2200           	move.l d0,d1
    57a2:	7000           	moveq #0,d0
    57a4:	302f 01c6      	move.w 454(sp),d0
    57a8:	2f01           	move.l d1,-(sp)
    57aa:	2f00           	move.l d0,-(sp)
    57ac:	2f2f 01d0      	move.l 464(sp),-(sp)
    57b0:	2f2f 002e      	move.l 46(sp),-(sp)
    57b4:	4eba 0688      	jsr 5e3e <TestRow>(pc)
    57b8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    57bc:	7030           	moveq #48,d0
    57be:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    57c2:	202f 00a2      	move.l 162(sp),d0
    57c6:	d080           	add.l d0,d0
    57c8:	2200           	move.l d0,d1
    57ca:	5281           	addq.l #1,d1
    57cc:	7000           	moveq #0,d0
    57ce:	302f 01c6      	move.w 454(sp),d0
    57d2:	2f01           	move.l d1,-(sp)
    57d4:	2f00           	move.l d0,-(sp)
    57d6:	2f2f 01d0      	move.l 464(sp),-(sp)
    57da:	2f2f 002e      	move.l 46(sp),-(sp)
    57de:	4eba 065e      	jsr 5e3e <TestRow>(pc)
    57e2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    57e6:	7230           	moveq #48,d1
    57e8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    57ec:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<6;i2++) {
    57f0:	52af 00a2      	addq.l #1,162(sp)
    57f4:	7405           	moveq #5,d2
    57f6:	b4af 00a2      	cmp.l 162(sp),d2
    57fa:	6c9e           	bge.s 579a <TestZoom4Picture+0x27d2>
  }

  for(int i=0;i<7;i++) {
    57fc:	42af 009e      	clr.l 158(sp)
    5800:	6000 00e6      	bra.w 58e8 <TestZoom4Picture+0x2920>
    for(int i2=0;i2<2;i2++) {  
    5804:	42af 009a      	clr.l 154(sp)
    5808:	6040           	bra.s 584a <TestZoom4Picture+0x2882>
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    580a:	307c 000d      	movea.w #13,a0
    580e:	d1ef 009a      	adda.l 154(sp),a0
    5812:	222f 009e      	move.l 158(sp),d1
    5816:	2001           	move.l d1,d0
    5818:	e988           	lsl.l #4,d0
    581a:	d081           	add.l d1,d0
    581c:	d080           	add.l d0,d0
    581e:	2208           	move.l a0,d1
    5820:	d280           	add.l d0,d1
    5822:	7000           	moveq #0,d0
    5824:	302f 01c6      	move.w 454(sp),d0
    5828:	2f01           	move.l d1,-(sp)
    582a:	2f00           	move.l d0,-(sp)
    582c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5830:	2f2f 002e      	move.l 46(sp),-(sp)
    5834:	4eba 0608      	jsr 5e3e <TestRow>(pc)
    5838:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    583c:	7030           	moveq #48,d0
    583e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5842:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<2;i2++) {  
    5846:	52af 009a      	addq.l #1,154(sp)
    584a:	7201           	moveq #1,d1
    584c:	b2af 009a      	cmp.l 154(sp),d1
    5850:	6cb8           	bge.s 580a <TestZoom4Picture+0x2842>
    }
    
    for(int i2=0;i2<16;i2++) {
    5852:	42af 0096      	clr.l 150(sp)
    5856:	6000 0082      	bra.w 58da <TestZoom4Picture+0x2912>
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    585a:	222f 009e      	move.l 158(sp),d1
    585e:	2001           	move.l d1,d0
    5860:	e988           	lsl.l #4,d0
    5862:	d081           	add.l d1,d0
    5864:	d080           	add.l d0,d0
    5866:	2040           	movea.l d0,a0
    5868:	41e8 0010      	lea 16(a0),a0
    586c:	202f 0096      	move.l 150(sp),d0
    5870:	d080           	add.l d0,d0
    5872:	2208           	move.l a0,d1
    5874:	d280           	add.l d0,d1
    5876:	7000           	moveq #0,d0
    5878:	302f 01c6      	move.w 454(sp),d0
    587c:	2f01           	move.l d1,-(sp)
    587e:	2f00           	move.l d0,-(sp)
    5880:	2f2f 01d0      	move.l 464(sp),-(sp)
    5884:	2f2f 002e      	move.l 46(sp),-(sp)
    5888:	4eba 05b4      	jsr 5e3e <TestRow>(pc)
    588c:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5890:	7430           	moveq #48,d2
    5892:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    5896:	222f 009e      	move.l 158(sp),d1
    589a:	2001           	move.l d1,d0
    589c:	e988           	lsl.l #4,d0
    589e:	d081           	add.l d1,d0
    58a0:	d080           	add.l d0,d0
    58a2:	2040           	movea.l d0,a0
    58a4:	41e8 0011      	lea 17(a0),a0
    58a8:	202f 0096      	move.l 150(sp),d0
    58ac:	d080           	add.l d0,d0
    58ae:	2208           	move.l a0,d1
    58b0:	d280           	add.l d0,d1
    58b2:	7000           	moveq #0,d0
    58b4:	302f 01c6      	move.w 454(sp),d0
    58b8:	2f01           	move.l d1,-(sp)
    58ba:	2f00           	move.l d0,-(sp)
    58bc:	2f2f 01d0      	move.l 464(sp),-(sp)
    58c0:	2f2f 002e      	move.l 46(sp),-(sp)
    58c4:	4eba 0578      	jsr 5e3e <TestRow>(pc)
    58c8:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    58cc:	7030           	moveq #48,d0
    58ce:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    58d2:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<16;i2++) {
    58d6:	52af 0096      	addq.l #1,150(sp)
    58da:	720f           	moveq #15,d1
    58dc:	b2af 0096      	cmp.l 150(sp),d1
    58e0:	6c00 ff78      	bge.w 585a <TestZoom4Picture+0x2892>
  for(int i=0;i<7;i++) {
    58e4:	52af 009e      	addq.l #1,158(sp)
    58e8:	7406           	moveq #6,d2
    58ea:	b4af 009e      	cmp.l 158(sp),d2
    58ee:	6c00 ff14      	bge.w 5804 <TestZoom4Picture+0x283c>
    }
  }

  for(int i2=0;i2<2;i2++) {
    58f2:	42af 0092      	clr.l 146(sp)
    58f6:	6032           	bra.s 592a <TestZoom4Picture+0x2962>
    TestRow( valsupposed, valactual, mask, 251+i2);
    58f8:	222f 0092      	move.l 146(sp),d1
    58fc:	0681 0000 00fb 	addi.l #251,d1
    5902:	7000           	moveq #0,d0
    5904:	302f 01c6      	move.w 454(sp),d0
    5908:	2f01           	move.l d1,-(sp)
    590a:	2f00           	move.l d0,-(sp)
    590c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5910:	2f2f 002e      	move.l 46(sp),-(sp)
    5914:	4eba 0528      	jsr 5e3e <TestRow>(pc)
    5918:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    591c:	7030           	moveq #48,d0
    591e:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5922:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<2;i2++) {
    5926:	52af 0092      	addq.l #1,146(sp)
    592a:	7201           	moveq #1,d1
    592c:	b2af 0092      	cmp.l 146(sp),d1
    5930:	6cc6           	bge.s 58f8 <TestZoom4Picture+0x2930>
  }

  for(int i2=0;i2<8;i2++) {
    5932:	42af 008e      	clr.l 142(sp)
    5936:	6060           	bra.s 5998 <TestZoom4Picture+0x29d0>
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    5938:	202f 008e      	move.l 142(sp),d0
    593c:	d080           	add.l d0,d0
    593e:	2200           	move.l d0,d1
    5940:	0681 0000 00fd 	addi.l #253,d1
    5946:	7000           	moveq #0,d0
    5948:	302f 01c6      	move.w 454(sp),d0
    594c:	2f01           	move.l d1,-(sp)
    594e:	2f00           	move.l d0,-(sp)
    5950:	2f2f 01d0      	move.l 464(sp),-(sp)
    5954:	2f2f 002e      	move.l 46(sp),-(sp)
    5958:	4eba 04e4      	jsr 5e3e <TestRow>(pc)
    595c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5960:	7430           	moveq #48,d2
    5962:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    5966:	707f           	moveq #127,d0
    5968:	d0af 008e      	add.l 142(sp),d0
    596c:	d080           	add.l d0,d0
    596e:	2200           	move.l d0,d1
    5970:	7000           	moveq #0,d0
    5972:	302f 01c6      	move.w 454(sp),d0
    5976:	2f01           	move.l d1,-(sp)
    5978:	2f00           	move.l d0,-(sp)
    597a:	2f2f 01d0      	move.l 464(sp),-(sp)
    597e:	2f2f 002e      	move.l 46(sp),-(sp)
    5982:	4eba 04ba      	jsr 5e3e <TestRow>(pc)
    5986:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    598a:	7030           	moveq #48,d0
    598c:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5990:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<8;i2++) {
    5994:	52af 008e      	addq.l #1,142(sp)
    5998:	7207           	moveq #7,d1
    599a:	b2af 008e      	cmp.l 142(sp),d1
    599e:	6c98           	bge.s 5938 <TestZoom4Picture+0x2970>
  }

  tmp = source;
    59a0:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    59a6:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    59ac:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 16, 1);
    59b2:	4878 0001      	pea 1 <_start+0x1>
    59b6:	4878 0010      	pea 10 <main+0xa>
    59ba:	2f2f 0042      	move.l 66(sp),-(sp)
    59be:	2f2f 006a      	move.l 106(sp),-(sp)
    59c2:	4eba c0c8      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    59c6:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    59ca:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    59d0:	2c40           	movea.l d0,a6
    59d2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    59d6:	242f 003a      	move.l 58(sp),d2
    59da:	5882           	addq.l #4,d2
    59dc:	2f42 01c8      	move.l d2,456(sp)
  valsupposed = destlinezoom17;
    59e0:	2f7c 0001 9664 	move.l #104036,34(sp)
    59e6:	0022 

  mask = 0xffff;
    59e8:	3f7c ffff 01c6 	move.w #-1,454(sp)

  for(int i2=0;i2<5;i2++) {
    59ee:	42af 008a      	clr.l 138(sp)
    59f2:	605a           	bra.s 5a4e <TestZoom4Picture+0x2a86>
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    59f4:	202f 008a      	move.l 138(sp),d0
    59f8:	d080           	add.l d0,d0
    59fa:	2200           	move.l d0,d1
    59fc:	7000           	moveq #0,d0
    59fe:	302f 01c6      	move.w 454(sp),d0
    5a02:	2f01           	move.l d1,-(sp)
    5a04:	2f00           	move.l d0,-(sp)
    5a06:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a0a:	2f2f 002e      	move.l 46(sp),-(sp)
    5a0e:	4eba 042e      	jsr 5e3e <TestRow>(pc)
    5a12:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a16:	7030           	moveq #48,d0
    5a18:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    5a1c:	202f 008a      	move.l 138(sp),d0
    5a20:	d080           	add.l d0,d0
    5a22:	2200           	move.l d0,d1
    5a24:	5281           	addq.l #1,d1
    5a26:	7000           	moveq #0,d0
    5a28:	302f 01c6      	move.w 454(sp),d0
    5a2c:	2f01           	move.l d1,-(sp)
    5a2e:	2f00           	move.l d0,-(sp)
    5a30:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a34:	2f2f 002e      	move.l 46(sp),-(sp)
    5a38:	4eba 0404      	jsr 5e3e <TestRow>(pc)
    5a3c:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5a40:	7230           	moveq #48,d1
    5a42:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5a46:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<5;i2++) {
    5a4a:	52af 008a      	addq.l #1,138(sp)
    5a4e:	7404           	moveq #4,d2
    5a50:	b4af 008a      	cmp.l 138(sp),d2
    5a54:	6c9e           	bge.s 59f4 <TestZoom4Picture+0x2a2c>
  }

  for(int i=0;i<7;i++) {
    5a56:	42af 0086      	clr.l 134(sp)
    5a5a:	6000 00d4      	bra.w 5b30 <TestZoom4Picture+0x2b68>
      TestRow( valsupposed, valactual, mask, 10+i*35);
    5a5e:	222f 0086      	move.l 134(sp),d1
    5a62:	2001           	move.l d1,d0
    5a64:	e988           	lsl.l #4,d0
    5a66:	d081           	add.l d1,d0
    5a68:	d080           	add.l d0,d0
    5a6a:	2040           	movea.l d0,a0
    5a6c:	d1c1           	adda.l d1,a0
    5a6e:	41e8 000a      	lea 10(a0),a0
    5a72:	7000           	moveq #0,d0
    5a74:	302f 01c6      	move.w 454(sp),d0
    5a78:	2f08           	move.l a0,-(sp)
    5a7a:	2f00           	move.l d0,-(sp)
    5a7c:	2f2f 01d0      	move.l 464(sp),-(sp)
    5a80:	2f2f 002e      	move.l 46(sp),-(sp)
    5a84:	4eba 03b8      	jsr 5e3e <TestRow>(pc)
    5a88:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5a8c:	7030           	moveq #48,d0
    5a8e:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5a92:	466f 01c6      	not.w 454(sp)
    
    for(int i2=0;i2<17;i2++) {
    5a96:	42af 0082      	clr.l 130(sp)
    5a9a:	6000 0086      	bra.w 5b22 <TestZoom4Picture+0x2b5a>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    5a9e:	222f 0086      	move.l 134(sp),d1
    5aa2:	2001           	move.l d1,d0
    5aa4:	e988           	lsl.l #4,d0
    5aa6:	d081           	add.l d1,d0
    5aa8:	d080           	add.l d0,d0
    5aaa:	2040           	movea.l d0,a0
    5aac:	d1c1           	adda.l d1,a0
    5aae:	41e8 000b      	lea 11(a0),a0
    5ab2:	202f 0082      	move.l 130(sp),d0
    5ab6:	d080           	add.l d0,d0
    5ab8:	2208           	move.l a0,d1
    5aba:	d280           	add.l d0,d1
    5abc:	7000           	moveq #0,d0
    5abe:	302f 01c6      	move.w 454(sp),d0
    5ac2:	2f01           	move.l d1,-(sp)
    5ac4:	2f00           	move.l d0,-(sp)
    5ac6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5aca:	2f2f 002e      	move.l 46(sp),-(sp)
    5ace:	4eba 036e      	jsr 5e3e <TestRow>(pc)
    5ad2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5ad6:	7230           	moveq #48,d1
    5ad8:	d3af 01c8      	add.l d1,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    5adc:	222f 0086      	move.l 134(sp),d1
    5ae0:	2001           	move.l d1,d0
    5ae2:	e988           	lsl.l #4,d0
    5ae4:	d081           	add.l d1,d0
    5ae6:	d080           	add.l d0,d0
    5ae8:	2040           	movea.l d0,a0
    5aea:	d1c1           	adda.l d1,a0
    5aec:	41e8 000c      	lea 12(a0),a0
    5af0:	202f 0082      	move.l 130(sp),d0
    5af4:	d080           	add.l d0,d0
    5af6:	2208           	move.l a0,d1
    5af8:	d280           	add.l d0,d1
    5afa:	7000           	moveq #0,d0
    5afc:	302f 01c6      	move.w 454(sp),d0
    5b00:	2f01           	move.l d1,-(sp)
    5b02:	2f00           	move.l d0,-(sp)
    5b04:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b08:	2f2f 002e      	move.l 46(sp),-(sp)
    5b0c:	4eba 0330      	jsr 5e3e <TestRow>(pc)
    5b10:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5b14:	7430           	moveq #48,d2
    5b16:	d5af 01c8      	add.l d2,456(sp)
      mask = mask ^ 0xffff;
    5b1a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<17;i2++) {
    5b1e:	52af 0082      	addq.l #1,130(sp)
    5b22:	7010           	moveq #16,d0
    5b24:	b0af 0082      	cmp.l 130(sp),d0
    5b28:	6c00 ff74      	bge.w 5a9e <TestZoom4Picture+0x2ad6>
  for(int i=0;i<7;i++) {
    5b2c:	52af 0086      	addq.l #1,134(sp)
    5b30:	7206           	moveq #6,d1
    5b32:	b2af 0086      	cmp.l 134(sp),d1
    5b36:	6c00 ff26      	bge.w 5a5e <TestZoom4Picture+0x2a96>
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    5b3a:	7000           	moveq #0,d0
    5b3c:	302f 01c6      	move.w 454(sp),d0
    5b40:	4878 00ff      	pea ff <main+0xf9>
    5b44:	2f00           	move.l d0,-(sp)
    5b46:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b4a:	2f2f 002e      	move.l 46(sp),-(sp)
    5b4e:	4eba 02ee      	jsr 5e3e <TestRow>(pc)
    5b52:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5b56:	7430           	moveq #48,d2
    5b58:	d5af 01c8      	add.l d2,456(sp)
  mask = mask ^ 0xffff;
    5b5c:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<7;i2++) {
    5b60:	42af 007e      	clr.l 126(sp)
    5b64:	6064           	bra.s 5bca <TestZoom4Picture+0x2c02>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    5b66:	202f 007e      	move.l 126(sp),d0
    5b6a:	0680 0000 0080 	addi.l #128,d0
    5b70:	d080           	add.l d0,d0
    5b72:	2200           	move.l d0,d1
    5b74:	7000           	moveq #0,d0
    5b76:	302f 01c6      	move.w 454(sp),d0
    5b7a:	2f01           	move.l d1,-(sp)
    5b7c:	2f00           	move.l d0,-(sp)
    5b7e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5b82:	2f2f 002e      	move.l 46(sp),-(sp)
    5b86:	4eba 02b6      	jsr 5e3e <TestRow>(pc)
    5b8a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5b8e:	7030           	moveq #48,d0
    5b90:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    5b94:	202f 007e      	move.l 126(sp),d0
    5b98:	d080           	add.l d0,d0
    5b9a:	2200           	move.l d0,d1
    5b9c:	0681 0000 0101 	addi.l #257,d1
    5ba2:	7000           	moveq #0,d0
    5ba4:	302f 01c6      	move.w 454(sp),d0
    5ba8:	2f01           	move.l d1,-(sp)
    5baa:	2f00           	move.l d0,-(sp)
    5bac:	2f2f 01d0      	move.l 464(sp),-(sp)
    5bb0:	2f2f 002e      	move.l 46(sp),-(sp)
    5bb4:	4eba 0288      	jsr 5e3e <TestRow>(pc)
    5bb8:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5bbc:	7230           	moveq #48,d1
    5bbe:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5bc2:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<7;i2++) {
    5bc6:	52af 007e      	addq.l #1,126(sp)
    5bca:	7406           	moveq #6,d2
    5bcc:	b4af 007e      	cmp.l 126(sp),d2
    5bd0:	6c94           	bge.s 5b66 <TestZoom4Picture+0x2b9e>
  }   

  tmp = source;
    5bd2:	2f6f 005e 001e 	move.l 94(sp),30(sp)
  source = destination;
    5bd8:	2f6f 003a 005e 	move.l 58(sp),94(sp)
  destination = tmp;
    5bde:	2f6f 001e 003a 	move.l 30(sp),58(sp)

  Zoom_ZoomIntoPicture( source, destination, 17, 1);
    5be4:	4878 0001      	pea 1 <_start+0x1>
    5be8:	4878 0011      	pea 11 <main+0xb>
    5bec:	2f2f 0042      	move.l 66(sp),-(sp)
    5bf0:	2f2f 006a      	move.l 106(sp),-(sp)
    5bf4:	4eba be96      	jsr 1a8c <Zoom_ZoomIntoPicture>(pc)
    5bf8:	4fef 0010      	lea 16(sp),sp
  WaitBlit();
    5bfc:	2039 0001 9834 	move.l 19834 <GfxBase>,d0
    5c02:	2c40           	movea.l d0,a6
    5c04:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    5c08:	202f 003a      	move.l 58(sp),d0
    5c0c:	5880           	addq.l #4,d0
    5c0e:	2f40 01c8      	move.l d0,456(sp)
  valsupposed = destlinezoom18;
    5c12:	2f7c 0001 9690 	move.l #104080,34(sp)
    5c18:	0022 

  mask = 0xffff;
    5c1a:	3f7c ffff 01c6 	move.w #-1,454(sp)

  TestRow( valsupposed, valactual, mask, 0);
    5c20:	7000           	moveq #0,d0
    5c22:	302f 01c6      	move.w 454(sp),d0
    5c26:	42a7           	clr.l -(sp)
    5c28:	2f00           	move.l d0,-(sp)
    5c2a:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c2e:	2f2f 002e      	move.l 46(sp),-(sp)
    5c32:	4eba 020a      	jsr 5e3e <TestRow>(pc)
    5c36:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5c3a:	7230           	moveq #48,d1
    5c3c:	d3af 01c8      	add.l d1,456(sp)
  mask = mask ^ 0xffff;
    5c40:	466f 01c6      	not.w 454(sp)

  for(int i2=0;i2<4;i2++) {
    5c44:	42af 007a      	clr.l 122(sp)
    5c48:	605c           	bra.s 5ca6 <TestZoom4Picture+0x2cde>
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    5c4a:	202f 007a      	move.l 122(sp),d0
    5c4e:	d080           	add.l d0,d0
    5c50:	2200           	move.l d0,d1
    5c52:	5281           	addq.l #1,d1
    5c54:	7000           	moveq #0,d0
    5c56:	302f 01c6      	move.w 454(sp),d0
    5c5a:	2f01           	move.l d1,-(sp)
    5c5c:	2f00           	move.l d0,-(sp)
    5c5e:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c62:	2f2f 002e      	move.l 46(sp),-(sp)
    5c66:	4eba 01d6      	jsr 5e3e <TestRow>(pc)
    5c6a:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c6e:	7430           	moveq #48,d2
    5c70:	d5af 01c8      	add.l d2,456(sp)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    5c74:	202f 007a      	move.l 122(sp),d0
    5c78:	5280           	addq.l #1,d0
    5c7a:	d080           	add.l d0,d0
    5c7c:	2200           	move.l d0,d1
    5c7e:	7000           	moveq #0,d0
    5c80:	302f 01c6      	move.w 454(sp),d0
    5c84:	2f01           	move.l d1,-(sp)
    5c86:	2f00           	move.l d0,-(sp)
    5c88:	2f2f 01d0      	move.l 464(sp),-(sp)
    5c8c:	2f2f 002e      	move.l 46(sp),-(sp)
    5c90:	4eba 01ac      	jsr 5e3e <TestRow>(pc)
    5c94:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5c98:	7030           	moveq #48,d0
    5c9a:	d1af 01c8      	add.l d0,456(sp)
    mask = mask ^ 0xffff;
    5c9e:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    5ca2:	52af 007a      	addq.l #1,122(sp)
    5ca6:	7203           	moveq #3,d1
    5ca8:	b2af 007a      	cmp.l 122(sp),d1
    5cac:	6c9c           	bge.s 5c4a <TestZoom4Picture+0x2c82>
  }

  for(int i=0;i<7;i++) {  
    5cae:	42af 0076      	clr.l 118(sp)
    5cb2:	6000 009c      	bra.w 5d50 <TestZoom4Picture+0x2d88>
    for(int i2=0;i2<18;i2++) {
    5cb6:	42af 0072      	clr.l 114(sp)
    5cba:	6000 0086      	bra.w 5d42 <TestZoom4Picture+0x2d7a>
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    5cbe:	222f 0076      	move.l 118(sp),d1
    5cc2:	2001           	move.l d1,d0
    5cc4:	e988           	lsl.l #4,d0
    5cc6:	d081           	add.l d1,d0
    5cc8:	d080           	add.l d0,d0
    5cca:	2040           	movea.l d0,a0
    5ccc:	d1c1           	adda.l d1,a0
    5cce:	41e8 000b      	lea 11(a0),a0
    5cd2:	202f 0072      	move.l 114(sp),d0
    5cd6:	d080           	add.l d0,d0
    5cd8:	2208           	move.l a0,d1
    5cda:	d280           	add.l d0,d1
    5cdc:	7000           	moveq #0,d0
    5cde:	302f 01c6      	move.w 454(sp),d0
    5ce2:	2f01           	move.l d1,-(sp)
    5ce4:	2f00           	move.l d0,-(sp)
    5ce6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5cea:	2f2f 002e      	move.l 46(sp),-(sp)
    5cee:	4eba 014e      	jsr 5e3e <TestRow>(pc)
    5cf2:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5cf6:	7430           	moveq #48,d2
    5cf8:	d5af 01c8      	add.l d2,456(sp)
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    5cfc:	222f 0076      	move.l 118(sp),d1
    5d00:	2001           	move.l d1,d0
    5d02:	e988           	lsl.l #4,d0
    5d04:	d081           	add.l d1,d0
    5d06:	d080           	add.l d0,d0
    5d08:	2040           	movea.l d0,a0
    5d0a:	d1c1           	adda.l d1,a0
    5d0c:	41e8 000c      	lea 12(a0),a0
    5d10:	202f 0072      	move.l 114(sp),d0
    5d14:	d080           	add.l d0,d0
    5d16:	2208           	move.l a0,d1
    5d18:	d280           	add.l d0,d1
    5d1a:	7000           	moveq #0,d0
    5d1c:	302f 01c6      	move.w 454(sp),d0
    5d20:	2f01           	move.l d1,-(sp)
    5d22:	2f00           	move.l d0,-(sp)
    5d24:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d28:	2f2f 002e      	move.l 46(sp),-(sp)
    5d2c:	4eba 0110      	jsr 5e3e <TestRow>(pc)
    5d30:	4fef 0010      	lea 16(sp),sp
      valactual += ZMLINESIZE/2;
    5d34:	7030           	moveq #48,d0
    5d36:	d1af 01c8      	add.l d0,456(sp)
      mask = mask ^ 0xffff;
    5d3a:	466f 01c6      	not.w 454(sp)
    for(int i2=0;i2<18;i2++) {
    5d3e:	52af 0072      	addq.l #1,114(sp)
    5d42:	7211           	moveq #17,d1
    5d44:	b2af 0072      	cmp.l 114(sp),d1
    5d48:	6c00 ff74      	bge.w 5cbe <TestZoom4Picture+0x2cf6>
  for(int i=0;i<7;i++) {  
    5d4c:	52af 0076      	addq.l #1,118(sp)
    5d50:	7406           	moveq #6,d2
    5d52:	b4af 0076      	cmp.l 118(sp),d2
    5d56:	6c00 ff5e      	bge.w 5cb6 <TestZoom4Picture+0x2cee>
    }
  } 

  for(int i2=0;i2<4;i2++) {
    5d5a:	42af 006e      	clr.l 110(sp)
    5d5e:	6064           	bra.s 5dc4 <TestZoom4Picture+0x2dfc>
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    5d60:	202f 006e      	move.l 110(sp),d0
    5d64:	0680 0000 0080 	addi.l #128,d0
    5d6a:	d080           	add.l d0,d0
    5d6c:	2200           	move.l d0,d1
    5d6e:	7000           	moveq #0,d0
    5d70:	302f 01c6      	move.w 454(sp),d0
    5d74:	2f01           	move.l d1,-(sp)
    5d76:	2f00           	move.l d0,-(sp)
    5d78:	2f2f 01d0      	move.l 464(sp),-(sp)
    5d7c:	2f2f 002e      	move.l 46(sp),-(sp)
    5d80:	4eba 00bc      	jsr 5e3e <TestRow>(pc)
    5d84:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5d88:	7030           	moveq #48,d0
    5d8a:	d1af 01c8      	add.l d0,456(sp)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    5d8e:	202f 006e      	move.l 110(sp),d0
    5d92:	d080           	add.l d0,d0
    5d94:	2200           	move.l d0,d1
    5d96:	0681 0000 0101 	addi.l #257,d1
    5d9c:	7000           	moveq #0,d0
    5d9e:	302f 01c6      	move.w 454(sp),d0
    5da2:	2f01           	move.l d1,-(sp)
    5da4:	2f00           	move.l d0,-(sp)
    5da6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5daa:	2f2f 002e      	move.l 46(sp),-(sp)
    5dae:	4eba 008e      	jsr 5e3e <TestRow>(pc)
    5db2:	4fef 0010      	lea 16(sp),sp
    valactual += ZMLINESIZE/2;
    5db6:	7230           	moveq #48,d1
    5db8:	d3af 01c8      	add.l d1,456(sp)
    mask = mask ^ 0xffff;
    5dbc:	466f 01c6      	not.w 454(sp)
  for(int i2=0;i2<4;i2++) {
    5dc0:	52af 006e      	addq.l #1,110(sp)
    5dc4:	7403           	moveq #3,d2
    5dc6:	b4af 006e      	cmp.l 110(sp),d2
    5dca:	6c94           	bge.s 5d60 <TestZoom4Picture+0x2d98>
  }
  TestRow( valsupposed, valactual, mask, 0);
    5dcc:	7000           	moveq #0,d0
    5dce:	302f 01c6      	move.w 454(sp),d0
    5dd2:	42a7           	clr.l -(sp)
    5dd4:	2f00           	move.l d0,-(sp)
    5dd6:	2f2f 01d0      	move.l 464(sp),-(sp)
    5dda:	2f2f 002e      	move.l 46(sp),-(sp)
    5dde:	4eba 005e      	jsr 5e3e <TestRow>(pc)
    5de2:	4fef 0010      	lea 16(sp),sp
  valactual += ZMLINESIZE/2;
    5de6:	7030           	moveq #48,d0
    5de8:	d1af 01c8      	add.l d0,456(sp)
  mask = mask ^ 0xffff;
    5dec:	466f 01c6      	not.w 454(sp)
  FreeMem( source, (ZMLINESIZE+4)*272);
    5df0:	2f6f 005e 001a 	move.l 94(sp),26(sp)
    5df6:	2f7c 0000 3740 	move.l #14144,22(sp)
    5dfc:	0016 
    5dfe:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    5e04:	2c40           	movea.l d0,a6
    5e06:	226f 001a      	movea.l 26(sp),a1
    5e0a:	202f 0016      	move.l 22(sp),d0
    5e0e:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, (ZMLINESIZE+4)*272);
    5e12:	2f6f 003a 0012 	move.l 58(sp),18(sp)
    5e18:	2f7c 0000 3740 	move.l #14144,14(sp)
    5e1e:	000e 
    5e20:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    5e26:	2c40           	movea.l d0,a6
    5e28:	226f 0012      	movea.l 18(sp),a1
    5e2c:	202f 000e      	move.l 14(sp),d0
    5e30:	4eae ff2e      	jsr -210(a6)
}
    5e34:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    5e38:	4fef 01d0      	lea 464(sp),sp
    5e3c:	4e75           	rts

00005e3e <TestRow>:

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    5e3e:	4fef ff40      	lea -192(sp),sp
    5e42:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
    5e46:	202f 00e0      	move.l 224(sp),d0
    5e4a:	3000           	move.w d0,d0
    5e4c:	3f40 0016      	move.w d0,22(sp)
  
  char str[ 100] = { 0 };
    5e50:	701c           	moveq #28,d0
    5e52:	d08f           	add.l sp,d0
    5e54:	7264           	moveq #100,d1
    5e56:	2f01           	move.l d1,-(sp)
    5e58:	42a7           	clr.l -(sp)
    5e5a:	2f00           	move.l d0,-(sp)
    5e5c:	4eba 0a20      	jsr 687e <memset>(pc)
    5e60:	4fef 000c      	lea 12(sp),sp
  UWORD data[2];
  data[1] = numberofline;
    5e64:	202f 00e4      	move.l 228(sp),d0
    5e68:	3f40 001a      	move.w d0,26(sp)

  testpattern += 0;
  destination += 0;

  for(int i=0;i<21;i++) {
    5e6c:	42af 00d0      	clr.l 208(sp)
    5e70:	6000 00d4      	bra.w 5f46 <TestRow+0x108>
    if( (*testpattern++ ^ xormask) != *destination++) {
    5e74:	202f 00d8      	move.l 216(sp),d0
    5e78:	2200           	move.l d0,d1
    5e7a:	5481           	addq.l #2,d1
    5e7c:	2f41 00d8      	move.l d1,216(sp)
    5e80:	2040           	movea.l d0,a0
    5e82:	3010           	move.w (a0),d0
    5e84:	322f 0016      	move.w 22(sp),d1
    5e88:	b141           	eor.w d0,d1
    5e8a:	202f 00dc      	move.l 220(sp),d0
    5e8e:	2400           	move.l d0,d2
    5e90:	5482           	addq.l #2,d2
    5e92:	2f42 00dc      	move.l d2,220(sp)
    5e96:	2040           	movea.l d0,a0
    5e98:	3010           	move.w (a0),d0
    5e9a:	b041           	cmp.w d1,d0
    5e9c:	6700 00a4      	beq.w 5f42 <TestRow+0x104>
      data[0] = i;
    5ea0:	202f 00d0      	move.l 208(sp),d0
    5ea4:	3f40 0018      	move.w d0,24(sp)
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    5ea8:	2f7c 0001 767e 	move.l #95870,204(sp)
    5eae:	00cc 
    5eb0:	702b           	moveq #43,d0
    5eb2:	4600           	not.b d0
    5eb4:	d08f           	add.l sp,d0
    5eb6:	0680 ffff ff44 	addi.l #-188,d0
    5ebc:	2f40 00c8      	move.l d0,200(sp)
    5ec0:	2f7c 0000 6a6c 	move.l #27244,196(sp)
    5ec6:	00c4 
    5ec8:	722b           	moveq #43,d1
    5eca:	4601           	not.b d1
    5ecc:	d28f           	add.l sp,d1
    5ece:	0681 ffff ff48 	addi.l #-184,d1
    5ed4:	2f41 00c0      	move.l d1,192(sp)
    5ed8:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    5ede:	2c40           	movea.l d0,a6
    5ee0:	206f 00cc      	movea.l 204(sp),a0
    5ee4:	226f 00c8      	movea.l 200(sp),a1
    5ee8:	246f 00c4      	movea.l 196(sp),a2
    5eec:	266f 00c0      	movea.l 192(sp),a3
    5ef0:	4eae fdf6      	jsr -522(a6)
    5ef4:	2f40 00bc      	move.l d0,188(sp)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    5ef8:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    5efe:	2c40           	movea.l d0,a6
    5f00:	4eae ffc4      	jsr -60(a6)
    5f04:	2f40 00b8      	move.l d0,184(sp)
    5f08:	202f 00b8      	move.l 184(sp),d0
    5f0c:	2f40 00b4      	move.l d0,180(sp)
    5f10:	742b           	moveq #43,d2
    5f12:	4602           	not.b d2
    5f14:	d48f           	add.l sp,d2
    5f16:	0682 ffff ff48 	addi.l #-184,d2
    5f1c:	2f42 00b0      	move.l d2,176(sp)
    5f20:	7064           	moveq #100,d0
    5f22:	2f40 00ac      	move.l d0,172(sp)
    5f26:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    5f2c:	2c40           	movea.l d0,a6
    5f2e:	222f 00b4      	move.l 180(sp),d1
    5f32:	242f 00b0      	move.l 176(sp),d2
    5f36:	262f 00ac      	move.l 172(sp),d3
    5f3a:	4eae ffd0      	jsr -48(a6)
    5f3e:	2f40 00a8      	move.l d0,168(sp)
  for(int i=0;i<21;i++) {
    5f42:	52af 00d0      	addq.l #1,208(sp)
    5f46:	7214           	moveq #20,d1
    5f48:	b2af 00d0      	cmp.l 208(sp),d1
    5f4c:	6c00 ff26      	bge.w 5e74 <TestRow+0x36>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    5f50:	206f 00d8      	movea.l 216(sp),a0
    5f54:	3010           	move.w (a0),d0
    5f56:	322f 0016      	move.w 22(sp),d1
    5f5a:	b141           	eor.w d0,d1
    5f5c:	206f 00dc      	movea.l 220(sp),a0
    5f60:	3010           	move.w (a0),d0
    5f62:	b340           	eor.w d1,d0
    5f64:	3000           	move.w d0,d0
    5f66:	0280 0000 ffff 	andi.l #65535,d0
    5f6c:	0280 0000 ff00 	andi.l #65280,d0
    5f72:	4a80           	tst.l d0
    5f74:	6700 00cc      	beq.w 6042 <TestRow+0x204>
    data[0] = 21;
    5f78:	3f7c 0015 0018 	move.w #21,24(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    5f7e:	2f7c 0001 767e 	move.l #95870,164(sp)
    5f84:	00a4 
    5f86:	742b           	moveq #43,d2
    5f88:	4602           	not.b d2
    5f8a:	d48f           	add.l sp,d2
    5f8c:	0682 ffff ff44 	addi.l #-188,d2
    5f92:	2f42 00a0      	move.l d2,160(sp)
    5f96:	2f7c 0000 6a6c 	move.l #27244,156(sp)
    5f9c:	009c 
    5f9e:	702b           	moveq #43,d0
    5fa0:	4600           	not.b d0
    5fa2:	d08f           	add.l sp,d0
    5fa4:	0680 ffff ff48 	addi.l #-184,d0
    5faa:	2f40 0098      	move.l d0,152(sp)
    5fae:	2039 0001 983c 	move.l 1983c <SysBase>,d0
    5fb4:	2c40           	movea.l d0,a6
    5fb6:	206f 00a4      	movea.l 164(sp),a0
    5fba:	226f 00a0      	movea.l 160(sp),a1
    5fbe:	246f 009c      	movea.l 156(sp),a2
    5fc2:	266f 0098      	movea.l 152(sp),a3
    5fc6:	4eae fdf6      	jsr -522(a6)
    5fca:	2f40 0094      	move.l d0,148(sp)
                                                                           str);
    Write(  Output(), str, 100);
    5fce:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    5fd4:	2c40           	movea.l d0,a6
    5fd6:	4eae ffc4      	jsr -60(a6)
    5fda:	2f40 0090      	move.l d0,144(sp)
    5fde:	202f 0090      	move.l 144(sp),d0
    5fe2:	2f40 008c      	move.l d0,140(sp)
    5fe6:	722b           	moveq #43,d1
    5fe8:	4601           	not.b d1
    5fea:	d28f           	add.l sp,d1
    5fec:	0681 ffff ff48 	addi.l #-184,d1
    5ff2:	2f41 0088      	move.l d1,136(sp)
    5ff6:	7464           	moveq #100,d2
    5ff8:	2f42 0084      	move.l d2,132(sp)
    5ffc:	2039 0001 9838 	move.l 19838 <DOSBase>,d0
    6002:	2c40           	movea.l d0,a6
    6004:	222f 008c      	move.l 140(sp),d1
    6008:	242f 0088      	move.l 136(sp),d2
    600c:	262f 0084      	move.l 132(sp),d3
    6010:	4eae ffd0      	jsr -48(a6)
    6014:	2f40 0080      	move.l d0,128(sp)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
    6018:	206f 00dc      	movea.l 220(sp),a0
    601c:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    601e:	7200           	moveq #0,d1
    6020:	3200           	move.w d0,d1
                                                   *testpattern,*destination);
    6022:	206f 00d8      	movea.l 216(sp),a0
    6026:	3010           	move.w (a0),d0
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    6028:	3000           	move.w d0,d0
    602a:	0280 0000 ffff 	andi.l #65535,d0
    6030:	2f01           	move.l d1,-(sp)
    6032:	2f00           	move.l d0,-(sp)
    6034:	4879 0001 76ae 	pea 176ae <incbin_swfont_end+0x408>
    603a:	4eba 0010      	jsr 604c <KPrintF>(pc)
    603e:	4fef 000c      	lea 12(sp),sp
     
  }
}
    6042:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    6046:	4fef 00c0      	lea 192(sp),sp
    604a:	4e75           	rts

0000604c <KPrintF>:
{
    604c:	4fef ff80      	lea -128(sp),sp
    6050:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    6054:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xee3da6>
    605a:	6734           	beq.s 6090 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    605c:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    6062:	206f 0090      	movea.l 144(sp),a0
    6066:	43ef 0094      	lea 148(sp),a1
    606a:	45f9 0000 6a6c 	lea 6a6c <PutChar>,a2
    6070:	47ef 000c      	lea 12(sp),a3
    6074:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    6078:	2f0b           	move.l a3,-(sp)
    607a:	4878 0056      	pea 56 <main+0x50>
    607e:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xee3da6>
    6084:	508f           	addq.l #8,sp
}
    6086:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    608a:	4fef 0080      	lea 128(sp),sp
    608e:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    6090:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    6096:	206f 0090      	movea.l 144(sp),a0
    609a:	43ef 0094      	lea 148(sp),a1
    609e:	45f9 0000 6a5e 	lea 6a5e <KPutCharX>,a2
    60a4:	97cb           	suba.l a3,a3
    60a6:	4eae fdf6      	jsr -522(a6)
}
    60aa:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    60ae:	4fef 0080      	lea 128(sp),sp
    60b2:	4e75           	rts

000060b4 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    60b4:	202f 0008      	move.l 8(sp),d0
    60b8:	d080           	add.l d0,d0
    60ba:	d080           	add.l d0,d0
    60bc:	206f 0004      	movea.l 4(sp),a0
    60c0:	2030 0800      	move.l (0,a0,d0.l),d0
    60c4:	b0af 000c      	cmp.l 12(sp),d0
    60c8:	57c0           	seq d0
    60ca:	4880           	ext.w d0
    60cc:	48c0           	ext.l d0
}
    60ce:	4480           	neg.l d0
    60d0:	4e75           	rts

000060d2 <TestCopperlistBatch>:
                                                                  long length) {
    60d2:	2f02           	move.l d2,-(sp)
    60d4:	226f 0008      	movea.l 8(sp),a1
    60d8:	206f 0010      	movea.l 16(sp),a0
    60dc:	222f 0014      	move.l 20(sp),d1
  for( int i=0;i<length;i++)
    60e0:	6f28           	ble.s 610a <TestCopperlistBatch+0x38>
    if( instructions[ pos+i] != batch[ i])
    60e2:	202f 000c      	move.l 12(sp),d0
    60e6:	d080           	add.l d0,d0
    60e8:	d080           	add.l d0,d0
    60ea:	2431 0800      	move.l (0,a1,d0.l),d2
    60ee:	b490           	cmp.l (a0),d2
    60f0:	6612           	bne.s 6104 <TestCopperlistBatch+0x32>
    60f2:	43f1 0804      	lea (4,a1,d0.l),a1
    60f6:	5888           	addq.l #4,a0
  for( int i=0;i<length;i++)
    60f8:	7000           	moveq #0,d0
    60fa:	5280           	addq.l #1,d0
    60fc:	b081           	cmp.l d1,d0
    60fe:	670a           	beq.s 610a <TestCopperlistBatch+0x38>
    if( instructions[ pos+i] != batch[ i])
    6100:	b388           	cmpm.l (a0)+,(a1)+
    6102:	67f6           	beq.s 60fa <TestCopperlistBatch+0x28>
      return 0;
    6104:	7000           	moveq #0,d0
}
    6106:	241f           	move.l (sp)+,d2
    6108:	4e75           	rts
  return 1;
    610a:	7001           	moveq #1,d0
}
    610c:	241f           	move.l (sp)+,d2
    610e:	4e75           	rts

00006110 <ClBuild>:
ULONG * ClBuild() {
    6110:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
    6114:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    611a:	707b           	moveq #123,d0
    611c:	4600           	not.b d0
    611e:	7202           	moveq #2,d1
    6120:	4eae ff3a      	jsr -198(a6)
    6124:	2440           	movea.l d0,a2
  if( retval == 0) {
    6126:	4a80           	tst.l d0
    6128:	6700 010e      	beq.w 6238 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    612c:	24b9 0001 976c 	move.l 1976c <ClsSprites>,(a2)
    6132:	2579 0001 9770 	move.l 19770 <ClsSprites+0x4>,4(a2)
    6138:	0004 
    613a:	2579 0001 9774 	move.l 19774 <ClsSprites+0x8>,8(a2)
    6140:	0008 
    6142:	2579 0001 9778 	move.l 19778 <ClsSprites+0xc>,12(a2)
    6148:	000c 
    614a:	2579 0001 977c 	move.l 1977c <ClsSprites+0x10>,16(a2)
    6150:	0010 
    6152:	2579 0001 9780 	move.l 19780 <ClsSprites+0x14>,20(a2)
    6158:	0014 
    615a:	2579 0001 9784 	move.l 19784 <ClsSprites+0x18>,24(a2)
    6160:	0018 
    6162:	2579 0001 9788 	move.l 19788 <ClsSprites+0x1c>,28(a2)
    6168:	001c 
    616a:	2579 0001 978c 	move.l 1978c <ClsSprites+0x20>,32(a2)
    6170:	0020 
    6172:	2579 0001 9790 	move.l 19790 <ClsSprites+0x24>,36(a2)
    6178:	0024 
    617a:	2579 0001 9794 	move.l 19794 <ClsSprites+0x28>,40(a2)
    6180:	0028 
    6182:	2579 0001 9798 	move.l 19798 <ClsSprites+0x2c>,44(a2)
    6188:	002c 
    618a:	2579 0001 979c 	move.l 1979c <ClsSprites+0x30>,48(a2)
    6190:	0030 
    6192:	2579 0001 97a0 	move.l 197a0 <ClsSprites+0x34>,52(a2)
    6198:	0034 
    619a:	2579 0001 97a4 	move.l 197a4 <ClsSprites+0x38>,56(a2)
    61a0:	0038 
    61a2:	2579 0001 97a8 	move.l 197a8 <ClsSprites+0x3c>,60(a2)
    61a8:	003c 
    *cl++ = *clpartinstruction++;
    61aa:	2579 0001 973c 	move.l 1973c <ClScreen>,64(a2)
    61b0:	0040 
    61b2:	2579 0001 9740 	move.l 19740 <ClScreen+0x4>,68(a2)
    61b8:	0044 
    61ba:	2579 0001 9744 	move.l 19744 <ClScreen+0x8>,72(a2)
    61c0:	0048 
    61c2:	2579 0001 9748 	move.l 19748 <ClScreen+0xc>,76(a2)
    61c8:	004c 
    61ca:	2579 0001 974c 	move.l 1974c <ClScreen+0x10>,80(a2)
    61d0:	0050 
    61d2:	2579 0001 9750 	move.l 19750 <ClScreen+0x14>,84(a2)
    61d8:	0054 
    61da:	2579 0001 9754 	move.l 19754 <ClScreen+0x18>,88(a2)
    61e0:	0058 
    61e2:	2579 0001 9758 	move.l 19758 <ClScreen+0x1c>,92(a2)
    61e8:	005c 
    61ea:	2579 0001 975c 	move.l 1975c <ClScreen+0x20>,96(a2)
    61f0:	0060 
    61f2:	2579 0001 9760 	move.l 19760 <ClScreen+0x24>,100(a2)
    61f8:	0064 
    61fa:	2579 0001 9764 	move.l 19764 <ClScreen+0x28>,104(a2)
    6200:	0068 
    6202:	2579 0001 9768 	move.l 19768 <ClScreen+0x2c>,108(a2)
    6208:	006c 
  *cl++ = 0x00e00000;
    620a:	257c 00e0 0000 	move.l #14680064,112(a2)
    6210:	0070 
  *cl++ = 0x00e20000;
    6212:	257c 00e2 0000 	move.l #14811136,116(a2)
    6218:	0074 
    *cl++ = *clpartinstruction++;
    621a:	2579 0001 96bc 	move.l 196bc <ClColor>,120(a2)
    6220:	0078 
    6222:	2579 0001 96c0 	move.l 196c0 <ClColor+0x4>,124(a2)
    6228:	007c 
  *cl = 0xfffffffe;
    622a:	70fe           	moveq #-2,d0
    622c:	2540 0080      	move.l d0,128(a2)
}
    6230:	200a           	move.l a2,d0
    6232:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    6236:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    6238:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
    623e:	4eae ffc4      	jsr -60(a6)
    6242:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
    6248:	2200           	move.l d0,d1
    624a:	243c 0001 6ccf 	move.l #93391,d2
    6250:	7628           	moveq #40,d3
    6252:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    6256:	2c79 0001 9838 	movea.l 19838 <DOSBase>,a6
    625c:	7201           	moveq #1,d1
    625e:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    6262:	24b9 0001 976c 	move.l 1976c <ClsSprites>,(a2)
    6268:	2579 0001 9770 	move.l 19770 <ClsSprites+0x4>,4(a2)
    626e:	0004 
    6270:	2579 0001 9774 	move.l 19774 <ClsSprites+0x8>,8(a2)
    6276:	0008 
    6278:	2579 0001 9778 	move.l 19778 <ClsSprites+0xc>,12(a2)
    627e:	000c 
    6280:	2579 0001 977c 	move.l 1977c <ClsSprites+0x10>,16(a2)
    6286:	0010 
    6288:	2579 0001 9780 	move.l 19780 <ClsSprites+0x14>,20(a2)
    628e:	0014 
    6290:	2579 0001 9784 	move.l 19784 <ClsSprites+0x18>,24(a2)
    6296:	0018 
    6298:	2579 0001 9788 	move.l 19788 <ClsSprites+0x1c>,28(a2)
    629e:	001c 
    62a0:	2579 0001 978c 	move.l 1978c <ClsSprites+0x20>,32(a2)
    62a6:	0020 
    62a8:	2579 0001 9790 	move.l 19790 <ClsSprites+0x24>,36(a2)
    62ae:	0024 
    62b0:	2579 0001 9794 	move.l 19794 <ClsSprites+0x28>,40(a2)
    62b6:	0028 
    62b8:	2579 0001 9798 	move.l 19798 <ClsSprites+0x2c>,44(a2)
    62be:	002c 
    62c0:	2579 0001 979c 	move.l 1979c <ClsSprites+0x30>,48(a2)
    62c6:	0030 
    62c8:	2579 0001 97a0 	move.l 197a0 <ClsSprites+0x34>,52(a2)
    62ce:	0034 
    62d0:	2579 0001 97a4 	move.l 197a4 <ClsSprites+0x38>,56(a2)
    62d6:	0038 
    62d8:	2579 0001 97a8 	move.l 197a8 <ClsSprites+0x3c>,60(a2)
    62de:	003c 
    *cl++ = *clpartinstruction++;
    62e0:	2579 0001 973c 	move.l 1973c <ClScreen>,64(a2)
    62e6:	0040 
    62e8:	2579 0001 9740 	move.l 19740 <ClScreen+0x4>,68(a2)
    62ee:	0044 
    62f0:	2579 0001 9744 	move.l 19744 <ClScreen+0x8>,72(a2)
    62f6:	0048 
    62f8:	2579 0001 9748 	move.l 19748 <ClScreen+0xc>,76(a2)
    62fe:	004c 
    6300:	2579 0001 974c 	move.l 1974c <ClScreen+0x10>,80(a2)
    6306:	0050 
    6308:	2579 0001 9750 	move.l 19750 <ClScreen+0x14>,84(a2)
    630e:	0054 
    6310:	2579 0001 9754 	move.l 19754 <ClScreen+0x18>,88(a2)
    6316:	0058 
    6318:	2579 0001 9758 	move.l 19758 <ClScreen+0x1c>,92(a2)
    631e:	005c 
    6320:	2579 0001 975c 	move.l 1975c <ClScreen+0x20>,96(a2)
    6326:	0060 
    6328:	2579 0001 9760 	move.l 19760 <ClScreen+0x24>,100(a2)
    632e:	0064 
    6330:	2579 0001 9764 	move.l 19764 <ClScreen+0x28>,104(a2)
    6336:	0068 
    6338:	2579 0001 9768 	move.l 19768 <ClScreen+0x2c>,108(a2)
    633e:	006c 
  *cl++ = 0x00e00000;
    6340:	257c 00e0 0000 	move.l #14680064,112(a2)
    6346:	0070 
  *cl++ = 0x00e20000;
    6348:	257c 00e2 0000 	move.l #14811136,116(a2)
    634e:	0074 
    *cl++ = *clpartinstruction++;
    6350:	2579 0001 96bc 	move.l 196bc <ClColor>,120(a2)
    6356:	0078 
    6358:	2579 0001 96c0 	move.l 196c0 <ClColor+0x4>,124(a2)
    635e:	007c 
  *cl = 0xfffffffe;
    6360:	70fe           	moveq #-2,d0
    6362:	2540 0080      	move.l d0,128(a2)
}
    6366:	200a           	move.l a2,d0
    6368:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    636c:	4e75           	rts

0000636e <MouseLeft>:
  for(long i=0;i<size; i+=4) {
    *target++ = pattern;
  }
}

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
    636e:	1039 00bf e001 	move.b bfe001 <gcc8_c_support.c.e9862530+0xbd1e47>,d0
    6374:	ec08           	lsr.b #6,d0
    6376:	0a00 0001      	eori.b #1,d0
    637a:	0240 0001      	andi.w #1,d0
    637e:	4e75           	rts

00006380 <Utils_FillLong>:
void Utils_FillLong( ULONG *target, ULONG pattern, ULONG size) {
    6380:	2f02           	move.l d2,-(sp)
    6382:	206f 0008      	movea.l 8(sp),a0
    6386:	202f 000c      	move.l 12(sp),d0
  for(long i=0;i<size; i+=4) {
    638a:	4aaf 0010      	tst.l 16(sp)
    638e:	6714           	beq.s 63a4 <Utils_FillLong+0x24>
    6390:	222f 0010      	move.l 16(sp),d1
    6394:	5381           	subq.l #1,d1
    6396:	74fc           	moveq #-4,d2
    6398:	c282           	and.l d2,d1
    639a:	43f0 1804      	lea (4,a0,d1.l),a1
    *target++ = pattern;
    639e:	20c0           	move.l d0,(a0)+
  for(long i=0;i<size; i+=4) {
    63a0:	b3c8           	cmpa.l a0,a1
    63a2:	66fa           	bne.s 639e <Utils_FillLong+0x1e>
}
    63a4:	241f           	move.l (sp)+,d2
    63a6:	4e75           	rts

000063a8 <WaitVbl>:
void WaitVbl() {
    63a8:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    63aa:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    63b0:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    63b2:	2017           	move.l (sp),d0
    63b4:	0280 0001 ff00 	andi.l #130816,d0
    63ba:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    63bc:	2017           	move.l (sp),d0
    63be:	0c80 0001 3700 	cmpi.l #79616,d0
    63c4:	67e4           	beq.s 63aa <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    63c6:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    63cc:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    63d0:	202f 0004      	move.l 4(sp),d0
    63d4:	0280 0001 ff00 	andi.l #130816,d0
    63da:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    63de:	202f 0004      	move.l 4(sp),d0
    63e2:	0c80 0001 3700 	cmpi.l #79616,d0
    63e8:	66dc           	bne.s 63c6 <WaitVbl+0x1e>
}
    63ea:	508f           	addq.l #8,sp
    63ec:	4e75           	rts

000063ee <FreeSystem>:
void FreeSystem() { 
    63ee:	518f           	subq.l #8,sp
    63f0:	2f0e           	move.l a6,-(sp)
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    63f2:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    63f8:	2f40 0008      	move.l d0,8(sp)
		vpos&=0x1ff00;
    63fc:	202f 0008      	move.l 8(sp),d0
    6400:	0280 0001 ff00 	andi.l #130816,d0
    6406:	2f40 0008      	move.l d0,8(sp)
		if (vpos!=(311<<8))
    640a:	202f 0008      	move.l 8(sp),d0
    640e:	0c80 0001 3700 	cmpi.l #79616,d0
    6414:	67dc           	beq.s 63f2 <FreeSystem+0x4>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    6416:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    641c:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    6420:	202f 0004      	move.l 4(sp),d0
    6424:	0280 0001 ff00 	andi.l #130816,d0
    642a:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    642e:	202f 0004      	move.l 4(sp),d0
    6432:	0c80 0001 3700 	cmpi.l #79616,d0
    6438:	66dc           	bne.s 6416 <FreeSystem+0x28>
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    643a:	2079 0001 9820 	movea.l 19820 <hw>,a0
    6440:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    6444:	3028 0002      	move.w 2(a0),d0
    6448:	0800 000e      	btst #14,d0
    644c:	66f6           	bne.s 6444 <FreeSystem+0x56>
	hw->intena=0x7fff;//disable all interrupts
    644e:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    6454:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    645a:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    6460:	2279 0001 9808 	movea.l 19808 <VBR.lto_priv.0>,a1
    6466:	2379 0001 980c 	move.l 1980c <SystemIrq>,108(a1)
    646c:	006c 
	hw->cop1lc=(ULONG)GfxBase->copinit;
    646e:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    6474:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    647a:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    6480:	317c 7fff 0088 	move.w #32767,136(a0)
	hw->intena=SystemInts|0x8000;
    6486:	3039 0001 9806 	move.w 19806 <SystemInts>,d0
    648c:	0040 8000      	ori.w #-32768,d0
    6490:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    6494:	3039 0001 9804 	move.w 19804 <SystemDMA>,d0
    649a:	0040 8000      	ori.w #-32768,d0
    649e:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    64a2:	3039 0001 9802 	move.w 19802 <SystemADKCON>,d0
    64a8:	0040 8000      	ori.w #-32768,d0
    64ac:	3140 009e      	move.w d0,158(a0)
	LoadView(ActiView);
    64b0:	2279 0001 97fe 	movea.l 197fe <ActiView>,a1
    64b6:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    64ba:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    64c0:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    64c4:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    64ca:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    64ce:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    64d4:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    64d8:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    64de:	4eae fe32      	jsr -462(a6)
  Permit();
    64e2:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    64e8:	4eae ff76      	jsr -138(a6)
}
    64ec:	2c5f           	movea.l (sp)+,a6
    64ee:	508f           	addq.l #8,sp
    64f0:	4e75           	rts

000064f2 <TakeSystem>:
void TakeSystem() {
    64f2:	4fef ffd8      	lea -40(sp),sp
    64f6:	2f0e           	move.l a6,-(sp)
    64f8:	2f07           	move.l d7,-(sp)
	ActiView=GfxBase->ActiView; //store current view
    64fa:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    6500:	23ee 0022 0001 	move.l 34(a6),197fe <ActiView>
    6506:	97fe 
	OwnBlitter();
    6508:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    650c:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    6512:	4eae ff1c      	jsr -228(a6)
  Forbid();
    6516:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    651c:	4eae ff7c      	jsr -132(a6)
	SystemADKCON=hw->adkconr;
    6520:	2079 0001 9820 	movea.l 19820 <hw>,a0
    6526:	3028 0010      	move.w 16(a0),d0
    652a:	33c0 0001 9802 	move.w d0,19802 <SystemADKCON>
	SystemInts=hw->intenar;
    6530:	3028 001c      	move.w 28(a0),d0
    6534:	33c0 0001 9806 	move.w d0,19806 <SystemInts>
	SystemDMA=hw->dmaconr;
    653a:	3028 0002      	move.w 2(a0),d0
    653e:	33c0 0001 9804 	move.w d0,19804 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    6544:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    654a:	317c 7fff 009c 	move.w #32767,156(a0)
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    6550:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    6556:	2f40 0026      	move.l d0,38(sp)
		vpos&=0x1ff00;
    655a:	202f 0026      	move.l 38(sp),d0
    655e:	0280 0001 ff00 	andi.l #130816,d0
    6564:	2f40 0026      	move.l d0,38(sp)
		if (vpos!=(311<<8))
    6568:	202f 0026      	move.l 38(sp),d0
    656c:	0c80 0001 3700 	cmpi.l #79616,d0
    6572:	67dc           	beq.s 6550 <TakeSystem+0x5e>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    6574:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    657a:	2f40 0022      	move.l d0,34(sp)
		vpos&=0x1ff00;
    657e:	202f 0022      	move.l 34(sp),d0
    6582:	0280 0001 ff00 	andi.l #130816,d0
    6588:	2f40 0022      	move.l d0,34(sp)
		if (vpos==(311<<8))
    658c:	202f 0022      	move.l 34(sp),d0
    6590:	0c80 0001 3700 	cmpi.l #79616,d0
    6596:	66dc           	bne.s 6574 <TakeSystem+0x82>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    6598:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    659e:	2f40 001e      	move.l d0,30(sp)
		vpos&=0x1ff00;
    65a2:	202f 001e      	move.l 30(sp),d0
    65a6:	0280 0001 ff00 	andi.l #130816,d0
    65ac:	2f40 001e      	move.l d0,30(sp)
		if (vpos!=(311<<8))
    65b0:	202f 001e      	move.l 30(sp),d0
    65b4:	0c80 0001 3700 	cmpi.l #79616,d0
    65ba:	67dc           	beq.s 6598 <TakeSystem+0xa6>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    65bc:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    65c2:	2f40 001a      	move.l d0,26(sp)
		vpos&=0x1ff00;
    65c6:	202f 001a      	move.l 26(sp),d0
    65ca:	0280 0001 ff00 	andi.l #130816,d0
    65d0:	2f40 001a      	move.l d0,26(sp)
		if (vpos==(311<<8))
    65d4:	202f 001a      	move.l 26(sp),d0
    65d8:	0c80 0001 3700 	cmpi.l #79616,d0
    65de:	66dc           	bne.s 65bc <TakeSystem+0xca>
	hw->dmacon=0x7fff;//Clear all DMA channels
    65e0:	317c 7fff 0096 	move.w #32767,150(a0)
	LoadView(0);
    65e6:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    65ec:	93c9           	suba.l a1,a1
    65ee:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    65f2:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    65f8:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    65fc:	2c79 0001 9834 	movea.l 19834 <GfxBase>,a6
    6602:	4eae fef2      	jsr -270(a6)
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    6606:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    660c:	2f40 0016      	move.l d0,22(sp)
		vpos&=0x1ff00;
    6610:	202f 0016      	move.l 22(sp),d0
    6614:	0280 0001 ff00 	andi.l #130816,d0
    661a:	2f40 0016      	move.l d0,22(sp)
		if (vpos!=(311<<8))
    661e:	202f 0016      	move.l 22(sp),d0
    6622:	0c80 0001 3700 	cmpi.l #79616,d0
    6628:	67dc           	beq.s 6606 <TakeSystem+0x114>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    662a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    6630:	2f40 0012      	move.l d0,18(sp)
		vpos&=0x1ff00;
    6634:	202f 0012      	move.l 18(sp),d0
    6638:	0280 0001 ff00 	andi.l #130816,d0
    663e:	2f40 0012      	move.l d0,18(sp)
		if (vpos==(311<<8))
    6642:	202f 0012      	move.l 18(sp),d0
    6646:	0c80 0001 3700 	cmpi.l #79616,d0
    664c:	66dc           	bne.s 662a <TakeSystem+0x138>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    664e:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    6654:	2f40 000e      	move.l d0,14(sp)
		vpos&=0x1ff00;
    6658:	202f 000e      	move.l 14(sp),d0
    665c:	0280 0001 ff00 	andi.l #130816,d0
    6662:	2f40 000e      	move.l d0,14(sp)
		if (vpos!=(311<<8))
    6666:	202f 000e      	move.l 14(sp),d0
    666a:	0c80 0001 3700 	cmpi.l #79616,d0
    6670:	67dc           	beq.s 664e <TakeSystem+0x15c>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    6672:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xdd2e4a>,d0
    6678:	2f40 000a      	move.l d0,10(sp)
		vpos&=0x1ff00;
    667c:	202f 000a      	move.l 10(sp),d0
    6680:	0280 0001 ff00 	andi.l #130816,d0
    6686:	2f40 000a      	move.l d0,10(sp)
		if (vpos==(311<<8))
    668a:	202f 000a      	move.l 10(sp),d0
    668e:	0c80 0001 3700 	cmpi.l #79616,d0
    6694:	66dc           	bne.s 6672 <TakeSystem+0x180>
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    6696:	3f7c 4e7a 002a 	move.w #20090,42(sp)
    669c:	3f7c 0801 002c 	move.w #2049,44(sp)
    66a2:	3f7c 4e73 002e 	move.w #20083,46(sp)
	if (SysBase->AttnFlags & AFF_68010) 
    66a8:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    66ae:	082e 0000 0129 	btst #0,297(a6)
    66b4:	672c           	beq.s 66e2 <TakeSystem+0x1f0>
		vbr = (APTR)Supervisor((void*)getvbr);
    66b6:	7e2a           	moveq #42,d7
    66b8:	de8f           	add.l sp,d7
    66ba:	cf8d           	exg d7,a5
    66bc:	4eae ffe2      	jsr -30(a6)
    66c0:	cf8d           	exg d7,a5
	VBR=GetVBR();
    66c2:	23c0 0001 9808 	move.l d0,19808 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    66c8:	2079 0001 9808 	movea.l 19808 <VBR.lto_priv.0>,a0
    66ce:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
    66d2:	23c0 0001 980c 	move.l d0,1980c <SystemIrq>
}
    66d8:	2e1f           	move.l (sp)+,d7
    66da:	2c5f           	movea.l (sp)+,a6
    66dc:	4fef 0028      	lea 40(sp),sp
    66e0:	4e75           	rts
	APTR vbr = 0;
    66e2:	7000           	moveq #0,d0
	VBR=GetVBR();
    66e4:	23c0 0001 9808 	move.l d0,19808 <VBR.lto_priv.0>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    66ea:	2079 0001 9808 	movea.l 19808 <VBR.lto_priv.0>,a0
    66f0:	2028 006c      	move.l 108(a0),d0
	SystemIrq=GetInterruptHandler(); //store interrupt register
    66f4:	23c0 0001 980c 	move.l d0,1980c <SystemIrq>
}
    66fa:	2e1f           	move.l (sp)+,d7
    66fc:	2c5f           	movea.l (sp)+,a6
    66fe:	4fef 0028      	lea 40(sp),sp
    6702:	4e75           	rts

00006704 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    6704:	2039 0001 9824 	move.l 19824 <DrawCopper>,d0
  DrawCopper = ViewCopper;
    670a:	23f9 0001 9810 	move.l 19810 <ViewCopper>,19824 <DrawCopper>
    6710:	0001 9824 
  ViewCopper = (ULONG *)tmp;
    6714:	23c0 0001 9810 	move.l d0,19810 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    671a:	2079 0001 9820 	movea.l 19820 <hw>,a0
    6720:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    6724:	3140 0088      	move.w d0,136(a0)
}
    6728:	4e75           	rts

0000672a <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    672a:	2039 0001 9830 	move.l 19830 <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    6730:	2079 0001 9824 	movea.l 19824 <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    6736:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    673a:	2200           	move.l d0,d1
    673c:	4241           	clr.w d1
    673e:	4841           	swap d1
    6740:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    6744:	23f9 0001 9828 	move.l 19828 <ViewBuffer>,19830 <DrawBuffer>
    674a:	0001 9830 
  ViewBuffer = (ULONG *) tmp;
    674e:	23c0 0001 9828 	move.l d0,19828 <ViewBuffer>
}
    6754:	4e75           	rts

00006756 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    6756:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    675a:	262f 0010      	move.l 16(sp),d3
    675e:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    6762:	2279 0001 982c 	movea.l 1982c <Copperlist1>,a1
    6768:	b2fc 0000      	cmpa.w #0,a1
    676c:	670c           	beq.s 677a <FreeDisplay+0x24>
    676e:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    6774:	2003           	move.l d3,d0
    6776:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    677a:	2279 0001 981c 	movea.l 1981c <Copperlist2>,a1
    6780:	b2fc 0000      	cmpa.w #0,a1
    6784:	670c           	beq.s 6792 <FreeDisplay+0x3c>
    6786:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    678c:	2003           	move.l d3,d0
    678e:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    6792:	2279 0001 9818 	movea.l 19818 <Bitplane1>,a1
    6798:	b2fc 0000      	cmpa.w #0,a1
    679c:	670c           	beq.s 67aa <FreeDisplay+0x54>
    679e:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    67a4:	2002           	move.l d2,d0
    67a6:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    67aa:	2279 0001 9814 	movea.l 19814 <Bitplane2>,a1
    67b0:	b2fc 0000      	cmpa.w #0,a1
    67b4:	670c           	beq.s 67c2 <FreeDisplay+0x6c>
    67b6:	2c79 0001 983c 	movea.l 1983c <SysBase>,a6
    67bc:	2002           	move.l d2,d0
    67be:	4eae ff2e      	jsr -210(a6)
}
    67c2:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    67c6:	4e75           	rts

000067c8 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    67c8:	2079 0001 9820 	movea.l 19820 <hw>,a0
    67ce:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    67d2:	3028 0002      	move.w 2(a0),d0
    67d6:	0800 000e      	btst #14,d0
    67da:	66f6           	bne.s 67d2 <WaitBlt+0xa>
}
    67dc:	4e75           	rts

000067de <SetInterruptHandler>:
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    67de:	2079 0001 9808 	movea.l 19808 <VBR.lto_priv.0>,a0
    67e4:	216f 0004 006c 	move.l 4(sp),108(a0)
}
    67ea:	4e75           	rts

000067ec <memcpy>:
{
    67ec:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    67f0:	202f 0014      	move.l 20(sp),d0
    67f4:	226f 0018      	movea.l 24(sp),a1
    67f8:	222f 001c      	move.l 28(sp),d1
	while(len--)
    67fc:	2601           	move.l d1,d3
    67fe:	5383           	subq.l #1,d3
    6800:	4a81           	tst.l d1
    6802:	6762           	beq.s 6866 <memcpy+0x7a>
    6804:	2040           	movea.l d0,a0
    6806:	5888           	addq.l #4,a0
    6808:	b1c9           	cmpa.l a1,a0
    680a:	53c2           	sl.s d2
    680c:	4402           	neg.b d2
    680e:	41e9 0004      	lea 4(a1),a0
    6812:	b1c0           	cmpa.l d0,a0
    6814:	53c4           	sl.s d4
    6816:	4404           	neg.b d4
    6818:	8404           	or.b d4,d2
    681a:	7808           	moveq #8,d4
    681c:	b883           	cmp.l d3,d4
    681e:	55c4           	sc.s d4
    6820:	4404           	neg.b d4
    6822:	c404           	and.b d4,d2
    6824:	6746           	beq.s 686c <memcpy+0x80>
    6826:	2409           	move.l a1,d2
    6828:	8480           	or.l d0,d2
    682a:	7803           	moveq #3,d4
    682c:	c484           	and.l d4,d2
    682e:	663c           	bne.s 686c <memcpy+0x80>
    6830:	2049           	movea.l a1,a0
    6832:	2440           	movea.l d0,a2
    6834:	74fc           	moveq #-4,d2
    6836:	c481           	and.l d1,d2
    6838:	d489           	add.l a1,d2
		*d++ = *s++;
    683a:	24d8           	move.l (a0)+,(a2)+
    683c:	b488           	cmp.l a0,d2
    683e:	66fa           	bne.s 683a <memcpy+0x4e>
    6840:	74fc           	moveq #-4,d2
    6842:	c481           	and.l d1,d2
    6844:	2040           	movea.l d0,a0
    6846:	d1c2           	adda.l d2,a0
    6848:	d3c2           	adda.l d2,a1
    684a:	9682           	sub.l d2,d3
    684c:	b481           	cmp.l d1,d2
    684e:	6716           	beq.s 6866 <memcpy+0x7a>
    6850:	1091           	move.b (a1),(a0)
	while(len--)
    6852:	4a83           	tst.l d3
    6854:	6710           	beq.s 6866 <memcpy+0x7a>
		*d++ = *s++;
    6856:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    685c:	5383           	subq.l #1,d3
    685e:	6706           	beq.s 6866 <memcpy+0x7a>
		*d++ = *s++;
    6860:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    6866:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    686a:	4e75           	rts
    686c:	2040           	movea.l d0,a0
    686e:	d289           	add.l a1,d1
		*d++ = *s++;
    6870:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    6872:	b289           	cmp.l a1,d1
    6874:	67f0           	beq.s 6866 <memcpy+0x7a>
		*d++ = *s++;
    6876:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    6878:	b289           	cmp.l a1,d1
    687a:	66f4           	bne.s 6870 <memcpy+0x84>
    687c:	60e8           	bra.s 6866 <memcpy+0x7a>

0000687e <memset>:
{
    687e:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    6882:	202f 0024      	move.l 36(sp),d0
    6886:	2a2f 0028      	move.l 40(sp),d5
    688a:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    688e:	2809           	move.l a1,d4
    6890:	5384           	subq.l #1,d4
    6892:	b2fc 0000      	cmpa.w #0,a1
    6896:	6f00 00b0      	ble.w 6948 <memset+0xca>
    689a:	1e05           	move.b d5,d7
    689c:	2200           	move.l d0,d1
    689e:	4481           	neg.l d1
    68a0:	7403           	moveq #3,d2
    68a2:	c282           	and.l d2,d1
    68a4:	7c05           	moveq #5,d6
		*ptr++ = val;
    68a6:	2440           	movea.l d0,a2
    68a8:	bc84           	cmp.l d4,d6
    68aa:	646a           	bcc.s 6916 <memset+0x98>
    68ac:	4a81           	tst.l d1
    68ae:	6724           	beq.s 68d4 <memset+0x56>
    68b0:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    68b2:	5384           	subq.l #1,d4
    68b4:	7401           	moveq #1,d2
    68b6:	b481           	cmp.l d1,d2
    68b8:	671a           	beq.s 68d4 <memset+0x56>
		*ptr++ = val;
    68ba:	2440           	movea.l d0,a2
    68bc:	548a           	addq.l #2,a2
    68be:	2040           	movea.l d0,a0
    68c0:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    68c4:	5384           	subq.l #1,d4
    68c6:	7403           	moveq #3,d2
    68c8:	b481           	cmp.l d1,d2
    68ca:	6608           	bne.s 68d4 <memset+0x56>
		*ptr++ = val;
    68cc:	528a           	addq.l #1,a2
    68ce:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    68d2:	5384           	subq.l #1,d4
    68d4:	2609           	move.l a1,d3
    68d6:	9681           	sub.l d1,d3
    68d8:	7c00           	moveq #0,d6
    68da:	1c05           	move.b d5,d6
    68dc:	2406           	move.l d6,d2
    68de:	4842           	swap d2
    68e0:	4242           	clr.w d2
    68e2:	2042           	movea.l d2,a0
    68e4:	2406           	move.l d6,d2
    68e6:	e14a           	lsl.w #8,d2
    68e8:	4842           	swap d2
    68ea:	4242           	clr.w d2
    68ec:	e18e           	lsl.l #8,d6
    68ee:	2646           	movea.l d6,a3
    68f0:	2c08           	move.l a0,d6
    68f2:	8486           	or.l d6,d2
    68f4:	2c0b           	move.l a3,d6
    68f6:	8486           	or.l d6,d2
    68f8:	1407           	move.b d7,d2
    68fa:	2040           	movea.l d0,a0
    68fc:	d1c1           	adda.l d1,a0
    68fe:	72fc           	moveq #-4,d1
    6900:	c283           	and.l d3,d1
    6902:	d288           	add.l a0,d1
		*ptr++ = val;
    6904:	20c2           	move.l d2,(a0)+
    6906:	b1c1           	cmpa.l d1,a0
    6908:	66fa           	bne.s 6904 <memset+0x86>
    690a:	72fc           	moveq #-4,d1
    690c:	c283           	and.l d3,d1
    690e:	d5c1           	adda.l d1,a2
    6910:	9881           	sub.l d1,d4
    6912:	b283           	cmp.l d3,d1
    6914:	6732           	beq.s 6948 <memset+0xca>
    6916:	1485           	move.b d5,(a2)
	while(len-- > 0)
    6918:	4a84           	tst.l d4
    691a:	6f2c           	ble.s 6948 <memset+0xca>
		*ptr++ = val;
    691c:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    6920:	7201           	moveq #1,d1
    6922:	b284           	cmp.l d4,d1
    6924:	6c22           	bge.s 6948 <memset+0xca>
		*ptr++ = val;
    6926:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    692a:	7402           	moveq #2,d2
    692c:	b484           	cmp.l d4,d2
    692e:	6c18           	bge.s 6948 <memset+0xca>
		*ptr++ = val;
    6930:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    6934:	7c03           	moveq #3,d6
    6936:	bc84           	cmp.l d4,d6
    6938:	6c0e           	bge.s 6948 <memset+0xca>
		*ptr++ = val;
    693a:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    693e:	7204           	moveq #4,d1
    6940:	b284           	cmp.l d4,d1
    6942:	6c04           	bge.s 6948 <memset+0xca>
		*ptr++ = val;
    6944:	1545 0005      	move.b d5,5(a2)
}
    6948:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    694c:	4e75           	rts

0000694e <strlen>:
{
    694e:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    6952:	7000           	moveq #0,d0
	while(*s++)
    6954:	4a10           	tst.b (a0)
    6956:	6708           	beq.s 6960 <strlen+0x12>
		t++;
    6958:	5280           	addq.l #1,d0
	while(*s++)
    695a:	4a30 0800      	tst.b (0,a0,d0.l)
    695e:	66f8           	bne.s 6958 <strlen+0xa>
}
    6960:	4e75           	rts
    6962:	4e71           	nop

00006964 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    6964:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    6968:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    696c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    6970:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    6974:	d041           	add.w d1,d0
	swap	d0
    6976:	4840           	swap d0
	clrw	d0
    6978:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    697a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    697e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    6982:	d081           	add.l d1,d0

	rts
    6984:	4e75           	rts

00006986 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    6986:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    6988:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    698c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    6990:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    6996:	6416           	bcc.s 69ae <__udivsi3+0x28>
	movel	d0, d2
    6998:	2400           	move.l d0,d2
	clrw	d2
    699a:	4242           	clr.w d2
	swap	d2
    699c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    699e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    69a0:	3002           	move.w d2,d0
	swap	d0
    69a2:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    69a4:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    69a8:	84c1           	divu.w d1,d2
	movew	d2, d0
    69aa:	3002           	move.w d2,d0
	jra	6f
    69ac:	6030           	bra.s 69de <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    69ae:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    69b0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    69b2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    69b4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    69ba:	64f4           	bcc.s 69b0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    69bc:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    69be:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    69c4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    69c6:	c2c0           	mulu.w d0,d1
	swap	d2
    69c8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    69ca:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    69cc:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    69ce:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    69d0:	660a           	bne.s 69dc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    69d2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    69d4:	6506           	bcs.s 69dc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    69d6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    69da:	6302           	bls.s 69de <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    69dc:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    69de:	241f           	move.l (sp)+,d2
	rts
    69e0:	4e75           	rts

000069e2 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    69e2:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    69e4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    69e6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    69ea:	6a04           	bpl.s 69f0 <__divsi3+0xe>
	negl	d1
    69ec:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    69ee:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    69f0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    69f4:	6a04           	bpl.s 69fa <__divsi3+0x18>
	negl	d0
    69f6:	4480           	neg.l d0
	negb	d2
    69f8:	4402           	neg.b d2

2:	movel	d1, sp@-
    69fa:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    69fc:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    69fe:	6186           	bsr.s 6986 <__udivsi3>
	addql	IMM (8), sp
    6a00:	508f           	addq.l #8,sp

	tstb	d2
    6a02:	4a02           	tst.b d2
	jpl	3f
    6a04:	6a02           	bpl.s 6a08 <__divsi3+0x26>
	negl	d0
    6a06:	4480           	neg.l d0

3:	movel	sp@+, d2
    6a08:	241f           	move.l (sp)+,d2
	rts
    6a0a:	4e75           	rts

00006a0c <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    6a0c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    6a10:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    6a14:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    6a16:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    6a18:	61c8           	bsr.s 69e2 <__divsi3>
	addql	IMM (8), sp
    6a1a:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    6a1c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    6a20:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    6a22:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    6a24:	6100 ff3e      	bsr.w 6964 <__mulsi3>
	addql	IMM (8), sp
    6a28:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    6a2a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    6a2e:	9280           	sub.l d0,d1
	movel	d1, d0
    6a30:	2001           	move.l d1,d0
	rts
    6a32:	4e75           	rts

00006a34 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    6a34:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    6a38:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    6a3c:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    6a3e:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    6a40:	6100 ff44      	bsr.w 6986 <__udivsi3>
	addql	IMM (8), sp
    6a44:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    6a46:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    6a4a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    6a4c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    6a4e:	6100 ff14      	bsr.w 6964 <__mulsi3>
	addql	IMM (8), sp
    6a52:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    6a54:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    6a58:	9280           	sub.l d0,d1
	movel	d1, d0
    6a5a:	2001           	move.l d1,d0
	rts
    6a5c:	4e75           	rts

00006a5e <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    6a5e:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    6a60:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    6a64:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    6a68:	2c5f           	movea.l (sp)+,a6
    rts
    6a6a:	4e75           	rts

00006a6c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    6a6c:	16c0           	move.b d0,(a3)+
	rts
    6a6e:	4e75           	rts

00006a70 <saveregs>:
	...

00006aac <font2distance>:
    6aac:	0505           	btst d2,d5
    6aae:	0505           	btst d2,d5
    6ab0:	0505           	btst d2,d5
    6ab2:	0505           	btst d2,d5
    6ab4:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    6ab6:	0505           	btst d2,d5
    6ab8:	0505           	btst d2,d5
    6aba:	0005 0505      	ori.b #5,d5
    6abe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    6ac0:	0505           	btst d2,d5
    6ac2:	0505           	btst d2,d5
    6ac4:	0505           	btst d2,d5
    6ac6:	0505           	btst d2,d5
    6ac8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    6aca:	0505           	btst d2,d5
    6acc:	0505           	btst d2,d5
    6ace:	0505           	btst d2,d5
    6ad0:	0505           	btst d2,d5
    6ad2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    6ad4:	0500           	btst d2,d0
    6ad6:	0505           	btst d2,d5
    6ad8:	0505           	btst d2,d5
    6ada:	0505           	btst d2,d5
    6adc:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    6ade:	0505           	btst d2,d5
    6ae0:	0505           	btst d2,d5
    6ae2:	0505           	btst d2,d5
    6ae4:	0505           	btst d2,d5
    6ae6:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    6ae8:	0505           	btst d2,d5
    6aea:	0505           	btst d2,d5
    6aec:	0503           	btst d2,d3
    6aee:	0505           	btst d2,d5
    6af0:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    6af2:	0505           	btst d2,d5
    6af4:	0500           	btst d2,d0
    6af6:	0505           	btst d2,d5
    6af8:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    6afc:	0505           	btst d2,d5
    6afe:	0503           	btst d2,d3
    6b00:	0205 0507      	andi.b #7,d5
    6b04:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    6b06:	0505           	btst d2,d5
    6b08:	0505           	btst d2,d5
    6b0a:	0505           	btst d2,d5
    6b0c:	0505           	btst d2,d5
    6b0e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b10:	0505           	btst d2,d5
    6b12:	0505           	btst d2,d5
    6b14:	0505           	btst d2,d5
    6b16:	0505           	btst d2,d5
    6b18:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b1a:	0505           	btst d2,d5
    6b1c:	0505           	btst d2,d5
    6b1e:	0505           	btst d2,d5
    6b20:	0505           	btst d2,d5
    6b22:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b24:	0505           	btst d2,d5
    6b26:	0505           	btst d2,d5
    6b28:	0505           	btst d2,d5
    6b2a:	0505           	btst d2,d5
    6b2c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b2e:	0505           	btst d2,d5
    6b30:	0505           	btst d2,d5
    6b32:	0505           	btst d2,d5
    6b34:	0505           	btst d2,d5
    6b36:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b38:	0505           	btst d2,d5
    6b3a:	0505           	btst d2,d5
    6b3c:	0505           	btst d2,d5
    6b3e:	0505           	btst d2,d5
    6b40:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b42:	0505           	btst d2,d5
    6b44:	0505           	btst d2,d5
    6b46:	0505           	btst d2,d5
    6b48:	0505           	btst d2,d5
    6b4a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b4c:	0505           	btst d2,d5
    6b4e:	0505           	btst d2,d5
    6b50:	0505           	btst d2,d5
    6b52:	0505           	btst d2,d5
    6b54:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b56:	0505           	btst d2,d5
    6b58:	0505           	btst d2,d5
    6b5a:	0505           	btst d2,d5
    6b5c:	0505           	btst d2,d5
    6b5e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b60:	0505           	btst d2,d5
    6b62:	0505           	btst d2,d5
    6b64:	0505           	btst d2,d5
    6b66:	0505           	btst d2,d5
    6b68:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b6a:	0505           	btst d2,d5
    6b6c:	0505           	btst d2,d5
    6b6e:	0505           	btst d2,d5
    6b70:	0505           	btst d2,d5
    6b72:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b74:	0505           	btst d2,d5
    6b76:	0505           	btst d2,d5
    6b78:	0505           	btst d2,d5
    6b7a:	0505           	btst d2,d5
    6b7c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b7e:	0505           	btst d2,d5
    6b80:	0505           	btst d2,d5
    6b82:	0505           	btst d2,d5
    6b84:	0505           	btst d2,d5
    6b86:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b88:	0505           	btst d2,d5
    6b8a:	0505           	btst d2,d5
    6b8c:	0505           	btst d2,d5
    6b8e:	0505           	btst d2,d5
    6b90:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b92:	0505           	btst d2,d5
    6b94:	0505           	btst d2,d5
    6b96:	0505           	btst d2,d5
    6b98:	0505           	btst d2,d5
    6b9a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    6b9c:	0505           	btst d2,d5
    6b9e:	0505           	btst d2,d5
    6ba0:	0505           	btst d2,d5
    6ba2:	0505           	btst d2,d5
    6ba4:	0505           	btst d2,d5

00006ba6 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    6ba6:	16c0           	move.b d0,(a3)+
  RTS
    6ba8:	4e75           	rts

00006baa <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    6baa:	48f9 7fff 0000 	movem.l d0-a6,6a70 <saveregs>
    6bb0:	6a70 
  lea 0xdff000,a5
    6bb2:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xdd2e46>,a5
  move.l sp@(4),a0  //Fontlocation
    6bb8:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    6bbc:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    6bc0:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    6bc4:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    6bc6:	082d 0006 0002 	btst #6,2(a5)

00006bcc <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    6bcc:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    6bd2:	66f8           	bne.s 6bcc <st2wblit>

00006bd4 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    6bd4:	7019           	moveq #25,d0
	sub.l d5,d5      
    6bd6:	9a85           	sub.l d5,d5

00006bd8 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    6bd8:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    6bda:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    6bdc:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    6be0:	9dce           	suba.l a6,a6
	move.l d2, a6
    6be2:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    6be4:	ddfc 0000 6aac 	adda.l #27308,a6

	LSL  	#4,d2 	    //Fetch next char
    6bea:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    6bec:	2842           	movea.l d2,a4


	move.l  #0,d4
    6bee:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    6bf0:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    6bf2:	3814           	move.w (a4),d4
	swap	d4
    6bf4:	4844           	swap d4
	lsr.l	d5, d4
    6bf6:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    6bf8:	8993           	or.l d4,(a3)
	clr.l	d4
    6bfa:	4284           	clr.l d4
	move.w  2(a4), d4
    6bfc:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    6c00:	4844           	swap d4
	lsr.l	d5, d4
    6c02:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    6c04:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    6c08:	4284           	clr.l d4
	move.w  4(a4), d4
    6c0a:	382c 0004      	move.w 4(a4),d4
	swap	d4
    6c0e:	4844           	swap d4
	lsr.l	d5, d4
    6c10:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    6c12:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    6c16:	4284           	clr.l d4
	move.w  6(a4), d4
    6c18:	382c 0006      	move.w 6(a4),d4
	swap	d4
    6c1c:	4844           	swap d4
	lsr.l	d5, d4
    6c1e:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    6c20:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    6c24:	4284           	clr.l d4
	move.w  8(a4), d4
    6c26:	382c 0008      	move.w 8(a4),d4
	swap	d4
    6c2a:	4844           	swap d4
	lsr.l	d5, d4
    6c2c:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    6c2e:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    6c32:	4284           	clr.l d4
	move.w  10(a4), d4
    6c34:	382c 000a      	move.w 10(a4),d4
	swap	d4
    6c38:	4844           	swap d4
	lsr.l	d5, d4
    6c3a:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    6c3c:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    6c40:	4284           	clr.l d4
	move.w  12(a4), d4
    6c42:	382c 000c      	move.w 12(a4),d4
	swap	d4
    6c46:	4844           	swap d4
	lsr.l	d5, d4
    6c48:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    6c4a:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    6c4e:	4284           	clr.l d4
	move.w  14(a4), d4
    6c50:	382c 000e      	move.w 14(a4),d4
	swap	d4
    6c54:	4844           	swap d4
	lsr.l	d5, d4
    6c56:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    6c58:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    6c5c:	4284           	clr.l d4

	add.b   (a6), d5
    6c5e:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    6c60:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    6c64:	6500 0006      	bcs.w 6c6c <noadditionalchar>
	addq.w  #1, a3
    6c68:	524b           	addq.w #1,a3
	sub.w   #8,d5
    6c6a:	5145           	subq.w #8,d5

00006c6c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    6c6c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    6c6e:	51c8 ff68      	dbf d0,6bd8 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    6c72:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    6c76:	51cb ff5c      	dbf d3,6bd4 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    6c7a:	4cfa 7fff fdf2 	movem.l 6a70 <saveregs>(pc),d0-a6

	RTS
    6c80:	4e75           	rts
