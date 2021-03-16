
SET folderpath=C:\Users\uersu\Documents\GitData\VoidAnniversary\
SET usbpath=G:\Transfer\
Shrinkler %folderpath%a.mingw.exe %folderpath%classics
del %usbpath%classics.adf
CopyToAdf classics %usbpath%classics.adf -new 
CopyToAdf %folderpath%classics %usbpath%classics.adf
