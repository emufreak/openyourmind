
SET folderpath=C:\Users\uersu\Documents\GitData\voidanniversary\Invaders\Code\
php %folderpath%FrameData5.php >%folderpath%FrameData5.i
php %folderpath%graphics.php >%folderpath%graphics.s
php %folderpath%FrameData.php >%folderpath%FrameData.i
php %folderpath%FrameData2.php >%folderpath%FrameData2.i
php %folderpath%FrameData_Color.php >%folderpath%FrameData_Color.i
php %folderpath%FrameData2_Color.php >%folderpath%FrameData2_Color.i
php %folderpath%FrameData3_Color.php >%folderpath%FrameData3_Color.i
php %folderpath%FrameData6.php >%folderpath%FrameData6.i
vasmm68k_mot -m68020 -nocase -Fhunkexe -o %folderpath%test -nosym %folderpath%main103.s
"C:\Program Files\WinUAE\winuae64.exe" -f TestInvaders.uae -s use_gui=no
