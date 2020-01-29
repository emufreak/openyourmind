#include "zoom.h"
#include "utils.h"

ULONG ClScreenZoom[] = { 0x01fc0000, 0x01060c00, 0x00968020, 0x008e2c81, 
         0x00902cc1, 0x00920038, 0x009400a0, 0x01020000, 0x01040000, 0x01080000, 
                                                       0x010a0000, 0x01002200 };

void  Zoom_CopyColumn( UWORD *source, UWORD *destination, 
                                              UWORD srccolnr, UWORD destcolnr) {
  
  unsigned int bitnr = 15 - (srccolnr & 0xf);
  UWORD bltmask = 0x1 << bitnr;
  ULONG destpos = (ULONG) destination + (destcolnr >> 4);
  ULONG sourcepos = (ULONG) source + (srccolnr >> 4);

  WaitBlit();
  
  hw->bltcon1 = 0; 
  hw->bltcon0 = 0xde4;
  hw->bltafwm = 0xffff;
  hw->bltalwm = 0xffff;
  hw->bltamod = ZMLINESIZE - 2;
  hw->bltbmod = ZMLINESIZE - 2;
  hw->bltdmod = ZMLINESIZE - 2;
  hw->bltcdat = bltmask;
  hw->bltapt = (UWORD *) sourcepos;
  hw->bltbpt = (UWORD *) destpos;
  hw->bltdpt = (UWORD *) destpos;
  hw->bltsize = ZMCOLHEIGHT*64+1;

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
  
 