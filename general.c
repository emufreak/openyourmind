#include "general.h"

long clsprites[] = { 0x01200000, 0x01220000,0x01240000,0x01260000, 0x01280000, 
        0x012a0000, 0x012c0000, 0x012e0000, 0x01300000, 0x01320000, 0x01340000,
                 0x01360000, 0x01380000, 0x013a0000, 0x013c0000, 0x013e0000  };

long clscreen[] = { 0x01fc0000, 0x01060c00, 0x0968020, 0x08e2c81, 0x0902cc1,
          0x0920038, 0x09400d0, 0x01020000, 0x01040000, 0x01080000, 0x010a0000, 
                                                                  0x01001200 };

void BuildCopper() {

  long *clinstruction;
  clinstruction = copperlist;
  long *clpartinstruction;
  clpartinstruction = clsprites;
  for(int i=0; i<16;i++)
    *clinstruction++ = *clpartinstruction++;
  clpartinstruction = clscreen;
  for(int i=0; i<12;i++)
    *clinstruction++ = *clpartinstruction++;
  *clinstruction = 0xfffffffe;
}