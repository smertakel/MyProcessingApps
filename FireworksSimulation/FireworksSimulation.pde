ArrayList<Firework> works = new ArrayList<Firework>();
PVector gravity;
void setup(){
  size(1500,750);
  gravity = new PVector(0, 0.018);
  works.add(new Firework(new PVector(width/2, height), color(random(50,255), random(50,255), random(50,255))));
}

void draw(){
  println(works.size());
  background(0);
  if(random(1) < 0.05){
    works.add(new Firework(new PVector(random(width), height), color(random(50,255), random(50,255), random(50,255))));
  }
  
  for(int i = works.size()-1; i >= 0 ; i--){
    works.get(i).show();
    works.get(i).update();
    try{
      if(works.get(i).particles[0].alpha < 0){
        works.remove(i);
      }
    } catch (NullPointerException e){}
  }
}
