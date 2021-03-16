void prepare_eff7(  int *colptr) {

  /* Set color 0 */
  *colptr++ = 0
  *colptr++ = 0;

  long colors[14] = 
        { 0x05fe05, 0x7dfe03, 0xbffe00,  0x7dfe03, 0x05fe05, 0x01fe7d, 0x02ffbf 
	  , 0x01bdfc, 0x017efc, 0x0242fc, 0x017efc, 0x01bdfc, 0x02ffbf, 0x01fe7d };

  int colorr = 0;
  int colorb = 0;
  int colorg = 0;
  int index = 0;
  
  int i,i2,i3,i4;
  for( i=0;i<=276;i++) {
    for( i2=0;i2<=7;i2++) {
	  for( i3=1;1<<i2;i3++){
		index++;
	    for( i4=0;i4<=3;i4++) {
		  if( index & 1<<( i4<<1)) {
		  }
		}
	  }
	}
  }
  
}