#include "coppertests.h"
#include "rundemo.h"
#include "utils.h"

//Test a batch of copperlist instructions against a certain position
int TestCopperlistBatch(  long *instructions, int pos, long *batch, 
                                                                  long length) {
  for( int i=0;i<length;i++)
    if( instructions[ pos+i] != batch[ i])
      return 0;
  return 1;
}

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    return 1;
  else 
    return 0;
}

void TestCopperList() {
  Write( Output(), "%d", hw->cop1lc);
  DrawCopper = Copperlist1;
  ViewCopper = Copperlist2;
  ClBuild( Copperlist1);
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = 0x40000;
  ViewBuffer = 0x50000;
  SetBplPointers();
  if( DrawBuffer != 0x50000 || ViewBuffer != 0x40000)
    Write( Output(), 
            "SetBplPointers: Draw and ViewBuffer not proberly switched.\n", 59);
    
  if(  TestCopperlistPos(  Copperlist1, 28, 0x00e00004) == 0)
    Write(Output(), 
           "SetBplPointers: Problem in Copperlist bpl1ph should be 0004\n", 60);
  
  if(  TestCopperlistPos(  Copperlist1, 29, 0x00e20000) == 0)
    Write(Output(), 
           "SetBplpointers: Problem in Copperlist bpl1pl should be 0000\n", 60);

  if(  TestCopperlistBatch(  Copperlist1, 30, ClColor, 2) == 0)
    Write(Output(), "Copperlist: Colorpart messed up.\n", 33);

  
  if( TestCopperlistPos( Copperlist1, 32, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set.\n", 34);
  
  SwapCl();
  if( DrawCopper != &Copperlist2)
    Write(  Output(), "SwapCl doesn't work.\n", 21);

  PrepareDisplay();
  if( DrawBuffer != Bitplane1) 
    Write( Output(), "DrawBuffer should be set to Bitplane 1 on first frame.\n",
                                                                            55);
  if( DrawCopper != Copperlist1) 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 1 on first frame.\n", 57);

  PrepareDisplay();

  if( ViewBuffer != Bitplane2) 
    Write( Output(), 
               "Preparedisplay: ViewBuffer should be set to Bitplane 2.\n", 56);

  if( ViewCopper != Copperlist2) 
    Write( Output(), 
             "PrepareDisplay: ViewCopper should be set to Copperlist 2.\n", 58);

  RunFrame();
  UWORD *copword = ViewCopper;
  ULONG pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
  if( pointer != Bitplane2) 
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
                                                   " after first frame.\n", 72);
  
  RunFrame();

  copword = ViewCopper;
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
  if( pointer != Bitplane1) 
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
                                                  " after second frame.\n", 73);
  
  RunFrame();

  copword = ViewCopper;
  pointer = copword[CopBpl1Low] + (copword[CopBpl1High] << 16);
  if( pointer != Bitplane2) 
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
                                                   " after third frame.\n", 72);

  

}