#include "swscroller.h"
#include "utils.h"

ULONG * ClbuildSwscroller() {
  ULONG *retval = AllocMem(  ( 256*41+33)*4, MEMF_CHIP);
  
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