#include "coppertests.h"
#include "rundemo.h"
#include "utils.h"




ULONG * ClBuild() {
  ULONG *retval = AllocMem(  33*4, MEMF_CHIP);
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
  *cl = 0xfffffffe;

  return retval;
}

int PrepareDisplay() {
  Copperlist1 = ClBuild( );
  Copperlist2 = ClBuild( );
  Bitplane1 = AllocMem(80*640, MEMF_CHIP);
  if(Bitplane1 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane1.\n",38);
    Exit(1);
  }
  ViewBuffer = Bitplane1;
  ViewCopper = Copperlist1;
  Bitplane2 = AllocMem(80*640, MEMF_CHIP);
  if(Bitplane2 == 0) {
    Write(Output(), "Cannot allocate Memory for Bitplane2.\n", 38);
    Exit(1);
  }
  DrawBuffer = Bitplane2;
  DrawCopper = Copperlist2;
  /*SwapCl();
  SetBplPointers();
  SwapCl();
  SetBplPointers();*/
  return 0;
}

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
  Copperlist1 = ClBuild();
  DrawCopper = Copperlist1;
  Copperlist2 = ClBuild();
  ViewCopper = Copperlist2;
  if( TestCopperlistBatch(  Copperlist1, 0, ClsSprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                            44);
  if(  TestCopperlistBatch(  Copperlist1, 16, ClScreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                            54);   
  
  DrawBuffer = (ULONG *)0x40000;
  ViewBuffer = (ULONG *)0x50000;
  
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
  
  if( DrawCopper != Copperlist2)
    Write(  Output(), "SwapCl doesn't work.\n", 21);

  
  PrepareDisplay();
  if( DrawBuffer != Bitplane2) 
    Write( Output(), "DrawBuffer should be set to Bitplane 2 on first frame.\n",
                                                                            55);
  if( DrawCopper != Copperlist2) 
    Write( Output(), 
              "DrawCopper should be set to Copperlist 2 on first frame.\n", 57);

  //PrepareDisplay();

  if( ViewBuffer != Bitplane1) 
    Write( Output(), 
               "Preparedisplay: ViewBuffer should be set to Bitplane 1.\n", 56);

  if( ViewCopper != Copperlist1) 
    Write( Output(), 
             "PrepareDisplay: ViewCopper should be set to Copperlist 1.\n", 58);
  
  SetBplPointers();
  SwapCl();
  UWORD *copword = ViewCopper;
  ULONG pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
  if( pointer != (ULONG) Bitplane2) 
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
                                                   " after first frame.\n", 72);
  SetBplPointers();
  SwapCl();

  copword = (UWORD *) ViewCopper;
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
  if( pointer != (ULONG) Bitplane1) 
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 1"
                                                  " after second frame.\n", 73);
  
  SetBplPointers();
  SwapCl();

  copword = (UWORD *) ViewCopper;
  pointer = copword[COPBPL1LOW] + (copword[COPBPL1HIGH] << 16);
  if( pointer != (ULONG) Bitplane2) 
    Write( Output(), "ViewBuffer in Copperlist should be set to Bitplane 2"
                                                   " after third frame.\n", 72);

  FreeDisplay(  33*4, 80*640);
}