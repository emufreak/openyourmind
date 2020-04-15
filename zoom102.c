/* 15 14 13 12 11 10 9 
   FF01, 0048

*/

#include "utils.h"
#include "zoom102.h"

/*ULONG Cl102Zoom[] = { 0x003d80fe, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
             0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {
  UWORD *values4shift = Values4Shift+levelofshrink*30;
  copperlist+=3+73*2;
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  values4shift -= 29;
  copperlist += 12;
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  values4shift -= 29;
  copperlist += 8;
  
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  values4shift -= 29;
  copperlist += 6;
  for(int i = 0; i<29;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  UWORD *bp = 0x200;
  *bp = 0;
  
}

UWORD Values4Shift[] = { 
                     // Shrink 0
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77,
                     // Shrink 1
                     0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77,
                     //Shrink 2
                     0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x66, 0x66,
                     0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66,
                     //Shrink 3
                     0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x66, 0x66,
                     0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66, 0x66,
                     //Shrink 4
                     0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55,
                     //Shrink 5
                     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55,
                     //Shrink 6
                     0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44,
                     //Shrink 7
                     0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44,
                     //Shrink 8
                     0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33,
                     //Shrink 9
                     0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44, 0x44,
                     //Shrink a
                     0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33,   
                     //Shrink b
                     0xdd, 0xdd, 0xdd, 0xdd, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33,   
                     //Shrink c
                     0xdd, 0xdd, 0xdd, 0xdd, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
                     //Shrink d
                     0xee, 0xee, 0xdd, 0xdd, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x22, 0x22, 0x22, 0x22, 0x22, 0x22,
                     //Shrink e
                     0xee, 0xee, 0xdd, 0xdd, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x22, 0x22, 0x11, 0x11, 0x11, 0x11,
                     //Shrink f
                     0xee, 0xee, 0xdd, 0xdd, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x22, 0x22, 0x11, 0x11, 0x00, 0x00,
                     //Shrink 10
                     0xff, 0xee, 0xdd, 0xdd, 0xcc, 0xcc, 0xbb, 0xbb, 0xaa, 0xaa,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x77, 0x66, 0x66, 0x55, 0x55,
                     0x44, 0x44, 0x33, 0x33, 0x22, 0x22, 0x11, 0x11, 0x00, 0x00
                    };

ULONG Cl102ZoomInit[] = { 0x00840000, 0x00860000, 0x2c01ff00 };

ULONG Cl102ZoomRepeat[] = { 0x003d80fe, //Wait for hpos 3d on line < 0x80
                            0x1020088, //Background red
                            0x1020088, //Background black
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black $$
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x00df80fe, // Wait for last hpos on line < 0x80 
                            0x8001ff01, // If Line < 80 
                            0x008a0000, // jump to start 
                            0x00840000, // New Jumpaddress = br1
                            0x00860000, // 
                                        //br1:
                            0x803d80fe, //Wait for hpos 3d on line >= 0x80
                            0x1020088, //Background red
                            0x1020088, //Background black
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020077, //Background red              
                            0x80e180fe, // Wait for last hpos on line > 0x80
                            0xff01ff01,  // If Line < 255
                            0x008a0000, //Jump to br1
                            0x803d80fe, //Wait for hpos 3d on line >= 0x80
                            0x1020000, //Background red
                            0x1020000, //Background black
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            
                            0x00840000, // New Jumpaddress = br2
                            0x00860000, // 
                            //0x18000f0, // Wait for last hpos on line > 0x80
                                        //br2
                            0x003d80fe, //Wait for hpos 3d on line < 0x80
                            0x1020000, //Background red
                            0x1020000, //Background black
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                            0x1020000, //Background black 
                            0x1020000, //Background red
                             
                            0x00e180fe, // Wait for last hpos on line < 0x80
                            0x2c01ff01, //If line < 2c
                            0x008a0000, // jump to br2           
                            }; 

 /* WAIT HPOS=3d Msb vpos=0
    WAIT HPOS=3d Msb vpos=1
    MOVEINSTRUCTIONS */