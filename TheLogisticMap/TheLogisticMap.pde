float r0 = 0;
float rf = 2;
double r = r0;
int scl = 1;
void setup(){
  size(1500,900);
  background(0);
  stroke(255,150);
  strokeWeight(1);
  textSize(30);
}

void draw(){
  for(int i = 0; i < 100000; i++){
      point(width*(float)(r-r0)/(rf-r0), -700*finalGen()+5*height/6);
      r += 0.00001;
  }
}

double nextGen(double xn){
  return r*xn*(1-xn);
}

float finalGen(){
  double x0 = random(1);
  int k = 500;
  for(int i = 0; i < k; i++){
    x0 = r*nextGen(x0);
  }
  return (float)x0;
}

float finalGenFor4(){
  double x0 = random(1);
  double xn = x0;
  int k = 10;
  for(int i = 0; i < k; i++){
    double ang = Math.asin(Math.pow(xn, 0.5))/PI;
    xn = Math.sin(Math.sin(Math.pow(2,i)*ang*PI));
  }
  return (float)xn;
}
