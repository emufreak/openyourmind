FDOPOSX equ 4
FDOPOSY equ 138
FDOPOSXDET equ 272
FDOPOSYDET equ 406
FDOBLSIZE equ 540
FRMSIZE equ 674

EF1_PATTERNDATA0: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX0:
  dc.w 16,16,16,16,16,16,16,16,16,16
  dc.w 16,16,16,16,16,17,17,17,17,17
  dc.w 17,17,17,17,17,17,17,17,17,19
  dc.w 19,19,19,19,19,19,19,19,19,19
  dc.w 19,20,20,20,20,20,20,20,20,20
  dc.w 20,20,20,21,21,21,21,21,21,21
  dc.w 21,21,21,21,21,21,21
EF1_POSY0:
  dc.w 18,18,18,18,18,18,18,18,18,18
  dc.w 18,18,18,18,18,19,19,19,19,19
  dc.w 19,19,19,19,19,19,19,19,19,20
  dc.w 20,20,20,20,20,20,20,20,20,20
  dc.w 20,21,21,21,21,21,21,21,21,21
  dc.w 21,21,21,22,22,22,22,22,22,22
  dc.w 22,22,22,22,22,22,22
EF1_POSXDET0:
  dc.w 5,5,5,5,5,5,5,5,5,5
  dc.w 5,5,5,5,5,10,10,10,10,10
  dc.w 10,10,10,10,10,10,10,10,10,2
  dc.w 2,2,2,2,2,2,2,2,2,2
  dc.w 2,2,2,2,2,2,2,2,2,2
  dc.w 2,2,2,1,1,1,1,1,1,1
  dc.w 1,1,1,12,12,12,12
EF1_POSYDET0:
  dc.w 7,7,7,7,7,7,7,7,7,7
  dc.w 7,7,7,7,7,9,9,9,9,9
  dc.w 9,9,9,9,9,9,9,9,9,10
  dc.w 10,10,10,10,10,10,10,10,10,10
  dc.w 10,8,8,8,8,8,8,8,8,8
  dc.w 8,8,8,5,5,5,5,5,5,5
  dc.w 5,5,5,14,14,14,14
EF1_SIZE0:
  dc.w 10,10,10,10,10,10,10,10,10,10
  dc.w 10,10,10,10,10,11,11,11,11,11
  dc.w 11,11,11,11,11,11,11,11,11,12
  dc.w 12,12,12,12,12,12,12,12,12,12
  dc.w 12,13,13,13,13,13,13,13,13,13
  dc.w 13,13,13,14,14,14,14,14,14,14
  dc.w 14,14,14,15,15,15,15

EF1_PATTERNDATA1: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX1:
  dc.w 21,21,21,21,21,21,22,22,22,22
  dc.w 22,22,22,22,22,22,23,23,23,23
  dc.w 23,23,23,23,23,23,23,23,23,23
  dc.w 23,23,23,24,24,24,24,24,24,24
  dc.w 24,24,24,24,24,24,24,24,24,24
  dc.w 24,24,24,24,24,25,25,25,25,25
  dc.w 25,25,25,25,25,25,25
EF1_POSY1:
  dc.w 22,22,22,22,22,22,23,23,23,23
  dc.w 23,23,23,23,23,23,23,23,23,23
  dc.w 23,23,23,23,24,24,24,24,24,24
  dc.w 24,24,24,24,24,24,24,24,24,24
  dc.w 24,25,25,25,25,25,25,25,25,25
  dc.w 25,25,25,25,25,25,25,25,25,25
  dc.w 25,25,25,25,25,25,25
EF1_POSXDET1:
  dc.w 12,12,12,12,12,12,8,8,8,8
  dc.w 8,8,8,8,8,8,1,1,1,1
  dc.w 1,1,1,1,11,11,11,11,11,11
  dc.w 11,11,11,1,1,1,1,1,1,1
  dc.w 1,10,10,10,10,10,10,10,18,18
  dc.w 18,18,18,18,18,5,5,5,5,5
  dc.w 5,5,12,12,12,12,12
EF1_POSYDET1:
  dc.w 14,14,14,14,14,14,8,8,8,8
  dc.w 8,8,8,8,8,8,16,16,16,16
  dc.w 16,16,16,16,7,7,7,7,7,7
  dc.w 7,7,7,14,14,14,14,14,14,14
  dc.w 14,2,2,2,2,2,2,2,8,8
  dc.w 8,8,8,8,8,15,15,15,15,15
  dc.w 15,15,21,21,21,21,21
EF1_SIZE1:
  dc.w 15,15,15,15,15,15,16,16,16,16
  dc.w 16,16,16,16,16,16,17,17,17,17
  dc.w 17,17,17,17,18,18,18,18,18,18
  dc.w 18,18,18,19,19,19,19,19,19,19
  dc.w 19,20,20,20,20,20,20,20,21,21
  dc.w 21,21,21,21,21,22,22,22,22,22
  dc.w 22,22,23,23,23,23,23

EF1_PATTERNDATA2: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX2:
  dc.w 25,25,25,25,25,25,25,25,26,26
  dc.w 26,26,26,26,26,26,26,26,26,26
  dc.w 26,26,26,26,26,26,26,26,26,26
  dc.w 26,26,26,26,26,26,27,27,27,27
  dc.w 27,27,27,27,27,27,27,27,27,27
  dc.w 27,27,27,27,27,27,27,27,27,27
  dc.w 27,27,27,27,27,28,28
EF1_POSY2:
  dc.w 25,25,26,26,26,26,26,26,26,26
  dc.w 26,26,26,26,26,26,26,26,26,26
  dc.w 26,26,26,26,26,26,26,26,26,26
  dc.w 26,27,27,27,27,27,27,27,27,27
  dc.w 27,27,27,27,27,27,27,27,27,27
  dc.w 27,27,27,27,27,27,27,27,27,27
  dc.w 27,27,27,27,27,27,27
EF1_POSXDET2:
  dc.w 12,12,20,20,20,20,20,20,2,2
  dc.w 2,2,2,2,9,9,9,9,9,9
  dc.w 15,15,15,15,15,15,22,22,22,22
  dc.w 22,28,28,28,28,28,5,5,5,5
  dc.w 5,10,10,10,10,10,16,16,16,16
  dc.w 16,21,21,21,21,21,27,27,27,27
  dc.w 32,32,32,32,32,2,2
EF1_POSYDET2:
  dc.w 21,21,4,4,4,4,4,4,9,9
  dc.w 9,9,9,9,15,15,15,15,15,15
  dc.w 20,20,20,20,20,20,26,26,26,26
  dc.w 26,2,2,2,2,2,7,7,7,7
  dc.w 7,11,11,11,11,11,16,16,16,16
  dc.w 16,20,20,20,20,20,25,25,25,25
  dc.w 29,29,29,29,29,34,34
EF1_SIZE2:
  dc.w 23,23,24,24,24,24,24,24,25,25
  dc.w 25,25,25,25,26,26,26,26,26,26
  dc.w 27,27,27,27,27,27,28,28,28,28
  dc.w 28,29,29,29,29,29,30,30,30,30
  dc.w 30,31,31,31,31,31,32,32,32,32
  dc.w 32,33,33,33,33,33,34,34,34,34
  dc.w 35,35,35,35,35,36,36

EF1_PATTERNDATA3: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX3:
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29
EF1_POSY3:
  dc.w 27,27,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,28,28,28,28,28,28
  dc.w 28,28,28,28,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29
EF1_POSXDET3:
  dc.w 2,2,6,6,6,6,11,11,11,11
  dc.w 15,15,15,15,20,20,20,20,24,24
  dc.w 24,29,29,29,29,33,33,33,33,38
  dc.w 38,38,42,42,42,42,1,1,1,4
  dc.w 4,4,8,8,8,11,11,11,15,15
  dc.w 15,18,18,18,22,22,22,25,25,25
  dc.w 29,29,29,32,32,32,36
EF1_POSYDET3:
  dc.w 34,34,1,1,1,1,5,5,5,5
  dc.w 8,8,8,8,12,12,12,12,15,15
  dc.w 15,19,19,19,19,22,22,22,22,26
  dc.w 26,26,29,29,29,29,33,33,33,36
  dc.w 36,36,40,40,40,43,43,43,47,47
  dc.w 47,50,50,50,2,2,2,4,4,4
  dc.w 7,7,7,9,9,9,12
EF1_SIZE3:
  dc.w 36,36,37,37,37,37,38,38,38,38
  dc.w 39,39,39,39,40,40,40,40,41,41
  dc.w 41,42,42,42,42,43,43,43,43,44
  dc.w 44,44,45,45,45,45,46,46,46,47
  dc.w 47,47,48,48,48,49,49,49,50,50
  dc.w 50,51,51,51,52,52,52,53,53,53
  dc.w 54,54,54,55,55,55,56

EF1_PATTERNDATA4: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX4:
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30
EF1_POSY4:
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,29,29,29,29,29
  dc.w 29,29,29,29,29,30,30
EF1_POSXDET4:
  dc.w 36,36,39,39,43,43,43,46,46,46
  dc.w 50,50,53,53,53,57,57,60,60,60
  dc.w 0,0,2,2,5,5,5,7,7,10
  dc.w 10,12,12,15,15,15,17,17,20,20
  dc.w 22,22,25,25,27,27,30,30,32,32
  dc.w 35,35,37,37,40,40,42,42,45,45
  dc.w 47,47,50,52,52,55,55
EF1_POSYDET4:
  dc.w 12,12,14,14,17,17,17,19,19,19
  dc.w 22,22,24,24,24,27,27,29,29,29
  dc.w 32,32,34,34,37,37,37,39,39,42
  dc.w 42,44,44,47,47,47,49,49,52,52
  dc.w 54,54,57,57,59,59,62,62,64,64
  dc.w 67,67,69,69,72,72,74,74,77,77
  dc.w 79,79,82,84,84,1,1
EF1_SIZE4:
  dc.w 56,56,57,57,58,58,58,59,59,59
  dc.w 60,60,61,61,61,62,62,63,63,63
  dc.w 64,64,65,65,66,66,66,67,67,68
  dc.w 68,69,69,70,70,70,71,71,72,72
  dc.w 73,73,74,74,75,75,76,76,77,77
  dc.w 78,78,79,79,80,80,81,81,82,82
  dc.w 83,83,84,85,85,86,86

EF1_PATTERNDATA5: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX5:
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31
EF1_POSY5:
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30
EF1_POSXDET5:
  dc.w 57,57,60,60,62,65,65,67,67,70
  dc.w 72,72,75,75,77,80,80,82,85,85
  dc.w 87,87,90,92,92,95,97,97,100,102
  dc.w 102,0,0,0,2,3,5,5,6,8
  dc.w 8,9,11,12,12,14,15,17,17,18
  dc.w 20,21,23,23,24,26,27,29,29,30
  dc.w 32,33,35,36,36,38,39
EF1_POSYDET5:
  dc.w 2,2,4,4,5,7,7,8,8,10
  dc.w 11,11,13,13,14,16,16,17,19,19
  dc.w 20,20,22,23,23,25,26,26,28,29
  dc.w 29,31,32,32,34,35,37,37,38,40
  dc.w 40,41,43,44,44,46,47,49,49,50
  dc.w 52,53,55,55,56,58,59,61,61,62
  dc.w 64,65,67,68,68,70,71
EF1_SIZE5:
  dc.w 87,87,88,88,89,90,90,91,91,92
  dc.w 93,93,94,94,95,96,96,97,98,98
  dc.w 99,99,100,101,101,102,103,103,104,105
  dc.w 105,106,107,107,108,109,110,110,111,112
  dc.w 112,113,114,115,115,116,117,118,118,119
  dc.w 120,121,122,122,123,124,125,126,126,127
  dc.w 128,129,130,131,131,132,133

EF1_PATTERNDATA6: dc.l PTR_CHECKERBOARD_DATA
EF1_POSX6:
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31
EF1_POSY6:
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30
EF1_POSXDET6:
  dc.w 41,42,44,45,47,47,48,50,51,53
  dc.w 54,56,57,59,60,62,63,65,66,68
  dc.w 69,71,72,74,75,77,78,80,81,83
  dc.w 84,86,87,89,90,92,93,95,98,99
  dc.w 101,102,104,105,107,108,111,113,114,116
  dc.w 117,120,122,123,125,126,129,131,132,135
  dc.w 137,138,140,143,144,146,149
EF1_POSYDET6:
  dc.w 73,74,76,77,79,79,80,82,83,85
  dc.w 86,88,89,91,92,94,95,97,98,100
  dc.w 101,103,104,106,107,109,110,112,113,115
  dc.w 116,118,119,121,122,124,125,127,130,131
  dc.w 133,134,136,137,139,140,143,145,146,148
  dc.w 149,152,154,155,157,158,161,163,164,167
  dc.w 169,170,172,175,176,178,181
EF1_SIZE6:
  dc.w 134,135,136,137,138,138,139,140,141,142
  dc.w 143,144,145,146,147,148,149,150,151,152
  dc.w 153,154,155,156,157,158,159,160,161,162
  dc.w 163,164,165,166,167,168,169,170,172,173
  dc.w 174,175,176,177,178,179,181,182,183,184
  dc.w 185,187,188,189,190,191,193,194,195,197
  dc.w 198,199,200,202,203,204,206

EF1_PATTERNDATA7: dc.l PTR_EMPTY_DATA
EF1_POSX7:
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,32,32
EF1_POSY7:
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,30,30,30,30,30,30,30,30,30
  dc.w 30,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31,31,31,31
  dc.w 31,31,31,31,31,31,31
EF1_POSXDET7:
  dc.w 150,152,155,156,158,161,162,165,167,168
  dc.w 171,173,176,177,180,182,185,186,189,191
  dc.w 194,195,198,200,203,204,207,210,212,215
  dc.w 216,219,222,224,227,230,231,234,237,239
  dc.w 242,245,248,249,252,255,258,261,263,266
  dc.w 269,272,275,278,281,284,287,288,291,294
  dc.w 297,300,303,306,309,-2,-1
EF1_POSYDET7:
  dc.w 182,184,187,188,190,193,194,197,199,200
  dc.w 203,205,208,209,212,214,217,218,221,223
  dc.w 226,227,230,232,235,236,239,242,244,247
  dc.w 248,-1,0,0,1,2,2,3,4,5
  dc.w 6,7,8,8,9,10,11,12,13,14
  dc.w 15,16,17,18,19,20,21,21,22,23
  dc.w 24,25,26,27,28,29,30
EF1_SIZE7:
  dc.w 207,208,210,211,212,214,215,217,218,219
  dc.w 221,222,224,225,227,228,230,231,233,234
  dc.w 236,237,239,240,242,243,245,247,248,250
  dc.w 251,253,255,256,258,260,261,263,265,266
  dc.w 268,270,272,273,275,277,279,281,282,284
  dc.w 286,288,290,292,294,296,298,299,301,303
  dc.w 305,307,309,311,313,315,317

EF1_MOVEX: 
  dc.w 1,-1,0,0,1,-1,0,0

EF1_MOVEY: 
  dc.w 0,0,1,-1,0,0,1,-1




 
 