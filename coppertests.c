#include "coppertests.h"
#include "utils.h"
#include "general.h"

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
  BuildCopper();
  if( TestCopperlistBatch(  copperlist, 0, clsprites, 16) == 0)
    Write(Output(), "Sprite section of copper starting on pos 0 messed up\n", 
                                                                           44);
  if(  TestCopperlistBatch(  copperlist, 16, clscreen, 12) == 0)
    Write(Output(), "Screen section of copper starting on pos 16 messed up\n",
                                                                           54);
  if( TestCopperlistPos( copperlist, 28, 0xfffffffe) == 0)
    Write(Output(), "Copperlist End not correctly set\n", 31);
    
}