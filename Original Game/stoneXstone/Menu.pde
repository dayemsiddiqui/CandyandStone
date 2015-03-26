//This is the menu class
//Menu should have following buttons
class Menu {
  
  int temp = 0; 

  Menu() {
    //======================Startup===========================/    
    size(640, 460); 
    noStroke(); 
    smooth();
    lvl = new Level();
    main = new MainScreen();
    universal = main;
    lvl.loadImages(); //loads images of themes   
     p = new Player();
     //============================================
  }

  void show() {
    println("MouseX: "+ mouseX);
    println("MouseY: "+ mouseY);
  
    universal.display();
    
    
}
 
 //This function checks that which mouse was clicked in a specified region or not
  
  boolean mouseCheck(float x1, float y1, float x2, float y2) {
    if (mouseX >= x1 && mouseX <= x2 && mouseY>=y1 && mouseY<=y2) {
      println("true");
      return true;
    }
    return false;
  }
  
  
// This function determines the button which is clicked and dynamically displays the appropriate screen
  void clickEvent(){
  if (mouseCheck(360, 210, 610, 230)){
          temp = 1;
    }
    
    
  //=========================//  
    if(temp == 0){
    universal = main;   
    }
    if(temp == 1){
    universal = lvl;
    }
    
    //======================//
  
  }
}
