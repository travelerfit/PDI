PImage ima;

void setup(){
  size(640,240);
  ima = loadImage("imagen.jpg");
}

void draw(){
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
      int locbw = (i+320)+j*width;
      pixels[locbw] = color( (r+g+b)/3);      
      
    }
    updatePixels();
  
}

