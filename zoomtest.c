#include "coppertests.h"
#include "zoomtest.h"
#include "zoom.h"
#include "utils.h"

void ZoomTest() {
  ZoomTestDisplay();
  ZoomTestRoutines();
}

void ZoomTestDisplay() {

  PrepareDisplayZoom();

  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write( Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreenZoom, 12) == 0)
    Write( Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);
  DrawBuffer = 0x40000;
  ViewBuffer = 0x50000;
  Zoom_SetBplPointers();
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistPos(  Copperlist1, 30, 0x00e40004) == 0)
    Write(Output(), 
           "SetBplPointers: Problem in Copperlist bpl2ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 31, 0x00e62800) == 0)
    Write(Output(), 
           "SetBplpointers: Problem in Copperlist bpl2pl should be 2800\n", 60);


  if(  TestCopperlistBatch(  Copperlist1, 32, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);
  
  ULONG clpart1[] = { 0x2c07fffe, 0x018200f0, 0x01820f00, 0x018200f0, 
         0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 
        0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0, 0x01820f00, 0x018200f0};

  if( TestCopperlistBatch( Copperlist1, 34, clpart1, 16) == 0)
    Write( Output(), "Zoomtest: Cl for zoom messed up.\n", 33);

  ULONG clpart2[] = { 0x2d07fffe, 0x018200f0, 0x01820f00 };

  if( TestCopperlistBatch( Copperlist1, 75, clpart2, 3) == 0)
    Write( Output(), "Copperlist: Starwars part line 2 messed up.\n", 44);

  if( TestCopperlistPos( Copperlist1, 10530, 0xfffffffe) == 0)
    Write( Output(), "Copperlist End not correctly set.\n", 34);

  UWORD tstcopycolumn[256];
  int rownr = 1;
  for( int i =0; i<256; i++) {
    tstcopycolumn[i] = rownr;
    rownr += 2;
  }

  FreeDisplay( ZMCPSIZE, ZMBPLSIZE);

}

void ZoomTestRoutines() {

  PrepareDisplayZoom();

  UWORD *destination = DrawBuffer;
  *destination= 0x0000;
  destination += 20;
  *destination= 0x000f;
  Zoom_Source = AllocMem(40*256*5, MEMF_CHIP);
  if( Zoom_Source == 0) {
    Write(  Output(), 
                 "Zoomtestroutines: Can not allocate mem for Zoomsource.\n",54);
    return;
  }
  UWORD *tstsource = Zoom_Source;
  *tstsource = 0xffff;
  tstsource += 20;
  *tstsource = 0x7fff;
  Zoom_CopyColumn( Zoom_Source, DrawBuffer, 0, 0);
  
  WaitBlit();
  destination = DrawBuffer;
  if( *destination != 0x8000)
    Write(  Output(), "Zoomtest: CopyColumn - First row wrong.\n",40);

  destination+= 20;
  if( *destination != 0x000f)
    Write(  Output(), "Zoomtest: CopyColumn - Second row wrong.\n",41);

  FreeDisplay(  ZMCPSIZE, ZMBPLSIZE);
}
