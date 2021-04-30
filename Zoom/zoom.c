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
ULONG Zoom_Rawchip;
ULONG Zoom_Rawfast;
ULONG Zoom_Rawany;


#include "zoom102.h"
#include "utils.h"

//INCBIN(startimage, "raw/zoom.raw")
//INCBIN_CHIP(rawzoom, "raw/zoom.raw");
//INCBIN(startimage, "raw/zoom.raw")

//INCBIN(rawzoom_fast,"raw/zoom_fast.raw");
//INCBIN_CHIP(rawzoom_chip,"raw/zoom_chip.raw");

ULONG Zoom_Lz4size[] = { 42511,42463,42421,42270,41751,40738,39996,39060,37874,36892,36241,35321,34728,34474,
                         33997,33503,33142,32668,32214,31291,29034,29228,28869,28638,28164,27978,27914,27868,
                         27796,27882,27670,27536,27596,27654,27940,28067,28193,28130,28262,28434,29583,29469,
                         29172,28684,28569,28591,28603,28773,29030,29621,30053,30511,31099,31719,31338,31530,
                         31063,30853,30290,30091,29776,29559,29388,29023,28781,28111,27382,27147,27092,27381,
                         28005,28825,29293,30005,30963,31638,32827,33742,34658,35468,36421,37422,39767,39770,
                         39992,39800,39661,39092
                      };

ULONG imgptrs[] = {  0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0 };
int Zoom_Pic = 1;
int volatile Zoom_DrawPicture = 1;

void Zoom_Run() {
  for(int i=0;i <2; i++)
  {
    while(1) {
      WaitVbl();
      if( Zoom_DrawPicture == 1) {    
        if( Zoom_Pic > 1) {
          __DecompressLZ4( imgptrs[Zoom_Pic], DrawBuffer, Zoom_Lz4size[Zoom_Pic]-19);
          //Utils_CopyMem(imgptrs[Zoom_Pic], DrawBuffer, 14070);  
        }
        Zoom_DrawPicture = 0;
        Zoom_Pic++;
      }  
      if(Zoom_Pic == 87 ) {
        Zoom_Pic = 10;
        break;
      }
    }  
  }
}

void Zoom_VblankHandler() {

  hw->dmacon = 0b1000011111111111;
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
          Zoom_LevelOfZoom = 10;
        else
          Zoom_LevelOfZoom++;
        Zoom_LevelOf102Zoom = 15;// MaxZoom102[ Zoom_LevelOfZoom] - 1;          
        Zoom_SwapBuffers(  Zoom_LevelOfZoom);
        Zoom_DrawPicture = 1;
      } else 
        Zoom_LevelOf102Zoom-=2;

  Zoom_Shrink102(   Zoom_LevelOf102Zoom, (UWORD *) DrawCopper);
  Zoom_SetBplPointers(ViewBuffer, DrawCopper);
 
}


/*void Zoom_LoadImage( ULONG *destination) {  
  CopyMem( rawzoom, destination, ZMBPLSIZE);
}*/

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080008, 
                                                       0x010a0000, 0x01001200 };

void  Zoom_CopyWord( UWORD *source, UWORD *destination, UWORD height) {  

  WaitBlt();

  hw->bltapt = (UWORD *) source;
  hw->bltdpt = (UWORD *) destination;
  hw->bltsize = (height<<6)+2;

}


void Zoom_InitRun() {

  /*Zoom_Rawchip = rawzoom_chip;
  Zoom_Rawfast = rawzoom_fast;*/

  int i = 0;

  for(;i<2;i++) {
    imgptrs[i] = Zoom_Rawchip + 56280*i;
  }

  ULONG tmp = 11;
  for(;i<27;i++) {
    imgptrs[i] = Zoom_Rawany + tmp;
    tmp += Zoom_Lz4size[i];
  }

  tmp = 11;
  for(;i<88;i++) {
    imgptrs[i] = Zoom_Rawfast + tmp;
    tmp += Zoom_Lz4size[i];
  }

  Zoom_Counter = 0;
  Zoom_ZoomBlitMask = AllocMem(4, MEMF_CHIP);
  Zoom_LevelOf102Zoom = 15;
  ZoomHorizontal = 16;
  Zoom_PrepareDisplay();
  
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

void Zoom_Dealloc() {
  RemIntServer(INTB_VERTB, Zoom_vbint);
  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);
}
  
int Zoom_PrepareDisplay() {
  ViewBuffer = imgptrs[0];
  DrawBuffer = imgptrs[1];
  /*ViewBuffer = AllocVec(268*42*5, MEMF_CHIP);  
  DrawBuffer = AllocVec(268*42*5, MEMF_CHIP);*/
  /*Utils_CopyMem( imgptrs[0], ViewBuffer, 14070);
  Utils_CopyMem( imgptrs[0], DrawBuffer, 14070);*/
  Copperlist1 = ClbuildZoom( );
  Copperlist2 = ClbuildZoom( );
  
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

void Zoom_SetBplPointers( UWORD volatile *buffer, ULONG volatile *copper) {
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
  //ViewBuffer = rawzoom + (42*268*5*zoomlevel);
  ULONG tmp = (ULONG) DrawBuffer;
  DrawBuffer = ViewBuffer;
  ViewBuffer = (ULONG *) tmp;
}