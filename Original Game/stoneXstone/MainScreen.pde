class MainScreen implements Display{

PImage backImg;

MainScreen(){
 backImg = loadImage("background.png");
}

void display(){
 image(backImg, 0,0);
}


}
