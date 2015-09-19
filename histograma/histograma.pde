PImage ima;
float[] histograma = new float[255];


  size(640,240);
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
    updatePixels();
    
    for( int i = 0; i< 255; i++)
    {
      
      println( histograma[i] );
      line(i+320, 240, i+320, int(histograma[i]) );
    }
