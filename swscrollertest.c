#include "swscrollertest.h"
#include "swscroller.h"
#include "coppertests.h"
#include "utils.h"
#include "utilsasm.h"

void SwScrollerTest() {
    PrepareDisplaySW();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write( Output(), "Copperlist End not correctly set.\n", 34);
 
  FreeDisplay( SWCPSIZE, SWBPLSIZE);

  

} 