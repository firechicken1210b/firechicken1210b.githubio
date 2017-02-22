float bm,bn;

int drawCount,drawInfo, drawMode, drawRemove, drawSize;

ArrayList<drawME> Draw_WE;


void drawSomething() {
  //noStroke();
  pg.stroke(P);
  pg.noFill();
  
  //modeRender();
  
  //float the size
  o_Size = o_R *(1+(noise(deg)*2));
  //update the basic me
  Draw_WE.get(0).x=m;
  Draw_WE.get(0).y=n;
  
}

void displayDraw() {
  Draw_WE.get(0).display();
  
  for (int i =Draw_WE.size()-1; i >=1; i--) {
    if(Draw_WE.size() > 1) {
      Draw_WE.get(i).display();
      if(round(noise(oneOone))==1) {
        if(get((int)(Draw_WE.get(i).x + m_step*20),(int)(Draw_WE.get(i).y + n_step*20)) == P) {      
          if(probability(Draw_WE.get(i).removeDown) == 1) {
            Draw_WE.remove(i);
          }
        }else if(Draw_WE.get(i).countDown<0) {
          Draw_WE.remove(i);
        }
      }else if(round(noise(oneOone)) == 0) {
        if(get((int)(Draw_WE.get(i).x - m_step*20),(int)(Draw_WE.get(i).y - n_step*20)) == P) {      
          if(probability(Draw_WE.get(i).removeDown) == 1) {
            Draw_WE.remove(i);
          }
        }else if(Draw_WE.get(i).countDown<0) {
          Draw_WE.remove(i);
        }
      }
    }
  }
}
/*
void threeOfaKind() {  
  bm=m;
  bn=n;
  ellipse((bm-width/2)*cos(radians(60))-(bn-height/2)*sin(radians(60))+width/2,(bm-width/2)*sin(radians(60))+(bn-height/2)*cos(radians(60))+height/2,o_Size,o_Size);
  ellipse((bm-width/2)*cos(radians(30))-(bn-height/2)*sin(radians(30))+width/2,(bm-width/2)*sin(radians(30))+(bn-height/2)*cos(radians(30))+height/2,o_Size,o_Size);
}

void ttest() {
  for(int i=1 ; i<4 ; i++) {
    bm = (m-width/2)*cos(radians(30*i))-(n-height/2)*sin(radians(30*i))+width/2;
    bn = (m-width/2)*sin(radians(30*i))+(n-height/2)*cos(radians(30*i))+height/2;
    drawCount = 20;
    drawME newDrawMe = new drawME();
    Draw_WE.add(newDrawMe);
  }  
}*/

class drawME
{
  float x, y, xl, xk, yl, yk;
  int   countDown, Mode, infoDown, sizeDown, removeDown;
  int coolDM, coolDN;
  int o_value;
  int stryMod, stryLineX, stryLineY;
  drawME()
  {
    //x = Draw_WE.get(Draw_WE.size()).x;
    //y = Draw_WE.get(Draw_WE.size()).y;
    //infoDown = drawInfo;
    countDown = drawCount;
    sizeDown = drawSize;
    Mode = drawMode;
    removeDown = drawRemove;
    coolDM = (int)m;
    coolDN = (int)n;
    
    if(Mode == 1){
      o_value = (int)random(30,100);
    }else if(Mode == 2){
      stryMod = (int)(random(1,4));
      //println(stryMod);
      stryLineX = coolDM*2 -30 +50* sizeDown;
      stryLineY = coolDN*2 -30 +50* sizeDown;
      
    }
  }
  
  void display()
  {
    if(Mode == 0) {
      pg.ellipse(y, x, o_Size, o_Size);
    }else if (Mode == 1){      
      x = Draw_WE.get(0).x + o_value * sizeDown;
      y = Draw_WE.get(0).y + o_value * sizeDown;
      pg.ellipse(y, x, o_Size, o_Size);
      countDown--;
    }else if (Mode == 2){     
      if(stryMod == 1) {
        x = stryLineX - Draw_WE.get(0).x ;
        y = Draw_WE.get(0).y ;
        pg.ellipse(y, x, o_Size, o_Size);
        countDown--;
      }else if (stryMod == 2) {
        x =Draw_WE.get(0).x ;
        y = stryLineY - Draw_WE.get(0).y ;
        pg.ellipse(y, x, o_Size, o_Size);
        countDown--;      
      }else if (stryMod == 3) {
        x = stryLineX - Draw_WE.get(0).x ;
        y = stryLineY - Draw_WE.get(0).y ;
        pg.ellipse(y, x, o_Size, o_Size);
        countDown--;      
      }
    } 
  }  
}

void modeRender() {
  if(probability(1500) == 1) {
    drawMode = (int)random(1,4);
    drawSize = 0;  
    drawCount = 1000;
    drawRemove = (int)(noise(deg)*notagainJUMP_PB)*5;
    for(int i = 0; i<int(random(1,4)) ; i++) {
      drawSize = i+1;
      drawME newDrawMe = new drawME();
      Draw_WE.add(newDrawMe);
    }
  }
}

void keyPressed(){
  if(key == 'Q' || key == 'q'){letsGimp();}  
}