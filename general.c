#include "general.h"

long clsprites[] = { 0x01200000, 0x01220000,0x01240000,0x01260000, 0x01280000, 
        0x012a0000, 0x012c0000, 0x012e0000, 0x01300000, 0x01320000, 0x01340000,
                 0x01360000, 0x01380000, 0x013a0000, 0x013c0000, 0x013e0000  };


void BuildCopper() {
  for(int i=0; i<16;i++)
    copperlist[i] = clsprites[i];
  copperlist[16] = 0xfffffffe;
}