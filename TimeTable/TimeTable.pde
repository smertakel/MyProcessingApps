PVector[] points;
int pNum = 300;
float times = 1;
void setup(){
  size(900, 900);
  points = new PVector[pNum];
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(5);
  translate(width/2, height/2);
  float ang = 0;
  for(int i = 0; i < points.length; i++){
    points[i] = (new PVector(-400, 0)).rotate(ang);
    ang += TWO_PI/points.length;
  }
  
  for(int i = 0; i < points.length; i++){
    point(points[i].x, points[i].y);
  }
  strokeWeight(2);
  for(int i = 0; i < points.length; i++){
    line(points[i].x, points[i].y, points[(int)((float)i*times)%points.length].x, points[(int)((float)i*times)%points.length].y);
  }
  times += 0.003;
  text("n = " + times, -width/2 + 10, -height/2 + 20);
}

void mouseClicked(){
  times++;
}
