#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
  UWORD size4buffer = 40*544*ZMBPLDEPTH;
  UWORD size4target = 44*272*ZMBPLDEPTH;
  ULONG *pic1 = AllocMem( size4buffer, MEMF_CHIP);
  if( pic1 == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic1\n", 38);
    return;
  }
  ULONG *pic2 = AllocMem( size4buffer*2,MEMF_CHIP);
  if( pic2 == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for pic2\n", 38);
    return;
  }
  ULONG *target = AllocMem( size4target, MEMF_CHIP);
  UWORD *bp = 0x200;
  *bp = 0;
  if( target == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    return;
  }
  Zoom_Zl4Words = AllocMem( 21*8, MEMF_ANY);
  if( Zoom_Zl4Words == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for Zoom_Zl4Words\n", 40);
    return;
  }
  
  UWORD *pos2write = Zoom_Zl4Words;
  for( int i=0;i<14;i++) {
    *pos2write++ = 4;
    *pos2write++ = 4;
    *pos2write++ = 8;
  }
  //16   16 ffff
  //8+16 40 ff00
  //8+16 64 0000
  Utils_FillLong( pic1, 0xfff00f00, 272, 10, 0 );
  Utils_FillLong( pic1+10*272, 0xfff00f00, 272, 10, 0 );
  Utils_FillLong( pic2, 0x0000ffff, 272, 20, 0);
  Utils_FillLong( pic2+20*272, 0x0000ffff, 272, 20, 0);
  //Utils_FillLong( pic2, 0x0000ffff, size4buffer*2);

  
  for( int i=1;i<=1;i++) {
    Zoom_ZoomIntoPicture2( (UWORD *)pic1, (UWORD *) pic2,(UWORD *) target, i, 
                                                                             5);
    UWORD *bp = 0x200;
    *bp = 0;
    UWORD *pos = (UWORD *) target + 1;
    //ULONG pattern = 0xffff << (16 - i*2);
    UWORD pattern[3] = { 0x00ff, 0xff0f, 0xffff };
    for( int i2=0;i2<2;i2++) {
      for( int i3=0;i3<7;i3++) {
        for( int i4=0; i4<3;i4++) {
          if(*pos++ != pattern[i4])  {
            pos--;
            UWORD data[3];
            char str[100];
            data[0] = i;
            data[1] = i3*3+i4;
            data[2] = *pos;
            pos++;
            
            RawDoFmt( "Test_Zoom2: Pattern for zoomlevel %d, byte %d messed up."
                                        "Result was %x.\n", data, PutChar, str);
            Write( Output(), str, 66);
          }
        }
      } 
      pos+=2;
    }
  }
  FreeMem( pic1, size4buffer);
  FreeMem( pic2, size4buffer*2);
  FreeMem( target, size4target);
}