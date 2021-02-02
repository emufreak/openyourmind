#include "zoomtest2.h"
#include "zoom.h"
#include "utils.h"
#include <string.h>

void Test_Zoom2() {
  
  //Test Zoomlevel 1
  volatile ULONG *srcsmall = AllocMem( 80, MEMF_CHIP);
  if( srcsmall == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcsmall\n", 42);
    return;
  }
  Utils_FillLong(srcsmall, 0xaaaaaaaa, 2, 10, 0);

  volatile ULONG *srcbig = AllocMem( 160, MEMF_CHIP);
    if( srcbig == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for srcbig\n", 40);
    return;
  }
  Utils_FillLong( srcbig, 0x55555555, 2, 20, 0);

  volatile ULONG *target = AllocMem( 168, MEMF_CHIP);
  if( target == 0) {
    Write( Output(), "Test_Zoom2: Cannot alloc mem for target\n", 40);
    return;
  }
  WaitBlt();
  hw->bltafwm = 0xffff;
  hw->bltalwm = 0xffff;
  hw->bltdmod = 38;
  hw->bltcon1 = 1 << 12; //Shift src big
  hw->bltcon0 = 0xde4; //Chanell settings and Shift src small
  hw->bltcdat = 0x8000; //Show channel small if 1 else channel big
  
  //srcbig:        0101 0101 0101 0101
  //srcbig-shift   0010 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sbbb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
  UWORD *tmp = (UWORD *)target;
  WaitBlit();
  for(int i=0;i<2;i++)
    if( *tmp != 0xaaaa ) {
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 1 failed\n", 40);
      return;
    } else tmp += 20;

  //srcbig:        0101 0101 0101 0101
  //srcbig-shift   0001 0101 0101 0101
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       ssbb bbbb bbbb bbbb
  //result:        1001 0101 0101 0101

  hw->bltcon1 = 2 << 12; //Shift src big
  hw->bltcdat = 0xc000; //Show channel small if 1 else channel big
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
  tmp = (UWORD *)target;
  WaitBlit();
  for(int i=0;i<2;i++)
    if( *tmp != 0x9555 ) {
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 2 failed\n", 40);
      return;
    } else tmp += 20;

  //srcbig:        0101 0101 0101 0101
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
  tmp = (UWORD *)target;
  WaitBlit();
  for(int i=0;i<2;i++)
    if( *tmp != 0xaaaa ) {
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
      return;
    } else tmp += 20;  

  //srcbig:        0101 0101 0101 0101
  //srcbig-shift   0000 1010 1010 1010
  //srcsmall:      1010 1010 1010 1010  
  //pattern:       sssb bbbb bbbb bbbb
  //result:        1010 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big

  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
  tmp = (UWORD *)target;
  WaitBlit();
  for(int i=0;i<2;i++)
    if( *tmp != 0xaaaa ) {
      Write( Output(), "Test_Zoom2: Test for Zoomlevel 3 failed\n", 40);
      return;
    } else tmp += 20;  

  //srcbig:              0101 0101 0101 0101
  //srcbig-shift         0000 1010 1010 1010
  //srcsmall:            1010 1010 1010 1010
  //srcsmall-shift:      0101 0101 0101 0101
  //pattern:             sssb bbbb bbbb bbbb
  //result:              0100 1010 1010 1010

  hw->bltcon1 = 3 << 12; //Shift src big
  hw->bltcdat = 0xe000; //Show channel small if 1 else channel big
  hw->bltcon0 = 0xde4 + (1 << 12); //Chanell settings and Shift src small
 
  Zoom_ZoomBlit2( srcsmall, srcbig, target, 2, 38,78, 1);
  tmp = (UWORD *)target;
  WaitBlit();
  for(int i=0;i<2;i++)
    if( *tmp != 0x4aaa ) {
      Write( Output(), "Test_Zoom2: Test for shifting a failed\n", 39);
      return;
    } else tmp += 20;  

  FreeMem( srcsmall, 80);
  FreeMem( srcbig, 160);
  FreeMem( target, 168);
}