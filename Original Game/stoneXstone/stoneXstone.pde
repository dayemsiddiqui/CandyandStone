Player p = new Player();
Menu menu;
color cols[];
ArrayList Stones;
PImage eye;
PImage win;
Level lvl;
int stoneSize=18;
void setup() {
  size(640, 460); 
  noStroke(); 
  smooth();
  eye=loadImage("data/eye.png");
  Stones=new ArrayList();
  lvl = new Level();
   menu = new Menu();
}
void draw() {
  
  
  menu.show();
}
void mousePressed() {
  lvl.click();
}

