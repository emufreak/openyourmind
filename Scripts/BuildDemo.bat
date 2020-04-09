
SET folderpath=C:\Users\uersu\Documents\GitData\VoidAnniversary\
SET usbpath=D:\Transfer\
Shrinkler -e 1600 -i 9 -l 9 -a 40 -o %folderpath%a.mingw.exe %folderpath%classics
del %usbpath%classics.adf
CopyToAdf classics %usbpath%classics.adf -new 
CopyToAdf %folderpath%classics %usbpath%classics.adf
