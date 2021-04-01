#include "support/gcc8_c_support.h"
#include "zoom.h"

UWORD *Zoom_Zl4Words;

ULONG *Zoom_ZoomBlitMask;

UWORD *Zoom_Source;
UWORD ZoomBlit_Increment4SrcA;
struct Interrupt *Zoom_vbint;

UWORD *font2;
UWORD Zoom_Counter = 0;
ULONG ClScreenZoom[12];
UWORD *Zoom_StartImage;
UWORD Zoom_MouseReleased;
UWORD Zoom_Mousepressed;
UWORD Zoom_Blit4ZoomFinished;
UWORD volatile Zoom_LevelOfZoom;
UWORD volatile Zoom_LevelOf102Zoom;
WORD Zoom_Direction;
WORD ZoomHorizontal;

#include "zoom102.h"
#include "utils.h"
#include "zoomtest.h"

//INCBIN(startimage, "raw/zoom.raw")
INCBIN_CHIP(rawzoom, "raw/zoom.raw");

/*void c2p() {
  c2p1x1_8_c5_gen_init( 336, 268, 0, 0, 0, 0);
  UWORD *src = rawzoom;
  UWORD *dst = framebuffer;
  for(int i=0;i<=17;i++) {
    c2p1x1_8_c5_gen( src, dst);
    src += 45025;
    dst += 28140;
  }
}*/

void Zoom_VblankHandler() {

  Zoom_Counter++;
  SwapCl();
  Zoom_MouseReleased = 1;
  if( MouseLeft())
    Zoom_Mousepressed = 1;
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    Zoom_MouseReleased = 1;
    Zoom_Mousepressed = 0;
  }
      
      Zoom_MouseReleased = 0;
      if( Zoom_LevelOf102Zoom <= 2) {
 
        if( Zoom_LevelOfZoom == 87)
          Zoom_LevelOfZoom = 0;
        else
          Zoom_LevelOfZoom++;
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
      } else 
        Zoom_LevelOf102Zoom-=2;
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
 
}


void Zoom_ReverseVblankHandler() {
  
  Zoom_Counter++;
  SwapCl();
  Zoom_MouseReleased = 1;
  if( MouseLeft())
    Zoom_Mousepressed = 1;
  if( Zoom_Mousepressed == 1 && !MouseLeft()) {
    Zoom_MouseReleased = 1;
    Zoom_Mousepressed = 0;
  }
    /*if( MouseLeft()) {
      while (MouseLeft())
      {
      }*/
      
      Zoom_MouseReleased = 0;
      if( Zoom_LevelOf102Zoom == 15) {
 
        if( Zoom_LevelOfZoom == 0)
          Zoom_LevelOfZoom = 17;
        else
          Zoom_LevelOfZoom--;
        Zoom_LevelOf102Zoom = 0;// MaxZoom102[ Zoom_LevelOfZoom] - 1;  
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
      } else 
        Zoom_LevelOf102Zoom++;
    //}
  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
 
}

void Zoom_LoadImage( ULONG *destination) {  
  CopyMem( rawzoom, destination, ZMBPLSIZE);
}

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  

  WaitBlt();

  hw->bltapt = (UWORD *) source;
  hw->bltdpt = (UWORD *) destination;
  hw->bltsize = (height<<6)+2;

}

void Zoom_ZoomBlit( UWORD *source, UWORD *destination, UWORD height) {

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B

  UWORD *blta = source + ZoomBlit_Increment4SrcA;
  WaitBlt();
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
  
  hw->bltapt = blta;
  hw->bltbpt = source;
  hw->bltdpt = destination;
  hw->bltsize = (height<<6)+2;

}

void Zoom_ZoomBlit2( UWORD *src4a, UWORD *src4b, UWORD *dst, UWORD height,
                                                 UWORD bltamod, UWORD bltbmod
                                                        , UWORD numofwords) {

                              //FFFFFFF|TTTTFFF F = Binary 0 T=Binary 1
              //Channel D =   //BBBBBBB¦AAAABBB A= ChannelA , B = Channel B
  hw->bltamod = bltamod;
  hw->bltbmod = bltbmod;  
  hw->bltapt = src4a;
  hw->bltbpt = src4b;
  hw->bltdpt = dst;
  hw->bltsize = (height<<6)+numofwords;
  
  WaitBlt();
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

}


void Zoom_InitRun() {
    
  Zoom_Counter = 0;
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
  Zoom_LevelOf102Zoom = 15;
  ZoomHorizontal = 16;
  Zoom_PrepareDisplay();
  /*Zoom_StartImage = rawzoom;
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 15, Copperlist1);
  Zoom_Shrink102( 15, Copperlist2);
  Zoom_LevelOfZoom = 1;
  Zoom_Direction = 1;                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    Zoom_vbint->is_Node.ln_Pri = -60;
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    Zoom_vbint->is_Data = NULL;
    Zoom_vbint->is_Code = Zoom_VblankHandler;
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
  SwapCl();
  
}

void Zoom_InitRunReverse() {
    
  Zoom_Counter = 0;
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
  Zoom_LevelOf102Zoom = 0;
  ZoomHorizontal = 16;
  Zoom_PrepareDisplay();
  /*Zoom_StartImage = rawzoom;
  Zoom_LoadImage( Bitplane1);
  Zoom_ZoomIntoPicture( (UWORD *) Bitplane1, (UWORD *) Bitplane2, 0, 5);
  CopyMem( Bitplane2, Bitplane1, ZMBPLSIZE);
  CopyMem( Bitplane2, rawzoom, ZMBPLSIZE);*/
  
  Zoom_Shrink102( 0, Copperlist1);
  Zoom_Shrink102( 0, Copperlist2);
  Zoom_LevelOfZoom = 17;
                                                  
  if ((Zoom_vbint = AllocMem(sizeof(struct Interrupt),    
                         MEMF_PUBLIC|MEMF_CLEAR))) {
    Zoom_vbint->is_Node.ln_Type = NT_INTERRUPT;       
    Zoom_vbint->is_Node.ln_Pri = -60;
    Zoom_vbint->is_Node.ln_Name = "VertB-Example";
    Zoom_vbint->is_Data = NULL;
    Zoom_vbint->is_Code = Zoom_ReverseVblankHandler;
  }

  AddIntServer( INTB_VERTB, Zoom_vbint);
  Zoom_SetBplPointers( ViewBuffer, ViewCopper);
  Zoom_SetBplPointers( ViewBuffer, DrawCopper);
  SwapCl();
  
}

void Zoom_Dealloc() {
  RemIntServer(INTB_VERTB, Zoom_vbint);
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
}
  
int Zoom_PrepareDisplay() {
  Zoom_SwapBuffers( 0);
  Copperlist1 = ClbuildZoom( );
  Copperlist2 = ClbuildZoom( );
  /*Bitplane1 = AllocMem(ZMLINESIZE*272*5, MEMF_CHIP);
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
  ViewBuffer = Bitplane2;*/
  DrawCopper = Copperlist1;
  ViewCopper = Copperlist2;
  return 0;
}

void Zoom_Init() {
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
  ZoomHorizontal = 16;
  Zoom_LevelOf102Zoom = 15;
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
  //clpartinstruction = Cl102ZoomInit;
  *cl++ = cop2lch;
  *cl++ = cop2lcl;
  *cl++ = 0x2c01ff00;

  ULONG cop2br1 = cop2 + ( (30)<<2);
  ULONG cop2br2 = cop2 + ( (86)<<2);
  clpartinstruction = Cl102ZoomRepeat;
  clpartinstruction[28] = 0x00840000 + ( cop2br1 >> 16);
  clpartinstruction[29] = 0x00860000 + ( cop2br1 & 0xffff);
  clpartinstruction[84] = 0x00840000 + ( cop2br2 >> 16);
  clpartinstruction[85] = 0x00860000 + ( cop2br2 & 0xffff);
  for(int i=0;i<26+27+27+26+27+1-8-12;i++)
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
  return 0;
}

void Init_Blit() {
  hw->bltafwm = 0xffff;
  hw->bltalwm = 0xffff;
  hw->bltamod = ZMLINESIZE - 4;
  hw->bltbmod = ZMLINESIZE - 4;
  hw->bltdmod = ZMLINESIZE - 4;
}


void Init_Blit2() {
  hw->bltafwm = 0xffff;
  hw->bltalwm = 0xffff;
  hw->bltamod = 36;
  hw->bltbmod = 76;
  hw->bltdmod = ZMLINESIZE2 - 4;
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
  WaitBlt(); 
  hw->bltcon1 = shiftb; 
  hw->bltcon0 = 0xde4 + shifta;
  hw->bltcdat = (0xffff << (16-colnr)) & 0xffff;
}

void Init_Copy( WORD shift) {
  UWORD shiftright = shift << 12;
  WaitBlt();
  hw->bltcon0 = 0x9f0 + shiftright;
  hw->bltcon1 = 0;
}

void Zoom_ZoomIntoPicture( UWORD *source, UWORD *destination, UWORD zoomnr, 
                                                                 UWORD planes) {
  
  WaitBlt();  
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
          
          Zoom_CopyWord( tmpsource, tmpdest, planes);
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
          
          Zoom_ZoomBlit( tmpsource, tmpdest, planes);
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
}

void Zoom_SetBplPointers( UWORD *buffer, ULONG *copper) {
  //                   0  1  1   1   1   0   1   1    1    1    0    1    1    0    1    1
  //int zoomoffset[] = { 0, 0, 42, 42, 84, 84, 84, 126, 126, 168, 168, 168, 210, 210, 210, 332};
  //int zoomoffset[] = { 252, 210, 210, 210, 168, 168, 168, 126, 126, 84, 84, 84, 42, 42, 0, 0 };
  int zoomoffset[] = { 126, 105, 105, 105, 84, 84, 84, 63, 63, 42, 42, 42, 21, 21, 0, 0 };

  ULONG plane2set = buffer + zoomoffset[Zoom_LevelOf102Zoom];//+1;
  /*ULONG plane2set = buffer+1+( 8 - (Zoom_LevelOf102Zoom/2))
                                                         *ZMLINESIZE*ZMBPLDEPTH/4;*/
  UWORD *posofcopper = (UWORD *)copper + ZMCOPBPL1HIGH;
  
  for(int i=0;i<ZMBPLDEPTH;i++) {
    UWORD highword = (ULONG)plane2set >> 16;
    UWORD lowword = (ULONG)plane2set & 0xffff;
    *posofcopper = highword;
    posofcopper += 2;
    *posofcopper = lowword;
    posofcopper += 2;
    plane2set += 42*268; //Next plane
  }
  
}

void Zoom_SwapBuffers( UWORD zoomlevel) {

  ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  /*ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;*/
}

//Without Precalc
/*void Zoom_SwapBuffers() {
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}*/

/*void Zoom_ZoomIntoPicture2( UWORD *source1, UWORD *source2, UWORD *target, 
  UWORD levelofzoom, UWORD nrofplanes) {

  
  UWORD posx4a = 320-7*(levelofzoom-1);
  UWORD posx4b = 640-14*( levelofzoom-1);
  UWORD ystart = 8*levelofzoom;
  target = target + 21;
  ULONG pos4astart = ( ULONG)source1 + ystart * 40;
  ULONG pos4bstart = ( ULONG)source2 + ystart * 80;
  UWORD *zl4word = Zoom_Zl4Words + 21 * (levelofzoom) - 1;
  WaitBlt();
  hw->bltafwm = 0xffff;
  hw->bltalwm = 0xffff;
  hw->bltdmod = ZMLINESIZE2 - 2;
  for(int i=1;i<=21;i++) {
    UWORD *targetpos = target - i;
    UWORD nrofpixels = 16 - *zl4word;
    posx4a -= nrofpixels;
    posx4b -= nrofpixels*2;
    ULONG pos4a = pos4astart + ( ( posx4a - 1) >> 4) * 2;
    ULONG pos4b = pos4bstart + ( ( posx4b - 1) >> 4) * 2;
    //shift channel a = R of (17 + zl - pos)/16
    UWORD shifta = ( ( 16 + *zl4word - ( posx4a & 0xf)) & 0xf) << 12;
    //shift channel b = R of (17 - pos)/16 
    UWORD shiftb = ( (16  - ( posx4b & 0xf)) & 0xf) << 12;
    UWORD bltcon0 = 0xde4 + shifta;
    UWORD linesleft = 271;
    UWORD lines2write;
    WaitBlt();
    hw->bltcon1 = shiftb; 
    hw->bltcon0 = bltcon0;
    hw->bltcdat = 0xffff >> (*zl4word--*2);
    while (linesleft > 0) {
      lines2write = 2*levelofzoom;
      lines2write = linesleft > lines2write ? lines2write : linesleft;
      Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 36, 76);
      pos4a += 40 * lines2write;
      pos4b += 80 * lines2write;
      targetpos += lines2write * ZMLINESIZE2/2;
      linesleft -= lines2write;
      if( linesleft == 0) break;
      lines2write = 16 - levelofzoom * 2;
      lines2write = linesleft > lines2write ? lines2write : linesleft;
      if( lines2write > 0) {
        Zoom_ZoomBlit2( pos4a, pos4b, targetpos, lines2write, 76, 156);
        targetpos += lines2write * ZMLINESIZE2/2;
        linesleft -= lines2write;
      }
    }
  }
}*/


//123456789ABCDEFG
//1123456789ABCDEF GG123456789ABCDEF