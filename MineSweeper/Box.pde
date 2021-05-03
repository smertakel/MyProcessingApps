class Box{
  int iX;
  int iY;
  boolean bomb;
  boolean selected;
  int nb;
  color c = color(255);
  boolean marked;
  Box(int ix, int iy, boolean bomb){
    this.iX = ix;
    this.iY = iy;
    this.bomb = bomb;
    this.selected = false;
  }
  
  void update(){
    for(int x = this.iX-1; x <= this.iX+1; x++){
      for(int y = this.iY-1; y <= this.iY+1; y++){
        if(x == this.iX && y == this.iY){
          continue;
        }
        try{
          if(boxes[x][y].bomb){
            this.nb++;
          }
        }catch(ArrayIndexOutOfBoundsException e){}
      }
    }
  }
  
  void show(){
    fill(this.c);
    noStroke();
    rect(this.iX * xLen+2, this.iY*yLen+2, xLen-4, yLen-4);
    
    if(bomb && selected){
      fill(0);
      ellipse(this.iX * xLen+xLen/2, this.iY*yLen+yLen/2, xLen, yLen);
    } else if(!bomb && selected && this.nb != 0){
      fill(this.nb*255/9,this.nb*255/9,255-(this.nb*255/9));
      textSize(25);
      text(this.nb, this.iX * xLen+xLen/2, this.iY*yLen+yLen/2);
    }
    if(this.marked){
      stroke(255,0,0);
      fill(255,0,0);
      beginShape();
      vertex(this.iX*xLen+xLen/3, this.iY*yLen+yLen/8);
      vertex(this.iX*xLen+xLen/3, this.iY*yLen+yLen/2);
      vertex(this.iX*xLen+2*xLen/3, this.iY*yLen+5*yLen/16);
      endShape(CLOSE);
      stroke(0);
      line(this.iX*xLen+xLen/3, this.iY*yLen+yLen/8, this.iX*xLen+xLen/3, this.iY*yLen+7*yLen/8);
    }
  }

  void select(){
    if(selected){
      return;
    }else if(bomb){
      this.selected = true;
      for(int i = 0; i < xSize; i++){
        for(int j = 0; j < ySize; j++){
          boxes[i][j].selected = true;
          text("GAME OVER", 200,600);
        }
      }
    } else if(this.nb != 0){
      this.c = color(150);
      this.selected = true;
    } else if(this.nb == 0){
      this.selected = true;
      this.c = color(100);
      for(int x = this.iX-1; x <= this.iX+1; x++){
        for(int y = this.iY-1; y <= this.iY+1; y++){
          if(x == this.iX && y == this.iY){
            continue;
          }
          try{
            boxes[x][y].select();
          }catch(ArrayIndexOutOfBoundsException e){}
        }
      }
    }
  }

  void mark(){
    this.marked = !this.marked;
  }

}
