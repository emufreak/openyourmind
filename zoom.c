#include "zoom.h"
#include "utils.h"

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080000, 
                                                       0x010a0000, 0x01002200 };

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
  clpartinstruction = ClScreenZoom;
  for(int i=0; i<12;i++)
    *cl++ = *clpartinstruction++;
  //cl[CopBpl1High] = (long) cl + 2;
  *cl++ = 0x00e00000;
  //cl[CopBpl1Low] = (long) cl + 2;
  *cl++ = 0x00e20000;
  *cl++ = 0x00e40000;
  *cl++ = 0x00e60000;

  clpartinstruction = ClColor;
  for(int i=0; i<2;i++)
    *cl++ = *clpartinstruction++;

  for(int i=0x2c; i<0x2c+256; i++) {
    *cl++ = (i<<24)+0x07fffe;
    for(int i2=0;i2<20;i2++) {
      *cl++ = 0x018200f0;
      *cl++ = 0x01820f00;
    }
  }

   *cl = 0xfffffffe;

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
  SwapCl();
  Zoom_SetBplPointers();
  SwapCl();
  Zoom_SetBplPointers();
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
    UWORD *pos4source = source+ZMLINESIZE/2+ZMLINESIZE/2*shifthoriz-2-i;
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
          
          UWORD *bp = (UWORD *) 0x200;
          *bp = 0;
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
          
          UWORD *bp = (UWORD *) 0x200;
          *bp = 0;
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
  ULONG ptr = (ULONG) DrawBuffer;
  UWORD *copword = (UWORD *) DrawCopper;
  copword += ZMBPLPTRS+1;
  for(int i=1;i<=2;i++) {
    UWORD highword = ptr >> 16;
    UWORD lowword = ptr & 0xffff;
    *copword = highword;
    copword += 2;
    *copword = lowword;
    copword += 2;
    ptr += 40*256;
  }
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}
  
 