﻿function Run-Gimpactions {

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
    .\kingcon.exe $arglist | Out-Null
    
} #Run-Gimpactions

function Convert-LZ4($nr) {

    #Build Insturctions
    $arglist = New-Object -TypeName "System.Collections.ArrayList"
    $arglist.Add("zoom_$nr.BPL")
    $arglist.Add("zoom_$nr.lz4")
     
    $arglist.Add($batch)       

    $srcfolder = "C:\\Users\\uersu\\Documents\\GitData\\voidanniversary\\Zoom\\Scripts"
    $binary = "lz4.exe"
    cd $srcfolder    
    #Start-Process -FilePath $binary -ArgumentList $arglist -NoNewWindow -Wait
    $string = "cd C:\Users\uersu\Documents\GitData\voidanniversary\Zoom\raw & lz4 zoom_$nr.BPL zoom_$nr.lz4"   
    cd C:\Users\uersu\Documents\GitData\voidanniversary\Zoom\raw
    lz4 --best --favor-decSpeed -f $arglist
        
} #Run-Gimpactions

function Create-Images() {
    $width = 8400
$height = 6800
$xoffset = 0
$yoffset = 0
$i = 0

while($i -lt 88) {
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
    
    if($i -eq 5 -or $i -eq 10  -or $i -eq 15 -or $i -eq 20 -or $i -eq 25 -or $i -eq 30 -or $i -eq 35 -or $i -eq 40 -or $i -eq 45 -or $i -eq 50 -or $i -eq 55 -or $i -eq 60 -or $i -eq 65 -or $i -eq 70 -or $i -eq 75 -or $i -eq 80 -or $i -eq 85) {
        $Shell = New-Object -ComObject "WScript.Shell"
        $Button = $Shell.Popup("Wait till Gimp is finished then press ok", 0, "Script Paused", 0)
    }
             
    $i++
    $width = $width / 67 * 64
    $height = $height / 67 * 64
    $xoffset = [math]::Round( (8400 - $width) / 2)
    $yoffset = [math]::Round( (6800 - $height) / 2)
    
}

$Shell = New-Object -ComObject "WScript.Shell"
$Button = $Shell.Popup("Wait till Gimp is finished then press ok", 0, "Script Paused", 0)
        
} #Run-Gimpactions

function Convert-BPL-All() {
    $content = 0;
    for($i=0;$i -lt 88;$i++) { 
    $ifmt = "{0:D2}" -f $i 
    Convert-BPL $ifmt
    }
}

function Convert-Lz4-All() {
    $content = 0;
    for($i=0;$i -lt 88;$i++) { 
        $ifmt = "{0:D2}" -f $i 
        Convert-LZ4 $ifmt
    }
    
    $content = 0;
    $result = "";
    $delimiter = ""
    cd $dstfolder\..\raw
    for($i=0;$i -lt 88;$i++) { 
        $ifmt = "{0:D2}" -f $i 
        $tmp = (Get-Item zoom_$ifmt.lz4).Length
        $result = "$result$delimiter$tmp"
        $delimiter = ","
    }
    echo $result
}

function CreateMemBanks() {
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.lz4 | Where-Object { $_.Name -Match 'zoom_[0][0|1].*.lz4' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_chip.raw" -Encoding Byte
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.lz4 | Where-Object { $_.Name -Match 'zoom_[0][2|3|4|5|6|7|8|9].*.lz4' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_any_1.raw" -Encoding Byte
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.lz4 | Where-Object { $_.Name -Match 'zoom_[1].*.lz4' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_any_2.raw" -Encoding Byte
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.lz4 | Where-Object { $_.Name -Match 'zoom_[2][0|1|2|3|4|5|6].*.lz4' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_any_3.raw" -Encoding Byte
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.lz4 | Where-Object { $_.Name -Match 'zoom_[2][7|8|9].*.lz4' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_fast_1.raw" -Encoding Byte
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.lz4 | Where-Object { $_.Name -Match 'zoom_[3|4|5|6|7|8].*.lz4' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_fast_2.raw" -Encoding Byte

    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.raw | Where-Object { $_.Name -Match 'zoom_any_.*.raw' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_any.raw" -Encoding Byte
    Get-ChildItem "$dstfolder\\..\\raw\\*" -include *.raw | Where-Object { $_.Name -Match 'zoom_fast_.*.raw' } | Get-Content -Encoding Byte | Set-Content "$dstfolder\\..\\raw\\zoom_fast.raw" -Encoding Byte

    $paletteraw = [System.IO.File]::ReadAllBytes("$dstfolder\..\raw\zoom_00.raw.pal")
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
}
$dstfolder = "C:\\Users\\uersu\\Documents\\GitData\\voidanniversary\\Zoom\\Scripts" 



                         
#$test2 =  [Convert]::tobyte($test[15])
#Get-Content -Raw "C:\Users\uersu\Documents\GitData\
 