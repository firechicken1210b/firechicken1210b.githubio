ArrayList<backCircle> backCircles;
ArrayList<blackLeave> blackLeaves;


void backLine() {  
  pushMatrix();
  translate(722,-700,-1000);  
  for(int i=0; i<35; i++) {
    line(-5200,-1000+i*i*2.5,5200,-1000+i*i*2.5);
  }  
  popMatrix();
}


class backCircle
{
  float x,y;
  int   countDown;
  float r = .1;
  
  backCircle()
  {
    x = 0;
    y = 0;
    if(frameCount < 100){r = pow(backCircles.size()+1,2);}
    countDown = 100;
  }
  
  void display() {
    pushMatrix();
    translate(722,-1770,-1000);
    noFill();
    stroke(0);
    strokeWeight(1);
    rotateX(PI/2.0);
    ellipse(x,y,r,r);

    r+= r*2/8000;
    y+= r/8000;
    popMatrix();
  }
}

void backCircleDisplay() {
  for (int i = backCircles.size()-1; i >=0; i--)
  {    
    backCircles.get(i).display();
    if(backCircles.get(i).r>110*110)
    {
      backCircles.remove(i);
      backCircle newbackCircle = new backCircle();
      backCircles.add(newbackCircle);
    }
  }
}



class blackLeave
{
  float x,y;
  int   countDown;
  float r = .1;
  float a,aa;
  float outA;
  float av,aav;
  float mode = random(-1,1);
  
  blackLeave()
  {
    if(mode > 0){
        if(random(-1,1) > 0){
          x = random(-2600,-600);
          y = 2560 + sin(a)*33 ;    
        }else {
          x = -600;
          y = random(0,2600) + sin(a)*33 ;
        }
    }else {
      if(random(-1,1) > 0){
        x = random(600,2600)  ;
        y = 2560+ sin(a)*33;    
      }else {
        x = 2600;
        y = random(00,2600) + sin(a)*33 ;
      }
    }
    outA = a;
    countDown = 5000;
    av = random(1,3);
    aav = random(1,3);
  }
  
  void display() {
    a  +=.02;
    aa += .2;
    pushMatrix();
    translate(722,-700,-1000);
    stroke(0,backAlpha);
    strokeWeight((countDown+1000)/1600);
    //translate(0,-1070,0);
    rotateX(PI/2.0);
    if(mode > 0) {
      rotateY(-PI/1.04);
    }else {
      rotateY(PI/1.04);
    } 
    x += ((.5)*(5000-countDown)/500*av)/2;
    y += ((.5)*(5000-countDown)*2/500*aav)/2;
    point(x,y);
    popMatrix();
    countDown-=8;
  }
}

void blackLeaveDisplay() {
  for (int i = blackLeaves.size()-1; i >=0; i--)
  {    
    blackLeaves.get(i).display();
    if(blackLeaves.get(i).countDown < 0)
    {
      blackLeaves.remove(i);
    }
  }
}

void blackLeavesAdd() {
  for(int i =0; i<round(random(0,120));i++){
    blackLeave newblackLeave = new blackLeave();
    blackLeaves.add(newblackLeave);
  } 

}