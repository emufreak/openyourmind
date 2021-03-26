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

function Convert-BPL($nr) {

    #Build Insturctions
    $arglist = New-Object -TypeName "System.Collections.ArrayList"
    $arglist.Add("$dstfolder\\zoom_$nr.png")
    $arglist.Add("$dstfolder\\..\\raw\\zoom_$nr")
    $arglist.Add("-F=5")
     
    $arglist.Add($batch)       

    $srcfolder = "C:\Users\uersu\Downloads\WinUAEDemoToolchain5\ToolChain"        
    $binary = ".\kingcon.exe"
    cd $srcfolder    
    #Start-Process -FilePath $binary -ArgumentList $arglist -NoNewWindow -Wait
    & $binary $arglist | Out-Null
    #echo $arglist

} #Run-Gimpactions


$width = 1009
$height = 806
$xoffset = 0
$yoffset = 0
$i = 0

$dstfolder = "C:\\Users\\uersu\\Documents\\GitData\\voidanniversary\\Zoom\\Scripts" 

while($i -lt 18) {
    $iwidth = [math]::Round($width)
    $iheight = [math]::Round($height)

    $ifmt = "{0:D2}" -f $i
    Run-Gimpactions `
             "define image (car (file-png-load RUN-NONINTERACTIVE `
                 \`"$dstfolder\\Zoompic.png\`" \`"$dstfolder\\Zoompic.png\`"))" `
             "define drawable (car (gimp-image-get-active-layer image))" `
             "gimp-image-crop image $iwidth $iheight $xoffset $yoffset" `
             "gimp-context-set-interpolation 2" `
             "gimp-image-scale image 336 268" `
             "file-png-save RUN-NONINTERACTIVE image drawable \`"$dstfolder\\zoom_$ifmt.png\`" \`"$dstfolder\\zoom_$ifmt.png\`" FALSE 9 FALSE FALSE FALSE FALSE FALSE" `
             "file-raw-save RUN-NONINTERACTIVE image drawable \`"$dstfolder\\..\\raw\\zoom_$ifmt.raw\`" \`"$dstfolder\\..\\raw\\zoom_$ifmt.raw\`"" `
             "gimp-quit 0"
      
             
    $i++
    $width = $width / 67 * 64
    $height = $height / 67 * 64
    $xoffset = [math]::Round( (1009 - $width) / 2)
    $yoffset = [math]::Round( (806 - $height) / 2)
    
}

$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup("Wait till Gimp is finished then press ok", 0, "Script Paused", 0)

$content = 0;
for($i=0;$i -lt 18;$i++) { 
    $ifmt = "{0:D2}" -f $i 
    Convert-BPL $ifmt
    #if($i -eq 0) {
    #    Get-Content "$dstfolder\\..\\raw\\zoom_$i.BPL" | Set-Content "$dstfolder\\..\\raw\\zoom.bpl"
    #} else {
     #   Get-Content "$dstfolder\\..\\raw\\zoom.bpl","$dstfolder\\..\\raw\\zoom_$i.BPL" | Set-Content "$dstfolder\\..\\raw\\zoom.bpl"
    #}
}

Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.BPL -rec| Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom.raw" -Encoding Byte

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
 