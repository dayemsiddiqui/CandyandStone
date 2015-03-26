Display universal;
MainScreen main;
Player p;
Menu menu;
Level lvl;
int stoneSize=25;
void setup() {
 
   menu = new Menu(); // Goto menus constructor for any changes
               
}
void draw() {
   menu.show();
}
void mouseClicked() {
  lvl.click();
  menu.clickEvent();
}

