float fov = PI/3.0;
float phase = 1;
  float a;
PImage[] imgs = new PImage[22222222];
float pp ;

int maybeChose;

void setup() {
  size(1440,810,P3D);
  pg = createGraphics(1000, 1000);
  blackLeaves = new ArrayList<blackLeave>();
  backCircles = new ArrayList<backCircle>();
  //fullScreen();


  for(int i=0 ; i<110;i++) {
    backCircle newbackCircle = new backCircle();
    backCircles.add(newbackCircle);
    //ellipse(0,0,i*i,i*i);
  }
  letsGimp();
}


void draw() {
  background(255);
  cameraMotion();
  keykey();
  //translate(722,-700,-1000);

  
  pp = map(sin(a),-1,1,1.01,1.004);
  a +=.02;
  blackLeaveDisplay();
  displayR();
  displayL();
  
  stroke(0);
  strokeWeight(1);
  
  backLine();  
  backCircleDisplay();
  blackLeavesAdd();
  
  loading();
  partySystem();
  backSystem();
 
  //println(load_a);
  //println(" |memoryStage" ,memoryStage ," |party:", partyCheck, "|", nowIam[3],nowIam[2],nowIam[1],nowIam[0], "|", " |backStep", backStep, " |displayAlpha", displayAlpha, " |state", state);
  bodyChose = 0;  
}




void cameraMotion()
{
  //perspecive
  perspective(fov, float(width)/float(height), 
              10, 5000);
  
  //camera position
  float cameraX = width/2;    
  float cameraY = (2000)*sin(phase) + width;
  float cameraZ = (500)*cos(phase);
  camera(cameraX, cameraY, cameraZ,  
         (float)width/2,(float)width/2,0,
         0,1,0);

}


void displayR() {
  pushMatrix();
  translate(722,-700,-1000);
  strokeWeight(1+sin(a));
  //stroke(128,0,0);
    pushMatrix();
    translate(0,0,-200);
    rotateY(-PI/pp); 
    fill(0,60-map(systemAlpha,0,255,0,60));
    noStroke();
    rect(-2840,-200+(1+sin(a))*180,2220+(1+sin(a))*20,330+(1+sin(a))*330);
    popMatrix();
  rotateX(PI/2.0);
  rotateY(-PI/1.04); 
  fill(0,backAlpha-systemAlpha);
  rect(-2600,0+sin(a)*33,2000,2600);
  if(displayAlpha > 0) {
    tint(255, displayAlpha-map(systemAlpha,0,255,0,displayAlpha)-map(backAlpha,255,0,0,displayAlpha));
    //int stageNumber = (int)pow(10,memoryStage)+
    //nowInumber[3]*1000+nowInumber[2]*100+nowInumber[1]*10+nowInumber[0];
    stageNumberCounter();
    //println(stageNumber+(int)pow(10,memoryStage));
    letsGimp();
    image(pg, -2600, 0+sin(a)*33, 2000, 2600);
  }
  popMatrix();
}

void displayL() {
  pushMatrix();
  translate(722,-700,-1000);
  strokeWeight(1+sin(a));
  //stroke(128,0,0);
    pushMatrix();
    translate(0,0,-200);
    rotateY(PI/pp); 
    fill(0,60-map(systemAlpha,0,255,0,60));
    noStroke();
    rect(620,-200+(1+sin(a))*180,2220+(1+sin(a))*20,330+(1+sin(a))*330);
    popMatrix();  
  rotateX(PI/2.0);
  rotateY(PI/1.04); 
  fill(0,backAlpha-systemAlpha);
  rect(600,0+sin(a)*33,2000,2600);
  if(displayAlpha > 0) {
    tint(255, displayAlpha-map(systemAlpha,0,255,0,displayAlpha)-map(backAlpha,255,0,0,displayAlpha));
    //int stageNumber = (int)pow(10,memoryStage)*2+
    //nowInumber[3]*1000+nowInumber[2]*100+nowInumber[1]*10+nowInumber[0];
    stageNumberCounter();
    //println(stageNumber+(int)pow(10,memoryStage)*2);
    image(pg, 600, 0+sin(a)*33, 2000, 2600);
    //println(stageNumber+(int)pow(10,memoryStage)*2);
  }
  popMatrix();
}

int stageNumber;

void stageNumberCounter() {
  stageNumber = 0;
  for(int i =0;i<12;i++) {
    stageNumber += nowIam[i]*pow(10,i);
    //println(nowIam[i] , pow(10,i));
  }
}