#include "coppertests.h"
#include "utils.h"

long copperlist[] = { 0xfffffffe };

//Check if a certain position in a copperlist has the expected value
int TestCopperlistPos(  long *instructions, int pos, long value) {
  if( instructions[pos] == value ) 
    return 1;
  else 
    return 0;
}

void TestCopperList() {
    if( TestCopperlistPos( copperlist, 0, 0xfffffffe) == 0)
        Write(Output(), "Copperlist End not correctly set\n", 32);
    if( TestCopperlistPos( copperlist, 0, 0xfffffffe) == 0)
        Write(Output(), "Copperlist End not correctly set\n", 32);
    
}