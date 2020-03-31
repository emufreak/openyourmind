
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
      12:	23ce 0000 7e26 	move.l a6,7e26 <SysBase>
	hw = (struct Custom*)0xdff000;
      18:	23fc 00df f000 	move.l #14675968,7df6 <hw>
      1e:	0000 7df6 

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary("graphics.library",0);
      22:	43f9 0000 52e5 	lea 52e5 <incbin_swfont_end+0x113>,a1
      28:	7000           	moveq #0,d0
      2a:	4eae fdd8      	jsr -552(a6)
      2e:	23c0 0000 7dfa 	move.l d0,7dfa <GfxBase>
	if (!GfxBase)
      34:	6700 347c      	beq.w 34b2 <main+0x34ac>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
      38:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
      3e:	43f9 0000 52f6 	lea 52f6 <incbin_swfont_end+0x124>,a1
      44:	7000           	moveq #0,d0
      46:	4eae fdd8      	jsr -552(a6)
      4a:	23c0 0000 7e22 	move.l d0,7e22 <DOSBase>
	if (!DOSBase)
      50:	6700 3454      	beq.w 34a6 <main+0x34a0>
		Exit(0);

	KPrintF("Hello debugger from Amiga!\n");
      54:	4879 0000 5302 	pea 5302 <incbin_swfont_end+0x130>
      5a:	4eb9 0000 36f0 	jsr 36f0 <KPrintF>
	Write(Output(), "Hello console!\n", 15);
      60:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
      66:	4eae ffc4      	jsr -60(a6)
      6a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
      70:	2200           	move.l d0,d1
      72:	243c 0000 531e 	move.l #21278,d2
      78:	760f           	moveq #15,d3
      7a:	4eae ffd0      	jsr -48(a6)
	Delay(50);
      7e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
      84:	7232           	moveq #50,d1
      86:	4eae ff3a      	jsr -198(a6)
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
      8a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
      90:	4eae ffc4      	jsr -60(a6)
      94:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
      9a:	2628 0080      	move.l 128(a0),d3
      9e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
      a4:	2200           	move.l d0,d1
      a6:	243c 0000 532e 	move.l #21294,d2
      ac:	4eae ffd0      	jsr -48(a6)
  Copperlist1 = ClBuild();
      b0:	47f9 0000 3a6a 	lea 3a6a <ClBuild>,a3
      b6:	4e93           	jsr (a3)
      b8:	2440           	movea.l d0,a2
      ba:	23c0 0000 7e1a 	move.l d0,7e1a <Copperlist1>
  DrawCopper = Copperlist1;
      c0:	23c0 0000 7e0a 	move.l d0,7e0a <DrawCopper>
  Copperlist2 = ClBuild();
      c6:	4e93           	jsr (a3)
      c8:	23c0 0000 7e16 	move.l d0,7e16 <Copperlist2>
  ViewCopper = Copperlist2;
      ce:	23c0 0000 7dfe 	move.l d0,7dfe <ViewCopper>
    if( instructions[ pos+i] != batch[ i])
      d4:	588f           	addq.l #4,sp
      d6:	2039 0000 7d5c 	move.l 7d5c <ClsSprites>,d0
      dc:	b092           	cmp.l (a2),d0
      de:	6600 2fde      	bne.w 30be <main+0x30b8>
      e2:	2239 0000 7d60 	move.l 7d60 <ClsSprites+0x4>,d1
      e8:	b2aa 0004      	cmp.l 4(a2),d1
      ec:	6600 2fd0      	bne.w 30be <main+0x30b8>
      f0:	2079 0000 7d64 	movea.l 7d64 <ClsSprites+0x8>,a0
      f6:	b1ea 0008      	cmpa.l 8(a2),a0
      fa:	6600 2fc2      	bne.w 30be <main+0x30b8>
      fe:	2039 0000 7d68 	move.l 7d68 <ClsSprites+0xc>,d0
     104:	b0aa 000c      	cmp.l 12(a2),d0
     108:	6600 2fb4      	bne.w 30be <main+0x30b8>
     10c:	2239 0000 7d6c 	move.l 7d6c <ClsSprites+0x10>,d1
     112:	b2aa 0010      	cmp.l 16(a2),d1
     116:	6600 2fa6      	bne.w 30be <main+0x30b8>
     11a:	2079 0000 7d70 	movea.l 7d70 <ClsSprites+0x14>,a0
     120:	b1ea 0014      	cmpa.l 20(a2),a0
     124:	6600 2f98      	bne.w 30be <main+0x30b8>
     128:	202a 0018      	move.l 24(a2),d0
     12c:	b0b9 0000 7d74 	cmp.l 7d74 <ClsSprites+0x18>,d0
     132:	6600 2f8a      	bne.w 30be <main+0x30b8>
     136:	2239 0000 7d78 	move.l 7d78 <ClsSprites+0x1c>,d1
     13c:	b2aa 001c      	cmp.l 28(a2),d1
     140:	6600 2f7c      	bne.w 30be <main+0x30b8>
     144:	2079 0000 7d7c 	movea.l 7d7c <ClsSprites+0x20>,a0
     14a:	b1ea 0020      	cmpa.l 32(a2),a0
     14e:	6600 2f6e      	bne.w 30be <main+0x30b8>
     152:	2039 0000 7d80 	move.l 7d80 <ClsSprites+0x24>,d0
     158:	b0aa 0024      	cmp.l 36(a2),d0
     15c:	6600 2f60      	bne.w 30be <main+0x30b8>
     160:	2239 0000 7d84 	move.l 7d84 <ClsSprites+0x28>,d1
     166:	b2aa 0028      	cmp.l 40(a2),d1
     16a:	6600 2f52      	bne.w 30be <main+0x30b8>
     16e:	2079 0000 7d88 	movea.l 7d88 <ClsSprites+0x2c>,a0
     174:	b1ea 002c      	cmpa.l 44(a2),a0
     178:	6600 2f44      	bne.w 30be <main+0x30b8>
     17c:	2039 0000 7d8c 	move.l 7d8c <ClsSprites+0x30>,d0
     182:	b0aa 0030      	cmp.l 48(a2),d0
     186:	6600 2f36      	bne.w 30be <main+0x30b8>
     18a:	2239 0000 7d90 	move.l 7d90 <ClsSprites+0x34>,d1
     190:	b2aa 0034      	cmp.l 52(a2),d1
     194:	6600 2f28      	bne.w 30be <main+0x30b8>
     198:	2079 0000 7d94 	movea.l 7d94 <ClsSprites+0x38>,a0
     19e:	b1ea 0038      	cmpa.l 56(a2),a0
     1a2:	6600 2f1a      	bne.w 30be <main+0x30b8>
     1a6:	246a 003c      	movea.l 60(a2),a2
     1aa:	b5f9 0000 7d98 	cmpa.l 7d98 <ClsSprites+0x3c>,a2
     1b0:	6600 2f0c      	bne.w 30be <main+0x30b8>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
     1b4:	2079 0000 7e1a 	movea.l 7e1a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     1ba:	2039 0000 7d2c 	move.l 7d2c <ClScreen>,d0
     1c0:	b0a8 0040      	cmp.l 64(a0),d0
     1c4:	6600 30a8      	bne.w 326e <main+0x3268>
     1c8:	2239 0000 7d30 	move.l 7d30 <ClScreen+0x4>,d1
     1ce:	b2a8 0044      	cmp.l 68(a0),d1
     1d2:	6600 309a      	bne.w 326e <main+0x3268>
     1d6:	2039 0000 7d34 	move.l 7d34 <ClScreen+0x8>,d0
     1dc:	b0a8 0048      	cmp.l 72(a0),d0
     1e0:	6600 308c      	bne.w 326e <main+0x3268>
     1e4:	2239 0000 7d38 	move.l 7d38 <ClScreen+0xc>,d1
     1ea:	b2a8 004c      	cmp.l 76(a0),d1
     1ee:	6600 307e      	bne.w 326e <main+0x3268>
     1f2:	2039 0000 7d3c 	move.l 7d3c <ClScreen+0x10>,d0
     1f8:	b0a8 0050      	cmp.l 80(a0),d0
     1fc:	6600 3070      	bne.w 326e <main+0x3268>
     200:	2239 0000 7d40 	move.l 7d40 <ClScreen+0x14>,d1
     206:	b2a8 0054      	cmp.l 84(a0),d1
     20a:	6600 3062      	bne.w 326e <main+0x3268>
     20e:	2039 0000 7d44 	move.l 7d44 <ClScreen+0x18>,d0
     214:	b0a8 0058      	cmp.l 88(a0),d0
     218:	6600 3054      	bne.w 326e <main+0x3268>
     21c:	2228 005c      	move.l 92(a0),d1
     220:	b2b9 0000 7d48 	cmp.l 7d48 <ClScreen+0x1c>,d1
     226:	6600 3046      	bne.w 326e <main+0x3268>
     22a:	2028 0060      	move.l 96(a0),d0
     22e:	b0b9 0000 7d4c 	cmp.l 7d4c <ClScreen+0x20>,d0
     234:	6600 3038      	bne.w 326e <main+0x3268>
     238:	2239 0000 7d50 	move.l 7d50 <ClScreen+0x24>,d1
     23e:	b2a8 0064      	cmp.l 100(a0),d1
     242:	6600 302a      	bne.w 326e <main+0x3268>
     246:	2039 0000 7d54 	move.l 7d54 <ClScreen+0x28>,d0
     24c:	b0a8 0068      	cmp.l 104(a0),d0
     250:	6600 301c      	bne.w 326e <main+0x3268>
     254:	2068 006c      	movea.l 108(a0),a0
     258:	b1f9 0000 7d58 	cmpa.l 7d58 <ClScreen+0x2c>,a0
     25e:	6600 300e      	bne.w 326e <main+0x3268>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
     262:	23fc 0004 0000 	move.l #262144,7e0e <DrawBuffer>
     268:	0000 7e0e 
  ViewBuffer = (ULONG *)0x50000;
     26c:	23fc 0005 0000 	move.l #327680,7e02 <ViewBuffer>
     272:	0000 7e02 
  SetBplPointers();
     276:	45f9 0000 456c 	lea 456c <SetBplPointers>,a2
     27c:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
     27e:	0cb9 0005 0000 	cmpi.l #327680,7e0e <DrawBuffer>
     284:	0000 7e0e 
     288:	6700 31ec      	beq.w 3476 <main+0x3470>
    Write( Output(), 
     28c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     292:	4eae ffc4      	jsr -60(a6)
     296:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     29c:	2200           	move.l d0,d1
     29e:	243c 0000 5331 	move.l #21297,d2
     2a4:	763b           	moveq #59,d3
     2a6:	4eae ffd0      	jsr -48(a6)
  if( instructions[pos] == value ) 
     2aa:	2079 0000 7e1a 	movea.l 7e1a <Copperlist1>,a0
     2b0:	0ca8 00e0 0004 	cmpi.l #14680068,112(a0)
     2b6:	0070 
     2b8:	6724           	beq.s 2de <main+0x2d8>
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
     2ba:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     2c0:	4eae ffc4      	jsr -60(a6)
     2c4:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     2ca:	2200           	move.l d0,d1
     2cc:	243c 0000 536d 	move.l #21357,d2
     2d2:	763c           	moveq #60,d3
     2d4:	4eae ffd0      	jsr -48(a6)
     2d8:	2079 0000 7e1a 	movea.l 7e1a <Copperlist1>,a0
  if( instructions[pos] == value ) 
     2de:	0ca8 00e2 0000 	cmpi.l #14811136,116(a0)
     2e4:	0074 
     2e6:	6724           	beq.s 30c <main+0x306>
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
     2e8:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     2ee:	4eae ffc4      	jsr -60(a6)
     2f2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     2f8:	2200           	move.l d0,d1
     2fa:	243c 0000 53aa 	move.l #21418,d2
     300:	763c           	moveq #60,d3
     302:	4eae ffd0      	jsr -48(a6)
     306:	2079 0000 7e1a 	movea.l 7e1a <Copperlist1>,a0
    if( instructions[ pos+i] != batch[ i])
     30c:	2228 0078      	move.l 120(a0),d1
     310:	b2b9 0000 7d24 	cmp.l 7d24 <ClColor>,d1
     316:	6600 2f2e      	bne.w 3246 <main+0x3240>
     31a:	2028 007c      	move.l 124(a0),d0
     31e:	b0b9 0000 7d28 	cmp.l 7d28 <ClColor+0x4>,d0
     324:	6600 2f20      	bne.w 3246 <main+0x3240>
  if( instructions[pos] == value ) 
     328:	72fe           	moveq #-2,d1
     32a:	b2a8 0080      	cmp.l 128(a0),d1
     32e:	671e           	beq.s 34e <main+0x348>
  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
     330:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     336:	4eae ffc4      	jsr -60(a6)
     33a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     340:	2200           	move.l d0,d1
     342:	243c 0000 5409 	move.l #21513,d2
     348:	7622           	moveq #34,d3
     34a:	4eae ffd0      	jsr -48(a6)
  
  SwapCl();
     34e:	47f9 0000 4364 	lea 4364 <SwapCl>,a3
     354:	4e93           	jsr (a3)
  if( DrawCopper != Copperlist2)
     356:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
     35c:	b1f9 0000 7e16 	cmpa.l 7e16 <Copperlist2>,a0
     362:	671e           	beq.s 382 <main+0x37c>
    Write(  Output(), "SwapCl doesn't work.\n", 21);
     364:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     36a:	4eae ffc4      	jsr -60(a6)
     36e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     374:	2200           	move.l d0,d1
     376:	243c 0000 542c 	move.l #21548,d2
     37c:	7615           	moveq #21,d3
     37e:	4eae ffd0      	jsr -48(a6)

  PrepareDisplay();
     382:	49f9 0000 4598 	lea 4598 <PrepareDisplay>,a4
     388:	4e94           	jsr (a4)
  if( DrawBuffer != Bitplane1) 
     38a:	2039 0000 7e0e 	move.l 7e0e <DrawBuffer>,d0
     390:	b0b9 0000 7e12 	cmp.l 7e12 <Bitplane1>,d0
     396:	671e           	beq.s 3b6 <main+0x3b0>
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
     398:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     39e:	4eae ffc4      	jsr -60(a6)
     3a2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     3a8:	2200           	move.l d0,d1
     3aa:	243c 0000 5442 	move.l #21570,d2
     3b0:	7637           	moveq #55,d3
     3b2:	4eae ffd0      	jsr -48(a6)
                                                                            55);
  if( DrawCopper != Copperlist1) 
     3b6:	2239 0000 7e0a 	move.l 7e0a <DrawCopper>,d1
     3bc:	b2b9 0000 7e1a 	cmp.l 7e1a <Copperlist1>,d1
     3c2:	671e           	beq.s 3e2 <main+0x3dc>
    Write( Output(), 
     3c4:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     3ca:	4eae ffc4      	jsr -60(a6)
     3ce:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     3d4:	2200           	move.l d0,d1
     3d6:	243c 0000 547a 	move.l #21626,d2
     3dc:	7639           	moveq #57,d3
     3de:	4eae ffd0      	jsr -48(a6)
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();
     3e2:	4e94           	jsr (a4)

  if( ViewBuffer != Bitplane2) 
     3e4:	2079 0000 7e02 	movea.l 7e02 <ViewBuffer>,a0
     3ea:	b1f9 0000 7e06 	cmpa.l 7e06 <Bitplane2>,a0
     3f0:	671e           	beq.s 410 <main+0x40a>
    Write( Output(), 
     3f2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     3f8:	4eae ffc4      	jsr -60(a6)
     3fc:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     402:	2200           	move.l d0,d1
     404:	243c 0000 54b4 	move.l #21684,d2
     40a:	7638           	moveq #56,d3
     40c:	4eae ffd0      	jsr -48(a6)
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
     410:	2039 0000 7dfe 	move.l 7dfe <ViewCopper>,d0
     416:	b0b9 0000 7e16 	cmp.l 7e16 <Copperlist2>,d0
     41c:	671e           	beq.s 43c <main+0x436>
    Write( Output(), 
     41e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     424:	4eae ffc4      	jsr -60(a6)
     428:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     42e:	2200           	move.l d0,d1
     430:	243c 0000 54ed 	move.l #21741,d2
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
     440:	2079 0000 7dfe 	movea.l 7dfe <ViewCopper>,a0
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     446:	7000           	moveq #0,d0
     448:	3028 0072      	move.w 114(a0),d0
     44c:	4840           	swap d0
     44e:	4240           	clr.w d0
     450:	7200           	moveq #0,d1
     452:	3228 0076      	move.w 118(a0),d1
     456:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     458:	b0b9 0000 7e06 	cmp.l 7e06 <Bitplane2>,d0
     45e:	671e           	beq.s 47e <main+0x478>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     460:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     466:	4eae ffc4      	jsr -60(a6)
     46a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     470:	2200           	move.l d0,d1
     472:	243c 0000 5528 	move.l #21800,d2
     478:	7648           	moveq #72,d3
     47a:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     47e:	4e93           	jsr (a3)
  SetBplPointers();
     480:	4e92           	jsr (a2)
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     482:	2079 0000 7dfe 	movea.l 7dfe <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     488:	7000           	moveq #0,d0
     48a:	3028 0072      	move.w 114(a0),d0
     48e:	4840           	swap d0
     490:	4240           	clr.w d0
     492:	7200           	moveq #0,d1
     494:	3228 0076      	move.w 118(a0),d1
     498:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane1) 
     49a:	b0b9 0000 7e12 	cmp.l 7e12 <Bitplane1>,d0
     4a0:	671e           	beq.s 4c0 <main+0x4ba>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
     4a2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     4a8:	4eae ffc4      	jsr -60(a6)
     4ac:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     4b2:	2200           	move.l d0,d1
     4b4:	243c 0000 5571 	move.l #21873,d2
     4ba:	7649           	moveq #73,d3
     4bc:	4eae ffd0      	jsr -48(a6)
  SwapCl();
     4c0:	4e93           	jsr (a3)
  SetBplPointers();
     4c2:	4e92           	jsr (a2)
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = (UWORD *) ViewCopper;
     4c4:	2079 0000 7dfe 	movea.l 7dfe <ViewCopper>,a0
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
     4ca:	7000           	moveq #0,d0
     4cc:	3028 0072      	move.w 114(a0),d0
     4d0:	4840           	swap d0
     4d2:	4240           	clr.w d0
     4d4:	7200           	moveq #0,d1
     4d6:	3228 0076      	move.w 118(a0),d1
     4da:	d081           	add.l d1,d0
  if( pointer != (ULONG) Bitplane2) 
     4dc:	b0b9 0000 7e06 	cmp.l 7e06 <Bitplane2>,d0
     4e2:	671e           	beq.s 502 <main+0x4fc>
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
     4e4:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     4ea:	4eae ffc4      	jsr -60(a6)
     4ee:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     4f4:	2200           	move.l d0,d1
     4f6:	243c 0000 55bb 	move.l #21947,d2
     4fc:	7648           	moveq #72,d3
     4fe:	4eae ffd0      	jsr -48(a6)
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
     502:	2f3c 0000 c800 	move.l #51200,-(sp)
     508:	4878 0084      	pea 84 <main+0x7e>
     50c:	4eb9 0000 46d6 	jsr 46d6 <FreeDisplay>
  Counter4Frames++;
}

void TestZoomSpeed() {

  Counter4Frames = 0;
     512:	42b9 0000 7e1e 	clr.l 7e1e <Counter4Frames>
  struct Interrupt *vbint;

  int counter = 0;
                                                       
  if (vbint = AllocMem(sizeof(struct Interrupt),    
     518:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     51e:	7016           	moveq #22,d0
     520:	223c 0001 0001 	move.l #65537,d1
     526:	4eae ff3a      	jsr -198(a6)
     52a:	2b40 ff8c      	move.l d0,-116(a5)
     52e:	508f           	addq.l #8,sp
     530:	671c           	beq.s 54e <main+0x548>
                         MEMF_PUBLIC|MEMF_CLEAR)) {
    vbint->is_Node.ln_Type = NT_INTERRUPT;       
     532:	2040           	movea.l d0,a0
     534:	317c 02c4 0008 	move.w #708,8(a0)
    vbint->is_Node.ln_Pri = -60;
    vbint->is_Node.ln_Name = "VertB-Example";
     53a:	217c 0000 5604 	move.l #22020,10(a0)
     540:	000a 
    vbint->is_Data = NULL;
     542:	42a8 000e      	clr.l 14(a0)
    vbint->is_Code = Vblankcounter;
     546:	217c 0000 386e 	move.l #14446,18(a0)
     54c:	0012 
  }

  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     54e:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     554:	203c 0000 3740 	move.l #14144,d0
     55a:	7202           	moveq #2,d1
     55c:	4eae ff3a      	jsr -198(a6)
     560:	2b40 ff70      	move.l d0,-144(a5)
  if( source == 0) {
     564:	6700 2fa8      	beq.w 350e <main+0x3508>
    Write(  Output(), 
               "TestZoomSpeed: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     568:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     56e:	203c 0000 3740 	move.l #14144,d0
     574:	7202           	moveq #2,d1
     576:	4eae ff3a      	jsr -198(a6)
     57a:	2b40 ff80      	move.l d0,-128(a5)
  if( destination == 0) {
     57e:	6700 2fe2      	beq.w 3562 <main+0x355c>
     582:	202d ff70      	move.l -144(a5),d0
     586:	0680 0000 3300 	addi.l #13056,d0
     58c:	206d ff70      	movea.l -144(a5),a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     590:	20bc 5555 5555 	move.l #1431655765,(a0)
     596:	217c 5555 5555 	move.l #1431655765,4(a0)
     59c:	0004 
     59e:	217c 5555 5555 	move.l #1431655765,8(a0)
     5a4:	0008 
     5a6:	217c 5555 5555 	move.l #1431655765,12(a0)
     5ac:	000c 
     5ae:	217c 5555 5555 	move.l #1431655765,16(a0)
     5b4:	0010 
     5b6:	217c 5555 5555 	move.l #1431655765,20(a0)
     5bc:	0014 
     5be:	217c 5555 5555 	move.l #1431655765,24(a0)
     5c4:	0018 
     5c6:	217c 5555 5555 	move.l #1431655765,28(a0)
     5cc:	001c 
     5ce:	217c 5555 5555 	move.l #1431655765,32(a0)
     5d4:	0020 
     5d6:	217c 5555 5555 	move.l #1431655765,36(a0)
     5dc:	0024 
     5de:	217c 5555 5555 	move.l #1431655765,40(a0)
     5e4:	0028 
     5e6:	217c 5555 5555 	move.l #1431655765,44(a0)
     5ec:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     5ee:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     5f4:	0030 
     5f6:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     5fc:	0034 
     5fe:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     604:	0038 
     606:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     60c:	003c 
     60e:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     614:	0040 
     616:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     61c:	0044 
     61e:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     624:	0048 
     626:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     62c:	004c 
     62e:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     634:	0050 
     636:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     63c:	0054 
     63e:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     644:	0058 
     646:	41e8 0060      	lea 96(a0),a0
     64a:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     650:	fffc 
  for(int i=0;i<128+8;i++) {
     652:	b1c0           	cmpa.l d0,a0
     654:	6600 ff3a      	bne.w 590 <main+0x58a>
  }
  WaitVbl();
     658:	2b7c 0000 4748 	move.l #18248,-140(a5)
     65e:	ff74 
     660:	41f9 0000 4748 	lea 4748 <WaitVbl>,a0
     666:	4e90           	jsr (a0)
  AddIntServer(INTB_VERTB, vbint);
     668:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     66e:	7005           	moveq #5,d0
     670:	226d ff8c      	movea.l -116(a5),a1
     674:	4eae ff58      	jsr -168(a6)
     678:	7005           	moveq #5,d0
     67a:	2b40 ff84      	move.l d0,-124(a5)
     67e:	222d ff70      	move.l -144(a5),d1
     682:	0681 0000 017c 	addi.l #380,d1
     688:	2b41 ff90      	move.l d1,-112(a5)
     68c:	307c 002c      	movea.w #44,a0
     690:	d1ed ff80      	adda.l -128(a5),a0
     694:	2b48 ff88      	move.l a0,-120(a5)
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
  WaitBlit();
     698:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     69e:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     6a2:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
     6a8:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     6ae:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     6b4:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     6ba:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     6c0:	317c 002c 0066 	move.w #44,102(a0)
     6c6:	2b6d ff90 ff7c 	move.l -112(a5),-132(a5)
     6cc:	2b6d ff88 ff78 	move.l -120(a5),-136(a5)
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    shiftright--;
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
     6d2:	426d ff6c      	clr.w -148(a5)
  hw->bltdmod = ZMLINESIZE - 4;
     6d6:	7409           	moveq #9,d2
     6d8:	3e3c 014c      	move.w #332,d7
  UWORD startofword = 21*16;
     6dc:	3c3c 0150      	move.w #336,d6
     6e0:	2b6d ff7c ff94 	move.l -132(a5),-108(a5)
      shifthoriz--;
  } 

  for(int i=0;i<22;i++) {

    ZoomHorizontal = ZoomHorizontalStart;
     6e6:	33fc 0012 0000 	move.w #18,7df4 <ZoomHorizontal>
     6ec:	7df4 

    WORD linesleft = 272;
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
     6ee:	282d ff94      	move.l -108(a5),d4
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
     6f2:	246d ff78      	movea.l -136(a5),a2
     6f6:	3b42 ff7c      	move.w d2,-132(a5)
     6fa:	3002           	move.w d2,d0
     6fc:	720c           	moveq #12,d1
     6fe:	e368           	lsl.w d1,d0
     700:	3640           	movea.w d0,a3
     702:	7000           	moveq #0,d0
     704:	302d ff6c      	move.w -148(a5),d0
     708:	2840           	movea.l d0,a4
     70a:	d9c0           	adda.l d0,a4
     70c:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6

    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
     712:	3006           	move.w d6,d0
     714:	3047           	movea.w d7,a0
     716:	b1c0           	cmpa.l d0,a0
     718:	6e00 2ba8      	bgt.w 32c2 <main+0x32bc>
  WaitBlit();
     71c:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     720:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
     726:	47eb 09f0      	lea 2544(a3),a3
     72a:	314b 0040      	move.w a3,64(a0)
  hw->bltcon1 = 0;
     72e:	317c 0000 0042 	move.w #0,66(a0)
     734:	3a39 0000 7df4 	move.w 7df4 <ZoomHorizontal>,d5
    WORD linesleft = 272;
     73a:	303c 0110      	move.w #272,d0
     73e:	222d ff94      	move.l -108(a5),d1
     742:	d28c           	add.l a4,d1
     744:	3600           	move.w d0,d3
      Init_Copy( shiftright);
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
     746:	b045           	cmp.w d5,d0
     748:	6f00 29dc      	ble.w 3126 <main+0x3120>
          linesleft -= ZoomHorizontal;
     74c:	3240           	movea.w d0,a1
     74e:	92c5           	suba.w d5,a1
     750:	3649           	movea.w a1,a3
     752:	3005           	move.w d5,d0
     754:	3605           	move.w d5,d3
			break;
	}
}

inline void WaitBlt() {
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
     756:	3a28 0002      	move.w 2(a0),d5
	(void)tst;
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
     75a:	3a28 0002      	move.w 2(a0),d5
     75e:	0805 000e      	btst #14,d5
     762:	66f6           	bne.s 75a <main+0x754>
  hw->bltapt = (UWORD *) source;
     764:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
     768:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
     76c:	ed4b           	lsl.w #6,d3
     76e:	5443           	addq.w #2,d3
     770:	3143 0058      	move.w d3,88(a0)
        //Copy rectangle 
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal);
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
        //Add aditional line
        if( linesleft>0) {
     774:	320b           	move.w a3,d1
     776:	6e00 2968      	bgt.w 30e0 <main+0x30da>
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, 1);
          linesleft--;
          //Source doesn't change. Only forward dest
          pos4dest += ZMLINESIZE/2;
        }
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
     77a:	33fc 0012 0000 	move.w #18,7df4 <ZoomHorizontal>
     780:	7df4 
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
     782:	0646 fff0      	addi.w #-16,d6
     786:	55ad ff94      	subq.l #2,-108(a5)
     78a:	55ad ff78      	subq.l #2,-136(a5)
  for(int i=0;i<22;i++) {
     78e:	0c46 fff0      	cmpi.w #-16,d6
     792:	6600 ff52      	bne.w 6e6 <main+0x6e0>
     796:	53ad ff84      	subq.l #1,-124(a5)
  for( int i=0; i<5; i++)
     79a:	6600 fefc      	bne.w 698 <main+0x692>
    Zoom_ZoomIntoPicture( source, destination, 0);
  RemIntServer(INTB_VERTB, vbint);
     79e:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     7a4:	7005           	moveq #5,d0
     7a6:	226d ff8c      	movea.l -116(a5),a1
     7aa:	4eae ff52      	jsr -174(a6)
  if( Counter4Frames > 9)
     7ae:	7009           	moveq #9,d0
     7b0:	b0b9 0000 7e1e 	cmp.l 7e1e <Counter4Frames>,d0
     7b6:	6c1e           	bge.s 7d6 <main+0x7d0>
    Write( Output(), "TestSpeed4Zoom: Takes too long\n", 31);
     7b8:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     7be:	4eae ffc4      	jsr -60(a6)
     7c2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     7c8:	2200           	move.l d0,d1
     7ca:	243c 0000 5685 	move.l #22149,d2
     7d0:	761f           	moveq #31,d3
     7d2:	4eae ffd0      	jsr -48(a6)
  FreeMem( source, ( ZMLINESIZE+4)*272);
     7d6:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     7dc:	226d ff70      	movea.l -144(a5),a1
     7e0:	203c 0000 3740 	move.l #14144,d0
     7e6:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination, ( ZMLINESIZE+4)*272);
     7ea:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     7f0:	226d ff80      	movea.l -128(a5),a1
     7f4:	203c 0000 3740 	move.l #14144,d0
     7fa:	4eae ff2e      	jsr -210(a6)
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();
     7fe:	45f9 0000 438a 	lea 438a <PrepareDisplayZoom>,a2
     804:	4e92           	jsr (a2)

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
     806:	4878 0010      	pea 10 <main+0xa>
     80a:	4879 0000 7d5c 	pea 7d5c <ClsSprites>
     810:	42a7           	clr.l -(sp)
     812:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     818:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
     81e:	4fef 0010      	lea 16(sp),sp
     822:	4a80           	tst.l d0
     824:	661e           	bne.s 844 <main+0x83e>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
     826:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     82c:	4eae ffc4      	jsr -60(a6)
     830:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     836:	2200           	move.l d0,d1
     838:	243c 0000 56a5 	move.l #22181,d2
     83e:	762c           	moveq #44,d3
     840:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
     844:	4878 000c      	pea c <main+0x6>
     848:	4879 0000 7cf4 	pea 7cf4 <ClScreenZoom>
     84e:	4878 0010      	pea 10 <main+0xa>
     852:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     858:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
     85e:	4fef 0010      	lea 16(sp),sp
     862:	4a80           	tst.l d0
     864:	661e           	bne.s 884 <main+0x87e>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
     866:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     86c:	4eae ffc4      	jsr -60(a6)
     870:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     876:	2200           	move.l d0,d1
     878:	243c 0000 56db 	move.l #22235,d2
     87e:	7636           	moveq #54,d3
     880:	4eae ffd0      	jsr -48(a6)
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
     884:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
     88a:	317c 0004 0072 	move.w #4,114(a0)
    copword += 2;
    *copword = lowword;
     890:	4268 0076      	clr.w 118(a0)
    *copword = highword;
     894:	317c 0004 007a 	move.w #4,122(a0)
    *copword = lowword;
     89a:	317c 2800 007e 	move.w #10240,126(a0)
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
     8a0:	23fc 0005 0000 	move.l #327680,7e0e <DrawBuffer>
     8a6:	0000 7e0e 
  ViewBuffer = (ULONG *) tmp;
     8aa:	23fc 0004 0000 	move.l #262144,7e02 <ViewBuffer>
     8b0:	0000 7e02 
  Zoom_SetBplPointers();
  if( DrawBuffer != (ULONG *) 0x50000 || (ULONG *) ViewBuffer !=(ULONG *) 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
     8b4:	2f3c 00e0 0004 	move.l #14680068,-(sp)
     8ba:	4878 001c      	pea 1c <main+0x16>
     8be:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     8c4:	4eb9 0000 3876 	jsr 3876 <TestCopperlistPos>
     8ca:	4fef 000c      	lea 12(sp),sp
     8ce:	4a80           	tst.l d0
     8d0:	661e           	bne.s 8f0 <main+0x8ea>
    Write(Output(), 
     8d2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     8d8:	4eae ffc4      	jsr -60(a6)
     8dc:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     8e2:	2200           	move.l d0,d1
     8e4:	243c 0000 536d 	move.l #21357,d2
     8ea:	763c           	moveq #60,d3
     8ec:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
     8f0:	2f3c 00e2 0000 	move.l #14811136,-(sp)
     8f6:	4878 001d      	pea 1d <main+0x17>
     8fa:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     900:	4eb9 0000 3876 	jsr 3876 <TestCopperlistPos>
     906:	4fef 000c      	lea 12(sp),sp
     90a:	4a80           	tst.l d0
     90c:	661e           	bne.s 92c <main+0x926>
    Write(Output(), 
     90e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     914:	4eae ffc4      	jsr -60(a6)
     918:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     91e:	2200           	move.l d0,d1
     920:	243c 0000 53aa 	move.l #21418,d2
     926:	763c           	moveq #60,d3
     928:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
     92c:	2f3c 00e4 0004 	move.l #14942212,-(sp)
     932:	4878 001e      	pea 1e <main+0x18>
     936:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     93c:	4eb9 0000 3876 	jsr 3876 <TestCopperlistPos>
     942:	4fef 000c      	lea 12(sp),sp
     946:	4a80           	tst.l d0
     948:	661e           	bne.s 968 <main+0x962>
    Write(Output(), 
     94a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     950:	4eae ffc4      	jsr -60(a6)
     954:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     95a:	2200           	move.l d0,d1
     95c:	243c 0000 5712 	move.l #22290,d2
     962:	763c           	moveq #60,d3
     964:	4eae ffd0      	jsr -48(a6)
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
     968:	2f3c 00e6 2800 	move.l #15083520,-(sp)
     96e:	4878 001f      	pea 1f <main+0x19>
     972:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     978:	4eb9 0000 3876 	jsr 3876 <TestCopperlistPos>
     97e:	4fef 000c      	lea 12(sp),sp
     982:	4a80           	tst.l d0
     984:	661e           	bne.s 9a4 <main+0x99e>
    Write(Output(), 
     986:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     98c:	4eae ffc4      	jsr -60(a6)
     990:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     996:	2200           	move.l d0,d1
     998:	243c 0000 574f 	move.l #22351,d2
     99e:	763c           	moveq #60,d3
     9a0:	4eae ffd0      	jsr -48(a6)
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
     9a4:	4878 0002      	pea 2 <_start+0x2>
     9a8:	4879 0000 7d24 	pea 7d24 <ClColor>
     9ae:	4878 0020      	pea 20 <main+0x1a>
     9b2:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     9b8:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
     9be:	4fef 0010      	lea 16(sp),sp
     9c2:	4a80           	tst.l d0
     9c4:	661e           	bne.s 9e4 <main+0x9de>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
     9c6:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     9cc:	4eae ffc4      	jsr -60(a6)
     9d0:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     9d6:	2200           	move.l d0,d1
     9d8:	243c 0000 53e7 	move.l #21479,d2
     9de:	7621           	moveq #33,d3
     9e0:	4eae ffd0      	jsr -48(a6)
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
     9e4:	4878 0040      	pea 40 <main+0x3a>
     9e8:	4879 0000 599c 	pea 599c <incbin_swfont_end+0x7ca>
     9ee:	486d ffc0      	pea -64(a5)
     9f2:	4eb9 0000 478e 	jsr 478e <memcpy>
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
     9f8:	4878 0010      	pea 10 <main+0xa>
     9fc:	486d ffc0      	pea -64(a5)
     a00:	4878 0022      	pea 22 <main+0x1c>
     a04:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     a0a:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
     a10:	4fef 001c      	lea 28(sp),sp
     a14:	4a80           	tst.l d0
     a16:	661e           	bne.s a36 <main+0xa30>
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);
     a18:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     a1e:	4eae ffc4      	jsr -60(a6)
     a22:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     a28:	2200           	move.l d0,d1
     a2a:	243c 0000 578c 	move.l #22412,d2
     a30:	7621           	moveq #33,d3
     a32:	4eae ffd0      	jsr -48(a6)

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };
     a36:	2b7c 2d07 fffe 	move.l #755499006,-76(a5)
     a3c:	ffb4 
     a3e:	2b7c 0182 00f0 	move.l #25297136,-72(a5)
     a44:	ffb8 
     a46:	2b7c 0182 0f00 	move.l #25300736,-68(a5)
     a4c:	ffbc 

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
     a4e:	4878 0003      	pea 3 <_start+0x3>
     a52:	486d ffb4      	pea -76(a5)
     a56:	4878 004b      	pea 4b <main+0x45>
     a5a:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     a60:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
     a66:	4fef 0010      	lea 16(sp),sp
     a6a:	4a80           	tst.l d0
     a6c:	661e           	bne.s a8c <main+0xa86>
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);
     a6e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     a74:	4eae ffc4      	jsr -60(a6)
     a78:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     a7e:	2200           	move.l d0,d1
     a80:	243c 0000 57ae 	move.l #22446,d2
     a86:	762c           	moveq #44,d3
     a88:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
     a8c:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc439>
     a90:	4878 2922      	pea 2922 <main+0x291c>
     a94:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
     a9a:	4eb9 0000 3876 	jsr 3876 <TestCopperlistPos>
     aa0:	4fef 000c      	lea 12(sp),sp
     aa4:	4a80           	tst.l d0
     aa6:	6700 268a      	beq.w 3132 <main+0x312c>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     aaa:	2f3c 0001 6800 	move.l #92160,-(sp)
     ab0:	2f3c 0000 a48c 	move.l #42124,-(sp)
     ab6:	4eb9 0000 46d6 	jsr 46d6 <FreeDisplay>

}

void TestBlitleftOfZoom() {
  Zoom_Init();
     abc:	47f9 0000 4348 	lea 4348 <Zoom_Init>,a3
     ac2:	4e93           	jsr (a3)
  PrepareDisplayZoom();
     ac4:	4e92           	jsr (a2)

  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
     ac6:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     acc:	203c 0000 c800 	move.l #51200,d0
     ad2:	7202           	moveq #2,d1
     ad4:	4eae ff3a      	jsr -198(a6)
     ad8:	2040           	movea.l d0,a0
     ada:	23c0 0000 7ddc 	move.l d0,7ddc <Zoom_Source>
  if( Zoom_Source == 0) {
     ae0:	508f           	addq.l #8,sp
     ae2:	6700 26a8      	beq.w 318c <main+0x3186>
    return;
  }

  
  UWORD *tstsource = Zoom_Source;
  *tstsource++ = 0x0000;
     ae6:	4250           	clr.w (a0)
  *tstsource = 0x0080;
     ae8:	317c 0080 0002 	move.w #128,2(a0)
  tstsource += ZMLINESIZE/2-1;
  *tstsource = 0x1000;
     aee:	317c 1000 0030 	move.w #4096,48(a0)
  tstsource++;
  *tstsource = 0x8e88;
     af4:	317c 8e88 0032 	move.w #-29048,50(a0)
  tstsource += ZMLINESIZE/2-1;

  tstsource = (UWORD *)Zoom_Source + 127*ZMLINESIZE/2;
  *tstsource++ = 0x0000;
     afa:	4268 17d0      	clr.w 6096(a0)
  *tstsource = 0x00ff;
     afe:	317c 00ff 17d2 	move.w #255,6098(a0)
  WaitBlit();
     b04:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     b0a:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
     b0e:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
     b14:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
     b1a:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
     b20:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
     b26:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
     b2c:	317c 002c 0066 	move.w #44,102(a0)
    ZoomBlit_Increment4SrcA = 1;
     b32:	33fc 0001 0000 	move.w #1,7df2 <ZoomBlit_Increment4SrcA>
     b38:	7df2 
  WaitBlit(); 
     b3a:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     b40:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
     b44:	2479 0000 7df6 	movea.l 7df6 <hw>,a2
     b4a:	357c 0000 0042 	move.w #0,66(a2)
  hw->bltcon0 = 0xde4 + shifta;
     b50:	357c fde4 0040 	move.w #-540,64(a2)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
     b56:	357c ff00 0070 	move.w #-256,112(a2)
  Init_Blit();
  Init_ZoomBlit( 7, 16, 0);
  Zoom_ZoomBlit( Zoom_Source, (UWORD *)DrawBuffer, 128);
     b5c:	2439 0000 7e0e 	move.l 7e0e <DrawBuffer>,d2
     b62:	2639 0000 7ddc 	move.l 7ddc <Zoom_Source>,d3
  WaitBlt();
     b68:	4eb9 0000 3cc8 	jsr 3cc8 <WaitBlt>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
     b6e:	7000           	moveq #0,d0
     b70:	3039 0000 7df2 	move.w 7df2 <ZoomBlit_Increment4SrcA>,d0
     b76:	d080           	add.l d0,d0
     b78:	d083           	add.l d3,d0
     b7a:	2540 0050      	move.l d0,80(a2)
  hw->bltbpt = source;
     b7e:	2543 004c      	move.l d3,76(a2)
  hw->bltdpt = destination;
     b82:	2542 0054      	move.l d2,84(a2)
  hw->bltsize = height*64+2;
     b86:	357c 2002 0058 	move.w #8194,88(a2)
  WaitBlit();
     b8c:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     b92:	4eae ff1c      	jsr -228(a6)
  UWORD *destination = (UWORD *)DrawBuffer+1;
     b96:	2479 0000 7e0e 	movea.l 7e0e <DrawBuffer>,a2
  if( *destination != 0x0180) {
     b9c:	0c6a 0180 0002 	cmpi.w #384,2(a2)
     ba2:	671e           	beq.s bc2 <main+0xbbc>
    Write(  Output(), "Zoomblit - First row wrong.\n",28);
     ba4:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     baa:	4eae ffc4      	jsr -60(a6)
     bae:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     bb4:	2200           	move.l d0,d1
     bb6:	243c 0000 5813 	move.l #22547,d2
     bbc:	761c           	moveq #28,d3
     bbe:	4eae ffd0      	jsr -48(a6)
  }
  destination += ZMLINESIZE/2;
  if( *destination != 0x1d88)
     bc2:	0c6a 1d88 0032 	cmpi.w #7560,50(a2)
     bc8:	671e           	beq.s be8 <main+0xbe2>
    Write(  Output(), "Zoomblit: Second row wrong.\n",28);
     bca:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     bd0:	4eae ffc4      	jsr -60(a6)
     bd4:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     bda:	2200           	move.l d0,d1
     bdc:	243c 0000 5830 	move.l #22576,d2
     be2:	761c           	moveq #28,d3
     be4:	4eae ffd0      	jsr -48(a6)

  
  destination = (UWORD *)DrawBuffer + 127*ZMLINESIZE/2;
  destination++;
  if( *destination != 0x01ff) {
     be8:	2079 0000 7e0e 	movea.l 7e0e <DrawBuffer>,a0
     bee:	0c68 01ff 17d2 	cmpi.w #511,6098(a0)
     bf4:	671e           	beq.s c14 <main+0xc0e>
    Write(  Output(), "Zoomblit: Last row wrong.\n",26);
     bf6:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     bfc:	4eae ffc4      	jsr -60(a6)
     c00:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     c06:	2200           	move.l d0,d1
     c08:	243c 0000 584d 	move.l #22605,d2
     c0e:	761a           	moveq #26,d3
     c10:	4eae ffd0      	jsr -48(a6)
  }
  FreeMem( Zoom_Source, 40*256*5);
     c14:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     c1a:	2279 0000 7ddc 	movea.l 7ddc <Zoom_Source>,a1
     c20:	203c 0000 c800 	move.l #51200,d0
     c26:	4eae ff2e      	jsr -210(a6)
  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
     c2a:	2f3c 0001 6800 	move.l #92160,-(sp)
     c30:	2f3c 0000 a48c 	move.l #42124,-(sp)
     c36:	4eb9 0000 46d6 	jsr 46d6 <FreeDisplay>
     c3c:	508f           	addq.l #8,sp
}

void TestCopyWord() {
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
     c3e:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     c44:	203c 0000 05a0 	move.l #1440,d0
     c4a:	7202           	moveq #2,d1
     c4c:	4eae ff3a      	jsr -198(a6)
     c50:	2440           	movea.l d0,a2
  if( source == 0) {
     c52:	4a80           	tst.l d0
     c54:	6700 256e      	beq.w 31c4 <main+0x31be>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
                                                                            53);
    return;
  }
  UWORD *destination = AllocMem(ZMLINESIZE*30, MEMF_CHIP);
     c58:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     c5e:	203c 0000 05a0 	move.l #1440,d0
     c64:	7202           	moveq #2,d1
     c66:	4eae ff3a      	jsr -198(a6)
     c6a:	2840           	movea.l d0,a4
  if( destination == 0) {
     c6c:	4a80           	tst.l d0
     c6e:	6700 2554      	beq.w 31c4 <main+0x31be>
    return;
  }
  
  UWORD *tmp = source;
  for( int i=0; i<8;i++) {
    *tmp++ = 0;
     c72:	4252           	clr.w (a2)
    *tmp++ = 0xaaaa;
     c74:	357c aaaa 0002 	move.w #-21846,2(a2)
    *tmp++ = 0xaaaa;
     c7a:	357c aaaa 0004 	move.w #-21846,4(a2)
    *tmp = 0;
     c80:	426a 0006      	clr.w 6(a2)
    tmp += ZMLINESIZE/2-3;
    *tmp++ = 0;
     c84:	426a 0030      	clr.w 48(a2)
    *tmp++ = 0x5555;
     c88:	357c 5555 0032 	move.w #21845,50(a2)
    *tmp++ = 0x5555;
     c8e:	357c 5555 0034 	move.w #21845,52(a2)
    *tmp = 0;
     c94:	426a 0036      	clr.w 54(a2)
    *tmp++ = 0;
     c98:	426a 0060      	clr.w 96(a2)
    *tmp++ = 0xaaaa;
     c9c:	357c aaaa 0062 	move.w #-21846,98(a2)
    *tmp++ = 0xaaaa;
     ca2:	357c aaaa 0064 	move.w #-21846,100(a2)
    *tmp = 0;
     ca8:	426a 0066      	clr.w 102(a2)
    *tmp++ = 0;
     cac:	426a 0090      	clr.w 144(a2)
    *tmp++ = 0x5555;
     cb0:	357c 5555 0092 	move.w #21845,146(a2)
    *tmp++ = 0x5555;
     cb6:	357c 5555 0094 	move.w #21845,148(a2)
    *tmp = 0;
     cbc:	426a 0096      	clr.w 150(a2)
    *tmp++ = 0;
     cc0:	426a 00c0      	clr.w 192(a2)
    *tmp++ = 0xaaaa;
     cc4:	357c aaaa 00c2 	move.w #-21846,194(a2)
    *tmp++ = 0xaaaa;
     cca:	357c aaaa 00c4 	move.w #-21846,196(a2)
    *tmp = 0;
     cd0:	426a 00c6      	clr.w 198(a2)
    *tmp++ = 0;
     cd4:	426a 00f0      	clr.w 240(a2)
    *tmp++ = 0x5555;
     cd8:	357c 5555 00f2 	move.w #21845,242(a2)
    *tmp++ = 0x5555;
     cde:	357c 5555 00f4 	move.w #21845,244(a2)
    *tmp = 0;
     ce4:	426a 00f6      	clr.w 246(a2)
    *tmp++ = 0;
     ce8:	426a 0120      	clr.w 288(a2)
    *tmp++ = 0xaaaa;
     cec:	357c aaaa 0122 	move.w #-21846,290(a2)
    *tmp++ = 0xaaaa;
     cf2:	357c aaaa 0124 	move.w #-21846,292(a2)
    *tmp = 0;
     cf8:	426a 0126      	clr.w 294(a2)
    *tmp++ = 0;
     cfc:	426a 0150      	clr.w 336(a2)
    *tmp++ = 0x5555;
     d00:	357c 5555 0152 	move.w #21845,338(a2)
    *tmp++ = 0x5555;
     d06:	357c 5555 0154 	move.w #21845,340(a2)
    *tmp = 0;
     d0c:	426a 0156      	clr.w 342(a2)
    *tmp++ = 0;
     d10:	426a 0180      	clr.w 384(a2)
    *tmp++ = 0xaaaa;
     d14:	357c aaaa 0182 	move.w #-21846,386(a2)
    *tmp++ = 0xaaaa;
     d1a:	357c aaaa 0184 	move.w #-21846,388(a2)
    *tmp = 0;
     d20:	426a 0186      	clr.w 390(a2)
    *tmp++ = 0;
     d24:	426a 01b0      	clr.w 432(a2)
    *tmp++ = 0x5555;
     d28:	357c 5555 01b2 	move.w #21845,434(a2)
    *tmp++ = 0x5555;
     d2e:	357c 5555 01b4 	move.w #21845,436(a2)
    *tmp = 0;
     d34:	426a 01b6      	clr.w 438(a2)
    *tmp++ = 0;
     d38:	426a 01e0      	clr.w 480(a2)
    *tmp++ = 0xaaaa;
     d3c:	357c aaaa 01e2 	move.w #-21846,482(a2)
    *tmp++ = 0xaaaa;
     d42:	357c aaaa 01e4 	move.w #-21846,484(a2)
    *tmp = 0;
     d48:	426a 01e6      	clr.w 486(a2)
    *tmp++ = 0;
     d4c:	426a 0210      	clr.w 528(a2)
    *tmp++ = 0x5555;
     d50:	357c 5555 0212 	move.w #21845,530(a2)
    *tmp++ = 0x5555;
     d56:	357c 5555 0214 	move.w #21845,532(a2)
    *tmp = 0;
     d5c:	426a 0216      	clr.w 534(a2)
    *tmp++ = 0;
     d60:	426a 0240      	clr.w 576(a2)
    *tmp++ = 0xaaaa;
     d64:	357c aaaa 0242 	move.w #-21846,578(a2)
    *tmp++ = 0xaaaa;
     d6a:	357c aaaa 0244 	move.w #-21846,580(a2)
    *tmp = 0;
     d70:	426a 0246      	clr.w 582(a2)
    *tmp++ = 0;
     d74:	426a 0270      	clr.w 624(a2)
    *tmp++ = 0x5555;
     d78:	357c 5555 0272 	move.w #21845,626(a2)
    *tmp++ = 0x5555;
     d7e:	357c 5555 0274 	move.w #21845,628(a2)
    *tmp = 0;
     d84:	426a 0276      	clr.w 630(a2)
    *tmp++ = 0;
     d88:	426a 02a0      	clr.w 672(a2)
    *tmp++ = 0xaaaa;
     d8c:	357c aaaa 02a2 	move.w #-21846,674(a2)
    *tmp++ = 0xaaaa;
     d92:	357c aaaa 02a4 	move.w #-21846,676(a2)
    *tmp = 0;
     d98:	426a 02a6      	clr.w 678(a2)
    *tmp++ = 0;
     d9c:	426a 02d0      	clr.w 720(a2)
    *tmp++ = 0x5555;
     da0:	357c 5555 02d2 	move.w #21845,722(a2)
    *tmp++ = 0x5555;
     da6:	357c 5555 02d4 	move.w #21845,724(a2)
    *tmp = 0;
     dac:	426a 02d6      	clr.w 726(a2)
    tmp += ZMLINESIZE/2-3;
     db0:	4878 05a0      	pea 5a0 <main+0x59a>
     db4:	42a7           	clr.l -(sp)
     db6:	2f00           	move.l d0,-(sp)
     db8:	4eb9 0000 4820 	jsr 4820 <memset>
  tmp = destination;
  for( int i=0; i<ZMLINESIZE/2*30; i++) {
    *tmp++ = 0;
  }

  WaitBlit();
     dbe:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     dc4:	4eae ff1c      	jsr -228(a6)

  Zoom_Init();
     dc8:	4e93           	jsr (a3)
  WaitBlit();
     dca:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     dd0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
     dd4:	2679 0000 7df6 	movea.l 7df6 <hw>,a3
     dda:	377c 39f0 0040 	move.w #14832,64(a3)
  hw->bltcon1 = 0;
     de0:	377c 0000 0042 	move.w #0,66(a3)
  WaitBlt();
     de6:	4eb9 0000 3cc8 	jsr 3cc8 <WaitBlt>
  hw->bltapt = (UWORD *) source;
     dec:	200a           	move.l a2,d0
     dee:	5480           	addq.l #2,d0
     df0:	2740 0050      	move.l d0,80(a3)
  hw->bltdpt = (UWORD *) destination;
     df4:	274c 0054      	move.l a4,84(a3)
  hw->bltsize = height*64+2;
     df8:	377c 0402 0058 	move.w #1026,88(a3)
  Init_Copy( 3);
  Zoom_CopyWord( (UWORD *)source+1, (UWORD *)destination, 16);
  WaitBlit();
     dfe:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     e04:	4eae ff1c      	jsr -228(a6)
  tmp = destination+1;
  if( *tmp != 0x5555) 
     e08:	4fef 000c      	lea 12(sp),sp
     e0c:	0c6c 5555 0002 	cmpi.w #21845,2(a4)
     e12:	671e           	beq.s e32 <main+0xe2c>
    Write(  Output(), "TestCopyWord: First row wrong.\n",31);
     e14:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     e1a:	4eae ffc4      	jsr -60(a6)
     e1e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     e24:	2200           	move.l d0,d1
     e26:	243c 0000 589e 	move.l #22686,d2
     e2c:	761f           	moveq #31,d3
     e2e:	4eae ffd0      	jsr -48(a6)
  tmp += ZMLINESIZE/2;
  if( *tmp != 0xaaaa)
     e32:	0c6c aaaa 0032 	cmpi.w #-21846,50(a4)
     e38:	671e           	beq.s e58 <main+0xe52>
    Write(  Output(), "TestCopyWord: Second row wrong.\n",32);
     e3a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     e40:	4eae ffc4      	jsr -60(a6)
     e44:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
     e4a:	2200           	move.l d0,d1
     e4c:	243c 0000 58be 	move.l #22718,d2
     e52:	7620           	moveq #32,d3
     e54:	4eae ffd0      	jsr -48(a6)
  
  FreeMem( source,ZMLINESIZE*30);
     e58:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     e5e:	224a           	movea.l a2,a1
     e60:	203c 0000 05a0 	move.l #1440,d0
     e66:	4eae ff2e      	jsr -210(a6)
  FreeMem( destination,ZMLINESIZE*30);
     e6a:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     e70:	224c           	movea.l a4,a1
     e72:	203c 0000 05a0 	move.l #1440,d0
     e78:	4eae ff2e      	jsr -210(a6)
/* 2233 4455 6677 8899 aabb ccdd eeff gghh ii11 ...
   1100 1100 1100 1100 1100 1100 1100 1100 1100
   c    c    c    c    c    c    c    c    c */

void TestZoom4Picture() {
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     e7c:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     e82:	203c 0000 3740 	move.l #14144,d0
     e88:	7202           	moveq #2,d1
     e8a:	4eae ff3a      	jsr -198(a6)
     e8e:	2840           	movea.l d0,a4
  if( source == 0) {
     e90:	4a80           	tst.l d0
     e92:	6700 2368      	beq.w 31fc <main+0x31f6>
    Write(  Output(), 
               "TestZoom4Picture: Memory for Source cannot be allocated.\n",57);
    return;
  }

  UWORD *destination = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
     e96:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
     e9c:	203c 0000 3740 	move.l #14144,d0
     ea2:	7202           	moveq #2,d1
     ea4:	4eae ff3a      	jsr -198(a6)
     ea8:	2640           	movea.l d0,a3
  if( destination == 0) {
     eaa:	4a80           	tst.l d0
     eac:	6700 2708      	beq.w 35b6 <main+0x35b0>
     eb0:	200c           	move.l a4,d0
     eb2:	0680 0000 3300 	addi.l #13056,d0
     eb8:	204c           	movea.l a4,a0
    return;
  }
  ULONG *tmp4source = (ULONG *)source;
  for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0x55555555;
     eba:	20bc 5555 5555 	move.l #1431655765,(a0)
     ec0:	217c 5555 5555 	move.l #1431655765,4(a0)
     ec6:	0004 
     ec8:	217c 5555 5555 	move.l #1431655765,8(a0)
     ece:	0008 
     ed0:	217c 5555 5555 	move.l #1431655765,12(a0)
     ed6:	000c 
     ed8:	217c 5555 5555 	move.l #1431655765,16(a0)
     ede:	0010 
     ee0:	217c 5555 5555 	move.l #1431655765,20(a0)
     ee6:	0014 
     ee8:	217c 5555 5555 	move.l #1431655765,24(a0)
     eee:	0018 
     ef0:	217c 5555 5555 	move.l #1431655765,28(a0)
     ef6:	001c 
     ef8:	217c 5555 5555 	move.l #1431655765,32(a0)
     efe:	0020 
     f00:	217c 5555 5555 	move.l #1431655765,36(a0)
     f06:	0024 
     f08:	217c 5555 5555 	move.l #1431655765,40(a0)
     f0e:	0028 
     f10:	217c 5555 5555 	move.l #1431655765,44(a0)
     f16:	002c 
    for(int i2=0;i2<ZMLINESIZE/4;i2++)
      *tmp4source++ = 0xaaaaaaaa;
     f18:	217c aaaa aaaa 	move.l #-1431655766,48(a0)
     f1e:	0030 
     f20:	217c aaaa aaaa 	move.l #-1431655766,52(a0)
     f26:	0034 
     f28:	217c aaaa aaaa 	move.l #-1431655766,56(a0)
     f2e:	0038 
     f30:	217c aaaa aaaa 	move.l #-1431655766,60(a0)
     f36:	003c 
     f38:	217c aaaa aaaa 	move.l #-1431655766,64(a0)
     f3e:	0040 
     f40:	217c aaaa aaaa 	move.l #-1431655766,68(a0)
     f46:	0044 
     f48:	217c aaaa aaaa 	move.l #-1431655766,72(a0)
     f4e:	0048 
     f50:	217c aaaa aaaa 	move.l #-1431655766,76(a0)
     f56:	004c 
     f58:	217c aaaa aaaa 	move.l #-1431655766,80(a0)
     f5e:	0050 
     f60:	217c aaaa aaaa 	move.l #-1431655766,84(a0)
     f66:	0054 
     f68:	217c aaaa aaaa 	move.l #-1431655766,88(a0)
     f6e:	0058 
     f70:	41e8 0060      	lea 96(a0),a0
     f74:	217c aaaa aaaa 	move.l #-1431655766,-4(a0)
     f7a:	fffc 
  for(int i=0;i<128+8;i++) {
     f7c:	b1c0           	cmpa.l d0,a0
     f7e:	6600 ff3a      	bne.w eba <main+0xeb4>
  }

  Zoom_ZoomIntoPicture( source, destination, 0);
     f82:	42a7           	clr.l -(sp)
     f84:	2f0b           	move.l a3,-(sp)
     f86:	2f0c           	move.l a4,-(sp)
     f88:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
     f8e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
     f94:	4eae ff1c      	jsr -228(a6)
  UWORD *valactual = destination+2; 
     f98:	41eb 0004      	lea 4(a3),a0
     f9c:	2b48 ff78      	move.l a0,-136(a5)
  UWORD *valsupposed = destlinezoom1;
  UWORD mask = 0xffff;
  for(int i=0;i<14;i++) {
     fa0:	41eb 0364      	lea 868(a3),a0
     fa4:	2b48 ff6c      	move.l a0,-148(a5)
     fa8:	2a08           	move.l a0,d5
     faa:	4fef 000c      	lea 12(sp),sp
  UWORD *valactual = destination+2; 
     fae:	3c7c 0012      	movea.w #18,a6
  UWORD mask = 0xffff;
     fb2:	74ff           	moveq #-1,d2
     fb4:	7600           	moveq #0,d3
     fb6:	4643           	not.w d3
     fb8:	45f9 0000 3758 	lea 3758 <TestRow>,a2
     fbe:	280b           	move.l a3,d4
     fc0:	2045           	movea.l d5,a0
     fc2:	41e8 fca0      	lea -864(a0),a0
     fc6:	2b48 ff70      	move.l a0,-144(a5)
     fca:	47ee ffee      	lea -18(a6),a3
    for(int i2=0;i2<18;i2++) { 
      TestRow( valsupposed, valactual, mask, i2+i*19);
     fce:	2f0b           	move.l a3,-(sp)
     fd0:	2f03           	move.l d3,-(sp)
     fd2:	2f2d ff70      	move.l -144(a5),-(sp)
     fd6:	4879 0000 7cc8 	pea 7cc8 <destlinezoom1>
     fdc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
     fde:	7030           	moveq #48,d0
     fe0:	d1ad ff70      	add.l d0,-144(a5)
      mask = mask ^ 0xffff;
     fe4:	4642           	not.w d2
     fe6:	528b           	addq.l #1,a3
    for(int i2=0;i2<18;i2++) { 
     fe8:	4fef 0010      	lea 16(sp),sp
     fec:	baad ff70      	cmp.l -144(a5),d5
     ff0:	6600 22c8      	bne.w 32ba <main+0x32b4>
    }
    TestRow( valsupposed, valactual, mask, 18+i*19);
     ff4:	2f0e           	move.l a6,-(sp)
     ff6:	7600           	moveq #0,d3
     ff8:	3602           	move.w d2,d3
     ffa:	2f03           	move.l d3,-(sp)
     ffc:	2f2d ff70      	move.l -144(a5),-(sp)
    1000:	4879 0000 7cc8 	pea 7cc8 <destlinezoom1>
    1006:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1008:	2a2d ff70      	move.l -144(a5),d5
    100c:	0685 0000 0390 	addi.l #912,d5
    1012:	4dee 0013      	lea 19(a6),a6
  for(int i=0;i<14;i++) {
    1016:	4fef 0010      	lea 16(sp),sp
    101a:	bcfc 011c      	cmpa.w #284,a6
    101e:	66a0           	bne.s fc0 <main+0xfba>
    1020:	2644           	movea.l d4,a3
    1022:	41eb 31e4      	lea 12772(a3),a0
    1026:	2b48 ff80      	move.l a0,-128(a5)
    102a:	2b48 ff70      	move.l a0,-144(a5)
    102e:	283c 0000 0109 	move.l #265,d4
  }

  for(int i2=0;i2<4;i2++) { 
    TestRow( valsupposed, valactual, mask, i2+265);
    1034:	2f04           	move.l d4,-(sp)
    1036:	2f03           	move.l d3,-(sp)
    1038:	2f2d ff70      	move.l -144(a5),-(sp)
    103c:	4879 0000 7cc8 	pea 7cc8 <destlinezoom1>
    1042:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1044:	7030           	moveq #48,d0
    1046:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    104a:	4642           	not.w d2
    104c:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    104e:	4fef 0010      	lea 16(sp),sp
    1052:	0c84 0000 010d 	cmpi.l #269,d4
    1058:	672a           	beq.s 1084 <main+0x107e>
    105a:	7600           	moveq #0,d3
    105c:	3602           	move.w d2,d3
    TestRow( valsupposed, valactual, mask, i2+265);
    105e:	2f04           	move.l d4,-(sp)
    1060:	2f03           	move.l d3,-(sp)
    1062:	2f2d ff70      	move.l -144(a5),-(sp)
    1066:	4879 0000 7cc8 	pea 7cc8 <destlinezoom1>
    106c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    106e:	7030           	moveq #48,d0
    1070:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    1074:	4642           	not.w d2
    1076:	5284           	addq.l #1,d4
  for(int i2=0;i2<4;i2++) { 
    1078:	4fef 0010      	lea 16(sp),sp
    107c:	0c84 0000 010d 	cmpi.l #269,d4
    1082:	66d6           	bne.s 105a <main+0x1054>
  
  UWORD *tmp = source;
  source = destination;
  destination = tmp;
  
  Zoom_ZoomIntoPicture( source, destination, 1);
    1084:	4878 0001      	pea 1 <_start+0x1>
    1088:	2f0c           	move.l a4,-(sp)
    108a:	2f0b           	move.l a3,-(sp)
    108c:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    1092:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1098:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
    109c:	41ec 0004      	lea 4(a4),a0
    10a0:	2b48 ff7c      	move.l a0,-132(a5)
    10a4:	4fef 000c      	lea 12(sp),sp
    10a8:	2b48 ff70      	move.l a0,-144(a5)
  valsupposed = destlinezoom2;
  mask = 0x0000;
  for(int i2=0;i2<11;i2++) { 
    10ac:	7600           	moveq #0,d3
  mask = 0x0000;
    10ae:	4242           	clr.w d2
    TestRow( valsupposed, valactual, mask, i2);
    10b0:	2f03           	move.l d3,-(sp)
    10b2:	3f02           	move.w d2,-(sp)
    10b4:	4267           	clr.w -(sp)
    10b6:	2f2d ff70      	move.l -144(a5),-(sp)
    10ba:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    10c0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    10c2:	7030           	moveq #48,d0
    10c4:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    10c8:	4642           	not.w d2
  for(int i2=0;i2<11;i2++) { 
    10ca:	5283           	addq.l #1,d3
    10cc:	4fef 0010      	lea 16(sp),sp
    10d0:	720b           	moveq #11,d1
    10d2:	b283           	cmp.l d3,d1
    10d4:	66da           	bne.s 10b0 <main+0x10aa>
  }
  TestRow( valsupposed, valactual, 0xffff, 8);
    10d6:	4878 0008      	pea 8 <main+0x2>
    10da:	2f3c 0000 ffff 	move.l #65535,-(sp)
    10e0:	41ec 0214      	lea 532(a4),a0
    10e4:	2b48 ffa4      	move.l a0,-92(a5)
    10e8:	2f08           	move.l a0,-(sp)
    10ea:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    10f0:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 9);
    10f2:	4878 0009      	pea 9 <main+0x3>
    10f6:	2f3c 0000 ffff 	move.l #65535,-(sp)
    10fc:	486c 0244      	pea 580(a4)
    1100:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    1106:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 10);
    1108:	4fef 0020      	lea 32(sp),sp
    110c:	4878 000a      	pea a <main+0x4>
    1110:	42a7           	clr.l -(sp)
    1112:	486c 0274      	pea 628(a4)
    1116:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    111c:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 11);
    111e:	4878 000b      	pea b <main+0x5>
    1122:	42a7           	clr.l -(sp)
    1124:	486c 02a4      	pea 676(a4)
    1128:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    112e:	4e92           	jsr (a2)

  valactual += ZMLINESIZE/2;
  for(int i=0;i<12;i++) {
    1130:	2a0c           	move.l a4,d5
    1132:	0685 0000 05d4 	addi.l #1492,d5
    1138:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 11);
    113c:	2e05           	move.l d5,d7
    113e:	3c7c 0018      	movea.w #24,a6
    1142:	7c00           	moveq #0,d6
    1144:	3c02           	move.w d2,d6
    1146:	280b           	move.l a3,d4
    1148:	2047           	movea.l d7,a0
    114a:	41e8 fd00      	lea -768(a0),a0
    114e:	2b48 ff70      	move.l a0,-144(a5)
    1152:	47ee fff3      	lea -13(a6),a3
    1156:	2606           	move.l d6,d3
    for(int i2=0;i2<16;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    1158:	2f0b           	move.l a3,-(sp)
    115a:	2f03           	move.l d3,-(sp)
    115c:	2f2d ff70      	move.l -144(a5),-(sp)
    1160:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    1166:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1168:	7030           	moveq #48,d0
    116a:	d1ad ff70      	add.l d0,-144(a5)
      mask = mask ^ 0xffff;
    116e:	4642           	not.w d2
    1170:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    1172:	4fef 0010      	lea 16(sp),sp
    1176:	bead ff70      	cmp.l -144(a5),d7
    117a:	6728           	beq.s 11a4 <main+0x119e>
    117c:	7600           	moveq #0,d3
    117e:	3602           	move.w d2,d3
      TestRow( valsupposed, valactual, mask, i2+i*17+11);
    1180:	2f0b           	move.l a3,-(sp)
    1182:	2f03           	move.l d3,-(sp)
    1184:	2f2d ff70      	move.l -144(a5),-(sp)
    1188:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    118e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1190:	7030           	moveq #48,d0
    1192:	d1ad ff70      	add.l d0,-144(a5)
      mask = mask ^ 0xffff;
    1196:	4642           	not.w d2
    1198:	528b           	addq.l #1,a3
    for(int i2=0;i2<16;i2++) {  
    119a:	4fef 0010      	lea 16(sp),sp
    119e:	bead ff70      	cmp.l -144(a5),d7
    11a2:	66d8           	bne.s 117c <main+0x1176>
    }
  
    TestRow( valsupposed, valactual, mask, i*17+11+13);
    11a4:	7c00           	moveq #0,d6
    11a6:	3c02           	move.w d2,d6
    11a8:	2f0e           	move.l a6,-(sp)
    11aa:	2f06           	move.l d6,-(sp)
    11ac:	2f2d ff70      	move.l -144(a5),-(sp)
    11b0:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    11b6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+14);
    11b8:	486e 0001      	pea 1(a6)
    11bc:	2f06           	move.l d6,-(sp)
    11be:	206d ff70      	movea.l -144(a5),a0
    11c2:	4868 0030      	pea 48(a0)
    11c6:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    11cc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*17+11+15);
    11ce:	4fef 0020      	lea 32(sp),sp
    11d2:	486e 0002      	pea 2(a6)
    11d6:	2f03           	move.l d3,-(sp)
    11d8:	206d ff70      	movea.l -144(a5),a0
    11dc:	4868 0060      	pea 96(a0)
    11e0:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    11e6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*17+11+16);
    11e8:	486e 0003      	pea 3(a6)
    11ec:	2f03           	move.l d3,-(sp)
    11ee:	206d ff70      	movea.l -144(a5),a0
    11f2:	4868 0090      	pea 144(a0)
    11f6:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    11fc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    11fe:	2e2d ff70      	move.l -144(a5),d7
    1202:	0687 0000 03c0 	addi.l #960,d7
    1208:	4dee 0011      	lea 17(a6),a6
  for(int i=0;i<12;i++) {
    120c:	4fef 0020      	lea 32(sp),sp
    1210:	bcfc 00e4      	cmpa.w #228,a6
    1214:	6600 ff32      	bne.w 1148 <main+0x1142>
    1218:	2644           	movea.l d4,a3
    121a:	41ec 2fd4      	lea 12244(a4),a0
    121e:	2b48 ffa8      	move.l a0,-88(a5)
    1222:	2b48 ff70      	move.l a0,-144(a5)
    
  }

  for(int i2=0;i2<15;i2++) { 
    1226:	7600           	moveq #0,d3
    TestRow( valsupposed, valactual, mask, i2);
    1228:	2f03           	move.l d3,-(sp)
    122a:	2f06           	move.l d6,-(sp)
    122c:	2f2d ff70      	move.l -144(a5),-(sp)
    1230:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    1236:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1238:	7030           	moveq #48,d0
    123a:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    123e:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    1240:	5283           	addq.l #1,d3
    1242:	4fef 0010      	lea 16(sp),sp
    1246:	720f           	moveq #15,d1
    1248:	b283           	cmp.l d3,d1
    124a:	6728           	beq.s 1274 <main+0x126e>
    124c:	7c00           	moveq #0,d6
    124e:	3c02           	move.w d2,d6
    TestRow( valsupposed, valactual, mask, i2);
    1250:	2f03           	move.l d3,-(sp)
    1252:	2f06           	move.l d6,-(sp)
    1254:	2f2d ff70      	move.l -144(a5),-(sp)
    1258:	4879 0000 7c9c 	pea 7c9c <destlinezoom2>
    125e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1260:	7030           	moveq #48,d0
    1262:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    1266:	4642           	not.w d2
  for(int i2=0;i2<15;i2++) { 
    1268:	5283           	addq.l #1,d3
    126a:	4fef 0010      	lea 16(sp),sp
    126e:	720f           	moveq #15,d1
    1270:	b283           	cmp.l d3,d1
    1272:	66d8           	bne.s 124c <main+0x1246>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 2);
    1274:	4878 0002      	pea 2 <_start+0x2>
    1278:	2f0b           	move.l a3,-(sp)
    127a:	2f0c           	move.l a4,-(sp)
    127c:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    1282:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1288:	4eae ff1c      	jsr -228(a6)
    128c:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    1290:	2b6d ff78 ff70 	move.l -136(a5),-144(a5)
  valsupposed = destlinezoom3;
  mask = 0xffff;

  for(int i2=0;i2<4;i2++) { 
    1296:	7400           	moveq #0,d2
  mask = 0xffff;
    1298:	76ff           	moveq #-1,d3
    TestRow( valsupposed, valactual, mask, i2);
    129a:	2f02           	move.l d2,-(sp)
    129c:	3f03           	move.w d3,-(sp)
    129e:	4267           	clr.w -(sp)
    12a0:	2f2d ff70      	move.l -144(a5),-(sp)
    12a4:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    12aa:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    12ac:	7030           	moveq #48,d0
    12ae:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    12b2:	4643           	not.w d3
  for(int i2=0;i2<4;i2++) { 
    12b4:	5282           	addq.l #1,d2
    12b6:	4fef 0010      	lea 16(sp),sp
    12ba:	7204           	moveq #4,d1
    12bc:	b282           	cmp.l d2,d1
    12be:	66da           	bne.s 129a <main+0x1294>
  }

  TestRow( valsupposed, valactual, 0xffff, 0+4);
    12c0:	4878 0004      	pea 4 <_start+0x4>
    12c4:	2f3c 0000 ffff 	move.l #65535,-(sp)
    12ca:	486b 00c4      	pea 196(a3)
    12ce:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    12d4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 1+4);
    12d6:	4878 0005      	pea 5 <_start+0x5>
    12da:	2f3c 0000 ffff 	move.l #65535,-(sp)
    12e0:	486b 00f4      	pea 244(a3)
    12e4:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    12ea:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    12ec:	4fef 0020      	lea 32(sp),sp
    12f0:	4878 0006      	pea 6 <main>
    12f4:	42a7           	clr.l -(sp)
  valactual += ZMLINESIZE/2;
    12f6:	41eb 0124      	lea 292(a3),a0
    12fa:	2b48 ffa0      	move.l a0,-96(a5)
  TestRow( valsupposed, valactual, 0x0000, 2+4);
    12fe:	2f08           	move.l a0,-(sp)
    1300:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    1306:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    1308:	4878 0007      	pea 7 <main+0x1>
    130c:	42a7           	clr.l -(sp)
    130e:	486b 0154      	pea 340(a3)
    1312:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    1318:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    131a:	4fef 0020      	lea 32(sp),sp
    131e:	4878 0008      	pea 8 <main+0x2>
    1322:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1328:	486b 0184      	pea 388(a3)
    132c:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    1332:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    1334:	4878 0009      	pea 9 <main+0x3>
    1338:	2f3c 0000 ffff 	move.l #65535,-(sp)
    133e:	486b 01b4      	pea 436(a3)
    1342:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    1348:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;

  mask = 0x0000;
  for(int i=0;i<12;i++) {
    134a:	2c0b           	move.l a3,d6
    134c:	0686 0000 04b4 	addi.l #1204,d6
    1352:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    1356:	3c7c 0018      	movea.w #24,a6
    135a:	7800           	moveq #0,d4
    135c:	74ff           	moveq #-1,d2
    135e:	2e0b           	move.l a3,d7
    1360:	2046           	movea.l d6,a0
    1362:	41e8 fd30      	lea -720(a0),a0
    1366:	2b48 ff70      	move.l a0,-144(a5)
    136a:	47ee fff1      	lea -15(a6),a3
    for(int i2=0;i2<15;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    136e:	2f0b           	move.l a3,-(sp)
    1370:	2f04           	move.l d4,-(sp)
    1372:	2f2d ff70      	move.l -144(a5),-(sp)
    1376:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    137c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    137e:	7030           	moveq #48,d0
    1380:	d1ad ff70      	add.l d0,-144(a5)
      mask = mask ^ 0xffff;
    1384:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    1386:	4fef 0010      	lea 16(sp),sp
    138a:	bcad ff70      	cmp.l -144(a5),d6
    138e:	6728           	beq.s 13b8 <main+0x13b2>
    1390:	7800           	moveq #0,d4
    1392:	3802           	move.w d2,d4
    1394:	4642           	not.w d2
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    1396:	2f0b           	move.l a3,-(sp)
    1398:	2f04           	move.l d4,-(sp)
    139a:	2f2d ff70      	move.l -144(a5),-(sp)
    139e:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    13a4:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    13a6:	7030           	moveq #48,d0
    13a8:	d1ad ff70      	add.l d0,-144(a5)
      mask = mask ^ 0xffff;
    13ac:	528b           	addq.l #1,a3
    for(int i2=0;i2<15;i2++) {  
    13ae:	4fef 0010      	lea 16(sp),sp
    13b2:	bcad ff70      	cmp.l -144(a5),d6
    13b6:	66d8           	bne.s 1390 <main+0x138a>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    13b8:	7600           	moveq #0,d3
    13ba:	3602           	move.w d2,d3
    13bc:	2f0e           	move.l a6,-(sp)
    13be:	2f03           	move.l d3,-(sp)
    13c0:	2f2d ff70      	move.l -144(a5),-(sp)
    13c4:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    13ca:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    13cc:	486e 0001      	pea 1(a6)
    13d0:	2f03           	move.l d3,-(sp)
    13d2:	206d ff70      	movea.l -144(a5),a0
    13d6:	4868 0030      	pea 48(a0)
    13da:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    13e0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    13e2:	4fef 0020      	lea 32(sp),sp
    13e6:	486e 0002      	pea 2(a6)
    13ea:	2f04           	move.l d4,-(sp)
    13ec:	206d ff70      	movea.l -144(a5),a0
    13f0:	4868 0060      	pea 96(a0)
    13f4:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    13fa:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    13fc:	486e 0003      	pea 3(a6)
    1400:	2f04           	move.l d4,-(sp)
    1402:	206d ff70      	movea.l -144(a5),a0
    1406:	4868 0090      	pea 144(a0)
    140a:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    1410:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    1412:	4fef 0020      	lea 32(sp),sp
    1416:	486e 0004      	pea 4(a6)
    141a:	2f03           	move.l d3,-(sp)
    141c:	206d ff70      	movea.l -144(a5),a0
    1420:	4868 00c0      	pea 192(a0)
    1424:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    142a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    142c:	486e 0005      	pea 5(a6)
    1430:	2f03           	move.l d3,-(sp)
    1432:	206d ff70      	movea.l -144(a5),a0
    1436:	4868 00f0      	pea 240(a0)
    143a:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    1440:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1442:	2c2d ff70      	move.l -144(a5),d6
    1446:	0686 0000 03f0 	addi.l #1008,d6
    144c:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    1450:	4fef 0020      	lea 32(sp),sp
    1454:	bcfc 0114      	cmpa.w #276,a6
    1458:	6600 ff06      	bne.w 1360 <main+0x135a>
    145c:	2647           	movea.l d7,a3
    145e:	41eb 3124      	lea 12580(a3),a0
    1462:	2b48 ff70      	move.l a0,-144(a5)
    1466:	263c 0000 0105 	move.l #261,d3
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    146c:	2f03           	move.l d3,-(sp)
    146e:	2f04           	move.l d4,-(sp)
    1470:	2f2d ff70      	move.l -144(a5),-(sp)
    1474:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    147a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    147c:	7030           	moveq #48,d0
    147e:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    1482:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    1484:	4fef 0010      	lea 16(sp),sp
    1488:	0c83 0000 010d 	cmpi.l #269,d3
    148e:	672a           	beq.s 14ba <main+0x14b4>
    1490:	7800           	moveq #0,d4
    1492:	3802           	move.w d2,d4
    1494:	4642           	not.w d2
    TestRow( valsupposed, valactual, mask, i2+12*21+9);
    1496:	2f03           	move.l d3,-(sp)
    1498:	2f04           	move.l d4,-(sp)
    149a:	2f2d ff70      	move.l -144(a5),-(sp)
    149e:	4879 0000 7c70 	pea 7c70 <destlinezoom3>
    14a4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    14a6:	7030           	moveq #48,d0
    14a8:	d1ad ff70      	add.l d0,-144(a5)
    mask = mask ^ 0xffff;
    14ac:	5283           	addq.l #1,d3
  for(int i2=0;i2<8;i2++) {  
    14ae:	4fef 0010      	lea 16(sp),sp
    14b2:	0c83 0000 010d 	cmpi.l #269,d3
    14b8:	66d6           	bne.s 1490 <main+0x148a>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 3);
    14ba:	4878 0003      	pea 3 <_start+0x3>
    14be:	2f0c           	move.l a4,-(sp)
    14c0:	2f0b           	move.l a3,-(sp)
    14c2:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    14c8:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    14ce:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom4;
  mask = 0x0000;
  
  TestRow( valsupposed, valactual, 0x0000, 3+4);
    14d2:	4878 0007      	pea 7 <main+0x1>
    14d6:	42a7           	clr.l -(sp)
    14d8:	2f2d ff7c      	move.l -132(a5),-(sp)
    14dc:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    14e2:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    14e4:	41ec 0034      	lea 52(a4),a0
    14e8:	2b48 ff84      	move.l a0,-124(a5)
  TestRow( valsupposed, valactual, 0xffff, 4+4);
    14ec:	4878 0008      	pea 8 <main+0x2>
    14f0:	2f3c 0000 ffff 	move.l #65535,-(sp)
    14f6:	2f08           	move.l a0,-(sp)
    14f8:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    14fe:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1500:	41ec 0064      	lea 100(a4),a0
    1504:	2b48 ff90      	move.l a0,-112(a5)
  TestRow( valsupposed, valactual, 0xffff, 5+4);
    1508:	4fef 002c      	lea 44(sp),sp
    150c:	4878 0009      	pea 9 <main+0x3>
    1510:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1516:	2f08           	move.l a0,-(sp)
    1518:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    151e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1520:	41ec 0094      	lea 148(a4),a0
    1524:	2b48 ff70      	move.l a0,-144(a5)
  TestRow( valsupposed, valactual, 0x0000, 4+4);
    1528:	4878 0008      	pea 8 <main+0x2>
    152c:	42a7           	clr.l -(sp)
    152e:	2f08           	move.l a0,-(sp)
    1530:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    1536:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    1538:	4fef 0020      	lea 32(sp),sp
    153c:	4878 0009      	pea 9 <main+0x3>
    1540:	42a7           	clr.l -(sp)
    1542:	486c 00c4      	pea 196(a4)
    1546:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    154c:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;

  mask = 0xffff;
  for(int i=0;i<12;i++) {
    154e:	2c0c           	move.l a4,d6
    1550:	0686 0000 0394 	addi.l #916,d6
    1556:	4fef 0010      	lea 16(sp),sp
  TestRow( valsupposed, valactual, 0x0000, 5+4);
    155a:	3c7c 0018      	movea.w #24,a6
  mask = 0xffff;
    155e:	78ff           	moveq #-1,d4
    1560:	7400           	moveq #0,d2
    1562:	4642           	not.w d2
    1564:	2e0b           	move.l a3,d7
    1566:	2046           	movea.l d6,a0
    1568:	41e8 fd60      	lea -672(a0),a0
    156c:	2b48 ff88      	move.l a0,-120(a5)
    1570:	47ee fff1      	lea -15(a6),a3
    1574:	2602           	move.l d2,d3
    for(int i2=0;i2<14;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    1576:	2f0b           	move.l a3,-(sp)
    1578:	2f03           	move.l d3,-(sp)
    157a:	2f2d ff88      	move.l -120(a5),-(sp)
    157e:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    1584:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1586:	7030           	moveq #48,d0
    1588:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    158c:	4644           	not.w d4
    158e:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    1590:	4fef 0010      	lea 16(sp),sp
    1594:	bcad ff88      	cmp.l -120(a5),d6
    1598:	6728           	beq.s 15c2 <main+0x15bc>
    159a:	7600           	moveq #0,d3
    159c:	3604           	move.w d4,d3
      TestRow( valsupposed, valactual, mask, i2+i*21+9);
    159e:	2f0b           	move.l a3,-(sp)
    15a0:	2f03           	move.l d3,-(sp)
    15a2:	2f2d ff88      	move.l -120(a5),-(sp)
    15a6:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    15ac:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    15ae:	7030           	moveq #48,d0
    15b0:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    15b4:	4644           	not.w d4
    15b6:	528b           	addq.l #1,a3
    for(int i2=0;i2<14;i2++) {  
    15b8:	4fef 0010      	lea 16(sp),sp
    15bc:	bcad ff88      	cmp.l -120(a5),d6
    15c0:	66d8           	bne.s 159a <main+0x1594>
    }

    TestRow( valsupposed, valactual, mask, i*21+9+15);
    15c2:	7400           	moveq #0,d2
    15c4:	3404           	move.w d4,d2
    15c6:	2f0e           	move.l a6,-(sp)
    15c8:	2f02           	move.l d2,-(sp)
    15ca:	2f2d ff88      	move.l -120(a5),-(sp)
    15ce:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    15d4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+16);
    15d6:	486e 0001      	pea 1(a6)
    15da:	2f02           	move.l d2,-(sp)
    15dc:	206d ff88      	movea.l -120(a5),a0
    15e0:	4868 0030      	pea 48(a0)
    15e4:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    15ea:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+17);
    15ec:	4fef 0020      	lea 32(sp),sp
    15f0:	486e 0002      	pea 2(a6)
    15f4:	2f03           	move.l d3,-(sp)
    15f6:	206d ff88      	movea.l -120(a5),a0
    15fa:	4868 0060      	pea 96(a0)
    15fe:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    1604:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+18);
    1606:	486e 0003      	pea 3(a6)
    160a:	2f03           	move.l d3,-(sp)
    160c:	206d ff88      	movea.l -120(a5),a0
    1610:	4868 0090      	pea 144(a0)
    1614:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    161a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    161c:	47ee 0004      	lea 4(a6),a3
    1620:	4fef 001c      	lea 28(sp),sp
    1624:	2e8b           	move.l a3,(sp)
    1626:	2f02           	move.l d2,-(sp)
    1628:	206d ff88      	movea.l -120(a5),a0
    162c:	4868 00c0      	pea 192(a0)
    1630:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    1636:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1638:	2c0e           	move.l a6,d6
    163a:	5a86           	addq.l #5,d6
    163c:	2f06           	move.l d6,-(sp)
    163e:	2f02           	move.l d2,-(sp)
    1640:	206d ff88      	movea.l -120(a5),a0
    1644:	4868 00f0      	pea 240(a0)
    1648:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    164e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+9+19);
    1650:	4fef 001c      	lea 28(sp),sp
    1654:	2e8b           	move.l a3,(sp)
    1656:	2f03           	move.l d3,-(sp)
    1658:	206d ff88      	movea.l -120(a5),a0
    165c:	4868 0120      	pea 288(a0)
    1660:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    1666:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+9+20);
    1668:	2f06           	move.l d6,-(sp)
    166a:	2f03           	move.l d3,-(sp)
    166c:	206d ff88      	movea.l -120(a5),a0
    1670:	4868 0150      	pea 336(a0)
    1674:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    167a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    167c:	2c2d ff88      	move.l -120(a5),d6
    1680:	0686 0000 0420 	addi.l #1056,d6
    1686:	4dee 0015      	lea 21(a6),a6
  for(int i=0;i<12;i++) {
    168a:	4fef 0020      	lea 32(sp),sp
    168e:	bcfc 0114      	cmpa.w #276,a6
    1692:	6600 fed2      	bne.w 1566 <main+0x1560>
    1696:	2647           	movea.l d7,a3
  }

  TestRow( valsupposed, valactual, mask, 269);
    1698:	4878 010d      	pea 10d <main+0x107>
    169c:	2f02           	move.l d2,-(sp)
    169e:	486c 3274      	pea 12916(a4)
    16a2:	4879 0000 7c44 	pea 7c44 <destlinezoom4>
    16a8:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 4);
    16aa:	4878 0004      	pea 4 <_start+0x4>
    16ae:	2f07           	move.l d7,-(sp)
    16b0:	2f0c           	move.l a4,-(sp)
    16b2:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    16b8:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    16be:	4eae ff1c      	jsr -228(a6)
    16c2:	4fef 001c      	lea 28(sp),sp

  valactual = destination+2; 
    16c6:	2c6d ff78      	movea.l -136(a5),a6
  valsupposed = destlinezoom5;
  mask = 0x0000;

  for(int i2=0;i2<13;i2++) {  
    16ca:	42ad ff88      	clr.l -120(a5)
  mask = 0x0000;
    16ce:	4244           	clr.w d4
    TestRow( valsupposed, valactual, mask, i2);
    16d0:	7400           	moveq #0,d2
    16d2:	3404           	move.w d4,d2
    16d4:	2f2d ff88      	move.l -120(a5),-(sp)
    16d8:	2f02           	move.l d2,-(sp)
    16da:	2f0e           	move.l a6,-(sp)
    16dc:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    16e2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    16e4:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    16e8:	4644           	not.w d4
  for(int i2=0;i2<13;i2++) {  
    16ea:	52ad ff88      	addq.l #1,-120(a5)
    16ee:	4fef 0010      	lea 16(sp),sp
    16f2:	700d           	moveq #13,d0
    16f4:	b0ad ff88      	cmp.l -120(a5),d0
    16f8:	66d6           	bne.s 16d0 <main+0x16ca>
    16fa:	7600           	moveq #0,d3
    16fc:	3604           	move.w d4,d3
  }

  TestRow( valsupposed, valactual, mask, 12);   
    16fe:	4878 000c      	pea c <main+0x6>
    1702:	2f03           	move.l d3,-(sp)
    1704:	486b 0274      	pea 628(a3)
    1708:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    170e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 13);
    1710:	4878 000d      	pea d <main+0x7>
    1714:	2f03           	move.l d3,-(sp)
    1716:	486b 02a4      	pea 676(a3)
    171a:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1720:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 14);
    1722:	4fef 0020      	lea 32(sp),sp
    1726:	4878 000e      	pea e <main+0x8>
    172a:	2f02           	move.l d2,-(sp)
    172c:	486b 02d4      	pea 724(a3)
    1730:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1736:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 15);
    1738:	4878 000f      	pea f <main+0x9>
    173c:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    173e:	41eb 0304      	lea 772(a3),a0
    1742:	2b48 ff8c      	move.l a0,-116(a5)
  TestRow( valsupposed, valactual, mask, 15);
    1746:	2f08           	move.l a0,-(sp)
    1748:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    174e:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 16);
    1750:	4fef 0020      	lea 32(sp),sp
    1754:	4878 0010      	pea 10 <main+0xa>
    1758:	2f03           	move.l d3,-(sp)
    175a:	486b 0334      	pea 820(a3)
    175e:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1764:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 17);
    1766:	4878 0011      	pea 11 <main+0xb>
    176a:	2f03           	move.l d3,-(sp)
    176c:	2f2d ff6c      	move.l -148(a5),-(sp)
    1770:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1776:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 18);
    1778:	4fef 0020      	lea 32(sp),sp
    177c:	4878 0012      	pea 12 <main+0xc>
    1780:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    1782:	41eb 0394      	lea 916(a3),a0
    1786:	2b48 ff94      	move.l a0,-108(a5)
  TestRow( valsupposed, valactual, mask, 18);
    178a:	2f08           	move.l a0,-(sp)
    178c:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1792:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 19);
    1794:	4878 0013      	pea 13 <main+0xd>
    1798:	2f02           	move.l d2,-(sp)
    179a:	486b 03c4      	pea 964(a3)
    179e:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    17a4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 20);
    17a6:	4fef 0020      	lea 32(sp),sp
    17aa:	4878 0014      	pea 14 <main+0xe>
    17ae:	2f03           	move.l d3,-(sp)
    17b0:	486b 03f4      	pea 1012(a3)
    17b4:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    17ba:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 21);
    17bc:	4878 0015      	pea 15 <main+0xf>
    17c0:	2f03           	move.l d3,-(sp)
    17c2:	486b 0424      	pea 1060(a3)
    17c6:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    17cc:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;


  for(int i=0;i<10;i++) {
    17ce:	2c0b           	move.l a3,d6
    17d0:	0686 0000 06c4 	addi.l #1732,d6
    17d6:	4fef 0020      	lea 32(sp),sp
  TestRow( valsupposed, valactual, mask, 21);
    17da:	307c 0023      	movea.w #35,a0
    17de:	2b48 ff68      	move.l a0,-152(a5)
    17e2:	2e0b           	move.l a3,d7
    17e4:	2c46           	movea.l d6,a6
    17e6:	4dee fd90      	lea -624(a6),a6
    17ea:	367c fff3      	movea.w #-13,a3
    17ee:	d7ed ff68      	adda.l -152(a5),a3
    for(int i2=0;i2<13;i2++) {  
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    17f2:	2f0b           	move.l a3,-(sp)
    17f4:	2f02           	move.l d2,-(sp)
    17f6:	2f0e           	move.l a6,-(sp)
    17f8:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    17fe:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1800:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1804:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1806:	4fef 0010      	lea 16(sp),sp
    180a:	bc8e           	cmp.l a6,d6
    180c:	6722           	beq.s 1830 <main+0x182a>
    180e:	7400           	moveq #0,d2
    1810:	3404           	move.w d4,d2
    1812:	4644           	not.w d4
      TestRow( valsupposed, valactual, mask, i2+i*21+22);
    1814:	2f0b           	move.l a3,-(sp)
    1816:	2f02           	move.l d2,-(sp)
    1818:	2f0e           	move.l a6,-(sp)
    181a:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1820:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1822:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1826:	528b           	addq.l #1,a3
    for(int i2=0;i2<13;i2++) {  
    1828:	4fef 0010      	lea 16(sp),sp
    182c:	bc8e           	cmp.l a6,d6
    182e:	66de           	bne.s 180e <main+0x1808>
    }

    TestRow( valsupposed, valactual, mask, i*21+22+13);
    1830:	7600           	moveq #0,d3
    1832:	3604           	move.w d4,d3
    1834:	2f2d ff68      	move.l -152(a5),-(sp)
    1838:	2f03           	move.l d3,-(sp)
    183a:	2f0e           	move.l a6,-(sp)
    183c:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1842:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+14);
    1844:	206d ff68      	movea.l -152(a5),a0
    1848:	4868 0001      	pea 1(a0)
    184c:	2f03           	move.l d3,-(sp)
    184e:	486e 0030      	pea 48(a6)
    1852:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1858:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+15);
    185a:	4fef 0020      	lea 32(sp),sp
    185e:	206d ff68      	movea.l -152(a5),a0
    1862:	4868 0002      	pea 2(a0)
    1866:	2f02           	move.l d2,-(sp)
    1868:	486e 0060      	pea 96(a6)
    186c:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1872:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+16);
    1874:	206d ff68      	movea.l -152(a5),a0
    1878:	4868 0003      	pea 3(a0)
    187c:	2f02           	move.l d2,-(sp)
    187e:	486e 0090      	pea 144(a6)
    1882:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1888:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+17);
    188a:	4fef 0020      	lea 32(sp),sp
    188e:	206d ff68      	movea.l -152(a5),a0
    1892:	4868 0004      	pea 4(a0)
    1896:	2f03           	move.l d3,-(sp)
    1898:	486e 00c0      	pea 192(a6)
    189c:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    18a2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+18);
    18a4:	206d ff68      	movea.l -152(a5),a0
    18a8:	4868 0005      	pea 5(a0)
    18ac:	2f03           	move.l d3,-(sp)
    18ae:	486e 00f0      	pea 240(a6)
    18b2:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    18b8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+19);
    18ba:	4fef 0020      	lea 32(sp),sp
    18be:	206d ff68      	movea.l -152(a5),a0
    18c2:	4868 0006      	pea 6(a0)
    18c6:	2f02           	move.l d2,-(sp)
    18c8:	486e 0120      	pea 288(a6)
    18cc:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    18d2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+20);
    18d4:	206d ff68      	movea.l -152(a5),a0
    18d8:	4868 0007      	pea 7(a0)
    18dc:	2f02           	move.l d2,-(sp)
    18de:	486e 0150      	pea 336(a6)
    18e2:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    18e8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    TestRow( valsupposed, valactual, mask, i*21+22+21);
    18ea:	4fef 0020      	lea 32(sp),sp
    18ee:	206d ff68      	movea.l -152(a5),a0
    18f2:	4868 0008      	pea 8(a0)
    18f6:	2f03           	move.l d3,-(sp)
    18f8:	486e 0180      	pea 384(a6)
    18fc:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1902:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, i*21+22+22);
    1904:	206d ff68      	movea.l -152(a5),a0
    1908:	4868 0009      	pea 9(a0)
    190c:	2f03           	move.l d3,-(sp)
    190e:	486e 01b0      	pea 432(a6)
    1912:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1918:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    191a:	2c0e           	move.l a6,d6
    191c:	0686 0000 0450 	addi.l #1104,d6
    1922:	7015           	moveq #21,d0
    1924:	d1ad ff68      	add.l d0,-152(a5)
  for(int i=0;i<10;i++) {
    1928:	4fef 0020      	lea 32(sp),sp
    192c:	0cad 0000 00f5 	cmpi.l #245,-152(a5)
    1932:	ff68 
    1934:	6600 feae      	bne.w 17e4 <main+0x17de>
    1938:	2647           	movea.l d7,a3
    193a:	4deb 2f74      	lea 12148(a3),a6
    193e:	7c02           	moveq #2,d6
    1940:	4606           	not.b d6
  }

  for(int i2=0;i2<13;i2++) {  
    TestRow( valsupposed, valactual, mask, i2+253);
    1942:	2f06           	move.l d6,-(sp)
    1944:	2f02           	move.l d2,-(sp)
    1946:	2f0e           	move.l a6,-(sp)
    1948:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    194e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1950:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1954:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    1956:	4fef 0010      	lea 16(sp),sp
    195a:	0c86 0000 010a 	cmpi.l #266,d6
    1960:	6726           	beq.s 1988 <main+0x1982>
    1962:	7400           	moveq #0,d2
    1964:	3404           	move.w d4,d2
    1966:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, i2+253);
    1968:	2f06           	move.l d6,-(sp)
    196a:	2f02           	move.l d2,-(sp)
    196c:	2f0e           	move.l a6,-(sp)
    196e:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    1974:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1976:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    197a:	5286           	addq.l #1,d6
  for(int i2=0;i2<13;i2++) {  
    197c:	4fef 0010      	lea 16(sp),sp
    1980:	0c86 0000 010a 	cmpi.l #266,d6
    1986:	66da           	bne.s 1962 <main+0x195c>
    1988:	0284 0000 ffff 	andi.l #65535,d4
  }

  TestRow( valsupposed, valactual, mask, 266);
    198e:	2f06           	move.l d6,-(sp)
    1990:	2f04           	move.l d4,-(sp)
    1992:	2f2d ff80      	move.l -128(a5),-(sp)
    1996:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    199c:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 267);
    199e:	4878 010b      	pea 10b <main+0x105>
    19a2:	2f04           	move.l d4,-(sp)
  valactual += ZMLINESIZE/2;
    19a4:	41eb 3214      	lea 12820(a3),a0
    19a8:	2b48 ff98      	move.l a0,-104(a5)
  TestRow( valsupposed, valactual, mask, 267);
    19ac:	2f08           	move.l a0,-(sp)
    19ae:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    19b4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 268);
    19b6:	4fef 0020      	lea 32(sp),sp
    19ba:	4878 010c      	pea 10c <main+0x106>
    19be:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    19c0:	41eb 3244      	lea 12868(a3),a0
    19c4:	2b48 ff9c      	move.l a0,-100(a5)
  TestRow( valsupposed, valactual, mask, 268);
    19c8:	2f08           	move.l a0,-(sp)
    19ca:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    19d0:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 269);
    19d2:	4878 010d      	pea 10d <main+0x107>
    19d6:	2f02           	move.l d2,-(sp)
  valactual += ZMLINESIZE/2;
    19d8:	41eb 3274      	lea 12916(a3),a0
    19dc:	2b48 ff80      	move.l a0,-128(a5)
  TestRow( valsupposed, valactual, mask, 269);
    19e0:	2f08           	move.l a0,-(sp)
    19e2:	4879 0000 7c18 	pea 7c18 <destlinezoom5>
    19e8:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 5);
    19ea:	4fef 0020      	lea 32(sp),sp
    19ee:	4878 0005      	pea 5 <_start+0x5>
    19f2:	2f0c           	move.l a4,-(sp)
    19f4:	2f0b           	move.l a3,-(sp)
    19f6:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    19fc:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1a02:	4eae ff1c      	jsr -228(a6)
    1a06:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    1a0a:	2c6d ff7c      	movea.l -132(a5),a6
  valsupposed = destlinezoom6;
  mask = 0x0000;
 
  for(int i2=0;i2<7;i2++) {  
    1a0e:	7400           	moveq #0,d2
  mask = 0x0000;
    1a10:	4243           	clr.w d3
    TestRow( valsupposed, valactual, mask, i2);
    1a12:	2f02           	move.l d2,-(sp)
    1a14:	3f03           	move.w d3,-(sp)
    1a16:	4267           	clr.w -(sp)
    1a18:	2f0e           	move.l a6,-(sp)
    1a1a:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1a20:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1a22:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1a26:	4643           	not.w d3
  for(int i2=0;i2<7;i2++) {  
    1a28:	5282           	addq.l #1,d2
    1a2a:	4fef 0010      	lea 16(sp),sp
    1a2e:	7007           	moveq #7,d0
    1a30:	b082           	cmp.l d2,d0
    1a32:	66de           	bne.s 1a12 <main+0x1a0c>
    1a34:	4dec 0154      	lea 340(a4),a6
    1a38:	7407           	moveq #7,d2
    1a3a:	280b           	move.l a3,d4
    1a3c:	264e           	movea.l a6,a3
    1a3e:	2c42           	movea.l d2,a6
  }

  for(int i=0;i<6;i++) {
    TestRow( valsupposed, valactual, mask, 7+i*2);   
    1a40:	7400           	moveq #0,d2
    1a42:	3403           	move.w d3,d2
    1a44:	2f0e           	move.l a6,-(sp)
    1a46:	2f02           	move.l d2,-(sp)
    1a48:	2f0b           	move.l a3,-(sp)
    1a4a:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1a50:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i*2+1);
    1a52:	486e 0001      	pea 1(a6)
    1a56:	2f02           	move.l d2,-(sp)
    1a58:	486b 0030      	pea 48(a3)
    1a5c:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1a62:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1a64:	4643           	not.w d3
    1a66:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1a68:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<6;i++) {
    1a6c:	4fef 0020      	lea 32(sp),sp
    1a70:	7213           	moveq #19,d1
    1a72:	b28e           	cmp.l a6,d1
    1a74:	66ca           	bne.s 1a40 <main+0x1a3a>
    1a76:	240e           	move.l a6,d2
    1a78:	2c04           	move.l d4,d6
    1a7a:	2c45           	movea.l d5,a6
    1a7c:	4dee fdc0      	lea -576(a6),a6
  for(int i2=0;i2<7;i2++) {  
    1a80:	2802           	move.l d2,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<12;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*24);
    1a82:	2f04           	move.l d4,-(sp)
    1a84:	3f03           	move.w d3,-(sp)
    1a86:	4267           	clr.w -(sp)
    1a88:	2f0e           	move.l a6,-(sp)
    1a8a:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1a90:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1a92:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1a96:	4643           	not.w d3
    1a98:	5284           	addq.l #1,d4
    for(int i2=0;i2<12;i2++) {  
    1a9a:	4fef 0010      	lea 16(sp),sp
    1a9e:	ba8e           	cmp.l a6,d5
    1aa0:	66e0           	bne.s 1a82 <main+0x1a7c>
    1aa2:	367c 001f      	movea.w #31,a3
    }
    for(int i=0;i<6;i++) {
      TestRow( valsupposed, valactual, mask, 31+i*24);   
    1aa6:	7800           	moveq #0,d4
    1aa8:	3803           	move.w d3,d4
    1aaa:	2f0b           	move.l a3,-(sp)
    1aac:	2f04           	move.l d4,-(sp)
    1aae:	2f0e           	move.l a6,-(sp)
    1ab0:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1ab6:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*24);
    1ab8:	486b 0001      	pea 1(a3)
    1abc:	2f04           	move.l d4,-(sp)
    1abe:	486e 0030      	pea 48(a6)
    1ac2:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1ac8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1aca:	4643           	not.w d3
    1acc:	47eb 0018      	lea 24(a3),a3
      valactual += ZMLINESIZE/2;
    1ad0:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<6;i++) {
    1ad4:	4fef 0020      	lea 32(sp),sp
    1ad8:	b6fc 00af      	cmpa.w #175,a3
    1adc:	66c8           	bne.s 1aa6 <main+0x1aa0>
    1ade:	0685 0000 0480 	addi.l #1152,d5
    1ae4:	7018           	moveq #24,d0
    1ae6:	d480           	add.l d0,d2
  for(int i=0;i<10;i++) {
    1ae8:	0c82 0000 0103 	cmpi.l #259,d2
    1aee:	668a           	bne.s 1a7a <main+0x1a74>
    1af0:	2646           	movea.l d6,a3
    1af2:	4dec 3094      	lea 12436(a4),a6
    1af6:	283c 0000 0102 	move.l #258,d4
    }
  }

  for(int i2=0;i2<11;i2++) {  
    TestRow( valsupposed, valactual, mask, 258+i2);
    1afc:	2f04           	move.l d4,-(sp)
    1afe:	3f03           	move.w d3,-(sp)
    1b00:	4267           	clr.w -(sp)
    1b02:	2f0e           	move.l a6,-(sp)
    1b04:	4879 0000 7bec 	pea 7bec <destlinezoom6>
    1b0a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1b0c:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1b10:	4643           	not.w d3
    1b12:	5284           	addq.l #1,d4
  for(int i2=0;i2<11;i2++) {  
    1b14:	4fef 0010      	lea 16(sp),sp
    1b18:	0c84 0000 010d 	cmpi.l #269,d4
    1b1e:	66dc           	bne.s 1afc <main+0x1af6>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 6);
    1b20:	4878 0006      	pea 6 <main>
    1b24:	2f0b           	move.l a3,-(sp)
    1b26:	2f0c           	move.l a4,-(sp)
    1b28:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    1b2e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1b34:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom7;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1b38:	42a7           	clr.l -(sp)
    1b3a:	42a7           	clr.l -(sp)
    1b3c:	2f2d ff78      	move.l -136(a5),-(sp)
    1b40:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1b46:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    1b48:	41eb 0034      	lea 52(a3),a0
    1b4c:	2b48 ff88      	move.l a0,-120(a5)
    1b50:	4fef 001c      	lea 28(sp),sp
    1b54:	3c7c 0001      	movea.w #1,a6
  mask = mask ^ 0xffff;
    1b58:	7eff           	moveq #-1,d7
    1b5a:	280b           	move.l a3,d4
    1b5c:	2648           	movea.l a0,a3
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1b5e:	7600           	moveq #0,d3
    1b60:	3607           	move.w d7,d3
    1b62:	2f0e           	move.l a6,-(sp)
    1b64:	2f03           	move.l d3,-(sp)
    1b66:	2f0b           	move.l a3,-(sp)
    1b68:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1b6e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1b70:	486e 0001      	pea 1(a6)
    1b74:	2f03           	move.l d3,-(sp)
    1b76:	486b 0030      	pea 48(a3)
    1b7a:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1b80:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1b82:	4647           	not.w d7
    1b84:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1b86:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    1b8a:	4fef 0020      	lea 32(sp),sp
    1b8e:	700f           	moveq #15,d0
    1b90:	b08e           	cmp.l a6,d0
    1b92:	66ca           	bne.s 1b5e <main+0x1b58>
    1b94:	2604           	move.l d4,d3
    1b96:	0683 0000 04e4 	addi.l #1252,d3
    1b9c:	2a0c           	move.l a4,d5
    1b9e:	2c04           	move.l d4,d6
    1ba0:	284e           	movea.l a6,a4
    1ba2:	2c43           	movea.l d3,a6
    1ba4:	4dee fdf0      	lea -528(a6),a6
  mask = mask ^ 0xffff;
    1ba8:	280c           	move.l a4,d4
  }

  for(int i=0;i<10;i++) {
    for(int i2=0;i2<11;i2++) {  
      TestRow( valsupposed, valactual, mask, 15+i2+i*25);
    1baa:	2f04           	move.l d4,-(sp)
    1bac:	3f07           	move.w d7,-(sp)
    1bae:	4267           	clr.w -(sp)
    1bb0:	2f0e           	move.l a6,-(sp)
    1bb2:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1bb8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1bba:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1bbe:	4647           	not.w d7
    1bc0:	5284           	addq.l #1,d4
    for(int i2=0;i2<11;i2++) {  
    1bc2:	4fef 0010      	lea 16(sp),sp
    1bc6:	b68e           	cmp.l a6,d3
    1bc8:	66e0           	bne.s 1baa <main+0x1ba4>
    1bca:	367c 001a      	movea.w #26,a3
    }
    for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 26+i*25);   
    1bce:	7800           	moveq #0,d4
    1bd0:	3807           	move.w d7,d4
    1bd2:	2f0b           	move.l a3,-(sp)
    1bd4:	2f04           	move.l d4,-(sp)
    1bd6:	2f0e           	move.l a6,-(sp)
    1bd8:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1bde:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 26+i*25);
    1be0:	2f0b           	move.l a3,-(sp)
    1be2:	2f04           	move.l d4,-(sp)
    1be4:	486e 0030      	pea 48(a6)
    1be8:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1bee:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1bf0:	4647           	not.w d7
    1bf2:	47eb 0019      	lea 25(a3),a3
      valactual += ZMLINESIZE/2;
    1bf6:	4dee 0060      	lea 96(a6),a6
    for(int i=0;i<7;i++) {
    1bfa:	4fef 0020      	lea 32(sp),sp
    1bfe:	b6fc 00c9      	cmpa.w #201,a3
    1c02:	66ca           	bne.s 1bce <main+0x1bc8>
    1c04:	0683 0000 04b0 	addi.l #1200,d3
    1c0a:	49ec 0019      	lea 25(a4),a4
  for(int i=0;i<10;i++) {
    1c0e:	b8fc 0109      	cmpa.w #265,a4
    1c12:	668e           	bne.s 1ba2 <main+0x1b9c>
    1c14:	2845           	movea.l d5,a4
    1c16:	2646           	movea.l d6,a3
    1c18:	4deb 31b4      	lea 12724(a3),a6
    1c1c:	263c 0000 0100 	move.l #256,d3
    }
  }

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 256+i2);
    1c22:	2f03           	move.l d3,-(sp)
    1c24:	3f07           	move.w d7,-(sp)
    1c26:	4267           	clr.w -(sp)
    1c28:	2f0e           	move.l a6,-(sp)
    1c2a:	4879 0000 7bc0 	pea 7bc0 <destlinezoom7>
    1c30:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1c32:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1c36:	4647           	not.w d7
    1c38:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    1c3a:	4fef 0010      	lea 16(sp),sp
    1c3e:	0c83 0000 0105 	cmpi.l #261,d3
    1c44:	66dc           	bne.s 1c22 <main+0x1c1c>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 7);
    1c46:	4878 0007      	pea 7 <main+0x1>
    1c4a:	2f0c           	move.l a4,-(sp)
    1c4c:	2f0b           	move.l a3,-(sp)
    1c4e:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    1c54:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1c5a:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom8;
  mask = 0xffff;
 
  TestRow( valsupposed, valactual, mask, 0);
    1c5e:	42a7           	clr.l -(sp)
    1c60:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1c66:	2f2d ff7c      	move.l -132(a5),-(sp)
    1c6a:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1c70:	4e92           	jsr (a2)
    1c72:	4fef 001c      	lea 28(sp),sp
    1c76:	2b6d ff70 ff6c 	move.l -144(a5),-148(a5)
  valactual += ZMLINESIZE/2;
    1c7c:	2a2d ff84      	move.l -124(a5),d5
  TestRow( valsupposed, valactual, mask, 0);
    1c80:	7601           	moveq #1,d3
  mask = mask ^ 0xffff;
    1c82:	4244           	clr.w d4
    1c84:	2c43           	movea.l d3,a6
    1c86:	2c2d ff6c      	move.l -148(a5),d6
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1c8a:	7600           	moveq #0,d3
    1c8c:	3604           	move.w d4,d3
    1c8e:	2f0e           	move.l a6,-(sp)
    1c90:	2f03           	move.l d3,-(sp)
    1c92:	2f05           	move.l d5,-(sp)
    1c94:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1c9a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1c9c:	486e 0001      	pea 1(a6)
    1ca0:	2f03           	move.l d3,-(sp)
    1ca2:	2045           	movea.l d5,a0
    1ca4:	4868 0030      	pea 48(a0)
    1ca8:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1cae:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1cb0:	4644           	not.w d4
    1cb2:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    1cb4:	4fef 0020      	lea 32(sp),sp
    1cb8:	700b           	moveq #11,d0
    1cba:	b08e           	cmp.l a6,d0
    1cbc:	6740           	beq.s 1cfe <main+0x1cf8>
    1cbe:	2005           	move.l d5,d0
    1cc0:	0680 0000 00c0 	addi.l #192,d0
    1cc6:	2a06           	move.l d6,d5
    1cc8:	2c00           	move.l d0,d6
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1cca:	7600           	moveq #0,d3
    1ccc:	3604           	move.w d4,d3
    1cce:	2f0e           	move.l a6,-(sp)
    1cd0:	2f03           	move.l d3,-(sp)
    1cd2:	2f05           	move.l d5,-(sp)
    1cd4:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1cda:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1cdc:	486e 0001      	pea 1(a6)
    1ce0:	2f03           	move.l d3,-(sp)
    1ce2:	2045           	movea.l d5,a0
    1ce4:	4868 0030      	pea 48(a0)
    1ce8:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1cee:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    1cf0:	4644           	not.w d4
    1cf2:	548e           	addq.l #2,a6
  for(int i=0;i<5;i++) {
    1cf4:	4fef 0020      	lea 32(sp),sp
    1cf8:	700b           	moveq #11,d0
    1cfa:	b08e           	cmp.l a6,d0
    1cfc:	66c0           	bne.s 1cbe <main+0x1cb8>
    1cfe:	260e           	move.l a6,d3
    1d00:	2b46 ff6c      	move.l d6,-148(a5)
    1d04:	0686 0000 01e0 	addi.l #480,d6
    1d0a:	7e15           	moveq #21,d7
    1d0c:	2b4c ffac      	move.l a4,-84(a5)
    1d10:	2b4b ffb0      	move.l a3,-80(a5)
    1d14:	2647           	movea.l d7,a3
    1d16:	2c46           	movea.l d6,a6
    1d18:	4dee fe20      	lea -480(a6),a6
    1d1c:	49eb fff6      	lea -10(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<10;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*26);
    1d20:	2f0c           	move.l a4,-(sp)
    1d22:	3f04           	move.w d4,-(sp)
    1d24:	4267           	clr.w -(sp)
    1d26:	2f0e           	move.l a6,-(sp)
    1d28:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1d2e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1d30:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1d34:	4644           	not.w d4
    1d36:	528c           	addq.l #1,a4
    for(int i2=0;i2<10;i2++) {  
    1d38:	4fef 0010      	lea 16(sp),sp
    1d3c:	bc8e           	cmp.l a6,d6
    1d3e:	66e0           	bne.s 1d20 <main+0x1d1a>
    1d40:	2a0b           	move.l a3,d5
    1d42:	2e0e           	move.l a6,d7
    1d44:	0687 0000 0300 	addi.l #768,d7
    }
    for(int i2=0;i2<8;i2++) {
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);   
    1d4a:	7200           	moveq #0,d1
    1d4c:	3204           	move.w d4,d1
    1d4e:	2841           	movea.l d1,a4
    1d50:	2f05           	move.l d5,-(sp)
    1d52:	2f0c           	move.l a4,-(sp)
    1d54:	2f0e           	move.l a6,-(sp)
    1d56:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1d5c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*26+i2);
    1d5e:	2f05           	move.l d5,-(sp)
    1d60:	2f0c           	move.l a4,-(sp)
    1d62:	486e 0030      	pea 48(a6)
    1d66:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1d6c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1d6e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    1d72:	4644           	not.w d4
    1d74:	5285           	addq.l #1,d5
    for(int i2=0;i2<8;i2++) {
    1d76:	4fef 0020      	lea 32(sp),sp
    1d7a:	be8e           	cmp.l a6,d7
    1d7c:	66cc           	bne.s 1d4a <main+0x1d44>
    1d7e:	0686 0000 04e0 	addi.l #1248,d6
    1d84:	47eb 001a      	lea 26(a3),a3
  for(int i=0;i<9;i++) {
    1d88:	b6fc 00ff      	cmpa.w #255,a3
    1d8c:	6688           	bne.s 1d16 <main+0x1d10>
    1d8e:	286d ffac      	movea.l -84(a5),a4
    1d92:	266d ffb0      	movea.l -80(a5),a3
    1d96:	2c2d ff6c      	move.l -148(a5),d6
    1d9a:	0686 0000 2be0 	addi.l #11232,d6
    1da0:	2a2d ff68      	move.l -152(a5),d5
    1da4:	2c46           	movea.l d6,a6
    }
  }

  for(int i2=0;i2<10;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1da6:	2f05           	move.l d5,-(sp)
    1da8:	3f04           	move.w d4,-(sp)
    1daa:	4267           	clr.w -(sp)
    1dac:	2f0e           	move.l a6,-(sp)
    1dae:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1db4:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1db6:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1dba:	4644           	not.w d4
    1dbc:	5285           	addq.l #1,d5
  for(int i2=0;i2<10;i2++) {  
    1dbe:	4fef 0010      	lea 16(sp),sp
    1dc2:	0c85 0000 00ff 	cmpi.l #255,d5
    1dc8:	66dc           	bne.s 1da6 <main+0x1da0>
    1dca:	2c2d ff6c      	move.l -148(a5),d6
    1dce:	0686 0000 2dc0 	addi.l #11712,d6
    1dd4:	2c45           	movea.l d5,a6
    1dd6:	2e0b           	move.l a3,d7
    1dd8:	2646           	movea.l d6,a3
  }
  for(int i=0;i<7;i++) {
    TestRow( valsupposed, valactual, mask, 255+i*2);   
    1dda:	7c00           	moveq #0,d6
    1ddc:	3c04           	move.w d4,d6
    1dde:	2f0e           	move.l a6,-(sp)
    1de0:	2f06           	move.l d6,-(sp)
    1de2:	2f0b           	move.l a3,-(sp)
    1de4:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1dea:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 256+i*2);
    1dec:	486e 0001      	pea 1(a6)
    1df0:	2f06           	move.l d6,-(sp)
    1df2:	486b 0030      	pea 48(a3)
    1df6:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1dfc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1dfe:	4644           	not.w d4
    1e00:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1e02:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<7;i++) {
    1e06:	4fef 0020      	lea 32(sp),sp
    1e0a:	bcfc 010d      	cmpa.w #269,a6
    1e0e:	66ca           	bne.s 1dda <main+0x1dd4>
    1e10:	2647           	movea.l d7,a3
  }
  TestRow( valsupposed, valactual, mask, 269);
    1e12:	2f0e           	move.l a6,-(sp)
    1e14:	3f04           	move.w d4,-(sp)
    1e16:	4267           	clr.w -(sp)
    1e18:	206d ff6c      	movea.l -148(a5),a0
    1e1c:	4868 3060      	pea 12384(a0)
    1e20:	4879 0000 7b94 	pea 7b94 <destlinezoom8>
    1e26:	4e92           	jsr (a2)
 
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 8);
    1e28:	4878 0008      	pea 8 <main+0x2>
    1e2c:	2f0b           	move.l a3,-(sp)
    1e2e:	2f0c           	move.l a4,-(sp)
    1e30:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    1e36:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1e3c:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom9;
  mask = 0x0000;
 
  TestRow( valsupposed, valactual, mask, 0);
    1e40:	42a7           	clr.l -(sp)
    1e42:	42a7           	clr.l -(sp)
    1e44:	2f2d ff78      	move.l -136(a5),-(sp)
    1e48:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1e4e:	4e92           	jsr (a2)
    1e50:	4fef 002c      	lea 44(sp),sp
    1e54:	3c7c 0001      	movea.w #1,a6
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
    1e58:	7cff           	moveq #-1,d6
    1e5a:	2e0b           	move.l a3,d7
    1e5c:	266d ff88      	movea.l -120(a5),a3
  
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 1+i*2);   
    1e60:	7800           	moveq #0,d4
    1e62:	3806           	move.w d6,d4
    1e64:	2f0e           	move.l a6,-(sp)
    1e66:	2f04           	move.l d4,-(sp)
    1e68:	2f0b           	move.l a3,-(sp)
    1e6a:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1e70:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i*2+1);
    1e72:	486e 0001      	pea 1(a6)
    1e76:	2f04           	move.l d4,-(sp)
    1e78:	486b 0030      	pea 48(a3)
    1e7c:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1e82:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1e84:	4646           	not.w d6
    1e86:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1e88:	47eb 0060      	lea 96(a3),a3
  for(int i=0;i<3;i++) {
    1e8c:	4fef 0020      	lea 32(sp),sp
    1e90:	7007           	moveq #7,d0
    1e92:	b08e           	cmp.l a6,d0
    1e94:	66ca           	bne.s 1e60 <main+0x1e5a>
    1e96:	282d ff8c      	move.l -116(a5),d4
    1e9a:	307c 0014      	movea.w #20,a0
    1e9e:	2b4c ff6c      	move.l a4,-148(a5)
    1ea2:	2b47 ff88      	move.l d7,-120(a5)
    1ea6:	2648           	movea.l a0,a3
    1ea8:	2b43 ff8c      	move.l d3,-116(a5)
    1eac:	2002           	move.l d2,d0
    1eae:	3406           	move.w d6,d2
    1eb0:	2c00           	move.l d0,d6
    1eb2:	2c44           	movea.l d4,a6
    1eb4:	4dee fe50      	lea -432(a6),a6
    1eb8:	49eb fff7      	lea -9(a3),a4
  }

  for(int i=0;i<9;i++) {
    for(int i2=0;i2<9;i2++) {  
      TestRow( valsupposed, valactual, mask, 11+i2+i*27);
    1ebc:	2f0c           	move.l a4,-(sp)
    1ebe:	3f02           	move.w d2,-(sp)
    1ec0:	4267           	clr.w -(sp)
    1ec2:	2f0e           	move.l a6,-(sp)
    1ec4:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1eca:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    1ecc:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    1ed0:	4642           	not.w d2
    1ed2:	528c           	addq.l #1,a4
    for(int i2=0;i2<9;i2++) {  
    1ed4:	4fef 0010      	lea 16(sp),sp
    1ed8:	b88e           	cmp.l a6,d4
    1eda:	66e0           	bne.s 1ebc <main+0x1eb6>
    1edc:	2e0b           	move.l a3,d7
    1ede:	49eb 0009      	lea 9(a3),a4
    }
    
    for(int i2=0;i2<9;i2++) {
      TestRow( valsupposed, valactual, mask, 20+i*27+i2);   
    1ee2:	7600           	moveq #0,d3
    1ee4:	3602           	move.w d2,d3
    1ee6:	2f07           	move.l d7,-(sp)
    1ee8:	2f03           	move.l d3,-(sp)
    1eea:	2f0e           	move.l a6,-(sp)
    1eec:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1ef2:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 21+i*27+i2);
    1ef4:	5287           	addq.l #1,d7
    1ef6:	2f07           	move.l d7,-(sp)
    1ef8:	2f03           	move.l d3,-(sp)
    1efa:	486e 0030      	pea 48(a6)
    1efe:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1f04:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    1f06:	4642           	not.w d2
      valactual += ZMLINESIZE/2;
    1f08:	4dee 0060      	lea 96(a6),a6
    for(int i2=0;i2<9;i2++) {
    1f0c:	4fef 0020      	lea 32(sp),sp
    1f10:	be8c           	cmp.l a4,d7
    1f12:	66ce           	bne.s 1ee2 <main+0x1edc>
    1f14:	0684 0000 0510 	addi.l #1296,d4
    1f1a:	47eb 001b      	lea 27(a3),a3
  for(int i=0;i<9;i++) {
    1f1e:	b6fc 0107      	cmpa.w #263,a3
    1f22:	668e           	bne.s 1eb2 <main+0x1eac>
    1f24:	286d ff6c      	movea.l -148(a5),a4
    1f28:	266d ff88      	movea.l -120(a5),a3
    1f2c:	262d ff8c      	move.l -116(a5),d3
    1f30:	2006           	move.l d6,d0
    1f32:	3c02           	move.w d2,d6
    1f34:	2400           	move.l d0,d2
    1f36:	41eb 2ee4      	lea 12004(a3),a0
    1f3a:	2b48 ff6c      	move.l a0,-148(a5)
    1f3e:	2c48           	movea.l a0,a6
    }
  }

  for(int i2=0;i2<9;i2++) {  
    TestRow( valsupposed, valactual, mask, 245+i2);
    1f40:	2f2d ff68      	move.l -152(a5),-(sp)
    1f44:	3f06           	move.w d6,-(sp)
    1f46:	4267           	clr.w -(sp)
    1f48:	2f0e           	move.l a6,-(sp)
    1f4a:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1f50:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    1f52:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    1f56:	4646           	not.w d6
    1f58:	52ad ff68      	addq.l #1,-152(a5)
  for(int i2=0;i2<9;i2++) {  
    1f5c:	4fef 0010      	lea 16(sp),sp
    1f60:	0cad 0000 00fe 	cmpi.l #254,-152(a5)
    1f66:	ff68 
    1f68:	66d6           	bne.s 1f40 <main+0x1f3a>
    1f6a:	41eb 3094      	lea 12436(a3),a0
    1f6e:	2b48 ff88      	move.l a0,-120(a5)
    1f72:	2c42           	movea.l d2,a6
  }
  for(int i=0;i<5;i++) {
    TestRow( valsupposed, valactual, mask, 259+i*2);   
    1f74:	7400           	moveq #0,d2
    1f76:	3406           	move.w d6,d2
    1f78:	2f0e           	move.l a6,-(sp)
    1f7a:	2f02           	move.l d2,-(sp)
    1f7c:	2f2d ff88      	move.l -120(a5),-(sp)
    1f80:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1f86:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 260+i*2);
    1f88:	486e 0001      	pea 1(a6)
    1f8c:	2f02           	move.l d2,-(sp)
    1f8e:	206d ff88      	movea.l -120(a5),a0
    1f92:	4868 0030      	pea 48(a0)
    1f96:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1f9c:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    1f9e:	4646           	not.w d6
    1fa0:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    1fa2:	7060           	moveq #96,d0
    1fa4:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<5;i++) {
    1fa8:	4fef 0020      	lea 32(sp),sp
    1fac:	bcfc 010d      	cmpa.w #269,a6
    1fb0:	66c2           	bne.s 1f74 <main+0x1f6e>
  }
  TestRow( valsupposed, valactual, mask, 269);
    1fb2:	2f0e           	move.l a6,-(sp)
    1fb4:	3f06           	move.w d6,-(sp)
    1fb6:	4267           	clr.w -(sp)
    1fb8:	2f2d ff80      	move.l -128(a5),-(sp)
    1fbc:	4879 0000 7b68 	pea 7b68 <destlinezoom9>
    1fc2:	4e92           	jsr (a2)

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 9);
    1fc4:	4878 0009      	pea 9 <main+0x3>
    1fc8:	2f0c           	move.l a4,-(sp)
    1fca:	2f0b           	move.l a3,-(sp)
    1fcc:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    1fd2:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    1fd8:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom10;

  mask = 0xffff;
  TestRow( valsupposed, valactual, mask, 0);
    1fdc:	42a7           	clr.l -(sp)
    1fde:	2f3c 0000 ffff 	move.l #65535,-(sp)
    1fe4:	2f2d ff7c      	move.l -132(a5),-(sp)
    1fe8:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    1fee:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 1);   
    1ff0:	4fef 002c      	lea 44(sp),sp
    1ff4:	4878 0001      	pea 1 <_start+0x1>
    1ff8:	42a7           	clr.l -(sp)
    1ffa:	2f2d ff84      	move.l -124(a5),-(sp)
    1ffe:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    2004:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 2);
    2006:	4878 0002      	pea 2 <_start+0x2>
    200a:	42a7           	clr.l -(sp)
    200c:	2f2d ff90      	move.l -112(a5),-(sp)
    2010:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    2016:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;

  for(int i=0;i<9;i++) {
    2018:	242d ffa4      	move.l -92(a5),d2
    201c:	4fef 0020      	lea 32(sp),sp
  mask = mask ^ 0xffff;
    2020:	7eff           	moveq #-1,d7
    2022:	2c43           	movea.l d3,a6
    2024:	2042           	movea.l d2,a0
    2026:	41e8 fe80      	lea -384(a0),a0
    202a:	2b48 ff88      	move.l a0,-120(a5)
    202e:	260e           	move.l a6,d3
    2030:	5183           	subq.l #8,d3
    for(int i2=0;i2<8;i2++) {  
      TestRow( valsupposed, valactual, mask, 3+i2+i*28);
    2032:	2f03           	move.l d3,-(sp)
    2034:	3f07           	move.w d7,-(sp)
    2036:	4267           	clr.w -(sp)
    2038:	2f2d ff88      	move.l -120(a5),-(sp)
    203c:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    2042:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2044:	7230           	moveq #48,d1
    2046:	d3ad ff88      	add.l d1,-120(a5)
      mask = mask ^ 0xffff;
    204a:	4647           	not.w d7
    204c:	5283           	addq.l #1,d3
    for(int i2=0;i2<8;i2++) {  
    204e:	4fef 0010      	lea 16(sp),sp
    2052:	b4ad ff88      	cmp.l -120(a5),d2
    2056:	66da           	bne.s 2032 <main+0x202c>
    2058:	260e           	move.l a6,d3
    205a:	2c2d ff88      	move.l -120(a5),d6
    205e:	0686 0000 03c0 	addi.l #960,d6
    }
    
    for(int i2=0;i2<10;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);   
    2064:	7800           	moveq #0,d4
    2066:	3807           	move.w d7,d4
    2068:	2f03           	move.l d3,-(sp)
    206a:	2f04           	move.l d4,-(sp)
    206c:	2f2d ff88      	move.l -120(a5),-(sp)
    2070:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    2076:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*28+i2);
    2078:	2f03           	move.l d3,-(sp)
    207a:	2f04           	move.l d4,-(sp)
    207c:	206d ff88      	movea.l -120(a5),a0
    2080:	4868 0030      	pea 48(a0)
    2084:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    208a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    208c:	7060           	moveq #96,d0
    208e:	d1ad ff88      	add.l d0,-120(a5)
      mask = mask ^ 0xffff;
    2092:	4647           	not.w d7
    2094:	5283           	addq.l #1,d3
    for(int i2=0;i2<10;i2++) {
    2096:	4fef 0020      	lea 32(sp),sp
    209a:	bcad ff88      	cmp.l -120(a5),d6
    209e:	66c4           	bne.s 2064 <main+0x205e>
    20a0:	0682 0000 0540 	addi.l #1344,d2
    20a6:	4dee 001c      	lea 28(a6),a6
  for(int i=0;i<9;i++) {
    20aa:	bcfc 0107      	cmpa.w #263,a6
    20ae:	6600 ff74      	bne.w 2024 <main+0x201e>
    }
  }

  for(int i2=0;i2<8;i2++) {  
    TestRow( valsupposed, valactual, mask, 255+i2);
    20b2:	2f05           	move.l d5,-(sp)
    20b4:	3f07           	move.w d7,-(sp)
    20b6:	4267           	clr.w -(sp)
    20b8:	2f2d ffa8      	move.l -88(a5),-(sp)
    20bc:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    20c2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    20c4:	7030           	moveq #48,d0
    20c6:	d1ad ffa8      	add.l d0,-88(a5)
    mask = mask ^ 0xffff;
    20ca:	4647           	not.w d7
    20cc:	5285           	addq.l #1,d5
  for(int i2=0;i2<8;i2++) {  
    20ce:	4fef 0010      	lea 16(sp),sp
    20d2:	0c85 0000 0107 	cmpi.l #263,d5
    20d8:	66d8           	bne.s 20b2 <main+0x20ac>
    20da:	4dec 3154      	lea 12628(a4),a6
    20de:	2b7c 0000 0108 	move.l #264,-120(a5)
    20e4:	ff88 
  }
  for(int i=0;i<3;i++) {
    TestRow( valsupposed, valactual, mask, 263+i*2);   
    20e6:	7400           	moveq #0,d2
    20e8:	3407           	move.w d7,d2
    20ea:	206d ff88      	movea.l -120(a5),a0
    20ee:	4868 ffff      	pea -1(a0)
    20f2:	2f02           	move.l d2,-(sp)
    20f4:	2f0e           	move.l a6,-(sp)
    20f6:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    20fc:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 264+i*2);
    20fe:	2f2d ff88      	move.l -120(a5),-(sp)
    2102:	2f02           	move.l d2,-(sp)
    2104:	486e 0030      	pea 48(a6)
    2108:	4879 0000 7b3c 	pea 7b3c <destlinezoom10>
    210e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2110:	4647           	not.w d7
    2112:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    2116:	4dee 0060      	lea 96(a6),a6
  for(int i=0;i<3;i++) {
    211a:	4fef 0020      	lea 32(sp),sp
    211e:	0cad 0000 010e 	cmpi.l #270,-120(a5)
    2124:	ff88 
    2126:	66be           	bne.s 20e6 <main+0x20e0>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 10);
    2128:	4878 000a      	pea a <main+0x4>
    212c:	2f0b           	move.l a3,-(sp)
    212e:	2f0c           	move.l a4,-(sp)
    2130:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    2136:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    213c:	4eae ff1c      	jsr -228(a6)
    2140:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    2144:	2b6d ff78 ff88 	move.l -136(a5),-120(a5)
  valsupposed = destlinezoom11;

  mask = 0xffff;
 
  for(int i2=0;i2<6;i2++) {  
    214a:	7600           	moveq #0,d3
  mask = 0xffff;
    214c:	74ff           	moveq #-1,d2
    TestRow( valsupposed, valactual, mask, i2);
    214e:	2f03           	move.l d3,-(sp)
    2150:	3f02           	move.w d2,-(sp)
    2152:	4267           	clr.w -(sp)
    2154:	2f2d ff88      	move.l -120(a5),-(sp)
    2158:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    215e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2160:	7030           	moveq #48,d0
    2162:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    2166:	4642           	not.w d2
  for(int i2=0;i2<6;i2++) {  
    2168:	5283           	addq.l #1,d3
    216a:	4fef 0010      	lea 16(sp),sp
    216e:	7206           	moveq #6,d1
    2170:	b283           	cmp.l d3,d1
    2172:	66da           	bne.s 214e <main+0x2148>
    2174:	2c6d ffa0      	movea.l -96(a5),a6
    2178:	307c 0006      	movea.w #6,a0
    217c:	2b48 ff88      	move.l a0,-120(a5)
  }

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 6+i2*2);   
    2180:	7600           	moveq #0,d3
    2182:	3602           	move.w d2,d3
    2184:	2f2d ff88      	move.l -120(a5),-(sp)
    2188:	2f03           	move.l d3,-(sp)
    218a:	2f0e           	move.l a6,-(sp)
    218c:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    2192:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 7+i2*2);
    2194:	206d ff88      	movea.l -120(a5),a0
    2198:	4868 0001      	pea 1(a0)
    219c:	2f03           	move.l d3,-(sp)
    219e:	486e 0030      	pea 48(a6)
    21a2:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    21a8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    21aa:	4642           	not.w d2
    21ac:	54ad ff88      	addq.l #2,-120(a5)
    valactual += ZMLINESIZE/2;
    21b0:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    21b4:	4fef 0020      	lea 32(sp),sp
    21b8:	701c           	moveq #28,d0
    21ba:	b0ad ff88      	cmp.l -120(a5),d0
    21be:	66c0           	bne.s 2180 <main+0x217a>
    21c0:	260b           	move.l a3,d3
    21c2:	0683 0000 0694 	addi.l #1684,d3
    21c8:	307c 0023      	movea.w #35,a0
    21cc:	2b48 ff88      	move.l a0,-120(a5)
    21d0:	2c0b           	move.l a3,d6
    21d2:	2c43           	movea.l d3,a6
    21d4:	4dee feb0      	lea -336(a6),a6
    21d8:	282d ff88      	move.l -120(a5),d4
    21dc:	5f84           	subq.l #7,d4
  }

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<7;i2++) {  
      TestRow( valsupposed, valactual, mask, 28+i2+i*29);
    21de:	2f04           	move.l d4,-(sp)
    21e0:	3f02           	move.w d2,-(sp)
    21e2:	4267           	clr.w -(sp)
    21e4:	2f0e           	move.l a6,-(sp)
    21e6:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    21ec:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    21ee:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    21f2:	4642           	not.w d2
    21f4:	5284           	addq.l #1,d4
    for(int i2=0;i2<7;i2++) {  
    21f6:	4fef 0010      	lea 16(sp),sp
    21fa:	b68e           	cmp.l a6,d3
    21fc:	66e0           	bne.s 21de <main+0x21d8>
    21fe:	266d ff88      	movea.l -120(a5),a3
    2202:	2a0e           	move.l a6,d5
    2204:	0685 0000 0420 	addi.l #1056,d5
    }
    
    for(int i2=0;i2<11;i2++) {
      TestRow( valsupposed, valactual, mask, 35+i*29+i2*2);   
    220a:	7800           	moveq #0,d4
    220c:	3802           	move.w d2,d4
    220e:	2f0b           	move.l a3,-(sp)
    2210:	2f04           	move.l d4,-(sp)
    2212:	2f0e           	move.l a6,-(sp)
    2214:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    221a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 11+i*29+i2*2);
    221c:	486b ffe8      	pea -24(a3)
    2220:	2f04           	move.l d4,-(sp)
    2222:	486e 0030      	pea 48(a6)
    2226:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    222c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    222e:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2232:	4642           	not.w d2
    2234:	548b           	addq.l #2,a3
    for(int i2=0;i2<11;i2++) {
    2236:	4fef 0020      	lea 32(sp),sp
    223a:	ba8e           	cmp.l a6,d5
    223c:	66cc           	bne.s 220a <main+0x2204>
    223e:	0683 0000 0570 	addi.l #1392,d3
    2244:	701d           	moveq #29,d0
    2246:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<8;i++) {
    224a:	0cad 0000 010b 	cmpi.l #267,-120(a5)
    2250:	ff88 
    2252:	6600 ff7e      	bne.w 21d2 <main+0x21cc>
    2256:	2646           	movea.l d6,a3
    2258:	41eb 30c4      	lea 12484(a3),a0
    225c:	2b48 ff88      	move.l a0,-120(a5)
    2260:	283c 0000 0104 	move.l #260,d4
    }
  } 

  for(int i2=0;i2<7;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    2266:	7600           	moveq #0,d3
    2268:	3602           	move.w d2,d3
    226a:	2f04           	move.l d4,-(sp)
    226c:	2f03           	move.l d3,-(sp)
    226e:	2f2d ff88      	move.l -120(a5),-(sp)
    2272:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    2278:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    227a:	7030           	moveq #48,d0
    227c:	d1ad ff88      	add.l d0,-120(a5)
    mask = mask ^ 0xffff;
    2280:	4642           	not.w d2
    2282:	5284           	addq.l #1,d4
  for(int i2=0;i2<7;i2++) {  
    2284:	4fef 0010      	lea 16(sp),sp
    2288:	0c84 0000 010b 	cmpi.l #267,d4
    228e:	66d6           	bne.s 2266 <main+0x2260>
    2290:	0282 0000 ffff 	andi.l #65535,d2
  }
  TestRow( valsupposed, valactual, mask, 267);   
    2296:	2f04           	move.l d4,-(sp)
    2298:	2f02           	move.l d2,-(sp)
    229a:	2f2d ff98      	move.l -104(a5),-(sp)
    229e:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    22a4:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  TestRow( valsupposed, valactual, mask, 268);
    22a6:	4878 010c      	pea 10c <main+0x106>
    22aa:	2f02           	move.l d2,-(sp)
    22ac:	2f2d ff9c      	move.l -100(a5),-(sp)
    22b0:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    22b6:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
  TestRow( valsupposed, valactual, mask, 269);
    22b8:	4fef 0020      	lea 32(sp),sp
    22bc:	4878 010d      	pea 10d <main+0x107>
    22c0:	2f03           	move.l d3,-(sp)
    22c2:	2f2d ff80      	move.l -128(a5),-(sp)
    22c6:	4879 0000 7b10 	pea 7b10 <destlinezoom11>
    22cc:	4e92           	jsr (a2)
  
  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 11);
    22ce:	4878 000b      	pea b <main+0x5>
    22d2:	2f0c           	move.l a4,-(sp)
    22d4:	2f0b           	move.l a3,-(sp)
    22d6:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    22dc:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    22e2:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom12;

  mask = 0x0;
   
  TestRow( valsupposed, valactual, mask, 0);
    22e6:	42a7           	clr.l -(sp)
    22e8:	42a7           	clr.l -(sp)
    22ea:	2f2d ff7c      	move.l -132(a5),-(sp)
    22ee:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    22f4:	4e92           	jsr (a2)
    22f6:	4fef 002c      	lea 44(sp),sp
    22fa:	262d ff70      	move.l -144(a5),d3
  valactual += ZMLINESIZE/2;
    22fe:	2c6d ff84      	movea.l -124(a5),a6
  TestRow( valsupposed, valactual, mask, 0);
    2302:	307c 0001      	movea.w #1,a0
    2306:	2b48 ff80      	move.l a0,-128(a5)
  mask = mask ^ 0xffff;
    230a:	74ff           	moveq #-1,d2

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    230c:	7800           	moveq #0,d4
    230e:	3802           	move.w d2,d4
    2310:	2f2d ff80      	move.l -128(a5),-(sp)
    2314:	2f04           	move.l d4,-(sp)
    2316:	2f0e           	move.l a6,-(sp)
    2318:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    231e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2320:	206d ff80      	movea.l -128(a5),a0
    2324:	4868 0001      	pea 1(a0)
    2328:	2f04           	move.l d4,-(sp)
    232a:	486e 0030      	pea 48(a6)
    232e:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    2334:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2336:	4642           	not.w d2
    2338:	54ad ff80      	addq.l #2,-128(a5)
  for(int i2=0;i2<12;i2++) {
    233c:	4fef 0020      	lea 32(sp),sp
    2340:	7019           	moveq #25,d0
    2342:	b0ad ff80      	cmp.l -128(a5),d0
    2346:	6748           	beq.s 2390 <main+0x238a>
    2348:	200e           	move.l a6,d0
    234a:	0680 0000 00c0 	addi.l #192,d0
    2350:	2c43           	movea.l d3,a6
    2352:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2354:	7800           	moveq #0,d4
    2356:	3802           	move.w d2,d4
    2358:	2f2d ff80      	move.l -128(a5),-(sp)
    235c:	2f04           	move.l d4,-(sp)
    235e:	2f0e           	move.l a6,-(sp)
    2360:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    2366:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2368:	206d ff80      	movea.l -128(a5),a0
    236c:	4868 0001      	pea 1(a0)
    2370:	2f04           	move.l d4,-(sp)
    2372:	486e 0030      	pea 48(a6)
    2376:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    237c:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    237e:	4642           	not.w d2
    2380:	54ad ff80      	addq.l #2,-128(a5)
  for(int i2=0;i2<12;i2++) {
    2384:	4fef 0020      	lea 32(sp),sp
    2388:	7019           	moveq #25,d0
    238a:	b0ad ff80      	cmp.l -128(a5),d0
    238e:	66b8           	bne.s 2348 <main+0x2342>
    2390:	2803           	move.l d3,d4
    2392:	0684 0000 0120 	addi.l #288,d4
    2398:	307c 001f      	movea.w #31,a0
    239c:	2b48 ff80      	move.l a0,-128(a5)
    23a0:	2c0b           	move.l a3,d6
    23a2:	2c44           	movea.l d4,a6
    23a4:	4dee fee0      	lea -288(a6),a6
    23a8:	2a2d ff80      	move.l -128(a5),d5
    23ac:	5d85           	subq.l #6,d5
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<6;i2++) {  
      TestRow( valsupposed, valactual, mask, 25+i2+i*30);
    23ae:	2f05           	move.l d5,-(sp)
    23b0:	3f02           	move.w d2,-(sp)
    23b2:	4267           	clr.w -(sp)
    23b4:	2f0e           	move.l a6,-(sp)
    23b6:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    23bc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    23be:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    23c2:	4642           	not.w d2
    23c4:	5285           	addq.l #1,d5
    for(int i2=0;i2<6;i2++) {  
    23c6:	4fef 0010      	lea 16(sp),sp
    23ca:	b88e           	cmp.l a6,d4
    23cc:	66e0           	bne.s 23ae <main+0x23a8>
    23ce:	266d ff80      	movea.l -128(a5),a3
    23d2:	2e0e           	move.l a6,d7
    23d4:	0687 0000 0480 	addi.l #1152,d7
    }
    
    for(int i2=0;i2<12;i2++) {
      TestRow( valsupposed, valactual, mask, 31+i*30+i2*2);   
    23da:	7a00           	moveq #0,d5
    23dc:	3a02           	move.w d2,d5
    23de:	2f0b           	move.l a3,-(sp)
    23e0:	2f05           	move.l d5,-(sp)
    23e2:	2f0e           	move.l a6,-(sp)
    23e4:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    23ea:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 32+i*30+i2*2);
    23ec:	486b 0001      	pea 1(a3)
    23f0:	2f05           	move.l d5,-(sp)
    23f2:	486e 0030      	pea 48(a6)
    23f6:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    23fc:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    23fe:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2402:	4642           	not.w d2
    2404:	548b           	addq.l #2,a3
    for(int i2=0;i2<12;i2++) {
    2406:	4fef 0020      	lea 32(sp),sp
    240a:	be8e           	cmp.l a6,d7
    240c:	66cc           	bne.s 23da <main+0x23d4>
    240e:	0684 0000 05a0 	addi.l #1440,d4
    2414:	701e           	moveq #30,d0
    2416:	d1ad ff80      	add.l d0,-128(a5)
  for(int i=0;i<8;i++) {
    241a:	0cad 0000 010f 	cmpi.l #271,-128(a5)
    2420:	ff80 
    2422:	6600 ff7e      	bne.w 23a2 <main+0x239c>
    2426:	2646           	movea.l d6,a3
    2428:	0683 0000 2d00 	addi.l #11520,d3
    242e:	2b43 ff80      	move.l d3,-128(a5)
    2432:	263c 0000 0104 	move.l #260,d3
    }
  } 

  for(int i2=0;i2<5;i2++) {  
    TestRow( valsupposed, valactual, mask, 260+i2);
    2438:	2f03           	move.l d3,-(sp)
    243a:	3f02           	move.w d2,-(sp)
    243c:	4267           	clr.w -(sp)
    243e:	2f2d ff80      	move.l -128(a5),-(sp)
    2442:	4879 0000 7ae4 	pea 7ae4 <destlinezoom12>
    2448:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    244a:	7230           	moveq #48,d1
    244c:	d3ad ff80      	add.l d1,-128(a5)
    mask = mask ^ 0xffff;
    2450:	4642           	not.w d2
    2452:	5283           	addq.l #1,d3
  for(int i2=0;i2<5;i2++) {  
    2454:	4fef 0010      	lea 16(sp),sp
    2458:	0c83 0000 0109 	cmpi.l #265,d3
    245e:	66d8           	bne.s 2438 <main+0x2432>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 12);
    2460:	4878 000c      	pea c <main+0x6>
    2464:	2f0b           	move.l a3,-(sp)
    2466:	2f0c           	move.l a4,-(sp)
    2468:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    246e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2474:	4eae ff1c      	jsr -228(a6)
    2478:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    247c:	2c6d ff78      	movea.l -136(a5),a6
  WaitBlit();
    2480:	307c 0001      	movea.w #1,a0
    2484:	2b48 ff80      	move.l a0,-128(a5)
  valsupposed = destlinezoom13;

  mask = 0xffff;
    2488:	7cff           	moveq #-1,d6

  for(int i2=0;i2<11;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    248a:	7400           	moveq #0,d2
    248c:	3406           	move.w d6,d2
    248e:	206d ff80      	movea.l -128(a5),a0
    2492:	4868 ffff      	pea -1(a0)
    2496:	2f02           	move.l d2,-(sp)
    2498:	2f0e           	move.l a6,-(sp)
    249a:	4879 0000 7ab8 	pea 7ab8 <destlinezoom13>
    24a0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    24a2:	2f2d ff80      	move.l -128(a5),-(sp)
    24a6:	2f02           	move.l d2,-(sp)
    24a8:	486e 0030      	pea 48(a6)
    24ac:	4879 0000 7ab8 	pea 7ab8 <destlinezoom13>
    24b2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    24b4:	4646           	not.w d6
    24b6:	54ad ff80      	addq.l #2,-128(a5)
    valactual += ZMLINESIZE/2;
    24ba:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<11;i2++) {
    24be:	4fef 0020      	lea 32(sp),sp
    24c2:	7017           	moveq #23,d0
    24c4:	b0ad ff80      	cmp.l -128(a5),d0
    24c8:	66c0           	bne.s 248a <main+0x2484>
    24ca:	240b           	move.l a3,d2
    24cc:	0682 0000 0514 	addi.l #1300,d2
    24d2:	781b           	moveq #27,d4
    24d4:	2a0b           	move.l a3,d5
    24d6:	2644           	movea.l d4,a3
    24d8:	280c           	move.l a4,d4
    24da:	2c42           	movea.l d2,a6
    24dc:	4dee ff10      	lea -240(a6),a6
    24e0:	260b           	move.l a3,d3
    24e2:	5b83           	subq.l #5,d3
  } 

  for(int i=0;i<8;i++) {
    for(int i2=0;i2<5;i2++) {  
      TestRow( valsupposed, valactual, mask, 22+i2+i*31);
    24e4:	2f03           	move.l d3,-(sp)
    24e6:	3f06           	move.w d6,-(sp)
    24e8:	4267           	clr.w -(sp)
    24ea:	2f0e           	move.l a6,-(sp)
    24ec:	4879 0000 7ab8 	pea 7ab8 <destlinezoom13>
    24f2:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    24f4:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    24f8:	4646           	not.w d6
    24fa:	5283           	addq.l #1,d3
    for(int i2=0;i2<5;i2++) {  
    24fc:	4fef 0010      	lea 16(sp),sp
    2500:	b48e           	cmp.l a6,d2
    2502:	66e0           	bne.s 24e4 <main+0x24de>
    2504:	284b           	movea.l a3,a4
    2506:	2e0e           	move.l a6,d7
    2508:	0687 0000 04e0 	addi.l #1248,d7
    }
    
    for(int i2=0;i2<13;i2++) {
      TestRow( valsupposed, valactual, mask, 27+i*31+i2*2);   
    250e:	7600           	moveq #0,d3
    2510:	3606           	move.w d6,d3
    2512:	2f0c           	move.l a4,-(sp)
    2514:	2f03           	move.l d3,-(sp)
    2516:	2f0e           	move.l a6,-(sp)
    2518:	4879 0000 7ab8 	pea 7ab8 <destlinezoom13>
    251e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 28+i*31+i2*2);
    2520:	486c 0001      	pea 1(a4)
    2524:	2f03           	move.l d3,-(sp)
    2526:	486e 0030      	pea 48(a6)
    252a:	4879 0000 7ab8 	pea 7ab8 <destlinezoom13>
    2530:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2532:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    2536:	4646           	not.w d6
    2538:	548c           	addq.l #2,a4
    for(int i2=0;i2<13;i2++) {
    253a:	4fef 0020      	lea 32(sp),sp
    253e:	be8e           	cmp.l a6,d7
    2540:	66cc           	bne.s 250e <main+0x2508>
    2542:	0682 0000 05d0 	addi.l #1488,d2
    2548:	47eb 001f      	lea 31(a3),a3
  for(int i=0;i<8;i++) {
    254c:	b6fc 0113      	cmpa.w #275,a3
    2550:	6688           	bne.s 24da <main+0x24d4>
    2552:	2844           	movea.l d4,a4

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 13);
    2554:	4878 000d      	pea d <main+0x7>
    2558:	2f04           	move.l d4,-(sp)
    255a:	2f05           	move.l d5,-(sp)
    255c:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    2562:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2568:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom14;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);   
    256c:	42a7           	clr.l -(sp)
    256e:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2574:	2f2d ff7c      	move.l -132(a5),-(sp)
    2578:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    257e:	4e92           	jsr (a2)
    2580:	4fef 001c      	lea 28(sp),sp
    2584:	262d ff70      	move.l -144(a5),d3
  valactual += ZMLINESIZE/2; 
    2588:	2c6d ff84      	movea.l -124(a5),a6
  TestRow( valsupposed, valactual, mask, 0);   
    258c:	7401           	moveq #1,d2
  mask = mask ^ 0xffff; 
    258e:	4247           	clr.w d7
    2590:	2805           	move.l d5,d4
    2592:	264e           	movea.l a6,a3
    2594:	2c42           	movea.l d2,a6

  for(int i2=0;i2<9;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2596:	7400           	moveq #0,d2
    2598:	3407           	move.w d7,d2
    259a:	2f0e           	move.l a6,-(sp)
    259c:	2f02           	move.l d2,-(sp)
    259e:	2f0b           	move.l a3,-(sp)
    25a0:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    25a6:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    25a8:	486e 0001      	pea 1(a6)
    25ac:	2f02           	move.l d2,-(sp)
    25ae:	486b 0030      	pea 48(a3)
    25b2:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    25b8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    25ba:	4647           	not.w d7
    25bc:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    25be:	4fef 0020      	lea 32(sp),sp
    25c2:	7213           	moveq #19,d1
    25c4:	b28e           	cmp.l a6,d1
    25c6:	673e           	beq.s 2606 <main+0x2600>
    25c8:	200b           	move.l a3,d0
    25ca:	0680 0000 00c0 	addi.l #192,d0
    25d0:	2643           	movea.l d3,a3
    25d2:	2600           	move.l d0,d3
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    25d4:	7400           	moveq #0,d2
    25d6:	3407           	move.w d7,d2
    25d8:	2f0e           	move.l a6,-(sp)
    25da:	2f02           	move.l d2,-(sp)
    25dc:	2f0b           	move.l a3,-(sp)
    25de:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    25e4:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    25e6:	486e 0001      	pea 1(a6)
    25ea:	2f02           	move.l d2,-(sp)
    25ec:	486b 0030      	pea 48(a3)
    25f0:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    25f6:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    25f8:	4647           	not.w d7
    25fa:	548e           	addq.l #2,a6
  for(int i2=0;i2<9;i2++) {
    25fc:	4fef 0020      	lea 32(sp),sp
    2600:	7213           	moveq #19,d1
    2602:	b28e           	cmp.l a6,d1
    2604:	66c2           	bne.s 25c8 <main+0x25c2>
    2606:	2644           	movea.l d4,a3
    2608:	240e           	move.l a6,d2
    260a:	2803           	move.l d3,d4
    260c:	0684 0000 00c0 	addi.l #192,d4
    2612:	2c0b           	move.l a3,d6
    2614:	2b6d ff80 ff88 	move.l -128(a5),-120(a5)
    261a:	2c44           	movea.l d4,a6
    261c:	4dee ff40      	lea -192(a6),a6
    2620:	2a2d ff88      	move.l -120(a5),d5
    2624:	5985           	subq.l #4,d5
  } 

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<4;i2++) {  
      TestRow( valsupposed, valactual, mask, 19+i2+i*32);
    2626:	2f05           	move.l d5,-(sp)
    2628:	3f07           	move.w d7,-(sp)
    262a:	4267           	clr.w -(sp)
    262c:	2f0e           	move.l a6,-(sp)
    262e:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    2634:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2636:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    263a:	4647           	not.w d7
    263c:	5285           	addq.l #1,d5
    for(int i2=0;i2<4;i2++) {  
    263e:	4fef 0010      	lea 16(sp),sp
    2642:	b88e           	cmp.l a6,d4
    2644:	66e0           	bne.s 2626 <main+0x2620>
    2646:	266d ff88      	movea.l -120(a5),a3
    264a:	41ee 0540      	lea 1344(a6),a0
    264e:	2b48 ff80      	move.l a0,-128(a5)
    }
    
    for(int i2=0;i2<14;i2++) {
      TestRow( valsupposed, valactual, mask, 23+i*32+i2*2);   
    2652:	7a00           	moveq #0,d5
    2654:	3a07           	move.w d7,d5
    2656:	2f0b           	move.l a3,-(sp)
    2658:	2f05           	move.l d5,-(sp)
    265a:	2f0e           	move.l a6,-(sp)
    265c:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    2662:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 24+i*32+i2*2);
    2664:	486b 0001      	pea 1(a3)
    2668:	2f05           	move.l d5,-(sp)
    266a:	486e 0030      	pea 48(a6)
    266e:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    2674:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2676:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    267a:	4647           	not.w d7
    267c:	548b           	addq.l #2,a3
    for(int i2=0;i2<14;i2++) {
    267e:	4fef 0020      	lea 32(sp),sp
    2682:	bded ff80      	cmpa.l -128(a5),a6
    2686:	66ca           	bne.s 2652 <main+0x264c>
    2688:	0684 0000 0600 	addi.l #1536,d4
    268e:	7020           	moveq #32,d0
    2690:	d1ad ff88      	add.l d0,-120(a5)
  for(int i=0;i<7;i++) {
    2694:	0cad 0000 00f7 	cmpi.l #247,-120(a5)
    269a:	ff88 
    269c:	6600 ff7c      	bne.w 261a <main+0x2614>
    26a0:	2646           	movea.l d6,a3
    26a2:	2c43           	movea.l d3,a6
    26a4:	4dee 2a00      	lea 10752(a6),a6
    26a8:	2b7c 0000 00f3 	move.l #243,-128(a5)
    26ae:	ff80 
    }
  }

  for(int i2=0;i2<4;i2++) {  
    TestRow( valsupposed, valactual, mask, 243+i2);
    26b0:	2f2d ff80      	move.l -128(a5),-(sp)
    26b4:	3f07           	move.w d7,-(sp)
    26b6:	4267           	clr.w -(sp)
    26b8:	2f0e           	move.l a6,-(sp)
    26ba:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    26c0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    26c2:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    26c6:	4647           	not.w d7
    26c8:	52ad ff80      	addq.l #1,-128(a5)
  for(int i2=0;i2<4;i2++) {  
    26cc:	4fef 0010      	lea 16(sp),sp
    26d0:	0cad 0000 00f7 	cmpi.l #247,-128(a5)
    26d6:	ff80 
    26d8:	66d6           	bne.s 26b0 <main+0x26aa>
    26da:	0683 0000 2ac0 	addi.l #10944,d3
    26e0:	2c6d ff80      	movea.l -128(a5),a6
    26e4:	280b           	move.l a3,d4
    26e6:	2643           	movea.l d3,a3
  }

  for(int i2=0;i2<12;i2++) {
    TestRow( valsupposed, valactual, mask, 247+i2*2);   
    26e8:	7600           	moveq #0,d3
    26ea:	3607           	move.w d7,d3
    26ec:	2f0e           	move.l a6,-(sp)
    26ee:	2f03           	move.l d3,-(sp)
    26f0:	2f0b           	move.l a3,-(sp)
    26f2:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    26f8:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 248+i2*2);
    26fa:	486e 0001      	pea 1(a6)
    26fe:	2f03           	move.l d3,-(sp)
    2700:	486b 0030      	pea 48(a3)
    2704:	4879 0000 7a8c 	pea 7a8c <destlinezoom14>
    270a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    270c:	4647           	not.w d7
    270e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2710:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<12;i2++) {
    2714:	4fef 0020      	lea 32(sp),sp
    2718:	bcfc 010f      	cmpa.w #271,a6
    271c:	66ca           	bne.s 26e8 <main+0x26e2>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 14);
    271e:	4878 000e      	pea e <main+0x8>
    2722:	2f04           	move.l d4,-(sp)
    2724:	2f0c           	move.l a4,-(sp)
    2726:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    272c:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2732:	4eae ff1c      	jsr -228(a6)
    2736:	4fef 000c      	lea 12(sp),sp
  valactual = destination+2; 
    273a:	262d ff78      	move.l -136(a5),d3
  WaitBlit();
    273e:	3c7c 0001      	movea.w #1,a6
  valsupposed = destlinezoom15;

  mask = 0x0000;
    2742:	4246           	clr.w d6
    2744:	2643           	movea.l d3,a3

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    2746:	7600           	moveq #0,d3
    2748:	3606           	move.w d6,d3
    274a:	486e ffff      	pea -1(a6)
    274e:	2f03           	move.l d3,-(sp)
    2750:	2f0b           	move.l a3,-(sp)
    2752:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    2758:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    275a:	2f0e           	move.l a6,-(sp)
    275c:	2f03           	move.l d3,-(sp)
    275e:	486b 0030      	pea 48(a3)
    2762:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    2768:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    276a:	4646           	not.w d6
    276c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    276e:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<8;i2++) {
    2772:	4fef 0020      	lea 32(sp),sp
    2776:	7211           	moveq #17,d1
    2778:	b28e           	cmp.l a6,d1
    277a:	66ca           	bne.s 2746 <main+0x2740>
    277c:	262d ff94      	move.l -108(a5),d3
    2780:	2a04           	move.l d4,d5
    2782:	2642           	movea.l d2,a3
    2784:	2c43           	movea.l d3,a6
    2786:	4dee ff70      	lea -144(a6),a6
    278a:	240b           	move.l a3,d2
    278c:	5782           	subq.l #3,d2
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<3;i2++) {  
      TestRow( valsupposed, valactual, mask, 16+i2+i*33);
    278e:	2f02           	move.l d2,-(sp)
    2790:	3f06           	move.w d6,-(sp)
    2792:	4267           	clr.w -(sp)
    2794:	2f0e           	move.l a6,-(sp)
    2796:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    279c:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    279e:	4dee 0030      	lea 48(a6),a6
      mask = mask ^ 0xffff;
    27a2:	4646           	not.w d6
    27a4:	5282           	addq.l #1,d2
    for(int i2=0;i2<3;i2++) {  
    27a6:	4fef 0010      	lea 16(sp),sp
    27aa:	b68e           	cmp.l a6,d3
    27ac:	66e0           	bne.s 278e <main+0x2788>
    27ae:	240b           	move.l a3,d2
    27b0:	2e0e           	move.l a6,d7
    27b2:	0687 0000 05a0 	addi.l #1440,d7
    }
    
    for(int i2=0;i2<15;i2++) {
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);   
    27b8:	7800           	moveq #0,d4
    27ba:	3806           	move.w d6,d4
    27bc:	2f02           	move.l d2,-(sp)
    27be:	2f04           	move.l d4,-(sp)
    27c0:	2f0e           	move.l a6,-(sp)
    27c2:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    27c8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 19+i*33+i2*2);
    27ca:	2f02           	move.l d2,-(sp)
    27cc:	2f04           	move.l d4,-(sp)
    27ce:	486e 0030      	pea 48(a6)
    27d2:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    27d8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    27da:	4dee 0060      	lea 96(a6),a6
      mask = mask ^ 0xffff;
    27de:	4646           	not.w d6
    27e0:	5482           	addq.l #2,d2
    for(int i2=0;i2<15;i2++) {
    27e2:	4fef 0020      	lea 32(sp),sp
    27e6:	be8e           	cmp.l a6,d7
    27e8:	66ce           	bne.s 27b8 <main+0x27b2>
    27ea:	0683 0000 0630 	addi.l #1584,d3
    27f0:	47eb 0021      	lea 33(a3),a3
  for(int i=0;i<7;i++) {
    27f4:	b6fc 00fa      	cmpa.w #250,a3
    27f8:	668a           	bne.s 2784 <main+0x277e>
    27fa:	2645           	movea.l d5,a3
    27fc:	4deb 2e54      	lea 11860(a3),a6
    }
  }

  for(int i2=0;i2<3;i2++) {  
    TestRow( valsupposed, valactual, mask, 247+i2);
    2800:	2f2d ff80      	move.l -128(a5),-(sp)
    2804:	3f06           	move.w d6,-(sp)
    2806:	4267           	clr.w -(sp)
    2808:	2f0e           	move.l a6,-(sp)
    280a:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    2810:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2812:	4dee 0030      	lea 48(a6),a6
    mask = mask ^ 0xffff;
    2816:	4646           	not.w d6
    2818:	52ad ff80      	addq.l #1,-128(a5)
  for(int i2=0;i2<3;i2++) {  
    281c:	4fef 0010      	lea 16(sp),sp
    2820:	0cad 0000 00fa 	cmpi.l #250,-128(a5)
    2826:	ff80 
    2828:	66d6           	bne.s 2800 <main+0x27fa>
    282a:	2c6d ff6c      	movea.l -148(a5),a6
  }

  for(int i2=0;i2<10;i2++) {
    TestRow( valsupposed, valactual, mask, 250+i2*2);   
    282e:	7400           	moveq #0,d2
    2830:	3406           	move.w d6,d2
    2832:	2f2d ff80      	move.l -128(a5),-(sp)
    2836:	2f02           	move.l d2,-(sp)
    2838:	2f0e           	move.l a6,-(sp)
    283a:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    2840:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 251+i2*2);
    2842:	206d ff80      	movea.l -128(a5),a0
    2846:	4868 0001      	pea 1(a0)
    284a:	2f02           	move.l d2,-(sp)
    284c:	486e 0030      	pea 48(a6)
    2850:	4879 0000 7a60 	pea 7a60 <destlinezoom15>
    2856:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2858:	4646           	not.w d6
    285a:	54ad ff80      	addq.l #2,-128(a5)
    valactual += ZMLINESIZE/2;
    285e:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<10;i2++) {
    2862:	4fef 0020      	lea 32(sp),sp
    2866:	0cad 0000 010e 	cmpi.l #270,-128(a5)
    286c:	ff80 
    286e:	66be           	bne.s 282e <main+0x2828>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 15);
    2870:	4878 000f      	pea f <main+0x9>
    2874:	2f0c           	move.l a4,-(sp)
    2876:	2f0b           	move.l a3,-(sp)
    2878:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    287e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2884:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom16;

  mask = 0x0000;

  TestRow( valsupposed, valactual, mask, 0);   
    2888:	42a7           	clr.l -(sp)
    288a:	42a7           	clr.l -(sp)
    288c:	2f2d ff7c      	move.l -132(a5),-(sp)
    2890:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2896:	4e92           	jsr (a2)
    2898:	4fef 001c      	lea 28(sp),sp
    289c:	2b6d ff70 ff80 	move.l -144(a5),-128(a5)
  valactual += ZMLINESIZE/2;
    28a2:	242d ff84      	move.l -124(a5),d2
  TestRow( valsupposed, valactual, mask, 0);   
    28a6:	9dce           	suba.l a6,a6
  mask = mask ^ 0xffff;
    28a8:	7eff           	moveq #-1,d7
  for(int i2=0;i2<6;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    28aa:	7600           	moveq #0,d3
    28ac:	3607           	move.w d7,d3
    28ae:	2f0e           	move.l a6,-(sp)
    28b0:	2f03           	move.l d3,-(sp)
    28b2:	2f02           	move.l d2,-(sp)
    28b4:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    28ba:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    28bc:	486e 0001      	pea 1(a6)
    28c0:	2f03           	move.l d3,-(sp)
    28c2:	2042           	movea.l d2,a0
    28c4:	4868 0030      	pea 48(a0)
    28c8:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    28ce:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    28d0:	4647           	not.w d7
    28d2:	548e           	addq.l #2,a6
  for(int i2=0;i2<6;i2++) {
    28d4:	4fef 0020      	lea 32(sp),sp
    28d8:	700c           	moveq #12,d0
    28da:	b08e           	cmp.l a6,d0
    28dc:	6744           	beq.s 2922 <main+0x291c>
    28de:	2002           	move.l d2,d0
    28e0:	0680 0000 00c0 	addi.l #192,d0
    28e6:	242d ff80      	move.l -128(a5),d2
    28ea:	2b40 ff80      	move.l d0,-128(a5)
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    28ee:	7600           	moveq #0,d3
    28f0:	3607           	move.w d7,d3
    28f2:	2f0e           	move.l a6,-(sp)
    28f4:	2f03           	move.l d3,-(sp)
    28f6:	2f02           	move.l d2,-(sp)
    28f8:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    28fe:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    2900:	486e 0001      	pea 1(a6)
    2904:	2f03           	move.l d3,-(sp)
    2906:	2042           	movea.l d2,a0
    2908:	4868 0030      	pea 48(a0)
    290c:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2912:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2914:	4647           	not.w d7
    2916:	548e           	addq.l #2,a6
  for(int i2=0;i2<6;i2++) {
    2918:	4fef 0020      	lea 32(sp),sp
    291c:	700c           	moveq #12,d0
    291e:	b08e           	cmp.l a6,d0
    2920:	66bc           	bne.s 28de <main+0x28d8>
    2922:	262d ff80      	move.l -128(a5),d3
    2926:	3c7c 000d      	movea.w #13,a6
    292a:	2b4c ff6c      	move.l a4,-148(a5)
    292e:	2c0b           	move.l a3,d6
    2930:	2643           	movea.l d3,a3
    2932:	3a07           	move.w d7,d5
    2934:	2e03           	move.l d3,d7
  }

  for(int i=0;i<7;i++) {
    for(int i2=0;i2<2;i2++) {  
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2936:	2f0e           	move.l a6,-(sp)
    2938:	7400           	moveq #0,d2
    293a:	3405           	move.w d5,d2
    293c:	2f02           	move.l d2,-(sp)
    293e:	2f0b           	move.l a3,-(sp)
    2940:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2946:	4e92           	jsr (a2)
    2948:	486e 0001      	pea 1(a6)
      valactual += ZMLINESIZE/2;
      mask = mask ^ 0xffff;
    294c:	3605           	move.w d5,d3
    294e:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 13+i2+i*34);
    2950:	3f03           	move.w d3,-(sp)
    2952:	4267           	clr.w -(sp)
    2954:	486b 0030      	pea 48(a3)
    2958:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    295e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2960:	49eb 0060      	lea 96(a3),a4
      mask = mask ^ 0xffff;
    2964:	41ee 0003      	lea 3(a6),a0
    2968:	2b48 ff80      	move.l a0,-128(a5)
    296c:	4fef 0020      	lea 32(sp),sp
    2970:	47eb 0660      	lea 1632(a3),a3
    2974:	280b           	move.l a3,d4
    }
    
    for(int i2=0;i2<16;i2++) {
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    2976:	2f2d ff80      	move.l -128(a5),-(sp)
    297a:	2f02           	move.l d2,-(sp)
    297c:	2f0c           	move.l a4,-(sp)
    297e:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2984:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    2986:	206d ff80      	movea.l -128(a5),a0
    298a:	4868 0001      	pea 1(a0)
    298e:	2f02           	move.l d2,-(sp)
    2990:	486c 0030      	pea 48(a4)
    2994:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    299a:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    299c:	49ec 0060      	lea 96(a4),a4
      mask = mask ^ 0xffff;
    29a0:	3a03           	move.w d3,d5
    29a2:	54ad ff80      	addq.l #2,-128(a5)
    for(int i2=0;i2<16;i2++) {
    29a6:	4fef 0020      	lea 32(sp),sp
    29aa:	b9c4           	cmpa.l d4,a4
    29ac:	673e           	beq.s 29ec <main+0x29e6>
    29ae:	7400           	moveq #0,d2
    29b0:	3403           	move.w d3,d2
    29b2:	4643           	not.w d3
      TestRow( valsupposed, valactual, mask, 16+i*34+i2*2);   
    29b4:	2f2d ff80      	move.l -128(a5),-(sp)
    29b8:	2f02           	move.l d2,-(sp)
    29ba:	2f0c           	move.l a4,-(sp)
    29bc:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    29c2:	4e92           	jsr (a2)
      TestRow( valsupposed, valactual, mask, 17+i*34+i2*2);
    29c4:	206d ff80      	movea.l -128(a5),a0
    29c8:	4868 0001      	pea 1(a0)
    29cc:	2f02           	move.l d2,-(sp)
    29ce:	486c 0030      	pea 48(a4)
    29d2:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    29d8:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    29da:	49ec 0060      	lea 96(a4),a4
      mask = mask ^ 0xffff;
    29de:	3a03           	move.w d3,d5
    29e0:	54ad ff80      	addq.l #2,-128(a5)
    for(int i2=0;i2<16;i2++) {
    29e4:	4fef 0020      	lea 32(sp),sp
    29e8:	b9c4           	cmpa.l d4,a4
    29ea:	66c2           	bne.s 29ae <main+0x29a8>
    29ec:	4dee 0022      	lea 34(a6),a6
  for(int i=0;i<7;i++) {
    29f0:	bcfc 00fb      	cmpa.w #251,a6
    29f4:	6600 ff40      	bne.w 2936 <main+0x2930>
    29f8:	286d ff6c      	movea.l -148(a5),a4
    29fc:	2646           	movea.l d6,a3
    29fe:	2b47 ff80      	move.l d7,-128(a5)
    2a02:	3e03           	move.w d3,d7
    }
  }

  for(int i2=0;i2<2;i2++) {
    TestRow( valsupposed, valactual, mask, 251+i2);
    2a04:	2f0e           	move.l a6,-(sp)
    2a06:	7600           	moveq #0,d3
    2a08:	3605           	move.w d5,d3
    2a0a:	2f03           	move.l d3,-(sp)
    2a0c:	206d ff80      	movea.l -128(a5),a0
    2a10:	4868 2ca0      	pea 11424(a0)
    2a14:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2a1a:	4e92           	jsr (a2)
    2a1c:	4878 00fc      	pea fc <main+0xf6>
    2a20:	2f02           	move.l d2,-(sp)
    2a22:	206d ff80      	movea.l -128(a5),a0
    2a26:	4868 2cd0      	pea 11472(a0)
    2a2a:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2a30:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    2a32:	206d ff80      	movea.l -128(a5),a0
    2a36:	41e8 2d00      	lea 11520(a0),a0
    2a3a:	2b48 ff6c      	move.l a0,-148(a5)
    2a3e:	4fef 0020      	lea 32(sp),sp
    2a42:	3c7c 00fd      	movea.w #253,a6
    mask = mask ^ 0xffff;
  }

  for(int i2=0;i2<8;i2++) {
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    2a46:	2f0e           	move.l a6,-(sp)
    2a48:	2f03           	move.l d3,-(sp)
    2a4a:	2f2d ff6c      	move.l -148(a5),-(sp)
    2a4e:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2a54:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    2a56:	486e 0001      	pea 1(a6)
    2a5a:	2f03           	move.l d3,-(sp)
    2a5c:	206d ff6c      	movea.l -148(a5),a0
    2a60:	4868 0030      	pea 48(a0)
    2a64:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2a6a:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2a6c:	4647           	not.w d7
    2a6e:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2a70:	7060           	moveq #96,d0
    2a72:	d1ad ff6c      	add.l d0,-148(a5)
  for(int i2=0;i2<8;i2++) {
    2a76:	4fef 0020      	lea 32(sp),sp
    2a7a:	bcfc 010d      	cmpa.w #269,a6
    2a7e:	673e           	beq.s 2abe <main+0x2ab8>
    2a80:	7600           	moveq #0,d3
    2a82:	3607           	move.w d7,d3
    TestRow( valsupposed, valactual, mask, 253+i2*2);   
    2a84:	2f0e           	move.l a6,-(sp)
    2a86:	2f03           	move.l d3,-(sp)
    2a88:	2f2d ff6c      	move.l -148(a5),-(sp)
    2a8c:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2a92:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 254+i2*2);
    2a94:	486e 0001      	pea 1(a6)
    2a98:	2f03           	move.l d3,-(sp)
    2a9a:	206d ff6c      	movea.l -148(a5),a0
    2a9e:	4868 0030      	pea 48(a0)
    2aa2:	4879 0000 7a34 	pea 7a34 <destlinezoom16>
    2aa8:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2aaa:	4647           	not.w d7
    2aac:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2aae:	7060           	moveq #96,d0
    2ab0:	d1ad ff6c      	add.l d0,-148(a5)
  for(int i2=0;i2<8;i2++) {
    2ab4:	4fef 0020      	lea 32(sp),sp
    2ab8:	bcfc 010d      	cmpa.w #269,a6
    2abc:	66c2           	bne.s 2a80 <main+0x2a7a>

  tmp = source;
  source = destination;
  destination = tmp;

  Zoom_ZoomIntoPicture( source, destination, 16);
    2abe:	4878 0010      	pea 10 <main+0xa>
    2ac2:	2f0b           	move.l a3,-(sp)
    2ac4:	2f0c           	move.l a4,-(sp)
    2ac6:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    2acc:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2ad2:	4eae ff1c      	jsr -228(a6)
    2ad6:	4fef 000c      	lea 12(sp),sp
    2ada:	307c 0001      	movea.w #1,a0
    2ade:	2b48 ff6c      	move.l a0,-148(a5)
  valactual = destination+2; 
  valsupposed = destlinezoom17;

  mask = 0xffff;
    2ae2:	7eff           	moveq #-1,d7
    2ae4:	2c6d ff78      	movea.l -136(a5),a6

  for(int i2=0;i2<5;i2++) {
    TestRow( valsupposed, valactual, mask, 0+i2*2);   
    2ae8:	7400           	moveq #0,d2
    2aea:	3407           	move.w d7,d2
    2aec:	206d ff6c      	movea.l -148(a5),a0
    2af0:	4868 ffff      	pea -1(a0)
    2af4:	2f02           	move.l d2,-(sp)
    2af6:	2f0e           	move.l a6,-(sp)
    2af8:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2afe:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 1+i2*2);
    2b00:	2f2d ff6c      	move.l -148(a5),-(sp)
    2b04:	2f02           	move.l d2,-(sp)
    2b06:	486e 0030      	pea 48(a6)
    2b0a:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2b10:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2b12:	4647           	not.w d7
    2b14:	54ad ff6c      	addq.l #2,-148(a5)
    valactual += ZMLINESIZE/2;
    2b18:	4dee 0060      	lea 96(a6),a6
  for(int i2=0;i2<5;i2++) {
    2b1c:	4fef 0020      	lea 32(sp),sp
    2b20:	700b           	moveq #11,d0
    2b22:	b0ad ff6c      	cmp.l -148(a5),d0
    2b26:	66c0           	bne.s 2ae8 <main+0x2ae2>
    2b28:	2a0b           	move.l a3,d5
    2b2a:	0685 0000 01e4 	addi.l #484,d5
    2b30:	3c7c 000a      	movea.w #10,a6
    2b34:	2c0b           	move.l a3,d6
    2b36:	2005           	move.l d5,d0
    2b38:	2a0c           	move.l a4,d5
    2b3a:	2b6d ff6c ff78 	move.l -148(a5),-136(a5)
    2b40:	2840           	movea.l d0,a4
  }

  for(int i=0;i<7;i++) {
      TestRow( valsupposed, valactual, mask, 10+i*35);
    2b42:	2f0e           	move.l a6,-(sp)
    2b44:	3f07           	move.w d7,-(sp)
    2b46:	4267           	clr.w -(sp)
    2b48:	2f0c           	move.l a4,-(sp)
    2b4a:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2b50:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2b52:	47ec 0030      	lea 48(a4),a3
      mask = mask ^ 0xffff;
    2b56:	3807           	move.w d7,d4
    2b58:	4644           	not.w d4
    
    for(int i2=0;i2<17;i2++) {
    2b5a:	41ee 0001      	lea 1(a6),a0
    2b5e:	2b48 ff6c      	move.l a0,-148(a5)
    2b62:	4fef 0010      	lea 16(sp),sp
    2b66:	49ec 0690      	lea 1680(a4),a4
    2b6a:	260c           	move.l a4,d3
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    2b6c:	7400           	moveq #0,d2
    2b6e:	3404           	move.w d4,d2
    2b70:	2f2d ff6c      	move.l -148(a5),-(sp)
    2b74:	2f02           	move.l d2,-(sp)
    2b76:	2f0b           	move.l a3,-(sp)
    2b78:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2b7e:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    2b80:	206d ff6c      	movea.l -148(a5),a0
    2b84:	4868 0001      	pea 1(a0)
    2b88:	2f02           	move.l d2,-(sp)
    2b8a:	486b 0030      	pea 48(a3)
    2b8e:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2b94:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2b96:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    2b9a:	4644           	not.w d4
    2b9c:	3e04           	move.w d4,d7
    2b9e:	54ad ff6c      	addq.l #2,-148(a5)
    for(int i2=0;i2<17;i2++) {
    2ba2:	4fef 0020      	lea 32(sp),sp
    2ba6:	b7c3           	cmpa.l d3,a3
    2ba8:	66c2           	bne.s 2b6c <main+0x2b66>
    2baa:	4dee 0023      	lea 35(a6),a6
  for(int i=0;i<7;i++) {
    2bae:	bcfc 00ff      	cmpa.w #255,a6
    2bb2:	668e           	bne.s 2b42 <main+0x2b3c>
    2bb4:	2845           	movea.l d5,a4
    2bb6:	2646           	movea.l d6,a3
    2bb8:	2b6d ff78 ff6c 	move.l -136(a5),-148(a5)
    }
  } 

  TestRow( valsupposed, valactual, mask, 255);
    2bbe:	2f0e           	move.l a6,-(sp)
    2bc0:	3f04           	move.w d4,-(sp)
    2bc2:	4267           	clr.w -(sp)
    2bc4:	486b 2fd4      	pea 12244(a3)
    2bc8:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2bce:	4e92           	jsr (a2)
  valactual += ZMLINESIZE/2;
    2bd0:	2606           	move.l d6,d3
    2bd2:	0683 0000 3004 	addi.l #12292,d3
    2bd8:	4fef 0010      	lea 16(sp),sp
    2bdc:	3c7c 0100      	movea.w #256,a6
    2be0:	2003           	move.l d3,d0
    2be2:	2606           	move.l d6,d3
    2be4:	2640           	movea.l d0,a3
  mask = mask ^ 0xffff;

  for(int i2=0;i2<7;i2++) {
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2be6:	2f0e           	move.l a6,-(sp)
    2be8:	2f02           	move.l d2,-(sp)
    2bea:	2f0b           	move.l a3,-(sp)
    2bec:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2bf2:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2bf4:	486e 0001      	pea 1(a6)
    2bf8:	2f02           	move.l d2,-(sp)
    2bfa:	486b 0030      	pea 48(a3)
    2bfe:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2c04:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2c06:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2c08:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<7;i2++) {
    2c0c:	4fef 0020      	lea 32(sp),sp
    2c10:	bcfc 010e      	cmpa.w #270,a6
    2c14:	6736           	beq.s 2c4c <main+0x2c46>
    2c16:	7400           	moveq #0,d2
    2c18:	3404           	move.w d4,d2
    2c1a:	4644           	not.w d4
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2c1c:	2f0e           	move.l a6,-(sp)
    2c1e:	2f02           	move.l d2,-(sp)
    2c20:	2f0b           	move.l a3,-(sp)
    2c22:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2c28:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2c2a:	486e 0001      	pea 1(a6)
    2c2e:	2f02           	move.l d2,-(sp)
    2c30:	486b 0030      	pea 48(a3)
    2c34:	4879 0000 7a08 	pea 7a08 <destlinezoom17>
    2c3a:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2c3c:	548e           	addq.l #2,a6
    valactual += ZMLINESIZE/2;
    2c3e:	47eb 0060      	lea 96(a3),a3
  for(int i2=0;i2<7;i2++) {
    2c42:	4fef 0020      	lea 32(sp),sp
    2c46:	bcfc 010e      	cmpa.w #270,a6
    2c4a:	66ca           	bne.s 2c16 <main+0x2c10>
  tmp = source;
  source = destination;
  destination = tmp;

  UWORD *bp = (UWORD *)0x200;
  *bp = 0;
    2c4c:	4278 0200      	clr.w 200 <main+0x1fa>
  Zoom_ZoomIntoPicture( source, destination, 17);
    2c50:	4878 0011      	pea 11 <main+0xb>
    2c54:	2f0c           	move.l a4,-(sp)
    2c56:	2f03           	move.l d3,-(sp)
    2c58:	4eb9 0000 3cde 	jsr 3cde <Zoom_ZoomIntoPicture>
  WaitBlit();
    2c5e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2c64:	4eae ff1c      	jsr -228(a6)
  valactual = destination+2; 
  valsupposed = destlinezoom18;

  mask = 0xffff;

  TestRow( valsupposed, valactual, mask, 0);
    2c68:	42a7           	clr.l -(sp)
    2c6a:	2f3c 0000 ffff 	move.l #65535,-(sp)
    2c70:	2f2d ff7c      	move.l -132(a5),-(sp)
    2c74:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2c7a:	4e92           	jsr (a2)
    2c7c:	4fef 001c      	lea 28(sp),sp
    2c80:	367c 0001      	movea.w #1,a3
  valactual += ZMLINESIZE/2;
  mask = mask ^ 0xffff;
    2c84:	4242           	clr.w d2
    2c86:	286d ff84      	movea.l -124(a5),a4
    2c8a:	282d ff70      	move.l -144(a5),d4

  for(int i2=0;i2<4;i2++) {
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2c8e:	7600           	moveq #0,d3
    2c90:	3602           	move.w d2,d3
    2c92:	2f0b           	move.l a3,-(sp)
    2c94:	2f03           	move.l d3,-(sp)
    2c96:	2f0c           	move.l a4,-(sp)
    2c98:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2c9e:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2ca0:	486b 0001      	pea 1(a3)
    2ca4:	2f03           	move.l d3,-(sp)
    2ca6:	486c 0030      	pea 48(a4)
    2caa:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2cb0:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2cb2:	4642           	not.w d2
    2cb4:	548b           	addq.l #2,a3
  for(int i2=0;i2<4;i2++) {
    2cb6:	4fef 0020      	lea 32(sp),sp
    2cba:	7009           	moveq #9,d0
    2cbc:	b08b           	cmp.l a3,d0
    2cbe:	673e           	beq.s 2cfe <main+0x2cf8>
    2cc0:	200c           	move.l a4,d0
    2cc2:	0680 0000 00c0 	addi.l #192,d0
    2cc8:	2844           	movea.l d4,a4
    2cca:	2800           	move.l d0,d4
    TestRow( valsupposed, valactual, mask, 1+i2*2);   
    2ccc:	7600           	moveq #0,d3
    2cce:	3602           	move.w d2,d3
    2cd0:	2f0b           	move.l a3,-(sp)
    2cd2:	2f03           	move.l d3,-(sp)
    2cd4:	2f0c           	move.l a4,-(sp)
    2cd6:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2cdc:	4e92           	jsr (a2)
    TestRow( valsupposed, valactual, mask, 2+i2*2);
    2cde:	486b 0001      	pea 1(a3)
    2ce2:	2f03           	move.l d3,-(sp)
    2ce4:	486c 0030      	pea 48(a4)
    2ce8:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2cee:	4e92           	jsr (a2)
    mask = mask ^ 0xffff;
    2cf0:	4642           	not.w d2
    2cf2:	548b           	addq.l #2,a3
  for(int i2=0;i2<4;i2++) {
    2cf4:	4fef 0020      	lea 32(sp),sp
    2cf8:	7009           	moveq #9,d0
    2cfa:	b08b           	cmp.l a3,d0
    2cfc:	66c2           	bne.s 2cc0 <main+0x2cba>
    2cfe:	2b44 ff70      	move.l d4,-144(a5)
    2d02:	2644           	movea.l d4,a3
    2d04:	286d ff6c      	movea.l -148(a5),a4
    2d08:	280b           	move.l a3,d4
    2d0a:	0684 0000 06c0 	addi.l #1728,d4
  }

  for(int i=0;i<7;i++) {  
    for(int i2=0;i2<18;i2++) {
      TestRow( valsupposed, valactual, mask, 11+i*35+i2*2);   
    2d10:	7600           	moveq #0,d3
    2d12:	3602           	move.w d2,d3
    2d14:	2f0c           	move.l a4,-(sp)
    2d16:	2f03           	move.l d3,-(sp)
    2d18:	2f0b           	move.l a3,-(sp)
    2d1a:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2d20:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
      TestRow( valsupposed, valactual, mask, 12+i*35+i2*2);
    2d22:	486c 0001      	pea 1(a4)
    2d26:	2f03           	move.l d3,-(sp)
    2d28:	486b 0030      	pea 48(a3)
    2d2c:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2d32:	4e92           	jsr (a2)
      valactual += ZMLINESIZE/2;
    2d34:	47eb 0060      	lea 96(a3),a3
      mask = mask ^ 0xffff;
    2d38:	4642           	not.w d2
    2d3a:	548c           	addq.l #2,a4
    for(int i2=0;i2<18;i2++) {
    2d3c:	4fef 0020      	lea 32(sp),sp
    2d40:	b88b           	cmp.l a3,d4
    2d42:	66cc           	bne.s 2d10 <main+0x2d0a>
    2d44:	7223           	moveq #35,d1
    2d46:	d3ad ff6c      	add.l d1,-148(a5)
  for(int i=0;i<7;i++) {  
    2d4a:	0cad 0000 0100 	cmpi.l #256,-148(a5)
    2d50:	ff6c 
    2d52:	66b0           	bne.s 2d04 <main+0x2cfe>
    2d54:	286d ff70      	movea.l -144(a5),a4
    2d58:	49ec 2f40      	lea 12096(a4),a4
    2d5c:	367c 0101      	movea.w #257,a3
    }
  } 

  for(int i2=0;i2<4;i2++) {
    TestRow( valsupposed, valactual, mask, 256+i2*2);   
    2d60:	7600           	moveq #0,d3
    2d62:	3602           	move.w d2,d3
    2d64:	486b ffff      	pea -1(a3)
    2d68:	2f03           	move.l d3,-(sp)
    2d6a:	2f0c           	move.l a4,-(sp)
    2d6c:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2d72:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    TestRow( valsupposed, valactual, mask, 257+i2*2);
    2d74:	2f0b           	move.l a3,-(sp)
    2d76:	2f03           	move.l d3,-(sp)
    2d78:	486c 0030      	pea 48(a4)
    2d7c:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2d82:	4e92           	jsr (a2)
    valactual += ZMLINESIZE/2;
    mask = mask ^ 0xffff;
    2d84:	4642           	not.w d2
    2d86:	548b           	addq.l #2,a3
    valactual += ZMLINESIZE/2;
    2d88:	49ec 0060      	lea 96(a4),a4
  for(int i2=0;i2<4;i2++) {
    2d8c:	4fef 0020      	lea 32(sp),sp
    2d90:	b6fc 0109      	cmpa.w #265,a3
    2d94:	66ca           	bne.s 2d60 <main+0x2d5a>
  }
  TestRow( valsupposed, valactual, mask, 0);
    2d96:	42a7           	clr.l -(sp)
    2d98:	3f02           	move.w d2,-(sp)
    2d9a:	4267           	clr.w -(sp)
    2d9c:	206d ff70      	movea.l -144(a5),a0
    2da0:	4868 30c0      	pea 12480(a0)
    2da4:	4879 0000 79dc 	pea 79dc <destlinezoom18>
    2daa:	4e92           	jsr (a2)
    2dac:	4fef 0010      	lea 16(sp),sp
char *sw_text = "!               ";
UWORD sw_testfont[] = { 0xffff, 0x0000, 0xffff, 0x0000, 0xffff, 0x0000, 0xffff,
           0x0000, 0xff00,0x00ff,0xff00, 0x00ff,0xff00,0x00ff, 0xff00, 0x00ff };

void SwScrollerTest() {
  PrepareDisplaySW();
    2db0:	4eb9 0000 4598 	jsr 4598 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    2db6:	4878 0010      	pea 10 <main+0xa>
    2dba:	4879 0000 7d5c 	pea 7d5c <ClsSprites>
    2dc0:	42a7           	clr.l -(sp)
    2dc2:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    2dc8:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    2dce:	4fef 0010      	lea 16(sp),sp
    2dd2:	4a80           	tst.l d0
    2dd4:	661e           	bne.s 2df4 <main+0x2dee>
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    2dd6:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2ddc:	4eae ffc4      	jsr -60(a6)
    2de0:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2de6:	2200           	move.l d0,d1
    2de8:	243c 0000 56a5 	move.l #22181,d2
    2dee:	762c           	moveq #44,d3
    2df0:	4eae ffd0      	jsr -48(a6)
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    2df4:	4878 000c      	pea c <main+0x6>
    2df8:	4879 0000 7d2c 	pea 7d2c <ClScreen>
    2dfe:	4878 0010      	pea 10 <main+0xa>
    2e02:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    2e08:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    2e0e:	4fef 0010      	lea 16(sp),sp
    2e12:	4a80           	tst.l d0
    2e14:	661e           	bne.s 2e34 <main+0x2e2e>
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
    2e16:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2e1c:	4eae ffc4      	jsr -60(a6)
    2e20:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2e26:	2200           	move.l d0,d1
    2e28:	243c 0000 56db 	move.l #22235,d2
    2e2e:	7636           	moveq #54,d3
    2e30:	4eae ffd0      	jsr -48(a6)
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    2e34:	4878 0002      	pea 2 <_start+0x2>
    2e38:	4879 0000 7d24 	pea 7d24 <ClColor>
    2e3e:	4878 001e      	pea 1e <main+0x18>
    2e42:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    2e48:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    2e4e:	4fef 0010      	lea 16(sp),sp
    2e52:	4a80           	tst.l d0
    2e54:	661e           	bne.s 2e74 <main+0x2e6e>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    2e56:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2e5c:	4eae ffc4      	jsr -60(a6)
    2e60:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2e66:	2200           	move.l d0,d1
    2e68:	243c 0000 53e7 	move.l #21479,d2
    2e6e:	7621           	moveq #33,d3
    2e70:	4eae ffd0      	jsr -48(a6)

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    2e74:	4878 fffe      	pea fffffffe <gcc8_c_support.c.e9862530+0xfffdc439>
    2e78:	4878 0020      	pea 20 <main+0x1a>
    2e7c:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    2e82:	4eb9 0000 3876 	jsr 3876 <TestCopperlistPos>
    2e88:	4fef 000c      	lea 12(sp),sp
    2e8c:	4a80           	tst.l d0
    2e8e:	6700 05c4      	beq.w 3454 <main+0x344e>
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  WriteFont(  sw_testfont, DrawBuffer, sw_text);
    2e92:	2479 0000 7e0e 	movea.l 7e0e <DrawBuffer>,a2
    2e98:	4879 0000 5958 	pea 5958 <incbin_swfont_end+0x786>
    2e9e:	2f0a           	move.l a2,-(sp)
    2ea0:	4eb9 0000 3600 	jsr 3600 <WriteFont.constprop.3>

  UWORD *tstpointer = DrawBuffer;
  if( *tstpointer != 0xff00)
    2ea6:	508f           	addq.l #8,sp
    2ea8:	0c52 ff00      	cmpi.w #-256,(a2)
    2eac:	671e           	beq.s 2ecc <main+0x2ec6>
    Write( Output(), "SwScrollerTest: Test Font not correctly Written.\n", 49);
    2eae:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2eb4:	4eae ffc4      	jsr -60(a6)
    2eb8:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    2ebe:	2200           	move.l d0,d1
    2ec0:	243c 0000 5969 	move.l #22889,d2
    2ec6:	7631           	moveq #49,d3
    2ec8:	4eae ffd0      	jsr -48(a6)

  FreeDisplay( SWCPSIZE, SWBPLSIZE);
    2ecc:	2f3c 0000 c800 	move.l #51200,-(sp)
    2ed2:	4878 0084      	pea 84 <main+0x7e>
    2ed6:	4eb9 0000 46d6 	jsr 46d6 <FreeDisplay>

void warpmode(int on) 
{ // bool
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (void *)0xf0ff60;
	if(*((ULONG *)UaeConf)) {
    2edc:	247c 00f0 ff60 	movea.l #15794016,a2
    2ee2:	508f           	addq.l #8,sp
    2ee4:	4a92           	tst.l (a2)
    2ee6:	6718           	beq.s 2f00 <main+0x2efa>
    2ee8:	4878 0001      	pea 1 <_start+0x1>
    2eec:	47f9 0000 364e 	lea 364e <warpmode.part.0>,a3
    2ef2:	4e93           	jsr (a3)
    2ef4:	588f           	addq.l #4,sp
    2ef6:	4a92           	tst.l (a2)
    2ef8:	6706           	beq.s 2f00 <main+0x2efa>
    2efa:	42a7           	clr.l -(sp)
    2efc:	4e93           	jsr (a3)
    2efe:	588f           	addq.l #4,sp
  ViewCopper = (ULONG *)tmp;
  hw->cop1lc = (ULONG) ViewCopper;
  hw->copjmp1 = tmp;
}
void TakeSystem() {
	ActiView=GfxBase->ActiView; //store current view
    2f00:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2f06:	23ee 0022 0000 	move.l 34(a6),7de0 <ActiView>
    2f0c:	7de0 
	OwnBlitter();
    2f0e:	4eae fe38      	jsr -456(a6)
	WaitBlit();	
    2f12:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2f18:	4eae ff1c      	jsr -228(a6)
	Disable();
    2f1c:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    2f22:	4eae ff88      	jsr -120(a6)
	
	//Save current interrupts and DMA settings so we can restore them upon exit. 
	SystemADKCON=hw->adkconr;
    2f26:	2479 0000 7df6 	movea.l 7df6 <hw>,a2
    2f2c:	302a 0010      	move.w 16(a2),d0
    2f30:	33c0 0000 7de4 	move.w d0,7de4 <SystemADKCON>
	SystemInts=hw->intenar;
    2f36:	302a 001c      	move.w 28(a2),d0
    2f3a:	33c0 0000 7de8 	move.w d0,7de8 <SystemInts>
	SystemDMA=hw->dmaconr;
    2f40:	302a 0002      	move.w 2(a2),d0
    2f44:	33c0 0000 7de6 	move.w d0,7de6 <SystemDMA>
	hw->intena=0x7fff;//disable all interrupts
    2f4a:	357c 7fff 009a 	move.w #32767,154(a2)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2f50:	357c 7fff 009c 	move.w #32767,156(a2)
	
	WaitVbl();
    2f56:	206d ff74      	movea.l -140(a5),a0
    2f5a:	4e90           	jsr (a0)
	WaitVbl();
    2f5c:	206d ff74      	movea.l -140(a5),a0
    2f60:	4e90           	jsr (a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    2f62:	357c 7fff 0096 	move.w #32767,150(a2)

	//set all colors black
	/*for(int a=0;a<32;a++)
		hw->color[a]=0;*/

	LoadView(0);
    2f68:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2f6e:	93c9           	suba.l a1,a1
    2f70:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    2f74:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2f7a:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    2f7e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    2f84:	4eae fef2      	jsr -270(a6)

	WaitVbl();
    2f88:	206d ff74      	movea.l -140(a5),a0
    2f8c:	4e90           	jsr (a0)
	WaitVbl();
    2f8e:	206d ff74      	movea.l -140(a5),a0
    2f92:	4e90           	jsr (a0)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
    2f94:	3b7c 4e7a ffc0 	move.w #20090,-64(a5)
    2f9a:	3b7c 0801 ffc2 	move.w #2049,-62(a5)
    2fa0:	3b7c 4e73 ffc4 	move.w #20083,-60(a5)
	if (SysBase->AttnFlags & AFF_68010) 
    2fa6:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    2fac:	082e 0000 0129 	btst #0,297(a6)
    2fb2:	6700 0528      	beq.w 34dc <main+0x34d6>
		vbr = (APTR)Supervisor((void*)getvbr);
    2fb6:	7ec0           	moveq #-64,d7
    2fb8:	de8d           	add.l a5,d7
    2fba:	cf8d           	exg d7,a5
    2fbc:	4eae ffe2      	jsr -30(a6)
    2fc0:	cf8d           	exg d7,a5

	VBR=GetVBR();
    2fc2:	23c0 0000 7dea 	move.l d0,7dea <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    2fc8:	2079 0000 7dea 	movea.l 7dea <VBR.lto_priv.4>,a0
    2fce:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    2fd2:	23c2 0000 7dee 	move.l d2,7dee <SystemIrq>
	warpmode(1);
	// TODO: precalc stuff here
	warpmode(0);

	TakeSystem();
	WaitVbl();
    2fd8:	206d ff74      	movea.l -140(a5),a0
    2fdc:	4e90           	jsr (a0)
}

void FreeSystem() { 
	WaitVbl();
    2fde:	206d ff74      	movea.l -140(a5),a0
    2fe2:	4e90           	jsr (a0)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    2fe4:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    2fea:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    2fee:	3028 0002      	move.w 2(a0),d0
    2ff2:	0800 000e      	btst #14,d0
    2ff6:	66f6           	bne.s 2fee <main+0x2fe8>
	WaitBlt();
	hw->intena=0x7fff;//disable all interrupts
    2ff8:	317c 7fff 009a 	move.w #32767,154(a0)
	hw->intreq=0x7fff;//Clear any interrupts that were pending
    2ffe:	317c 7fff 009c 	move.w #32767,156(a0)
	hw->dmacon=0x7fff;//Clear all DMA channels
    3004:	317c 7fff 0096 	move.w #32767,150(a0)
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
    300a:	2279 0000 7dea 	movea.l 7dea <VBR.lto_priv.4>,a1
    3010:	2342 006c      	move.l d2,108(a1)

	//restore interrupts
	SetInterruptHandler(SystemIrq);

	/*Restore system copper list(s). */
	hw->cop1lc=(ULONG)GfxBase->copinit;
    3014:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    301a:	216e 0026 0080 	move.l 38(a6),128(a0)
	hw->cop2lc=(ULONG)GfxBase->LOFlist;
    3020:	216e 0032 0084 	move.l 50(a6),132(a0)
	hw->copjmp1=0x7fff; //start coppper
    3026:	317c 7fff 0088 	move.w #32767,136(a0)

	/*Restore all interrupts and DMA settings. */
	hw->intena=SystemInts|0x8000;
    302c:	3039 0000 7de8 	move.w 7de8 <SystemInts>,d0
    3032:	0040 8000      	ori.w #-32768,d0
    3036:	3140 009a      	move.w d0,154(a0)
	hw->dmacon=SystemDMA|0x8000;
    303a:	3039 0000 7de6 	move.w 7de6 <SystemDMA>,d0
    3040:	0040 8000      	ori.w #-32768,d0
    3044:	3140 0096      	move.w d0,150(a0)
	hw->adkcon=SystemADKCON|0x8000;
    3048:	3039 0000 7de4 	move.w 7de4 <SystemADKCON>,d0
    304e:	0040 8000      	ori.w #-32768,d0
    3052:	3140 009e      	move.w d0,158(a0)

	LoadView(ActiView);
    3056:	2279 0000 7de0 	movea.l 7de0 <ActiView>,a1
    305c:	4eae ff22      	jsr -222(a6)
	WaitTOF();
    3060:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    3066:	4eae fef2      	jsr -270(a6)
	WaitTOF();
    306a:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    3070:	4eae fef2      	jsr -270(a6)
	WaitBlit();	
    3074:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    307a:	4eae ff1c      	jsr -228(a6)
	DisownBlitter();
    307e:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    3084:	4eae fe32      	jsr -462(a6)
	Enable();
    3088:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    308e:	4eae ff82      	jsr -126(a6)
	//RunDemo();

	// END
	FreeSystem();

	CloseLibrary((struct Library*)DOSBase);
    3092:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    3098:	2279 0000 7e22 	movea.l 7e22 <DOSBase>,a1
    309e:	4eae fe62      	jsr -414(a6)
	CloseLibrary((struct Library*)GfxBase);
    30a2:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    30a8:	2279 0000 7dfa 	movea.l 7dfa <GfxBase>,a1
    30ae:	4eae fe62      	jsr -414(a6)
}
    30b2:	7000           	moveq #0,d0
    30b4:	4ced 5cfc ff40 	movem.l -192(a5),d2-d7/a2-a4/a6
    30ba:	4e5d           	unlk a5
    30bc:	4e75           	rts
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
    30be:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    30c4:	4eae ffc4      	jsr -60(a6)
    30c8:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    30ce:	2200           	move.l d0,d1
    30d0:	243c 0000 56a5 	move.l #22181,d2
    30d6:	762c           	moveq #44,d3
    30d8:	4eae ffd0      	jsr -48(a6)
    30dc:	6000 d0d6      	bra.w 1b4 <main+0x1ae>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    30e0:	3640           	movea.w d0,a3
    30e2:	200b           	move.l a3,d0
    30e4:	d08b           	add.l a3,d0
    30e6:	d08b           	add.l a3,d0
    30e8:	e988           	lsl.l #4,d0
    30ea:	d880           	add.l d0,d4
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, 1);
    30ec:	2204           	move.l d4,d1
    30ee:	d28c           	add.l a4,d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    30f0:	3628 0002      	move.w 2(a0),d3
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    30f4:	3628 0002      	move.w 2(a0),d3
    30f8:	0803 000e      	btst #14,d3
    30fc:	66f6           	bne.s 30f4 <main+0x30ee>
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    30fe:	d5c0           	adda.l d0,a2
  hw->bltapt = (UWORD *) source;
    3100:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3104:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3108:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    310e:	3009           	move.w a1,d0
    3110:	5340           	subq.w #1,d0
          pos4dest += ZMLINESIZE/2;
    3112:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3116:	7a12           	moveq #18,d5
      while(linesleft > 0) {
    3118:	4a40           	tst.w d0
    311a:	6700 d65e      	beq.w 77a <main+0x774>
    311e:	3600           	move.w d0,d3
        if( linesleft >= ZoomHorizontal+1) {
    3120:	b045           	cmp.w d5,d0
    3122:	6e00 d628      	bgt.w 74c <main+0x746>
    3126:	93c9           	suba.l a1,a1
          linesleft = 0;
    3128:	97cb           	suba.l a3,a3
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    312a:	3a28 0002      	move.w 2(a0),d5
    312e:	6000 d62a      	bra.w 75a <main+0x754>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    3132:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3138:	4eae ffc4      	jsr -60(a6)
    313c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3142:	2200           	move.l d0,d1
    3144:	243c 0000 5409 	move.l #21513,d2
    314a:	7622           	moveq #34,d3
    314c:	4eae ffd0      	jsr -48(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
    3150:	2f3c 0001 6800 	move.l #92160,-(sp)
    3156:	2f3c 0000 a48c 	move.l #42124,-(sp)
    315c:	4eb9 0000 46d6 	jsr 46d6 <FreeDisplay>
  Zoom_Init();
    3162:	47f9 0000 4348 	lea 4348 <Zoom_Init>,a3
    3168:	4e93           	jsr (a3)
  PrepareDisplayZoom();
    316a:	4e92           	jsr (a2)
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
    316c:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    3172:	203c 0000 c800 	move.l #51200,d0
    3178:	7202           	moveq #2,d1
    317a:	4eae ff3a      	jsr -198(a6)
    317e:	2040           	movea.l d0,a0
    3180:	23c0 0000 7ddc 	move.l d0,7ddc <Zoom_Source>
  if( Zoom_Source == 0) {
    3186:	508f           	addq.l #8,sp
    3188:	6600 d95c      	bne.w ae6 <main+0xae0>
    Write(  Output(), 
    318c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3192:	4eae ffc4      	jsr -60(a6)
    3196:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    319c:	2200           	move.l d0,d1
    319e:	243c 0000 57db 	move.l #22491,d2
    31a4:	7636           	moveq #54,d3
    31a6:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( ZMLINESIZE*30, MEMF_CHIP);
    31aa:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    31b0:	203c 0000 05a0 	move.l #1440,d0
    31b6:	7202           	moveq #2,d1
    31b8:	4eae ff3a      	jsr -198(a6)
    31bc:	2440           	movea.l d0,a2
  if( source == 0) {
    31be:	4a80           	tst.l d0
    31c0:	6600 da96      	bne.w c58 <main+0xc52>
    Write(  Output(), "TestCopyWord: Memory for Source cannot be allocated.\n",
    31c4:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    31ca:	4eae ffc4      	jsr -60(a6)
    31ce:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    31d4:	2200           	move.l d0,d1
    31d6:	243c 0000 5868 	move.l #22632,d2
    31dc:	7635           	moveq #53,d3
    31de:	4eae ffd0      	jsr -48(a6)
  UWORD *source = AllocMem( (ZMLINESIZE+4)*272, MEMF_CHIP);
    31e2:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    31e8:	203c 0000 3740 	move.l #14144,d0
    31ee:	7202           	moveq #2,d1
    31f0:	4eae ff3a      	jsr -198(a6)
    31f4:	2840           	movea.l d0,a4
  if( source == 0) {
    31f6:	4a80           	tst.l d0
    31f8:	6600 dc9c      	bne.w e96 <main+0xe90>
    Write(  Output(), 
    31fc:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3202:	4eae ffc4      	jsr -60(a6)
    3206:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    320c:	2200           	move.l d0,d1
    320e:	243c 0000 58df 	move.l #22751,d2
    3214:	7639           	moveq #57,d3
    3216:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    321a:	4eb9 0000 4598 	jsr 4598 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3220:	4878 0010      	pea 10 <main+0xa>
    3224:	4879 0000 7d5c 	pea 7d5c <ClsSprites>
    322a:	42a7           	clr.l -(sp)
    322c:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    3232:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    3238:	4fef 0010      	lea 16(sp),sp
    323c:	4a80           	tst.l d0
    323e:	6600 fbb4      	bne.w 2df4 <main+0x2dee>
    3242:	6000 fb92      	bra.w 2dd6 <main+0x2dd0>
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
    3246:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    324c:	4eae ffc4      	jsr -60(a6)
    3250:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3256:	2200           	move.l d0,d1
    3258:	243c 0000 53e7 	move.l #21479,d2
    325e:	7621           	moveq #33,d3
    3260:	4eae ffd0      	jsr -48(a6)
    3264:	2079 0000 7e1a 	movea.l 7e1a <Copperlist1>,a0
    326a:	6000 d0bc      	bra.w 328 <main+0x322>
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
    326e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3274:	4eae ffc4      	jsr -60(a6)
    3278:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    327e:	2200           	move.l d0,d1
    3280:	243c 0000 56db 	move.l #22235,d2
    3286:	7636           	moveq #54,d3
    3288:	4eae ffd0      	jsr -48(a6)
  DrawBuffer = (ULONG *)0x40000;
    328c:	23fc 0004 0000 	move.l #262144,7e0e <DrawBuffer>
    3292:	0000 7e0e 
  ViewBuffer = (ULONG *)0x50000;
    3296:	23fc 0005 0000 	move.l #327680,7e02 <ViewBuffer>
    329c:	0000 7e02 
  SetBplPointers();
    32a0:	45f9 0000 456c 	lea 456c <SetBplPointers>,a2
    32a6:	4e92           	jsr (a2)
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    32a8:	0cb9 0005 0000 	cmpi.l #327680,7e0e <DrawBuffer>
    32ae:	0000 7e0e 
    32b2:	6600 cfd8      	bne.w 28c <main+0x286>
    32b6:	6000 01be      	bra.w 3476 <main+0x3470>
    32ba:	7600           	moveq #0,d3
    32bc:	3602           	move.w d2,d3
    32be:	6000 dd0e      	bra.w fce <main+0xfc8>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    32c2:	3607           	move.w d7,d3
    32c4:	9646           	sub.w d6,d3
    32c6:	5343           	subq.w #1,d3
  if( shiftright == 0) {
    32c8:	5342           	subq.w #1,d2
    32ca:	4a6d ff7c      	tst.w -132(a5)
    32ce:	6600 012a      	bne.w 33fa <main+0x33f4>
    ZoomBlit_Increment4SrcA = 1;
    32d2:	33fc 0001 0000 	move.w #1,7df2 <ZoomBlit_Increment4SrcA>
    32d8:	7df2 
    32da:	3a3c fde4      	move.w #-540,d5
  WaitBlit(); 
    32de:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    32e2:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    32e8:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    32ec:	3145 0040      	move.w d5,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    32f0:	0283 0000 ffff 	andi.l #65535,d3
    32f6:	7210           	moveq #16,d1
    32f8:	9283           	sub.l d3,d1
    32fa:	7000           	moveq #0,d0
    32fc:	4640           	not.w d0
    32fe:	e3a8           	lsl.l d1,d0
    3300:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
    3304:	0647 ffed      	addi.w #-19,d7
    3308:	3679 0000 7df4 	movea.w 7df4 <ZoomHorizontal>,a3
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    330e:	7000           	moveq #0,d0
    3310:	3039 0000 7df2 	move.w 7df2 <ZoomBlit_Increment4SrcA>,d0
    3316:	2240           	movea.l d0,a1
    3318:	d3c0           	adda.l d0,a1
    WORD linesleft = 272;
    331a:	303c 0110      	move.w #272,d0
    331e:	222d ff94      	move.l -108(a5),d1
    3322:	d28c           	add.l a4,d1
    3324:	3600           	move.w d0,d3
        if( linesleft >= ZoomHorizontal+1) {
    3326:	b04b           	cmp.w a3,d0
    3328:	6f00 00c0      	ble.w 33ea <main+0x33e4>
          linesleft -= ZoomHorizontal;
    332c:	3a00           	move.w d0,d5
    332e:	9a4b           	sub.w a3,d5
    3330:	3c45           	movea.w d5,a6
    3332:	300b           	move.w a3,d0
    3334:	360b           	move.w a3,d3
    3336:	3668 0002      	movea.w 2(a0),a3
    333a:	3b40 ff98      	move.w d0,-104(a5)
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    333e:	3668 0002      	movea.w 2(a0),a3
    3342:	200b           	move.l a3,d0
    3344:	0800 000e      	btst #14,d0
    3348:	66f4           	bne.s 333e <main+0x3338>
    334a:	302d ff98      	move.w -104(a5),d0
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    334e:	47f1 1800      	lea (0,a1,d1.l),a3
    3352:	214b 0050      	move.l a3,80(a0)
  hw->bltbpt = source;
    3356:	2141 004c      	move.l d1,76(a0)
  hw->bltdpt = destination;
    335a:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    335e:	ed4b           	lsl.w #6,d3
    3360:	5443           	addq.w #2,d3
    3362:	3143 0058      	move.w d3,88(a0)
        if( linesleft>0) {
    3366:	320e           	move.w a6,d1
    3368:	6e34           	bgt.s 339e <main+0x3398>
    336a:	33fc 0012 0000 	move.w #18,7df4 <ZoomHorizontal>
    3370:	7df4 
      if(shiftright < 0) {
    3372:	4a42           	tst.w d2
    3374:	6c00 d40c      	bge.w 782 <main+0x77c>
        shiftright += 16;
    3378:	342d ff7c      	move.w -132(a5),d2
    337c:	0642 000f      	addi.w #15,d2
        shifttoleft = 1;
    3380:	3b7c 0001 ff6c 	move.w #1,-148(a5)
    startofword -= 16;
    3386:	0646 fff0      	addi.w #-16,d6
    338a:	55ad ff94      	subq.l #2,-108(a5)
    338e:	55ad ff78      	subq.l #2,-136(a5)
  for(int i=0;i<22;i++) {
    3392:	0c46 fff0      	cmpi.w #-16,d6
    3396:	6600 d34e      	bne.w 6e6 <main+0x6e0>
    339a:	6000 d3fa      	bra.w 796 <main+0x790>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    339e:	3640           	movea.w d0,a3
    33a0:	200b           	move.l a3,d0
    33a2:	d08b           	add.l a3,d0
    33a4:	d08b           	add.l a3,d0
    33a6:	e988           	lsl.l #4,d0
    33a8:	d880           	add.l d0,d4
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, 1);
    33aa:	2204           	move.l d4,d1
    33ac:	d28c           	add.l a4,d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    33ae:	3628 0002      	move.w 2(a0),d3
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    33b2:	3628 0002      	move.w 2(a0),d3
    33b6:	0803 000e      	btst #14,d3
    33ba:	66f6           	bne.s 33b2 <main+0x33ac>
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    33bc:	d5c0           	adda.l d0,a2
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    33be:	2001           	move.l d1,d0
    33c0:	d089           	add.l a1,d0
    33c2:	2140 0050      	move.l d0,80(a0)
  hw->bltbpt = source;
    33c6:	2141 004c      	move.l d1,76(a0)
  hw->bltdpt = destination;
    33ca:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    33ce:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    33d4:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    33d8:	3005           	move.w d5,d0
    33da:	5340           	subq.w #1,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    33dc:	367c 0012      	movea.w #18,a3
      while( linesleft > 0) {
    33e0:	6788           	beq.s 336a <main+0x3364>
    33e2:	3600           	move.w d0,d3
        if( linesleft >= ZoomHorizontal+1) {
    33e4:	b04b           	cmp.w a3,d0
    33e6:	6e00 ff44      	bgt.w 332c <main+0x3326>
    33ea:	4245           	clr.w d5
          linesleft = 0;
    33ec:	9dce           	suba.l a6,a6
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    33ee:	3668 0002      	movea.w 2(a0),a3
    33f2:	3b40 ff98      	move.w d0,-104(a5)
    33f6:	6000 ff46      	bra.w 333e <main+0x3338>
  ZoomBlit_Increment4SrcA = 0;
    33fa:	4279 0000 7df2 	clr.w 7df2 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    3400:	3a02           	move.w d2,d5
    3402:	700c           	moveq #12,d0
    3404:	e16d           	lsl.w d0,d5
    3406:	0645 0de4      	addi.w #3556,d5
  WaitBlit(); 
    340a:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    340e:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    3414:	314b 0042      	move.w a3,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    3418:	3145 0040      	move.w d5,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    341c:	0283 0000 ffff 	andi.l #65535,d3
    3422:	7210           	moveq #16,d1
    3424:	9283           	sub.l d3,d1
    3426:	7000           	moveq #0,d0
    3428:	4640           	not.w d0
    342a:	e3a8           	lsl.l d1,d0
    342c:	3140 0070      	move.w d0,112(a0)
      nextzoom -= (19 + zoomnr);
    3430:	0647 ffed      	addi.w #-19,d7
    3434:	3679 0000 7df4 	movea.w 7df4 <ZoomHorizontal>,a3
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    343a:	7000           	moveq #0,d0
    343c:	3039 0000 7df2 	move.w 7df2 <ZoomBlit_Increment4SrcA>,d0
    3442:	2240           	movea.l d0,a1
    3444:	d3c0           	adda.l d0,a1
    WORD linesleft = 272;
    3446:	303c 0110      	move.w #272,d0
    344a:	222d ff94      	move.l -108(a5),d1
    344e:	d28c           	add.l a4,d1
    3450:	6000 fed2      	bra.w 3324 <main+0x331e>
    Write( Output(), "Copperlist End not correctly set.\n", 34);
    3454:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    345a:	4eae ffc4      	jsr -60(a6)
    345e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3464:	2200           	move.l d0,d1
    3466:	243c 0000 5409 	move.l #21513,d2
    346c:	7622           	moveq #34,d3
    346e:	4eae ffd0      	jsr -48(a6)
    3472:	6000 fa1e      	bra.w 2e92 <main+0x2e8c>
    3476:	0cb9 0004 0000 	cmpi.l #262144,7e02 <ViewBuffer>
    347c:	0000 7e02 
    3480:	6700 ce28      	beq.w 2aa <main+0x2a4>
    Write( Output(), 
    3484:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    348a:	4eae ffc4      	jsr -60(a6)
    348e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3494:	2200           	move.l d0,d1
    3496:	243c 0000 5331 	move.l #21297,d2
    349c:	763b           	moveq #59,d3
    349e:	4eae ffd0      	jsr -48(a6)
    34a2:	6000 ce06      	bra.w 2aa <main+0x2a4>
		Exit(0);
    34a6:	9dce           	suba.l a6,a6
    34a8:	7200           	moveq #0,d1
    34aa:	4eae ff70      	jsr -144(a6)
    34ae:	6000 cba4      	bra.w 54 <main+0x4e>
		Exit(0);
    34b2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    34b8:	7200           	moveq #0,d1
    34ba:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary("dos.library", 0);
    34be:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    34c4:	43f9 0000 52f6 	lea 52f6 <incbin_swfont_end+0x124>,a1
    34ca:	7000           	moveq #0,d0
    34cc:	4eae fdd8      	jsr -552(a6)
    34d0:	23c0 0000 7e22 	move.l d0,7e22 <DOSBase>
	if (!DOSBase)
    34d6:	6600 cb7c      	bne.w 54 <main+0x4e>
    34da:	60ca           	bra.s 34a6 <main+0x34a0>
	APTR vbr = 0;
    34dc:	7000           	moveq #0,d0
	VBR=GetVBR();
    34de:	23c0 0000 7dea 	move.l d0,7dea <VBR.lto_priv.4>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
    34e4:	2079 0000 7dea 	movea.l 7dea <VBR.lto_priv.4>,a0
    34ea:	2428 006c      	move.l 108(a0),d2
	SystemIrq=GetInterruptHandler(); //store interrupt register
    34ee:	23c2 0000 7dee 	move.l d2,7dee <SystemIrq>
	WaitVbl();
    34f4:	206d ff74      	movea.l -140(a5),a0
    34f8:	4e90           	jsr (a0)
	WaitVbl();
    34fa:	206d ff74      	movea.l -140(a5),a0
    34fe:	4e90           	jsr (a0)
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3500:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    3506:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    350a:	6000 fae2      	bra.w 2fee <main+0x2fe8>
    Write(  Output(), 
    350e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3514:	4eae ffc4      	jsr -60(a6)
    3518:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    351e:	2200           	move.l d0,d1
    3520:	243c 0000 5612 	move.l #22034,d2
    3526:	7639           	moveq #57,d3
    3528:	4eae ffd0      	jsr -48(a6)
    return;
    352c:	2b7c 0000 4748 	move.l #18248,-140(a5)
    3532:	ff74 
  PrepareDisplayZoom();
    3534:	45f9 0000 438a 	lea 438a <PrepareDisplayZoom>,a2
    353a:	4e92           	jsr (a2)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    353c:	4878 0010      	pea 10 <main+0xa>
    3540:	4879 0000 7d5c 	pea 7d5c <ClsSprites>
    3546:	42a7           	clr.l -(sp)
    3548:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    354e:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    3554:	4fef 0010      	lea 16(sp),sp
    3558:	4a80           	tst.l d0
    355a:	6600 d2e8      	bne.w 844 <main+0x83e>
    355e:	6000 d2c6      	bra.w 826 <main+0x820>
    Write(  Output(), 
    3562:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3568:	4eae ffc4      	jsr -60(a6)
    356c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3572:	2200           	move.l d0,d1
    3574:	243c 0000 5649 	move.l #22089,d2
    357a:	763d           	moveq #61,d3
    357c:	4eae ffd0      	jsr -48(a6)
    return;
    3580:	2b7c 0000 4748 	move.l #18248,-140(a5)
    3586:	ff74 
  PrepareDisplayZoom();
    3588:	45f9 0000 438a 	lea 438a <PrepareDisplayZoom>,a2
    358e:	4e92           	jsr (a2)
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    3590:	4878 0010      	pea 10 <main+0xa>
    3594:	4879 0000 7d5c 	pea 7d5c <ClsSprites>
    359a:	42a7           	clr.l -(sp)
    359c:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    35a2:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    35a8:	4fef 0010      	lea 16(sp),sp
    35ac:	4a80           	tst.l d0
    35ae:	6600 d294      	bne.w 844 <main+0x83e>
    35b2:	6000 d272      	bra.w 826 <main+0x820>
    Write(  Output(), 
    35b6:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    35bc:	4eae ffc4      	jsr -60(a6)
    35c0:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    35c6:	2200           	move.l d0,d1
    35c8:	243c 0000 5919 	move.l #22809,d2
    35ce:	763d           	moveq #61,d3
    35d0:	4eae ffd0      	jsr -48(a6)
  PrepareDisplaySW();
    35d4:	4eb9 0000 4598 	jsr 4598 <PrepareDisplay>
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    35da:	4878 0010      	pea 10 <main+0xa>
    35de:	4879 0000 7d5c 	pea 7d5c <ClsSprites>
    35e4:	42a7           	clr.l -(sp)
    35e6:	2f39 0000 7e1a 	move.l 7e1a <Copperlist1>,-(sp)
    35ec:	4eb9 0000 3894 	jsr 3894 <TestCopperlistBatch>
    35f2:	4fef 0010      	lea 16(sp),sp
    35f6:	4a80           	tst.l d0
    35f8:	6600 f7fa      	bne.w 2df4 <main+0x2dee>
    35fc:	6000 f7d8      	bra.w 2dd6 <main+0x2dd0>

00003600 <WriteFont.constprop.3>:
  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
    3600:	226f 0004      	movea.l 4(sp),a1
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
    3604:	206f 0008      	movea.l 8(sp),a0
    3608:	1010           	move.b (a0),d0
    360a:	0600 ffe0      	addi.b #-32,d0
  charpos = charpos<<3;
    360e:	4880           	ext.w d0
    3610:	48c0           	ext.l d0
    3612:	e788           	lsl.l #3,d0
  fntptr += charpos;
    3614:	4880           	ext.w d0
    3616:	3040           	movea.w d0,a0
    3618:	d1c8           	adda.l a0,a0
    361a:	d1fc 0000 7d9c 	adda.l #32156,a0
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    3620:	3290           	move.w (a0),(a1)
    3622:	3368 0002 0050 	move.w 2(a0),80(a1)
    3628:	3368 0004 00a0 	move.w 4(a0),160(a1)
    362e:	3368 0006 00f0 	move.w 6(a0),240(a1)
    3634:	3368 0008 0140 	move.w 8(a0),320(a1)
    363a:	3368 000a 0190 	move.w 10(a0),400(a1)
    3640:	3368 000c 01e0 	move.w 12(a0),480(a1)
    3646:	3368 000e 0230 	move.w 14(a0),560(a1)
    bmpptr += 40;
  }

}
    364c:	4e75           	rts

0000364e <warpmode.part.0>:
void warpmode(int on) 
    364e:	598f           	subq.l #4,sp
    3650:	2f02           	move.l d2,-(sp)
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    3652:	4aaf 000c      	tst.l 12(sp)
    3656:	674c           	beq.s 36a4 <warpmode.part.0+0x56>
    3658:	4878 0001      	pea 1 <_start+0x1>
    365c:	740b           	moveq #11,d2
    365e:	d48f           	add.l sp,d2
    3660:	2f02           	move.l d2,-(sp)
    3662:	42a7           	clr.l -(sp)
    3664:	4879 0000 5206 	pea 5206 <incbin_swfont_end+0x34>
    366a:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc43a>
    366e:	4878 0052      	pea 52 <main+0x4c>
    3672:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec39b>
    3678:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    367c:	203c 0000 51ec 	move.l #20972,d0
    3682:	4878 0001      	pea 1 <_start+0x1>
    3686:	2f02           	move.l d2,-(sp)
    3688:	42a7           	clr.l -(sp)
    368a:	2f00           	move.l d0,-(sp)
    368c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc43a>
    3690:	4878 0052      	pea 52 <main+0x4c>
    3694:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec39b>
	}
}
    369a:	4fef 0018      	lea 24(sp),sp
    369e:	241f           	move.l (sp)+,d2
    36a0:	588f           	addq.l #4,sp
    36a2:	4e75           	rts
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
    36a4:	4878 0001      	pea 1 <_start+0x1>
    36a8:	740b           	moveq #11,d2
    36aa:	d48f           	add.l sp,d2
    36ac:	2f02           	move.l d2,-(sp)
    36ae:	42a7           	clr.l -(sp)
    36b0:	4879 0000 5210 	pea 5210 <incbin_swfont_end+0x3e>
    36b6:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc43a>
    36ba:	4878 0052      	pea 52 <main+0x4c>
    36be:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec39b>
    36c4:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
    36c8:	203c 0000 51d3 	move.l #20947,d0
    36ce:	4878 0001      	pea 1 <_start+0x1>
    36d2:	2f02           	move.l d2,-(sp)
    36d4:	42a7           	clr.l -(sp)
    36d6:	2f00           	move.l d0,-(sp)
    36d8:	4878 ffff      	pea ffffffff <gcc8_c_support.c.e9862530+0xfffdc43a>
    36dc:	4878 0052      	pea 52 <main+0x4c>
    36e0:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec39b>
}
    36e6:	4fef 0018      	lea 24(sp),sp
    36ea:	241f           	move.l (sp)+,d2
    36ec:	588f           	addq.l #4,sp
    36ee:	4e75           	rts

000036f0 <KPrintF>:
{
    36f0:	4fef ff80      	lea -128(sp),sp
    36f4:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((ULONG *)UaeDbgLog)) {
    36f8:	4ab9 00f0 ff60 	tst.l f0ff60 <gcc8_c_support.c.e9862530+0xeec39b>
    36fe:	6734           	beq.s 3734 <KPrintF+0x44>
		RawDoFmt(fmt, vl, PutChar, temp);
    3700:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    3706:	206f 0090      	movea.l 144(sp),a0
    370a:	43ef 0094      	lea 148(sp),a1
    370e:	45f9 0000 4a0c 	lea 4a0c <PutChar>,a2
    3714:	47ef 000c      	lea 12(sp),a3
    3718:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
    371c:	2f0b           	move.l a3,-(sp)
    371e:	4878 0056      	pea 56 <main+0x50>
    3722:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.e9862530+0xeec39b>
    3728:	508f           	addq.l #8,sp
}
    372a:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    372e:	4fef 0080      	lea 128(sp),sp
    3732:	4e75           	rts
		RawDoFmt(fmt, vl, KPutCharX, 0);
    3734:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    373a:	206f 0090      	movea.l 144(sp),a0
    373e:	43ef 0094      	lea 148(sp),a1
    3742:	45f9 0000 49fe 	lea 49fe <KPutCharX>,a2
    3748:	97cb           	suba.l a3,a3
    374a:	4eae fdf6      	jsr -522(a6)
}
    374e:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
    3752:	4fef 0080      	lea 128(sp),sp
    3756:	4e75           	rts

00003758 <TestRow>:
  mask = mask ^ 0xffff;

}

void TestRow( UWORD *testpattern, UWORD *destination, UWORD xormask, 
                                                             int numberofline) {    
    3758:	4fef ff94      	lea -108(sp),sp
    375c:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    3760:	2f6f 00a4 002c 	move.l 164(sp),44(sp)
    3766:	3c2f 002e      	move.w 46(sp),d6
  
  char str[ 100] = { 0 };
    376a:	7a34           	moveq #52,d5
    376c:	da8f           	add.l sp,d5
    376e:	4878 0064      	pea 64 <main+0x5e>
    3772:	42a7           	clr.l -(sp)
    3774:	2f05           	move.l d5,-(sp)
    3776:	4eba 10a8      	jsr 4820 <memset>(pc)
  UWORD data[2];
  data[1] = numberofline;
    377a:	3f6f 00b6 003e 	move.w 182(sp),62(sp)
    3780:	4fef 000c      	lea 12(sp),sp

  testpattern += 0;
  destination += 0;
    3784:	2a6f 00a0      	movea.l 160(sp),a5
  testpattern += 0;
    3788:	286f 009c      	movea.l 156(sp),a4

  for(int i=0;i<21;i++) {
    378c:	7800           	moveq #0,d4
    if( (*testpattern++ ^ xormask) != *destination++) {
      data[0] = i;
      /*KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                 --*testpattern,--*destination);*/
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    378e:	2e3c 0000 521b 	move.l #21019,d7
    if( (*testpattern++ ^ xormask) != *destination++) {
    3794:	301c           	move.w (a4)+,d0
    3796:	bd40           	eor.w d6,d0
    3798:	b05d           	cmp.w (a5)+,d0
    379a:	6736           	beq.s 37d2 <TestRow+0x7a>
      data[0] = i;
    379c:	3f44 0030      	move.w d4,48(sp)
      RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data,
    37a0:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    37a6:	2047           	movea.l d7,a0
    37a8:	43ef 0030      	lea 48(sp),a1
    37ac:	45f9 0000 4a0c 	lea 4a0c <PutChar>,a2
    37b2:	2645           	movea.l d5,a3
    37b4:	4eae fdf6      	jsr -522(a6)
                                                                  PutChar, str);
      Write(  Output(), str, 100);
    37b8:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    37be:	4eae ffc4      	jsr -60(a6)
    37c2:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    37c8:	2200           	move.l d0,d1
    37ca:	2405           	move.l d5,d2
    37cc:	7664           	moveq #100,d3
    37ce:	4eae ffd0      	jsr -48(a6)
  for(int i=0;i<21;i++) {
    37d2:	5284           	addq.l #1,d4
    37d4:	7015           	moveq #21,d0
    37d6:	b084           	cmp.l d4,d0
    37d8:	66ba           	bne.s 3794 <TestRow+0x3c>
    }
  }
  if( ( (*testpattern ^ xormask) & 0xff00) != ( *destination & 0xff00)) {
    37da:	206f 00a0      	movea.l 160(sp),a0
    37de:	3028 002a      	move.w 42(a0),d0
    37e2:	322f 002e      	move.w 46(sp),d1
    37e6:	b340           	eor.w d1,d0
    37e8:	206f 009c      	movea.l 156(sp),a0
    37ec:	3228 002a      	move.w 42(a0),d1
    37f0:	b340           	eor.w d1,d0
    37f2:	0240 ff00      	andi.w #-256,d0
    37f6:	660a           	bne.s 3802 <TestRow+0xaa>
    Write(  Output(), str, 100);
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
                                                   *testpattern,*destination);
     
  }
}
    37f8:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    37fc:	4fef 006c      	lea 108(sp),sp
    3800:	4e75           	rts
    data[0] = 21;
    3802:	3f7c 0015 0030 	move.w #21,48(sp)
    RawDoFmt( "TestZoom4Picture Zoom 1: Word %d Row %d wrong.\n", data, PutChar, 
    3808:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    380e:	41f9 0000 521b 	lea 521b <incbin_swfont_end+0x49>,a0
    3814:	43ef 0030      	lea 48(sp),a1
    3818:	45f9 0000 4a0c 	lea 4a0c <PutChar>,a2
    381e:	47ef 0034      	lea 52(sp),a3
    3822:	4eae fdf6      	jsr -522(a6)
    Write(  Output(), str, 100);
    3826:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    382c:	4eae ffc4      	jsr -60(a6)
    3830:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3836:	2200           	move.l d0,d1
    3838:	240b           	move.l a3,d2
    383a:	7664           	moveq #100,d3
    383c:	4eae ffd0      	jsr -48(a6)
         KPrintF("Testpattern:0x%08x Destination:0x%08x",
    3840:	206f 00a0      	movea.l 160(sp),a0
    3844:	7000           	moveq #0,d0
    3846:	3028 002a      	move.w 42(a0),d0
    384a:	2f00           	move.l d0,-(sp)
    384c:	206f 00a0      	movea.l 160(sp),a0
    3850:	3028 002a      	move.w 42(a0),d0
    3854:	2f00           	move.l d0,-(sp)
    3856:	4879 0000 524b 	pea 524b <incbin_swfont_end+0x79>
    385c:	4eba fe92      	jsr 36f0 <KPrintF>(pc)
    3860:	4fef 000c      	lea 12(sp),sp
}
    3864:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3868:	4fef 006c      	lea 108(sp),sp
    386c:	4e75           	rts

0000386e <Vblankcounter>:
  Counter4Frames++;
    386e:	52b9 0000 7e1e 	addq.l #1,7e1e <Counter4Frames>
}
    3874:	4e75           	rts

00003876 <TestCopperlistPos>:
  if( instructions[pos] == value ) 
    3876:	202f 0008      	move.l 8(sp),d0
    387a:	d080           	add.l d0,d0
    387c:	d080           	add.l d0,d0
    387e:	206f 0004      	movea.l 4(sp),a0
    3882:	2030 0800      	move.l (0,a0,d0.l),d0
    3886:	b0af 000c      	cmp.l 12(sp),d0
    388a:	57c0           	seq d0
    388c:	4880           	ext.w d0
    388e:	48c0           	ext.l d0
}
    3890:	4480           	neg.l d0
    3892:	4e75           	rts

00003894 <TestCopperlistBatch>:
                                                                  long length) {
    3894:	48e7 2030      	movem.l d2/a2-a3,-(sp)
    3898:	246f 0010      	movea.l 16(sp),a2
    389c:	206f 0014      	movea.l 20(sp),a0
    38a0:	226f 0018      	movea.l 24(sp),a1
    38a4:	222f 001c      	move.l 28(sp),d1
    if( instructions[ pos+i] != batch[ i])
    38a8:	2008           	move.l a0,d0
    38aa:	d088           	add.l a0,d0
    38ac:	d080           	add.l d0,d0
    38ae:	2411           	move.l (a1),d2
    38b0:	b4b2 0800      	cmp.l (0,a2,d0.l),d2
    38b4:	6600 01ac      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
    38b8:	2008           	move.l a0,d0
    38ba:	5280           	addq.l #1,d0
    38bc:	d080           	add.l d0,d0
    38be:	d080           	add.l d0,d0
    38c0:	2032 0800      	move.l (0,a2,d0.l),d0
    38c4:	b0a9 0004      	cmp.l 4(a1),d0
    38c8:	6600 0198      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    38cc:	7002           	moveq #2,d0
    38ce:	b081           	cmp.l d1,d0
    38d0:	6700 0188      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    38d4:	2008           	move.l a0,d0
    38d6:	5480           	addq.l #2,d0
    38d8:	d080           	add.l d0,d0
    38da:	d080           	add.l d0,d0
    38dc:	2032 0800      	move.l (0,a2,d0.l),d0
    38e0:	b0a9 0008      	cmp.l 8(a1),d0
    38e4:	6600 017c      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    38e8:	7403           	moveq #3,d2
    38ea:	b481           	cmp.l d1,d2
    38ec:	6700 016c      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    38f0:	2008           	move.l a0,d0
    38f2:	5680           	addq.l #3,d0
    38f4:	d080           	add.l d0,d0
    38f6:	d080           	add.l d0,d0
    38f8:	2032 0800      	move.l (0,a2,d0.l),d0
    38fc:	b0a9 000c      	cmp.l 12(a1),d0
    3900:	6600 0160      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3904:	7004           	moveq #4,d0
    3906:	b081           	cmp.l d1,d0
    3908:	6700 0150      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    390c:	2008           	move.l a0,d0
    390e:	5880           	addq.l #4,d0
    3910:	d080           	add.l d0,d0
    3912:	d080           	add.l d0,d0
    3914:	2032 0800      	move.l (0,a2,d0.l),d0
    3918:	b0a9 0010      	cmp.l 16(a1),d0
    391c:	6600 0144      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3920:	7405           	moveq #5,d2
    3922:	b481           	cmp.l d1,d2
    3924:	6700 0134      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3928:	2008           	move.l a0,d0
    392a:	5a80           	addq.l #5,d0
    392c:	d080           	add.l d0,d0
    392e:	d080           	add.l d0,d0
    3930:	2032 0800      	move.l (0,a2,d0.l),d0
    3934:	b0a9 0014      	cmp.l 20(a1),d0
    3938:	6600 0128      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    393c:	7006           	moveq #6,d0
    393e:	b081           	cmp.l d1,d0
    3940:	6700 0118      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3944:	2008           	move.l a0,d0
    3946:	5c80           	addq.l #6,d0
    3948:	d080           	add.l d0,d0
    394a:	d080           	add.l d0,d0
    394c:	2032 0800      	move.l (0,a2,d0.l),d0
    3950:	b0a9 0018      	cmp.l 24(a1),d0
    3954:	6600 010c      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3958:	7407           	moveq #7,d2
    395a:	b481           	cmp.l d1,d2
    395c:	6700 00fc      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3960:	2008           	move.l a0,d0
    3962:	5e80           	addq.l #7,d0
    3964:	d080           	add.l d0,d0
    3966:	d080           	add.l d0,d0
    3968:	2032 0800      	move.l (0,a2,d0.l),d0
    396c:	b0a9 001c      	cmp.l 28(a1),d0
    3970:	6600 00f0      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3974:	7008           	moveq #8,d0
    3976:	b081           	cmp.l d1,d0
    3978:	6700 00e0      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    397c:	2008           	move.l a0,d0
    397e:	5080           	addq.l #8,d0
    3980:	d080           	add.l d0,d0
    3982:	d080           	add.l d0,d0
    3984:	2032 0800      	move.l (0,a2,d0.l),d0
    3988:	b0a9 0020      	cmp.l 32(a1),d0
    398c:	6600 00d4      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3990:	7409           	moveq #9,d2
    3992:	b481           	cmp.l d1,d2
    3994:	6700 00c4      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3998:	47e8 0009      	lea 9(a0),a3
    399c:	200b           	move.l a3,d0
    399e:	d08b           	add.l a3,d0
    39a0:	d080           	add.l d0,d0
    39a2:	2032 0800      	move.l (0,a2,d0.l),d0
    39a6:	b0a9 0024      	cmp.l 36(a1),d0
    39aa:	6600 00b6      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    39ae:	700a           	moveq #10,d0
    39b0:	b081           	cmp.l d1,d0
    39b2:	6700 00a6      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    39b6:	47e8 000a      	lea 10(a0),a3
    39ba:	200b           	move.l a3,d0
    39bc:	d08b           	add.l a3,d0
    39be:	d080           	add.l d0,d0
    39c0:	2032 0800      	move.l (0,a2,d0.l),d0
    39c4:	b0a9 0028      	cmp.l 40(a1),d0
    39c8:	6600 0098      	bne.w 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    39cc:	740b           	moveq #11,d2
    39ce:	b481           	cmp.l d1,d2
    39d0:	6700 0088      	beq.w 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    39d4:	47e8 000b      	lea 11(a0),a3
    39d8:	200b           	move.l a3,d0
    39da:	d08b           	add.l a3,d0
    39dc:	d080           	add.l d0,d0
    39de:	2032 0800      	move.l (0,a2,d0.l),d0
    39e2:	b0a9 002c      	cmp.l 44(a1),d0
    39e6:	667a           	bne.s 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    39e8:	700c           	moveq #12,d0
    39ea:	b081           	cmp.l d1,d0
    39ec:	676c           	beq.s 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    39ee:	47e8 000c      	lea 12(a0),a3
    39f2:	200b           	move.l a3,d0
    39f4:	d08b           	add.l a3,d0
    39f6:	d080           	add.l d0,d0
    39f8:	2032 0800      	move.l (0,a2,d0.l),d0
    39fc:	b0a9 0030      	cmp.l 48(a1),d0
    3a00:	6660           	bne.s 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3a02:	740d           	moveq #13,d2
    3a04:	b481           	cmp.l d1,d2
    3a06:	6752           	beq.s 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3a08:	47e8 000d      	lea 13(a0),a3
    3a0c:	200b           	move.l a3,d0
    3a0e:	d08b           	add.l a3,d0
    3a10:	d080           	add.l d0,d0
    3a12:	2032 0800      	move.l (0,a2,d0.l),d0
    3a16:	b0a9 0034      	cmp.l 52(a1),d0
    3a1a:	6646           	bne.s 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3a1c:	700e           	moveq #14,d0
    3a1e:	b081           	cmp.l d1,d0
    3a20:	6738           	beq.s 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3a22:	47e8 000e      	lea 14(a0),a3
    3a26:	200b           	move.l a3,d0
    3a28:	d08b           	add.l a3,d0
    3a2a:	d080           	add.l d0,d0
    3a2c:	2032 0800      	move.l (0,a2,d0.l),d0
    3a30:	b0a9 0038      	cmp.l 56(a1),d0
    3a34:	662c           	bne.s 3a62 <TestCopperlistBatch+0x1ce>
  for( int i=0;i<length;i++)
    3a36:	7410           	moveq #16,d2
    3a38:	b481           	cmp.l d1,d2
    3a3a:	661e           	bne.s 3a5a <TestCopperlistBatch+0x1c6>
    if( instructions[ pos+i] != batch[ i])
    3a3c:	41e8 000f      	lea 15(a0),a0
    3a40:	d1c8           	adda.l a0,a0
    3a42:	d1c8           	adda.l a0,a0
    3a44:	2070 a800      	movea.l (0,a0,a2.l),a0
    3a48:	b1e9 003c      	cmpa.l 60(a1),a0
    3a4c:	57c0           	seq d0
    3a4e:	4880           	ext.w d0
    3a50:	48c0           	ext.l d0
    3a52:	4480           	neg.l d0
}
    3a54:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3a58:	4e75           	rts
  return 1;
    3a5a:	7001           	moveq #1,d0
}
    3a5c:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3a60:	4e75           	rts
      return 0;
    3a62:	7000           	moveq #0,d0
}
    3a64:	4cdf 0c04      	movem.l (sp)+,d2/a2-a3
    3a68:	4e75           	rts

00003a6a <ClBuild>:
ULONG * ClbuildSW() {
    3a6a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
    3a6e:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    3a74:	707b           	moveq #123,d0
    3a76:	4600           	not.b d0
    3a78:	7202           	moveq #2,d1
    3a7a:	4eae ff3a      	jsr -198(a6)
    3a7e:	2440           	movea.l d0,a2
  if( retval == 0) {
    3a80:	4a80           	tst.l d0
    3a82:	6700 010e      	beq.w 3b92 <ClBuild+0x128>
    *cl++ = *clpartinstruction++;
    3a86:	24b9 0000 7d5c 	move.l 7d5c <ClsSprites>,(a2)
    3a8c:	2579 0000 7d60 	move.l 7d60 <ClsSprites+0x4>,4(a2)
    3a92:	0004 
    3a94:	2579 0000 7d64 	move.l 7d64 <ClsSprites+0x8>,8(a2)
    3a9a:	0008 
    3a9c:	2579 0000 7d68 	move.l 7d68 <ClsSprites+0xc>,12(a2)
    3aa2:	000c 
    3aa4:	2579 0000 7d6c 	move.l 7d6c <ClsSprites+0x10>,16(a2)
    3aaa:	0010 
    3aac:	2579 0000 7d70 	move.l 7d70 <ClsSprites+0x14>,20(a2)
    3ab2:	0014 
    3ab4:	2579 0000 7d74 	move.l 7d74 <ClsSprites+0x18>,24(a2)
    3aba:	0018 
    3abc:	2579 0000 7d78 	move.l 7d78 <ClsSprites+0x1c>,28(a2)
    3ac2:	001c 
    3ac4:	2579 0000 7d7c 	move.l 7d7c <ClsSprites+0x20>,32(a2)
    3aca:	0020 
    3acc:	2579 0000 7d80 	move.l 7d80 <ClsSprites+0x24>,36(a2)
    3ad2:	0024 
    3ad4:	2579 0000 7d84 	move.l 7d84 <ClsSprites+0x28>,40(a2)
    3ada:	0028 
    3adc:	2579 0000 7d88 	move.l 7d88 <ClsSprites+0x2c>,44(a2)
    3ae2:	002c 
    3ae4:	2579 0000 7d8c 	move.l 7d8c <ClsSprites+0x30>,48(a2)
    3aea:	0030 
    3aec:	2579 0000 7d90 	move.l 7d90 <ClsSprites+0x34>,52(a2)
    3af2:	0034 
    3af4:	2579 0000 7d94 	move.l 7d94 <ClsSprites+0x38>,56(a2)
    3afa:	0038 
    3afc:	2579 0000 7d98 	move.l 7d98 <ClsSprites+0x3c>,60(a2)
    3b02:	003c 
    *cl++ = *clpartinstruction++;
    3b04:	2579 0000 7d2c 	move.l 7d2c <ClScreen>,64(a2)
    3b0a:	0040 
    3b0c:	2579 0000 7d30 	move.l 7d30 <ClScreen+0x4>,68(a2)
    3b12:	0044 
    3b14:	2579 0000 7d34 	move.l 7d34 <ClScreen+0x8>,72(a2)
    3b1a:	0048 
    3b1c:	2579 0000 7d38 	move.l 7d38 <ClScreen+0xc>,76(a2)
    3b22:	004c 
    3b24:	2579 0000 7d3c 	move.l 7d3c <ClScreen+0x10>,80(a2)
    3b2a:	0050 
    3b2c:	2579 0000 7d40 	move.l 7d40 <ClScreen+0x14>,84(a2)
    3b32:	0054 
    3b34:	2579 0000 7d44 	move.l 7d44 <ClScreen+0x18>,88(a2)
    3b3a:	0058 
    3b3c:	2579 0000 7d48 	move.l 7d48 <ClScreen+0x1c>,92(a2)
    3b42:	005c 
    3b44:	2579 0000 7d4c 	move.l 7d4c <ClScreen+0x20>,96(a2)
    3b4a:	0060 
    3b4c:	2579 0000 7d50 	move.l 7d50 <ClScreen+0x24>,100(a2)
    3b52:	0064 
    3b54:	2579 0000 7d54 	move.l 7d54 <ClScreen+0x28>,104(a2)
    3b5a:	0068 
    3b5c:	2579 0000 7d58 	move.l 7d58 <ClScreen+0x2c>,108(a2)
    3b62:	006c 
  *cl++ = 0x00e00000;
    3b64:	257c 00e0 0000 	move.l #14680064,112(a2)
    3b6a:	0070 
  *cl++ = 0x00e20000;
    3b6c:	257c 00e2 0000 	move.l #14811136,116(a2)
    3b72:	0074 
    *cl++ = *clpartinstruction++;
    3b74:	2579 0000 7d24 	move.l 7d24 <ClColor>,120(a2)
    3b7a:	0078 
    3b7c:	2579 0000 7d28 	move.l 7d28 <ClColor+0x4>,124(a2)
    3b82:	007c 
  *cl = 0xfffffffe;
    3b84:	70fe           	moveq #-2,d0
    3b86:	2540 0080      	move.l d0,128(a2)
}
    3b8a:	200a           	move.l a2,d0
    3b8c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3b90:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    3b92:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3b98:	4eae ffc4      	jsr -60(a6)
    3b9c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3ba2:	2200           	move.l d0,d1
    3ba4:	243c 0000 5271 	move.l #21105,d2
    3baa:	7628           	moveq #40,d3
    3bac:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    3bb0:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    3bb6:	7201           	moveq #1,d1
    3bb8:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    3bbc:	24b9 0000 7d5c 	move.l 7d5c <ClsSprites>,(a2)
    3bc2:	2579 0000 7d60 	move.l 7d60 <ClsSprites+0x4>,4(a2)
    3bc8:	0004 
    3bca:	2579 0000 7d64 	move.l 7d64 <ClsSprites+0x8>,8(a2)
    3bd0:	0008 
    3bd2:	2579 0000 7d68 	move.l 7d68 <ClsSprites+0xc>,12(a2)
    3bd8:	000c 
    3bda:	2579 0000 7d6c 	move.l 7d6c <ClsSprites+0x10>,16(a2)
    3be0:	0010 
    3be2:	2579 0000 7d70 	move.l 7d70 <ClsSprites+0x14>,20(a2)
    3be8:	0014 
    3bea:	2579 0000 7d74 	move.l 7d74 <ClsSprites+0x18>,24(a2)
    3bf0:	0018 
    3bf2:	2579 0000 7d78 	move.l 7d78 <ClsSprites+0x1c>,28(a2)
    3bf8:	001c 
    3bfa:	2579 0000 7d7c 	move.l 7d7c <ClsSprites+0x20>,32(a2)
    3c00:	0020 
    3c02:	2579 0000 7d80 	move.l 7d80 <ClsSprites+0x24>,36(a2)
    3c08:	0024 
    3c0a:	2579 0000 7d84 	move.l 7d84 <ClsSprites+0x28>,40(a2)
    3c10:	0028 
    3c12:	2579 0000 7d88 	move.l 7d88 <ClsSprites+0x2c>,44(a2)
    3c18:	002c 
    3c1a:	2579 0000 7d8c 	move.l 7d8c <ClsSprites+0x30>,48(a2)
    3c20:	0030 
    3c22:	2579 0000 7d90 	move.l 7d90 <ClsSprites+0x34>,52(a2)
    3c28:	0034 
    3c2a:	2579 0000 7d94 	move.l 7d94 <ClsSprites+0x38>,56(a2)
    3c30:	0038 
    3c32:	2579 0000 7d98 	move.l 7d98 <ClsSprites+0x3c>,60(a2)
    3c38:	003c 
    *cl++ = *clpartinstruction++;
    3c3a:	2579 0000 7d2c 	move.l 7d2c <ClScreen>,64(a2)
    3c40:	0040 
    3c42:	2579 0000 7d30 	move.l 7d30 <ClScreen+0x4>,68(a2)
    3c48:	0044 
    3c4a:	2579 0000 7d34 	move.l 7d34 <ClScreen+0x8>,72(a2)
    3c50:	0048 
    3c52:	2579 0000 7d38 	move.l 7d38 <ClScreen+0xc>,76(a2)
    3c58:	004c 
    3c5a:	2579 0000 7d3c 	move.l 7d3c <ClScreen+0x10>,80(a2)
    3c60:	0050 
    3c62:	2579 0000 7d40 	move.l 7d40 <ClScreen+0x14>,84(a2)
    3c68:	0054 
    3c6a:	2579 0000 7d44 	move.l 7d44 <ClScreen+0x18>,88(a2)
    3c70:	0058 
    3c72:	2579 0000 7d48 	move.l 7d48 <ClScreen+0x1c>,92(a2)
    3c78:	005c 
    3c7a:	2579 0000 7d4c 	move.l 7d4c <ClScreen+0x20>,96(a2)
    3c80:	0060 
    3c82:	2579 0000 7d50 	move.l 7d50 <ClScreen+0x24>,100(a2)
    3c88:	0064 
    3c8a:	2579 0000 7d54 	move.l 7d54 <ClScreen+0x28>,104(a2)
    3c90:	0068 
    3c92:	2579 0000 7d58 	move.l 7d58 <ClScreen+0x2c>,108(a2)
    3c98:	006c 
  *cl++ = 0x00e00000;
    3c9a:	257c 00e0 0000 	move.l #14680064,112(a2)
    3ca0:	0070 
  *cl++ = 0x00e20000;
    3ca2:	257c 00e2 0000 	move.l #14811136,116(a2)
    3ca8:	0074 
    *cl++ = *clpartinstruction++;
    3caa:	2579 0000 7d24 	move.l 7d24 <ClColor>,120(a2)
    3cb0:	0078 
    3cb2:	2579 0000 7d28 	move.l 7d28 <ClColor+0x4>,124(a2)
    3cb8:	007c 
  *cl = 0xfffffffe;
    3cba:	70fe           	moveq #-2,d0
    3cbc:	2540 0080      	move.l d0,128(a2)
}
    3cc0:	200a           	move.l a2,d0
    3cc2:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    3cc6:	4e75           	rts

00003cc8 <WaitBlt>:
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3cc8:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    3cce:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3cd2:	3028 0002      	move.w 2(a0),d0
    3cd6:	0800 000e      	btst #14,d0
    3cda:	66f6           	bne.s 3cd2 <WaitBlt+0xa>
}
    3cdc:	4e75           	rts

00003cde <Zoom_ZoomIntoPicture>:
void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr) {
    3cde:	4fef ffec      	lea -20(sp),sp
    3ce2:	48e7 3f3e      	movem.l d2-d7/a2-a6,-(sp)
    3ce6:	282f 004c      	move.l 76(sp),d4
    3cea:	3404           	move.w d4,d2
  WaitBlit();
    3cec:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    3cf2:	4eae ff1c      	jsr -228(a6)
  hw->bltafwm = 0xffff;
    3cf6:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    3cfc:	317c ffff 0044 	move.w #-1,68(a0)
  hw->bltalwm = 0xffff;
    3d02:	317c ffff 0046 	move.w #-1,70(a0)
  hw->bltamod = ZMLINESIZE - 4;
    3d08:	317c 002c 0064 	move.w #44,100(a0)
  hw->bltbmod = ZMLINESIZE - 4;
    3d0e:	317c 002c 0062 	move.w #44,98(a0)
  hw->bltdmod = ZMLINESIZE - 4;
    3d14:	317c 002c 0066 	move.w #44,102(a0)
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
    3d1a:	3604           	move.w d4,d3
    3d1c:	d644           	add.w d4,d3
    3d1e:	3203           	move.w d3,d1
    3d20:	d243           	add.w d3,d1
    3d22:	d244           	add.w d4,d1
    3d24:	3001           	move.w d1,d0
    3d26:	d041           	add.w d1,d0
    3d28:	0640 014c      	addi.w #332,d0
    3d2c:	3f40 0036      	move.w d0,54(sp)
  WORD shiftright = 9;
    3d30:	7a09           	moveq #9,d5
  while( nextzoom > 22 * 16) {
    3d32:	0c40 0160      	cmpi.w #352,d0
    3d36:	6312           	bls.s 3d4a <Zoom_ZoomIntoPicture+0x6c>
    nextzoom -= (19 + zoomnr);
    3d38:	0640 ffed      	addi.w #-19,d0
    3d3c:	9042           	sub.w d2,d0
    shiftright--;
    3d3e:	5345           	subq.w #1,d5
  while( nextzoom > 22 * 16) {
    3d40:	0c40 0160      	cmpi.w #352,d0
    3d44:	62f2           	bhi.s 3d38 <Zoom_ZoomIntoPicture+0x5a>
    3d46:	3f40 0036      	move.w d0,54(sp)
  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
    3d4a:	7012           	moveq #18,d0
    3d4c:	9041           	sub.w d1,d0
    3d4e:	3f40 003a      	move.w d0,58(sp)
  while( ZoomHorizontalStart < 0) {
    3d52:	6c00 02f4      	bge.w 4048 <Zoom_ZoomIntoPicture+0x36a>
    3d56:	3200           	move.w d0,d1
  UWORD shifthoriz = 7;
    3d58:	7007           	moveq #7,d0
      ZoomHorizontalStart += 1 + 18 + zoomnr;
    3d5a:	0641 0013      	addi.w #19,d1
    3d5e:	d242           	add.w d2,d1
      shifthoriz--;
    3d60:	5340           	subq.w #1,d0
  while( ZoomHorizontalStart < 0) {
    3d62:	4a41           	tst.w d1
    3d64:	6df4           	blt.s 3d5a <Zoom_ZoomIntoPicture+0x7c>
    3d66:	3f41 003a      	move.w d1,58(sp)
    3d6a:	0280 0000 ffff 	andi.l #65535,d0
    3d70:	5280           	addq.l #1,d0
    3d72:	2200           	move.l d0,d1
    3d74:	d280           	add.l d0,d1
    3d76:	d081           	add.l d1,d0
    3d78:	e788           	lsl.l #3,d0
    3d7a:	0680 7fff fffe 	addi.l #2147483646,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3d80:	9644           	sub.w d4,d3
    3d82:	0643 0012      	addi.w #18,d3
    3d86:	d080           	add.l d0,d0
    3d88:	d0af 0044      	add.l 68(sp),d0
    3d8c:	2f40 002e      	move.l d0,46(sp)
    3d90:	722c           	moveq #44,d1
    3d92:	d2af 0048      	add.l 72(sp),d1
    3d96:	2f41 0032      	move.l d1,50(sp)
  UWORD shifttoleft = 0;
    3d9a:	426f 0038      	clr.w 56(sp)
  UWORD startofword = 21*16;
    3d9e:	3c3c 0150      	move.w #336,d6
      nextzoom -= (19 + zoomnr);
    3da2:	70ed           	moveq #-19,d0
    3da4:	9042           	sub.w d2,d0
    3da6:	3f40 003e      	move.w d0,62(sp)
    ZoomBlit_Increment4SrcA = 1;
    3daa:	3645           	movea.w d5,a3
    ZoomHorizontal = ZoomHorizontalStart;
    3dac:	33ef 003a 0000 	move.w 58(sp),7df4 <ZoomHorizontal>
    3db2:	7df4 
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
    3db4:	242f 002e      	move.l 46(sp),d2
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    3db8:	246f 0032      	movea.l 50(sp),a2
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
    3dbc:	7800           	moveq #0,d4
    3dbe:	382f 0038      	move.w 56(sp),d4
    3dc2:	d884           	add.l d4,d4
    3dc4:	384b           	movea.w a3,a4
    3dc6:	3a0b           	move.w a3,d5
    3dc8:	720c           	moveq #12,d1
    3dca:	e36d           	lsl.w d1,d5
    3dcc:	2c79 0000 7dfa 	movea.l 7dfa <GfxBase>,a6
    3dd2:	7000           	moveq #0,d0
    3dd4:	3006           	move.w d6,d0
    3dd6:	306f 0036      	movea.w 54(sp),a0
    3dda:	b1c0           	cmpa.l d0,a0
    3ddc:	6e00 00d2      	bgt.w 3eb0 <Zoom_ZoomIntoPicture+0x1d2>
  WaitBlit();
    3de0:	4eae ff1c      	jsr -228(a6)
  hw->bltcon0 = 0x9f0 + shiftright;
    3de4:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    3dea:	0645 09f0      	addi.w #2544,d5
    3dee:	3145 0040      	move.w d5,64(a0)
  hw->bltcon1 = 0;
    3df2:	317c 0000 0042 	move.w #0,66(a0)
    3df8:	3879 0000 7df4 	movea.w 7df4 <ZoomHorizontal>,a4
    WORD linesleft = 272;
    3dfe:	303c 0110      	move.w #272,d0
    3e02:	222f 002e      	move.l 46(sp),d1
    3e06:	d284           	add.l d4,d1
    3e08:	2a44           	movea.l d4,a5
        if( linesleft >= ZoomHorizontal+1) {
    3e0a:	3a00           	move.w d0,d5
    3e0c:	b04c           	cmp.w a4,d0
    3e0e:	6f00 0094      	ble.w 3ea4 <Zoom_ZoomIntoPicture+0x1c6>
          linesleft -= ZoomHorizontal;
    3e12:	3240           	movea.w d0,a1
    3e14:	92cc           	suba.w a4,a1
    3e16:	3e09           	move.w a1,d7
    3e18:	300c           	move.w a4,d0
    3e1a:	3a0c           	move.w a4,d5
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3e1c:	3868 0002      	movea.w 2(a0),a4
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3e20:	3828 0002      	move.w 2(a0),d4
    3e24:	0804 000e      	btst #14,d4
    3e28:	66f6           	bne.s 3e20 <Zoom_ZoomIntoPicture+0x142>
  hw->bltapt = (UWORD *) source;
    3e2a:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3e2e:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3e32:	ed4d           	lsl.w #6,d5
    3e34:	5445           	addq.w #2,d5
    3e36:	3145 0058      	move.w d5,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3e3a:	3840           	movea.w d0,a4
    3e3c:	200c           	move.l a4,d0
    3e3e:	d08c           	add.l a4,d0
    3e40:	d08c           	add.l a4,d0
    3e42:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    3e44:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    3e46:	4a47           	tst.w d7
    3e48:	6e24           	bgt.s 3e6e <Zoom_ZoomIntoPicture+0x190>
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3e4a:	33c3 0000 7df4 	move.w d3,7df4 <ZoomHorizontal>
    startofword -= 16;
    3e50:	0646 fff0      	addi.w #-16,d6
    3e54:	55af 002e      	subq.l #2,46(sp)
    3e58:	55af 0032      	subq.l #2,50(sp)
  for(int i=0;i<22;i++) {
    3e5c:	0c46 fff0      	cmpi.w #-16,d6
    3e60:	6600 ff4a      	bne.w 3dac <Zoom_ZoomIntoPicture+0xce>
}
    3e64:	4cdf 7cfc      	movem.l (sp)+,d2-d7/a2-a6
    3e68:	4fef 0014      	lea 20(sp),sp
    3e6c:	4e75           	rts
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3e6e:	d480           	add.l d0,d2
          Zoom_CopyWord( pos4source+shifttoleft, pos4dest, 1);
    3e70:	2202           	move.l d2,d1
    3e72:	d28d           	add.l a5,d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3e74:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3e78:	3028 0002      	move.w 2(a0),d0
    3e7c:	0800 000e      	btst #14,d0
    3e80:	66f6           	bne.s 3e78 <Zoom_ZoomIntoPicture+0x19a>
  hw->bltapt = (UWORD *) source;
    3e82:	2141 0050      	move.l d1,80(a0)
  hw->bltdpt = (UWORD *) destination;
    3e86:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3e8a:	317c 0042 0058 	move.w #66,88(a0)
          linesleft--;
    3e90:	3009           	move.w a1,d0
    3e92:	5340           	subq.w #1,d0
          pos4dest += ZMLINESIZE/2;
    3e94:	45ea 0030      	lea 48(a2),a2
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3e98:	3843           	movea.w d3,a4
      while(linesleft > 0) {
    3e9a:	67ae           	beq.s 3e4a <Zoom_ZoomIntoPicture+0x16c>
        if( linesleft >= ZoomHorizontal+1) {
    3e9c:	3a00           	move.w d0,d5
    3e9e:	b04c           	cmp.w a4,d0
    3ea0:	6e00 ff70      	bgt.w 3e12 <Zoom_ZoomIntoPicture+0x134>
    3ea4:	93c9           	suba.l a1,a1
          linesleft = 0;
    3ea6:	4247           	clr.w d7
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3ea8:	3868 0002      	movea.w 2(a0),a4
    3eac:	6000 ff72      	bra.w 3e20 <Zoom_ZoomIntoPicture+0x142>
  UWORD colnr = nextzoom - startofword - 1;                                                                          
    3eb0:	366f 0036      	movea.w 54(sp),a3
    3eb4:	96c6           	suba.w d6,a3
    3eb6:	534b           	subq.w #1,a3
  if( shiftright == 0) {
    3eb8:	300c           	move.w a4,d0
    3eba:	5340           	subq.w #1,d0
    3ebc:	3f40 003c      	move.w d0,60(sp)
    3ec0:	320c           	move.w a4,d1
    3ec2:	6600 0122      	bne.w 3fe6 <Zoom_ZoomIntoPicture+0x308>
    ZoomBlit_Increment4SrcA = 1;
    3ec6:	33fc 0001 0000 	move.w #1,7df2 <ZoomBlit_Increment4SrcA>
    3ecc:	7df2 
    3ece:	3a7c fde4      	movea.w #-540,a5
  WaitBlit(); 
    3ed2:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    3ed6:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    3edc:	3145 0042      	move.w d5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    3ee0:	314d 0040      	move.w a5,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    3ee4:	7000           	moveq #0,d0
    3ee6:	300b           	move.w a3,d0
    3ee8:	7210           	moveq #16,d1
    3eea:	9280           	sub.l d0,d1
    3eec:	2001           	move.l d1,d0
    3eee:	7200           	moveq #0,d1
    3ef0:	4641           	not.w d1
    3ef2:	e1a9           	lsl.l d0,d1
    3ef4:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    3ef8:	302f 003e      	move.w 62(sp),d0
    3efc:	d16f 0036      	add.w d0,54(sp)
      while( linesleft > 0) {
    3f00:	3279 0000 7df4 	movea.w 7df4 <ZoomHorizontal>,a1
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    3f06:	7000           	moveq #0,d0
    3f08:	3039 0000 7df2 	move.w 7df2 <ZoomBlit_Increment4SrcA>,d0
    3f0e:	2a40           	movea.l d0,a5
    3f10:	dbc0           	adda.l d0,a5
    WORD linesleft = 272;
    3f12:	303c 0110      	move.w #272,d0
    3f16:	222f 002e      	move.l 46(sp),d1
    3f1a:	d284           	add.l d4,d1
    3f1c:	2c44           	movea.l d4,a6
    3f1e:	2641           	movea.l d1,a3
        if( linesleft >= ZoomHorizontal+1) {
    3f20:	3a00           	move.w d0,d5
    3f22:	b049           	cmp.w a1,d0
    3f24:	6f00 00b4      	ble.w 3fda <Zoom_ZoomIntoPicture+0x2fc>
          linesleft -= ZoomHorizontal;
    3f28:	3e00           	move.w d0,d7
    3f2a:	9e49           	sub.w a1,d7
    3f2c:	3207           	move.w d7,d1
    3f2e:	3009           	move.w a1,d0
    3f30:	3a09           	move.w a1,d5
    3f32:	3268 0002      	movea.w 2(a0),a1
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3f36:	3828 0002      	move.w 2(a0),d4
    3f3a:	0804 000e      	btst #14,d4
    3f3e:	66f6           	bne.s 3f36 <Zoom_ZoomIntoPicture+0x258>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    3f40:	43f3 d800      	lea (0,a3,a5.l),a1
    3f44:	2149 0050      	move.l a1,80(a0)
  hw->bltbpt = source;
    3f48:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
    3f4c:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3f50:	ed4d           	lsl.w #6,d5
    3f52:	5445           	addq.w #2,d5
    3f54:	3145 0058      	move.w d5,88(a0)
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3f58:	3240           	movea.w d0,a1
    3f5a:	2009           	move.l a1,d0
    3f5c:	d089           	add.l a1,d0
    3f5e:	d089           	add.l a1,d0
    3f60:	e988           	lsl.l #4,d0
        pos4dest += ZMLINESIZE/2*ZoomHorizontal;
    3f62:	d5c0           	adda.l d0,a2
        if( linesleft>0) {
    3f64:	4a41           	tst.w d1
    3f66:	6e34           	bgt.s 3f9c <Zoom_ZoomIntoPicture+0x2be>
    3f68:	33c3 0000 7df4 	move.w d3,7df4 <ZoomHorizontal>
      shiftright--;  
    3f6e:	366f 003c      	movea.w 60(sp),a3
      if(shiftright < 0) {
    3f72:	320b           	move.w a3,d1
    3f74:	6c00 feda      	bge.w 3e50 <Zoom_ZoomIntoPicture+0x172>
        shiftright += 16;
    3f78:	364c           	movea.w a4,a3
    3f7a:	47eb 000f      	lea 15(a3),a3
        shifttoleft = 1;
    3f7e:	3f7c 0001 0038 	move.w #1,56(sp)
    startofword -= 16;
    3f84:	0646 fff0      	addi.w #-16,d6
    3f88:	55af 002e      	subq.l #2,46(sp)
    3f8c:	55af 0032      	subq.l #2,50(sp)
  for(int i=0;i<22;i++) {
    3f90:	0c46 fff0      	cmpi.w #-16,d6
    3f94:	6600 fe16      	bne.w 3dac <Zoom_ZoomIntoPicture+0xce>
    3f98:	6000 feca      	bra.w 3e64 <Zoom_ZoomIntoPicture+0x186>
        pos4source += ZMLINESIZE/2*ZoomHorizontal;
    3f9c:	d480           	add.l d0,d2
          Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, 1);
    3f9e:	47f6 2800      	lea (0,a6,d2.l),a3
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3fa2:	3028 0002      	move.w 2(a0),d0
	while (*(volatile UWORD*)&hw->dmaconr&(1<<14)) {} //blitter busy wait
    3fa6:	3028 0002      	move.w 2(a0),d0
    3faa:	0800 000e      	btst #14,d0
    3fae:	66f6           	bne.s 3fa6 <Zoom_ZoomIntoPicture+0x2c8>
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    3fb0:	200b           	move.l a3,d0
    3fb2:	d08d           	add.l a5,d0
    3fb4:	2140 0050      	move.l d0,80(a0)
  hw->bltbpt = source;
    3fb8:	214b 004c      	move.l a3,76(a0)
  hw->bltdpt = destination;
    3fbc:	214a 0054      	move.l a2,84(a0)
  hw->bltsize = height*64+2;
    3fc0:	317c 0042 0058 	move.w #66,88(a0)
          pos4dest += ZMLINESIZE/2;
    3fc6:	45ea 0030      	lea 48(a2),a2
          linesleft--;
    3fca:	3007           	move.w d7,d0
    3fcc:	5340           	subq.w #1,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    3fce:	3243           	movea.w d3,a1
      while( linesleft > 0) {
    3fd0:	6796           	beq.s 3f68 <Zoom_ZoomIntoPicture+0x28a>
        if( linesleft >= ZoomHorizontal+1) {
    3fd2:	3a00           	move.w d0,d5
    3fd4:	b049           	cmp.w a1,d0
    3fd6:	6e00 ff50      	bgt.w 3f28 <Zoom_ZoomIntoPicture+0x24a>
    3fda:	4247           	clr.w d7
          linesleft = 0;
    3fdc:	4241           	clr.w d1
	UWORD tst=*(volatile UWORD*)&hw->dmaconr; //for compatiblity a1000
    3fde:	3268 0002      	movea.w 2(a0),a1
    3fe2:	6000 ff52      	bra.w 3f36 <Zoom_ZoomIntoPicture+0x258>
  ZoomBlit_Increment4SrcA = 0;
    3fe6:	4279 0000 7df2 	clr.w 7df2 <ZoomBlit_Increment4SrcA>
    shifta = (shiftright - 1) << 12;
    3fec:	720c           	moveq #12,d1
    3fee:	e368           	lsl.w d1,d0
    3ff0:	3a40           	movea.w d0,a5
    3ff2:	4bed 0de4      	lea 3556(a5),a5
  WaitBlit(); 
    3ff6:	4eae ff1c      	jsr -228(a6)
  hw->bltcon1 = shiftb; 
    3ffa:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    4000:	3145 0042      	move.w d5,66(a0)
  hw->bltcon0 = 0xde4 + shifta;
    4004:	314d 0040      	move.w a5,64(a0)
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
    4008:	7000           	moveq #0,d0
    400a:	300b           	move.w a3,d0
    400c:	7210           	moveq #16,d1
    400e:	9280           	sub.l d0,d1
    4010:	2001           	move.l d1,d0
    4012:	7200           	moveq #0,d1
    4014:	4641           	not.w d1
    4016:	e1a9           	lsl.l d0,d1
    4018:	3141 0070      	move.w d1,112(a0)
      nextzoom -= (19 + zoomnr);
    401c:	302f 003e      	move.w 62(sp),d0
    4020:	d16f 0036      	add.w d0,54(sp)
      while( linesleft > 0) {
    4024:	3279 0000 7df4 	movea.w 7df4 <ZoomHorizontal>,a1
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
    402a:	7000           	moveq #0,d0
    402c:	3039 0000 7df2 	move.w 7df2 <ZoomBlit_Increment4SrcA>,d0
    4032:	2a40           	movea.l d0,a5
    4034:	dbc0           	adda.l d0,a5
    WORD linesleft = 272;
    4036:	303c 0110      	move.w #272,d0
    403a:	222f 002e      	move.l 46(sp),d1
    403e:	d284           	add.l d4,d1
    4040:	2c44           	movea.l d4,a6
    4042:	2641           	movea.l d1,a3
    4044:	6000 feda      	bra.w 3f20 <Zoom_ZoomIntoPicture+0x242>
  while( ZoomHorizontalStart < 0) {
    4048:	203c 8000 00be 	move.l #-2147483458,d0
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
    404e:	9644           	sub.w d4,d3
    4050:	0643 0012      	addi.w #18,d3
    4054:	d080           	add.l d0,d0
    4056:	d0af 0044      	add.l 68(sp),d0
    405a:	2f40 002e      	move.l d0,46(sp)
    405e:	722c           	moveq #44,d1
    4060:	d2af 0048      	add.l 72(sp),d1
    4064:	2f41 0032      	move.l d1,50(sp)
  UWORD shifttoleft = 0;
    4068:	426f 0038      	clr.w 56(sp)
  UWORD startofword = 21*16;
    406c:	3c3c 0150      	move.w #336,d6
      nextzoom -= (19 + zoomnr);
    4070:	70ed           	moveq #-19,d0
    4072:	9042           	sub.w d2,d0
    4074:	3f40 003e      	move.w d0,62(sp)
    ZoomBlit_Increment4SrcA = 1;
    4078:	3645           	movea.w d5,a3
    407a:	6000 fd30      	bra.w 3dac <Zoom_ZoomIntoPicture+0xce>

0000407e <ClbuildZoom>:
ULONG * ClbuildZoom() {
    407e:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
    4082:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    4088:	203c 0000 a48c 	move.l #42124,d0
    408e:	7202           	moveq #2,d1
    4090:	4eae ff3a      	jsr -198(a6)
    4094:	2440           	movea.l d0,a2
  if( retval == 0) {
    4096:	4a80           	tst.l d0
    4098:	6700 0160      	beq.w 41fa <ClbuildZoom+0x17c>
    *cl++ = *clpartinstruction++;
    409c:	24b9 0000 7d5c 	move.l 7d5c <ClsSprites>,(a2)
    40a2:	2579 0000 7d60 	move.l 7d60 <ClsSprites+0x4>,4(a2)
    40a8:	0004 
    40aa:	2579 0000 7d64 	move.l 7d64 <ClsSprites+0x8>,8(a2)
    40b0:	0008 
    40b2:	2579 0000 7d68 	move.l 7d68 <ClsSprites+0xc>,12(a2)
    40b8:	000c 
    40ba:	2579 0000 7d6c 	move.l 7d6c <ClsSprites+0x10>,16(a2)
    40c0:	0010 
    40c2:	2579 0000 7d70 	move.l 7d70 <ClsSprites+0x14>,20(a2)
    40c8:	0014 
    40ca:	2579 0000 7d74 	move.l 7d74 <ClsSprites+0x18>,24(a2)
    40d0:	0018 
    40d2:	2579 0000 7d78 	move.l 7d78 <ClsSprites+0x1c>,28(a2)
    40d8:	001c 
    40da:	2579 0000 7d7c 	move.l 7d7c <ClsSprites+0x20>,32(a2)
    40e0:	0020 
    40e2:	2579 0000 7d80 	move.l 7d80 <ClsSprites+0x24>,36(a2)
    40e8:	0024 
    40ea:	2579 0000 7d84 	move.l 7d84 <ClsSprites+0x28>,40(a2)
    40f0:	0028 
    40f2:	2579 0000 7d88 	move.l 7d88 <ClsSprites+0x2c>,44(a2)
    40f8:	002c 
    40fa:	2579 0000 7d8c 	move.l 7d8c <ClsSprites+0x30>,48(a2)
    4100:	0030 
    4102:	2579 0000 7d90 	move.l 7d90 <ClsSprites+0x34>,52(a2)
    4108:	0034 
    410a:	2579 0000 7d94 	move.l 7d94 <ClsSprites+0x38>,56(a2)
    4110:	0038 
    4112:	2579 0000 7d98 	move.l 7d98 <ClsSprites+0x3c>,60(a2)
    4118:	003c 
    *cl++ = *clpartinstruction++;
    411a:	2579 0000 7cf4 	move.l 7cf4 <ClScreenZoom>,64(a2)
    4120:	0040 
    4122:	2579 0000 7cf8 	move.l 7cf8 <ClScreenZoom+0x4>,68(a2)
    4128:	0044 
    412a:	2579 0000 7cfc 	move.l 7cfc <ClScreenZoom+0x8>,72(a2)
    4130:	0048 
    4132:	2579 0000 7d00 	move.l 7d00 <ClScreenZoom+0xc>,76(a2)
    4138:	004c 
    413a:	2579 0000 7d04 	move.l 7d04 <ClScreenZoom+0x10>,80(a2)
    4140:	0050 
    4142:	2579 0000 7d08 	move.l 7d08 <ClScreenZoom+0x14>,84(a2)
    4148:	0054 
    414a:	2579 0000 7d0c 	move.l 7d0c <ClScreenZoom+0x18>,88(a2)
    4150:	0058 
    4152:	2579 0000 7d10 	move.l 7d10 <ClScreenZoom+0x1c>,92(a2)
    4158:	005c 
    415a:	2579 0000 7d14 	move.l 7d14 <ClScreenZoom+0x20>,96(a2)
    4160:	0060 
    4162:	2579 0000 7d18 	move.l 7d18 <ClScreenZoom+0x24>,100(a2)
    4168:	0064 
    416a:	2579 0000 7d1c 	move.l 7d1c <ClScreenZoom+0x28>,104(a2)
    4170:	0068 
    4172:	2579 0000 7d20 	move.l 7d20 <ClScreenZoom+0x2c>,108(a2)
    4178:	006c 
  *cl++ = 0x00e00000;
    417a:	257c 00e0 0000 	move.l #14680064,112(a2)
    4180:	0070 
  *cl++ = 0x00e20000;
    4182:	257c 00e2 0000 	move.l #14811136,116(a2)
    4188:	0074 
  *cl++ = 0x00e40000;
    418a:	257c 00e4 0000 	move.l #14942208,120(a2)
    4190:	0078 
  *cl++ = 0x00e60000;
    4192:	257c 00e6 0000 	move.l #15073280,124(a2)
    4198:	007c 
    *cl++ = *clpartinstruction++;
    419a:	2579 0000 7d24 	move.l 7d24 <ClColor>,128(a2)
    41a0:	0080 
    41a2:	2579 0000 7d28 	move.l 7d28 <ClColor+0x4>,132(a2)
    41a8:	0084 
    41aa:	43ea 012c      	lea 300(a2),a1
    41ae:	220a           	move.l a2,d1
    41b0:	0681 0000 a52c 	addi.l #42284,d1
    41b6:	203c 2c07 fffe 	move.l #738721790,d0
    *cl++ = (i<<24)+0x07fffe;
    41bc:	41e9 ff60      	lea -160(a1),a0
    41c0:	2340 ff5c      	move.l d0,-164(a1)
      *cl++ = 0x018200f0;
    41c4:	20bc 0182 00f0 	move.l #25297136,(a0)
      *cl++ = 0x01820f00;
    41ca:	5088           	addq.l #8,a0
    41cc:	217c 0182 0f00 	move.l #25300736,-4(a0)
    41d2:	fffc 
    for(int i2=0;i2<20;i2++) {
    41d4:	b3c8           	cmpa.l a0,a1
    41d6:	66ec           	bne.s 41c4 <ClbuildZoom+0x146>
    41d8:	43e8 00a4      	lea 164(a0),a1
    41dc:	0680 0100 0000 	addi.l #16777216,d0
  for(int i=0x2c; i<0x2c+256; i++) {
    41e2:	b3c1           	cmpa.l d1,a1
    41e4:	66d6           	bne.s 41bc <ClbuildZoom+0x13e>
   *cl = 0xfffffffe;
    41e6:	203c 0000 a488 	move.l #42120,d0
    41ec:	72fe           	moveq #-2,d1
    41ee:	2581 0800      	move.l d1,(0,a2,d0.l)
}
    41f2:	200a           	move.l a2,d0
    41f4:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    41f8:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    41fa:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4200:	4eae ffc4      	jsr -60(a6)
    4204:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    420a:	2200           	move.l d0,d1
    420c:	243c 0000 5271 	move.l #21105,d2
    4212:	7628           	moveq #40,d3
    4214:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    4218:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    421e:	7201           	moveq #1,d1
    4220:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
    4224:	24b9 0000 7d5c 	move.l 7d5c <ClsSprites>,(a2)
    422a:	2579 0000 7d60 	move.l 7d60 <ClsSprites+0x4>,4(a2)
    4230:	0004 
    4232:	2579 0000 7d64 	move.l 7d64 <ClsSprites+0x8>,8(a2)
    4238:	0008 
    423a:	2579 0000 7d68 	move.l 7d68 <ClsSprites+0xc>,12(a2)
    4240:	000c 
    4242:	2579 0000 7d6c 	move.l 7d6c <ClsSprites+0x10>,16(a2)
    4248:	0010 
    424a:	2579 0000 7d70 	move.l 7d70 <ClsSprites+0x14>,20(a2)
    4250:	0014 
    4252:	2579 0000 7d74 	move.l 7d74 <ClsSprites+0x18>,24(a2)
    4258:	0018 
    425a:	2579 0000 7d78 	move.l 7d78 <ClsSprites+0x1c>,28(a2)
    4260:	001c 
    4262:	2579 0000 7d7c 	move.l 7d7c <ClsSprites+0x20>,32(a2)
    4268:	0020 
    426a:	2579 0000 7d80 	move.l 7d80 <ClsSprites+0x24>,36(a2)
    4270:	0024 
    4272:	2579 0000 7d84 	move.l 7d84 <ClsSprites+0x28>,40(a2)
    4278:	0028 
    427a:	2579 0000 7d88 	move.l 7d88 <ClsSprites+0x2c>,44(a2)
    4280:	002c 
    4282:	2579 0000 7d8c 	move.l 7d8c <ClsSprites+0x30>,48(a2)
    4288:	0030 
    428a:	2579 0000 7d90 	move.l 7d90 <ClsSprites+0x34>,52(a2)
    4290:	0034 
    4292:	2579 0000 7d94 	move.l 7d94 <ClsSprites+0x38>,56(a2)
    4298:	0038 
    429a:	2579 0000 7d98 	move.l 7d98 <ClsSprites+0x3c>,60(a2)
    42a0:	003c 
    *cl++ = *clpartinstruction++;
    42a2:	2579 0000 7cf4 	move.l 7cf4 <ClScreenZoom>,64(a2)
    42a8:	0040 
    42aa:	2579 0000 7cf8 	move.l 7cf8 <ClScreenZoom+0x4>,68(a2)
    42b0:	0044 
    42b2:	2579 0000 7cfc 	move.l 7cfc <ClScreenZoom+0x8>,72(a2)
    42b8:	0048 
    42ba:	2579 0000 7d00 	move.l 7d00 <ClScreenZoom+0xc>,76(a2)
    42c0:	004c 
    42c2:	2579 0000 7d04 	move.l 7d04 <ClScreenZoom+0x10>,80(a2)
    42c8:	0050 
    42ca:	2579 0000 7d08 	move.l 7d08 <ClScreenZoom+0x14>,84(a2)
    42d0:	0054 
    42d2:	2579 0000 7d0c 	move.l 7d0c <ClScreenZoom+0x18>,88(a2)
    42d8:	0058 
    42da:	2579 0000 7d10 	move.l 7d10 <ClScreenZoom+0x1c>,92(a2)
    42e0:	005c 
    42e2:	2579 0000 7d14 	move.l 7d14 <ClScreenZoom+0x20>,96(a2)
    42e8:	0060 
    42ea:	2579 0000 7d18 	move.l 7d18 <ClScreenZoom+0x24>,100(a2)
    42f0:	0064 
    42f2:	2579 0000 7d1c 	move.l 7d1c <ClScreenZoom+0x28>,104(a2)
    42f8:	0068 
    42fa:	2579 0000 7d20 	move.l 7d20 <ClScreenZoom+0x2c>,108(a2)
    4300:	006c 
  *cl++ = 0x00e00000;
    4302:	257c 00e0 0000 	move.l #14680064,112(a2)
    4308:	0070 
  *cl++ = 0x00e20000;
    430a:	257c 00e2 0000 	move.l #14811136,116(a2)
    4310:	0074 
  *cl++ = 0x00e40000;
    4312:	257c 00e4 0000 	move.l #14942208,120(a2)
    4318:	0078 
  *cl++ = 0x00e60000;
    431a:	257c 00e6 0000 	move.l #15073280,124(a2)
    4320:	007c 
    *cl++ = *clpartinstruction++;
    4322:	2579 0000 7d24 	move.l 7d24 <ClColor>,128(a2)
    4328:	0080 
    432a:	2579 0000 7d28 	move.l 7d28 <ClColor+0x4>,132(a2)
    4330:	0084 
    4332:	43ea 012c      	lea 300(a2),a1
    4336:	220a           	move.l a2,d1
    4338:	0681 0000 a52c 	addi.l #42284,d1
    433e:	203c 2c07 fffe 	move.l #738721790,d0
    4344:	6000 fe76      	bra.w 41bc <ClbuildZoom+0x13e>

00004348 <Zoom_Init>:
void Zoom_Init() {
    4348:	2f0e           	move.l a6,-(sp)
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
    434a:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    4350:	7004           	moveq #4,d0
    4352:	7202           	moveq #2,d1
    4354:	4eae ff3a      	jsr -198(a6)
  ZoomHorizontal = 16;
    4358:	33fc 0010 0000 	move.w #16,7df4 <ZoomHorizontal>
    435e:	7df4 
}
    4360:	2c5f           	movea.l (sp)+,a6
    4362:	4e75           	rts

00004364 <SwapCl>:
  ULONG tmp = (ULONG) DrawCopper;
    4364:	2039 0000 7e0a 	move.l 7e0a <DrawCopper>,d0
  DrawCopper = ViewCopper;
    436a:	23f9 0000 7dfe 	move.l 7dfe <ViewCopper>,7e0a <DrawCopper>
    4370:	0000 7e0a 
  ViewCopper = (ULONG *)tmp;
    4374:	23c0 0000 7dfe 	move.l d0,7dfe <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
    437a:	2079 0000 7df6 	movea.l 7df6 <hw>,a0
    4380:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
    4384:	3140 0088      	move.w d0,136(a0)
}
    4388:	4e75           	rts

0000438a <PrepareDisplayZoom>:
 int PrepareDisplayZoom() {
    438a:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  Copperlist1 = ClbuildZoom();
    438e:	45fa fcee      	lea 407e <ClbuildZoom>(pc),a2
    4392:	4e92           	jsr (a2)
    4394:	23c0 0000 7e1a 	move.l d0,7e1a <Copperlist1>
  Copperlist2 = ClbuildZoom();
    439a:	4e92           	jsr (a2)
    439c:	23c0 0000 7e16 	move.l d0,7e16 <Copperlist2>
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    43a2:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    43a8:	203c 0001 6800 	move.l #92160,d0
    43ae:	7202           	moveq #2,d1
    43b0:	4eae ff3a      	jsr -198(a6)
    43b4:	23c0 0000 7e12 	move.l d0,7e12 <Bitplane1>
  if(Bitplane1 == 0) {
    43ba:	6700 014e      	beq.w 450a <PrepareDisplayZoom+0x180>
  DrawBuffer = Bitplane1;
    43be:	23c0 0000 7e0e 	move.l d0,7e0e <DrawBuffer>
  DrawCopper = Copperlist1;
    43c4:	23f9 0000 7e1a 	move.l 7e1a <Copperlist1>,7e0a <DrawCopper>
    43ca:	0000 7e0a 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    43ce:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    43d4:	203c 0001 6800 	move.l #92160,d0
    43da:	7202           	moveq #2,d1
    43dc:	4eae ff3a      	jsr -198(a6)
    43e0:	2400           	move.l d0,d2
    43e2:	23c0 0000 7e06 	move.l d0,7e06 <Bitplane2>
  if(Bitplane2 == 0) {
    43e8:	6778           	beq.s 4462 <PrepareDisplayZoom+0xd8>
  ViewCopper = Copperlist2;
    43ea:	23f9 0000 7e16 	move.l 7e16 <Copperlist2>,7dfe <ViewCopper>
    43f0:	0000 7dfe 
  SwapCl();
    43f4:	45fa ff6e      	lea 4364 <SwapCl>(pc),a2
    43f8:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    43fa:	2039 0000 7e0e 	move.l 7e0e <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    4400:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    4406:	2200           	move.l d0,d1
    4408:	4241           	clr.w d1
    440a:	4841           	swap d1
    440c:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    4410:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    4414:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    441a:	2200           	move.l d0,d1
    441c:	4241           	clr.w d1
    441e:	4841           	swap d1
    4420:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    4424:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    4428:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    442a:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    4430:	2002           	move.l d2,d0
    4432:	4240           	clr.w d0
    4434:	4840           	swap d0
    4436:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    443a:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    443e:	2002           	move.l d2,d0
    4440:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    4446:	2200           	move.l d0,d1
    4448:	4241           	clr.w d1
    444a:	4841           	swap d1
    444c:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    4450:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    4454:	23c2 0000 7e02 	move.l d2,7e02 <ViewBuffer>
}
    445a:	7000           	moveq #0,d0
    445c:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    4460:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    4462:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4468:	4eae ffc4      	jsr -60(a6)
    446c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4472:	2200           	move.l d0,d1
    4474:	243c 0000 52be 	move.l #21182,d2
    447a:	7626           	moveq #38,d3
    447c:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    4480:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4486:	7201           	moveq #1,d1
    4488:	4eae ff70      	jsr -144(a6)
    448c:	2439 0000 7e06 	move.l 7e06 <Bitplane2>,d2
  ViewCopper = Copperlist2;
    4492:	23f9 0000 7e16 	move.l 7e16 <Copperlist2>,7dfe <ViewCopper>
    4498:	0000 7dfe 
  SwapCl();
    449c:	45fa fec6      	lea 4364 <SwapCl>(pc),a2
    44a0:	4e92           	jsr (a2)
  ULONG ptr = (ULONG) DrawBuffer;
    44a2:	2039 0000 7e0e 	move.l 7e0e <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    44a8:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    44ae:	2200           	move.l d0,d1
    44b0:	4241           	clr.w d1
    44b2:	4841           	swap d1
    44b4:	3141 0072      	move.w d1,114(a0)
    UWORD lowword = ptr & 0xffff;
    44b8:	3140 0076      	move.w d0,118(a0)
    ptr += 40*256;
    44bc:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    44c2:	2200           	move.l d0,d1
    44c4:	4241           	clr.w d1
    44c6:	4841           	swap d1
    44c8:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    44cc:	3140 007e      	move.w d0,126(a0)
  SwapCl();
    44d0:	4e92           	jsr (a2)
  UWORD *copword = (UWORD *) DrawCopper;
    44d2:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
    UWORD highword = ptr >> 16;
    44d8:	2002           	move.l d2,d0
    44da:	4240           	clr.w d0
    44dc:	4840           	swap d0
    44de:	3140 0072      	move.w d0,114(a0)
    UWORD lowword = ptr & 0xffff;
    44e2:	3142 0076      	move.w d2,118(a0)
    ptr += 40*256;
    44e6:	2002           	move.l d2,d0
    44e8:	0680 0000 2800 	addi.l #10240,d0
    UWORD highword = ptr >> 16;
    44ee:	2200           	move.l d0,d1
    44f0:	4241           	clr.w d1
    44f2:	4841           	swap d1
    44f4:	3141 007a      	move.w d1,122(a0)
    UWORD lowword = ptr & 0xffff;
    44f8:	3140 007e      	move.w d0,126(a0)
  ViewBuffer = (ULONG *) tmp;
    44fc:	23c2 0000 7e02 	move.l d2,7e02 <ViewBuffer>
}
    4502:	7000           	moveq #0,d0
    4504:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
    4508:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    450a:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4510:	4eae ffc4      	jsr -60(a6)
    4514:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    451a:	2200           	move.l d0,d1
    451c:	243c 0000 5297 	move.l #21143,d2
    4522:	7626           	moveq #38,d3
    4524:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    4528:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    452e:	7201           	moveq #1,d1
    4530:	4eae ff70      	jsr -144(a6)
    4534:	2039 0000 7e12 	move.l 7e12 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    453a:	23c0 0000 7e0e 	move.l d0,7e0e <DrawBuffer>
  DrawCopper = Copperlist1;
    4540:	23f9 0000 7e1a 	move.l 7e1a <Copperlist1>,7e0a <DrawCopper>
    4546:	0000 7e0a 
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
    454a:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    4550:	203c 0001 6800 	move.l #92160,d0
    4556:	7202           	moveq #2,d1
    4558:	4eae ff3a      	jsr -198(a6)
    455c:	2400           	move.l d0,d2
    455e:	23c0 0000 7e06 	move.l d0,7e06 <Bitplane2>
  if(Bitplane2 == 0) {
    4564:	6600 fe84      	bne.w 43ea <PrepareDisplayZoom+0x60>
    4568:	6000 fef8      	bra.w 4462 <PrepareDisplayZoom+0xd8>

0000456c <SetBplPointers>:
  UWORD highword = (ULONG)DrawBuffer >> 16;
    456c:	2039 0000 7e0e 	move.l 7e0e <DrawBuffer>,d0
  UWORD *copword = (UWORD *) DrawCopper;
    4572:	2079 0000 7e0a 	movea.l 7e0a <DrawCopper>,a0
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
    4578:	3140 0076      	move.w d0,118(a0)
  UWORD highword = (ULONG)DrawBuffer >> 16;
    457c:	2200           	move.l d0,d1
    457e:	4241           	clr.w d1
    4580:	4841           	swap d1
    4582:	3141 0072      	move.w d1,114(a0)
  DrawBuffer = ViewBuffer;
    4586:	23f9 0000 7e02 	move.l 7e02 <ViewBuffer>,7e0e <DrawBuffer>
    458c:	0000 7e0e 
  ViewBuffer = (ULONG *) tmp;
    4590:	23c0 0000 7e02 	move.l d0,7e02 <ViewBuffer>
}
    4596:	4e75           	rts

00004598 <PrepareDisplay>:
 int PrepareDisplaySW() {
    4598:	48e7 3032      	movem.l d2-d3/a2-a3/a6,-(sp)
  Copperlist1 = ClbuildSW();
    459c:	45fa f4cc      	lea 3a6a <ClBuild>(pc),a2
    45a0:	4e92           	jsr (a2)
    45a2:	23c0 0000 7e1a 	move.l d0,7e1a <Copperlist1>
  Copperlist2 = ClbuildSW();
    45a8:	4e92           	jsr (a2)
    45aa:	23c0 0000 7e16 	move.l d0,7e16 <Copperlist2>
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    45b0:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    45b6:	203c 0000 c800 	move.l #51200,d0
    45bc:	7202           	moveq #2,d1
    45be:	4eae ff3a      	jsr -198(a6)
    45c2:	23c0 0000 7e12 	move.l d0,7e12 <Bitplane1>
  if(Bitplane1 == 0) {
    45c8:	6700 00ac      	beq.w 4676 <PrepareDisplay+0xde>
  DrawBuffer = Bitplane1;
    45cc:	23c0 0000 7e0e 	move.l d0,7e0e <DrawBuffer>
  DrawCopper = Copperlist1;
    45d2:	23f9 0000 7e1a 	move.l 7e1a <Copperlist1>,7e0a <DrawCopper>
    45d8:	0000 7e0a 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    45dc:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    45e2:	203c 0000 c800 	move.l #51200,d0
    45e8:	7202           	moveq #2,d1
    45ea:	4eae ff3a      	jsr -198(a6)
    45ee:	23c0 0000 7e06 	move.l d0,7e06 <Bitplane2>
  if(Bitplane2 == 0) {
    45f4:	6728           	beq.s 461e <PrepareDisplay+0x86>
  ViewBuffer = Bitplane2;
    45f6:	23c0 0000 7e02 	move.l d0,7e02 <ViewBuffer>
  ViewCopper = Copperlist2;
    45fc:	23f9 0000 7e16 	move.l 7e16 <Copperlist2>,7dfe <ViewCopper>
    4602:	0000 7dfe 
  SwapCl();
    4606:	47fa fd5c      	lea 4364 <SwapCl>(pc),a3
    460a:	4e93           	jsr (a3)
  SetBplPointers();
    460c:	45fa ff5e      	lea 456c <SetBplPointers>(pc),a2
    4610:	4e92           	jsr (a2)
  SwapCl();
    4612:	4e93           	jsr (a3)
  SetBplPointers();
    4614:	4e92           	jsr (a2)
}
    4616:	7000           	moveq #0,d0
    4618:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    461c:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    461e:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4624:	4eae ffc4      	jsr -60(a6)
    4628:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    462e:	2200           	move.l d0,d1
    4630:	243c 0000 52be 	move.l #21182,d2
    4636:	7626           	moveq #38,d3
    4638:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    463c:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4642:	7201           	moveq #1,d1
    4644:	4eae ff70      	jsr -144(a6)
    4648:	2039 0000 7e06 	move.l 7e06 <Bitplane2>,d0
  ViewBuffer = Bitplane2;
    464e:	23c0 0000 7e02 	move.l d0,7e02 <ViewBuffer>
  ViewCopper = Copperlist2;
    4654:	23f9 0000 7e16 	move.l 7e16 <Copperlist2>,7dfe <ViewCopper>
    465a:	0000 7dfe 
  SwapCl();
    465e:	47fa fd04      	lea 4364 <SwapCl>(pc),a3
    4662:	4e93           	jsr (a3)
  SetBplPointers();
    4664:	45fa ff06      	lea 456c <SetBplPointers>(pc),a2
    4668:	4e92           	jsr (a2)
  SwapCl();
    466a:	4e93           	jsr (a3)
  SetBplPointers();
    466c:	4e92           	jsr (a2)
}
    466e:	7000           	moveq #0,d0
    4670:	4cdf 4c0c      	movem.l (sp)+,d2-d3/a2-a3/a6
    4674:	4e75           	rts
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    4676:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    467c:	4eae ffc4      	jsr -60(a6)
    4680:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    4686:	2200           	move.l d0,d1
    4688:	243c 0000 5297 	move.l #21143,d2
    468e:	7626           	moveq #38,d3
    4690:	4eae ffd0      	jsr -48(a6)
    Exit(1);
    4694:	2c79 0000 7e22 	movea.l 7e22 <DOSBase>,a6
    469a:	7201           	moveq #1,d1
    469c:	4eae ff70      	jsr -144(a6)
    46a0:	2039 0000 7e12 	move.l 7e12 <Bitplane1>,d0
  DrawBuffer = Bitplane1;
    46a6:	23c0 0000 7e0e 	move.l d0,7e0e <DrawBuffer>
  DrawCopper = Copperlist1;
    46ac:	23f9 0000 7e1a 	move.l 7e1a <Copperlist1>,7e0a <DrawCopper>
    46b2:	0000 7e0a 
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
    46b6:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    46bc:	203c 0000 c800 	move.l #51200,d0
    46c2:	7202           	moveq #2,d1
    46c4:	4eae ff3a      	jsr -198(a6)
    46c8:	23c0 0000 7e06 	move.l d0,7e06 <Bitplane2>
  if(Bitplane2 == 0) {
    46ce:	6600 ff26      	bne.w 45f6 <PrepareDisplay+0x5e>
    46d2:	6000 ff4a      	bra.w 461e <PrepareDisplay+0x86>

000046d6 <FreeDisplay>:
void FreeDisplay( int clsize, int bplsize) {
    46d6:	48e7 3002      	movem.l d2-d3/a6,-(sp)
    46da:	262f 0010      	move.l 16(sp),d3
    46de:	242f 0014      	move.l 20(sp),d2
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
    46e2:	2279 0000 7e1a 	movea.l 7e1a <Copperlist1>,a1
    46e8:	b2fc 0000      	cmpa.w #0,a1
    46ec:	670c           	beq.s 46fa <FreeDisplay+0x24>
    46ee:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    46f4:	2003           	move.l d3,d0
    46f6:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
    46fa:	2279 0000 7e16 	movea.l 7e16 <Copperlist2>,a1
    4700:	b2fc 0000      	cmpa.w #0,a1
    4704:	670c           	beq.s 4712 <FreeDisplay+0x3c>
    4706:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    470c:	2003           	move.l d3,d0
    470e:	4eae ff2e      	jsr -210(a6)
  if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
    4712:	2279 0000 7e12 	movea.l 7e12 <Bitplane1>,a1
    4718:	b2fc 0000      	cmpa.w #0,a1
    471c:	670c           	beq.s 472a <FreeDisplay+0x54>
    471e:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    4724:	2002           	move.l d2,d0
    4726:	4eae ff2e      	jsr -210(a6)
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);
    472a:	2279 0000 7e06 	movea.l 7e06 <Bitplane2>,a1
    4730:	b2fc 0000      	cmpa.w #0,a1
    4734:	670c           	beq.s 4742 <FreeDisplay+0x6c>
    4736:	2c79 0000 7e26 	movea.l 7e26 <SysBase>,a6
    473c:	2002           	move.l d2,d0
    473e:	4eae ff2e      	jsr -210(a6)
}
    4742:	4cdf 400c      	movem.l (sp)+,d2-d3/a6
    4746:	4e75           	rts

00004748 <WaitVbl>:
void WaitVbl() {
    4748:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    474a:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb43f>,d0
    4750:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
    4752:	2017           	move.l (sp),d0
    4754:	0280 0001 ff00 	andi.l #130816,d0
    475a:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
    475c:	2017           	move.l (sp),d0
    475e:	0c80 0001 3700 	cmpi.l #79616,d0
    4764:	67e4           	beq.s 474a <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
    4766:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.e9862530+0xddb43f>,d0
    476c:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
    4770:	202f 0004      	move.l 4(sp),d0
    4774:	0280 0001 ff00 	andi.l #130816,d0
    477a:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
    477e:	202f 0004      	move.l 4(sp),d0
    4782:	0c80 0001 3700 	cmpi.l #79616,d0
    4788:	66dc           	bne.s 4766 <WaitVbl+0x1e>
}
    478a:	508f           	addq.l #8,sp
    478c:	4e75           	rts

0000478e <memcpy>:
{
    478e:	48e7 3820      	movem.l d2-d4/a2,-(sp)
    4792:	202f 0014      	move.l 20(sp),d0
    4796:	226f 0018      	movea.l 24(sp),a1
    479a:	222f 001c      	move.l 28(sp),d1
	while(len--)
    479e:	2601           	move.l d1,d3
    47a0:	5383           	subq.l #1,d3
    47a2:	4a81           	tst.l d1
    47a4:	6762           	beq.s 4808 <memcpy+0x7a>
    47a6:	2040           	movea.l d0,a0
    47a8:	5888           	addq.l #4,a0
    47aa:	b1c9           	cmpa.l a1,a0
    47ac:	53c2           	sl.s d2
    47ae:	4402           	neg.b d2
    47b0:	41e9 0004      	lea 4(a1),a0
    47b4:	b1c0           	cmpa.l d0,a0
    47b6:	53c4           	sl.s d4
    47b8:	4404           	neg.b d4
    47ba:	8404           	or.b d4,d2
    47bc:	7808           	moveq #8,d4
    47be:	b883           	cmp.l d3,d4
    47c0:	55c4           	sc.s d4
    47c2:	4404           	neg.b d4
    47c4:	c404           	and.b d4,d2
    47c6:	6746           	beq.s 480e <memcpy+0x80>
    47c8:	2409           	move.l a1,d2
    47ca:	8480           	or.l d0,d2
    47cc:	7803           	moveq #3,d4
    47ce:	c484           	and.l d4,d2
    47d0:	663c           	bne.s 480e <memcpy+0x80>
    47d2:	2049           	movea.l a1,a0
    47d4:	2440           	movea.l d0,a2
    47d6:	74fc           	moveq #-4,d2
    47d8:	c481           	and.l d1,d2
    47da:	d489           	add.l a1,d2
		*d++ = *s++;
    47dc:	24d8           	move.l (a0)+,(a2)+
    47de:	b488           	cmp.l a0,d2
    47e0:	66fa           	bne.s 47dc <memcpy+0x4e>
    47e2:	74fc           	moveq #-4,d2
    47e4:	c481           	and.l d1,d2
    47e6:	2040           	movea.l d0,a0
    47e8:	d1c2           	adda.l d2,a0
    47ea:	d3c2           	adda.l d2,a1
    47ec:	9682           	sub.l d2,d3
    47ee:	b481           	cmp.l d1,d2
    47f0:	6716           	beq.s 4808 <memcpy+0x7a>
    47f2:	1091           	move.b (a1),(a0)
	while(len--)
    47f4:	4a83           	tst.l d3
    47f6:	6710           	beq.s 4808 <memcpy+0x7a>
		*d++ = *s++;
    47f8:	1169 0001 0001 	move.b 1(a1),1(a0)
	while(len--)
    47fe:	5383           	subq.l #1,d3
    4800:	6706           	beq.s 4808 <memcpy+0x7a>
		*d++ = *s++;
    4802:	1169 0002 0002 	move.b 2(a1),2(a0)
}
    4808:	4cdf 041c      	movem.l (sp)+,d2-d4/a2
    480c:	4e75           	rts
    480e:	2040           	movea.l d0,a0
    4810:	d289           	add.l a1,d1
		*d++ = *s++;
    4812:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    4814:	b289           	cmp.l a1,d1
    4816:	67f0           	beq.s 4808 <memcpy+0x7a>
		*d++ = *s++;
    4818:	10d9           	move.b (a1)+,(a0)+
	while(len--)
    481a:	b289           	cmp.l a1,d1
    481c:	66f4           	bne.s 4812 <memcpy+0x84>
    481e:	60e8           	bra.s 4808 <memcpy+0x7a>

00004820 <memset>:
{
    4820:	48e7 3f30      	movem.l d2-d7/a2-a3,-(sp)
    4824:	202f 0024      	move.l 36(sp),d0
    4828:	2a2f 0028      	move.l 40(sp),d5
    482c:	226f 002c      	movea.l 44(sp),a1
	while(len-- > 0)
    4830:	2809           	move.l a1,d4
    4832:	5384           	subq.l #1,d4
    4834:	b2fc 0000      	cmpa.w #0,a1
    4838:	6f00 00b0      	ble.w 48ea <memset+0xca>
    483c:	1e05           	move.b d5,d7
    483e:	2200           	move.l d0,d1
    4840:	4481           	neg.l d1
    4842:	7403           	moveq #3,d2
    4844:	c282           	and.l d2,d1
    4846:	7c05           	moveq #5,d6
		*ptr++ = val;
    4848:	2440           	movea.l d0,a2
    484a:	bc84           	cmp.l d4,d6
    484c:	646a           	bcc.s 48b8 <memset+0x98>
    484e:	4a81           	tst.l d1
    4850:	6724           	beq.s 4876 <memset+0x56>
    4852:	14c5           	move.b d5,(a2)+
	while(len-- > 0)
    4854:	5384           	subq.l #1,d4
    4856:	7401           	moveq #1,d2
    4858:	b481           	cmp.l d1,d2
    485a:	671a           	beq.s 4876 <memset+0x56>
		*ptr++ = val;
    485c:	2440           	movea.l d0,a2
    485e:	548a           	addq.l #2,a2
    4860:	2040           	movea.l d0,a0
    4862:	1145 0001      	move.b d5,1(a0)
	while(len-- > 0)
    4866:	5384           	subq.l #1,d4
    4868:	7403           	moveq #3,d2
    486a:	b481           	cmp.l d1,d2
    486c:	6608           	bne.s 4876 <memset+0x56>
		*ptr++ = val;
    486e:	528a           	addq.l #1,a2
    4870:	1145 0002      	move.b d5,2(a0)
	while(len-- > 0)
    4874:	5384           	subq.l #1,d4
    4876:	2609           	move.l a1,d3
    4878:	9681           	sub.l d1,d3
    487a:	7c00           	moveq #0,d6
    487c:	1c05           	move.b d5,d6
    487e:	2406           	move.l d6,d2
    4880:	4842           	swap d2
    4882:	4242           	clr.w d2
    4884:	2042           	movea.l d2,a0
    4886:	2406           	move.l d6,d2
    4888:	e14a           	lsl.w #8,d2
    488a:	4842           	swap d2
    488c:	4242           	clr.w d2
    488e:	e18e           	lsl.l #8,d6
    4890:	2646           	movea.l d6,a3
    4892:	2c08           	move.l a0,d6
    4894:	8486           	or.l d6,d2
    4896:	2c0b           	move.l a3,d6
    4898:	8486           	or.l d6,d2
    489a:	1407           	move.b d7,d2
    489c:	2040           	movea.l d0,a0
    489e:	d1c1           	adda.l d1,a0
    48a0:	72fc           	moveq #-4,d1
    48a2:	c283           	and.l d3,d1
    48a4:	d288           	add.l a0,d1
		*ptr++ = val;
    48a6:	20c2           	move.l d2,(a0)+
    48a8:	b1c1           	cmpa.l d1,a0
    48aa:	66fa           	bne.s 48a6 <memset+0x86>
    48ac:	72fc           	moveq #-4,d1
    48ae:	c283           	and.l d3,d1
    48b0:	d5c1           	adda.l d1,a2
    48b2:	9881           	sub.l d1,d4
    48b4:	b283           	cmp.l d3,d1
    48b6:	6732           	beq.s 48ea <memset+0xca>
    48b8:	1485           	move.b d5,(a2)
	while(len-- > 0)
    48ba:	4a84           	tst.l d4
    48bc:	6f2c           	ble.s 48ea <memset+0xca>
		*ptr++ = val;
    48be:	1545 0001      	move.b d5,1(a2)
	while(len-- > 0)
    48c2:	7201           	moveq #1,d1
    48c4:	b284           	cmp.l d4,d1
    48c6:	6c22           	bge.s 48ea <memset+0xca>
		*ptr++ = val;
    48c8:	1545 0002      	move.b d5,2(a2)
	while(len-- > 0)
    48cc:	7402           	moveq #2,d2
    48ce:	b484           	cmp.l d4,d2
    48d0:	6c18           	bge.s 48ea <memset+0xca>
		*ptr++ = val;
    48d2:	1545 0003      	move.b d5,3(a2)
	while(len-- > 0)
    48d6:	7c03           	moveq #3,d6
    48d8:	bc84           	cmp.l d4,d6
    48da:	6c0e           	bge.s 48ea <memset+0xca>
		*ptr++ = val;
    48dc:	1545 0004      	move.b d5,4(a2)
	while(len-- > 0)
    48e0:	7204           	moveq #4,d1
    48e2:	b284           	cmp.l d4,d1
    48e4:	6c04           	bge.s 48ea <memset+0xca>
		*ptr++ = val;
    48e6:	1545 0005      	move.b d5,5(a2)
}
    48ea:	4cdf 0cfc      	movem.l (sp)+,d2-d7/a2-a3
    48ee:	4e75           	rts

000048f0 <strlen>:
{
    48f0:	206f 0004      	movea.l 4(sp),a0
	unsigned long t=0;
    48f4:	7000           	moveq #0,d0
	while(*s++)
    48f6:	4a10           	tst.b (a0)
    48f8:	6708           	beq.s 4902 <strlen+0x12>
		t++;
    48fa:	5280           	addq.l #1,d0
	while(*s++)
    48fc:	4a30 0800      	tst.b (0,a0,d0.l)
    4900:	66f8           	bne.s 48fa <strlen+0xa>
}
    4902:	4e75           	rts

00004904 <__mulsi3>:
 
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	movew	sp@(4), d0	/* x0 -> d0 */
    4904:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    4908:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    490c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    4910:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    4914:	d041           	add.w d1,d0
	swap	d0
    4916:	4840           	swap d0
	clrw	d0
    4918:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    491a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    491e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    4922:	d081           	add.l d1,d0

	rts
    4924:	4e75           	rts

00004926 <__udivsi3>:

	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	movel	d2, sp@-
    4926:	2f02           	move.l d2,-(sp)
	movel	sp@(12), d1	/* d1 = divisor */
    4928:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    492c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    4930:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    4936:	6416           	bcc.s 494e <__udivsi3+0x28>
	movel	d0, d2
    4938:	2400           	move.l d0,d2
	clrw	d2
    493a:	4242           	clr.w d2
	swap	d2
    493c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    493e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    4940:	3002           	move.w d2,d0
	swap	d0
    4942:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    4944:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    4948:	84c1           	divu.w d1,d2
	movew	d2, d0
    494a:	3002           	move.w d2,d0
	jra	6f
    494c:	6030           	bra.s 497e <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    494e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    4950:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    4952:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    4954:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    495a:	64f4           	bcc.s 4950 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    495c:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    495e:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    4964:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    4966:	c2c0           	mulu.w d0,d1
	swap	d2
    4968:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    496a:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    496c:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    496e:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    4970:	660a           	bne.s 497c <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    4972:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    4974:	6506           	bcs.s 497c <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    4976:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    497a:	6302           	bls.s 497e <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    497c:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    497e:	241f           	move.l (sp)+,d2
	rts
    4980:	4e75           	rts

00004982 <__divsi3>:

	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	movel	d2, sp@-
    4982:	2f02           	move.l d2,-(sp)

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    4984:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    4986:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    498a:	6a04           	bpl.s 4990 <__divsi3+0xe>
	negl	d1
    498c:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    498e:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    4990:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    4994:	6a04           	bpl.s 499a <__divsi3+0x18>
	negl	d0
    4996:	4480           	neg.l d0
	negb	d2
    4998:	4402           	neg.b d2

2:	movel	d1, sp@-
    499a:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    499c:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    499e:	6186           	bsr.s 4926 <__udivsi3>
	addql	IMM (8), sp
    49a0:	508f           	addq.l #8,sp

	tstb	d2
    49a2:	4a02           	tst.b d2
	jpl	3f
    49a4:	6a02           	bpl.s 49a8 <__divsi3+0x26>
	negl	d0
    49a6:	4480           	neg.l d0

3:	movel	sp@+, d2
    49a8:	241f           	move.l (sp)+,d2
	rts
    49aa:	4e75           	rts

000049ac <__modsi3>:

	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    49ac:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    49b0:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    49b4:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    49b6:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__divsi3)
    49b8:	61c8           	bsr.s 4982 <__divsi3>
	addql	IMM (8), sp
    49ba:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    49bc:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    49c0:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    49c2:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    49c4:	6100 ff3e      	bsr.w 4904 <__mulsi3>
	addql	IMM (8), sp
    49c8:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    49ca:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    49ce:	9280           	sub.l d0,d1
	movel	d1, d0
    49d0:	2001           	move.l d1,d0
	rts
    49d2:	4e75           	rts

000049d4 <__umodsi3>:

	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	movel	sp@(8), d1	/* d1 = divisor */
    49d4:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    49d8:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    49dc:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    49de:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)
    49e0:	6100 ff44      	bsr.w 4926 <__udivsi3>
	addql	IMM (8), sp
    49e4:	508f           	addq.l #8,sp
	movel	sp@(8), d1	/* d1 = divisor */
    49e6:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    49ea:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    49ec:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    49ee:	6100 ff14      	bsr.w 4904 <__mulsi3>
	addql	IMM (8), sp
    49f2:	508f           	addq.l #8,sp
	movel	sp@(4), d1	/* d1 = dividend */
    49f4:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    49f8:	9280           	sub.l d0,d1
	movel	d1, d0
    49fa:	2001           	move.l d1,d0
	rts
    49fc:	4e75           	rts

000049fe <KPutCharX>:
	.text
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
    move.l  a6, -(sp)
    49fe:	2f0e           	move.l a6,-(sp)
    move.l  4.w, a6
    4a00:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    4a04:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    4a08:	2c5f           	movea.l (sp)+,a6
    rts
    4a0a:	4e75           	rts

00004a0c <PutChar>:
	.text
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	move.b d0, (a3)+
    4a0c:	16c0           	move.b d0,(a3)+
	rts
    4a0e:	4e75           	rts

00004a10 <saveregs>:
	...

00004a4c <font2distance>:
    4a4c:	0505           	btst d2,d5
    4a4e:	0505           	btst d2,d5
    4a50:	0505           	btst d2,d5
    4a52:	0505           	btst d2,d5
    4a54:	0505           	btst d2,d5
#define pc REG (pc)

saveregs: .dcb.b 60

font2distance:
  dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 //Ascii  32 -  41
    4a56:	0505           	btst d2,d5
    4a58:	0505           	btst d2,d5
    4a5a:	0005 0505      	ori.b #5,d5
    4a5e:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 0, 5, 5, 5, 5, 5 //Ascii  42 -  51
    4a60:	0505           	btst d2,d5
    4a62:	0505           	btst d2,d5
    4a64:	0505           	btst d2,d5
    4a66:	0505           	btst d2,d5
    4a68:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  52 -  61
    4a6a:	0505           	btst d2,d5
    4a6c:	0505           	btst d2,d5
    4a6e:	0505           	btst d2,d5
    4a70:	0505           	btst d2,d5
    4a72:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  62 -  71
    4a74:	0500           	btst d2,d0
    4a76:	0505           	btst d2,d5
    4a78:	0505           	btst d2,d5
    4a7a:	0505           	btst d2,d5
    4a7c:	0505           	btst d2,d5
	dc.b 5, 0, 5, 5, 5, 5, 5, 5, 5, 5	//Ascii  72 -  81
    4a7e:	0505           	btst d2,d5
    4a80:	0505           	btst d2,d5
    4a82:	0505           	btst d2,d5
    4a84:	0505           	btst d2,d5
    4a86:	0305           	btst d1,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 3, 5	//Ascii  82 -  91
    4a88:	0505           	btst d2,d5
    4a8a:	0505           	btst d2,d5
    4a8c:	0503           	btst d2,d3
    4a8e:	0505           	btst d2,d5
    4a90:	0502           	btst d2,d2
	dc.b 5, 5, 5, 5, 5, 3, 5, 5, 5, 2	//Ascii  92 - 101
    4a92:	0505           	btst d2,d5
    4a94:	0500           	btst d2,d0
    4a96:	0505           	btst d2,d5
    4a98:	0005 0502      	ori.b #2,d5
	dc.b 5, 5, 5, 0, 5, 5, 0, 5, 5, 2	//Ascii 102 - 111
    4a9c:	0505           	btst d2,d5
    4a9e:	0503           	btst d2,d3
    4aa0:	0205 0507      	andi.b #7,d5
    4aa4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 3, 2, 5, 5, 7, 5, 5	//Ascii 112 - 121
    4aa6:	0505           	btst d2,d5
    4aa8:	0505           	btst d2,d5
    4aaa:	0505           	btst d2,d5
    4aac:	0505           	btst d2,d5
    4aae:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4ab0:	0505           	btst d2,d5
    4ab2:	0505           	btst d2,d5
    4ab4:	0505           	btst d2,d5
    4ab6:	0505           	btst d2,d5
    4ab8:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4aba:	0505           	btst d2,d5
    4abc:	0505           	btst d2,d5
    4abe:	0505           	btst d2,d5
    4ac0:	0505           	btst d2,d5
    4ac2:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4ac4:	0505           	btst d2,d5
    4ac6:	0505           	btst d2,d5
    4ac8:	0505           	btst d2,d5
    4aca:	0505           	btst d2,d5
    4acc:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4ace:	0505           	btst d2,d5
    4ad0:	0505           	btst d2,d5
    4ad2:	0505           	btst d2,d5
    4ad4:	0505           	btst d2,d5
    4ad6:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4ad8:	0505           	btst d2,d5
    4ada:	0505           	btst d2,d5
    4adc:	0505           	btst d2,d5
    4ade:	0505           	btst d2,d5
    4ae0:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4ae2:	0505           	btst d2,d5
    4ae4:	0505           	btst d2,d5
    4ae6:	0505           	btst d2,d5
    4ae8:	0505           	btst d2,d5
    4aea:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4aec:	0505           	btst d2,d5
    4aee:	0505           	btst d2,d5
    4af0:	0505           	btst d2,d5
    4af2:	0505           	btst d2,d5
    4af4:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4af6:	0505           	btst d2,d5
    4af8:	0505           	btst d2,d5
    4afa:	0505           	btst d2,d5
    4afc:	0505           	btst d2,d5
    4afe:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b00:	0505           	btst d2,d5
    4b02:	0505           	btst d2,d5
    4b04:	0505           	btst d2,d5
    4b06:	0505           	btst d2,d5
    4b08:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b0a:	0505           	btst d2,d5
    4b0c:	0505           	btst d2,d5
    4b0e:	0505           	btst d2,d5
    4b10:	0505           	btst d2,d5
    4b12:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b14:	0505           	btst d2,d5
    4b16:	0505           	btst d2,d5
    4b18:	0505           	btst d2,d5
    4b1a:	0505           	btst d2,d5
    4b1c:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b1e:	0505           	btst d2,d5
    4b20:	0505           	btst d2,d5
    4b22:	0505           	btst d2,d5
    4b24:	0505           	btst d2,d5
    4b26:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b28:	0505           	btst d2,d5
    4b2a:	0505           	btst d2,d5
    4b2c:	0505           	btst d2,d5
    4b2e:	0505           	btst d2,d5
    4b30:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b32:	0505           	btst d2,d5
    4b34:	0505           	btst d2,d5
    4b36:	0505           	btst d2,d5
    4b38:	0505           	btst d2,d5
    4b3a:	0505           	btst d2,d5
	dc.b 5, 5, 5, 5, 5, 5, 5, 5, 5, 5
    4b3c:	0505           	btst d2,d5
    4b3e:	0505           	btst d2,d5
    4b40:	0505           	btst d2,d5
    4b42:	0505           	btst d2,d5
    4b44:	0505           	btst d2,d5

00004b46 <__PutChar>:

	.text
	FUNC(__PutChar2)
	.globl	SYM (__PutChar2)
SYM (__PutChar):
  move.b d0,(a3)+
    4b46:	16c0           	move.b d0,(a3)+
  RTS
    4b48:	4e75           	rts

00004b4a <__WriteText>:

	.text
	FUNC(__WriteText)
	.globl	SYM (__WriteText)
SYM (__WriteText):
  movem.l d0-d7/a0-a6, saveregs
    4b4a:	48f9 7fff 0000 	movem.l d0-a6,4a10 <saveregs>
    4b50:	4a10 
  lea 0xdff000,a5
    4b52:	4bf9 00df f000 	lea dff000 <gcc8_c_support.c.e9862530+0xddb43b>,a5
  move.l sp@(4),a0  //Fontlocation
    4b58:	206f 0004      	movea.l 4(sp),a0
  move.l sp@(8),a3  //Destination
    4b5c:	266f 0008      	movea.l 8(sp),a3
  move.l sp@(12),a2 //Textlocation
    4b60:	246f 000c      	movea.l 12(sp),a2
  sub.l  d3,d3      //Number of rows = 1
    4b64:	9683           	sub.l d3,d3
  btst #6,2(a5)     //Wait for blitter to finish
    4b66:	082d 0006 0002 	btst #6,2(a5)

00004b6c <st2wblit>:
st2wblit:
	btst	#6,2(a5)
    4b6c:	082d 0006 0002 	btst #6,2(a5)
	bne.s	st2wblit
    4b72:	66f8           	bne.s 4b6c <st2wblit>

00004b74 <PRINTRIGA2>:

PRINTRIGA2:
	MOVEQ	#25,d0      // Number of characters per row: 26
    4b74:	7019           	moveq #25,d0
	sub.l d5,d5      
    4b76:	9a85           	sub.l d5,d5

00004b78 <PRINTCHAR3>:
PRINTCHAR3:

	sub.l	d2,d2		    //reset d2
    4b78:	9482           	sub.l d2,d2
	MOVE.B	(a2)+,d2	//Prossimo carattere in d2
    4b7a:	141a           	move.b (a2)+,d2
	SUB.B	#0x20,d2		//Add 32 to get Ascii char
    4b7c:	0402 0020      	subi.b #32,d2

	sub.l  a6, a6		  //Fetch width of next character
    4b80:	9dce           	suba.l a6,a6
	move.l d2, a6
    4b82:	2c42           	movea.l d2,a6
	add.l	 #font2distance, a6	
    4b84:	ddfc 0000 4a4c 	adda.l #19020,a6

	LSL  	#4,d2 	    //Fetch next char
    4b8a:	e94a           	lsl.w #4,d2
	MOVE.L	d2,a4
    4b8c:	2842           	movea.l d2,a4


	move.l  #0,d4
    4b8e:	7800           	moveq #0,d4
	ADD.L	  a0,a4	  //Get character in font
    4b90:	d9c8           	adda.l a0,a4

	move.w  (a4), d4
    4b92:	3814           	move.w (a4),d4
	swap	d4
    4b94:	4844           	swap d4
	lsr.l	d5, d4
    4b96:	eaac           	lsr.l d5,d4
	or.l	d4, (a3)
    4b98:	8993           	or.l d4,(a3)
	clr.l	d4
    4b9a:	4284           	clr.l d4
	move.w  2(a4), d4
    4b9c:	382c 0002      	move.w 2(a4),d4
	swap.w  d4
    4ba0:	4844           	swap d4
	lsr.l	d5, d4
    4ba2:	eaac           	lsr.l d5,d4
	or.l	d4, 80(a3)
    4ba4:	89ab 0050      	or.l d4,80(a3)
	clr.l	d4
    4ba8:	4284           	clr.l d4
	move.w  4(a4), d4
    4baa:	382c 0004      	move.w 4(a4),d4
	swap	d4
    4bae:	4844           	swap d4
	lsr.l	d5, d4
    4bb0:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*2(a3)
    4bb2:	89ab 00a0      	or.l d4,160(a3)
	clr.l	d4
    4bb6:	4284           	clr.l d4
	move.w  6(a4), d4
    4bb8:	382c 0006      	move.w 6(a4),d4
	swap	d4
    4bbc:	4844           	swap d4
	lsr.l	d5, d4
    4bbe:	eaac           	lsr.l d5,d4
	or.l	d4, 80*3(a3)
    4bc0:	89ab 00f0      	or.l d4,240(a3)
	clr.l	d4
    4bc4:	4284           	clr.l d4
	move.w  8(a4), d4
    4bc6:	382c 0008      	move.w 8(a4),d4
	swap	d4
    4bca:	4844           	swap d4
	lsr.l	d5, d4
    4bcc:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*4(a3)
    4bce:	89ab 0140      	or.l d4,320(a3)
	clr.l	d4	
    4bd2:	4284           	clr.l d4
	move.w  10(a4), d4
    4bd4:	382c 000a      	move.w 10(a4),d4
	swap	d4
    4bd8:	4844           	swap d4
	lsr.l	d5, d4
    4bda:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*5(a3)
    4bdc:	89ab 0190      	or.l d4,400(a3)
	clr.l	d4
    4be0:	4284           	clr.l d4
	move.w  12(a4), d4
    4be2:	382c 000c      	move.w 12(a4),d4
	swap	d4
    4be6:	4844           	swap d4
	lsr.l	d5, d4
    4be8:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*6(a3)
    4bea:	89ab 01e0      	or.l d4,480(a3)
	clr.l	d4
    4bee:	4284           	clr.l d4
	move.w  14(a4), d4
    4bf0:	382c 000e      	move.w 14(a4),d4
	swap	d4
    4bf4:	4844           	swap d4
	lsr.l	d5, d4
    4bf6:	eaac           	lsr.l d5,d4
	or.l  	d4, 80*7(a3)    
    4bf8:	89ab 0230      	or.l d4,560(a3)
	clr.l	d4
    4bfc:	4284           	clr.l d4

	add.b   (a6), d5
    4bfe:	da16           	add.b (a6),d5
	cmp.w   #8,d5
    4c00:	0c45 0008      	cmpi.w #8,d5
	bcs	noadditionalchar
    4c04:	6500 0006      	bcs.w 4c0c <noadditionalchar>
	addq.w  #1, a3
    4c08:	524b           	addq.w #1,a3
	sub.w   #8,d5
    4c0a:	5145           	subq.w #8,d5

00004c0c <noadditionalchar>:

noadditionalchar:
	ADDQ.w	#1,a3         //A3+2,avanziamo di 16 bit (PROSSIMO CARATTERE)
    4c0c:	524b           	addq.w #1,a3
	DBRA	d0 ,PRINTCHAR3	  //STAMPIAMO D0 (20) CARATTERI PER RIGA
    4c0e:	51c8 ff68      	dbf d0,4b78 <PRINTCHAR3>

  ADD.W	#80*19,a3	      //ANDIAMO A CAPO
    4c12:	d6fc 05f0      	adda.w #1520,a3
	//ci spostiamo in basso di 19 righe.

	DBRA	d3,PRINTRIGA2	  //FACCIAMO D3 RIGHE
    4c16:	51cb ff5c      	dbf d3,4b74 <PRINTRIGA2>
  movem.l saveregs,d0-d7/a0-a6
    4c1a:	4cfa 7fff fdf2 	movem.l 4a10 <saveregs>(pc),d0-a6

	RTS
    4c20:	4e75           	rts
