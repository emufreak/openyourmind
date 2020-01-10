#include "swscrollertest.h"
#include "utils.h"

void SwscrollerTest() {

  ClbuildSwscroller();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);
  
   if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 32, clpart1, 16) == 0)
    Write( Output(), "Copperlist: Starwars part messed up.\n", 37);

 ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };

 if( TestCopperlistBatch( Copperlist1, 73, clpart2, 3) == 0)
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);

  if( TestCopperlistPos( Copperlist1, 10528, 0xfffffffe) == 0)
    Write( Output(), "Copperlist End not correctly set.\n", 34);
 
}
