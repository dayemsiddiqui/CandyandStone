//This is the menu class
//Menu should have following buttons
class Menu{
      PImage backImg;
      int temp = 0; 

  Menu(){
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
