class Particle{
  PVector loc;
  PVector vel;
  int alpha;
  color c;
  
  Particle(PVector l, PVector v, color c){
    loc = new PVector(l.x, l.y);
    vel = new PVector(v.x, v.y);
    alpha = 255;
    this.c = c;
  }
  
  void show(){
    strokeWeight(4);
    stroke(c, alpha);
    point(loc.x, loc.y);
    alpha-=3;
  }
  
  void update(){
    loc.add(vel);
    vel.add(gravity);
  }
}
