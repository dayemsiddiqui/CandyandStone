//This is the menu class
//Menu should have following buttons



class Menu{
      PImage backImg;
      int temp = 0; 

    Menu(){
    backImg = loadImage("background.png");
    }

  void show(){
    
    if(mousePressed){
    temp=1;
    }
    
    if(temp == 0)
    image(backImg,0,0);
    else{
    lvl.startGame();
    }
    
  }


}
