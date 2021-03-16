FDOPOSX equ 4
FDOPOSY equ 304
FDOPOSXDET equ 604
FDOPOSYDET equ 904
FDOBLSIZE equ 1204
FRMSIZE equ 1504

<?php
  
  function calcposx(  $size) {
	return floor( ( 160 - floor( $size/ 2)) / $size + 0.999);
  }

  function calcposy(  $size) {
	return floor( ( 128 - floor( $size / 2)) / $size + 0.999);
  }
  
  $posxcnt = 34;
  $posycnt = 30;
  $frames = 150;
  $multfactor = 1.023373891997;
  //$multfactor = 1.005605;
  $layfactor = pow($multfactor,$frames);
  $size = 10;
  
  for($i=0;$i<1;$i++) {
?>

EF1_PATTERNDATA<?php echo($i); ?>: dc.l PTR_INVADERS_DATA
EF1_POSX<?php echo($i); ?>: <?php
   
    $lwcount = 0;
	$sizeuse = $size;
	
    for($i2=0;$i2<$frames;$i2++) {
	  $sizeuseint = floor($sizeuse);
	  $posx = calcposx( $sizeuseint);
	  if($lwcount == 0) 
	    echo("\n  dc.w ");
	  else
		echo(",");
	
	  echo( $posxcnt - $posx);
	  $sizeuse *= $multfactor;
	  if(++$lwcount == 10) 
	    $lwcount = 0;
    }
?>

EF1_POSY<?php echo($i); ?>: <?php
   
    $lwcount = 0;
	$sizeuse = $size;
	
    for($i2=0;$i2<$frames;$i2++) {
	  $sizeuseint = floor( $sizeuse);
	  $posy = calcposy( $sizeuseint);
	  if($lwcount == 0) 
	    echo("\n  dc.w ");
	  else
		echo(",");
	
	  echo( floor( $posycnt - $posy));
	  $sizeuse *= $multfactor;
	  if(++$lwcount == 10) 
	    $lwcount = 0;
    }
?>

EF1_POSXDET<?php echo($i); ?>: <?php
   
    $lwcount = 0;
	$sizeuse = $size;
    for($i2=0;$i2<$frames;$i2++) {
	  $sizeuseint = floor( $sizeuse);
      $posx = calcposx( $sizeuseint);
	  $posxdet = $sizeuseint - 
	      ( 160 - ($posx - 1) * $sizeuseint - floor( $sizeuseint / 2));
	  if($lwcount == 0) 
	    echo("\n  dc.w ");
	  else
		echo(",");
	
	  echo( floor( $posxdet));
	  $sizeuse *= $multfactor;
	  if(++$lwcount == 10) 
	    $lwcount = 0;
    }
?>

EF1_POSYDET<?php echo($i); ?>: <?php
   
    $lwcount = 0;
	$sizeuse = $size;
    for($i2=0;$i2<$frames;$i2++) {
	  $sizeuseint = floor( $sizeuse);
      $posy = calcposy( $sizeuseint);
	  $posydet = $sizeuse - 
	      ( 128 - ($posy - 1) * $sizeuseint - floor( $sizeuseint / 2));
	  if($lwcount == 0) 
	    echo("\n  dc.w ");
	  else
		echo(",");
	
	  echo( floor( $posydet));
	  $sizeuse *= $multfactor;
	  if(++$lwcount == 10) 
	    $lwcount = 0;
    }
?>

EF1_SIZE<?php echo($i); ?>: <?php
    $lwcount = 0;
	$sizeuse = $size;
    for($i2=0;$i2<$frames;$i2++) {
	  if($lwcount == 0) 
	    echo("\n  dc.w ");
	  else
		echo(",");
	
	  echo( floor( $sizeuse));
	  $sizeuse *= $multfactor;
	  if(++$lwcount == 10) 
	    $lwcount = 0;
    }

	$size *= $layfactor;
  }
?>

EF1_MOVEX: 
  dc.w 1,-1,0,0,1,-1,0,0

EF1_MOVEY: 
  dc.w 0,0,1,-1,0,0,1,-1