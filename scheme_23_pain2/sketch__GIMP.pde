int lGmark;
int gimpSetup1o0;
void letsGimp() {
  if(gimpSetup1o0 == 0){
      gimpSetup();}
      gimpDraw();
}




//start value
  float deg = random(0,360);
    float deg2 = deg; 
  float m = 500;
  float n = 500;
    float m_step,n_step;
    int stepValue = 12;
  float rad = radians(deg);
  float SIN = sin(rad);
  float COS = cos(rad);
    
  int o_R = 4;     //the basic radius of gimp
  float o_Size ;   //after the buff/nref of the o_R
  
  color P = color(255);         //the Gimp color
  color Pm = color(255,0,0);  //the user color
  
  
  //others :
  float oneOone;
  int onoff;
  PGraphics pg;
  
void littleThing() {
  deg = random(0,360);
  deg2 = deg; 
  m = (int)random(400,600);
  n = (int)random(400,600);
  stepValue = (int)random(6,18);    
  o_R = round(48 / stepValue) + round(random(-1,1));     //the basic radius of gimp
  linedegStep = random(0,1);
  goulike_PB = (int)random(50,200);       //higher than harder  
  ob_PB = (int)random(200,400);
  notagainJUMP_PB = (int)random(100,300);  //higher than harder
  JUMPvalue = (int)random(100,200);
    //others :
  onoff = 0;
  println();
}
  
void gimpSetup() {
  littleThing();
  //gift();
  Draw_WE = new ArrayList<drawME>();
  if(Draw_WE.size() > 0) {
    for (int i =Draw_WE.size()-1; i >=0; i--) {
      Draw_WE.remove(i);
    }
  }
  //littleThing();
  //gift();
  //frameRate(500);
  //rectMode(CENTER);
  pg.beginDraw();
  pg.background(0);
  pg.endDraw();
  
  //println(deg); 
  drawME newDrawMe = new drawME();
  Draw_WE.add(newDrawMe);
  gimpSetup1o0 = 1;
}

void gimpDraw() {
  pg.beginDraw(); 
  for(int i = 0;i<10;i++){
      walk();
      bigRule();    
      drawSomething();
      modeRender();      
      displayDraw();
  }
  pg.endDraw();    
 // println(Draw_WE.size(),Draw_WE.get(Draw_WE.siz-1e()).sizeDown);
}


void walk() {
  
  //degre proces
  rad = radians(deg);
  int walkCC = 1;
  if(frameCount % 30 == 1) {
    walkCC = (int)random(1,2);
  }
  SIN = pow(sin(rad),walkCC);
  COS = pow(cos(rad),walkCC);
  m_step = (1+noise(deg)*4)*COS/stepValue;
  n_step = (1+noise(deg)*4)*SIN/stepValue;  
   
  oneOone += .0005;
  if(round(noise(oneOone))==1) {
    m += m_step;
    n += n_step;
  }else if(round(noise(oneOone))==0) {
    m -= m_step;
    n -= n_step;
  }

  
}

int probability(int pbMom) {
  int pbKid = 1;
  int PBLITY = 0;
  if(pbKid >= pbMom) {
    PBLITY = 1;
  }else{
    int a = (int)random(0,pbMom);
    if(a == 1) {
      PBLITY = 1;
    }
  }  
  return PBLITY;  // Returns an int of 60, in this case
}

void mousePressed() {
  /*
  //color c = get(mouseX, mouseY);
  //println(c);
  //the clone info settings
  drawMode = (int)random(1,3);
  drawSize = 0;  
  drawCount = 1000;
  drawRemove = (int)(noise(deg)*notagainJUMP_PB)*10;
  for(int i = 0; i<int(random(1,4)) ; i++) {
    drawSize = i+1;
    drawME newDrawMe = new drawME();
    Draw_WE.add(newDrawMe);
  }*/
  //background(255);
  //onoff = 0;
  //println(onoff);
  //setup();
}
int o_R1,o_R2,
    goulike_PB1,goulike_PB2,
    notagainJUMP_PB1,notagainJUMP_PB2,
    ob_PB1,ob_PB2;
 
void gift() {
  deg = random(0,360);
  deg2 = deg; 
  m = (int)random(400,600);
  n = (int)random(400,600);
  linedegStep = random(0,1);
  JUMPvalue = (int)random(100,200);
  println(memoryStage % 5);
  if(memoryStage % 5 == 0){  
    println("aaaa");
    if(lGmark == 1) {
      o_R1 = round(random(2,5));     //the basic radius of gimp 8-2.5
      o_R = o_R1;
      stepValue = round(48 / o_R);
    }else if (lGmark == 2) {
      o_R2 = round(random(10,12));     //the basic radius of gimp 8-2.5
      o_R = o_R2;
      stepValue = round(48 / o_R);
    }
    
  }else if(memoryStage % 5 == 1) {  
    println("bbbb");
    o_R = (nowIam[farmemoryStage-1] == 1) ? o_R2:o_R1;
    stepValue = round(48 / o_R);
    if(lGmark == 1) {
      goulike_PB1 = (int)random(50,250);
      goulike_PB = goulike_PB1;
    }else if (lGmark == 2) {
      goulike_PB2 = (int)random(400,800);
      goulike_PB = goulike_PB2;
    }
    
  }else if(memoryStage % 5 == 2) { 
    println("cccc");
    goulike_PB = (nowIam[farmemoryStage-1] == 1) ? goulike_PB2:goulike_PB1;
    if(lGmark == 1) {
      notagainJUMP_PB1 = (int)random(10,100);  //higher than harder
      notagainJUMP_PB = notagainJUMP_PB1;
    }else if (lGmark == 2) {
      notagainJUMP_PB2 = (int)random(200,300);  //higher than harder
      notagainJUMP_PB = notagainJUMP_PB2;
    }
    
  }else if(memoryStage % 5 == 3) {   
    notagainJUMP_PB = (nowIam[farmemoryStage-1] == 1) ? notagainJUMP_PB2:notagainJUMP_PB1;
    ob_PB = (int)random(200,400);
    if(lGmark == 1) {
      ob_PB = (int)random(100,300);
      ob_PB = ob_PB1;
    }else if (lGmark == 2) {
      ob_PB = (int)random(300,500);
      ob_PB = ob_PB2;
    }
    
  }else if(memoryStage % 5 == 4) {
    ob_PB = (nowIam[farmemoryStage-1] == 1) ? ob_PB2:ob_PB1;
  }
  onoff = 0;
}