/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/4522*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/*2009
 *created by Cheng Siu Yee
 *
 *~A puzzle liked game
 *~use mouse to play.
 *~when at least two stones are adjacent and with the same color,
 *  click any one of them to kill them all
 *~If more stones being killed in one click,you'll earn more score.
 *~ Win each level if all stones are killed, so please think twice which stone should be killed.
 *~ higher level, more stones. 
 *~if player want to replay the game, click the green stone at the corner
 *~if player want to change the color of the stone, click the 
 *  yellow stone at the corner
 *~if player want to exit the game, click the red stone at the 
 *  corner or just close the window.
 *~Enjoy and have fun!
 */

int NumCols = 3;

int HorSto=32; //no. of stones Horizontally
int VerSto=18; // no. of strones vertically
int szSto=20;  // size of stones and of grid in general
int dieLast=5;
String markText;
int markFlag;
float markX,markY;

int curX,curY,target; //current position of Mouse Pointer
public static int mark,tMark;

color cols[];
color Red=color(236,27,35);
color Yellow=color(255,241,0);
color Green=color(54,179,74);
ArrayList Stones;

int killCount;
int stage;

int maxScore;

PFont myFont;

PImage eye;
PImage eyeD;
PImage eyeC;
PImage eyeL;
PImage eyeR;
PImage eyeT;
PImage eyeB;
PImage eyeLT;
PImage eyeRT;
PImage eyeLB;
PImage eyeRB;
PImage Close;
PImage Change;
PImage Replay;
PImage title;
PImage win;

boolean playFlag,winFlag;

int lv;

void setup() {
  size(640, 460); 
  
  noStroke(); 
  smooth();
 
 tMark=0;

//loading images
eye=loadImage("data/eye.png");
eyeC=loadImage("data/eyeC.png");
eyeD=loadImage("data/eyeD.png");
eyeL=loadImage("data/eyeL.png");
eyeR=loadImage("data/eyeR.png");
eyeT=loadImage("data/eyeT.png");
eyeB=loadImage("data/eyeB.png");
eyeLT=loadImage("data/eyeLT.png");
eyeRT=loadImage("data/eyeRT.png");
eyeLB=loadImage("data/eyeLB.png");
eyeRB=loadImage("data/eyeRB.png");
Close=loadImage("data/close.png");
Change=loadImage("data/change.png");
Replay=loadImage("data/replay.png");
title=loadImage("data/titlepage.png");
win=loadImage("data/win.png");

 imageMode(CORNER);
  ellipseMode(CORNER);
  myFont = createFont("Shardee", 50); 
  textAlign(CENTER,CENTER);
  textFont(myFont);  
  Stones=new ArrayList();
  setColor();
  setStone();
  playFlag=false;
  lv=0;
  winFlag=false;
}

void draw() {
  background(0);
  noStroke();
  if(playFlag){    
    if(winFlag){
      image(win,50,0);      
    }
      curX=((int)(mouseX/szSto));
      curY=((int)(mouseY/szSto));
      target=-1;
      boolean shift=false;
      for(int i= 0;i<Stones.size();i++){
        Stone st = (Stone)Stones.get(i);    
        if(st.death){
           st.display(curX,curY);
         if(st.dieCount++>dieLast){  
          Stones.remove(i); 
          killCount++;
          i=i-1;
         }
        }
        else{      
          if(i!=Stones.size()-1){
            Stone next= (Stone)Stones.get(i+1);
            if(!shift){        
            if(((next.y-st.y)>1)||((next.x-st.x!=0)&&(st.y!=VerSto-1))){
              st.y+=1;
            }
            if((next.x-st.x)>1){
              shift=true;
            }
            }else{
                st.x-=1;        
            }
          }
          else{ 
            if(st.y!=VerSto-1){
            st.y+=1;
            }
            if(shift){
              st.x-=1;
            }
          }
            if((curX==st.x)&&(curY==st.y)){
            target=i;
          }    
          st.display(curX,curY);           
        }          
      }  
      if((markFlag!=0)){
        if(markFlag==dieLast){
          markX=curX*szSto;
          markY=curY*szSto;
        }
        fill(255);
        text(markText,markX,markY);
        markX+=0.1;
        markY-=0.5;
        markFlag--;
      }
      fill(Red);
      ellipse(620,440,20,20);
      fill(Yellow);
      ellipse(600,440,20,20);
      fill(Green);
      ellipse(580,440,20,20); 
      if(((mouseX>620)&&(mouseX<=640))&&((mouseY>440)&&(mouseY<=460))){    
      image(eye,620,440,szSto,szSto);
      image(eyeR,600,440,szSto,szSto);
      image(eyeR,580,440,szSto,szSto);  
      image(Close,580,410,60,30);
      }
      else if(((mouseX>600)&&(mouseX<=620))&&((mouseY>440)&&(mouseY<=460))){    
      image(eye,600,440,szSto,szSto);
      image(eyeL,620,440,szSto,szSto);  
      image(eyeR,580,440,szSto,szSto);  
      image(Change,580,410,60,30);
      }
      else if(((mouseX>580)&&(mouseX<=600))&&((mouseY>440)&&(mouseY<=460))){    
      image(eye,580,440,szSto,szSto);
      image(eyeL,600,440,szSto,szSto);
      image(eyeL,620,440,szSto,szSto);   
      image(Replay,580,410,60,30);
      }
      else {
      image(eyeC,620,440,szSto,szSto);
      image(eyeC,600,440,szSto,szSto);
      image(eyeC,580,440,szSto,szSto);
      }    
      noFill();
      stroke(255);
      strokeWeight(3);  
      rect(curX*szSto,curY*szSto,szSto,szSto);
      line(0,361,width,361);
       fill(200);
      text("Score:",50,400);
       text(tMark,140, 400);
       text("Level",250,400);
       text(lv,340,400);
       
       if(Stones.size()<=0){
         winFlag=true;
       }    
  }
  else{
      image(title,0,0,640,460);
  }
 
}

void setColor(){
  boolean sameCol;
  //NumCol ia int which have existing numbers of different colours
  cols= new color[NumCols];
  for(int i=0; i<NumCols; i++){
    do{
      sameCol=false;
      cols[i]=color((int)random(35)*7,(int)random(35)*7,(int)random(35)*7);
        for(int j=i-1;j>=0;j--){
          if(cols[i]==cols[j]){
            sameCol=true;
            break;
          }
        }
    }while(sameCol==true); //to prevent al three colours from being the same
  } 
}

void setStone(){
// Setting stones at the start of the game.
  for (int i =0;i<HorSto;i++){
    for(int j=0; j<(VerSto+(lv*3));j++){
      Stones.add(new Stone(i,j-VerSto-(lv*3),(int)random(NumCols),szSto,Stones)); 
    }
  }
}

void deleteStone(){
  //for deleting the whole arrayList
    for(int i= 0;i<Stones.size();i++){
      Stones.remove(i);  
      i--;   
    }
}

void replay(){
        tMark=0;
        deleteStone();
        setColor();
        setStone();
}

void mousePressed(){
  if(playFlag){
    if(!winFlag){
      if(target!=-1){
          Stone st = (Stone)Stones.get(target);
          if(mark==0){
            int tempMark=tMark;
            if(st.checkSame(target)){
              markText= ""+(tMark-tempMark);
              markFlag=dieLast;
              mark=0;
    
            } 
          }
      }
      else{
        if(((mouseX>620)&&(mouseX<=640))&&((mouseY>440)&&(mouseY<=460))){ //Exit. will not applied in a applet
        deleteStone();
        exit();
        }
        else if(((mouseX>600)&&(mouseX<=620))&&((mouseY>440)&&(mouseY<=460))){    
        setColor();
        }
        else if(((mouseX>580)&&(mouseX<=600))&&((mouseY>440)&&(mouseY<=460))){    
          lv=0;
          tMark=0;
          replay();
        }    
      }
    }else{
      if(lv<5){
        lv++;
      }
      winFlag=false;
      replay();
    }
  }
  else{
    playFlag=true;
  }
}

void keyPressed(){
  if((key=='c')||(key=='C')){
  setColor();
  }
  if((keyCode==RIGHT)){
    if(NumCols<10){
    NumCols++;    
    tMark=0;
    deleteStone();
    setColor();
    setStone();
    }
  }
  if((keyCode==LEFT)){
    if(NumCols>3){
    NumCols--;
    tMark=0;
    deleteStone();
    setColor();
    setStone();
    }
  }
   if((keyCode==UP)&&(szSto==20)){
         tMark=0;
    deleteStone();
    setColor();    
     HorSto=64;
     VerSto=36;
     szSto=10;
     dieLast=2;
     setStone();
   }
   if((keyCode==DOWN)&&(szSto==10)){
         tMark=0;
    deleteStone();
    setColor();    
    HorSto=32;
    VerSto=18;
    szSto=20; 
    dieLast=5;
     setStone();
   }
    
}


