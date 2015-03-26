Player p = new Player();
Menu menu;
color cols[];
ArrayList Stones;
PImage eye;
PImage win;
Level lvl;
int stoneSize=25;
void setup() {
  size(640, 460); 
  noStroke(); 
  smooth();
  eye=loadImage("data/eye.png");
  Stones=new ArrayList();
  lvl = new Level();
<<<<<<< HEAD
  lvl.loadImages(); //loads images of themes
=======
   menu = new Menu();
>>>>>>> origin/master
}
void draw() {
  
  
  menu.show();
}
void mousePressed() {
  lvl.click();
}

