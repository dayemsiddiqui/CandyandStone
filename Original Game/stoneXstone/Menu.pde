//This is the menu class
//Menu should have following buttons
class Menu {
  PImage backImg;
  int temp = 0; 

  Menu() {
    //======================Startup===========================/    





    //============================================
    size(640, 460); 
    noStroke(); 
    smooth();


    lvl = new Level();
    lvl.loadImages(); //loads images of themes   
    backImg = loadImage("background.png");
    p = new Player();
  }

  void show() {
    println("MouseX: "+ mouseX);
    println("MouseY: "+ mouseY);
    if(temp == 0){
    image(backImg, 0,0);
    }else
    lvl.startGame();
    
    
}
  
  boolean mouseCheck(float x1, float y1, float x2, float y2) {
    if (mouseX >= x1 && mouseX <= x2 && mouseY>=y1 && mouseY<=y2) {
      println("true");
      return true;
    }
    return false;
  }
  
  void clickEvent(){
  if (mouseCheck(360, 210, 610, 230)){
          temp = 1;
    }
  
  }
}
