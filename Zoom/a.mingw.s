
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
      b6:	48e7 313a      	movem.l d2-d3/d7/a2-a4/a6,-(sp)

	UWORD *bp = 0x100;
	*bp = 0;
      ba:	4278 0100      	clr.w 100 <main+0x4c>

	//Get AMOS Params
	register ULONG *asmparams;
	asm("\t move.l %%a3,%0" : "=r"(asmparams));
      be:	204b           	movea.l a3,a0
	Zoom_Rawany = *asmparams++;
      c0:	23d0 0000 33b6 	move.l (a0),33b6 <Zoom_Rawany>
	Zoom_Rawfast = *asmparams++;
      c6:	23e8 0004 0000 	move.l 4(a0),33b2 <Zoom_Rawfast>
      cc:	33b2 
	Zoom_Rawchip = *asmparams;
      ce:	23e8 0008 0000 	move.l 8(a0),33ae <Zoom_Rawchip>
      d4:	33ae 

	ULONG tmp = 4;
    SysBase = *((struct ExecBase**)tmp);
	hw = (struct Custom*)0xdff000;
      d6:	23fc 00df f000 	move.l #14675968,3234 <hw>
      dc:	0000 3234 

	SysBase = *((struct ExecBase**)4UL);
      e0:	2c78 0004      	movea.l 4 <_start+0x4>,a6
      e4:	23ce 0000 33aa 	move.l a6,33aa <SysBase>
	custom = (struct Custom*)0xdff000;

	// We will use the graphics library only to locate and restore the system copper list once we are through.
	GfxBase = (struct GfxBase *)OpenLibrary((CONST_STRPTR)"graphics.library",0);
      ea:	43f9 0000 1dac 	lea 1dac <c2p1x1_8_c5_gen_pixels+0xb2>,a1
      f0:	7000           	moveq #0,d0
      f2:	4eae fdd8      	jsr -552(a6)
	if (!GfxBase)
      f6:	4a80           	tst.l d0
      f8:	6700 0352      	beq.w 44c <main+0x398>
		Exit(0);

	// used for printing
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
      fc:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     102:	43f9 0000 1dbd 	lea 1dbd <c2p1x1_8_c5_gen_pixels+0xc3>,a1
     108:	7000           	moveq #0,d0
     10a:	4eae fdd8      	jsr -552(a6)
     10e:	23c0 0000 33a6 	move.l d0,33a6 <DOSBase>
	if (!DOSBase)
     114:	6700 027e      	beq.w 394 <main+0x2e0>
		Exit(0);

#ifdef __cplusplus
	KPrintF("Hello debugger from Amiga: %ld!\n", staticClass.i);
#else
	KPrintF("Hello debugger from Amiga!\n");
     118:	4879 0000 1dc9 	pea 1dc9 <c2p1x1_8_c5_gen_pixels+0xcf>
     11e:	4eb9 0000 076a 	jsr 76a <KPrintF>
#endif
	Write(Output(), (APTR)"Hello console!\n", 15);
     124:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     12a:	4eae ffc4      	jsr -60(a6)
     12e:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     134:	2200           	move.l d0,d1
     136:	243c 0000 1de5 	move.l #7653,d2
     13c:	760f           	moveq #15,d3
     13e:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     142:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     148:	7232           	moveq #50,d1
     14a:	4eae ff3a      	jsr -198(a6)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     14e:	3f7c 4e7a 0022 	move.w #20090,34(sp)
     154:	3f7c 0801 0024 	move.w #2049,36(sp)
     15a:	3f7c 4e73 0026 	move.w #20083,38(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     160:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     166:	588f           	addq.l #4,sp
     168:	082e 0000 0129 	btst #0,297(a6)
     16e:	6700 0286      	beq.w 3f6 <main+0x342>
		vbr = (APTR)Supervisor((ULONG (*)())getvbr);
     172:	7e1e           	moveq #30,d7
     174:	de8f           	add.l sp,d7
     176:	cf8d           	exg d7,a5
     178:	4eae ffe2      	jsr -30(a6)
     17c:	cf8d           	exg d7,a5
	VBR=GetVBR();
     17e:	23c0 0000 323c 	move.l d0,323c <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     184:	2079 0000 323c 	movea.l 323c <VBR>,a0
     18a:	2028 006c      	move.l 108(a0),d0
	//warpmode(0);

	TakeSystem();


	WaitVbl();
     18e:	45f9 0000 0c82 	lea c82 <WaitVbl>,a2
     194:	4e92           	jsr (a2)
	
    hw->dmacon = 0b1000011111111111;
     196:	2079 0000 3234 	movea.l 3234 <hw>,a0
     19c:	317c 87ff 0096 	move.w #-30721,150(a0)
  Zoom_Rawfast = rawzoom_fast;*/

  int i = 0;

  for(;i<2;i++) {
    imgptrs[i] = Zoom_Rawchip + 56280*i;
     1a2:	2039 0000 33ae 	move.l 33ae <Zoom_Rawchip>,d0
     1a8:	47f9 0000 3246 	lea 3246 <imgptrs>,a3
     1ae:	2680           	move.l d0,(a3)
     1b0:	0680 0000 dbd8 	addi.l #56280,d0
     1b6:	23c0 0000 324a 	move.l d0,324a <imgptrs+0x4>
  }

  for(;i<27;i++) {
    imgptrs[i] = Zoom_Rawany + 56280*(i-2);
     1bc:	2039 0000 33b6 	move.l 33b6 <Zoom_Rawany>,d0
     1c2:	41f9 0000 324e 	lea 324e <imgptrs+0x8>,a0
     1c8:	223c 0000 32b2 	move.l #12978,d1
     1ce:	20c0           	move.l d0,(a0)+
  for(;i<27;i++) {
     1d0:	0680 0000 dbd8 	addi.l #56280,d0
     1d6:	b1c1           	cmpa.l d1,a0
     1d8:	66f4           	bne.s 1ce <main+0x11a>
  }

  for(;i<88;i++) {
    imgptrs[i] = Zoom_Rawfast + 56280*(i-27);
     1da:	2039 0000 33b2 	move.l 33b2 <Zoom_Rawfast>,d0
     1e0:	41f9 0000 32b2 	lea 32b2 <imgptrs+0x6c>,a0
     1e6:	223c 0000 33a6 	move.l #13222,d1
     1ec:	20c0           	move.l d0,(a0)+
  for(;i<88;i++) {
     1ee:	0680 0000 dbd8 	addi.l #56280,d0
     1f4:	b1c1           	cmpa.l d1,a0
     1f6:	66f4           	bne.s 1ec <main+0x138>
  }

  Zoom_Counter = 0;
     1f8:	4279 0000 3244 	clr.w 3244 <Zoom_Counter>
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
     1fe:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     204:	7004           	moveq #4,d0
     206:	7202           	moveq #2,d1
     208:	4eae ff3a      	jsr -198(a6)
  Zoom_LevelOf102Zoom = 15;
     20c:	33fc 000f 0000 	move.w #15,3242 <Zoom_LevelOf102Zoom>
     212:	3242 
  RemIntServer(INTB_VERTB, Zoom_vbint);
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
}
  
int Zoom_PrepareDisplay() {
  ViewBuffer = imgptrs[0];
     214:	23d3 0000 3228 	move.l (a3),3228 <ViewBuffer>
  DrawBuffer = imgptrs[1];
     21a:	23f9 0000 324a 	move.l 324a <imgptrs+0x4>,3224 <DrawBuffer>
     220:	0000 3224 
  /*ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);*/
  /*Utils_CopyMem( imgptrs[0], ViewBuffer, 14070);
  Utils_CopyMem( imgptrs[0], DrawBuffer, 14070);*/
  Copperlist1 = ClbuildZoom( );
     224:	49f9 0000 0d70 	lea d70 <ClbuildZoom>,a4
     22a:	4e94           	jsr (a4)
     22c:	23c0 0000 321c 	move.l d0,321c <Copperlist1>
  Copperlist2 = ClbuildZoom( );
     232:	4e94           	jsr (a4)
     234:	23c0 0000 3220 	move.l d0,3220 <Copperlist2>
  
  DrawCopper = Copperlist1;
     23a:	2239 0000 321c 	move.l 321c <Copperlist1>,d1
     240:	23c1 0000 322c 	move.l d1,322c <DrawCopper>
  ViewCopper = Copperlist2;
     246:	23c0 0000 3230 	move.l d0,3230 <ViewCopper>
  Zoom_Shrink102( 15, Copperlist1);
     24c:	2f01           	move.l d1,-(sp)
     24e:	4878 000f      	pea f <_start+0xf>
     252:	49f9 0000 09e6 	lea 9e6 <Zoom_Shrink102>,a4
     258:	4e94           	jsr (a4)
  Zoom_Shrink102( 15, Copperlist2);
     25a:	2f39 0000 3220 	move.l 3220 <Copperlist2>,-(sp)
     260:	4878 000f      	pea f <_start+0xf>
     264:	4e94           	jsr (a4)
  Zoom_LevelOfZoom = 1;
     266:	33fc 0001 0000 	move.w #1,3240 <Zoom_LevelOfZoom>
     26c:	3240 
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
     26e:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     274:	7016           	moveq #22,d0
     276:	223c 0001 0001 	move.l #65537,d1
     27c:	4eae ff3a      	jsr -198(a6)
     280:	2240           	movea.l d0,a1
     282:	23c0 0000 33a2 	move.l d0,33a2 <Zoom_vbint>
     288:	4fef 0010      	lea 16(sp),sp
     28c:	671a           	beq.s 2a8 <main+0x1f4>
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
     28e:	337c 02c4 0008 	move.w #708,8(a1)
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
     294:	237c 0000 1df5 	move.l #7669,10(a1)
     29a:	000a 
    Zoom_vbint->is_Data = NULL;
     29c:	42a9 000e      	clr.l 14(a1)
    Zoom_vbint->is_Code = Zoom_VblankHandler;
     2a0:	237c 0000 10dc 	move.l #4316,18(a1)
     2a6:	0012 
  AddIntServer( INTB_VERTB, Zoom_vbint);
     2a8:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     2ae:	7005           	moveq #5,d0
     2b0:	4eae ff58      	jsr -168(a6)
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
     2b4:	2f39 0000 3230 	move.l 3230 <ViewCopper>,-(sp)
     2ba:	2f39 0000 3228 	move.l 3228 <ViewBuffer>,-(sp)
     2c0:	49f9 0000 0cc8 	lea cc8 <Zoom_SetBplPointers>,a4
     2c6:	4e94           	jsr (a4)
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
     2c8:	2f39 0000 322c 	move.l 322c <DrawCopper>,-(sp)
     2ce:	2f39 0000 3228 	move.l 3228 <ViewBuffer>,-(sp)
     2d4:	4e94           	jsr (a4)
  SwapCl();
     2d6:	4eb9 0000 0538 	jsr 538 <SwapCl>
        if( Zoom_Pic > 1) {
     2dc:	2439 0000 230c 	move.l 230c <Zoom_Pic>,d2
     2e2:	4fef 0010      	lea 16(sp),sp
     2e6:	7602           	moveq #2,d3
          Utils_CopyMem(imgptrs[Zoom_Pic], DrawBuffer, 14070);  
     2e8:	49f9 0000 09ce 	lea 9ce <Utils_CopyMem.constprop.0>,a4
      WaitVbl();
     2ee:	4e92           	jsr (a2)
      if( Zoom_DrawPicture == 1) {    
     2f0:	2039 0000 2310 	move.l 2310 <Zoom_DrawPicture>,d0
     2f6:	7201           	moveq #1,d1
     2f8:	b280           	cmp.l d0,d1
     2fa:	6742           	beq.s 33e <main+0x28a>
      if(Zoom_Pic == 87 ) {
     2fc:	7257           	moveq #87,d1
     2fe:	b282           	cmp.l d2,d1
     300:	66ec           	bne.s 2ee <main+0x23a>
        Zoom_Pic = 10;
     302:	700a           	moveq #10,d0
     304:	23c0 0000 230c 	move.l d0,230c <Zoom_Pic>
  for(int i=0;i <2; i++)
     30a:	740a           	moveq #10,d2
     30c:	5383           	subq.l #1,d3
     30e:	6670           	bne.s 380 <main+0x2cc>
  RemIntServer(INTB_VERTB, Zoom_vbint);
     310:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     316:	7005           	moveq #5,d0
     318:	2279 0000 33a2 	movea.l 33a2 <Zoom_vbint>,a1
     31e:	4eae ff52      	jsr -174(a6)
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
     322:	2f3c 0000 df20 	move.l #57120,-(sp)
     328:	4878 031c      	pea 31c <main+0x268>
     32c:	4eb9 0000 0478 	jsr 478 <FreeDisplay>
     332:	508f           	addq.l #8,sp
  	Zoom_InitRun();
	Zoom_Run();
	Zoom_Dealloc();
}
     334:	7000           	moveq #0,d0
     336:	4cdf 5c8c      	movem.l (sp)+,d2-d3/d7/a2-a4/a6
     33a:	508f           	addq.l #8,sp
     33c:	4e75           	rts
        if( Zoom_Pic > 1) {
     33e:	b282           	cmp.l d2,d1
     340:	6d18           	blt.s 35a <main+0x2a6>
        Zoom_DrawPicture = 0;
     342:	7000           	moveq #0,d0
     344:	23c0 0000 2310 	move.l d0,2310 <Zoom_DrawPicture>
        Zoom_Pic++;
     34a:	5282           	addq.l #1,d2
     34c:	23c2 0000 230c 	move.l d2,230c <Zoom_Pic>
      if(Zoom_Pic == 87 ) {
     352:	7257           	moveq #87,d1
     354:	b282           	cmp.l d2,d1
     356:	6696           	bne.s 2ee <main+0x23a>
     358:	60a8           	bra.s 302 <main+0x24e>
          Utils_CopyMem(imgptrs[Zoom_Pic], DrawBuffer, 14070);  
     35a:	2f39 0000 3224 	move.l 3224 <DrawBuffer>,-(sp)
     360:	2002           	move.l d2,d0
     362:	d082           	add.l d2,d0
     364:	d080           	add.l d0,d0
     366:	2f33 0800      	move.l (0,a3,d0.l),-(sp)
     36a:	4e94           	jsr (a4)
     36c:	508f           	addq.l #8,sp
        Zoom_DrawPicture = 0;
     36e:	7000           	moveq #0,d0
     370:	23c0 0000 2310 	move.l d0,2310 <Zoom_DrawPicture>
        Zoom_Pic++;
     376:	5282           	addq.l #1,d2
     378:	23c2 0000 230c 	move.l d2,230c <Zoom_Pic>
     37e:	60d2           	bra.s 352 <main+0x29e>
  for(int i=0;i <2; i++)
     380:	7601           	moveq #1,d3
      WaitVbl();
     382:	4e92           	jsr (a2)
      if( Zoom_DrawPicture == 1) {    
     384:	2039 0000 2310 	move.l 2310 <Zoom_DrawPicture>,d0
     38a:	7201           	moveq #1,d1
     38c:	b280           	cmp.l d0,d1
     38e:	6600 ff6c      	bne.w 2fc <main+0x248>
     392:	60aa           	bra.s 33e <main+0x28a>
		Exit(0);
     394:	9dce           	suba.l a6,a6
     396:	7200           	moveq #0,d1
     398:	4eae ff70      	jsr -144(a6)
	KPrintF("Hello debugger from Amiga!\n");
     39c:	4879 0000 1dc9 	pea 1dc9 <c2p1x1_8_c5_gen_pixels+0xcf>
     3a2:	4eb9 0000 076a 	jsr 76a <KPrintF>
	Write(Output(), (APTR)"Hello console!\n", 15);
     3a8:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     3ae:	4eae ffc4      	jsr -60(a6)
     3b2:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     3b8:	2200           	move.l d0,d1
     3ba:	243c 0000 1de5 	move.l #7653,d2
     3c0:	760f           	moveq #15,d3
     3c2:	4eae ffd0      	jsr -48(a6)
	Delay(50);
     3c6:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     3cc:	7232           	moveq #50,d1
     3ce:	4eae ff3a      	jsr -198(a6)
	UWORD getvbr[] = { 0x4e7a, 0x0801, 0x4e73 }; // MOVEC.L VBR,D0 RTE
     3d2:	3f7c 4e7a 0022 	move.w #20090,34(sp)
     3d8:	3f7c 0801 0024 	move.w #2049,36(sp)
     3de:	3f7c 4e73 0026 	move.w #20083,38(sp)
	if (SysBase->AttnFlags & AFF_68010) 
     3e4:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     3ea:	588f           	addq.l #4,sp
     3ec:	082e 0000 0129 	btst #0,297(a6)
     3f2:	6600 fd7e      	bne.w 172 <main+0xbe>
	APTR vbr = 0;
     3f6:	7000           	moveq #0,d0
	VBR=GetVBR();
     3f8:	23c0 0000 323c 	move.l d0,323c <VBR>
	return *(volatile APTR*)(((UBYTE*)VBR)+0x6c);
     3fe:	2079 0000 323c 	movea.l 323c <VBR>,a0
     404:	2028 006c      	move.l 108(a0),d0
	WaitVbl();
     408:	45f9 0000 0c82 	lea c82 <WaitVbl>,a2
     40e:	4e92           	jsr (a2)
    hw->dmacon = 0b1000011111111111;
     410:	2079 0000 3234 	movea.l 3234 <hw>,a0
     416:	317c 87ff 0096 	move.w #-30721,150(a0)
    imgptrs[i] = Zoom_Rawchip + 56280*i;
     41c:	2039 0000 33ae 	move.l 33ae <Zoom_Rawchip>,d0
     422:	47f9 0000 3246 	lea 3246 <imgptrs>,a3
     428:	2680           	move.l d0,(a3)
     42a:	0680 0000 dbd8 	addi.l #56280,d0
     430:	23c0 0000 324a 	move.l d0,324a <imgptrs+0x4>
    imgptrs[i] = Zoom_Rawany + 56280*(i-2);
     436:	2039 0000 33b6 	move.l 33b6 <Zoom_Rawany>,d0
     43c:	41f9 0000 324e 	lea 324e <imgptrs+0x8>,a0
     442:	223c 0000 32b2 	move.l #12978,d1
     448:	6000 fd84      	bra.w 1ce <main+0x11a>
		Exit(0);
     44c:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     452:	7200           	moveq #0,d1
     454:	4eae ff70      	jsr -144(a6)
	DOSBase = (struct DosLibrary*)OpenLibrary((CONST_STRPTR)"dos.library", 0);
     458:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     45e:	43f9 0000 1dbd 	lea 1dbd <c2p1x1_8_c5_gen_pixels+0xc3>,a1
     464:	7000           	moveq #0,d0
     466:	4eae fdd8      	jsr -552(a6)
     46a:	23c0 0000 33a6 	move.l d0,33a6 <DOSBase>
	if (!DOSBase)
     470:	6600 fca6      	bne.w 118 <main+0x64>
     474:	6000 ff1e      	bra.w 394 <main+0x2e0>

00000478 <FreeDisplay>:
ULONG ClColor[] = { 0x1800000,0x1820db7,0x1840cdb,0x1860bb9,0x1880ab4,0x18a09a7,0x18c0875,0x18e0886,0x1900763,0x1920662,0x1940331,0x19608ad,0x1980272,0x19a0131,0x19c0463,0x19e0584,0x1a00342,0x1a20121,0x1a40222,
                    0x1a60110,0x1a80793,0x1aa0ab4,0x1ac09a7,0x1ae0cd5,0x1b00cc2,0x1b20886,0x1b40fff,0x1b60431,0x1b80db7,0x1ba0740,0x1bc0875,0x1be0ed9 };



void FreeDisplay( int clsize, int bplsize) {
     478:	4fef fff0      	lea -16(sp),sp
     47c:	2f0e           	move.l a6,-(sp)
  if( Copperlist1 != 0) FreeMem( Copperlist1, clsize);
     47e:	2039 0000 321c 	move.l 321c <Copperlist1>,d0
     484:	6722           	beq.s 4a8 <FreeDisplay+0x30>
     486:	2f79 0000 321c 	move.l 321c <Copperlist1>,16(sp)
     48c:	0010 
     48e:	2f6f 0018 000c 	move.l 24(sp),12(sp)
     494:	2039 0000 33aa 	move.l 33aa <SysBase>,d0
     49a:	2c40           	movea.l d0,a6
     49c:	226f 0010      	movea.l 16(sp),a1
     4a0:	202f 000c      	move.l 12(sp),d0
     4a4:	4eae ff2e      	jsr -210(a6)
  if( Copperlist2 != 0) FreeMem( Copperlist2, clsize);
     4a8:	2039 0000 3220 	move.l 3220 <Copperlist2>,d0
     4ae:	6722           	beq.s 4d2 <FreeDisplay+0x5a>
     4b0:	2f79 0000 3220 	move.l 3220 <Copperlist2>,8(sp)
     4b6:	0008 
     4b8:	2f6f 0018 0004 	move.l 24(sp),4(sp)
     4be:	2039 0000 33aa 	move.l 33aa <SysBase>,d0
     4c4:	2c40           	movea.l d0,a6
     4c6:	226f 0008      	movea.l 8(sp),a1
     4ca:	202f 0004      	move.l 4(sp),d0
     4ce:	4eae ff2e      	jsr -210(a6)
  /*if( Bitplane1 != 0) FreeMem( Bitplane1, bplsize);
  if( Bitplane2 != 0) FreeMem( Bitplane2, bplsize);*/
}
     4d2:	2c5f           	movea.l (sp)+,a6
     4d4:	4fef 0010      	lea 16(sp),sp
     4d8:	4e75           	rts

000004da <SetBplPointers>:

void SetBplPointers() {
     4da:	4fef fff4      	lea -12(sp),sp
  UWORD highword = (ULONG)DrawBuffer >> 16;
     4de:	2039 0000 3224 	move.l 3224 <DrawBuffer>,d0
     4e4:	4240           	clr.w d0
     4e6:	4840           	swap d0
     4e8:	3f40 000a      	move.w d0,10(sp)
  UWORD lowword = (ULONG)DrawBuffer & 0xffff;
     4ec:	2039 0000 3224 	move.l 3224 <DrawBuffer>,d0
     4f2:	3f40 0008      	move.w d0,8(sp)
  
  UWORD *copword = (UWORD *) DrawCopper;
     4f6:	2f79 0000 322c 	move.l 322c <DrawCopper>,4(sp)
     4fc:	0004 
  copword[COPBPL1LOW] = lowword;
     4fe:	307c 0076      	movea.w #118,a0
     502:	d1ef 0004      	adda.l 4(sp),a0
     506:	30af 0008      	move.w 8(sp),(a0)
  copword[COPBPL1HIGH] = highword;
     50a:	307c 0072      	movea.w #114,a0
     50e:	d1ef 0004      	adda.l 4(sp),a0
     512:	30af 000a      	move.w 10(sp),(a0)
  
  ULONG tmp = (ULONG) DrawBuffer;
     516:	2039 0000 3224 	move.l 3224 <DrawBuffer>,d0
     51c:	2e80           	move.l d0,(sp)
  DrawBuffer = ViewBuffer;
     51e:	2039 0000 3228 	move.l 3228 <ViewBuffer>,d0
     524:	23c0 0000 3224 	move.l d0,3224 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
     52a:	2017           	move.l (sp),d0
     52c:	23c0 0000 3228 	move.l d0,3228 <ViewBuffer>
}
     532:	4fef 000c      	lea 12(sp),sp
     536:	4e75           	rts

00000538 <SwapCl>:

void SwapCl() {
     538:	598f           	subq.l #4,sp
  ULONG tmp = (ULONG) DrawCopper;
     53a:	2039 0000 322c 	move.l 322c <DrawCopper>,d0
     540:	2e80           	move.l d0,(sp)
  DrawCopper = ViewCopper;
     542:	2039 0000 3230 	move.l 3230 <ViewCopper>,d0
     548:	23c0 0000 322c 	move.l d0,322c <DrawCopper>
  ViewCopper = (ULONG *)tmp;
     54e:	2017           	move.l (sp),d0
     550:	23c0 0000 3230 	move.l d0,3230 <ViewCopper>
  hw->cop1lc = (ULONG) ViewCopper;
     556:	2039 0000 3230 	move.l 3230 <ViewCopper>,d0
     55c:	2079 0000 3234 	movea.l 3234 <hw>,a0
     562:	2140 0080      	move.l d0,128(a0)
  hw->copjmp1 = tmp;
     566:	2079 0000 3234 	movea.l 3234 <hw>,a0
     56c:	2017           	move.l (sp),d0
     56e:	3140 0088      	move.w d0,136(a0)
}
     572:	588f           	addq.l #4,sp
     574:	4e75           	rts

00000576 <Utils_CopyMem>:

__attribute__((optimize("O3")))
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     576:	206f 0004      	movea.l 4(sp),a0
     57a:	222f 000c      	move.l 12(sp),d1
  for( int i=0;i<size;i++) 
     57e:	670e           	beq.s 58e <Utils_CopyMem+0x18>
     580:	226f 0008      	movea.l 8(sp),a1
     584:	7000           	moveq #0,d0
    *destination++ = *source++;  
     586:	22d8           	move.l (a0)+,(a1)+
  for( int i=0;i<size;i++) 
     588:	5280           	addq.l #1,d0
     58a:	b081           	cmp.l d1,d0
     58c:	66f8           	bne.s 586 <Utils_CopyMem+0x10>
}
     58e:	4e75           	rts

00000590 <Utils_FillLong>:

void Utils_FillLong( ULONG *target, ULONG pattern, ULONG lines, 
                                            ULONG linelength, ULONG mod ) {
     590:	518f           	subq.l #8,sp
  for( int i=0;i<lines; i++) {
     592:	42af 0004      	clr.l 4(sp)
     596:	6030           	bra.s 5c8 <Utils_FillLong+0x38>
    for( int i2=0;i2<linelength;i2++) 
     598:	4297           	clr.l (sp)
     59a:	6014           	bra.s 5b0 <Utils_FillLong+0x20>
      *target++ = pattern;
     59c:	202f 000c      	move.l 12(sp),d0
     5a0:	2200           	move.l d0,d1
     5a2:	5881           	addq.l #4,d1
     5a4:	2f41 000c      	move.l d1,12(sp)
     5a8:	2040           	movea.l d0,a0
     5aa:	20af 0010      	move.l 16(sp),(a0)
    for( int i2=0;i2<linelength;i2++) 
     5ae:	5297           	addq.l #1,(sp)
     5b0:	2017           	move.l (sp),d0
     5b2:	b0af 0018      	cmp.l 24(sp),d0
     5b6:	65e4           	bcs.s 59c <Utils_FillLong+0xc>
    target += mod;
     5b8:	202f 001c      	move.l 28(sp),d0
     5bc:	d080           	add.l d0,d0
     5be:	d080           	add.l d0,d0
     5c0:	d1af 000c      	add.l d0,12(sp)
  for( int i=0;i<lines; i++) {
     5c4:	52af 0004      	addq.l #1,4(sp)
     5c8:	202f 0004      	move.l 4(sp),d0
     5cc:	b0af 0014      	cmp.l 20(sp),d0
     5d0:	65c6           	bcs.s 598 <Utils_FillLong+0x8>
  }
}
     5d2:	508f           	addq.l #8,sp
     5d4:	4e75           	rts

000005d6 <MouseLeft>:

short MouseLeft(){return !((*(volatile UBYTE*)0xbfe001)&64);}	
     5d6:	207c 00bf e001 	movea.l #12574721,a0
     5dc:	1010           	move.b (a0),d0
     5de:	1000           	move.b d0,d0
     5e0:	0280 0000 00ff 	andi.l #255,d0
     5e6:	7240           	moveq #64,d1
     5e8:	c081           	and.l d1,d0
     5ea:	57c0           	seq d0
     5ec:	4400           	neg.b d0
     5ee:	1000           	move.b d0,d0
     5f0:	0240 00ff      	andi.w #255,d0
     5f4:	4e75           	rts

000005f6 <MouseRight>:
     5f6:	207c 00df f016 	movea.l #14675990,a0
     5fc:	3010           	move.w (a0),d0
     5fe:	3000           	move.w d0,d0
     600:	0280 0000 ffff 	andi.l #65535,d0
     606:	0280 0000 0400 	andi.l #1024,d0
     60c:	57c0           	seq d0
     60e:	4400           	neg.b d0
     610:	1000           	move.b d0,d0
     612:	0240 00ff      	andi.w #255,d0
     616:	4e75           	rts

00000618 <strlen>:
{
     618:	598f           	subq.l #4,sp
	unsigned long t=0;
     61a:	4297           	clr.l (sp)
     61c:	6002           	bra.s 620 <strlen+0x8>
		t++;
     61e:	5297           	addq.l #1,(sp)
	while(*s++)
     620:	202f 0008      	move.l 8(sp),d0
     624:	2200           	move.l d0,d1
     626:	5281           	addq.l #1,d1
     628:	2f41 0008      	move.l d1,8(sp)
     62c:	2040           	movea.l d0,a0
     62e:	1010           	move.b (a0),d0
     630:	66ec           	bne.s 61e <strlen+0x6>
	return t;
     632:	2017           	move.l (sp),d0
}
     634:	588f           	addq.l #4,sp
     636:	4e75           	rts

00000638 <memset>:
{
     638:	4e55 fffc      	link.w a5,#-4
	unsigned char *ptr = (unsigned char *)dest;
     63c:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
     642:	6014           	bra.s 658 <memset+0x20>
		*ptr++ = val;
     644:	202d fffc      	move.l -4(a5),d0
     648:	2200           	move.l d0,d1
     64a:	5281           	addq.l #1,d1
     64c:	2b41 fffc      	move.l d1,-4(a5)
     650:	222d 000c      	move.l 12(a5),d1
     654:	2040           	movea.l d0,a0
     656:	1081           	move.b d1,(a0)
	while(len-- > 0)
     658:	202d 0010      	move.l 16(a5),d0
     65c:	2200           	move.l d0,d1
     65e:	5381           	subq.l #1,d1
     660:	2b41 0010      	move.l d1,16(a5)
     664:	4a80           	tst.l d0
     666:	66dc           	bne.s 644 <memset+0xc>
	return dest;
     668:	202d 0008      	move.l 8(a5),d0
}
     66c:	4e5d           	unlk a5
     66e:	4e75           	rts

00000670 <memcpy>:
{
     670:	4e55 fff8      	link.w a5,#-8
     674:	2f02           	move.l d2,-(sp)
	char *d = (char *)dest;
     676:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = (const char *)src;
     67c:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
     682:	6020           	bra.s 6a4 <memcpy+0x34>
		*d++ = *s++;
     684:	222d fff8      	move.l -8(a5),d1
     688:	2001           	move.l d1,d0
     68a:	5280           	addq.l #1,d0
     68c:	2b40 fff8      	move.l d0,-8(a5)
     690:	202d fffc      	move.l -4(a5),d0
     694:	2400           	move.l d0,d2
     696:	5282           	addq.l #1,d2
     698:	2b42 fffc      	move.l d2,-4(a5)
     69c:	2041           	movea.l d1,a0
     69e:	1210           	move.b (a0),d1
     6a0:	2040           	movea.l d0,a0
     6a2:	1081           	move.b d1,(a0)
	while(len--)
     6a4:	202d 0010      	move.l 16(a5),d0
     6a8:	2200           	move.l d0,d1
     6aa:	5381           	subq.l #1,d1
     6ac:	2b41 0010      	move.l d1,16(a5)
     6b0:	4a80           	tst.l d0
     6b2:	66d0           	bne.s 684 <memcpy+0x14>
	return dest;
     6b4:	202d 0008      	move.l 8(a5),d0
}
     6b8:	241f           	move.l (sp)+,d2
     6ba:	4e5d           	unlk a5
     6bc:	4e75           	rts

000006be <memmove>:
{
     6be:	4e55 fff0      	link.w a5,#-16
     6c2:	2f02           	move.l d2,-(sp)
	char *d = dest;
     6c4:	2b6d 0008 fffc 	move.l 8(a5),-4(a5)
	const char *s = src;
     6ca:	2b6d 000c fff8 	move.l 12(a5),-8(a5)
	if (d < s) {
     6d0:	202d fffc      	move.l -4(a5),d0
     6d4:	b0ad fff8      	cmp.l -8(a5),d0
     6d8:	6522           	bcs.s 6fc <memmove+0x3e>
     6da:	6032           	bra.s 70e <memmove+0x50>
			*d++ = *s++;
     6dc:	222d fff8      	move.l -8(a5),d1
     6e0:	2401           	move.l d1,d2
     6e2:	5282           	addq.l #1,d2
     6e4:	2b42 fff8      	move.l d2,-8(a5)
     6e8:	202d fffc      	move.l -4(a5),d0
     6ec:	2400           	move.l d0,d2
     6ee:	5282           	addq.l #1,d2
     6f0:	2b42 fffc      	move.l d2,-4(a5)
     6f4:	2041           	movea.l d1,a0
     6f6:	1210           	move.b (a0),d1
     6f8:	2040           	movea.l d0,a0
     6fa:	1081           	move.b d1,(a0)
		while (len--)
     6fc:	202d 0010      	move.l 16(a5),d0
     700:	2200           	move.l d0,d1
     702:	5381           	subq.l #1,d1
     704:	2b41 0010      	move.l d1,16(a5)
     708:	4a80           	tst.l d0
     70a:	66d0           	bne.s 6dc <memmove+0x1e>
     70c:	6052           	bra.s 760 <memmove+0xa2>
		const char *lasts = s + (len - 1);
     70e:	202d 0010      	move.l 16(a5),d0
     712:	5380           	subq.l #1,d0
     714:	242d fff8      	move.l -8(a5),d2
     718:	d480           	add.l d0,d2
     71a:	2b42 fff4      	move.l d2,-12(a5)
		char *lastd = d + (len - 1);
     71e:	202d 0010      	move.l 16(a5),d0
     722:	5380           	subq.l #1,d0
     724:	222d fffc      	move.l -4(a5),d1
     728:	d280           	add.l d0,d1
     72a:	2b41 fff0      	move.l d1,-16(a5)
     72e:	6020           	bra.s 750 <memmove+0x92>
			*lastd-- = *lasts--;
     730:	222d fff4      	move.l -12(a5),d1
     734:	2401           	move.l d1,d2
     736:	5382           	subq.l #1,d2
     738:	2b42 fff4      	move.l d2,-12(a5)
     73c:	202d fff0      	move.l -16(a5),d0
     740:	2400           	move.l d0,d2
     742:	5382           	subq.l #1,d2
     744:	2b42 fff0      	move.l d2,-16(a5)
     748:	2041           	movea.l d1,a0
     74a:	1210           	move.b (a0),d1
     74c:	2040           	movea.l d0,a0
     74e:	1081           	move.b d1,(a0)
		while (len--)
     750:	202d 0010      	move.l 16(a5),d0
     754:	2200           	move.l d0,d1
     756:	5381           	subq.l #1,d1
     758:	2b41 0010      	move.l d1,16(a5)
     75c:	4a80           	tst.l d0
     75e:	66d0           	bne.s 730 <memmove+0x72>
	return dest;
     760:	202d 0008      	move.l 8(a5),d0
}
     764:	241f           	move.l (sp)+,d2
     766:	4e5d           	unlk a5
     768:	4e75           	rts

0000076a <KPrintF>:
{
     76a:	4fef ff80      	lea -128(sp),sp
     76e:	48e7 0032      	movem.l a2-a3/a6,-(sp)
    if(*((UWORD *)UaeDbgLog) == 0x4eb9 || *((UWORD *)UaeDbgLog) == 0xa00e) {
     772:	3039 00f0 ff60 	move.w f0ff60 <gcc8_c_support.c.f93356b9+0xf06234>,d0
     778:	0c40 4eb9      	cmpi.w #20153,d0
     77c:	6722           	beq.s 7a0 <KPrintF+0x36>
     77e:	0c40 a00e      	cmpi.w #-24562,d0
     782:	671c           	beq.s 7a0 <KPrintF+0x36>
		RawDoFmt((CONST_STRPTR)fmt, vl, KPutCharX, 0);
     784:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     78a:	206f 0090      	movea.l 144(sp),a0
     78e:	43ef 0094      	lea 148(sp),a1
     792:	45f9 0000 194e 	lea 194e <KPutCharX>,a2
     798:	97cb           	suba.l a3,a3
     79a:	4eae fdf6      	jsr -522(a6)
     79e:	602a           	bra.s 7ca <KPrintF+0x60>
		RawDoFmt((CONST_STRPTR)fmt, vl, PutChar, temp);
     7a0:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     7a6:	206f 0090      	movea.l 144(sp),a0
     7aa:	43ef 0094      	lea 148(sp),a1
     7ae:	45f9 0000 195c 	lea 195c <PutChar>,a2
     7b4:	47ef 000c      	lea 12(sp),a3
     7b8:	4eae fdf6      	jsr -522(a6)
		UaeDbgLog(86, temp);
     7bc:	2f0b           	move.l a3,-(sp)
     7be:	4878 0056      	pea 56 <_start+0x56>
     7c2:	4eb9 00f0 ff60 	jsr f0ff60 <gcc8_c_support.c.f93356b9+0xf06234>
     7c8:	508f           	addq.l #8,sp
}
     7ca:	4cdf 4c00      	movem.l (sp)+,a2-a3/a6
     7ce:	4fef 0080      	lea 128(sp),sp
     7d2:	4e75           	rts

000007d4 <warpmode>:

void warpmode(int on) // bool
{
     7d4:	518f           	subq.l #8,sp
	long(*UaeConf)(long mode, int index, const char* param, int param_len, char* outbuf, int outbuf_len);
	UaeConf = (long(*)(long, int, const char*, int, char*, int))0xf0ff60;
     7d6:	2f7c 00f0 ff60 	move.l #15794016,4(sp)
     7dc:	0004 
    if(*((UWORD *)UaeConf) == 0x4eb9 || *((UWORD *)UaeConf) == 0xa00e) {
     7de:	206f 0004      	movea.l 4(sp),a0
     7e2:	3010           	move.w (a0),d0
     7e4:	0c40 4eb9      	cmpi.w #20153,d0
     7e8:	670c           	beq.s 7f6 <warpmode+0x22>
     7ea:	206f 0004      	movea.l 4(sp),a0
     7ee:	3010           	move.w (a0),d0
     7f0:	0c40 a00e      	cmpi.w #-24562,d0
     7f4:	6668           	bne.s 85e <warpmode+0x8a>
		char outbuf;
		UaeConf(82, -1, on ? "warp true" : "warp false", 0, &outbuf, 1);
     7f6:	4aaf 000c      	tst.l 12(sp)
     7fa:	6708           	beq.s 804 <warpmode+0x30>
     7fc:	203c 0000 1cfe 	move.l #7422,d0
     802:	6006           	bra.s 80a <warpmode+0x36>
     804:	203c 0000 1d08 	move.l #7432,d0
     80a:	4878 0001      	pea 1 <_start+0x1>
     80e:	220f           	move.l sp,d1
     810:	5e81           	addq.l #7,d1
     812:	2f01           	move.l d1,-(sp)
     814:	42a7           	clr.l -(sp)
     816:	2f00           	move.l d0,-(sp)
     818:	4878 ffff      	pea ffffffff <gcc8_c_support.c.f93356b9+0xffff62d3>
     81c:	4878 0052      	pea 52 <_start+0x52>
     820:	206f 001c      	movea.l 28(sp),a0
     824:	4e90           	jsr (a0)
     826:	4fef 0018      	lea 24(sp),sp
		UaeConf(82, -1, on ? "blitter_cycle_exact false" : "blitter_cycle_exact true", 0, &outbuf, 1);
     82a:	4aaf 000c      	tst.l 12(sp)
     82e:	6708           	beq.s 838 <warpmode+0x64>
     830:	203c 0000 1d13 	move.l #7443,d0
     836:	6006           	bra.s 83e <warpmode+0x6a>
     838:	203c 0000 1d2d 	move.l #7469,d0
     83e:	4878 0001      	pea 1 <_start+0x1>
     842:	220f           	move.l sp,d1
     844:	5e81           	addq.l #7,d1
     846:	2f01           	move.l d1,-(sp)
     848:	42a7           	clr.l -(sp)
     84a:	2f00           	move.l d0,-(sp)
     84c:	4878 ffff      	pea ffffffff <gcc8_c_support.c.f93356b9+0xffff62d3>
     850:	4878 0052      	pea 52 <_start+0x52>
     854:	206f 001c      	movea.l 28(sp),a0
     858:	4e90           	jsr (a0)
     85a:	4fef 0018      	lea 24(sp),sp
	}
}
     85e:	508f           	addq.l #8,sp
     860:	4e75           	rts

00000862 <debug_cmd>:

static void debug_cmd(unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4)
{
     862:	598f           	subq.l #4,sp
	long(*UaeLib)(unsigned int arg0, unsigned int arg1, unsigned int arg2, unsigned int arg3, unsigned int arg4);
	UaeLib = (long(*)(unsigned int, unsigned int, unsigned int, unsigned int, unsigned int))0xf0ff60;
     864:	2ebc 00f0 ff60 	move.l #15794016,(sp)
    if(*((UWORD *)UaeLib) == 0x4eb9 || *((UWORD *)UaeLib) == 0xa00e) {
     86a:	2057           	movea.l (sp),a0
     86c:	3010           	move.w (a0),d0
     86e:	0c40 4eb9      	cmpi.w #20153,d0
     872:	670a           	beq.s 87e <debug_cmd+0x1c>
     874:	2057           	movea.l (sp),a0
     876:	3010           	move.w (a0),d0
     878:	0c40 a00e      	cmpi.w #-24562,d0
     87c:	661e           	bne.s 89c <debug_cmd+0x3a>
		UaeLib(88, arg1, arg2, arg3, arg4);
     87e:	2f2f 0014      	move.l 20(sp),-(sp)
     882:	2f2f 0014      	move.l 20(sp),-(sp)
     886:	2f2f 0014      	move.l 20(sp),-(sp)
     88a:	2f2f 0014      	move.l 20(sp),-(sp)
     88e:	4878 0058      	pea 58 <_start+0x58>
     892:	206f 0014      	movea.l 20(sp),a0
     896:	4e90           	jsr (a0)
     898:	4fef 0014      	lea 20(sp),sp
	}
}
     89c:	588f           	addq.l #4,sp
     89e:	4e75           	rts

000008a0 <debug_clear>:
	barto_cmd_text,
};

void debug_clear()
{
	debug_cmd(barto_cmd_clear, 0, 0, 0);
     8a0:	42a7           	clr.l -(sp)
     8a2:	42a7           	clr.l -(sp)
     8a4:	42a7           	clr.l -(sp)
     8a6:	42a7           	clr.l -(sp)
     8a8:	4eba ffb8      	jsr 862 <debug_cmd>(pc)
     8ac:	4fef 0010      	lea 16(sp),sp
}
     8b0:	4e75           	rts

000008b2 <debug_rect>:

void debug_rect(short left, short top, short right, short bottom, unsigned int color)
{
     8b2:	518f           	subq.l #8,sp
     8b4:	2f02           	move.l d2,-(sp)
     8b6:	226f 0010      	movea.l 16(sp),a1
     8ba:	206f 0014      	movea.l 20(sp),a0
     8be:	222f 0018      	move.l 24(sp),d1
     8c2:	202f 001c      	move.l 28(sp),d0
     8c6:	3249           	movea.w a1,a1
     8c8:	3f49 000a      	move.w a1,10(sp)
     8cc:	3048           	movea.w a0,a0
     8ce:	3f48 0008      	move.w a0,8(sp)
     8d2:	3201           	move.w d1,d1
     8d4:	3f41 0006      	move.w d1,6(sp)
     8d8:	3000           	move.w d0,d0
     8da:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
     8de:	302f 0006      	move.w 6(sp),d0
     8e2:	48c0           	ext.l d0
     8e4:	4840           	swap d0
     8e6:	4240           	clr.w d0
     8e8:	322f 0004      	move.w 4(sp),d1
     8ec:	48c1           	ext.l d1
     8ee:	8280           	or.l d0,d1
     8f0:	302f 000a      	move.w 10(sp),d0
     8f4:	48c0           	ext.l d0
     8f6:	4840           	swap d0
     8f8:	4240           	clr.w d0
     8fa:	306f 0008      	movea.w 8(sp),a0
     8fe:	2408           	move.l a0,d2
     900:	8082           	or.l d2,d0
     902:	2f2f 0020      	move.l 32(sp),-(sp)
     906:	2f01           	move.l d1,-(sp)
     908:	2f00           	move.l d0,-(sp)
     90a:	4878 0001      	pea 1 <_start+0x1>
     90e:	4eba ff52      	jsr 862 <debug_cmd>(pc)
     912:	4fef 0010      	lea 16(sp),sp
}
     916:	241f           	move.l (sp)+,d2
     918:	508f           	addq.l #8,sp
     91a:	4e75           	rts

0000091c <debug_filled_rect>:

void debug_filled_rect(short left, short top, short right, short bottom, unsigned int color)
{
     91c:	518f           	subq.l #8,sp
     91e:	2f02           	move.l d2,-(sp)
     920:	226f 0010      	movea.l 16(sp),a1
     924:	206f 0014      	movea.l 20(sp),a0
     928:	222f 0018      	move.l 24(sp),d1
     92c:	202f 001c      	move.l 28(sp),d0
     930:	3249           	movea.w a1,a1
     932:	3f49 000a      	move.w a1,10(sp)
     936:	3048           	movea.w a0,a0
     938:	3f48 0008      	move.w a0,8(sp)
     93c:	3201           	move.w d1,d1
     93e:	3f41 0006      	move.w d1,6(sp)
     942:	3000           	move.w d0,d0
     944:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_filled_rect, (((unsigned int)left) << 16) | ((unsigned int)top), (((unsigned int)right) << 16) | ((unsigned int)bottom), color);
     948:	302f 0006      	move.w 6(sp),d0
     94c:	48c0           	ext.l d0
     94e:	4840           	swap d0
     950:	4240           	clr.w d0
     952:	322f 0004      	move.w 4(sp),d1
     956:	48c1           	ext.l d1
     958:	8280           	or.l d0,d1
     95a:	302f 000a      	move.w 10(sp),d0
     95e:	48c0           	ext.l d0
     960:	4840           	swap d0
     962:	4240           	clr.w d0
     964:	306f 0008      	movea.w 8(sp),a0
     968:	2408           	move.l a0,d2
     96a:	8082           	or.l d2,d0
     96c:	2f2f 0020      	move.l 32(sp),-(sp)
     970:	2f01           	move.l d1,-(sp)
     972:	2f00           	move.l d0,-(sp)
     974:	4878 0002      	pea 2 <_start+0x2>
     978:	4eba fee8      	jsr 862 <debug_cmd>(pc)
     97c:	4fef 0010      	lea 16(sp),sp
}
     980:	241f           	move.l (sp)+,d2
     982:	508f           	addq.l #8,sp
     984:	4e75           	rts

00000986 <debug_text>:

void debug_text(short left, short top, const char* text, unsigned int color)
{
     986:	598f           	subq.l #4,sp
     988:	2f02           	move.l d2,-(sp)
     98a:	222f 000c      	move.l 12(sp),d1
     98e:	202f 0010      	move.l 16(sp),d0
     992:	3201           	move.w d1,d1
     994:	3f41 0006      	move.w d1,6(sp)
     998:	3000           	move.w d0,d0
     99a:	3f40 0004      	move.w d0,4(sp)
	debug_cmd(barto_cmd_text, (((unsigned int)left) << 16) | ((unsigned int)top), (unsigned int)text, color);
     99e:	202f 0014      	move.l 20(sp),d0
     9a2:	322f 0006      	move.w 6(sp),d1
     9a6:	48c1           	ext.l d1
     9a8:	4841           	swap d1
     9aa:	4241           	clr.w d1
     9ac:	306f 0004      	movea.w 4(sp),a0
     9b0:	2408           	move.l a0,d2
     9b2:	8282           	or.l d2,d1
     9b4:	2f2f 0018      	move.l 24(sp),-(sp)
     9b8:	2f00           	move.l d0,-(sp)
     9ba:	2f01           	move.l d1,-(sp)
     9bc:	4878 0003      	pea 3 <_start+0x3>
     9c0:	4eba fea0      	jsr 862 <debug_cmd>(pc)
     9c4:	4fef 0010      	lea 16(sp),sp
}
     9c8:	241f           	move.l (sp)+,d2
     9ca:	588f           	addq.l #4,sp
     9cc:	4e75           	rts

000009ce <Utils_CopyMem.constprop.0>:
void Utils_CopyMem( ULONG *source, ULONG *destination, ULONG size) {
     9ce:	206f 0004      	movea.l 4(sp),a0
     9d2:	226f 0008      	movea.l 8(sp),a1
     9d6:	2008           	move.l a0,d0
     9d8:	0680 0000 dbd8 	addi.l #56280,d0
    *destination++ = *source++;  
     9de:	22d8           	move.l (a0)+,(a1)+
  for( int i=0;i<size;i++) 
     9e0:	b1c0           	cmpa.l d0,a0
     9e2:	66fa           	bne.s 9de <Utils_CopyMem.constprop.0+0x10>
}
     9e4:	4e75           	rts

000009e6 <Zoom_Shrink102>:
    *copperlist = *values4shift++;
    copperlist += 2;
  }
}

void Zoom_Shrink102( UWORD levelofshrink, UWORD volatile *copperlist )  {
     9e6:	226f 0008      	movea.l 8(sp),a1

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
     9ea:	302f 0006      	move.w 6(sp),d0
     9ee:	c0fc 00d8      	mulu.w #216,d0
     9f2:	2040           	movea.l d0,a0
     9f4:	d1fc 0000 2314 	adda.l #8980,a0
    *copperlist = *values4shift++;
     9fa:	3350 012a      	move.w (a0),298(a1)
     9fe:	3368 0002 012e 	move.w 2(a0),302(a1)
     a04:	3368 0004 0132 	move.w 4(a0),306(a1)
     a0a:	3368 0006 0136 	move.w 6(a0),310(a1)
     a10:	3368 0008 013a 	move.w 8(a0),314(a1)
     a16:	3368 000a 013e 	move.w 10(a0),318(a1)
  *copperlist++ = *values4shift++;
     a1c:	3368 000c 0140 	move.w 12(a0),320(a1)
  *copperlist = *values4shift++;
     a22:	3368 000e 0142 	move.w 14(a0),322(a1)
    *copperlist = *values4shift++;
     a28:	3368 0010 0146 	move.w 16(a0),326(a1)
     a2e:	3368 0012 014a 	move.w 18(a0),330(a1)
     a34:	3368 0014 014e 	move.w 20(a0),334(a1)
     a3a:	3368 0016 0152 	move.w 22(a0),338(a1)
     a40:	3368 0018 0156 	move.w 24(a0),342(a1)
     a46:	3368 001a 015a 	move.w 26(a0),346(a1)
     a4c:	3368 001c 015e 	move.w 28(a0),350(a1)
     a52:	3368 001e 0162 	move.w 30(a0),354(a1)
     a58:	3368 0020 0166 	move.w 32(a0),358(a1)
     a5e:	3368 0022 016a 	move.w 34(a0),362(a1)
  *copperlist++ = *values4shift++;
     a64:	3368 0024 016c 	move.w 36(a0),364(a1)
  *copperlist = *values4shift++;
     a6a:	3368 0026 016e 	move.w 38(a0),366(a1)
    *copperlist = *values4shift++;
     a70:	3368 0028 0172 	move.w 40(a0),370(a1)
     a76:	3368 002a 0176 	move.w 42(a0),374(a1)
     a7c:	3368 002c 017a 	move.w 44(a0),378(a1)
     a82:	3368 002e 017e 	move.w 46(a0),382(a1)
     a88:	3368 0030 0182 	move.w 48(a0),386(a1)
     a8e:	3368 0032 0186 	move.w 50(a0),390(a1)
     a94:	3368 0034 018a 	move.w 52(a0),394(a1)
    *copperlist = *values4shift++;
     a9a:	3368 0036 01a2 	move.w 54(a0),418(a1)
     aa0:	3368 0038 01a6 	move.w 56(a0),422(a1)
     aa6:	3368 003a 01aa 	move.w 58(a0),426(a1)
     aac:	3368 003c 01ae 	move.w 60(a0),430(a1)
     ab2:	3368 003e 01b2 	move.w 62(a0),434(a1)
     ab8:	3368 0040 01b6 	move.w 64(a0),438(a1)
  *copperlist++ = *values4shift++;
     abe:	3368 0042 01b8 	move.w 66(a0),440(a1)
  *copperlist = *values4shift++;
     ac4:	3368 0044 01ba 	move.w 68(a0),442(a1)
    *copperlist = *values4shift++;
     aca:	3368 0046 01be 	move.w 70(a0),446(a1)
     ad0:	3368 0048 01c2 	move.w 72(a0),450(a1)
     ad6:	3368 004a 01c6 	move.w 74(a0),454(a1)
     adc:	3368 004c 01ca 	move.w 76(a0),458(a1)
     ae2:	3368 004e 01ce 	move.w 78(a0),462(a1)
     ae8:	3368 0050 01d2 	move.w 80(a0),466(a1)
     aee:	3368 0052 01d6 	move.w 82(a0),470(a1)
     af4:	3368 0054 01da 	move.w 84(a0),474(a1)
     afa:	3368 0056 01de 	move.w 86(a0),478(a1)
     b00:	3368 0058 01e2 	move.w 88(a0),482(a1)
  *copperlist++ = *values4shift++;
     b06:	3368 005a 01e4 	move.w 90(a0),484(a1)
  *copperlist = *values4shift++;
     b0c:	3368 005c 01e6 	move.w 92(a0),486(a1)
    *copperlist = *values4shift++;
     b12:	3368 005e 01ea 	move.w 94(a0),490(a1)
     b18:	3368 0060 01ee 	move.w 96(a0),494(a1)
     b1e:	3368 0062 01f2 	move.w 98(a0),498(a1)
     b24:	3368 0064 01f6 	move.w 100(a0),502(a1)
     b2a:	3368 0066 01fa 	move.w 102(a0),506(a1)
     b30:	3368 0068 01fe 	move.w 104(a0),510(a1)
     b36:	3368 006a 0202 	move.w 106(a0),514(a1)
    *copperlist = *values4shift++;
     b3c:	3368 006c 0212 	move.w 108(a0),530(a1)
     b42:	3368 006e 0216 	move.w 110(a0),534(a1)
     b48:	3368 0070 021a 	move.w 112(a0),538(a1)
     b4e:	3368 0072 021e 	move.w 114(a0),542(a1)
     b54:	3368 0074 0222 	move.w 116(a0),546(a1)
     b5a:	3368 0076 0226 	move.w 118(a0),550(a1)
  *copperlist++ = *values4shift++;
     b60:	3368 0078 0228 	move.w 120(a0),552(a1)
  *copperlist = *values4shift++;
     b66:	3368 007a 022a 	move.w 122(a0),554(a1)
    *copperlist = *values4shift++;
     b6c:	3368 007c 022e 	move.w 124(a0),558(a1)
     b72:	3368 007e 0232 	move.w 126(a0),562(a1)
     b78:	3368 0080 0236 	move.w 128(a0),566(a1)
     b7e:	3368 0082 023a 	move.w 130(a0),570(a1)
     b84:	3368 0084 023e 	move.w 132(a0),574(a1)
     b8a:	3368 0086 0242 	move.w 134(a0),578(a1)
     b90:	3368 0088 0246 	move.w 136(a0),582(a1)
     b96:	3368 008a 024a 	move.w 138(a0),586(a1)
     b9c:	3368 008c 024e 	move.w 140(a0),590(a1)
     ba2:	3368 008e 0252 	move.w 142(a0),594(a1)
  *copperlist++ = *values4shift++;
     ba8:	3368 0090 0254 	move.w 144(a0),596(a1)
  *copperlist = *values4shift++;
     bae:	3368 0092 0256 	move.w 146(a0),598(a1)
    *copperlist = *values4shift++;
     bb4:	3368 0094 025a 	move.w 148(a0),602(a1)
     bba:	3368 0096 025e 	move.w 150(a0),606(a1)
     bc0:	3368 0098 0262 	move.w 152(a0),610(a1)
     bc6:	3368 009a 0266 	move.w 154(a0),614(a1)
     bcc:	3368 009c 026a 	move.w 156(a0),618(a1)
     bd2:	3368 009e 026e 	move.w 158(a0),622(a1)
     bd8:	3368 00a0 0272 	move.w 160(a0),626(a1)
    *copperlist = *values4shift++;
     bde:	3368 00a2 0282 	move.w 162(a0),642(a1)
     be4:	3368 00a4 0286 	move.w 164(a0),646(a1)
     bea:	3368 00a6 028a 	move.w 166(a0),650(a1)
     bf0:	3368 00a8 028e 	move.w 168(a0),654(a1)
     bf6:	3368 00aa 0292 	move.w 170(a0),658(a1)
     bfc:	3368 00ac 0296 	move.w 172(a0),662(a1)
  *copperlist++ = *values4shift++;
     c02:	3368 00ae 0298 	move.w 174(a0),664(a1)
  *copperlist = *values4shift++;
     c08:	3368 00b0 029a 	move.w 176(a0),666(a1)
    *copperlist = *values4shift++;
     c0e:	3368 00b2 029e 	move.w 178(a0),670(a1)
     c14:	3368 00b4 02a2 	move.w 180(a0),674(a1)
     c1a:	3368 00b6 02a6 	move.w 182(a0),678(a1)
     c20:	3368 00b8 02aa 	move.w 184(a0),682(a1)
     c26:	3368 00ba 02ae 	move.w 186(a0),686(a1)
     c2c:	3368 00bc 02b2 	move.w 188(a0),690(a1)
     c32:	3368 00be 02b6 	move.w 190(a0),694(a1)
     c38:	3368 00c0 02ba 	move.w 192(a0),698(a1)
     c3e:	3368 00c2 02be 	move.w 194(a0),702(a1)
     c44:	3368 00c4 02c2 	move.w 196(a0),706(a1)
  *copperlist++ = *values4shift++;
     c4a:	3368 00c6 02c4 	move.w 198(a0),708(a1)
  *copperlist = *values4shift++;
     c50:	3368 00c8 02c6 	move.w 200(a0),710(a1)
    *copperlist = *values4shift++;
     c56:	3368 00ca 02ca 	move.w 202(a0),714(a1)
     c5c:	3368 00cc 02ce 	move.w 204(a0),718(a1)
     c62:	3368 00ce 02d2 	move.w 206(a0),722(a1)
     c68:	3368 00d0 02d6 	move.w 208(a0),726(a1)
     c6e:	3368 00d2 02da 	move.w 210(a0),730(a1)
     c74:	3368 00d4 02de 	move.w 212(a0),734(a1)
     c7a:	3368 00d6 02e2 	move.w 214(a0),738(a1)
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}
     c80:	4e75           	rts

00000c82 <WaitVbl>:
void WaitVbl() {
     c82:	518f           	subq.l #8,sp
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     c84:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.f93356b9+0xdf52d8>,d0
     c8a:	2e80           	move.l d0,(sp)
		vpos&=0x1ff00;
     c8c:	2017           	move.l (sp),d0
     c8e:	0280 0001 ff00 	andi.l #130816,d0
     c94:	2e80           	move.l d0,(sp)
		if (vpos!=(311<<8))
     c96:	2017           	move.l (sp),d0
     c98:	0c80 0001 3700 	cmpi.l #79616,d0
     c9e:	67e4           	beq.s c84 <WaitVbl+0x2>
		volatile ULONG vpos=*(volatile ULONG*)0xDFF004;
     ca0:	2039 00df f004 	move.l dff004 <gcc8_c_support.c.f93356b9+0xdf52d8>,d0
     ca6:	2f40 0004      	move.l d0,4(sp)
		vpos&=0x1ff00;
     caa:	202f 0004      	move.l 4(sp),d0
     cae:	0280 0001 ff00 	andi.l #130816,d0
     cb4:	2f40 0004      	move.l d0,4(sp)
		if (vpos==(311<<8))
     cb8:	202f 0004      	move.l 4(sp),d0
     cbc:	0c80 0001 3700 	cmpi.l #79616,d0
     cc2:	66dc           	bne.s ca0 <WaitVbl+0x1e>
}
     cc4:	508f           	addq.l #8,sp
     cc6:	4e75           	rts

00000cc8 <Zoom_SetBplPointers>:
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2; 
  return 0;
}

void Zoom_SetBplPointers( UWORD volatile *buffer, ULONG volatile *copper) {
     cc8:	4e55 ffc0      	link.w a5,#-64
     ccc:	2f0a           	move.l a2,-(sp)
     cce:	2f02           	move.l d2,-(sp)
     cd0:	246d 000c      	movea.l 12(a5),a2
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
     cd4:	4878 0040      	pea 40 <_start+0x40>
     cd8:	4879 0000 1d46 	pea 1d46 <c2p1x1_8_c5_gen_pixels+0x4c>
     cde:	486d ffc0      	pea -64(a5)
     ce2:	4eba f98c      	jsr 670 <memcpy>(pc)

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
     ce6:	3039 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d0
     cec:	0280 0000 ffff 	andi.l #65535,d0
     cf2:	d080           	add.l d0,d0
     cf4:	d080           	add.l d0,d0
     cf6:	2035 08c0      	move.l (-64,a5,d0.l),d0
     cfa:	d080           	add.l d0,d0
     cfc:	d0ad 0008      	add.l 8(a5),d0
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
     d00:	2200           	move.l d0,d1
     d02:	4241           	clr.w d1
     d04:	4841           	swap d1
     d06:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d0a:	3540 0076      	move.w d0,118(a2)
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += 42*268; //Next plane
     d0e:	2200           	move.l d0,d1
     d10:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     d16:	2401           	move.l d1,d2
     d18:	4242           	clr.w d2
     d1a:	4842           	swap d2
     d1c:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d20:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
     d24:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     d2a:	2401           	move.l d1,d2
     d2c:	4242           	clr.w d2
     d2e:	4842           	swap d2
     d30:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d34:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
     d38:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
     d3e:	2401           	move.l d1,d2
     d40:	4242           	clr.w d2
     d42:	4842           	swap d2
     d44:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d48:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
     d4c:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
     d52:	2200           	move.l d0,d1
     d54:	4241           	clr.w d1
     d56:	4841           	swap d1
     d58:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
     d5c:	3540 0096      	move.w d0,150(a2)
  for(int i=0;i<ZMBPLDEPTH;i++) {
     d60:	4fef 000c      	lea 12(sp),sp
  }
  
}
     d64:	242d ffb8      	move.l -72(a5),d2
     d68:	246d ffbc      	movea.l -68(a5),a2
     d6c:	4e5d           	unlk a5
     d6e:	4e75           	rts

00000d70 <ClbuildZoom>:
ULONG * ClbuildZoom() {
     d70:	48e7 3022      	movem.l d2-d3/a2/a6,-(sp)
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
     d74:	2c79 0000 33aa 	movea.l 33aa <SysBase>,a6
     d7a:	203c 0000 031c 	move.l #796,d0
     d80:	7202           	moveq #2,d1
     d82:	4eae ff3a      	jsr -198(a6)
     d86:	2440           	movea.l d0,a2
  if( retval == 0) {
     d88:	4a80           	tst.l d0
     d8a:	6700 01ea      	beq.w f76 <ClbuildZoom+0x206>
    *cl++ = *clpartinstruction++;
     d8e:	24b9 0000 2080 	move.l 2080 <ClsSprites>,(a2)
     d94:	2579 0000 2084 	move.l 2084 <ClsSprites+0x4>,4(a2)
     d9a:	0004 
     d9c:	2579 0000 2088 	move.l 2088 <ClsSprites+0x8>,8(a2)
     da2:	0008 
     da4:	2579 0000 208c 	move.l 208c <ClsSprites+0xc>,12(a2)
     daa:	000c 
     dac:	2579 0000 2090 	move.l 2090 <ClsSprites+0x10>,16(a2)
     db2:	0010 
     db4:	2579 0000 2094 	move.l 2094 <ClsSprites+0x14>,20(a2)
     dba:	0014 
     dbc:	2579 0000 2098 	move.l 2098 <ClsSprites+0x18>,24(a2)
     dc2:	0018 
     dc4:	2579 0000 209c 	move.l 209c <ClsSprites+0x1c>,28(a2)
     dca:	001c 
     dcc:	2579 0000 20a0 	move.l 20a0 <ClsSprites+0x20>,32(a2)
     dd2:	0020 
     dd4:	2579 0000 20a4 	move.l 20a4 <ClsSprites+0x24>,36(a2)
     dda:	0024 
     ddc:	2579 0000 20a8 	move.l 20a8 <ClsSprites+0x28>,40(a2)
     de2:	0028 
     de4:	2579 0000 20ac 	move.l 20ac <ClsSprites+0x2c>,44(a2)
     dea:	002c 
     dec:	2579 0000 20b0 	move.l 20b0 <ClsSprites+0x30>,48(a2)
     df2:	0030 
     df4:	2579 0000 20b4 	move.l 20b4 <ClsSprites+0x34>,52(a2)
     dfa:	0034 
     dfc:	2579 0000 20b8 	move.l 20b8 <ClsSprites+0x38>,56(a2)
     e02:	0038 
     e04:	2579 0000 20bc 	move.l 20bc <ClsSprites+0x3c>,60(a2)
     e0a:	003c 
    *cl++ = *clpartinstruction++;
     e0c:	2579 0000 20c0 	move.l 20c0 <ClScreen>,64(a2)
     e12:	0040 
     e14:	2579 0000 20c4 	move.l 20c4 <ClScreen+0x4>,68(a2)
     e1a:	0044 
     e1c:	2579 0000 20c8 	move.l 20c8 <ClScreen+0x8>,72(a2)
     e22:	0048 
     e24:	2579 0000 20cc 	move.l 20cc <ClScreen+0xc>,76(a2)
     e2a:	004c 
     e2c:	2579 0000 20d0 	move.l 20d0 <ClScreen+0x10>,80(a2)
     e32:	0050 
     e34:	2579 0000 20d4 	move.l 20d4 <ClScreen+0x14>,84(a2)
     e3a:	0054 
     e3c:	2579 0000 20d8 	move.l 20d8 <ClScreen+0x18>,88(a2)
     e42:	0058 
     e44:	2579 0000 20dc 	move.l 20dc <ClScreen+0x1c>,92(a2)
     e4a:	005c 
     e4c:	2579 0000 20e0 	move.l 20e0 <ClScreen+0x20>,96(a2)
     e52:	0060 
     e54:	2579 0000 20e4 	move.l 20e4 <ClScreen+0x24>,100(a2)
     e5a:	0064 
     e5c:	2579 0000 20e8 	move.l 20e8 <ClScreen+0x28>,104(a2)
     e62:	0068 
     e64:	2579 0000 20ec 	move.l 20ec <ClScreen+0x2c>,108(a2)
     e6a:	006c 
  *cl++ = 0x00e00000;
     e6c:	257c 00e0 0000 	move.l #14680064,112(a2)
     e72:	0070 
  *cl++ = 0x00e20000;
     e74:	257c 00e2 0000 	move.l #14811136,116(a2)
     e7a:	0074 
  *cl++ = 0x00e40000;
     e7c:	257c 00e4 0000 	move.l #14942208,120(a2)
     e82:	0078 
  *cl++ = 0x00e60000;
     e84:	257c 00e6 0000 	move.l #15073280,124(a2)
     e8a:	007c 
  *cl++ = 0x00e80000;
     e8c:	257c 00e8 0000 	move.l #15204352,128(a2)
     e92:	0080 
  *cl++ = 0x00ea0000;
     e94:	257c 00ea 0000 	move.l #15335424,132(a2)
     e9a:	0084 
  *cl++ = 0x00ec0000;
     e9c:	257c 00ec 0000 	move.l #15466496,136(a2)
     ea2:	0088 
  *cl++ = 0x00ee0000;
     ea4:	257c 00ee 0000 	move.l #15597568,140(a2)
     eaa:	008c 
  *cl++ = 0x00f00000;
     eac:	257c 00f0 0000 	move.l #15728640,144(a2)
     eb2:	0090 
  *cl++ = 0x00f20000;
     eb4:	257c 00f2 0000 	move.l #15859712,148(a2)
     eba:	0094 
  for(int i=0; i<32;i++)
     ebc:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
     ec0:	41f9 0000 2000 	lea 2000 <ClColor>,a0
    *cl++ = *clpartinstruction++;
     ec6:	22d8           	move.l (a0)+,(a1)+
  for(int i=0; i<32;i++)
     ec8:	b1fc 0000 2080 	cmpa.l #8320,a0
     ece:	66f6           	bne.s ec6 <ClbuildZoom+0x156>
  ULONG cop2 = cl+3;
     ed0:	220a           	move.l a2,d1
     ed2:	0681 0000 0124 	addi.l #292,d1
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
     ed8:	2001           	move.l d1,d0
     eda:	4240           	clr.w d0
     edc:	4840           	swap d0
     ede:	0680 0084 0000 	addi.l #8650752,d0
     ee4:	2540 0118      	move.l d0,280(a2)
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
     ee8:	2001           	move.l d1,d0
     eea:	0280 0000 ffff 	andi.l #65535,d0
     ef0:	0680 0086 0000 	addi.l #8781824,d0
     ef6:	2540 011c      	move.l d0,284(a2)
  *cl++ = 0x2c01ff00;
     efa:	257c 2c01 ff00 	move.l #738328320,288(a2)
     f00:	0120 
  ULONG cop2br1 = cop2 + ( (30)<<2);
     f02:	7078           	moveq #120,d0
     f04:	d081           	add.l d1,d0
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
     f06:	2400           	move.l d0,d2
     f08:	4242           	clr.w d2
     f0a:	4842           	swap d2
     f0c:	0682 0084 0000 	addi.l #8650752,d2
     f12:	23c2 0000 2160 	move.l d2,2160 <Cl102ZoomRepeat+0x70>
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
     f18:	0280 0000 ffff 	andi.l #65535,d0
     f1e:	0680 0086 0000 	addi.l #8781824,d0
     f24:	23c0 0000 2164 	move.l d0,2164 <Cl102ZoomRepeat+0x74>
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
     f2a:	200a           	move.l a2,d0
     f2c:	0680 0000 027c 	addi.l #636,d0
     f32:	2400           	move.l d0,d2
     f34:	4242           	clr.w d2
     f36:	4842           	swap d2
     f38:	0682 0084 0000 	addi.l #8650752,d2
     f3e:	23c2 0000 2240 	move.l d2,2240 <Cl102ZoomRepeat+0x150>
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
     f44:	0280 0000 ffff 	andi.l #65535,d0
     f4a:	0680 0086 0000 	addi.l #8781824,d0
     f50:	23c0 0000 2244 	move.l d0,2244 <Cl102ZoomRepeat+0x154>
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
     f56:	2241           	movea.l d1,a1
  clpartinstruction = Cl102ZoomRepeat;
     f58:	41f9 0000 20f0 	lea 20f0 <Cl102ZoomRepeat>,a0
    *cl++ = *clpartinstruction++;
     f5e:	22d8           	move.l (a0)+,(a1)+
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
     f60:	b1fc 0000 22b8 	cmpa.l #8888,a0
     f66:	66f6           	bne.s f5e <ClbuildZoom+0x1ee>
   *cl++ = 0xfffffffe;
     f68:	70fe           	moveq #-2,d0
     f6a:	2540 02ec      	move.l d0,748(a2)
}
     f6e:	200a           	move.l a2,d0
     f70:	4cdf 440c      	movem.l (sp)+,d2-d3/a2/a6
     f74:	4e75           	rts
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
     f76:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     f7c:	4eae ffc4      	jsr -60(a6)
     f80:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     f86:	2200           	move.l d0,d1
     f88:	243c 0000 1d86 	move.l #7558,d2
     f8e:	7628           	moveq #40,d3
     f90:	4eae ffd0      	jsr -48(a6)
    Exit(1);
     f94:	2c79 0000 33a6 	movea.l 33a6 <DOSBase>,a6
     f9a:	7201           	moveq #1,d1
     f9c:	4eae ff70      	jsr -144(a6)
    *cl++ = *clpartinstruction++;
     fa0:	24b9 0000 2080 	move.l 2080 <ClsSprites>,(a2)
     fa6:	2579 0000 2084 	move.l 2084 <ClsSprites+0x4>,4(a2)
     fac:	0004 
     fae:	2579 0000 2088 	move.l 2088 <ClsSprites+0x8>,8(a2)
     fb4:	0008 
     fb6:	2579 0000 208c 	move.l 208c <ClsSprites+0xc>,12(a2)
     fbc:	000c 
     fbe:	2579 0000 2090 	move.l 2090 <ClsSprites+0x10>,16(a2)
     fc4:	0010 
     fc6:	2579 0000 2094 	move.l 2094 <ClsSprites+0x14>,20(a2)
     fcc:	0014 
     fce:	2579 0000 2098 	move.l 2098 <ClsSprites+0x18>,24(a2)
     fd4:	0018 
     fd6:	2579 0000 209c 	move.l 209c <ClsSprites+0x1c>,28(a2)
     fdc:	001c 
     fde:	2579 0000 20a0 	move.l 20a0 <ClsSprites+0x20>,32(a2)
     fe4:	0020 
     fe6:	2579 0000 20a4 	move.l 20a4 <ClsSprites+0x24>,36(a2)
     fec:	0024 
     fee:	2579 0000 20a8 	move.l 20a8 <ClsSprites+0x28>,40(a2)
     ff4:	0028 
     ff6:	2579 0000 20ac 	move.l 20ac <ClsSprites+0x2c>,44(a2)
     ffc:	002c 
     ffe:	2579 0000 20b0 	move.l 20b0 <ClsSprites+0x30>,48(a2)
    1004:	0030 
    1006:	2579 0000 20b4 	move.l 20b4 <ClsSprites+0x34>,52(a2)
    100c:	0034 
    100e:	2579 0000 20b8 	move.l 20b8 <ClsSprites+0x38>,56(a2)
    1014:	0038 
    1016:	2579 0000 20bc 	move.l 20bc <ClsSprites+0x3c>,60(a2)
    101c:	003c 
    *cl++ = *clpartinstruction++;
    101e:	2579 0000 20c0 	move.l 20c0 <ClScreen>,64(a2)
    1024:	0040 
    1026:	2579 0000 20c4 	move.l 20c4 <ClScreen+0x4>,68(a2)
    102c:	0044 
    102e:	2579 0000 20c8 	move.l 20c8 <ClScreen+0x8>,72(a2)
    1034:	0048 
    1036:	2579 0000 20cc 	move.l 20cc <ClScreen+0xc>,76(a2)
    103c:	004c 
    103e:	2579 0000 20d0 	move.l 20d0 <ClScreen+0x10>,80(a2)
    1044:	0050 
    1046:	2579 0000 20d4 	move.l 20d4 <ClScreen+0x14>,84(a2)
    104c:	0054 
    104e:	2579 0000 20d8 	move.l 20d8 <ClScreen+0x18>,88(a2)
    1054:	0058 
    1056:	2579 0000 20dc 	move.l 20dc <ClScreen+0x1c>,92(a2)
    105c:	005c 
    105e:	2579 0000 20e0 	move.l 20e0 <ClScreen+0x20>,96(a2)
    1064:	0060 
    1066:	2579 0000 20e4 	move.l 20e4 <ClScreen+0x24>,100(a2)
    106c:	0064 
    106e:	2579 0000 20e8 	move.l 20e8 <ClScreen+0x28>,104(a2)
    1074:	0068 
    1076:	2579 0000 20ec 	move.l 20ec <ClScreen+0x2c>,108(a2)
    107c:	006c 
  *cl++ = 0x00e00000;
    107e:	257c 00e0 0000 	move.l #14680064,112(a2)
    1084:	0070 
  *cl++ = 0x00e20000;
    1086:	257c 00e2 0000 	move.l #14811136,116(a2)
    108c:	0074 
  *cl++ = 0x00e40000;
    108e:	257c 00e4 0000 	move.l #14942208,120(a2)
    1094:	0078 
  *cl++ = 0x00e60000;
    1096:	257c 00e6 0000 	move.l #15073280,124(a2)
    109c:	007c 
  *cl++ = 0x00e80000;
    109e:	257c 00e8 0000 	move.l #15204352,128(a2)
    10a4:	0080 
  *cl++ = 0x00ea0000;
    10a6:	257c 00ea 0000 	move.l #15335424,132(a2)
    10ac:	0084 
  *cl++ = 0x00ec0000;
    10ae:	257c 00ec 0000 	move.l #15466496,136(a2)
    10b4:	0088 
  *cl++ = 0x00ee0000;
    10b6:	257c 00ee 0000 	move.l #15597568,140(a2)
    10bc:	008c 
  *cl++ = 0x00f00000;
    10be:	257c 00f0 0000 	move.l #15728640,144(a2)
    10c4:	0090 
  *cl++ = 0x00f20000;
    10c6:	257c 00f2 0000 	move.l #15859712,148(a2)
    10cc:	0094 
  for(int i=0; i<32;i++)
    10ce:	43ea 0098      	lea 152(a2),a1
  clpartinstruction = ClColor;
    10d2:	41f9 0000 2000 	lea 2000 <ClColor>,a0
    10d8:	6000 fdec      	bra.w ec6 <ClbuildZoom+0x156>

000010dc <Zoom_VblankHandler>:
void Zoom_VblankHandler() {
    10dc:	4e55 ffc0      	link.w a5,#-64
    10e0:	2f0a           	move.l a2,-(sp)
    10e2:	2f02           	move.l d2,-(sp)
  hw->dmacon = 0b1000011111111111;
    10e4:	2079 0000 3234 	movea.l 3234 <hw>,a0
    10ea:	317c 87ff 0096 	move.w #-30721,150(a0)
  Zoom_Counter++;
    10f0:	5279 0000 3244 	addq.w #1,3244 <Zoom_Counter>
  SwapCl();
    10f6:	4eba f440      	jsr 538 <SwapCl>(pc)
  if( MouseLeft())
    10fa:	45fa f4da      	lea 5d6 <MouseLeft>(pc),a2
    10fe:	4e92           	jsr (a2)
    1100:	4a40           	tst.w d0
    1102:	6700 03a6      	beq.w 14aa <Zoom_VblankHandler+0x3ce>
    Zoom_Mousepressed = 1;
    1106:	33fc 0001 0000 	move.w #1,323a <Zoom_Mousepressed>
    110c:	323a 
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    110e:	4e92           	jsr (a2)
    1110:	4a40           	tst.w d0
    1112:	6700 0736      	beq.w 184a <Zoom_VblankHandler+0x76e>
      if( Zoom_LevelOf102Zoom <= 2) {
    1116:	3239 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d1

void Zoom_SwapBuffers( UWORD zoomlevel) {
  //ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
    111c:	2039 0000 3228 	move.l 3228 <ViewBuffer>,d0
      if( Zoom_LevelOf102Zoom <= 2) {
    1122:	0c41 0002      	cmpi.w #2,d1
    1126:	6200 03a2      	bhi.w 14ca <Zoom_VblankHandler+0x3ee>
        if( Zoom_LevelOfZoom == 87)
    112a:	3239 0000 3240 	move.w 3240 <Zoom_LevelOfZoom>,d1
    1130:	0c41 0057      	cmpi.w #87,d1
    1134:	6700 06dc      	beq.w 1812 <Zoom_VblankHandler+0x736>
          Zoom_LevelOfZoom++;
    1138:	3239 0000 3240 	move.w 3240 <Zoom_LevelOfZoom>,d1
    113e:	5241           	addq.w #1,d1
    1140:	33c1 0000 3240 	move.w d1,3240 <Zoom_LevelOfZoom>
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
    1146:	33fc 000f 0000 	move.w #15,3242 <Zoom_LevelOf102Zoom>
    114c:	3242 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    114e:	3239 0000 3240 	move.w 3240 <Zoom_LevelOfZoom>,d1
  ULONG tmp = (ULONG) DrawBuffer;
    1154:	2439 0000 3224 	move.l 3224 <DrawBuffer>,d2
  DrawBuffer = ViewBuffer;
    115a:	23c0 0000 3224 	move.l d0,3224 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1160:	23c2 0000 3228 	move.l d2,3228 <ViewBuffer>
  	    *bp = 0;
    1166:	42b8 0102      	clr.l 102 <main+0x4e>
        Zoom_DrawPicture = 1;     
    116a:	7001           	moveq #1,d0
    116c:	23c0 0000 2310 	move.l d0,2310 <Zoom_DrawPicture>
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    1172:	2479 0000 322c 	movea.l 322c <DrawCopper>,a2
    1178:	3039 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d0
  UWORD *values4shift = Values4Shift+levelofshrink*108;
    117e:	c0fc 00d8      	mulu.w #216,d0
    1182:	2040           	movea.l d0,a0
    1184:	d1fc 0000 2314 	adda.l #8980,a0
    *copperlist = *values4shift++;
    118a:	3550 012a      	move.w (a0),298(a2)
    118e:	3568 0002 012e 	move.w 2(a0),302(a2)
    1194:	3568 0004 0132 	move.w 4(a0),306(a2)
    119a:	3568 0006 0136 	move.w 6(a0),310(a2)
    11a0:	3568 0008 013a 	move.w 8(a0),314(a2)
    11a6:	3568 000a 013e 	move.w 10(a0),318(a2)
  *copperlist++ = *values4shift++;
    11ac:	3568 000c 0140 	move.w 12(a0),320(a2)
  *copperlist = *values4shift++;
    11b2:	3568 000e 0142 	move.w 14(a0),322(a2)
    *copperlist = *values4shift++;
    11b8:	3568 0010 0146 	move.w 16(a0),326(a2)
    11be:	3568 0012 014a 	move.w 18(a0),330(a2)
    11c4:	3568 0014 014e 	move.w 20(a0),334(a2)
    11ca:	3568 0016 0152 	move.w 22(a0),338(a2)
    11d0:	3568 0018 0156 	move.w 24(a0),342(a2)
    11d6:	3568 001a 015a 	move.w 26(a0),346(a2)
    11dc:	3568 001c 015e 	move.w 28(a0),350(a2)
    11e2:	3568 001e 0162 	move.w 30(a0),354(a2)
    11e8:	3568 0020 0166 	move.w 32(a0),358(a2)
    11ee:	3568 0022 016a 	move.w 34(a0),362(a2)
  *copperlist++ = *values4shift++;
    11f4:	3568 0024 016c 	move.w 36(a0),364(a2)
  *copperlist = *values4shift++;
    11fa:	3568 0026 016e 	move.w 38(a0),366(a2)
    *copperlist = *values4shift++;
    1200:	3568 0028 0172 	move.w 40(a0),370(a2)
    1206:	3568 002a 0176 	move.w 42(a0),374(a2)
    120c:	3568 002c 017a 	move.w 44(a0),378(a2)
    1212:	3568 002e 017e 	move.w 46(a0),382(a2)
    1218:	3568 0030 0182 	move.w 48(a0),386(a2)
    121e:	3568 0032 0186 	move.w 50(a0),390(a2)
    1224:	3568 0034 018a 	move.w 52(a0),394(a2)
    *copperlist = *values4shift++;
    122a:	3568 0036 01a2 	move.w 54(a0),418(a2)
    1230:	3568 0038 01a6 	move.w 56(a0),422(a2)
    1236:	3568 003a 01aa 	move.w 58(a0),426(a2)
    123c:	3568 003c 01ae 	move.w 60(a0),430(a2)
    1242:	3568 003e 01b2 	move.w 62(a0),434(a2)
    1248:	3568 0040 01b6 	move.w 64(a0),438(a2)
  *copperlist++ = *values4shift++;
    124e:	3568 0042 01b8 	move.w 66(a0),440(a2)
  *copperlist = *values4shift++;
    1254:	3568 0044 01ba 	move.w 68(a0),442(a2)
    *copperlist = *values4shift++;
    125a:	3568 0046 01be 	move.w 70(a0),446(a2)
    1260:	3568 0048 01c2 	move.w 72(a0),450(a2)
    1266:	3568 004a 01c6 	move.w 74(a0),454(a2)
    126c:	3568 004c 01ca 	move.w 76(a0),458(a2)
    1272:	3568 004e 01ce 	move.w 78(a0),462(a2)
    1278:	3568 0050 01d2 	move.w 80(a0),466(a2)
    127e:	3568 0052 01d6 	move.w 82(a0),470(a2)
    1284:	3568 0054 01da 	move.w 84(a0),474(a2)
    128a:	3568 0056 01de 	move.w 86(a0),478(a2)
    1290:	3568 0058 01e2 	move.w 88(a0),482(a2)
  *copperlist++ = *values4shift++;
    1296:	3568 005a 01e4 	move.w 90(a0),484(a2)
  *copperlist = *values4shift++;
    129c:	3568 005c 01e6 	move.w 92(a0),486(a2)
    *copperlist = *values4shift++;
    12a2:	3568 005e 01ea 	move.w 94(a0),490(a2)
    12a8:	3568 0060 01ee 	move.w 96(a0),494(a2)
    12ae:	3568 0062 01f2 	move.w 98(a0),498(a2)
    12b4:	3568 0064 01f6 	move.w 100(a0),502(a2)
    12ba:	3568 0066 01fa 	move.w 102(a0),506(a2)
    12c0:	3568 0068 01fe 	move.w 104(a0),510(a2)
    12c6:	3568 006a 0202 	move.w 106(a0),514(a2)
    *copperlist = *values4shift++;
    12cc:	3568 006c 0212 	move.w 108(a0),530(a2)
    12d2:	3568 006e 0216 	move.w 110(a0),534(a2)
    12d8:	3568 0070 021a 	move.w 112(a0),538(a2)
    12de:	3568 0072 021e 	move.w 114(a0),542(a2)
    12e4:	3568 0074 0222 	move.w 116(a0),546(a2)
    12ea:	3568 0076 0226 	move.w 118(a0),550(a2)
  *copperlist++ = *values4shift++;
    12f0:	3568 0078 0228 	move.w 120(a0),552(a2)
  *copperlist = *values4shift++;
    12f6:	3568 007a 022a 	move.w 122(a0),554(a2)
    *copperlist = *values4shift++;
    12fc:	3568 007c 022e 	move.w 124(a0),558(a2)
    1302:	3568 007e 0232 	move.w 126(a0),562(a2)
    1308:	3568 0080 0236 	move.w 128(a0),566(a2)
    130e:	3568 0082 023a 	move.w 130(a0),570(a2)
    1314:	3568 0084 023e 	move.w 132(a0),574(a2)
    131a:	3568 0086 0242 	move.w 134(a0),578(a2)
    1320:	3568 0088 0246 	move.w 136(a0),582(a2)
    1326:	3568 008a 024a 	move.w 138(a0),586(a2)
    132c:	3568 008c 024e 	move.w 140(a0),590(a2)
    1332:	3568 008e 0252 	move.w 142(a0),594(a2)
  *copperlist++ = *values4shift++;
    1338:	3568 0090 0254 	move.w 144(a0),596(a2)
  *copperlist = *values4shift++;
    133e:	3568 0092 0256 	move.w 146(a0),598(a2)
    *copperlist = *values4shift++;
    1344:	3568 0094 025a 	move.w 148(a0),602(a2)
    134a:	3568 0096 025e 	move.w 150(a0),606(a2)
    1350:	3568 0098 0262 	move.w 152(a0),610(a2)
    1356:	3568 009a 0266 	move.w 154(a0),614(a2)
    135c:	3568 009c 026a 	move.w 156(a0),618(a2)
    1362:	3568 009e 026e 	move.w 158(a0),622(a2)
    1368:	3568 00a0 0272 	move.w 160(a0),626(a2)
    *copperlist = *values4shift++;
    136e:	3568 00a2 0282 	move.w 162(a0),642(a2)
    1374:	3568 00a4 0286 	move.w 164(a0),646(a2)
    137a:	3568 00a6 028a 	move.w 166(a0),650(a2)
    1380:	3568 00a8 028e 	move.w 168(a0),654(a2)
    1386:	3568 00aa 0292 	move.w 170(a0),658(a2)
    138c:	3568 00ac 0296 	move.w 172(a0),662(a2)
  *copperlist++ = *values4shift++;
    1392:	3568 00ae 0298 	move.w 174(a0),664(a2)
  *copperlist = *values4shift++;
    1398:	3568 00b0 029a 	move.w 176(a0),666(a2)
    *copperlist = *values4shift++;
    139e:	3568 00b2 029e 	move.w 178(a0),670(a2)
    13a4:	3568 00b4 02a2 	move.w 180(a0),674(a2)
    13aa:	3568 00b6 02a6 	move.w 182(a0),678(a2)
    13b0:	3568 00b8 02aa 	move.w 184(a0),682(a2)
    13b6:	3568 00ba 02ae 	move.w 186(a0),686(a2)
    13bc:	3568 00bc 02b2 	move.w 188(a0),690(a2)
    13c2:	3568 00be 02b6 	move.w 190(a0),694(a2)
    13c8:	3568 00c0 02ba 	move.w 192(a0),698(a2)
    13ce:	3568 00c2 02be 	move.w 194(a0),702(a2)
    13d4:	3568 00c4 02c2 	move.w 196(a0),706(a2)
  *copperlist++ = *values4shift++;
    13da:	3568 00c6 02c4 	move.w 198(a0),708(a2)
  *copperlist = *values4shift++;
    13e0:	3568 00c8 02c6 	move.w 200(a0),710(a2)
    *copperlist = *values4shift++;
    13e6:	3568 00ca 02ca 	move.w 202(a0),714(a2)
    13ec:	3568 00cc 02ce 	move.w 204(a0),718(a2)
    13f2:	3568 00ce 02d2 	move.w 206(a0),722(a2)
    13f8:	3568 00d0 02d6 	move.w 208(a0),726(a2)
    13fe:	3568 00d2 02da 	move.w 210(a0),730(a2)
    1404:	3568 00d4 02de 	move.w 212(a0),734(a2)
    140a:	3568 00d6 02e2 	move.w 214(a0),738(a2)
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1410:	4878 0040      	pea 40 <_start+0x40>
    1414:	4879 0000 1d46 	pea 1d46 <c2p1x1_8_c5_gen_pixels+0x4c>
    141a:	486d ffc0      	pea -64(a5)
    141e:	4eba f250      	jsr 670 <memcpy>(pc)
  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    1422:	3039 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d0
    1428:	0280 0000 ffff 	andi.l #65535,d0
    142e:	d080           	add.l d0,d0
    1430:	d080           	add.l d0,d0
    1432:	2035 08c0      	move.l (-64,a5,d0.l),d0
    1436:	d080           	add.l d0,d0
    1438:	d082           	add.l d2,d0
    UWORD highword = (ULONG)plane2set >> 16;
    143a:	2200           	move.l d0,d1
    143c:	4241           	clr.w d1
    143e:	4841           	swap d1
    1440:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1444:	3540 0076      	move.w d0,118(a2)
    plane2set += 42*268; //Next plane
    1448:	2200           	move.l d0,d1
    144a:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    1450:	2401           	move.l d1,d2
    1452:	4242           	clr.w d2
    1454:	4842           	swap d2
    1456:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    145a:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
    145e:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    1464:	2401           	move.l d1,d2
    1466:	4242           	clr.w d2
    1468:	4842           	swap d2
    146a:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    146e:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
    1472:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    1478:	2401           	move.l d1,d2
    147a:	4242           	clr.w d2
    147c:	4842           	swap d2
    147e:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1482:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
    1486:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
    148c:	2200           	move.l d0,d1
    148e:	4241           	clr.w d1
    1490:	4841           	swap d1
    1492:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    1496:	3540 0096      	move.w d0,150(a2)
    149a:	4fef 000c      	lea 12(sp),sp
}
    149e:	242d ffb8      	move.l -72(a5),d2
    14a2:	246d ffbc      	movea.l -68(a5),a2
    14a6:	4e5d           	unlk a5
    14a8:	4e75           	rts
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    14aa:	0c79 0001 0000 	cmpi.w #1,323a <Zoom_Mousepressed>
    14b0:	323a 
    14b2:	6700 fc5a      	beq.w 110e <Zoom_VblankHandler+0x32>
      if( Zoom_LevelOf102Zoom <= 2) {
    14b6:	3239 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d1
  DrawBuffer = ViewBuffer;
    14bc:	2039 0000 3228 	move.l 3228 <ViewBuffer>,d0
      if( Zoom_LevelOf102Zoom <= 2) {
    14c2:	0c41 0002      	cmpi.w #2,d1
    14c6:	6300 fc62      	bls.w 112a <Zoom_VblankHandler+0x4e>
        Zoom_LevelOf102Zoom-=2;
    14ca:	3239 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d1
    14d0:	5541           	subq.w #2,d1
    14d2:	33c1 0000 3242 	move.w d1,3242 <Zoom_LevelOf102Zoom>
    14d8:	2400           	move.l d0,d2
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
    14da:	2479 0000 322c 	movea.l 322c <DrawCopper>,a2
    14e0:	3039 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d0
  UWORD *values4shift = Values4Shift+levelofshrink*108;
    14e6:	c0fc 00d8      	mulu.w #216,d0
    14ea:	2040           	movea.l d0,a0
    14ec:	d1fc 0000 2314 	adda.l #8980,a0
    *copperlist = *values4shift++;
    14f2:	3550 012a      	move.w (a0),298(a2)
    14f6:	3568 0002 012e 	move.w 2(a0),302(a2)
    14fc:	3568 0004 0132 	move.w 4(a0),306(a2)
    1502:	3568 0006 0136 	move.w 6(a0),310(a2)
    1508:	3568 0008 013a 	move.w 8(a0),314(a2)
    150e:	3568 000a 013e 	move.w 10(a0),318(a2)
  *copperlist++ = *values4shift++;
    1514:	3568 000c 0140 	move.w 12(a0),320(a2)
  *copperlist = *values4shift++;
    151a:	3568 000e 0142 	move.w 14(a0),322(a2)
    *copperlist = *values4shift++;
    1520:	3568 0010 0146 	move.w 16(a0),326(a2)
    1526:	3568 0012 014a 	move.w 18(a0),330(a2)
    152c:	3568 0014 014e 	move.w 20(a0),334(a2)
    1532:	3568 0016 0152 	move.w 22(a0),338(a2)
    1538:	3568 0018 0156 	move.w 24(a0),342(a2)
    153e:	3568 001a 015a 	move.w 26(a0),346(a2)
    1544:	3568 001c 015e 	move.w 28(a0),350(a2)
    154a:	3568 001e 0162 	move.w 30(a0),354(a2)
    1550:	3568 0020 0166 	move.w 32(a0),358(a2)
    1556:	3568 0022 016a 	move.w 34(a0),362(a2)
  *copperlist++ = *values4shift++;
    155c:	3568 0024 016c 	move.w 36(a0),364(a2)
  *copperlist = *values4shift++;
    1562:	3568 0026 016e 	move.w 38(a0),366(a2)
    *copperlist = *values4shift++;
    1568:	3568 0028 0172 	move.w 40(a0),370(a2)
    156e:	3568 002a 0176 	move.w 42(a0),374(a2)
    1574:	3568 002c 017a 	move.w 44(a0),378(a2)
    157a:	3568 002e 017e 	move.w 46(a0),382(a2)
    1580:	3568 0030 0182 	move.w 48(a0),386(a2)
    1586:	3568 0032 0186 	move.w 50(a0),390(a2)
    158c:	3568 0034 018a 	move.w 52(a0),394(a2)
    *copperlist = *values4shift++;
    1592:	3568 0036 01a2 	move.w 54(a0),418(a2)
    1598:	3568 0038 01a6 	move.w 56(a0),422(a2)
    159e:	3568 003a 01aa 	move.w 58(a0),426(a2)
    15a4:	3568 003c 01ae 	move.w 60(a0),430(a2)
    15aa:	3568 003e 01b2 	move.w 62(a0),434(a2)
    15b0:	3568 0040 01b6 	move.w 64(a0),438(a2)
  *copperlist++ = *values4shift++;
    15b6:	3568 0042 01b8 	move.w 66(a0),440(a2)
  *copperlist = *values4shift++;
    15bc:	3568 0044 01ba 	move.w 68(a0),442(a2)
    *copperlist = *values4shift++;
    15c2:	3568 0046 01be 	move.w 70(a0),446(a2)
    15c8:	3568 0048 01c2 	move.w 72(a0),450(a2)
    15ce:	3568 004a 01c6 	move.w 74(a0),454(a2)
    15d4:	3568 004c 01ca 	move.w 76(a0),458(a2)
    15da:	3568 004e 01ce 	move.w 78(a0),462(a2)
    15e0:	3568 0050 01d2 	move.w 80(a0),466(a2)
    15e6:	3568 0052 01d6 	move.w 82(a0),470(a2)
    15ec:	3568 0054 01da 	move.w 84(a0),474(a2)
    15f2:	3568 0056 01de 	move.w 86(a0),478(a2)
    15f8:	3568 0058 01e2 	move.w 88(a0),482(a2)
  *copperlist++ = *values4shift++;
    15fe:	3568 005a 01e4 	move.w 90(a0),484(a2)
  *copperlist = *values4shift++;
    1604:	3568 005c 01e6 	move.w 92(a0),486(a2)
    *copperlist = *values4shift++;
    160a:	3568 005e 01ea 	move.w 94(a0),490(a2)
    1610:	3568 0060 01ee 	move.w 96(a0),494(a2)
    1616:	3568 0062 01f2 	move.w 98(a0),498(a2)
    161c:	3568 0064 01f6 	move.w 100(a0),502(a2)
    1622:	3568 0066 01fa 	move.w 102(a0),506(a2)
    1628:	3568 0068 01fe 	move.w 104(a0),510(a2)
    162e:	3568 006a 0202 	move.w 106(a0),514(a2)
    *copperlist = *values4shift++;
    1634:	3568 006c 0212 	move.w 108(a0),530(a2)
    163a:	3568 006e 0216 	move.w 110(a0),534(a2)
    1640:	3568 0070 021a 	move.w 112(a0),538(a2)
    1646:	3568 0072 021e 	move.w 114(a0),542(a2)
    164c:	3568 0074 0222 	move.w 116(a0),546(a2)
    1652:	3568 0076 0226 	move.w 118(a0),550(a2)
  *copperlist++ = *values4shift++;
    1658:	3568 0078 0228 	move.w 120(a0),552(a2)
  *copperlist = *values4shift++;
    165e:	3568 007a 022a 	move.w 122(a0),554(a2)
    *copperlist = *values4shift++;
    1664:	3568 007c 022e 	move.w 124(a0),558(a2)
    166a:	3568 007e 0232 	move.w 126(a0),562(a2)
    1670:	3568 0080 0236 	move.w 128(a0),566(a2)
    1676:	3568 0082 023a 	move.w 130(a0),570(a2)
    167c:	3568 0084 023e 	move.w 132(a0),574(a2)
    1682:	3568 0086 0242 	move.w 134(a0),578(a2)
    1688:	3568 0088 0246 	move.w 136(a0),582(a2)
    168e:	3568 008a 024a 	move.w 138(a0),586(a2)
    1694:	3568 008c 024e 	move.w 140(a0),590(a2)
    169a:	3568 008e 0252 	move.w 142(a0),594(a2)
  *copperlist++ = *values4shift++;
    16a0:	3568 0090 0254 	move.w 144(a0),596(a2)
  *copperlist = *values4shift++;
    16a6:	3568 0092 0256 	move.w 146(a0),598(a2)
    *copperlist = *values4shift++;
    16ac:	3568 0094 025a 	move.w 148(a0),602(a2)
    16b2:	3568 0096 025e 	move.w 150(a0),606(a2)
    16b8:	3568 0098 0262 	move.w 152(a0),610(a2)
    16be:	3568 009a 0266 	move.w 154(a0),614(a2)
    16c4:	3568 009c 026a 	move.w 156(a0),618(a2)
    16ca:	3568 009e 026e 	move.w 158(a0),622(a2)
    16d0:	3568 00a0 0272 	move.w 160(a0),626(a2)
    *copperlist = *values4shift++;
    16d6:	3568 00a2 0282 	move.w 162(a0),642(a2)
    16dc:	3568 00a4 0286 	move.w 164(a0),646(a2)
    16e2:	3568 00a6 028a 	move.w 166(a0),650(a2)
    16e8:	3568 00a8 028e 	move.w 168(a0),654(a2)
    16ee:	3568 00aa 0292 	move.w 170(a0),658(a2)
    16f4:	3568 00ac 0296 	move.w 172(a0),662(a2)
  *copperlist++ = *values4shift++;
    16fa:	3568 00ae 0298 	move.w 174(a0),664(a2)
  *copperlist = *values4shift++;
    1700:	3568 00b0 029a 	move.w 176(a0),666(a2)
    *copperlist = *values4shift++;
    1706:	3568 00b2 029e 	move.w 178(a0),670(a2)
    170c:	3568 00b4 02a2 	move.w 180(a0),674(a2)
    1712:	3568 00b6 02a6 	move.w 182(a0),678(a2)
    1718:	3568 00b8 02aa 	move.w 184(a0),682(a2)
    171e:	3568 00ba 02ae 	move.w 186(a0),686(a2)
    1724:	3568 00bc 02b2 	move.w 188(a0),690(a2)
    172a:	3568 00be 02b6 	move.w 190(a0),694(a2)
    1730:	3568 00c0 02ba 	move.w 192(a0),698(a2)
    1736:	3568 00c2 02be 	move.w 194(a0),702(a2)
    173c:	3568 00c4 02c2 	move.w 196(a0),706(a2)
  *copperlist++ = *values4shift++;
    1742:	3568 00c6 02c4 	move.w 198(a0),708(a2)
  *copperlist = *values4shift++;
    1748:	3568 00c8 02c6 	move.w 200(a0),710(a2)
    *copperlist = *values4shift++;
    174e:	3568 00ca 02ca 	move.w 202(a0),714(a2)
    1754:	3568 00cc 02ce 	move.w 204(a0),718(a2)
    175a:	3568 00ce 02d2 	move.w 206(a0),722(a2)
    1760:	3568 00d0 02d6 	move.w 208(a0),726(a2)
    1766:	3568 00d2 02da 	move.w 210(a0),730(a2)
    176c:	3568 00d4 02de 	move.w 212(a0),734(a2)
    1772:	3568 00d6 02e2 	move.w 214(a0),738(a2)
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };
    1778:	4878 0040      	pea 40 <_start+0x40>
    177c:	4879 0000 1d46 	pea 1d46 <c2p1x1_8_c5_gen_pixels+0x4c>
    1782:	486d ffc0      	pea -64(a5)
    1786:	4eba eee8      	jsr 670 <memcpy>(pc)
  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
    178a:	3039 0000 3242 	move.w 3242 <Zoom_LevelOf102Zoom>,d0
    1790:	0280 0000 ffff 	andi.l #65535,d0
    1796:	d080           	add.l d0,d0
    1798:	d080           	add.l d0,d0
    179a:	2035 08c0      	move.l (-64,a5,d0.l),d0
    179e:	d080           	add.l d0,d0
    17a0:	d082           	add.l d2,d0
    UWORD highword = (ULONG)plane2set >> 16;
    17a2:	2200           	move.l d0,d1
    17a4:	4241           	clr.w d1
    17a6:	4841           	swap d1
    17a8:	3541 0072      	move.w d1,114(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    17ac:	3540 0076      	move.w d0,118(a2)
    plane2set += 42*268; //Next plane
    17b0:	2200           	move.l d0,d1
    17b2:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    17b8:	2401           	move.l d1,d2
    17ba:	4242           	clr.w d2
    17bc:	4842           	swap d2
    17be:	3542 007a      	move.w d2,122(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    17c2:	3541 007e      	move.w d1,126(a2)
    plane2set += 42*268; //Next plane
    17c6:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    17cc:	2401           	move.l d1,d2
    17ce:	4242           	clr.w d2
    17d0:	4842           	swap d2
    17d2:	3542 0082      	move.w d2,130(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    17d6:	3541 0086      	move.w d1,134(a2)
    plane2set += 42*268; //Next plane
    17da:	0681 0000 2bf8 	addi.l #11256,d1
    UWORD highword = (ULONG)plane2set >> 16;
    17e0:	2401           	move.l d1,d2
    17e2:	4242           	clr.w d2
    17e4:	4842           	swap d2
    17e6:	3542 008a      	move.w d2,138(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    17ea:	3541 008e      	move.w d1,142(a2)
    plane2set += 42*268; //Next plane
    17ee:	0680 0000 afe0 	addi.l #45024,d0
    UWORD highword = (ULONG)plane2set >> 16;
    17f4:	2200           	move.l d0,d1
    17f6:	4241           	clr.w d1
    17f8:	4841           	swap d1
    17fa:	3541 0092      	move.w d1,146(a2)
    UWORD lowword = (ULONG)plane2set & 0xffff;
    17fe:	3540 0096      	move.w d0,150(a2)
    1802:	4fef 000c      	lea 12(sp),sp
}
    1806:	242d ffb8      	move.l -72(a5),d2
    180a:	246d ffbc      	movea.l -68(a5),a2
    180e:	4e5d           	unlk a5
    1810:	4e75           	rts
          Zoom_LevelOfZoom = 10;
    1812:	33fc 000a 0000 	move.w #10,3240 <Zoom_LevelOfZoom>
    1818:	3240 
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
    181a:	33fc 000f 0000 	move.w #15,3242 <Zoom_LevelOf102Zoom>
    1820:	3242 
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
    1822:	3239 0000 3240 	move.w 3240 <Zoom_LevelOfZoom>,d1
  ULONG tmp = (ULONG) DrawBuffer;
    1828:	2439 0000 3224 	move.l 3224 <DrawBuffer>,d2
  DrawBuffer = ViewBuffer;
    182e:	23c0 0000 3224 	move.l d0,3224 <DrawBuffer>
  ViewBuffer = (ULONG *) tmp;
    1834:	23c2 0000 3228 	move.l d2,3228 <ViewBuffer>
  	    *bp = 0;
    183a:	42b8 0102      	clr.l 102 <main+0x4e>
        Zoom_DrawPicture = 1;     
    183e:	7001           	moveq #1,d0
    1840:	23c0 0000 2310 	move.l d0,2310 <Zoom_DrawPicture>
    1846:	6000 f92a      	bra.w 1172 <Zoom_VblankHandler+0x96>
    Zoom_Mousepressed = 0;
    184a:	4279 0000 323a 	clr.w 323a <Zoom_Mousepressed>
    1850:	6000 f8c4      	bra.w 1116 <Zoom_VblankHandler+0x3a>

00001854 <__mulsi3>:
	.text
	FUNC(__mulsi3)
	.globl	SYM (__mulsi3)
SYM (__mulsi3):
	.cfi_startproc
	movew	sp@(4), d0	/* x0 -> d0 */
    1854:	302f 0004      	move.w 4(sp),d0
	muluw	sp@(10), d0	/* x0*y1 */
    1858:	c0ef 000a      	mulu.w 10(sp),d0
	movew	sp@(6), d1	/* x1 -> d1 */
    185c:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(8), d1	/* x1*y0 */
    1860:	c2ef 0008      	mulu.w 8(sp),d1
	addw	d1, d0
    1864:	d041           	add.w d1,d0
	swap	d0
    1866:	4840           	swap d0
	clrw	d0
    1868:	4240           	clr.w d0
	movew	sp@(6), d1	/* x1 -> d1 */
    186a:	322f 0006      	move.w 6(sp),d1
	muluw	sp@(10), d1	/* x1*y1 */
    186e:	c2ef 000a      	mulu.w 10(sp),d1
	addl	d1, d0
    1872:	d081           	add.l d1,d0
	rts
    1874:	4e75           	rts

00001876 <__udivsi3>:
	.text
	FUNC(__udivsi3)
	.globl	SYM (__udivsi3)
SYM (__udivsi3):
	.cfi_startproc
	movel	d2, sp@-
    1876:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	sp@(12), d1	/* d1 = divisor */
    1878:	222f 000c      	move.l 12(sp),d1
	movel	sp@(8), d0	/* d0 = dividend */
    187c:	202f 0008      	move.l 8(sp),d0

	cmpl	IMM (0x10000), d1 /* divisor >= 2 ^ 16 ?   */
    1880:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	3f		/* then try next algorithm */
    1886:	6416           	bcc.s 189e <__udivsi3+0x28>
	movel	d0, d2
    1888:	2400           	move.l d0,d2
	clrw	d2
    188a:	4242           	clr.w d2
	swap	d2
    188c:	4842           	swap d2
	divu	d1, d2          /* high quotient in lower word */
    188e:	84c1           	divu.w d1,d2
	movew	d2, d0		/* save high quotient */
    1890:	3002           	move.w d2,d0
	swap	d0
    1892:	4840           	swap d0
	movew	sp@(10), d2	/* get low dividend + high rest */
    1894:	342f 000a      	move.w 10(sp),d2
	divu	d1, d2		/* low quotient */
    1898:	84c1           	divu.w d1,d2
	movew	d2, d0
    189a:	3002           	move.w d2,d0
	jra	6f
    189c:	6030           	bra.s 18ce <__udivsi3+0x58>

3:	movel	d1, d2		/* use d2 as divisor backup */
    189e:	2401           	move.l d1,d2
4:	lsrl	IMM (1), d1	/* shift divisor */
    18a0:	e289           	lsr.l #1,d1
	lsrl	IMM (1), d0	/* shift dividend */
    18a2:	e288           	lsr.l #1,d0
	cmpl	IMM (0x10000), d1 /* still divisor >= 2 ^ 16 ?  */
    18a4:	0c81 0001 0000 	cmpi.l #65536,d1
	jcc	4b
    18aa:	64f4           	bcc.s 18a0 <__udivsi3+0x2a>
	divu	d1, d0		/* now we have 16-bit divisor */
    18ac:	80c1           	divu.w d1,d0
	andl	IMM (0xffff), d0 /* mask out divisor, ignore remainder */
    18ae:	0280 0000 ffff 	andi.l #65535,d0

/* Multiply the 16-bit tentative quotient with the 32-bit divisor.  Because of
   the operand ranges, this might give a 33-bit product.  If this product is
   greater than the dividend, the tentative quotient was too large. */
	movel	d2, d1
    18b4:	2202           	move.l d2,d1
	mulu	d0, d1		/* low part, 32 bits */
    18b6:	c2c0           	mulu.w d0,d1
	swap	d2
    18b8:	4842           	swap d2
	mulu	d0, d2		/* high part, at most 17 bits */
    18ba:	c4c0           	mulu.w d0,d2
	swap	d2		/* align high part with low part */
    18bc:	4842           	swap d2
	tstw	d2		/* high part 17 bits? */
    18be:	4a42           	tst.w d2
	jne	5f		/* if 17 bits, quotient was too large */
    18c0:	660a           	bne.s 18cc <__udivsi3+0x56>
	addl	d2, d1		/* add parts */
    18c2:	d282           	add.l d2,d1
	jcs	5f		/* if sum is 33 bits, quotient was too large */
    18c4:	6506           	bcs.s 18cc <__udivsi3+0x56>
	cmpl	sp@(8), d1	/* compare the sum with the dividend */
    18c6:	b2af 0008      	cmp.l 8(sp),d1
	jls	6f		/* if sum > dividend, quotient was too large */
    18ca:	6302           	bls.s 18ce <__udivsi3+0x58>
5:	subql	IMM (1), d0	/* adjust quotient */
    18cc:	5380           	subq.l #1,d0

6:	movel	sp@+, d2
    18ce:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    18d0:	4e75           	rts

000018d2 <__divsi3>:
	.text
	FUNC(__divsi3)
	.globl	SYM (__divsi3)
SYM (__divsi3):
	.cfi_startproc
	movel	d2, sp@-
    18d2:	2f02           	move.l d2,-(sp)
	.cfi_adjust_cfa_offset 4

	moveq	IMM (1), d2	/* sign of result stored in d2 (=1 or =-1) */
    18d4:	7401           	moveq #1,d2
	movel	sp@(12), d1	/* d1 = divisor */
    18d6:	222f 000c      	move.l 12(sp),d1
	jpl	1f
    18da:	6a04           	bpl.s 18e0 <__divsi3+0xe>
	negl	d1
    18dc:	4481           	neg.l d1
	negb	d2		/* change sign because divisor <0  */
    18de:	4402           	neg.b d2
1:	movel	sp@(8), d0	/* d0 = dividend */
    18e0:	202f 0008      	move.l 8(sp),d0
	jpl	2f
    18e4:	6a04           	bpl.s 18ea <__divsi3+0x18>
	negl	d0
    18e6:	4480           	neg.l d0
	negb	d2
    18e8:	4402           	neg.b d2

2:	movel	d1, sp@-
    18ea:	2f01           	move.l d1,-(sp)
	movel	d0, sp@-
    18ec:	2f00           	move.l d0,-(sp)
	PICCALL	SYM (__udivsi3)	/* divide abs(dividend) by abs(divisor) */
    18ee:	6186           	bsr.s 1876 <__udivsi3>
	addql	IMM (8), sp
    18f0:	508f           	addq.l #8,sp

	tstb	d2
    18f2:	4a02           	tst.b d2
	jpl	3f
    18f4:	6a02           	bpl.s 18f8 <__divsi3+0x26>
	negl	d0
    18f6:	4480           	neg.l d0

3:	movel	sp@+, d2
    18f8:	241f           	move.l (sp)+,d2
	.cfi_adjust_cfa_offset -4
	rts
    18fa:	4e75           	rts

000018fc <__modsi3>:
	.text
	FUNC(__modsi3)
	.globl	SYM (__modsi3)
SYM (__modsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    18fc:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1900:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    1904:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1906:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__divsi3)
    1908:	61c8           	bsr.s 18d2 <__divsi3>
	addql	IMM (8), sp
    190a:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    190c:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    1910:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    1912:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    1914:	6100 ff3e      	bsr.w 1854 <__mulsi3>
	addql	IMM (8), sp
    1918:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    191a:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    191e:	9280           	sub.l d0,d1
	movel	d1, d0
    1920:	2001           	move.l d1,d0
	rts
    1922:	4e75           	rts

00001924 <__umodsi3>:
	.text
	FUNC(__umodsi3)
	.globl	SYM (__umodsi3)
SYM (__umodsi3):
	.cfi_startproc
	movel	sp@(8), d1	/* d1 = divisor */
    1924:	222f 0008      	move.l 8(sp),d1
	movel	sp@(4), d0	/* d0 = dividend */
    1928:	202f 0004      	move.l 4(sp),d0
	movel	d1, sp@-
    192c:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    192e:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__udivsi3)
    1930:	6100 ff44      	bsr.w 1876 <__udivsi3>
	addql	IMM (8), sp
    1934:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(8), d1	/* d1 = divisor */
    1936:	222f 0008      	move.l 8(sp),d1
	movel	d1, sp@-
    193a:	2f01           	move.l d1,-(sp)
	.cfi_adjust_cfa_offset 4
	movel	d0, sp@-
    193c:	2f00           	move.l d0,-(sp)
	.cfi_adjust_cfa_offset 4
	PICCALL	SYM (__mulsi3)	/* d0 = (a/b)*b */
    193e:	6100 ff14      	bsr.w 1854 <__mulsi3>
	addql	IMM (8), sp
    1942:	508f           	addq.l #8,sp
	.cfi_adjust_cfa_offset -8
	movel	sp@(4), d1	/* d1 = dividend */
    1944:	222f 0004      	move.l 4(sp),d1
	subl	d0, d1		/* d1 = a - (a/b)*b */
    1948:	9280           	sub.l d0,d1
	movel	d1, d0
    194a:	2001           	move.l d1,d0
	rts
    194c:	4e75           	rts

0000194e <KPutCharX>:
	FUNC(KPutCharX)
	.globl	SYM (KPutCharX)

SYM(KPutCharX):
	.cfi_startproc
    move.l  a6, -(sp)
    194e:	2f0e           	move.l a6,-(sp)
	.cfi_adjust_cfa_offset 4
    move.l  4.w, a6
    1950:	2c78 0004      	movea.l 4 <_start+0x4>,a6
    jsr     -0x204(a6)
    1954:	4eae fdfc      	jsr -516(a6)
    movea.l (sp)+, a6
    1958:	2c5f           	movea.l (sp)+,a6
	.cfi_adjust_cfa_offset -4
    rts
    195a:	4e75           	rts

0000195c <PutChar>:
	FUNC(PutChar)
	.globl	SYM (PutChar)

SYM(PutChar):
	.cfi_startproc
	move.b d0, (a3)+
    195c:	16c0           	move.b d0,(a3)+
	rts
    195e:	4e75           	rts

00001960 <c2p1x1_8_c5_gen_init>:
    1960:	48f9 7fff 0000 	movem.l d0-a6,19a0 <.gi_saveregs>
    1966:	19a0 
    1968:	202f 0004      	move.l 4(sp),d0
    196c:	222f 0008      	move.l 8(sp),d1
    1970:	242f 000c      	move.l 12(sp),d2
    1974:	262f 0010      	move.l 16(sp),d3
    1978:	282f 0014      	move.l 20(sp),d4
    197c:	2a2f 0018      	move.l 24(sp),d5
    1980:	0280 0000 ffff 	andi.l #65535,d0
    1986:	c6c0           	mulu.w d0,d3
    1988:	e68b           	lsr.l #3,d3
    198a:	23c3 0000 1cf6 	move.l d3,1cf6 <c2p1x1_8_c5_gen_scroffs>
    1990:	c2c0           	mulu.w d0,d1
    1992:	23c1 0000 1cfa 	move.l d1,1cfa <c2p1x1_8_c5_gen_pixels>
    1998:	4cfa 7fff 0004 	movem.l 19a0 <.gi_saveregs>(pc),d0-a6
    199e:	4e75           	rts

000019a0 <.gi_saveregs>:
	...

000019dc <c2p1x1_8_c5_gen>:
    19dc:	48f9 7fff 0000 	movem.l d0-a6,1cba <.c2p_saveregs>
    19e2:	1cba 
    19e4:	4cef 0100 0004 	movem.l 4(sp),a0
    19ea:	4cef 0200 0008 	movem.l 8(sp),a1
    19f0:	2a3c 3333 3333 	move.l #858993459,d5
    19f6:	2c7c 5555 5555 	movea.l #1431655765,a6
    19fc:	d2fc 2bf8      	adda.w #11256,a1
    1a00:	d3fa 02f4      	adda.l 1cf6 <c2p1x1_8_c5_gen_scroffs>(pc),a1
    1a04:	247a 02f4      	movea.l 1cfa <c2p1x1_8_c5_gen_pixels>(pc),a2
    1a08:	d5c8           	adda.l a0,a2
    1a0a:	b5c8           	cmpa.l a0,a2
    1a0c:	6700 02a4      	beq.w 1cb2 <.none>
    1a10:	48e7 00c0      	movem.l a0-a1,-(sp)
    1a14:	2018           	move.l (a0)+,d0
    1a16:	2418           	move.l (a0)+,d2
    1a18:	2218           	move.l (a0)+,d1
    1a1a:	2618           	move.l (a0)+,d3
    1a1c:	283c 0f0f 0f0f 	move.l #252645135,d4
    1a22:	c084           	and.l d4,d0
    1a24:	c284           	and.l d4,d1
    1a26:	c484           	and.l d4,d2
    1a28:	c684           	and.l d4,d3
    1a2a:	e988           	lsl.l #4,d0
    1a2c:	e989           	lsl.l #4,d1
    1a2e:	8082           	or.l d2,d0
    1a30:	8283           	or.l d3,d1
    1a32:	2418           	move.l (a0)+,d2
    1a34:	2c18           	move.l (a0)+,d6
    1a36:	2618           	move.l (a0)+,d3
    1a38:	2e18           	move.l (a0)+,d7
    1a3a:	c484           	and.l d4,d2
    1a3c:	cc84           	and.l d4,d6
    1a3e:	c684           	and.l d4,d3
    1a40:	ce84           	and.l d4,d7
    1a42:	e98a           	lsl.l #4,d2
    1a44:	e98b           	lsl.l #4,d3
    1a46:	8486           	or.l d6,d2
    1a48:	8687           	or.l d7,d3
    1a4a:	3c02           	move.w d2,d6
    1a4c:	3e03           	move.w d3,d7
    1a4e:	3400           	move.w d0,d2
    1a50:	3601           	move.w d1,d3
    1a52:	4842           	swap d2
    1a54:	4843           	swap d3
    1a56:	3002           	move.w d2,d0
    1a58:	3203           	move.w d3,d1
    1a5a:	3406           	move.w d6,d2
    1a5c:	3607           	move.w d7,d3
    1a5e:	2c02           	move.l d2,d6
    1a60:	2e03           	move.l d3,d7
    1a62:	e48e           	lsr.l #2,d6
    1a64:	e48f           	lsr.l #2,d7
    1a66:	b186           	eor.l d0,d6
    1a68:	b387           	eor.l d1,d7
    1a6a:	cc85           	and.l d5,d6
    1a6c:	ce85           	and.l d5,d7
    1a6e:	bd80           	eor.l d6,d0
    1a70:	bf81           	eor.l d7,d1
    1a72:	e58e           	lsl.l #2,d6
    1a74:	e58f           	lsl.l #2,d7
    1a76:	bd82           	eor.l d6,d2
    1a78:	bf83           	eor.l d7,d3
    1a7a:	283c 00ff 00ff 	move.l #16711935,d4
    1a80:	2c01           	move.l d1,d6
    1a82:	2e03           	move.l d3,d7
    1a84:	e08e           	lsr.l #8,d6
    1a86:	e08f           	lsr.l #8,d7
    1a88:	b186           	eor.l d0,d6
    1a8a:	b587           	eor.l d2,d7
    1a8c:	6000 0088      	bra.w 1b16 <.start1>

00001a90 <.x1>:
    1a90:	2018           	move.l (a0)+,d0
    1a92:	2418           	move.l (a0)+,d2
    1a94:	2218           	move.l (a0)+,d1
    1a96:	2618           	move.l (a0)+,d3
    1a98:	2347 d408      	move.l d7,-11256(a1)
    1a9c:	283c 0f0f 0f0f 	move.l #252645135,d4
    1aa2:	c084           	and.l d4,d0
    1aa4:	c284           	and.l d4,d1
    1aa6:	c484           	and.l d4,d2
    1aa8:	c684           	and.l d4,d3
    1aaa:	e988           	lsl.l #4,d0
    1aac:	e989           	lsl.l #4,d1
    1aae:	8082           	or.l d2,d0
    1ab0:	8283           	or.l d3,d1
    1ab2:	2418           	move.l (a0)+,d2
    1ab4:	2c18           	move.l (a0)+,d6
    1ab6:	2618           	move.l (a0)+,d3
    1ab8:	2e18           	move.l (a0)+,d7
    1aba:	234b 2bf8      	move.l a3,11256(a1)
    1abe:	c484           	and.l d4,d2
    1ac0:	cc84           	and.l d4,d6
    1ac2:	c684           	and.l d4,d3
    1ac4:	ce84           	and.l d4,d7
    1ac6:	e98a           	lsl.l #4,d2
    1ac8:	e98b           	lsl.l #4,d3
    1aca:	8486           	or.l d6,d2
    1acc:	8687           	or.l d7,d3
    1ace:	3c02           	move.w d2,d6
    1ad0:	3e03           	move.w d3,d7
    1ad2:	3400           	move.w d0,d2
    1ad4:	3601           	move.w d1,d3
    1ad6:	4842           	swap d2
    1ad8:	4843           	swap d3
    1ada:	3002           	move.w d2,d0
    1adc:	3203           	move.w d3,d1
    1ade:	3406           	move.w d6,d2
    1ae0:	3607           	move.w d7,d3
    1ae2:	234c 57f0      	move.l a4,22512(a1)
    1ae6:	2c02           	move.l d2,d6
    1ae8:	2e03           	move.l d3,d7
    1aea:	e48e           	lsr.l #2,d6
    1aec:	e48f           	lsr.l #2,d7
    1aee:	b186           	eor.l d0,d6
    1af0:	b387           	eor.l d1,d7
    1af2:	cc85           	and.l d5,d6
    1af4:	ce85           	and.l d5,d7
    1af6:	bd80           	eor.l d6,d0
    1af8:	bf81           	eor.l d7,d1
    1afa:	e58e           	lsl.l #2,d6
    1afc:	e58f           	lsl.l #2,d7
    1afe:	bd82           	eor.l d6,d2
    1b00:	bf83           	eor.l d7,d3
    1b02:	283c 00ff 00ff 	move.l #16711935,d4
    1b08:	2c01           	move.l d1,d6
    1b0a:	2e03           	move.l d3,d7
    1b0c:	e08e           	lsr.l #8,d6
    1b0e:	e08f           	lsr.l #8,d7
    1b10:	b186           	eor.l d0,d6
    1b12:	b587           	eor.l d2,d7
    1b14:	22cd           	move.l a5,(a1)+

00001b16 <.start1>:
    1b16:	cc84           	and.l d4,d6
    1b18:	ce84           	and.l d4,d7
    1b1a:	bd80           	eor.l d6,d0
    1b1c:	bf82           	eor.l d7,d2
    1b1e:	e18e           	lsl.l #8,d6
    1b20:	e18f           	lsl.l #8,d7
    1b22:	bd81           	eor.l d6,d1
    1b24:	bf83           	eor.l d7,d3
    1b26:	280e           	move.l a6,d4
    1b28:	2c01           	move.l d1,d6
    1b2a:	2e03           	move.l d3,d7
    1b2c:	e28e           	lsr.l #1,d6
    1b2e:	e28f           	lsr.l #1,d7
    1b30:	b186           	eor.l d0,d6
    1b32:	b587           	eor.l d2,d7
    1b34:	cc84           	and.l d4,d6
    1b36:	ce84           	and.l d4,d7
    1b38:	bd80           	eor.l d6,d0
    1b3a:	bf82           	eor.l d7,d2
    1b3c:	dc86           	add.l d6,d6
    1b3e:	de87           	add.l d7,d7
    1b40:	b386           	eor.l d1,d6
    1b42:	b787           	eor.l d3,d7
    1b44:	2840           	movea.l d0,a4
    1b46:	2a42           	movea.l d2,a5
    1b48:	2646           	movea.l d6,a3
    1b4a:	b5c8           	cmpa.l a0,a2
    1b4c:	6600 ff42      	bne.w 1a90 <.x1>
    1b50:	2347 d408      	move.l d7,-11256(a1)
    1b54:	234b 2bf8      	move.l a3,11256(a1)
    1b58:	234c 57f0      	move.l a4,22512(a1)
    1b5c:	22cd           	move.l a5,(a1)+
    1b5e:	4cdf 0300      	movem.l (sp)+,a0-a1
    1b62:	d3fc 0000 afe0 	adda.l #45024,a1
    1b68:	2018           	move.l (a0)+,d0
    1b6a:	2418           	move.l (a0)+,d2
    1b6c:	2218           	move.l (a0)+,d1
    1b6e:	2618           	move.l (a0)+,d3
    1b70:	283c f0f0 f0f0 	move.l #-252645136,d4
    1b76:	c084           	and.l d4,d0
    1b78:	c284           	and.l d4,d1
    1b7a:	c484           	and.l d4,d2
    1b7c:	c684           	and.l d4,d3
    1b7e:	e88a           	lsr.l #4,d2
    1b80:	e88b           	lsr.l #4,d3
    1b82:	8082           	or.l d2,d0
    1b84:	8283           	or.l d3,d1
    1b86:	2418           	move.l (a0)+,d2
    1b88:	2c18           	move.l (a0)+,d6
    1b8a:	2618           	move.l (a0)+,d3
    1b8c:	2e18           	move.l (a0)+,d7
    1b8e:	c484           	and.l d4,d2
    1b90:	cc84           	and.l d4,d6
    1b92:	c684           	and.l d4,d3
    1b94:	ce84           	and.l d4,d7
    1b96:	e88e           	lsr.l #4,d6
    1b98:	e88f           	lsr.l #4,d7
    1b9a:	8486           	or.l d6,d2
    1b9c:	8687           	or.l d7,d3
    1b9e:	3c02           	move.w d2,d6
    1ba0:	3e03           	move.w d3,d7
    1ba2:	3400           	move.w d0,d2
    1ba4:	3601           	move.w d1,d3
    1ba6:	4842           	swap d2
    1ba8:	4843           	swap d3
    1baa:	3002           	move.w d2,d0
    1bac:	3203           	move.w d3,d1
    1bae:	3406           	move.w d6,d2
    1bb0:	3607           	move.w d7,d3
    1bb2:	2c02           	move.l d2,d6
    1bb4:	2e03           	move.l d3,d7
    1bb6:	e48e           	lsr.l #2,d6
    1bb8:	e48f           	lsr.l #2,d7
    1bba:	b186           	eor.l d0,d6
    1bbc:	b387           	eor.l d1,d7
    1bbe:	cc85           	and.l d5,d6
    1bc0:	ce85           	and.l d5,d7
    1bc2:	bd80           	eor.l d6,d0
    1bc4:	bf81           	eor.l d7,d1
    1bc6:	e58e           	lsl.l #2,d6
    1bc8:	e58f           	lsl.l #2,d7
    1bca:	bd82           	eor.l d6,d2
    1bcc:	bf83           	eor.l d7,d3
    1bce:	283c 00ff 00ff 	move.l #16711935,d4
    1bd4:	2c01           	move.l d1,d6
    1bd6:	2e03           	move.l d3,d7
    1bd8:	e08e           	lsr.l #8,d6
    1bda:	e08f           	lsr.l #8,d7
    1bdc:	b186           	eor.l d0,d6
    1bde:	b587           	eor.l d2,d7
    1be0:	6000 0088      	bra.w 1c6a <.start2>

00001be4 <.x2>:
    1be4:	2018           	move.l (a0)+,d0
    1be6:	2418           	move.l (a0)+,d2
    1be8:	2218           	move.l (a0)+,d1
    1bea:	2618           	move.l (a0)+,d3
    1bec:	2347 d408      	move.l d7,-11256(a1)
    1bf0:	283c f0f0 f0f0 	move.l #-252645136,d4
    1bf6:	c084           	and.l d4,d0
    1bf8:	c284           	and.l d4,d1
    1bfa:	c484           	and.l d4,d2
    1bfc:	c684           	and.l d4,d3
    1bfe:	e88a           	lsr.l #4,d2
    1c00:	e88b           	lsr.l #4,d3
    1c02:	8082           	or.l d2,d0
    1c04:	8283           	or.l d3,d1
    1c06:	2418           	move.l (a0)+,d2
    1c08:	2c18           	move.l (a0)+,d6
    1c0a:	2618           	move.l (a0)+,d3
    1c0c:	2e18           	move.l (a0)+,d7
    1c0e:	234b 2bf8      	move.l a3,11256(a1)
    1c12:	c484           	and.l d4,d2
    1c14:	cc84           	and.l d4,d6
    1c16:	c684           	and.l d4,d3
    1c18:	ce84           	and.l d4,d7
    1c1a:	e88e           	lsr.l #4,d6
    1c1c:	e88f           	lsr.l #4,d7
    1c1e:	8486           	or.l d6,d2
    1c20:	8687           	or.l d7,d3
    1c22:	3c02           	move.w d2,d6
    1c24:	3e03           	move.w d3,d7
    1c26:	3400           	move.w d0,d2
    1c28:	3601           	move.w d1,d3
    1c2a:	4842           	swap d2
    1c2c:	4843           	swap d3
    1c2e:	3002           	move.w d2,d0
    1c30:	3203           	move.w d3,d1
    1c32:	3406           	move.w d6,d2
    1c34:	3607           	move.w d7,d3
    1c36:	234c 57f0      	move.l a4,22512(a1)
    1c3a:	2c02           	move.l d2,d6
    1c3c:	2e03           	move.l d3,d7
    1c3e:	e48e           	lsr.l #2,d6
    1c40:	e48f           	lsr.l #2,d7
    1c42:	b186           	eor.l d0,d6
    1c44:	b387           	eor.l d1,d7
    1c46:	cc85           	and.l d5,d6
    1c48:	ce85           	and.l d5,d7
    1c4a:	bd80           	eor.l d6,d0
    1c4c:	bf81           	eor.l d7,d1
    1c4e:	e58e           	lsl.l #2,d6
    1c50:	e58f           	lsl.l #2,d7
    1c52:	bd82           	eor.l d6,d2
    1c54:	bf83           	eor.l d7,d3
    1c56:	283c 00ff 00ff 	move.l #16711935,d4
    1c5c:	2c01           	move.l d1,d6
    1c5e:	2e03           	move.l d3,d7
    1c60:	e08e           	lsr.l #8,d6
    1c62:	e08f           	lsr.l #8,d7
    1c64:	b186           	eor.l d0,d6
    1c66:	b587           	eor.l d2,d7
    1c68:	22cd           	move.l a5,(a1)+

00001c6a <.start2>:
    1c6a:	cc84           	and.l d4,d6
    1c6c:	ce84           	and.l d4,d7
    1c6e:	bd80           	eor.l d6,d0
    1c70:	bf82           	eor.l d7,d2
    1c72:	e18e           	lsl.l #8,d6
    1c74:	e18f           	lsl.l #8,d7
    1c76:	bd81           	eor.l d6,d1
    1c78:	bf83           	eor.l d7,d3
    1c7a:	280e           	move.l a6,d4
    1c7c:	2c01           	move.l d1,d6
    1c7e:	2e03           	move.l d3,d7
    1c80:	e28e           	lsr.l #1,d6
    1c82:	e28f           	lsr.l #1,d7
    1c84:	b186           	eor.l d0,d6
    1c86:	b587           	eor.l d2,d7
    1c88:	cc84           	and.l d4,d6
    1c8a:	ce84           	and.l d4,d7
    1c8c:	bd80           	eor.l d6,d0
    1c8e:	bf82           	eor.l d7,d2
    1c90:	dc86           	add.l d6,d6
    1c92:	de87           	add.l d7,d7
    1c94:	b386           	eor.l d1,d6
    1c96:	b787           	eor.l d3,d7
    1c98:	2840           	movea.l d0,a4
    1c9a:	2a42           	movea.l d2,a5
    1c9c:	2646           	movea.l d6,a3
    1c9e:	b5c8           	cmpa.l a0,a2
    1ca0:	6600 ff42      	bne.w 1be4 <.x2>
    1ca4:	2347 d408      	move.l d7,-11256(a1)
    1ca8:	234b 2bf8      	move.l a3,11256(a1)
    1cac:	234c 57f0      	move.l a4,22512(a1)
    1cb0:	22cd           	move.l a5,(a1)+

00001cb2 <.none>:
    1cb2:	4cfa 7fff 0004 	movem.l 1cba <.c2p_saveregs>(pc),d0-a6
    1cb8:	4e75           	rts

00001cba <.c2p_saveregs>:
	...

00001cf6 <c2p1x1_8_c5_gen_scroffs>:
    1cf6:	0000 0001      	ori.b #1,d0

00001cfa <c2p1x1_8_c5_gen_pixels>:
    1cfa:	0000 0001      	ori.b #1,d0
