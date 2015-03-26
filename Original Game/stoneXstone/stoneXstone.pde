int score;
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
  lvl.loadImages(); //loads images of themes
}
void draw() {
  lvl.startGame();
}
void mousePressed() {
  lvl.click();
}

