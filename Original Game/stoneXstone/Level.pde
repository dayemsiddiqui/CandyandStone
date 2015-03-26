class Level {
  int xdimension=32;
  int ydimension=20;
  int NumCols = 3;
  int curX, curY, target;
  int lv=0; 
  boolean playFlag, winFlag;
  PImage[][] pic = new PImage[2][4];
  int change = 0; //for cycling through the theme;
  Level() {

    imageMode(CORNER);
    ellipseMode(CORNER);
    setColor();
    setStone();
    playFlag=false;
    winFlag=false;
  }
  void loadImages() {
    String k=""; //holds folder name to path
    //the loops fills the 2d array with images
    for (int i = 0; i < pic.length; i++) {
      if (i == 0) k = "sweet food";
      if (i == 1) k = "animals vec";
      for (int j =0; j< pic[i].length; j++) {
        pic[i][j] = loadImage("data/"+k+"/"+(j+1)+".png");
        println(i +"  " +j);
      }
    }
  }
  void setTheme() {
    change++;
    if (change>1){ //number is the maximum themes - 1 
      change=0;
    }
    for (int i= 0; i<Stones.size (); i++) {
      Stone st = (Stone)Stones.get(i);    
      st.setTheme(change);
    }
  }

  void startGame() {

    background(0);
    noStroke();
    if (playFlag) {    
      curX=((int)(mouseX/stoneSize));
      curY=((int)(mouseY/stoneSize));
      target=-1;
      boolean shift=false;
      for (int i= 0; i<Stones.size (); i++) {
        Stone st = (Stone)Stones.get(i);    
        if (st.death) {

          Stones.remove(i); 
          i--;
        } else {      
          if (i!=Stones.size()-1) {
            Stone next= (Stone)Stones.get(i+1);
            if (!shift) {        
              if (((next.y-st.y)>1)||((next.x-st.x!=0)&&(st.y!=ydimension-1))) {
                st.y+=1;
              }
              if ((next.x-st.x)>1) {
                shift=true;
              }
            } else {
              st.x-=1;
            }
          } else { 
            if (st.y!=ydimension-1) {
              st.y+=1;
            }
            if (shift) {
              st.x-=1;
            }
          }
          if ((curX==st.x)&&(curY==st.y)) {
            target=i;
          }    
          st.display();
        }
      }  
      fill(255);
      noFill();
      stroke(255);
      strokeWeight(3);  
      rect(curX*stoneSize, curY*stoneSize, stoneSize, stoneSize);
      line(0, 361, width, 361);
      fill(200);
      text("Score:", 50, 400);
      text(p.score, 140, 400);
      text("Level", 250, 400);
      text(lv, 340, 400);

      if (Stones.size()<=0) {
        winFlag=true;
      }
    } else {
      text("Click anywhere to continue", width/2, height/2);
    }
  }


  void setStone() {
    for (int i =0; i<xdimension; i++) {
      for (int j=0; j< (ydimension); j++) {
        Stones.add(new Stone(i, j-ydimension, (int)random(NumCols), stoneSize, Stones));
      }
    }
  }

  void deleteStone() {
    for (int i= 0; i<Stones.size (); i++) {
      Stones.remove(i);  
      i--;
    }
  }

  void replay() {
    deleteStone();
    setColor();
    setStone();
  }

  void setColor() {
    boolean sameCol;
    cols= new color[NumCols];
    for (int i=0; i<NumCols; i++) {
      do {
        sameCol=false;
        cols[i]=color((int)random(255), (int)random(255), (int)random(255));
        for (int j=i-1; j>=0; j--) {
          if (cols[i]==cols[j]) {
            sameCol=true;
            break;
          }
        }
      }
      while (sameCol==true);
    }
  }

  void click() {
    setTheme();
    if (playFlag) {
      if (!winFlag) {
        if (target != -1) {
          Stone st = (Stone)Stones.get(target);
          st.checkSame(target);
        }
      } else {
        if (lv<5) {
          lv++;
        }
        winFlag=false;
        replay();
      }
    } else {
      playFlag=true;
    }
  }
}

