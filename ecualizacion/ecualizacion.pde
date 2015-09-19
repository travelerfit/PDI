PImage ima;
float[] histograma = new float[255];
float[] fdc = new float[255];

  size(800,267);
  ima = loadImage("imagen.jpg");



  background(255);
  image(ima,0,0);  
  loadPixels();  
  ima.loadPixels();
  for(int i= 0; i< ima.width; i++)
    for(int j = 0; j < ima.height; j++)
    {
      int loc = i+ j*ima.width;
      float r = red(ima.pixels[loc]);
      float g = green(ima.pixels[loc]);
      float b = blue(ima.pixels[loc]);
      int locbw = i+j*width;
      pixels[locbw] = color( (r+g+b)/3 ); 
      histograma[  int( (r+g+b)/3 )   ]++; 
      
      
    }    
    
    fdc[0] = histograma[0];
    float fdcmin = fdc[0];
    for( int i = 1; i< 255; i++)
    {
      fdc[ i ] = fdc[i-1]+histograma[i];
      if ( fdc[i]< fdcmin)
        fdcmin = fdc[i];
    }
    
   
    
    for(int i= 0; i< ima.width; i++)
      for(int j = 0; j < ima.height; j++)
      {
        int loc = i+j*width;
        int locderecha = (i+400)+j*width;
        float pixel = blue( pixels[loc]);
        float eqpixel = int( (fdc[int(pixel) ] - fdcmin)/((width/2*height)-fdcmin)*255);
        pixels[locderecha] = color(eqpixel);     
      }    
    updatePixels();
