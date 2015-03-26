class MainScreen implements Display{

PImage backImg,extNorm,hsNorm,ldNorm,stNorm,ext,hs,ld,st;

MainScreen(){
 backImg = loadImage("background.png");
 extNorm = loadImage("exit_normal.png");
 hsNorm = loadImage("highscore_normal.png");
 ldNorm = loadImage("loading_normal.png");
 stNorm = loadImage("start_normal.png");
 st = loadImage("start.png");
 ld = loadImage("Loading.png");
 hs = loadImage("hover.png");
 ext = loadImage("exit.png");
}

void display(){
 image(stNorm, 250,50);
 image(ldNorm, 250,110);
 image(hsNorm, 250,170);
 image(extNorm, 250,230);
 
 //Display Hover state
 if(menu.mouseCheck(250,50,395,100)){
 image(st, 250,50);
 }
 if(menu.mouseCheck(250,110,395,160)){
 image(ld, 250,110);
 }
 if(menu.mouseCheck(250,170,395,220)){
 image(hs, 250,170);
 }
 if(menu.mouseCheck(250,230,395,270)){
 image(ext, 250,230);
 }
 
}


}
