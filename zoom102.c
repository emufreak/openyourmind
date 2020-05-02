/* 15 14 13 12 11 10 9 
   FF01, 0048

*/

#include "utils.h"
#include "zoom.h"
#include "zoom102.h"

/*ULONG Cl102Zoom[] = { 0x003d80fe, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
             0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

void Zoom_InsertShift( UWORD *copperlist, UWORD *values4shift) {
  for(int i = 0; i<6;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  copperlist--;
  *copperlist++ = *values4shift++;
  *copperlist = *values4shift++;
  copperlist += 2;
  for(int i = 0; i<10;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  copperlist--;
  *copperlist++ = *values4shift++;
  *copperlist = *values4shift++;
  copperlist += 2;
  for(int i = 0; i<7;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
}

void Zoom_Shrink102( UWORD levelofshrink, UWORD *copperlist )  {

  
  UWORD *values4shift = Values4Shift+levelofshrink*108;
  //copperlist+=3+73*2;
  Zoom_InsertShift( copperlist+3+73*2, values4shift);
  Zoom_InsertShift( copperlist+63+73*2, values4shift+27);
  Zoom_InsertShift( copperlist+119+73*2, values4shift+54);
  Zoom_InsertShift( copperlist+175+73*2, values4shift+81);
  
  /*values4shift -= 30;
  copperlist += 10;
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  values4shift -= 30;
  copperlist += 6;
  
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }
  values4shift -= 30;
  copperlist += 6;
  for(int i = 0; i<30;i++) {
    *copperlist = *values4shift++;
    copperlist += 2;
  }*/
  
}

UWORD MaxZoom102[] = { 16,16,16,16,15,14,14,14,12,12,11,11,11,11,11,10,9,9 };

UWORD Values4Shift[] = { 
                     //Shrink 0
                     0x77, ZMBPLMOD, 0x77, 0x77, ZMBPLMOD, 0x77, 0xff01, 0xff01, ZMBPLMOD, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x77, 

                     0x77, ZMBPLMOD, 0x77, 0x77, ZMBPLMOD, 0x77, 0xff01, 0xff01, ZMBPLMOD, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x77, 

                     0x77, ZMBPLMOD, 0x77, 0x77, ZMBPLMOD, 0x77, 0xff01, 0xff01, ZMBPLMOD, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x77, 

                     0x77, ZMBPLMOD, 0x77, 0x77, ZMBPLMOD, 0x77, 0xff01, 0xff01, ZMBPLMOD, 0x77,
                     0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x77, 

                     //Shrink 1
                     0x88, ZMBPLMOD, 0x88, 0x88, ZMBPLMOD, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x88, 

                     0x88, ZMBPLMOD, 0x88, 0x88, ZMBPLMOD, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x88,

                     0x88, ZMBPLMOD2, 0x88, 0x88, ZMBPLMOD2, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x88,

                     0x88, ZMBPLMOD, 0x88, 0x88, ZMBPLMOD, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x77, 0x77, 0x77, 0xff01, 0xff01,
                     ZMBPLMOD, 0x77, 0x77, 0x77, 0x77, 0x80fe, 0x88,

                     // Shrink 2
                    
                     0x88, ZMBPLMOD2, 0x88, 0x88, ZMBPLMOD2, 0x88, 0x7f01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0x7f01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x88,

                     0x88, ZMBPLMOD, 0x88, 0x88, ZMBPLMOD, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0xff01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x88,

                     0x88, ZMBPLMOD2, 0x88, 0x88, ZMBPLMOD2, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0xff01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x88,

                     0x88, ZMBPLMOD, 0x88, 0x88, ZMBPLMOD, 0x88, 0xff01, 0xff01, ZMBPLMOD, 0x88,
                     0x88, 0x88, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0xff01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x88,
                   
                     //Shrink 3
                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0x7f01, 0xff01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0x7f01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x99,

                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0xbf01, 0xbf01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0xbf01, 0xbf01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x99,

                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0xff01, 0xff01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0x7f01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x99,

                     0x99, ZMBPLMOD, 0x99, 0x99, ZMBPLMOD, 0x99, 0xff01, 0xff01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x66, 0x66, 0x7f01, 0xff01,
                     ZMBPLMOD, 0x66, 0x66, 0x66, 0x66, 0x80fe, 0x99,


                     //Shrink 4
                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0x3f01, 0xbf01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0x3f01, 0xbf01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0x99,

                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0xbf01, 0xbf01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0xbf01, 0xbf01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0x99,

                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0xff01, 0xff01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0xff01, 0xff01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0x99,

                     0x99, ZMBPLMOD2, 0x99, 0x99, ZMBPLMOD2, 0x99, 0xff01, 0xff01, ZMBPLMOD, 0x99,
                     0x99, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0xff01, 0xff01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0x99,

 //Shrink 5
                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0x3f01, 0xbf01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0x3f01, 0xbf01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0xaa,

                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0xbf01, 0xbf01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0xbf01, 0xbf01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0xaa,

                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0xff01, 0xff01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0xaa,

                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0x1f01, 0x9f01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x55, 0x1f01, 0x9f01,
                     ZMBPLMOD, 0x55, 0x55, 0x55, 0x55, 0x80fe, 0xaa,

                     //Shrink 6
                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0x3f01, 0xbf01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x3f01, 0xbf01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xaa,

                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0x9f01, 0x9f01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x9f01, 0x9f01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xaa,

                     0xaa, ZMBPLMOD2, 0xaa, 0xaa, ZMBPLMOD2, 0xaa, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xaa,

                     0xaa, ZMBPLMOD, 0xaa, 0xaa, ZMBPLMOD, 0xaa, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xaa,

                     //Shrink 7
                     0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0x3f01, 0xbf01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x3f01, 0xbf01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xbb,

                     0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0x9f01, 0x9f01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x9f01, 0x9f01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xbb,

                     0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xbb,

                     0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0x1f01, 0x9f01, ZMBPLMOD, 0xaa,
                     0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x1f01, 0x9f01,
                     ZMBPLMOD, 0x44, 0x44, 0x44, 0x44, 0x80fe, 0xbb,

                 //Shrink 8
                 0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0x1f01, 0x9f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x1f01, 0x9f01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xbb,

                 0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0x9f01, 0x9f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x9f01, 0x9f01,
                     ZMBPLMOD, 0x33, 0x33, 0x33,0x33, 0x80fe, 0xbb,

                 0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xbb,

                 0xbb, ZMBPLMOD2, 0xbb, 0xbb, ZMBPLMOD2, 0xbb, 0x1f01, 0x9f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x1f01, 0x9f01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xbb,

 //Shrink 9
                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0x1f01, 0x9f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x1f01, 0x9f01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xcc,

                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0x9f01, 0x9f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x9f01, 0x9f01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xcc,

                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xcc,

                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0x0f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x0f01, 0x8f01,
                     ZMBPLMOD, 0x33, 0x33, 0x33, 0x33, 0x80fe, 0xcc,

 //Shrink a
                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0x4f01, 0xcf01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x4f01, 0xcf01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xcc,


                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0x9f01, 0x9f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x9f01, 0x9f01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xcc,

                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xcc,

                 0xcc, ZMBPLMOD2, 0xcc, 0xcc, ZMBPLMOD2, 0xbb, 0x0f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x0f01, 0x8f01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xcc,

 
 //Shrink b
                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x4f01, 0xcf01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x4f01, 0xcf01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xdd,


                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x8f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x8f01, 0x8f01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xdd,

                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01,
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xdd,

                 0xdd, ZMBPLMOD, 0xdd, 0xcc, ZMBPLMOD, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,              
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01, 
                     ZMBPLMOD, 0x33, 0x22, 0x22, 0x22, 0x80fe, 0xdd,             
                                                                                              
  //Shrink c
                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x4f01, 0xcf01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x4f01, 0xcf01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xdd,


                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x8f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x8f01, 0x8f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xdd,

                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xdd,

                 0xdd, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x1f01, 0x9f01, ZMBPLMOD, 0xaa,              
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x1f01, 0x9f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xdd,             
                 
  //Shrink d
                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x4f01, 0xcf01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x4f01, 0xcf01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xee,


                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x8f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x8f01, 0x8f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xee,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xee,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x0f01, 0x8f01, ZMBPLMOD, 0xaa,              
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x0f01, 0x8f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x11, 0x80fe, 0xee,            
                
  //Shrink e
                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x4f01, 0xcf01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x4f01, 0xcf01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xee,


                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x8f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x8f01, 0x8f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xee,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xee,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xf01, 0x8f01, ZMBPLMOD, 0xaa,        
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x0f01, 0x8f01,     
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xee,      
                                                                                      
 //Shrink f
                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x0f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x0f01, 0x8f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xff,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0x8f01, 0x8f01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x8f01, 0x8f01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xff,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xff01, 0xff01, ZMBPLMOD, 0xaa,
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0xff01, 0xff01, 
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xff,

                 0xee, ZMBPLMOD2, 0xdd, 0xcc, ZMBPLMOD2, 0xbb, 0xf01, 0x8f01, ZMBPLMOD, 0xaa,        
                 0xaa, 0x99, 0x88, 0x88, 0x77, 0x66, 0x55, 0x44, 0x0f01, 0x8f01,     
                     ZMBPLMOD, 0x33, 0x22, 0x11, 0x00, 0x80fe, 0xff,     
                 
                    };


//ULONG Cl102ZoomInit[] = { 0xfffffffe, 0x00860000, 0x2c01ff00 };
ULONG Cl102ZoomInit[] = { 0x00840000, 0x00860000, 0x2c01ff00 };

ULONG Cl102ZoomRepeat[] = { 0x003d80fe, //Wait for hpos 3d on line < 0x80
                            0x1020088, //Background red
                            0x1080088, //Background black
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x10a0088, //Background red
                            0x1020088, //Background black 
                            0xff01ff01, //Background red
                            0x1080088, //Background black $$
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020000, //Background red
                            0xff01ff01, //Background black 
                            0x10a0066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background black
                            0x00e180fe, //Background red
                            0x1020066, //Background black 
                            //0x00df80fe, // Wait for last hpos on line < 0x80 
                            0x8001ff01, // If Line < 80 
                            0x008a0000, // jump to start 
                            0x00840000, // New Jumpaddress = br1
                            0x00860000, // 
                                        //br1:
                            0x803d80fe, //Wait for hpos 3d on line >= 0x80
                            0x1020088, //Background red
                            0x1080088, //Background black
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x10a0088, //Background red
                            0x1020088, //Background black 
                            0xff01ff01, //Background red
                            0x1080088, //Background black $$
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020000, //Background red
                            0xff01ff01, //Background black 
                            0x10a0066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background black
                            0x80e180fe, //Background red
                            0x1020066, //Background black 
                            //0x80e180fe, // Wait for last hpos on line > 0x80
                            0xff01ff01,  // If Line < 255
                            0x008a0000, //Jump to br1
                            0x803d80fe, //Wait for hpos 3d on line >= 0x80
                            0x1020088, //Background red
                            0x1080088, //Background black
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x10a0088, //Background red
                            0x1020088, //Background black 
                            0xff01ff01, //Background red
                            0x1080088, //Background black $$
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020000, //Background red
                            0xff01ff01, //Background black 
                            0x10a0066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background black
                            0x80e180fe, //Background red
                            0x1020066, //Background black 
                            0x00840000, // New Jumpaddress = br2
                            0x00860000, // 
                            //0x18000f0, // Wait for last hpos on line > 0x80
                                        //br2
                            0x003d80fe, //Wait for hpos 3d on line < 0x80
                            0x1020088, //Background red
                            0x1080088, //Background black
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x10a0088, //Background red
                            0x1020088, //Background black 
                            0xff01ff01, //Background red
                            0x1080088, //Background black $$
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020088, //Background red
                            0x1020088, //Background black 
                            0x1020077, //Background red
                            0x1020077, //Background black 
                            0x1020000, //Background red
                            0xff01ff01, //Background black 
                            0x10a0066, //Background red
                            0x1020066, //Background black 
                            0x1020066, //Background red
                            0x1020066, //Background black 
                             0x1020066, //Background black
                            0x00e180fe, //Background red
                            0x1020066, //Background black 
                            0x2c01ff01, //If line < 2c
                            0x008a0000, // jump to br2           
                            }; 

 /* WAIT HPOS=3d Msb vpos=0
    WAIT HPOS=3d Msb vpos=1
    MOVEINSTRUCTIONS */