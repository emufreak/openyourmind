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
    #& $binary $arglist
    echo $arglist

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
    #$yoffset += 6*4
    #$xoffset += 8*4
    #$imgwidth -= 16*4
    #$imgheight -= 12*4
}

                         
             