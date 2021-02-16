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

} #Run-Gimpactions

$imgwidth = 1280
$imgheight = 1024
$xoffset = 0
$yoffset = 0
$i = 0

$dstfolder = "C:\\Users\\uersu\\Documents\\GitData\\voidanniversary\\Scripts" 

while($imgwidth -gt 320) {
    Run-Gimpactions `
             "define image (car (gimp-file-load RUN-NONINTERACTIVE `
                 \`"$dstfolder\\Zoompic.xcf\`" \`"$dstfolder\\Zoompic.xcf\`"))" `
             "define drawable (car (gimp-image-get-active-layer image))" `
             "gimp-image-crop image $imgwidth $imgheight $xoffset $yoffset" `
             "gimp-context-set-interpolation 2" `
             "gimp-image-scale image 336 268" `
             "file-png-save RUN-NONINTERACTIVE image drawable \`"$dstfolder\\zoom_$i.png\`" \`"$dstfolder\\zoom_$i.png\`" FALSE 9 FALSE FALSE FALSE FALSE FALSE" `
             "gimp-quit 0"
             
    $i++
    $yoffset += 25
    $xoffset += 8*4
    $imgwidth -= 64
    $imgheight -= 51
}

                         
             