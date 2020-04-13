/* 15 14 13 12 11 10 9 
   FF01, 0048

*/

#include "utils.h"

/*ULONG Cl102Zoom[] = { 0x003d80fe, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
             0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 
           0x01800f00, 0x01800000, 0x1800f00, 0x1800000, 0x01800f00, 0x01800000,
           0x1800f00, 0x1800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000,
           0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 0x01800f00, 0x01800000, 
           0x01800f00, 0x01800000 };*/

ULONG Cl102ZoomInit[] = { 0x00840000, 0x00860000, 0x2c01ff00 };

ULONG Cl102ZoomRepeat[] = { 0x003d80fe, //Wait for hpos 3d on line < 0x80
                            0x1800f00, //Background red
                            0x1800000, //Background black
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x18000f0, //Background red
                            0x00df80fe, // Wait for last hpos on line < 0x80 
                            0x8001ff01, // If Line < 80 
                            0x008a0000, // jump to start 
                            0x00840000, // New Jumpaddress = br1
                            0x00860000, // 
                                        //br1:
                            0x803d80fe, //Wait for hpos 3d on line >= 0x80
                            0x1800f00, //Background red
                            0x1800000, //Background black
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x18000f0, //Background red              
                            0x80e180fe, // Wait for last hpos on line > 0x80
                            0xff01ff01,  // If Line < 255
                            0x008a0000, //Jump to br1
                            0x803d80fe, //Wait for hpos 3d on line >= 0x80
                            0x1800f00, //Background red
                            0x1800000, //Background black
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x18000f0, //Background red
                            
                            0x00840000, // New Jumpaddress = br2
                            0x00860000, // 
                            0x00e180fe, // Wait for last hpos on line > 0x80
                                        //br2
                            0x003d80fe, //Wait for hpos 3d on line < 0x80
                            0x1800f00, //Background red
                            0x1800000, //Background black
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x1800f00, //Background red
                            0x1800000, //Background black 
                            0x18000f0, //Background red
                             
                            0x00e180fe, // Wait for last hpos on line < 0x80
                            0x2c01ff01, //If line < 2c
                            0x008a0000, // jump to br2           
                            }; 

 /* WAIT HPOS=3d Msb vpos=0
    WAIT HPOS=3d Msb vpos=1
    MOVEINSTRUCTIONS */