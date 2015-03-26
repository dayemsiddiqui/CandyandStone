class Stone{
  int c;
  int x,y;
  int sz;
  ArrayList other;
  boolean death;
  Stone(int _x, int _y,int _c, int _sz, ArrayList _other){
    x=_x;
    y=_y;
    c=_c;
    sz=_sz;
    other=_other;
    death=false;
 }
  
void display(){
  
  
  fill(color(cols[c]));
  //translate(x*sz, y*sz);

  ellipse(x*sz,y*sz,sz,sz);


  image(eye,x*sz,y*sz,stoneSize,stoneSize);
  
  
  
} 



boolean checkSame(int id){
  boolean same=false;
  for(int i= other.size()-1;i>=0;i--){
          Stone oth=(Stone) other.get(i);
    if((i!=id)&&(!oth.death)){
      if((c==oth.c)&&(((abs(x-oth.x)==1)&&(y==oth.y))||((abs(y-oth.y)==1)&&(x==oth.x)))){
        death=true;   
        oth.death=true;
        same=true;
          score+=1;        
              
        oth.checkSame(i);
      }
    }
  }
return same;
}


}
