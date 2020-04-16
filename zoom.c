#include "zoom.h"
#include "zoom102.h"
#include "utils.h"

INCBIN(startimage, "raw/eye352x272x5.raw")

void Zoom_LoadImage( ULONG *destination) {  
  /*for(int i=0;i<128+8;i++) {
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
      *destination++ = 0x55555555;
    for(int i2=0;i2<ZMLINESIZE/4*5;i2++)
      *destination++ = 0xaaaaaaaa;
  }*/
  for( int i=0;i<256;i++) {
    for( int i2=0;i2<ZMLINESIZE/4;i2++)
      *destination++ = 0xaaaaaaaa;                 
    for( int i2=0;i2<ZMLINESIZE/4;i2++)     
      *destination++ = 0x33333333;        
    for( int i2=0;i2<ZMLINESIZE/4;i2++)
      *destination++ = 0x00000000;
    for( int i2=0;i2<ZMLINESIZE/4;i2++)
      *destination++ = 0x00000000;
    for( int i2=0;i2<ZMLINESIZE/4;i2++)
      *destination++ = 0x00000000;
    
  }

  /*UWORD *bp = 0x200;
  *bp = 0;*/
  //CopyMem( startimage, destination, 48*272*5);
}

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  
  //hw->color[0] = 0xf00;
  WaitBlt();
  //hw->color[0] = 0x000;
  hw->bltapt = (UWORD *) source;
  hw->bltdpt = (UWORD *) destination;
  hw->bltsize = height*64+2;

}


void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  //hw->color[0] = 0xf00;
  WaitBlt();
  //hw->color[0] = 0x000;

  /*Mintterm
  ABCD
  0000
  0010
  0101
  0110
  1000
  1011
  1101
  1111*/
  //0000 0000 1010 1010 1010 1010
  //0000 0001 0101 0101 0101 0101
  //                     4    a
  
  hw->bltapt = source + ZoomBlit_Increment4SrcA;
  hw->bltbpt = source;
  hw->bltdpt = destination;
  hw->bltsize = height*64+2;

}

void Zoom_InitRun() {
       
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
  Zoom_LevelOf102Zoom = 0;
  ZoomHorizontal = 16;
  Zoom_PrepareDisplay();
  Zoom_LoadImage( Bitplane1);
  Zoom_LoadImage( Bitplane2);
  Zoom_LevelOfZoom = 0;
}
  
int Zoom_PrepareDisplay() {
  Copperlist1 = ClbuildZoom( );
  Copperlist2 = ClbuildZoom( );
  Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
  if(Bitplane1 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  DrawBuffer = Bitplane1;
  DrawCopper = Copperlist1;
  Bitplane2 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2;
  return 0;
}

void Zoom_Init() {
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
  ZoomHorizontal = 16;
}


ULONG * ClbuildZoom() {
  
  ULONG *retval = AllocMem(  ZMCPSIZE, MEMF_CHIP);
  
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
  //clpartinstruction = ClScreenZoom;
  clpartinstruction = ClScreen;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
  *cl++ = 0x00e40000;
  *cl++ = 0x00e60000;
  *cl++ = 0x00e80000;
  *cl++ = 0x00ea0000;
  *cl++ = 0x00ec0000;
  *cl++ = 0x00ee0000;
  *cl++ = 0x00f00000;
  *cl++ = 0x00f20000;

  clpartinstruction = ClColor;
  for(int i=0; i<32;i++)
    *cl++ = *clpartinstruction++;
  
  ULONG cop2 = cl+3;
  ULONG cop2lch = 0x00840000 + ( cop2 >> 16);
  ULONG cop2lcl = 0x00860000 + (cop2 & 0xffff);
  clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
  *cl++ = cop2lcl;
  *cl++ = 0x2c01ff00;

  ULONG cop2br1 = cop2 + ( (8+27)<<2);
  ULONG cop2br2 = cop2 + ( (20+27+27+26+1)<<2);
  clpartinstruction = Cl102ZoomRepeat;
  clpartinstruction[6+27] = 0x00840000 + ( cop2br1 >> 16);
  clpartinstruction[7+27] = 0x00860000 + ( cop2br1 & 0xffff);
  clpartinstruction[17+27+27+27+1] = 0x00840000 + ( cop2br2 >> 16);
  clpartinstruction[18+27+27+27+1] = 0x00860000 + ( cop2br2 & 0xffff);
  for(int i=0;i<26+27+27+26+27+1;i++)
    *cl++ = *clpartinstruction++;

   *cl++ = 0xfffffffe;

  return retval;
}

 int PrepareDisplayZoom() {

  Copperlist1 = ClbuildZoom();
  Copperlist2 = ClbuildZoom();
  Bitplane1 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
  if(Bitplane1 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  DrawBuffer = Bitplane1;
  DrawCopper = Copperlist1;
  Bitplane2 = AllocMem(ZMBPLSIZE, MEMF_CHIP);
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  ViewBuffer = Bitplane2;
  ViewCopper = Copperlist2;
  /*SwapCl();
  Zoom_SetBplPointers();
  SwapCl();
  Zoom_SetBplPointers();*/
  return 0;
}

void Init_Blit() {
  hw->bltafwm = 0xffff;
  hw->bltalwm = 0xffff;
  hw->bltamod = ZMLINESIZE - 4;
  hw->bltbmod = ZMLINESIZE - 4;
  hw->bltdmod = ZMLINESIZE - 4;
}

void Init_ZoomBlit( UWORD startofword, WORD nextzoom, WORD shiftright) {
  ZoomBlit_Increment4SrcA = 0;

  UWORD colnr = nextzoom - startofword - 1;                                                                          
  UWORD shiftb = shiftright << 12;    //SEEEEE0|12.X..f E=Empty
  UWORD shifta;
  if( shiftright == 0) {
    ZoomBlit_Increment4SrcA = 1;
    shifta = 15 << 12;
  } else {
    shifta = (shiftright - 1) << 12;
  }
  WaitBlit(); 
  hw->bltcon1 = shiftb; 
  hw->bltcon0 = 0xde4 + shifta;
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
}

void Init_Copy( WORD shift) {
  UWORD shiftright = shift << 12;
  WaitBlit();
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
  WaitBlit();
  Init_Blit();
  WORD shiftright = 9;
  UWORD shifthoriz = 7;
  UWORD startofword = 21*16;
  WORD nextzoom = 22*16 - 20 + zoomnr * 10;
  while( nextzoom > 22 * 16) {
    nextzoom -= (19 + zoomnr);
    shiftright--;
  } 
  //UWORD nextzoom = 352-28 + (zoomnr << 3);
  UWORD shifttoleft = 0;
  //WORD linesforzoom = 16;

  WORD ZoomHorizontalStart = 18 - zoomnr * 5;
  while( ZoomHorizontalStart < 0) {
      ZoomHorizontalStart += 1 + 18 + zoomnr;
      shifthoriz--;
  } 

  for(int i=0;i<22;i++) {

    ZoomHorizontal = ZoomHorizontalStart;

    WORD linesleft = 272;
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz*planes-2-i;
    UWORD *pos4dest = destination+ZMLINESIZE/2-2-i;
    /*UWORD size4blitsmall = ZMLINESIZE/2*ZoomHorizontal*planes;
    UWORD size4blitbig = ZMLINESIZE/2*(ZoomHorizontal+1)*planes;*/

    UWORD onestep = ZMLINESIZE/2*planes;
    if( startofword >= nextzoom) { // No vertical scalimg. Use normal copy
      Init_Copy( shiftright);
              
      while(linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
          linesleft -= ZoomHorizontal;
        } else {
          ZoomHorizontal = linesleft;
          linesleft = 0;
        } 
        UWORD size4blit = ZoomHorizontal*onestep; 
        //Add aditional line
        if( linesleft>0) {
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
          UWORD *tmpdest = pos4dest +  size4blit;
          
          /*UWORD *bp = (UWORD *) 0x200;
          *bp = 0;*/
          Zoom_CopyWord( tmpsource, tmpdest, planes);
          //Source doesn't change. Only forward dest
          //pos4dest += ZMLINESIZE/2;
          linesleft--;
        }
        Zoom_CopyWord( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep; 
        
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
      }
    } else {  
      Init_ZoomBlit( startofword, nextzoom, shiftright);   
      nextzoom -= (19 + zoomnr);
      while( linesleft > 0) {
        if( linesleft >= ZoomHorizontal+1) {
          linesleft -= ZoomHorizontal;
        } else {
          ZoomHorizontal = linesleft;
          linesleft = 0;
        }
        UWORD size4blit = ZoomHorizontal*onestep;
        //Add aditional line
        if( linesleft>0) {
          UWORD *tmpsource = pos4source + size4blit + shifttoleft;
          UWORD *tmpdest = pos4dest + size4blit;
          
          /*UWORD *bp = (UWORD *) 0x200;
          *bp = 0;*/
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
          //Source doesn't change. Only forward dest
          //pos4dest += ZMLINESIZE/2;
          linesleft--;
        }
        Zoom_ZoomBlit( pos4source+shifttoleft, pos4dest, ZoomHorizontal*planes);
        pos4source += size4blit;
        pos4dest += size4blit + onestep;   
        ZoomHorizontal = 18 - zoomnr + (zoomnr << 1);
      }
      shiftright--;  
      if(shiftright < 0) {
        shiftright += 16;
        shifttoleft = 1;
      }
    }
    startofword -= 16;
  }
  //ZoomHorizontal = 10;
}

void Zoom_SetBplPointers() {
  ULONG plane2set = DrawBuffer;
  UWORD *posofcopper = (UWORD *)DrawCopper + ZMCOPBPL1HIGH;
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    UWORD lowword = (ULONG)plane2set & 0xffff;
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += ZMLINESIZE; //Next plane (interleaved)
  }
  
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}
  
 