function Run-Gimpactions {

    #Build Insturctions
    $arglist = New-Object -TypeName "System.Collections.ArrayList"
    $arglist.Add("-i")
    #$arglist.Add("-i")
    $batch = ""
    foreach($arg in $args) {
        $batch = "$batch ($arg)"
        #$arglist.Add("-b"); $arglist.Add("($arg)")
    }  
    $arglist.Add("-b"); $arglist.Add($batch)       

    $srcfolder = "C:\Program Files\GIMP 2\bin"    
    #$srcfolder = "C:\Users\uersu\Downloads"
    $binary = ".\gimp-2.10.exe"
    #$binary = ".\EchoArgs.exe"
    cd $srcfolder    
    & $binary $arglist
    #echo $arglist

} #Run-Gimpactions

$width = 1009
$height = 806
$xoffset = 0
$yoffset = 0
$i = 0

$dstfolder = "C:\\Users\\uersu\\Documents\\GitData\\voidanniversary\\Scripts" 

while($i -lt 18) {
    $iwidth = [math]::Round($width)
    $iheight = [math]::Round($height)


    Run-Gimpactions `
             "define image (car (file-png-load RUN-NONINTERACTIVE `
                 \`"$dstfolder\\Zoompic.png\`" \`"$dstfolder\\Zoompic.png\`"))" `
             "define drawable (car (gimp-image-get-active-layer image))" `
             "gimp-image-crop image $iwidth $iheight $xoffset $yoffset" `
             "gimp-context-set-interpolation 2" `
             "gimp-image-scale image 336 268" `
             "file-png-save RUN-NONINTERACTIVE image drawable \`"$dstfolder\\zoom_$i.png\`" \`"$dstfolder\\zoom_$i.png\`" FALSE 9 FALSE FALSE FALSE FALSE FALSE" `
             "file-raw-save RUN-NONINTERACTIVE image drawable \`"$dstfolder\\..\\raw\\zoom_$i.raw\`" \`"$dstfolder\\..\\raw\\zoom_$i.raw\`"" `
             "gimp-quit 0"
             
    $i++
    $width = $width / 67 * 64
    $height = $height / 67 * 64
    $xoffset = [math]::Round( (1009 - $width) / 2)
    $yoffset = [math]::Round( (806 - $height) / 2)
}

$paletteraw = [System.IO.File]::ReadAllBytes("$dstfolder\..\raw\zoom_0.raw.pal")
$prefix = ""
$palettereg = 0x1800000
$palette = ""
for($i=0;$i -lt 0x60;$i+=3) { 
   echo $i
   $red =  [Convert]::ToByte($paletteraw[$i])
   $green =  [Convert]::tobyte($paletteraw[$i+1])
   $blue =  [Convert]::tobyte($paletteraw[$i+2])

   $red = [math]::Round($red/17)
   $green = [math]::Round($green/17)
   $blue = [math]::Round($blue/17)
   [Int]$color = $palettereg + $red * 16 * 16 + $green * 16 + $blue
   $colorstr = "{0:x}" -f $color
   $palette = "$($palette)$($prefix)0x$($colorstr)"
   $prefix = ","
   $palettereg += 0x0020000
}
echo $palette

                         
#$test2 =  [Convert]::tobyte($test[15])
#Get-Content -Raw "C:\Users\uersu\Documents\GitData\
 