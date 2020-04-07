 #include "swscroller.h"
 #include "utils.h"
 
 INCBIN(swfont, "raw/ruby16_8_1.raw");

 int PrepareDisplaySW() {

  Copperlist1 = ClbuildSW();
  Copperlist2 = ClbuildSW();
  Bitplane1 = AllocMem(SWBPLSIZE, MEMF_CHIP);
  if(Bitplane1 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  DrawBuffer = Bitplane1;
  DrawCopper = Copperlist1;
  Bitplane2 = AllocMem(SWBPLSIZE, MEMF_CHIP);
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2;
  SwapCl();
  SetBplPointers( 1, 0);
  SwapCl();
  SetBplPointers( 1, 0);
  return 0;
}

ULONG * ClbuildSW() {
  
  ULONG *retval = AllocMem(  SWCPSIZE, MEMF_CHIP);
  
  if( retval == 0) {
    Write( Output(), "Allocation of Ram for Copper failed.\n", 40);
    Exit(1);
  }
  ULONG *cl = retval;
  //clinstruction = DrawCopper;
  ULONG *clpartinstruction;
  clpartinstruction = ClsSprites;
  for(int i=0; i<16;i++)
    *cl++ = *clpartinstruction++;
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;

  clpartinstruction = ClColor;
  for(int i=0; i<2;i++)
    *cl++ = *clpartinstruction++;

  *cl = 0xfffffffe;

  return retval;
}

void WriteFont( UWORD *font, UWORD *Destination, char *text) {
  UWORD *bmpptr = Destination;
  UWORD *fntptr = font;

  char charpos = *text;
  charpos -= 0x20;
  charpos = charpos<<3;
  fntptr += charpos;
  for(int i=1;i<=8;i++) {
    *bmpptr = *fntptr++;
    bmpptr += 40;
  }

}
