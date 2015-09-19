PImage ima;
int start;

void setup(){
  size(320,240);
  ima = loadImage("imagen.jpg");
  start = millis();
}

void draw(){
  int fina = millis();
  int intervalo = fina - start;
  
  if ( intervalo < 100 )
    image(ima,0,0);
  
  else if ( intervalo > 100 && intervalo < 200){ 
    loadPixels();  
    ima.loadPixels();
    for(int i= 0; i< ima.width; i++)
      for(int j = 0; j < ima.height; j++){
        int loc = i + j*ima.width;
        float r = red(ima.pixels[loc]);
        float g = green(ima.pixels[loc]);
        float b = blue(ima.pixels[loc]);
        pixels[loc] = color( 255 - ( ( r+g+b)/3));
      }
    updatePixels();
  }
 else
  start = millis(); 
}

