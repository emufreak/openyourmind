
a.mingw.elf:     file format elf32-m68k


Disassembly of section .text:

00000000 <_start>:
extern void (*__init_array_start[])() __attribute__((weak));
extern void (*__init_array_end[])() __attribute__((weak));
extern void (*__fini_array_start[])() __attribute__((weak));
extern void (*__fini_array_end[])() __attribute__((weak));

__attribute__((used)) __attribute__((section(".text.unlikely"))) void _start() {
       0:	518f           	subq.l #8,sp
	// initialize globals, ctors etc.
	unsigned long count;
	unsigned long i;

	count = __preinit_array_end - __preinit_array_start;
       2:	203c 0000 2000 	move.l #8192,d0
       8:	0480 0000 2000 	subi.l #8192,d0
       e:	e480           	asr.l #2,d0
      10:	2e80           	move.l d0,(sp)
	for (i = 0; i < count; i++)
      12:	42af 0004      	clr.l 4(sp)
      16:	601a           	bra.s 32 <_start+0x32>
		__preinit_array_start[i]();
      18:	202f 0004      	move.l 4(sp),d0
      1c:	d080           	add.l d0,d0
      1e:	2240           	movea.l d0,a1
      20:	d3c0           	adda.l d0,a1
      22:	41f9 0000 2000 	lea 2000 <ClColor>,a0
      28:	2071 8800      	movea.l (0,a1,a0.l),a0
      2c:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      2e:	52af 0004      	addq.l #1,4(sp)
      32:	202f 0004      	move.l 4(sp),d0
      36:	b097           	cmp.l (sp),d0
      38:	65de           	bcs.s 18 <_start+0x18>

	count = __init_array_end - __init_array_start;
      3a:	203c 0000 2000 	move.l #8192,d0
      40:	0480 0000 2000 	subi.l #8192,d0
      46:	e480           	asr.l #2,d0
      48:	2e80           	move.l d0,(sp)
	for (i = 0; i < count; i++)
      4a:	42af 0004      	clr.l 4(sp)
      4e:	601a           	bra.s 6a <_start+0x6a>
		__init_array_start[i]();
      50:	202f 0004      	move.l 4(sp),d0
      54:	d080           	add.l d0,d0
      56:	2240           	movea.l d0,a1
      58:	d3c0           	adda.l d0,a1
      5a:	41f9 0000 2000 	lea 2000 <ClColor>,a0
      60:	2071 8800      	movea.l (0,a1,a0.l),a0
      64:	4e90           	jsr (a0)
	for (i = 0; i < count; i++)
      66:	52af 0004      	addq.l #1,4(sp)
      6a:	202f 0004      	move.l 4(sp),d0
      6e:	b097           	cmp.l (sp),d0
      70:	65de           	bcs.s 50 <_start+0x50>

	main();
      72:	4eb9 0000 00b4 	jsr b4 <main>

	// call dtors
	count = __fini_array_end - __fini_array_start;
      78:	203c 0000 2000 	move.l #8192,d0
      7e:	0480 0000 2000 	subi.l #8192,d0
      84:	e480           	asr.l #2,d0
      86:	2e80           	move.l d0,(sp)
	for (i = count; i > 0; i--)
      88:	2f57 0004      	move.l (sp),4(sp)
      8c:	601c           	bra.s aa <_start+0xaa>
		__fini_array_start[i - 1]();
      8e:	202f 0004      	move.l 4(sp),d0
      92:	5380           	subq.l #1,d0
      94:	d080           	add.l d0,d0
      96:	2240           	movea.l d0,a1
      98:	d3c0           	adda.l d0,a1
      9a:	41f9 0000 2000 	lea 2000 <ClColor>,a0
      a0:	2071 8800      	movea.l (0,a1,a0.l),a0
      a4:	4e90           	jsr (a0)
	for (i = count; i > 0; i--)
      a6:	53af 0004      	subq.l #1,4(sp)
      aa:	4aaf 0004      	tst.l 4(sp)
      ae:	66de           	bne.s 8e <_start+0x8e>
}
      b0:	508f           	addq.l #8,sp
      b2:	4e75           	rts

000000b4 <main>:
	return copListEnd;
}

//#define a3 REG (a3)

int main() {
      b4:	518f           	subq.l #8,sp
      b6:	48e7 313e      	movem.l d2-d3/d7/a2-a6,-(sp)

	ULONG *bp = 0x100;
	*bp = 0;
      ba:	42b8 0100      	clr.l 100 <main+0x4c>
	//Get AMOS Params
	register ULONG *asmparams;
	asm("\t move.l %%a3,%0" : "=r"(asmparams));
      be:	204b           	movea.l a3,a0
	Zoom_Rawchip = *asmparams++;
      c0:	23d0 0000 33de 	move.l (a0),33de <Zoom_Rawchip>
	Zoom_Rawfast = *asmparams;
      c6:	23e8 0004 0000 	move.l 4(a0),33da <Zoom_Rawfast>
      cc:	33da 

	ULONG tmp = 4;
    SysBase = *((struct ExecBase**)tmp);
	hw = (struct Custom*)0xdff000;
      ce:	23fc 00df f000 	move.l #14675968,3264 <hw>
      d4:	0000 3264 

	SysBase = *((struct ExecBase**)4UL);
      d8:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      dc:	23ce 0000 33d6 	move.l a6,33d6 <SysBase>
	custom = (struct Custom*)0xdff000;

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      e2:	43f9 0000 17f4 	lea 17f4 <c2p1x1_8_c5_gen_pixels+0xb2>,a1
      e8:	7000           	moveq #0,d0
      ea:	4eae fdd8      	jsr -552(a6)
	if (!GfxBase)
      ee:	4a80           	tst.l d0
      f0:	6700 0330      	beq.w 422 <main+0x36e>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      f4:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
      fa:	43f9 0000 1805 	lea 1805 <c2p1x1_8_c5_gen_pixels+0xc3>,a1
     100:	7000           	moveq #0,d0
     102:	4eae fdd8      	jsr -552(a6)
     106:	23c0 0000 33d2 	move.l d0,33d2 <DOSBase>
	if (!DOSBase)
     10c:	6700 027a      	beq.w 388 <main+0x2d4>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     110:	4879 0000 1811 	pea 1811 <c2p1x1_8_c5_gen_pixels+0xcf>
     116:	4eb9 0000 0942 	jsr 942 <KPrintF>
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     11c:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     122:	4eae ffc4      	jsr -60(a6)
     126:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     12c:	2200           	move.l d0,d1
     12e:	243c 0000 182d 	move.l #6189,d2
     134:	760f           	moveq #15,d3
     136:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     13a:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     140:	7232           	moveq #50,d1
     142:	4eae ff3a      	jsr -198(a6)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     146:	3f7c 4e7a 0026 	move.w #20090,38(sp)
     14c:	3f7c 0801 0028 	move.w #2049,40(sp)
     152:	3f7c 4e73 002a 	move.w #20083,42(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     158:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     15e:	588f           	addq.l #4,sp
     160:	082e 0000 0129 	btst #0,297(a6)
     166:	6700 0282      	beq.w 3ea <main+0x336>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     16a:	7e22           	moveq #34,d7
     16c:	de8f           	add.l sp,d7
     16e:	cf8d           	exg d7,a5
     170:	4eae ffe2      	jsr -30(a6)
     174:	cf8d           	exg d7,a5
	VBR=GetVBR();
     176:	23c0 0000 33e2 	move.l d0,33e2 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     17c:	2079 0000 33e2 	movea.l 33e2 <VBR>,a0
     182:	2028 006c      	move.l 108(a0),d0
	//warpmode(0);

	TakeSystem();


	WaitVbl();
     186:	45f9 0000 0bcc 	lea bcc <WaitVbl>,a2
     18c:	4e92           	jsr (a2)
	
    hw->dmacon = 0b1000011111111111;
     18e:	2079 0000 3264 	movea.l 3264 <hw>,a0
     194:	317c 87ff 0096 	move.w #-30721,150(a0)
  /*Zoom_Rawchip = rawzoom_chip;
  Zoom_Rawfast = rawzoom_fast;*/

  int i = 0;
  for(;i<63;i++) {
    imgptrs[i] = Zoom_Rawfast + 56280*i;
     19a:	2039 0000 33da 	move.l 33da <Zoom_Rawfast>,d0
     1a0:	47f9 0000 3272 	lea 3272 <imgptrs>,a3
     1a6:	204b           	movea.l a3,a0
     1a8:	20c0           	move.l d0,(a0)+
  for(;i<63;i++) {
     1aa:	0680 0000 dbd8 	addi.l #56280,d0
     1b0:	b1fc 0000 336e 	cmpa.l #13166,a0
     1b6:	66f0           	bne.s 1a8 <main+0xf4>
  }

  for(;i<88;i++) {
    imgptrs[i] = Zoom_Rawchip + 56280*(i-63);
     1b8:	2039 0000 33de 	move.l 33de <Zoom_Rawchip>,d0
     1be:	223c 0000 33d2 	move.l #13266,d1
     1c4:	20c0           	move.l d0,(a0)+
  for(;i<88;i++) {
     1c6:	0680 0000 dbd8 	addi.l #56280,d0
     1cc:	b1c1           	cmpa.l d1,a0
     1ce:	66f4           	bne.s 1c4 <main+0x110>
  }

  Zoom_Counter = 0;
     1d0:	4279 0000 3270 	clr.w 3270 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     1d6:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     1dc:	7004           	moveq #4,d0
     1de:	7202           	moveq #2,d1
     1e0:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 15;
     1e4:	33fc 000f 0000 	move.w #15,326e <Zoom_LevelOf102Zoom>
     1ea:	326e 
  RemIntServer(INTB_VERTB, Zoom_vbint);
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
}
  
int Zoom_PrepareDisplay() {
  ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
     1ec:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     1f2:	203c 0000 dbd8 	move.l #56280,d0
     1f8:	7202           	moveq #2,d1
     1fa:	4eae fd54      	jsr -684(a6)
     1fe:	23c0 0000 3258 	move.l d0,3258 <ViewBuffer>
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);
     204:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     20a:	203c 0000 dbd8 	move.l #56280,d0
     210:	7202           	moveq #2,d1
     212:	4eae fd54      	jsr -684(a6)
     216:	23c0 0000 3254 	move.l d0,3254 <DrawBuffer>
  Utils_CopyMem( imgptrs[0], ViewBuffer, 14070);
     21c:	2413           	move.l (a3),d2
     21e:	2f39 0000 3258 	move.l 3258 <ViewBuffer>,-(sp)
     224:	2f02           	move.l d2,-(sp)
     226:	49f9 0000 0ba6 	lea ba6 <Utils_CopyMem.constprop.0>,a4
     22c:	4e94           	jsr (a4)
  Utils_CopyMem( imgptrs[0], DrawBuffer, 14070);
     22e:	2f39 0000 3254 	move.l 3254 <DrawBuffer>,-(sp)
     234:	2f02           	move.l d2,-(sp)
     236:	4e94           	jsr (a4)
  Copperlist1 = ClbuildZoom( );
     238:	4bf9 0000 0cba 	lea cba <ClbuildZoom>,a5
     23e:	4e95           	jsr (a5)
     240:	23c0 0000 324c 	move.l d0,324c <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     246:	4e95           	jsr (a5)
     248:	23c0 0000 3250 	move.l d0,3250 <Copperlist2>
  
  DrawCopper = Copperlist1;
     24e:	2239 0000 324c 	move.l 324c <Copperlist1>,d1
     254:	23c1 0000 325c 	move.l d1,325c <DrawCopper>
  ViewCopper = Copperlist2;
     25a:	23c0 0000 3260 	move.l d0,3260 <ViewCopper>
  Zoom_Shrink102( 15, Copperlist1);
     260:	2f01           	move.l d1,-(sp)
     262:	4878 000f      	pea f <_start+0xf>
     266:	4bf9 0000 06fe 	lea 6fe <Zoom_Shrink102>,a5
     26c:	4e95           	jsr (a5)
  Zoom_Shrink102( 15, Copperlist2);
     26e:	2f39 0000 3250 	move.l 3250 <Copperlist2>,-(sp)
     274:	4878 000f      	pea f <_start+0xf>
     278:	4e95           	jsr (a5)
  Zoom_LevelOfZoom = 1;
     27a:	33fc 0001 0000 	move.w #1,326c <Zoom_LevelOfZoom>
     280:	326c 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
     282:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     288:	7016           	moveq #22,d0
     28a:	223c 0001 0001 	move.l #65537,d1
     290:	4eae ff3a      	jsr -198(a6)
     294:	2240           	movea.l d0,a1
     296:	23c0 0000 33ce 	move.l d0,33ce <Zoom_vbint>
     29c:	4fef 0020      	lea 32(sp),sp
     2a0:	671a           	beq.s 2bc <main+0x208>
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
     2a2:	337c 02c4 0008 	move.w #708,8(a1)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
     2a8:	237c 0000 183d 	move.l #6205,10(a1)
     2ae:	000a 
    Zoom_vbint->is_Data = NULL;
     2b0:	42a9 000e      	clr.l 14(a1)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
     2b4:	237c 0000 1026 	move.l #4134,18(a1)
     2ba:	0012 
  AddIntServer( INTB_VERTB, Zoom_vbint);
     2bc:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     2c2:	7005           	moveq #5,d0
     2c4:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
     2c8:	2f39 0000 3260 	move.l 3260 <ViewCopper>,-(sp)
     2ce:	2f39 0000 3258 	move.l 3258 <ViewBuffer>,-(sp)
     2d4:	4bf9 0000 0c12 	lea c12 <Zoom_SetBplPointers>,a5
     2da:	4e95           	jsr (a5)
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
     2dc:	2f39 0000 325c 	move.l 325c <DrawCopper>,-(sp)
     2e2:	2f39 0000 3258 	move.l 3258 <ViewBuffer>,-(sp)
     2e8:	4e95           	jsr (a5)
  SwapCl();
     2ea:	4eb9 0000 0510 	jsr 510 <SwapCl>
        Utils_CopyMem(imgptrs[Zoom_Pic], DrawBuffer, 14070);  
     2f0:	2439 0000 323c 	move.l 323c <Zoom_Pic>,d2
     2f6:	4fef 0010      	lea 16(sp),sp
     2fa:	7602           	moveq #2,d3
      WaitVbl();
     2fc:	4e92           	jsr (a2)
      if( Zoom_DrawPicture == 1) {    
     2fe:	2039 0000 3240 	move.l 3240 <Zoom_DrawPicture>,d0
     304:	5380           	subq.l #1,d0
     306:	6742           	beq.s 34a <main+0x296>
      if(Zoom_Pic == 87 ) {
     308:	7057           	moveq #87,d0
     30a:	b082           	cmp.l d2,d0
     30c:	66ee           	bne.s 2fc <main+0x248>
        Zoom_Pic = 11;
     30e:	720b           	moveq #11,d1
     310:	23c1 0000 323c 	move.l d1,323c <Zoom_Pic>
  for(int i=0;i <2; i++)
     316:	740b           	moveq #11,d2
     318:	5383           	subq.l #1,d3
     31a:	6666           	bne.s 382 <main+0x2ce>
  RemIntServer(INTB_VERTB, Zoom_vbint);
     31c:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     322:	7005           	moveq #5,d0
     324:	2279 0000 33ce 	movea.l 33ce <Zoom_vbint>,a1
     32a:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     32e:	2f3c 0000 df20 	move.l #57120,-(sp)
     334:	4878 031c      	pea 31c <main+0x268>
     338:	4eb9 0000 0450 	jsr 450 <FreeDisplay>
     33e:	508f           	addq.l #8,sp
  	Zoom_InitRun();
	Zoom_Run();
	Zoom_Dealloc();
}
     340:	7000           	moveq #0,d0
     342:	4cdf 7c8c      	movem.l (sp)+,d2-d3/d7/a2-a6
     346:	508f           	addq.l #8,sp
     348:	4e75           	rts
        Utils_CopyMem(imgptrs[Zoom_Pic], DrawBuffer, 14070);  
     34a:	2f39 0000 3254 	move.l 3254 <DrawBuffer>,-(sp)
     350:	2002           	move.l d2,d0
     352:	d082           	add.l d2,d0
     354:	d080           	add.l d0,d0
     356:	2f33 0800      	move.l (0,a3,d0.l),-(sp)
     35a:	4e94           	jsr (a4)
        Zoom_DrawPicture = 0;
     35c:	7000           	moveq #0,d0
     35e:	23c0 0000 3240 	move.l d0,3240 <Zoom_DrawPicture>
        Zoom_Pic++;
     364:	5282           	addq.l #1,d2
     366:	23c2 0000 323c 	move.l d2,323c <Zoom_Pic>
      if(Zoom_Pic == 87 ) {
     36c:	508f           	addq.l #8,sp
     36e:	7257           	moveq #87,d1
     370:	b282           	cmp.l d2,d1
     372:	6688           	bne.s 2fc <main+0x248>
        Zoom_Pic = 11;
     374:	720b           	moveq #11,d1
     376:	23c1 0000 323c 	move.l d1,323c <Zoom_Pic>
  for(int i=0;i <2; i++)
     37c:	740b           	moveq #11,d2
     37e:	5383           	subq.l #1,d3
     380:	679a           	beq.s 31c <main+0x268>
     382:	7601           	moveq #1,d3
     384:	6000 ff76      	bra.w 2fc <main+0x248>
		Exit(0);
     388:	9dce           	suba.l a6,a6
     38a:	7200           	moveq #0,d1
     38c:	4eae ff70      	jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     390:	4879 0000 1811 	pea 1811 <c2p1x1_8_c5_gen_pixels+0xcf>
     396:	4eb9 0000 0942 	jsr 942 <KPrintF>
	Write(Output(), (APTR)"Hello console!\n", 15);
     39c:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     3a2:	4eae ffc4      	jsr -60(a6)
     3a6:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     3ac:	2200           	move.l d0,d1
     3ae:	243c 0000 182d 	move.l #6189,d2
     3b4:	760f           	moveq #15,d3
     3b6:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     3ba:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     3c0:	7232           	moveq #50,d1
     3c2:	4eae ff3a      	jsr -198(a6)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     3c6:	3f7c 4e7a 0026 	move.w #20090,38(sp)
     3cc:	3f7c 0801 0028 	move.w #2049,40(sp)
     3d2:	3f7c 4e73 002a 	move.w #20083,42(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     3d8:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     3de:	588f           	addq.l #4,sp
     3e0:	082e 0000 0129 	btst #0,297(a6)
     3e6:	6600 fd82      	bne.w 16a <main+0xb6>
	APTR vbr = 0;
     3ea:	7000           	moveq #0,d0
	VBR=GetVBR();
     3ec:	23c0 0000 33e2 	move.l d0,33e2 <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     3f2:	2079 0000 33e2 	movea.l 33e2 <VBR>,a0
     3f8:	2028 006c      	move.l 108(a0),d0
	WaitVbl();
     3fc:	45f9 0000 0bcc 	lea bcc <WaitVbl>,a2
     402:	4e92           	jsr (a2)
    hw->dmacon = 0b1000011111111111;
     404:	2079 0000 3264 	movea.l 3264 <hw>,a0
     40a:	317c 87ff 0096 	move.w #-30721,150(a0)
    imgptrs[i] = Zoom_Rawfast + 56280*i;
     410:	2039 0000 33da 	move.l 33da <Zoom_Rawfast>,d0
     416:	47f9 0000 3272 	lea 3272 <imgptrs>,a3
     41c:	204b           	movea.l a3,a0
     41e:	6000 fd88      	bra.w 1a8 <main+0xf4>
		Exit(0);
     422:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     428:	7200           	moveq #0,d1
     42a:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     42e:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     434:	43f9 0000 1805 	lea 1805 <c2p1x1_8_c5_gen_pixels+0xc3>,a1
     43a:	7000           	moveq #0,d0
     43c:	4eae fdd8      	jsr -552(a6)
     440:	23c0 0000 33d2 	move.l d0,33d2 <DOSBase>
	if (!DOSBase)
     446:	6600 fcc8      	bne.w 110 <main+0x5c>
     44a:	6000 ff3c      	bra.w 388 <main+0x2d4>
     44e:	4e71           	nop

00000450 <FreeDisplay>:
ULONG ClColor[] = { 0x1800000,0x1820db7,0x1840cdb,0x1860bb9,0x1880ab4,0x18a09a7,0x18c0875,0x18e0886,0x1900763,0x1920662,0x1940331,0x19608ad,0x1980272,0x19a0131,0x19c0463,0x19e0584,0x1a00342,0x1a20121,0x1a40222,
                    0x1a60110,0x1a80793,0x1aa0ab4,0x1ac09a7,0x1ae0cd5,0x1b00cc2,0x1b20886,0x1b40fff,0x1b60431,0x1b80db7,0x1ba0740,0x1bc0875,0x1be0ed9 };



void FreeDisplay( int clsize, int bplsize) {
     450:	4fef fff0      	lea -16(sp),sp
     454:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     456:	2039 0000 324c 	move.l 324c <Copperlist1>,d0
     45c:	6722           	beq.s 480 <FreeDisplay+0x30>
     45e:	2f79 0000 324c 	move.l 324c <Copperlist1>,16(sp)
     464:	0010 
     466:	2f6f 0018 000c 	move.l 24(sp),12(sp)
     46c:	2039 0000 33d6 	move.l 33d6 <SysBase>,d0
     472:	2c40           	movea.l d0,a6
     474:	226f 0010      	movea.l 16(sp),a1
     478:	202f 000c      	move.l 12(sp),d0
     47c:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     480:	2039 0000 3250 	move.l 3250 <Copperlist2>,d0
     486:	6722           	beq.s 4aa <FreeDisplay+0x5a>
     488:	2f79 0000 3250 	move.l 3250 <Copperlist2>,8(sp)
     48e:	0008 
     490:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     496:	2039 0000 33d6 	move.l 33d6 <SysBase>,d0
     49c:	2c40           	movea.l d0,a6
     49e:	226f 0008      	movea.l 8(sp),a1
     4a2:	202f 0004      	move.l 4(sp),d0
     4a6:	4eae ff2e      	jsr -210(a6)
  /*if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);*/
}
     4aa:	2c5f           	movea.l (sp)+,a6
     4ac:	4fef 0010      	lea 16(sp),sp
     4b0:	4e75           	rts

000004b2 <SetBplPointers>:

void SetBplPointers() {
     4b2:	4fef fff4      	lea -12(sp),sp
  UWORD highword = (ULONG)DrawBuffer >> 16;
     4b6:	2039 0000 3254 	move.l 3254 <DrawBuffer>,d0
     4bc:	4240           	clr.w d0
     4be:	4840           	swap d0
     4c0:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     4c4:	2039 0000 3254 	move.l 3254 <DrawBuffer>,d0
     4ca:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     4ce:	2f79 0000 325c 	move.l 325c <DrawCopper>,4(sp)
     4d4:	0004 
  copword[COPBPL1LOW] = lowword;
     4d6:	307c 0076      	movea.w #118,a0
     4da:	d1ef 0004      	adda.l 4(sp),a0
     4de:	30af 0008      	move.w 8(sp),(a0)
  copword[COPBPL1HIGH] = highword;
     4e2:	307c 0072      	movea.w #114,a0
     4e6:	d1ef 0004      	adda.l 4(sp),a0
     4ea:	30af 000a      	move.w 10(sp),(a0)
  
  ULONG tmp = (ULONG) DrawBuffer;
     4ee:	2039 0000 3254 	move.l 3254 <DrawBuffer>,d0
     4f4:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     4f6:	2039 0000 3258 	move.l 3258 <ViewBuffer>,d0
     4fc:	23c0 0000 3254 	move.l d0,3254 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     502:	2017           	move.l (sp),d0
     504:	23c0 0000 3258 	move.l d0,3258 <ViewBuffer>
}
     50a:	4fef 000c      	lea 12(sp),sp
     50e:	4e75           	rts

00000510 <SwapCl>:

void SwapCl() {
     510:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     512:	2039 0000 325c 	move.l 325c <DrawCopper>,d0
     518:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     51a:	2039 0000 3260 	move.l 3260 <ViewCopper>,d0
     520:	23c0 0000 325c 	move.l d0,325c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     526:	2017           	move.l (sp),d0
     528:	23c0 0000 3260 	move.l d0,3260 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     52e:	2039 0000 3260 	move.l 3260 <ViewCopper>,d0
     534:	2079 0000 3264 	movea.l 3264 <hw>,a0
     53a:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     53e:	2079 0000 3264 	movea.l 3264 <hw>,a0
     544:	2017           	move.l (sp),d0
     546:	3140 0088      	move.w d0,136(a0)
}
     54a:	588f           	addq.l #4,sp
     54c:	4e75           	rts

0000054e <Utils_CopyMem>:

__attribute__((optimize("O3")))
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     54e:	206f 0004      	movea.l 4(sp),a0
     552:	222f 000c      	move.l 12(sp),d1
  for( int i=0;i<size;i++) 
     556:	670e           	beq.s 566 <Utils_CopyMem+0x18>
     558:	226f 0008      	movea.l 8(sp),a1
     55c:	7000           	moveq #0,d0
    *destination++ = *source++;  
     55e:	22d8           	move.l (a0)+,(a1)+
  for( int i=0;i<size;i++) 
     560:	5280           	addq.l #1,d0
     562:	b081           	cmp.l d1,d0
     564:	66f8           	bne.s 55e <Utils_CopyMem+0x10>
}
     566:	4e75           	rts

00000568 <Utils_FillLong>:

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
     568:	518f           	subq.l #8,sp
  for( int i=0;i<lines; i++) {
     56a:	42af 0004      	clr.l 4(sp)
     56e:	6030           	bra.s 5a0 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
     570:	4297           	clr.l (sp)
     572:	6014           	bra.s 588 <Utils_FillLong+0x20>
      *target++ = pattern;
     574:	202f 000c      	move.l 12(sp),d0
     578:	2200           	move.l d0,d1
     57a:	5881           	addq.l #4,d1
     57c:	2f41 000c      	move.l d1,12(sp)
     580:	2040           	movea.l d0,a0
     582:	20af 0010      	move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
     586:	5297           	addq.l #1,(sp)
     588:	2017           	move.l (sp),d0
     58a:	b0af 0018      	cmp.l 24(sp),d0
     58e:	65e4           	bcs.s 574 <Utils_FillLong+0xc>
    target += mod;
     590:	202f 001c      	move.l 28(sp),d0
     594:	d080           	add.l d0,d0
     596:	d080           	add.l d0,d0
     598:	d1af 000c      	add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
     59c:	52af 0004      	addq.l #1,4(sp)
     5a0:	202f 0004      	move.l 4(sp),d0
     5a4:	b0af 0014      	cmp.l 20(sp),d0
     5a8:	65c6           	bcs.s 570 <Utils_FillLong+0x8>
  }
}
     5aa:	508f           	addq.l #8,sp
     5ac:	4e75           	rts

000005ae <MouseLeft>:

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     5ae:	207c 00bf e001 	movea.l #12574721,a0
     5b4:	1010           	move.b (a0),d0
     5b6:	1000           	move.b d0,d0
     5b8:	0280 0000 00ff 	andi.l #255,d0
     5be:	7240           	moveq #64,d1
     5c0:	c081           	and.l d1,d0
     5c2:	57c0           	seq d0
     5c4:	4400           	neg.b d0
     5c6:	1000           	move.b d0,d0
     5c8:	0240 00ff      	andi.w #255,d0
     5cc:	4e75           	rts

000005ce <MouseRight>:
     5ce:	207c 00df f016 	movea.l #14675990,a0
     5d4:	3010           	move.w (a0),d0
     5d6:	3000           	move.w d0,d0
     5d8:	0280 0000 ffff 	andi.l #65535,d0
     5de:	0280 0000 0400 	andi.l #1024,d0
     5e4:	57c0           	seq d0
     5e6:	4400           	neg.b d0
     5e8:	1000           	move.b d0,d0
     5ea:	0240 00ff      	andi.w #255,d0
     5ee:	4e75           	rts

000005f0 <Zoom_InsertShift>:
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
     5f0:	4fef fff4      	lea -12(sp),sp
     5f4:	2f02           	move.l d2,-(sp)
  for(int i = 0; i<6;i++) {
     5f6:	42af 000c      	clr.l 12(sp)
     5fa:	601e           	bra.s 61a <Zoom_InsertShift+0x2a>
    *copperlist = *values4shift++;
     5fc:	202f 0018      	move.l 24(sp),d0
     600:	2200           	move.l d0,d1
     602:	5481           	addq.l #2,d1
     604:	2f41 0018      	move.l d1,24(sp)
     608:	2040           	movea.l d0,a0
     60a:	3010           	move.w (a0),d0
     60c:	206f 0014      	movea.l 20(sp),a0
     610:	3080           	move.w d0,(a0)
    copperlist += 2;
     612:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<6;i++) {
     616:	52af 000c      	addq.l #1,12(sp)
     61a:	7005           	moveq #5,d0
     61c:	b0af 000c      	cmp.l 12(sp),d0
     620:	6cda           	bge.s 5fc <Zoom_InsertShift+0xc>
  }
  copperlist--;
     622:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     626:	222f 0018      	move.l 24(sp),d1
     62a:	2401           	move.l d1,d2
     62c:	5482           	addq.l #2,d2
     62e:	2f42 0018      	move.l d2,24(sp)
     632:	202f 0014      	move.l 20(sp),d0
     636:	2400           	move.l d0,d2
     638:	5482           	addq.l #2,d2
     63a:	2f42 0014      	move.l d2,20(sp)
     63e:	2041           	movea.l d1,a0
     640:	3210           	move.w (a0),d1
     642:	2040           	movea.l d0,a0
     644:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     646:	202f 0018      	move.l 24(sp),d0
     64a:	2200           	move.l d0,d1
     64c:	5481           	addq.l #2,d1
     64e:	2f41 0018      	move.l d1,24(sp)
     652:	2040           	movea.l d0,a0
     654:	3010           	move.w (a0),d0
     656:	206f 0014      	movea.l 20(sp),a0
     65a:	3080           	move.w d0,(a0)
  copperlist += 2;
     65c:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     660:	42af 0008      	clr.l 8(sp)
     664:	601e           	bra.s 684 <Zoom_InsertShift+0x94>
    *copperlist = *values4shift++;
     666:	202f 0018      	move.l 24(sp),d0
     66a:	2200           	move.l d0,d1
     66c:	5481           	addq.l #2,d1
     66e:	2f41 0018      	move.l d1,24(sp)
     672:	2040           	movea.l d0,a0
     674:	3010           	move.w (a0),d0
     676:	206f 0014      	movea.l 20(sp),a0
     67a:	3080           	move.w d0,(a0)
    copperlist += 2;
     67c:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<10;i++) {
     680:	52af 0008      	addq.l #1,8(sp)
     684:	7009           	moveq #9,d0
     686:	b0af 0008      	cmp.l 8(sp),d0
     68a:	6cda           	bge.s 666 <Zoom_InsertShift+0x76>
  }
  copperlist--;
     68c:	55af 0014      	subq.l #2,20(sp)
  *copperlist++ = *values4shift++;
     690:	222f 0018      	move.l 24(sp),d1
     694:	2401           	move.l d1,d2
     696:	5482           	addq.l #2,d2
     698:	2f42 0018      	move.l d2,24(sp)
     69c:	202f 0014      	move.l 20(sp),d0
     6a0:	2400           	move.l d0,d2
     6a2:	5482           	addq.l #2,d2
     6a4:	2f42 0014      	move.l d2,20(sp)
     6a8:	2041           	movea.l d1,a0
     6aa:	3210           	move.w (a0),d1
     6ac:	2040           	movea.l d0,a0
     6ae:	3081           	move.w d1,(a0)
  *copperlist = *values4shift++;
     6b0:	202f 0018      	move.l 24(sp),d0
     6b4:	2200           	move.l d0,d1
     6b6:	5481           	addq.l #2,d1
     6b8:	2f41 0018      	move.l d1,24(sp)
     6bc:	2040           	movea.l d0,a0
     6be:	3010           	move.w (a0),d0
     6c0:	206f 0014      	movea.l 20(sp),a0
     6c4:	3080           	move.w d0,(a0)
  copperlist += 2;
     6c6:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     6ca:	42af 0004      	clr.l 4(sp)
     6ce:	601e           	bra.s 6ee <Zoom_InsertShift+0xfe>
    *copperlist = *values4shift++;
     6d0:	202f 0018      	move.l 24(sp),d0
     6d4:	2200           	move.l d0,d1
     6d6:	5481           	addq.l #2,d1
     6d8:	2f41 0018      	move.l d1,24(sp)
     6dc:	2040           	movea.l d0,a0
     6de:	3010           	move.w (a0),d0
     6e0:	206f 0014      	movea.l 20(sp),a0
     6e4:	3080           	move.w d0,(a0)
    copperlist += 2;
     6e6:	58af 0014      	addq.l #4,20(sp)
  for(int i = 0; i<7;i++) {
     6ea:	52af 0004      	addq.l #1,4(sp)
     6ee:	7006           	moveq #6,d0
     6f0:	b0af 0004      	cmp.l 4(sp),d0
     6f4:	6cda           	bge.s 6d0 <Zoom_InsertShift+0xe0>
  }
}
     6f6:	241f           	move.l (sp)+,d2
     6f8:	4fef 000c      	lea 12(sp),sp
     6fc:	4e75           	rts

000006fe <Zoom_Shrink102>:

void Zoom_Shrink102( UWORD levelofshrink, UWORD volatile *copperlist )  {
     6fe:	518f           	subq.l #8,sp
     700:	202f 000c      	move.l 12(sp),d0
     704:	3000           	move.w d0,d0
     706:	3f40 0002      	move.w d0,2(sp)

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     70a:	7200           	moveq #0,d1
     70c:	322f 0002      	move.w 2(sp),d1
     710:	2001           	move.l d1,d0
     712:	d080           	add.l d0,d0
     714:	d081           	add.l d1,d0
     716:	2200           	move.l d0,d1
     718:	e789           	lsl.l #3,d1
     71a:	d081           	add.l d1,d0
     71c:	e788           	lsl.l #3,d0
     71e:	2200           	move.l d0,d1
     720:	0681 0000 2318 	addi.l #8984,d1
     726:	2f41 0004      	move.l d1,4(sp)
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
     72a:	202f 0010      	move.l 16(sp),d0
     72e:	0680 0000 012a 	addi.l #298,d0
     734:	2f2f 0004      	move.l 4(sp),-(sp)
     738:	2f00           	move.l d0,-(sp)
     73a:	4eba feb4      	jsr 5f0 <Zoom_InsertShift>(pc)
     73e:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
     740:	7236           	moveq #54,d1
     742:	d2af 0004      	add.l 4(sp),d1
     746:	202f 0010      	move.l 16(sp),d0
     74a:	0680 0000 01a2 	addi.l #418,d0
     750:	2f01           	move.l d1,-(sp)
     752:	2f00           	move.l d0,-(sp)
     754:	4eba fe9a      	jsr 5f0 <Zoom_InsertShift>(pc)
     758:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
     75a:	726c           	moveq #108,d1
     75c:	d2af 0004      	add.l 4(sp),d1
     760:	202f 0010      	move.l 16(sp),d0
     764:	0680 0000 0212 	addi.l #530,d0
     76a:	2f01           	move.l d1,-(sp)
     76c:	2f00           	move.l d0,-(sp)
     76e:	4eba fe80      	jsr 5f0 <Zoom_InsertShift>(pc)
     772:	508f           	addq.l #8,sp
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
     774:	222f 0004      	move.l 4(sp),d1
     778:	0681 0000 00a2 	addi.l #162,d1
     77e:	202f 0010      	move.l 16(sp),d0
     782:	0680 0000 0282 	addi.l #642,d0
     788:	2f01           	move.l d1,-(sp)
     78a:	2f00           	move.l d0,-(sp)
     78c:	4eba fe62      	jsr 5f0 <Zoom_InsertShift>(pc)
     790:	508f           	addq.l #8,sp
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     792:	508f           	addq.l #8,sp
     794:	4e75           	rts

00000796 <interruptHandler>:
#include "zoom.h"
#include "zoom102.h"

//volatile int frameCounter = 0;

static __attribute__((interrupt)) void interruptHandler() {
     796:	2f08           	move.l a0,-(sp)
	hw->intreq=(1<<INTB_VERTB); hw->intreq=(1<<INTB_VERTB); //reset vbl req. twice for a4000 bug.
     798:	2079 0000 3264 	movea.l 3264 <hw>,a0
     79e:	317c 0020 009c 	move.w #32,156(a0)
     7a4:	2079 0000 3264 	movea.l 3264 <hw>,a0
     7aa:	317c 0020 009c 	move.w #32,156(a0)
	// DEMO - increment frameCounter
	//frameCounter++;
  //Zoom_VblankHandler();
}
     7b0:	205f           	movea.l (sp)+,a0
     7b2:	4e73           	rte

000007b4 <RunDemo>:

void RunDemo() {
//               5432109876543210
  hw->dmacon = 0b1000011111111111;
     7b4:	2079 0000 3264 	movea.l 3264 <hw>,a0
     7ba:	317c 87ff 0096 	move.w #-30721,150(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req*/
  //PrepareDisplay();
  //CopyMemQuick( Zoom_StartImage, DrawBuffer, ZMBPLSIZE);
  
	while(1) {
		WaitVbl();
     7c0:	4eba 040a      	jsr bcc <WaitVbl>(pc)
    RunFrame();
     7c4:	4eba 0028      	jsr 7ee <RunFrame>(pc)
     7c8:	60f6           	bra.s 7c0 <RunDemo+0xc>

000007ca <SetInterrupt>:
  
	//SetInterruptHandler((APTR)interruptHandler);
}

void SetInterrupt() {
  SetInterruptHandler((APTR)interruptHandler);
     7ca:	487a ffca      	pea 796 <interruptHandler>(pc)
     7ce:	4eba 03ee      	jsr bbe <SetInterruptHandler>(pc)
     7d2:	588f           	addq.l #4,sp
	hw->intena=(1<<INTB_SETCLR)|(1<<INTB_INTEN)|(1<<INTB_VERTB);
     7d4:	2079 0000 3264 	movea.l 3264 <hw>,a0
     7da:	317c c020 009a 	move.w #-16352,154(a0)
	hw->intreq=1<<INTB_VERTB;//reset vbl req
     7e0:	2079 0000 3264 	movea.l 3264 <hw>,a0
     7e6:	317c 0020 009c 	move.w #32,156(a0)
}
     7ec:	4e75           	rts

000007ee <RunFrame>:
  else
    Zoom_ZoomIntoPicture( (UWORD *)ViewBuffer, (UWORD *)DrawBuffer, Zoom_LevelOfZoom, 5 );

  Zoom_Blit4ZoomFinished = 1;
  while( tmp == Zoom_LevelOfZoom) { }*/
     7ee:	4e75           	rts

000007f0 <strlen>:
{
     7f0:	598f           	subq.l #4,sp
	unsigned long t=0;
     7f2:	4297           	clr.l (sp)
     7f4:	6002           	bra.s 7f8 <strlen+0x8>
		t++;
     7f6:	5297           	addq.l #1,(sp)
	while(*s++)
     7f8:	202f 0008      	move.l 8(sp),d0
     7fc:	2200           	move.l d0,d1
     7fe:	5281           	addq.l #1,d1
     800:	2f41 0008      	move.l d1,8(sp)
     804:	2040           	movea.l d0,a0
     806:	1010           	move.b (a0),d0
     808:	66ec           	bne.s 7f6 <strlen+0x6>
	return t;
     80a:	2017           	move.l (sp),d0
}
     80c:	588f           	addq.l #4,sp
     80e:	4e75           	rts

00000810 <memset>:
{
     810:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
     814:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
     81a:	6014           	bra.s 830 <memset+0x20>
		*ptr++ = val;
     81c:	202d fffc      	move.l -4(a5),d0
     820:	2200           	move.l d0,d1
     822:	5281           	addq.l #1,d1
     824:	2b41 fffc      	move.l d1,-4(a5)
     828:	222d 000c      	move.l 12(a5),d1
     82c:	2040           	movea.l d0,a0
     82e:	1081           	move.b d1,(a0)
	while(len-- > 0)
     830:	202d 0010      	move.l 16(a5),d0
     834:	2200           	move.l d0,d1
     836:	5381           	subq.l #1,d1
     838:	2b41 0010      	move.l d1,16(a5)
     83c:	4a80           	tst.l d0
     83e:	66dc           	bne.s 81c <memset+0xc>
	return dest;
     840:	202d 0008      	move.l 8(a5),d0
}
     844:	4e5d           	unlk a5
     846:	4e75           	rts

00000848 <memcpy>:
{
     848:	4e55 fff8      	link.w a5,#-8
     84c:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
     84e:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
     854:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
     85a:	6020           	bra.s 87c <memcpy+0x34>
		*d++ = *s++;
     85c:	222d fff8      	move.l -8(a5),d1
     860:	2001           	move.l d1,d0
     862:	5280           	addq.l #1,d0
     864:	2b40 fff8      	move.l d0,-8(a5)
     868:	202d fffc      	move.l -4(a5),d0
     86c:	2400           	move.l d0,d2
     86e:	5282           	addq.l #1,d2
     870:	2b42 fffc      	move.l d2,-4(a5)
     874:	2041           	movea.l d1,a0
     876:	1210           	move.b (a0),d1
     878:	2040           	movea.l d0,a0
     87a:	1081           	move.b d1,(a0)
	while(len--)
     87c:	202d 0010      	move.l 16(a5),d0
     880:	2200           	move.l d0,d1
     882:	5381           	subq.l #1,d1
     884:	2b41 0010      	move.l d1,16(a5)
     888:	4a80           	tst.l d0
     88a:	66d0           	bne.s 85c <memcpy+0x14>
	return dest;
     88c:	202d 0008      	move.l 8(a5),d0
}
     890:	241f           	move.l (sp)+,d2
     892:	4e5d           	unlk a5
     894:	4e75           	rts

00000896 <memmove>:
{
     896:	4e55 fff0      	link.w a5,#-16
     89a:	2f02           	move.l d2,-(sp)
	char *d = dest;
     89c:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
     8a2:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
     8a8:	202d fffc      	move.l -4(a5),d0
     8ac:	b0ad fff8      	cmp.l -8(a5),d0
     8b0:	6522           	bcs.s 8d4 <memmove+0x3e>
     8b2:	6032           	bra.s 8e6 <memmove+0x50>
			*d++ = *s++;
     8b4:	222d fff8      	move.l -8(a5),d1
     8b8:	2401           	move.l d1,d2
     8ba:	5282           	addq.l #1,d2
     8bc:	2b42 fff8      	move.l d2,-8(a5)
     8c0:	202d fffc      	move.l -4(a5),d0
     8c4:	2400           	move.l d0,d2
     8c6:	5282           	addq.l #1,d2
     8c8:	2b42 fffc      	move.l d2,-4(a5)
     8cc:	2041           	movea.l d1,a0
     8ce:	1210           	move.b (a0),d1
     8d0:	2040           	movea.l d0,a0
     8d2:	1081           	move.b d1,(a0)
		while (len--)
     8d4:	202d 0010      	move.l 16(a5),d0
     8d8:	2200           	move.l d0,d1
     8da:	5381           	subq.l #1,d1
     8dc:	2b41 0010      	move.l d1,16(a5)
     8e0:	4a80           	tst.l d0
     8e2:	66d0           	bne.s 8b4 <memmove+0x1e>
     8e4:	6052           	bra.s 938 <memmove+0xa2>
		const char *lasts = s + (len - 1);
     8e6:	202d 0010      	move.l 16(a5),d0
     8ea:	5380           	subq.l #1,d0
     8ec:	242d fff8      	move.l -8(a5),d2
     8f0:	d480           	add.l d0,d2
     8f2:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
     8f6:	202d 0010      	move.l 16(a5),d0
     8fa:	5380           	subq.l #1,d0
     8fc:	222d fffc      	move.l -4(a5),d1
     900:	d280           	add.l d0,d1
     902:	2b41 fff0      	move.l d1,-16(a5)
     906:	6020           	bra.s 928 <memmove+0x92>
			*lastd-- = *lasts--;
     908:	222d fff4      	move.l -12(a5),d1
     90c:	2401           	move.l d1,d2
     90e:	5382           	subq.l #1,d2
     910:	2b42 fff4      	move.l d2,-12(a5)
     914:	202d fff0      	move.l -16(a5),d0
     918:	2400           	move.l d0,d2
     91a:	5382           	subq.l #1,d2
     91c:	2b42 fff0      	move.l d2,-16(a5)
     920:	2041           	movea.l d1,a0
     922:	1210           	move.b (a0),d1
     924:	2040           	movea.l d0,a0
     926:	1081           	move.b d1,(a0)
		while (len--)
     928:	202d 0010      	move.l 16(a5),d0
     92c:	2200           	move.l d0,d1
     92e:	5381           	subq.l #1,d1
     930:	2b41 0010      	move.l d1,16(a5)
     934:	4a80           	tst.l d0
     936:	66d0           	bne.s 908 <memmove+0x72>
	return dest;
     938:	202d 0008      	move.l 8(a5),d0
}
     93c:	241f           	move.l (sp)+,d2
     93e:	4e5d           	unlk a5
     940:	4e75           	rts

00000942 <KPrintF>:
{
     942:	4fef ff80      	lea -128(sp),sp
     946:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     94a:	3039 00f0 ff60 	move.w f0ff60 <gcc8_c_support.c.f93356b9+0xf062cb>,d0
     950:	0c40 4eb9      	cmpi.w #20153,d0
     954:	6722           	beq.s 978 <KPrintF+0x36>
     956:	0c40 a00e      	cmpi.w #-24562,d0
     95a:	671c           	beq.s 978 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
     95c:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     962:	206f 0090      	movea.l 144(sp),a0
     966:	43ef 0094      	lea 148(sp),a1
     96a:	45f9 0000 1396 	lea 1396 <KPutCharX>,a2
     970:	97cb           	suba.l a3,a3
     972:	4eae fdf6      	jsr -522(a6)
     976:	602a           	bra.s 9a2 <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
     978:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     97e:	206f 0090      	movea.l 144(sp),a0
     982:	43ef 0094      	lea 148(sp),a1
     986:	45f9 0000 13a4 	lea 13a4 <PutChar>,a2
     98c:	47ef 000c      	lea 12(sp),a3
     990:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     994:	2f0b           	move.l a3,-(sp)
     996:	4878 0056      	pea 56 <_start+0x56>
     99a:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.f93356b9+0xf062cb>
     9a0:	508f           	addq.l #8,sp
}
     9a2:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     9a6:	4fef 0080      	lea 128(sp),sp
     9aa:	4e75           	rts

000009ac <warpmode>:

void warpmode(int on) // bool
{
     9ac:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
     9ae:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
     9b4:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
     9b6:	206f 0004      	movea.l 4(sp),a0
     9ba:	3010           	move.w (a0),d0
     9bc:	0c40 4eb9      	cmpi.w #20153,d0
     9c0:	670c           	beq.s 9ce <warpmode+0x22>
     9c2:	206f 0004      	movea.l 4(sp),a0
     9c6:	3010           	move.w (a0),d0
     9c8:	0c40 a00e      	cmpi.w #-24562,d0
     9cc:	6668           	bne.s a36 <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     9ce:	4aaf 000c      	tst.l 12(sp)
     9d2:	6708           	beq.s 9dc <warpmode+0x30>
     9d4:	203c 0000 1746 	move.l #5958,d0
     9da:	6006           	bra.s 9e2 <warpmode+0x36>
     9dc:	203c 0000 1750 	move.l #5968,d0
     9e2:	4878 0001      	pea 1 <_start+0x1>
     9e6:	220f           	move.l sp,d1
     9e8:	5e81           	addq.l #7,d1
     9ea:	2f01           	move.l d1,-(sp)
     9ec:	42a7           	clr.l -(sp)
     9ee:	2f00           	move.l d0,-(sp)
     9f0:	4878 ffff      	pea ffffffff <gcc8_c_support.c.f93356b9+0xffff636a>
     9f4:	4878 0052      	pea 52 <_start+0x52>
     9f8:	206f 001c      	movea.l 28(sp),a0
     9fc:	4e90           	jsr (a0)
     9fe:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     a02:	4aaf 000c      	tst.l 12(sp)
     a06:	6708           	beq.s a10 <warpmode+0x64>
     a08:	203c 0000 175b 	move.l #5979,d0
     a0e:	6006           	bra.s a16 <warpmode+0x6a>
     a10:	203c 0000 1775 	move.l #6005,d0
     a16:	4878 0001      	pea 1 <_start+0x1>
     a1a:	220f           	move.l sp,d1
     a1c:	5e81           	addq.l #7,d1
     a1e:	2f01           	move.l d1,-(sp)
     a20:	42a7           	clr.l -(sp)
     a22:	2f00           	move.l d0,-(sp)
     a24:	4878 ffff      	pea ffffffff <gcc8_c_support.c.f93356b9+0xffff636a>
     a28:	4878 0052      	pea 52 <_start+0x52>
     a2c:	206f 001c      	movea.l 28(sp),a0
     a30:	4e90           	jsr (a0)
     a32:	4fef 0018      	lea 24(sp),sp
	}
}
     a36:	508f           	addq.l #8,sp
     a38:	4e75           	rts

00000a3a <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
     a3a:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
     a3c:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     a42:	2057           	movea.l (sp),a0
     a44:	3010           	move.w (a0),d0
     a46:	0c40 4eb9      	cmpi.w #20153,d0
     a4a:	670a           	beq.s a56 <debug_cmd+0x1c>
     a4c:	2057           	movea.l (sp),a0
     a4e:	3010           	move.w (a0),d0
     a50:	0c40 a00e      	cmpi.w #-24562,d0
     a54:	661e           	bne.s a74 <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
     a56:	2f2f 0014      	move.l 20(sp),-(sp)
     a5a:	2f2f 0014      	move.l 20(sp),-(sp)
     a5e:	2f2f 0014      	move.l 20(sp),-(sp)
     a62:	2f2f 0014      	move.l 20(sp),-(sp)
     a66:	4878 0058      	pea 58 <_start+0x58>
     a6a:	206f 0014      	movea.l 20(sp),a0
     a6e:	4e90           	jsr (a0)
     a70:	4fef 0014      	lea 20(sp),sp
	}
}
     a74:	588f           	addq.l #4,sp
     a76:	4e75           	rts

00000a78 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
     a78:	42a7           	clr.l -(sp)
     a7a:	42a7           	clr.l -(sp)
     a7c:	42a7           	clr.l -(sp)
     a7e:	42a7           	clr.l -(sp)
     a80:	4eba ffb8      	jsr a3a <debug_cmd>(pc)
     a84:	4fef 0010      	lea 16(sp),sp
}
     a88:	4e75           	rts

00000a8a <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
     a8a:	518f           	subq.l #8,sp
     a8c:	2f02           	move.l d2,-(sp)
     a8e:	226f 0010      	movea.l 16(sp),a1
     a92:	206f 0014      	movea.l 20(sp),a0
     a96:	222f 0018      	move.l 24(sp),d1
     a9a:	202f 001c      	move.l 28(sp),d0
     a9e:	3249           	movea.w a1,a1
     aa0:	3f49 000a      	move.w a1,10(sp)
     aa4:	3048           	movea.w a0,a0
     aa6:	3f48 0008      	move.w a0,8(sp)
     aaa:	3201           	move.w d1,d1
     aac:	3f41 0006      	move.w d1,6(sp)
     ab0:	3000           	move.w d0,d0
     ab2:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
     ab6:	302f 0006      	move.w 6(sp),d0
     aba:	48c0           	ext.l d0
     abc:	4840           	swap d0
     abe:	4240           	clr.w d0
     ac0:	322f 0004      	move.w 4(sp),d1
     ac4:	48c1           	ext.l d1
     ac6:	8280           	or.l d0,d1
     ac8:	302f 000a      	move.w 10(sp),d0
     acc:	48c0           	ext.l d0
     ace:	4840           	swap d0
     ad0:	4240           	clr.w d0
     ad2:	306f 0008      	movea.w 8(sp),a0
     ad6:	2408           	move.l a0,d2
     ad8:	8082           	or.l d2,d0
     ada:	2f2f 0020      	move.l 32(sp),-(sp)
     ade:	2f01           	move.l d1,-(sp)
     ae0:	2f00           	move.l d0,-(sp)
     ae2:	4878 0001      	pea 1 <_start+0x1>
     ae6:	4eba ff52      	jsr a3a <debug_cmd>(pc)
     aea:	4fef 0010      	lea 16(sp),sp
}
     aee:	241f           	move.l (sp)+,d2
     af0:	508f           	addq.l #8,sp
     af2:	4e75           	rts

00000af4 <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
     af4:	518f           	subq.l #8,sp
     af6:	2f02           	move.l d2,-(sp)
     af8:	226f 0010      	movea.l 16(sp),a1
     afc:	206f 0014      	movea.l 20(sp),a0
     b00:	222f 0018      	move.l 24(sp),d1
     b04:	202f 001c      	move.l 28(sp),d0
     b08:	3249           	movea.w a1,a1
     b0a:	3f49 000a      	move.w a1,10(sp)
     b0e:	3048           	movea.w a0,a0
     b10:	3f48 0008      	move.w a0,8(sp)
     b14:	3201           	move.w d1,d1
     b16:	3f41 0006      	move.w d1,6(sp)
     b1a:	3000           	move.w d0,d0
     b1c:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
     b20:	302f 0006      	move.w 6(sp),d0
     b24:	48c0           	ext.l d0
     b26:	4840           	swap d0
     b28:	4240           	clr.w d0
     b2a:	322f 0004      	move.w 4(sp),d1
     b2e:	48c1           	ext.l d1
     b30:	8280           	or.l d0,d1
     b32:	302f 000a      	move.w 10(sp),d0
     b36:	48c0           	ext.l d0
     b38:	4840           	swap d0
     b3a:	4240           	clr.w d0
     b3c:	306f 0008      	movea.w 8(sp),a0
     b40:	2408           	move.l a0,d2
     b42:	8082           	or.l d2,d0
     b44:	2f2f 0020      	move.l 32(sp),-(sp)
     b48:	2f01           	move.l d1,-(sp)
     b4a:	2f00           	move.l d0,-(sp)
     b4c:	4878 0002      	pea 2 <_start+0x2>
     b50:	4eba fee8      	jsr a3a <debug_cmd>(pc)
     b54:	4fef 0010      	lea 16(sp),sp
}
     b58:	241f           	move.l (sp)+,d2
     b5a:	508f           	addq.l #8,sp
     b5c:	4e75           	rts

00000b5e <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
     b5e:	598f           	subq.l #4,sp
     b60:	2f02           	move.l d2,-(sp)
     b62:	222f 000c      	move.l 12(sp),d1
     b66:	202f 0010      	move.l 16(sp),d0
     b6a:	3201           	move.w d1,d1
     b6c:	3f41 0006      	move.w d1,6(sp)
     b70:	3000           	move.w d0,d0
     b72:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
     b76:	202f 0014      	move.l 20(sp),d0
     b7a:	322f 0006      	move.w 6(sp),d1
     b7e:	48c1           	ext.l d1
     b80:	4841           	swap d1
     b82:	4241           	clr.w d1
     b84:	306f 0004      	movea.w 4(sp),a0
     b88:	2408           	move.l a0,d2
     b8a:	8282           	or.l d2,d1
     b8c:	2f2f 0018      	move.l 24(sp),-(sp)
     b90:	2f00           	move.l d0,-(sp)
     b92:	2f01           	move.l d1,-(sp)
     b94:	4878 0003      	pea 3 <_start+0x3>
     b98:	4eba fea0      	jsr a3a <debug_cmd>(pc)
     b9c:	4fef 0010      	lea 16(sp),sp
}
     ba0:	241f           	move.l (sp)+,d2
     ba2:	588f           	addq.l #4,sp
     ba4:	4e75           	rts

00000ba6 <Utils_CopyMem.constprop.0>:
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     ba6:	206f 0004      	movea.l 4(sp),a0
     baa:	226f 0008      	movea.l 8(sp),a1
     bae:	2008           	move.l a0,d0
     bb0:	0680 0000 dbd8 	addi.l #56280,d0
    *destination++ = *source++;  
     bb6:	22d8           	move.l (a0)+,(a1)+
  for( int i=0;i<size;i++) 
     bb8:	b1c0           	cmpa.l d0,a0
     bba:	66fa           	bne.s bb6 <Utils_CopyMem.constprop.0+0x10>
}
     bbc:	4e75           	rts

00000bbe <SetInterruptHandler>:
	*(volatile APTR*)(((UBYTE*)VBR)+0x6c) = interrupt;
     bbe:	2079 0000 33e2 	movea.l 33e2 <VBR>,a0
     bc4:	216f 0004 006c 	move.l 4(sp),108(a0)
}
     bca:	4e75           	rts

00000bcc <WaitVbl>:
void WaitVbl() {
     bcc:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     bce:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.f93356b9+0xdf536f>,d0
     bd4:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     bd6:	2017           	move.l (sp),d0
     bd8:	0280 0001 ff00 	andi.l #130816,d0
     bde:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     be0:	2017           	move.l (sp),d0
     be2:	0c80 0001 3700 	cmpi.l #79616,d0
     be8:	67e4           	beq.s bce <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     bea:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.f93356b9+0xdf536f>,d0
     bf0:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     bf4:	202f 0004      	move.l 4(sp),d0
     bf8:	0280 0001 ff00 	andi.l #130816,d0
     bfe:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     c02:	202f 0004      	move.l 4(sp),d0
     c06:	0c80 0001 3700 	cmpi.l #79616,d0
     c0c:	66dc           	bne.s bea <WaitVbl+0x1e>
}
     c0e:	508f           	addq.l #8,sp
     c10:	4e75           	rts

00000c12 <Zoom_SetBplPointers>:
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2; 
  return 0;
}

void Zoom_SetBplPointers( UWORD volatile *buffer, ULONG volatile *copper) {
     c12:	4e55 ffc0      	link.w a5,#-64
     c16:	2f0a           	move.l a2,-(sp)
     c18:	2f02           	move.l d2,-(sp)
     c1a:	246d 000c      	movea.l 12(a5),a2
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
     c1e:	4878 0040      	pea 40 <_start+0x40>
     c22:	4879 0000 178e 	pea 178e <c2p1x1_8_c5_gen_pixels+0x4c>
     c28:	486d ffc0      	pea -64(a5)
     c2c:	4eba fc1a      	jsr 848 <memcpy>(pc)

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
     c30:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
     c36:	0280 0000 ffff 	andi.l #65535,d0
     c3c:	d080           	add.l d0,d0
     c3e:	d080           	add.l d0,d0
     c40:	2035 08c0      	move.l (-64,a5,d0.l),d0
     c44:	d080           	add.l d0,d0
     c46:	d0ad 0008      	add.l 8(a5),d0
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
     c4a:	2200           	move.l d0,d1
     c4c:	4241           	clr.w d1
     c4e:	4841           	swap d1
     c50:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     c54:	3540 0076      	move.w d0,118(a2)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += 42*268; //Next plane
     c58:	2200           	move.l d0,d1
     c5a:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     c60:	2401           	move.l d1,d2
     c62:	4242           	clr.w d2
     c64:	4842           	swap d2
     c66:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     c6a:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
     c6e:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     c74:	2401           	move.l d1,d2
     c76:	4242           	clr.w d2
     c78:	4842           	swap d2
     c7a:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     c7e:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
     c82:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     c88:	2401           	move.l d1,d2
     c8a:	4242           	clr.w d2
     c8c:	4842           	swap d2
     c8e:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     c92:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
     c96:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
     c9c:	2200           	move.l d0,d1
     c9e:	4241           	clr.w d1
     ca0:	4841           	swap d1
     ca2:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     ca6:	3540 0096      	move.w d0,150(a2)
  for(int i=0;i<ZMBPLDEPTH;i++) {
     caa:	4fef 000c      	lea 12(sp),sp
  }
  
}
     cae:	242d ffb8      	move.l -72(a5),d2
     cb2:	246d ffbc      	movea.l -68(a5),a2
     cb6:	4e5d           	unlk a5
     cb8:	4e75           	rts

00000cba <ClbuildZoom>:
ULONG * ClbuildZoom() {
     cba:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     cbe:	2c79 0000 33d6 	movea.l 33d6 <SysBase>,a6
     cc4:	203c 0000 031c 	move.l #796,d0
     cca:	7202           	moveq #2,d1
     ccc:	4eae ff3a      	jsr -198(a6)
     cd0:	2440           	movea.l d0,a2
  if( retval == 0) {
     cd2:	4a80           	tst.l d0
     cd4:	6700 01ea      	beq.w ec0 <ClbuildZoom+0x206>
    *cl++ = *clpartinstruction++;
     cd8:	24b9 0000 2080 	move.l 2080 <ClsSprites>,(a2)
     cde:	2579 0000 2084 	move.l 2084 <ClsSprites+0x4>,4(a2)
     ce4:	0004 
     ce6:	2579 0000 2088 	move.l 2088 <ClsSprites+0x8>,8(a2)
     cec:	0008 
     cee:	2579 0000 208c 	move.l 208c <ClsSprites+0xc>,12(a2)
     cf4:	000c 
     cf6:	2579 0000 2090 	move.l 2090 <ClsSprites+0x10>,16(a2)
     cfc:	0010 
     cfe:	2579 0000 2094 	move.l 2094 <ClsSprites+0x14>,20(a2)
     d04:	0014 
     d06:	2579 0000 2098 	move.l 2098 <ClsSprites+0x18>,24(a2)
     d0c:	0018 
     d0e:	2579 0000 209c 	move.l 209c <ClsSprites+0x1c>,28(a2)
     d14:	001c 
     d16:	2579 0000 20a0 	move.l 20a0 <ClsSprites+0x20>,32(a2)
     d1c:	0020 
     d1e:	2579 0000 20a4 	move.l 20a4 <ClsSprites+0x24>,36(a2)
     d24:	0024 
     d26:	2579 0000 20a8 	move.l 20a8 <ClsSprites+0x28>,40(a2)
     d2c:	0028 
     d2e:	2579 0000 20ac 	move.l 20ac <ClsSprites+0x2c>,44(a2)
     d34:	002c 
     d36:	2579 0000 20b0 	move.l 20b0 <ClsSprites+0x30>,48(a2)
     d3c:	0030 
     d3e:	2579 0000 20b4 	move.l 20b4 <ClsSprites+0x34>,52(a2)
     d44:	0034 
     d46:	2579 0000 20b8 	move.l 20b8 <ClsSprites+0x38>,56(a2)
     d4c:	0038 
     d4e:	2579 0000 20bc 	move.l 20bc <ClsSprites+0x3c>,60(a2)
     d54:	003c 
    *cl++ = *clpartinstruction++;
     d56:	2579 0000 20c0 	move.l 20c0 <ClScreen>,64(a2)
     d5c:	0040 
     d5e:	2579 0000 20c4 	move.l 20c4 <ClScreen+0x4>,68(a2)
     d64:	0044 
     d66:	2579 0000 20c8 	move.l 20c8 <ClScreen+0x8>,72(a2)
     d6c:	0048 
     d6e:	2579 0000 20cc 	move.l 20cc <ClScreen+0xc>,76(a2)
     d74:	004c 
     d76:	2579 0000 20d0 	move.l 20d0 <ClScreen+0x10>,80(a2)
     d7c:	0050 
     d7e:	2579 0000 20d4 	move.l 20d4 <ClScreen+0x14>,84(a2)
     d84:	0054 
     d86:	2579 0000 20d8 	move.l 20d8 <ClScreen+0x18>,88(a2)
     d8c:	0058 
     d8e:	2579 0000 20dc 	move.l 20dc <ClScreen+0x1c>,92(a2)
     d94:	005c 
     d96:	2579 0000 20e0 	move.l 20e0 <ClScreen+0x20>,96(a2)
     d9c:	0060 
     d9e:	2579 0000 20e4 	move.l 20e4 <ClScreen+0x24>,100(a2)
     da4:	0064 
     da6:	2579 0000 20e8 	move.l 20e8 <ClScreen+0x28>,104(a2)
     dac:	0068 
     dae:	2579 0000 20ec 	move.l 20ec <ClScreen+0x2c>,108(a2)
     db4:	006c 
  *cl++ = 0x00e00000;
     db6:	257c 00e0 0000 	move.l #14680064,112(a2)
     dbc:	0070 
  *cl++ = 0x00e20000;
     dbe:	257c 00e2 0000 	move.l #14811136,116(a2)
     dc4:	0074 
  *cl++ = 0x00e40000;
     dc6:	257c 00e4 0000 	move.l #14942208,120(a2)
     dcc:	0078 
  *cl++ = 0x00e60000;
     dce:	257c 00e6 0000 	move.l #15073280,124(a2)
     dd4:	007c 
  *cl++ = 0x00e80000;
     dd6:	257c 00e8 0000 	move.l #15204352,128(a2)
     ddc:	0080 
  *cl++ = 0x00ea0000;
     dde:	257c 00ea 0000 	move.l #15335424,132(a2)
     de4:	0084 
  *cl++ = 0x00ec0000;
     de6:	257c 00ec 0000 	move.l #15466496,136(a2)
     dec:	0088 
  *cl++ = 0x00ee0000;
     dee:	257c 00ee 0000 	move.l #15597568,140(a2)
     df4:	008c 
  *cl++ = 0x00f00000;
     df6:	257c 00f0 0000 	move.l #15728640,144(a2)
     dfc:	0090 
  *cl++ = 0x00f20000;
     dfe:	257c 00f2 0000 	move.l #15859712,148(a2)
     e04:	0094 
  for(int i=0; i<32;i++)
     e06:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     e0a:	41f9 0000 2000 	lea 2000 <ClColor>,a0
    *cl++ = *clpartinstruction++;
     e10:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
     e12:	b1fc 0000 2080 	cmpa.l #8320,a0
     e18:	66f6           	bne.s e10 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
     e1a:	220a           	move.l a2,d1
     e1c:	0681 0000 0124 	addi.l #292,d1
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
     e22:	2001           	move.l d1,d0
     e24:	4240           	clr.w d0
     e26:	4840           	swap d0
     e28:	0680 0084 0000 	addi.l #8650752,d0
     e2e:	2540 0118      	move.l d0,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
     e32:	2001           	move.l d1,d0
     e34:	0280 0000 ffff 	andi.l #65535,d0
     e3a:	0680 0086 0000 	addi.l #8781824,d0
     e40:	2540 011c      	move.l d0,284(a2)
  *cl++ = 0x2c01ff00;
     e44:	257c 2c01 ff00 	move.l #738328320,288(a2)
     e4a:	0120 
  ULONG cop2br1 = cop2 + ( (30)<<2);
     e4c:	7078           	moveq #120,d0
     e4e:	d081           	add.l d1,d0
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
     e50:	2400           	move.l d0,d2
     e52:	4242           	clr.w d2
     e54:	4842           	swap d2
     e56:	0682 0084 0000 	addi.l #8650752,d2
     e5c:	23c2 0000 216c 	move.l d2,216c <Cl102ZoomRepeat+0x70>
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
     e62:	0280 0000 ffff 	andi.l #65535,d0
     e68:	0680 0086 0000 	addi.l #8781824,d0
     e6e:	23c0 0000 2170 	move.l d0,2170 <Cl102ZoomRepeat+0x74>
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
     e74:	200a           	move.l a2,d0
     e76:	0680 0000 027c 	addi.l #636,d0
     e7c:	2400           	move.l d0,d2
     e7e:	4242           	clr.w d2
     e80:	4842           	swap d2
     e82:	0682 0084 0000 	addi.l #8650752,d2
     e88:	23c2 0000 224c 	move.l d2,224c <Cl102ZoomRepeat+0x150>
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
     e8e:	0280 0000 ffff 	andi.l #65535,d0
     e94:	0680 0086 0000 	addi.l #8781824,d0
     e9a:	23c0 0000 2250 	move.l d0,2250 <Cl102ZoomRepeat+0x154>
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
     ea0:	2241           	movea.l d1,a1
  clpartinstruction = Cl102ZoomRepeat;
     ea2:	41f9 0000 20fc 	lea 20fc <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
     ea8:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
     eaa:	b1fc 0000 22c4 	cmpa.l #8900,a0
     eb0:	66f6           	bne.s ea8 <ClbuildZoom+0x1ee>
   *cl++ = 0xfffffffe;
     eb2:	70fe           	moveq #-2,d0
     eb4:	2540 02ec      	move.l d0,748(a2)
}
     eb8:	200a           	move.l a2,d0
     eba:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     ebe:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     ec0:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     ec6:	4eae ffc4      	jsr -60(a6)
     eca:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     ed0:	2200           	move.l d0,d1
     ed2:	243c 0000 17ce 	move.l #6094,d2
     ed8:	7628           	moveq #40,d3
     eda:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     ede:	2c79 0000 33d2 	movea.l 33d2 <DOSBase>,a6
     ee4:	7201           	moveq #1,d1
     ee6:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     eea:	24b9 0000 2080 	move.l 2080 <ClsSprites>,(a2)
     ef0:	2579 0000 2084 	move.l 2084 <ClsSprites+0x4>,4(a2)
     ef6:	0004 
     ef8:	2579 0000 2088 	move.l 2088 <ClsSprites+0x8>,8(a2)
     efe:	0008 
     f00:	2579 0000 208c 	move.l 208c <ClsSprites+0xc>,12(a2)
     f06:	000c 
     f08:	2579 0000 2090 	move.l 2090 <ClsSprites+0x10>,16(a2)
     f0e:	0010 
     f10:	2579 0000 2094 	move.l 2094 <ClsSprites+0x14>,20(a2)
     f16:	0014 
     f18:	2579 0000 2098 	move.l 2098 <ClsSprites+0x18>,24(a2)
     f1e:	0018 
     f20:	2579 0000 209c 	move.l 209c <ClsSprites+0x1c>,28(a2)
     f26:	001c 
     f28:	2579 0000 20a0 	move.l 20a0 <ClsSprites+0x20>,32(a2)
     f2e:	0020 
     f30:	2579 0000 20a4 	move.l 20a4 <ClsSprites+0x24>,36(a2)
     f36:	0024 
     f38:	2579 0000 20a8 	move.l 20a8 <ClsSprites+0x28>,40(a2)
     f3e:	0028 
     f40:	2579 0000 20ac 	move.l 20ac <ClsSprites+0x2c>,44(a2)
     f46:	002c 
     f48:	2579 0000 20b0 	move.l 20b0 <ClsSprites+0x30>,48(a2)
     f4e:	0030 
     f50:	2579 0000 20b4 	move.l 20b4 <ClsSprites+0x34>,52(a2)
     f56:	0034 
     f58:	2579 0000 20b8 	move.l 20b8 <ClsSprites+0x38>,56(a2)
     f5e:	0038 
     f60:	2579 0000 20bc 	move.l 20bc <ClsSprites+0x3c>,60(a2)
     f66:	003c 
    *cl++ = *clpartinstruction++;
     f68:	2579 0000 20c0 	move.l 20c0 <ClScreen>,64(a2)
     f6e:	0040 
     f70:	2579 0000 20c4 	move.l 20c4 <ClScreen+0x4>,68(a2)
     f76:	0044 
     f78:	2579 0000 20c8 	move.l 20c8 <ClScreen+0x8>,72(a2)
     f7e:	0048 
     f80:	2579 0000 20cc 	move.l 20cc <ClScreen+0xc>,76(a2)
     f86:	004c 
     f88:	2579 0000 20d0 	move.l 20d0 <ClScreen+0x10>,80(a2)
     f8e:	0050 
     f90:	2579 0000 20d4 	move.l 20d4 <ClScreen+0x14>,84(a2)
     f96:	0054 
     f98:	2579 0000 20d8 	move.l 20d8 <ClScreen+0x18>,88(a2)
     f9e:	0058 
     fa0:	2579 0000 20dc 	move.l 20dc <ClScreen+0x1c>,92(a2)
     fa6:	005c 
     fa8:	2579 0000 20e0 	move.l 20e0 <ClScreen+0x20>,96(a2)
     fae:	0060 
     fb0:	2579 0000 20e4 	move.l 20e4 <ClScreen+0x24>,100(a2)
     fb6:	0064 
     fb8:	2579 0000 20e8 	move.l 20e8 <ClScreen+0x28>,104(a2)
     fbe:	0068 
     fc0:	2579 0000 20ec 	move.l 20ec <ClScreen+0x2c>,108(a2)
     fc6:	006c 
  *cl++ = 0x00e00000;
     fc8:	257c 00e0 0000 	move.l #14680064,112(a2)
     fce:	0070 
  *cl++ = 0x00e20000;
     fd0:	257c 00e2 0000 	move.l #14811136,116(a2)
     fd6:	0074 
  *cl++ = 0x00e40000;
     fd8:	257c 00e4 0000 	move.l #14942208,120(a2)
     fde:	0078 
  *cl++ = 0x00e60000;
     fe0:	257c 00e6 0000 	move.l #15073280,124(a2)
     fe6:	007c 
  *cl++ = 0x00e80000;
     fe8:	257c 00e8 0000 	move.l #15204352,128(a2)
     fee:	0080 
  *cl++ = 0x00ea0000;
     ff0:	257c 00ea 0000 	move.l #15335424,132(a2)
     ff6:	0084 
  *cl++ = 0x00ec0000;
     ff8:	257c 00ec 0000 	move.l #15466496,136(a2)
     ffe:	0088 
  *cl++ = 0x00ee0000;
    1000:	257c 00ee 0000 	move.l #15597568,140(a2)
    1006:	008c 
  *cl++ = 0x00f00000;
    1008:	257c 00f0 0000 	move.l #15728640,144(a2)
    100e:	0090 
  *cl++ = 0x00f20000;
    1010:	257c 00f2 0000 	move.l #15859712,148(a2)
    1016:	0094 
  for(int i=0; i<32;i++)
    1018:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    101c:	41f9 0000 2000 	lea 2000 <ClColor>,a0
    1022:	6000 fdec      	bra.w e10 <ClbuildZoom+0x156>

00001026 <Zoom_VblankHandler>:
void Zoom_VblankHandler() {
    1026:	4e55 ffc0      	link.w a5,#-64
    102a:	2f0a           	move.l a2,-(sp)
    102c:	2f02           	move.l d2,-(sp)
  hw->dmacon = 0b1000011111111111;
    102e:	2079 0000 3264 	movea.l 3264 <hw>,a0
    1034:	317c 87ff 0096 	move.w #-30721,150(a0)
  Zoom_Counter++;
    103a:	5279 0000 3270 	addq.w #1,3270 <Zoom_Counter>
  SwapCl();
    1040:	4eba f4ce      	jsr 510 <SwapCl>(pc)
  if( MouseLeft())
    1044:	45fa f568      	lea 5ae <MouseLeft>(pc),a2
    1048:	4e92           	jsr (a2)
    104a:	4a40           	tst.w d0
    104c:	6700 0126      	beq.w 1174 <Zoom_VblankHandler+0x14e>
    Zoom_Mousepressed = 1;
    1050:	33fc 0001 0000 	move.w #1,326a <Zoom_Mousepressed>
    1056:	326a 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1058:	4e92           	jsr (a2)
    105a:	4a40           	tst.w d0
    105c:	6700 0234      	beq.w 1292 <Zoom_VblankHandler+0x26c>
      if( Zoom_LevelOf102Zoom <= 2) {
    1060:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    1066:	0c40 0002      	cmpi.w #2,d0
    106a:	6200 0122      	bhi.w 118e <Zoom_VblankHandler+0x168>
        if( Zoom_LevelOfZoom == 87)
    106e:	3039 0000 326c 	move.w 326c <Zoom_LevelOfZoom>,d0
    1074:	0c40 0057      	cmpi.w #87,d0
    1078:	6700 01dc      	beq.w 1256 <Zoom_VblankHandler+0x230>
          Zoom_LevelOfZoom++;
    107c:	3039 0000 326c 	move.w 326c <Zoom_LevelOfZoom>,d0
    1082:	5240           	addq.w #1,d0
    1084:	33c0 0000 326c 	move.w d0,326c <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
    108a:	33fc 000f 0000 	move.w #15,326e <Zoom_LevelOf102Zoom>
    1090:	326e 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    1092:	3039 0000 326c 	move.w 326c <Zoom_LevelOfZoom>,d0

void Zoom_SwapBuffers( UWORD zoomlevel) {
  //ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  ULONG tmp = (ULONG) DrawBuffer;
    1098:	2039 0000 3254 	move.l 3254 <DrawBuffer>,d0
  DrawBuffer = ViewBuffer;
    109e:	23f9 0000 3258 	move.l 3258 <ViewBuffer>,3254 <DrawBuffer>
    10a4:	0000 3254 
  ViewBuffer = (ULONG *) tmp;
    10a8:	23c0 0000 3258 	move.l d0,3258 <ViewBuffer>
  	    *bp = 0;
    10ae:	42b8 0102      	clr.l 102 <main+0x4e>
        Zoom_DrawPicture = 1;     
    10b2:	7001           	moveq #1,d0
    10b4:	23c0 0000 3240 	move.l d0,3240 <Zoom_DrawPicture>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    10ba:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    10c0:	2f39 0000 325c 	move.l 325c <DrawCopper>,-(sp)
    10c6:	3f00           	move.w d0,-(sp)
    10c8:	4267           	clr.w -(sp)
    10ca:	4eba f632      	jsr 6fe <Zoom_Shrink102>(pc)
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    10ce:	2479 0000 325c 	movea.l 325c <DrawCopper>,a2
    10d4:	2439 0000 3258 	move.l 3258 <ViewBuffer>,d2
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    10da:	4878 0040      	pea 40 <_start+0x40>
    10de:	4879 0000 178e 	pea 178e <c2p1x1_8_c5_gen_pixels+0x4c>
    10e4:	486d ffc0      	pea -64(a5)
    10e8:	4eba f75e      	jsr 848 <memcpy>(pc)
  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    10ec:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    10f2:	0280 0000 ffff 	andi.l #65535,d0
    10f8:	d080           	add.l d0,d0
    10fa:	d080           	add.l d0,d0
    10fc:	2035 08c0      	move.l (-64,a5,d0.l),d0
    1100:	d080           	add.l d0,d0
    1102:	d082           	add.l d2,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1104:	2200           	move.l d0,d1
    1106:	4241           	clr.w d1
    1108:	4841           	swap d1
    110a:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    110e:	3540 0076      	move.w d0,118(a2)
    plane2set += 42*268; //Next plane
    1112:	2200           	move.l d0,d1
    1114:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    111a:	2401           	move.l d1,d2
    111c:	4242           	clr.w d2
    111e:	4842           	swap d2
    1120:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1124:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
    1128:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    112e:	2401           	move.l d1,d2
    1130:	4242           	clr.w d2
    1132:	4842           	swap d2
    1134:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1138:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
    113c:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    1142:	2401           	move.l d1,d2
    1144:	4242           	clr.w d2
    1146:	4842           	swap d2
    1148:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    114c:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
    1150:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1156:	2200           	move.l d0,d1
    1158:	4241           	clr.w d1
    115a:	4841           	swap d1
    115c:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1160:	3540 0096      	move.w d0,150(a2)
    1164:	4fef 0014      	lea 20(sp),sp
}
    1168:	242d ffb8      	move.l -72(a5),d2
    116c:	246d ffbc      	movea.l -68(a5),a2
    1170:	4e5d           	unlk a5
    1172:	4e75           	rts
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    1174:	0c79 0001 0000 	cmpi.w #1,326a <Zoom_Mousepressed>
    117a:	326a 
    117c:	6700 feda      	beq.w 1058 <Zoom_VblankHandler+0x32>
      if( Zoom_LevelOf102Zoom <= 2) {
    1180:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    1186:	0c40 0002      	cmpi.w #2,d0
    118a:	6300 fee2      	bls.w 106e <Zoom_VblankHandler+0x48>
        Zoom_LevelOf102Zoom-=2;
    118e:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    1194:	5540           	subq.w #2,d0
    1196:	33c0 0000 326e 	move.w d0,326e <Zoom_LevelOf102Zoom>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    119c:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    11a2:	2f39 0000 325c 	move.l 325c <DrawCopper>,-(sp)
    11a8:	3f00           	move.w d0,-(sp)
    11aa:	4267           	clr.w -(sp)
    11ac:	4eba f550      	jsr 6fe <Zoom_Shrink102>(pc)
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
    11b0:	2479 0000 325c 	movea.l 325c <DrawCopper>,a2
    11b6:	2439 0000 3258 	move.l 3258 <ViewBuffer>,d2
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    11bc:	4878 0040      	pea 40 <_start+0x40>
    11c0:	4879 0000 178e 	pea 178e <c2p1x1_8_c5_gen_pixels+0x4c>
    11c6:	486d ffc0      	pea -64(a5)
    11ca:	4eba f67c      	jsr 848 <memcpy>(pc)
  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    11ce:	3039 0000 326e 	move.w 326e <Zoom_LevelOf102Zoom>,d0
    11d4:	0280 0000 ffff 	andi.l #65535,d0
    11da:	d080           	add.l d0,d0
    11dc:	d080           	add.l d0,d0
    11de:	2035 08c0      	move.l (-64,a5,d0.l),d0
    11e2:	d080           	add.l d0,d0
    11e4:	d082           	add.l d2,d0
    UWORD highword = (ULONG)plane2set >> 16;
    11e6:	2200           	move.l d0,d1
    11e8:	4241           	clr.w d1
    11ea:	4841           	swap d1
    11ec:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    11f0:	3540 0076      	move.w d0,118(a2)
    plane2set += 42*268; //Next plane
    11f4:	2200           	move.l d0,d1
    11f6:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    11fc:	2401           	move.l d1,d2
    11fe:	4242           	clr.w d2
    1200:	4842           	swap d2
    1202:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1206:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
    120a:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    1210:	2401           	move.l d1,d2
    1212:	4242           	clr.w d2
    1214:	4842           	swap d2
    1216:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    121a:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
    121e:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    1224:	2401           	move.l d1,d2
    1226:	4242           	clr.w d2
    1228:	4842           	swap d2
    122a:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    122e:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
    1232:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
    1238:	2200           	move.l d0,d1
    123a:	4241           	clr.w d1
    123c:	4841           	swap d1
    123e:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1242:	3540 0096      	move.w d0,150(a2)
    1246:	4fef 0014      	lea 20(sp),sp
}
    124a:	242d ffb8      	move.l -72(a5),d2
    124e:	246d ffbc      	movea.l -68(a5),a2
    1252:	4e5d           	unlk a5
    1254:	4e75           	rts
          Zoom_LevelOfZoom = 0;
    1256:	33fc 0000 0000 	move.w #0,326c <Zoom_LevelOfZoom>
    125c:	326c 
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
    125e:	33fc 000f 0000 	move.w #15,326e <Zoom_LevelOf102Zoom>
    1264:	326e 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    1266:	3039 0000 326c 	move.w 326c <Zoom_LevelOfZoom>,d0
  ULONG tmp = (ULONG) DrawBuffer;
    126c:	2039 0000 3254 	move.l 3254 <DrawBuffer>,d0
  DrawBuffer = ViewBuffer;
    1272:	23f9 0000 3258 	move.l 3258 <ViewBuffer>,3254 <DrawBuffer>
    1278:	0000 3254 
  ViewBuffer = (ULONG *) tmp;
    127c:	23c0 0000 3258 	move.l d0,3258 <ViewBuffer>
  	    *bp = 0;
    1282:	42b8 0102      	clr.l 102 <main+0x4e>
        Zoom_DrawPicture = 1;     
    1286:	7001           	moveq #1,d0
    1288:	23c0 0000 3240 	move.l d0,3240 <Zoom_DrawPicture>
    128e:	6000 fe2a      	bra.w 10ba <Zoom_VblankHandler+0x94>
    Zoom_Mousepressed = 0;
    1292:	4279 0000 326a 	clr.w 326a <Zoom_Mousepressed>
    1298:	6000 fdc6      	bra.w 1060 <Zoom_VblankHandler+0x3a>

0000129c <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    129c:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    12a0:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    12a4:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    12a8:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    12ac:	d041           	add.w d1,d0
	swap	d0
    12ae:	4840           	swap d0
	clrw	d0
    12b0:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    12b2:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    12b6:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    12ba:	d081           	add.l d1,d0
	rts
    12bc:	4e75           	rts

000012be <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    12be:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    12c0:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    12c4:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    12c8:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    12ce:	6416           	bcc.s 12e6 <__udivsi3+0x28>
	movel	d0, d2
    12d0:	2400           	move.l d0,d2
	clrw	d2
    12d2:	4242           	clr.w d2
	swap	d2
    12d4:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    12d6:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    12d8:	3002           	move.w d2,d0
	swap	d0
    12da:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    12dc:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    12e0:	84c1           	divu.w d1,d2
	movew	d2, d0
    12e2:	3002           	move.w d2,d0
	jra	6f
    12e4:	6030           	bra.s 1316 <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    12e6:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    12e8:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    12ea:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    12ec:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    12f2:	64f4           	bcc.s 12e8 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    12f4:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    12f6:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    12fc:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    12fe:	c2c0           	mulu.w d0,d1
	swap	d2
    1300:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    1302:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    1304:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    1306:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    1308:	660a           	bne.s 1314 <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    130a:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    130c:	6506           	bcs.s 1314 <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    130e:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    1312:	6302           	bls.s 1316 <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    1314:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    1316:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    1318:	4e75           	rts

0000131a <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    131a:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    131c:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    131e:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    1322:	6a04           	bpl.s 1328 <__divsi3+0xe>
	negl	d1
    1324:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    1326:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    1328:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    132c:	6a04           	bpl.s 1332 <__divsi3+0x18>
	negl	d0
    132e:	4480           	neg.l d0
	negb	d2
    1330:	4402           	neg.b d2

2:	movel	d1, sp@-
    1332:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    1334:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    1336:	6186           	bsr.s 12be <__udivsi3>
	addql	IMM (8), sp
    1338:	508f           	addq.l #8,sp

	tstb	d2
    133a:	4a02           	tst.b d2
	jpl	3f
    133c:	6a02           	bpl.s 1340 <__divsi3+0x26>
	negl	d0
    133e:	4480           	neg.l d0

3:	movel	sp@+, d2
    1340:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    1342:	4e75           	rts

00001344 <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1344:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1348:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    134c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    134e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    1350:	61c8           	bsr.s 131a <__divsi3>
	addql	IMM (8), sp
    1352:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    1354:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1358:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    135a:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    135c:	6100 ff3e      	bsr.w 129c <__mulsi3>
	addql	IMM (8), sp
    1360:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    1362:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1366:	9280           	sub.l d0,d1
	movel	d1, d0
    1368:	2001           	move.l d1,d0
	rts
    136a:	4e75           	rts

0000136c <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    136c:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1370:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1374:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1376:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    1378:	6100 ff44      	bsr.w 12be <__udivsi3>
	addql	IMM (8), sp
    137c:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    137e:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1382:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1384:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1386:	6100 ff14      	bsr.w 129c <__mulsi3>
	addql	IMM (8), sp
    138a:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    138c:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1390:	9280           	sub.l d0,d1
	movel	d1, d0
    1392:	2001           	move.l d1,d0
	rts
    1394:	4e75           	rts

00001396 <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    1396:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    1398:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    139c:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    13a0:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    13a2:	4e75           	rts

000013a4 <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    13a4:	16c0           	move.b d0,(a3)+
	rts
    13a6:	4e75           	rts

000013a8 <c2p1x1_8_c5_gen_init>:
    13a8:	48f9 7fff 0000 	movem.l d0-a6,13e8 <.gi_saveregs>
    13ae:	13e8 
    13b0:	202f 0004      	move.l 4(sp),d0
    13b4:	222f 0008      	move.l 8(sp),d1
    13b8:	242f 000c      	move.l 12(sp),d2
    13bc:	262f 0010      	move.l 16(sp),d3
    13c0:	282f 0014      	move.l 20(sp),d4
    13c4:	2a2f 0018      	move.l 24(sp),d5
    13c8:	0280 0000 ffff 	andi.l #65535,d0
    13ce:	c6c0           	mulu.w d0,d3
    13d0:	e68b           	lsr.l #3,d3
    13d2:	23c3 0000 173e 	move.l d3,173e <c2p1x1_8_c5_gen_scroffs>
    13d8:	c2c0           	mulu.w d0,d1
    13da:	23c1 0000 1742 	move.l d1,1742 <c2p1x1_8_c5_gen_pixels>
    13e0:	4cfa 7fff 0004 	movem.l 13e8 <.gi_saveregs>(pc),d0-a6
    13e6:	4e75           	rts

000013e8 <.gi_saveregs>:
	...

00001424 <c2p1x1_8_c5_gen>:
    1424:	48f9 7fff 0000 	movem.l d0-a6,1702 <.c2p_saveregs>
    142a:	1702 
    142c:	4cef 0100 0004 	movem.l 4(sp),a0
    1432:	4cef 0200 0008 	movem.l 8(sp),a1
    1438:	2a3c 3333 3333 	move.l #858993459,d5
    143e:	2c7c 5555 5555 	movea.l #1431655765,a6
    1444:	d2fc 2bf8      	adda.w #11256,a1
    1448:	d3fa 02f4      	adda.l 173e <c2p1x1_8_c5_gen_scroffs>(pc),a1
    144c:	247a 02f4      	movea.l 1742 <c2p1x1_8_c5_gen_pixels>(pc),a2
    1450:	d5c8           	adda.l a0,a2
    1452:	b5c8           	cmpa.l a0,a2
    1454:	6700 02a4      	beq.w 16fa <.none>
    1458:	48e7 00c0      	movem.l a0-a1,-(sp)
    145c:	2018           	move.l (a0)+,d0
    145e:	2418           	move.l (a0)+,d2
    1460:	2218           	move.l (a0)+,d1
    1462:	2618           	move.l (a0)+,d3
    1464:	283c 0f0f 0f0f 	move.l #252645135,d4
    146a:	c084           	and.l d4,d0
    146c:	c284           	and.l d4,d1
    146e:	c484           	and.l d4,d2
    1470:	c684           	and.l d4,d3
    1472:	e988           	lsl.l #4,d0
    1474:	e989           	lsl.l #4,d1
    1476:	8082           	or.l d2,d0
    1478:	8283           	or.l d3,d1
    147a:	2418           	move.l (a0)+,d2
    147c:	2c18           	move.l (a0)+,d6
    147e:	2618           	move.l (a0)+,d3
    1480:	2e18           	move.l (a0)+,d7
    1482:	c484           	and.l d4,d2
    1484:	cc84           	and.l d4,d6
    1486:	c684           	and.l d4,d3
    1488:	ce84           	and.l d4,d7
    148a:	e98a           	lsl.l #4,d2
    148c:	e98b           	lsl.l #4,d3
    148e:	8486           	or.l d6,d2
    1490:	8687           	or.l d7,d3
    1492:	3c02           	move.w d2,d6
    1494:	3e03           	move.w d3,d7
    1496:	3400           	move.w d0,d2
    1498:	3601           	move.w d1,d3
    149a:	4842           	swap d2
    149c:	4843           	swap d3
    149e:	3002           	move.w d2,d0
    14a0:	3203           	move.w d3,d1
    14a2:	3406           	move.w d6,d2
    14a4:	3607           	move.w d7,d3
    14a6:	2c02           	move.l d2,d6
    14a8:	2e03           	move.l d3,d7
    14aa:	e48e           	lsr.l #2,d6
    14ac:	e48f           	lsr.l #2,d7
    14ae:	b186           	eor.l d0,d6
    14b0:	b387           	eor.l d1,d7
    14b2:	cc85           	and.l d5,d6
    14b4:	ce85           	and.l d5,d7
    14b6:	bd80           	eor.l d6,d0
    14b8:	bf81           	eor.l d7,d1
    14ba:	e58e           	lsl.l #2,d6
    14bc:	e58f           	lsl.l #2,d7
    14be:	bd82           	eor.l d6,d2
    14c0:	bf83           	eor.l d7,d3
    14c2:	283c 00ff 00ff 	move.l #16711935,d4
    14c8:	2c01           	move.l d1,d6
    14ca:	2e03           	move.l d3,d7
    14cc:	e08e           	lsr.l #8,d6
    14ce:	e08f           	lsr.l #8,d7
    14d0:	b186           	eor.l d0,d6
    14d2:	b587           	eor.l d2,d7
    14d4:	6000 0088      	bra.w 155e <.start1>

000014d8 <.x1>:
    14d8:	2018           	move.l (a0)+,d0
    14da:	2418           	move.l (a0)+,d2
    14dc:	2218           	move.l (a0)+,d1
    14de:	2618           	move.l (a0)+,d3
    14e0:	2347 d408      	move.l d7,-11256(a1)
    14e4:	283c 0f0f 0f0f 	move.l #252645135,d4
    14ea:	c084           	and.l d4,d0
    14ec:	c284           	and.l d4,d1
    14ee:	c484           	and.l d4,d2
    14f0:	c684           	and.l d4,d3
    14f2:	e988           	lsl.l #4,d0
    14f4:	e989           	lsl.l #4,d1
    14f6:	8082           	or.l d2,d0
    14f8:	8283           	or.l d3,d1
    14fa:	2418           	move.l (a0)+,d2
    14fc:	2c18           	move.l (a0)+,d6
    14fe:	2618           	move.l (a0)+,d3
    1500:	2e18           	move.l (a0)+,d7
    1502:	234b 2bf8      	move.l a3,11256(a1)
    1506:	c484           	and.l d4,d2
    1508:	cc84           	and.l d4,d6
    150a:	c684           	and.l d4,d3
    150c:	ce84           	and.l d4,d7
    150e:	e98a           	lsl.l #4,d2
    1510:	e98b           	lsl.l #4,d3
    1512:	8486           	or.l d6,d2
    1514:	8687           	or.l d7,d3
    1516:	3c02           	move.w d2,d6
    1518:	3e03           	move.w d3,d7
    151a:	3400           	move.w d0,d2
    151c:	3601           	move.w d1,d3
    151e:	4842           	swap d2
    1520:	4843           	swap d3
    1522:	3002           	move.w d2,d0
    1524:	3203           	move.w d3,d1
    1526:	3406           	move.w d6,d2
    1528:	3607           	move.w d7,d3
    152a:	234c 57f0      	move.l a4,22512(a1)
    152e:	2c02           	move.l d2,d6
    1530:	2e03           	move.l d3,d7
    1532:	e48e           	lsr.l #2,d6
    1534:	e48f           	lsr.l #2,d7
    1536:	b186           	eor.l d0,d6
    1538:	b387           	eor.l d1,d7
    153a:	cc85           	and.l d5,d6
    153c:	ce85           	and.l d5,d7
    153e:	bd80           	eor.l d6,d0
    1540:	bf81           	eor.l d7,d1
    1542:	e58e           	lsl.l #2,d6
    1544:	e58f           	lsl.l #2,d7
    1546:	bd82           	eor.l d6,d2
    1548:	bf83           	eor.l d7,d3
    154a:	283c 00ff 00ff 	move.l #16711935,d4
    1550:	2c01           	move.l d1,d6
    1552:	2e03           	move.l d3,d7
    1554:	e08e           	lsr.l #8,d6
    1556:	e08f           	lsr.l #8,d7
    1558:	b186           	eor.l d0,d6
    155a:	b587           	eor.l d2,d7
    155c:	22cd           	move.l a5,(a1)+

0000155e <.start1>:
    155e:	cc84           	and.l d4,d6
    1560:	ce84           	and.l d4,d7
    1562:	bd80           	eor.l d6,d0
    1564:	bf82           	eor.l d7,d2
    1566:	e18e           	lsl.l #8,d6
    1568:	e18f           	lsl.l #8,d7
    156a:	bd81           	eor.l d6,d1
    156c:	bf83           	eor.l d7,d3
    156e:	280e           	move.l a6,d4
    1570:	2c01           	move.l d1,d6
    1572:	2e03           	move.l d3,d7
    1574:	e28e           	lsr.l #1,d6
    1576:	e28f           	lsr.l #1,d7
    1578:	b186           	eor.l d0,d6
    157a:	b587           	eor.l d2,d7
    157c:	cc84           	and.l d4,d6
    157e:	ce84           	and.l d4,d7
    1580:	bd80           	eor.l d6,d0
    1582:	bf82           	eor.l d7,d2
    1584:	dc86           	add.l d6,d6
    1586:	de87           	add.l d7,d7
    1588:	b386           	eor.l d1,d6
    158a:	b787           	eor.l d3,d7
    158c:	2840           	movea.l d0,a4
    158e:	2a42           	movea.l d2,a5
    1590:	2646           	movea.l d6,a3
    1592:	b5c8           	cmpa.l a0,a2
    1594:	6600 ff42      	bne.w 14d8 <.x1>
    1598:	2347 d408      	move.l d7,-11256(a1)
    159c:	234b 2bf8      	move.l a3,11256(a1)
    15a0:	234c 57f0      	move.l a4,22512(a1)
    15a4:	22cd           	move.l a5,(a1)+
    15a6:	4cdf 0300      	movem.l (sp)+,a0-a1
    15aa:	d3fc 0000 afe0 	adda.l #45024,a1
    15b0:	2018           	move.l (a0)+,d0
    15b2:	2418           	move.l (a0)+,d2
    15b4:	2218           	move.l (a0)+,d1
    15b6:	2618           	move.l (a0)+,d3
    15b8:	283c f0f0 f0f0 	move.l #-252645136,d4
    15be:	c084           	and.l d4,d0
    15c0:	c284           	and.l d4,d1
    15c2:	c484           	and.l d4,d2
    15c4:	c684           	and.l d4,d3
    15c6:	e88a           	lsr.l #4,d2
    15c8:	e88b           	lsr.l #4,d3
    15ca:	8082           	or.l d2,d0
    15cc:	8283           	or.l d3,d1
    15ce:	2418           	move.l (a0)+,d2
    15d0:	2c18           	move.l (a0)+,d6
    15d2:	2618           	move.l (a0)+,d3
    15d4:	2e18           	move.l (a0)+,d7
    15d6:	c484           	and.l d4,d2
    15d8:	cc84           	and.l d4,d6
    15da:	c684           	and.l d4,d3
    15dc:	ce84           	and.l d4,d7
    15de:	e88e           	lsr.l #4,d6
    15e0:	e88f           	lsr.l #4,d7
    15e2:	8486           	or.l d6,d2
    15e4:	8687           	or.l d7,d3
    15e6:	3c02           	move.w d2,d6
    15e8:	3e03           	move.w d3,d7
    15ea:	3400           	move.w d0,d2
    15ec:	3601           	move.w d1,d3
    15ee:	4842           	swap d2
    15f0:	4843           	swap d3
    15f2:	3002           	move.w d2,d0
    15f4:	3203           	move.w d3,d1
    15f6:	3406           	move.w d6,d2
    15f8:	3607           	move.w d7,d3
    15fa:	2c02           	move.l d2,d6
    15fc:	2e03           	move.l d3,d7
    15fe:	e48e           	lsr.l #2,d6
    1600:	e48f           	lsr.l #2,d7
    1602:	b186           	eor.l d0,d6
    1604:	b387           	eor.l d1,d7
    1606:	cc85           	and.l d5,d6
    1608:	ce85           	and.l d5,d7
    160a:	bd80           	eor.l d6,d0
    160c:	bf81           	eor.l d7,d1
    160e:	e58e           	lsl.l #2,d6
    1610:	e58f           	lsl.l #2,d7
    1612:	bd82           	eor.l d6,d2
    1614:	bf83           	eor.l d7,d3
    1616:	283c 00ff 00ff 	move.l #16711935,d4
    161c:	2c01           	move.l d1,d6
    161e:	2e03           	move.l d3,d7
    1620:	e08e           	lsr.l #8,d6
    1622:	e08f           	lsr.l #8,d7
    1624:	b186           	eor.l d0,d6
    1626:	b587           	eor.l d2,d7
    1628:	6000 0088      	bra.w 16b2 <.start2>

0000162c <.x2>:
    162c:	2018           	move.l (a0)+,d0
    162e:	2418           	move.l (a0)+,d2
    1630:	2218           	move.l (a0)+,d1
    1632:	2618           	move.l (a0)+,d3
    1634:	2347 d408      	move.l d7,-11256(a1)
    1638:	283c f0f0 f0f0 	move.l #-252645136,d4
    163e:	c084           	and.l d4,d0
    1640:	c284           	and.l d4,d1
    1642:	c484           	and.l d4,d2
    1644:	c684           	and.l d4,d3
    1646:	e88a           	lsr.l #4,d2
    1648:	e88b           	lsr.l #4,d3
    164a:	8082           	or.l d2,d0
    164c:	8283           	or.l d3,d1
    164e:	2418           	move.l (a0)+,d2
    1650:	2c18           	move.l (a0)+,d6
    1652:	2618           	move.l (a0)+,d3
    1654:	2e18           	move.l (a0)+,d7
    1656:	234b 2bf8      	move.l a3,11256(a1)
    165a:	c484           	and.l d4,d2
    165c:	cc84           	and.l d4,d6
    165e:	c684           	and.l d4,d3
    1660:	ce84           	and.l d4,d7
    1662:	e88e           	lsr.l #4,d6
    1664:	e88f           	lsr.l #4,d7
    1666:	8486           	or.l d6,d2
    1668:	8687           	or.l d7,d3
    166a:	3c02           	move.w d2,d6
    166c:	3e03           	move.w d3,d7
    166e:	3400           	move.w d0,d2
    1670:	3601           	move.w d1,d3
    1672:	4842           	swap d2
    1674:	4843           	swap d3
    1676:	3002           	move.w d2,d0
    1678:	3203           	move.w d3,d1
    167a:	3406           	move.w d6,d2
    167c:	3607           	move.w d7,d3
    167e:	234c 57f0      	move.l a4,22512(a1)
    1682:	2c02           	move.l d2,d6
    1684:	2e03           	move.l d3,d7
    1686:	e48e           	lsr.l #2,d6
    1688:	e48f           	lsr.l #2,d7
    168a:	b186           	eor.l d0,d6
    168c:	b387           	eor.l d1,d7
    168e:	cc85           	and.l d5,d6
    1690:	ce85           	and.l d5,d7
    1692:	bd80           	eor.l d6,d0
    1694:	bf81           	eor.l d7,d1
    1696:	e58e           	lsl.l #2,d6
    1698:	e58f           	lsl.l #2,d7
    169a:	bd82           	eor.l d6,d2
    169c:	bf83           	eor.l d7,d3
    169e:	283c 00ff 00ff 	move.l #16711935,d4
    16a4:	2c01           	move.l d1,d6
    16a6:	2e03           	move.l d3,d7
    16a8:	e08e           	lsr.l #8,d6
    16aa:	e08f           	lsr.l #8,d7
    16ac:	b186           	eor.l d0,d6
    16ae:	b587           	eor.l d2,d7
    16b0:	22cd           	move.l a5,(a1)+

000016b2 <.start2>:
    16b2:	cc84           	and.l d4,d6
    16b4:	ce84           	and.l d4,d7
    16b6:	bd80           	eor.l d6,d0
    16b8:	bf82           	eor.l d7,d2
    16ba:	e18e           	lsl.l #8,d6
    16bc:	e18f           	lsl.l #8,d7
    16be:	bd81           	eor.l d6,d1
    16c0:	bf83           	eor.l d7,d3
    16c2:	280e           	move.l a6,d4
    16c4:	2c01           	move.l d1,d6
    16c6:	2e03           	move.l d3,d7
    16c8:	e28e           	lsr.l #1,d6
    16ca:	e28f           	lsr.l #1,d7
    16cc:	b186           	eor.l d0,d6
    16ce:	b587           	eor.l d2,d7
    16d0:	cc84           	and.l d4,d6
    16d2:	ce84           	and.l d4,d7
    16d4:	bd80           	eor.l d6,d0
    16d6:	bf82           	eor.l d7,d2
    16d8:	dc86           	add.l d6,d6
    16da:	de87           	add.l d7,d7
    16dc:	b386           	eor.l d1,d6
    16de:	b787           	eor.l d3,d7
    16e0:	2840           	movea.l d0,a4
    16e2:	2a42           	movea.l d2,a5
    16e4:	2646           	movea.l d6,a3
    16e6:	b5c8           	cmpa.l a0,a2
    16e8:	6600 ff42      	bne.w 162c <.x2>
    16ec:	2347 d408      	move.l d7,-11256(a1)
    16f0:	234b 2bf8      	move.l a3,11256(a1)
    16f4:	234c 57f0      	move.l a4,22512(a1)
    16f8:	22cd           	move.l a5,(a1)+

000016fa <.none>:
    16fa:	4cfa 7fff 0004 	movem.l 1702 <.c2p_saveregs>(pc),d0-a6
    1700:	4e75           	rts

00001702 <.c2p_saveregs>:
	...

0000173e <c2p1x1_8_c5_gen_scroffs>:
    173e:	0000 0001      	ori.b #1,d0

00001742 <c2p1x1_8_c5_gen_pixels>:
    1742:	0000 0001      	ori.b #1,d0
