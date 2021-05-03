double scaleX1 = -2, scaleX2 = 2;
double scaleY1 = -2, scaleY2 = 2;

void setup(){
  size(400, 400);
  colorMode(HSB);
}

void draw(){
  
  pixelDensity(1);
  Complex com;
  loadPixels();
  for(int y = 0; y < height; y++){
    for(int x = 0; x < width; x++){
      com = new Complex(scaleX1 + x * (scaleX2 - scaleX1)/width, scaleY1 + y * (scaleY2 - scaleY1)/height);
      //println(com.real, com.imag);
      /*if(com.inTheSet())
        pixels[x+y*width] = color(255);
      else
        pixels[x+y*width] = color(0);*/
      //pixels[x+y*width] = com.col();
      int k = com.inTheSet();
      if(k == -1){
        pixels[x+y*width] = color(0);
      } else {
        pixels[x+y*width] = color(k,255,255);
      }
    }
  }
  updatePixels();
  fill(255,255,0);
  textSize(30);
  text((scaleX2-scaleX1)+"", 10,30);
}
void keyPressed(){
  println(scaleX1,scaleX2,scaleY1,scaleY2);
  
  if(37 == keyCode){
    double k = (scaleX2-scaleX1)/50.0;
    scaleX2 += k;
    scaleX1 += k;
  } else if(39 == keyCode){
    double k = (scaleX2-scaleX1)/50.0;
    scaleX2 -= k;
    scaleX1 -= k;
  }
  if(38 == keyCode){
    double k = (scaleY2-scaleY1)/50.0;
    scaleY2 += k;
    scaleY1 += k;
  } else if(40 == keyCode){
    double k = (scaleY2-scaleY1)/50.0;
    scaleY2 -= k;
    scaleY1 -= k;
  }
  
  if(90 == keyCode){
    double k = scaleX2 - scaleX1;
    double ave = (scaleX2 + scaleX1)/2.0;
    k *= 1.1;
    scaleX2 = ave + k/2.0;
    scaleX1 = ave - k/2.0;
    k = scaleY2 - scaleY1;
    k *= 1.1;
    ave = (scaleY2 + scaleY1)/2.0;
    scaleY2 = ave + k/2.0;
    scaleY1 = ave - k/2.0;
  } else if(65 == keyCode){
    double k = scaleX2 - scaleX1;
    double ave = (scaleX2 + scaleX1)/2.0;
    k *= 0.9;
    scaleX2 = ave + k/2.0;
    scaleX1 = ave - k/2.0;
    k = scaleY2 - scaleY1;
    k *= 0.9;
    ave = (scaleY2 + scaleY1)/2.0;
    scaleY2 = ave + k/2.0;
    scaleY1 = ave - k/2.0;
  }
}
