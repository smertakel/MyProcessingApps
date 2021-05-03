class Firework{
  Particle[] particles;
  PVector loc;
  PVector vel;
  boolean bang = false;
  color c;
  Firework(PVector l, color c){
    loc = new PVector(l.x, l.y);
    vel = new PVector(0, -random(3,5));
    this.c = c;
    particles = new Particle[100];
  }
  
  void show(){
    if(bang){
      for(int i = 0; i < particles.length; i++){
        particles[i].show();
        
        particles[i].update();
      }
    } else {
      strokeWeight(7);
      stroke(c);
      point(loc.x, loc.y);
    }
  }
  
  void update(){
    if(!bang){
      loc.add(vel);
      vel.add(gravity);
      if(vel.y > 0){
        bang();
        bang = true;
      }
    }
  }
  
  void bang(){
    for(int i = 0; i < particles.length; i++){
      float random_angle = random(0, TWO_PI);
      float random_vel = random(0,2);
      particles[i] = new Particle(loc, (new PVector(0, random_vel).rotate(random_angle)), c);
    }
  }
}
