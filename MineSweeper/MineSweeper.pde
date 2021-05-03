int xSize = 25, ySize = 25;
int xLen, yLen;
Box[][] boxes;

void setup(){
  size(1000,1000);
  xLen = width/xSize;
  yLen = width/ySize;
  boxes = new Box[xSize][ySize];
  for(int i = 0; i < xSize; i++){
    for(int j = 0; j < ySize; j++){
      boolean b = false;
      if(random(1) < 0.1){
        b = true;
      }
      boxes[i][j] = new Box(i,j,b);
    }
  }
  for(int i = 0; i < xSize; i++){
    for(int j = 0; j < ySize; j++){
      boxes[i][j].update();
    }
  }
}

void draw(){
  background(51);
  for(int i = 0; i < xSize; i++){
    for(int j = 0; j < ySize; j++){
      boxes[i][j].show();
    }
  }
  
}

void keyPressed(){
  if(keyCode == 32){
    int x = mouseX / xLen;
    int y = mouseY / yLen;
    boxes[x][y].mark();
  }
}


void mousePressed(){
  int x = mouseX / xLen;
  int y = mouseY / yLen;
  boxes[x][y].select();
}
