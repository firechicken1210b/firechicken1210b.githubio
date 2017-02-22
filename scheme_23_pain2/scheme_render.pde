int [] mainMemory = new int[200];

int g, s, b, t;
int mode;
int memoryStage;
int farmemoryStage;
int render_doorNumber;
int displayAlpha = 255;
int nowSize = 12;
int [] nowIam = new int[nowSize];
int [] nowInumber = new int[nowSize];
int partyCheck;
int backMode;
int backStep;
/*
void keyPressed(){
  
  if(key == 'A' || key == 'a') {
    mode = 1;
    memoryStage += 1;
    render_doorNumber = 1;
    memoryRender();
    displayAlpha += (displayAlpha < 171) ? 85:0;
    
  } 
  if(key == 'D' || key == 'd') {
    mode = 2;
    memoryStage += 1;
    render_doorNumber = 2;
    memoryRender();
    displayAlpha += (displayAlpha < 171) ? 85:0;
    
  } 
  if(key == 'S' || key == 's') {
    if(memoryStage > 0) {
      mode = 3;
      render_doorNumber = 0;
      memoryRender();
      memoryStage -= 1;
      backMode += (backMode == 0) ? 1:-1 ;
      displayAlpha -= (backMode == 1 && displayAlpha > 156) ? 50:0;
      displayAlpha += (backMode > 1) ? 50:0;
    }
  } 
}
*/


void memoryRender() {
  
  if (memoryStage == 1) {
    nowIam[0] = render_doorNumber;   
  }else if(memoryStage == 2) {
    nowIam[1] = render_doorNumber;
  }else if(memoryStage == 3) {
    nowIam[2] = render_doorNumber;
  }else if(memoryStage == 4) {
    nowIam[3] = render_doorNumber;
  }else if(memoryStage == 5) {
    nowIam[4] = render_doorNumber;
  }else if(memoryStage == 6) {
    nowIam[5] = render_doorNumber;
  }else if(memoryStage == 7) {
    nowIam[6] = render_doorNumber;
  }else if(memoryStage == 8) {
    nowIam[7] = render_doorNumber;
  }else if(memoryStage == 9) {
    nowIam[8] = render_doorNumber;
  }else if(memoryStage == 10) {
    nowIam[9] = render_doorNumber;
  }else if(memoryStage == 11) {
    nowIam[10] = render_doorNumber;
  }else if(memoryStage == 12) {
    nowIam[11] = render_doorNumber;
  }
  
  if(memoryStage > farmemoryStage && backStep == 0){
    farmemoryStage = memoryStage;
    for(int i=0; i<nowSize; i++){
      mainMemory[i+(memoryStage-1)*(nowSize)] = nowIam[i];
    }
  }
}

int systemAlpha;

void partySystem() {
  if(partyCheck == 0) {
    partyCheck = 1;
  }else if(partyCheck == 1) {
    partyA();
    //println(" |memoryStage" ,memoryStage ," |party:","1"," |backMode", backMode, " |backStep", backStep, " |displayAlpha", displayAlpha);
    if(load_a == 180) {
      partyCheck = 2;
    }
  }else if(partyCheck == 2) {
    //println(" |memoryStage" ,memoryStage ," |party:","2"," |backMode", backMode, " |backStep", backStep, " |displayAlpha", displayAlpha);
    load1o0 = 1;
    systemAlpha+= (systemAlpha < 255) ? 2:0;
    if(systemAlpha >255) {
      delay(25);
      partyCheck = 3;
    }
  }else if(partyCheck == 3) {
    //println(" |memoryStage" ,memoryStage ," |party:","3"," |backMode", backMode, " |backStep", backStep, " |displayAlpha", displayAlpha);
    if(maybeChose == 1) {
      mode = 1;
      memoryStage += 1;
      render_doorNumber = 1;
      memoryRender();
      systemAlpha = 0;
      alphaRender();
      
      nowIamCounter();
      letsGimp();
            
      nowImatch();
      maybeChose = 0;
      partyCheck = 4;
    }else if(maybeChose == 2) {
      mode = 2;
      memoryStage += 1;
      render_doorNumber = 2;
      memoryRender();
      systemAlpha = 0;
      alphaRender();
      
      nowIamCounter();
      letsGimp();
      
      nowImatch();
      maybeChose = 0;
      partyCheck = 4;   
    }
  }else if(partyCheck == 4) {
    if(load_a < 1) {
      //println(" |memoryStage" ,memoryStage ," |party:","4"," |backMode", backMode, " |backStep", backStep, " |displayAlpha", displayAlpha);
       pushMatrix();
       //rectMode(CENTER);
       translate(-width,-700,-1000);
       ellipse(2000,1500,300,300);
       popMatrix();
        if (bodyChose == 4) {
          partyCheck = 0;
        }
      
    }
  } 
}

int partyA1o0;
int bodyChose;

void partyA() {  
  
  if (bodyChose == 1) {
    if(maybeChose == 2 && load_a >0) {} else {
      if(backAlpha == 255) {
        load1o0 = 1;
        maybeChose = 1;
      }
    }
  }else if(bodyChose == 2) {
    if(maybeChose ==1 && load_a >0) {} else {
      if(backAlpha == 255) {
        load1o0 = 1;
        maybeChose = 2;
      }
    }
  }else if(bodyChose == 3) {
    if(memoryStage > 0 && load_a == 0) {
      back1o0 = 1;
    }
  }    
}

int onWay() {
  int onWayback = 0;
  for(int i = 0;i<12;i++) {
    if(memoryStage >0){
      if(nowIam[i] == mainMemory[i+(memoryStage-1)*12]) {
        onWayback +=1; 
      }
    }else {
      if(nowIam[i] == 0) {
        onWayback +=1; 
      }
    }
  } 
  return onWayback;  // Returns an int of 60, in this case
}

char state;
int aR_a;
int displayAlpha2 = 205;

void alphaRender() {
  if(onWay()==12) {
    for(int i = 0;i<12;i++) {
      if(memoryStage >0){
        if(nowIam[i] == mainMemory[i+(farmemoryStage-1)*12]) {
          aR_a +=1;
          //println(nowIam[i],mainMemory[i+(farmemoryStage-1)*12]);
          if(aR_a == 12) {
            state = 'a' ; 
            displayAlpha = 255;
            aR_a = 0;
          }else {
            state = 'b' ; 
            displayAlpha = 205;
          }          
        }
      }else {
        if(nowIam[i] == 0) {
          if(farmemoryStage == 0){
            displayAlpha = displayAlpha;
          }else {
            displayAlpha = 205;
          }
        }
      }
    }
  }else {
    if(maybeChose == 1 || maybeChose == 2) {
      state = 'c' ; 
      backStep += 1;
      displayAlpha2 -=85;      
      displayAlpha = (displayAlpha2 > 0) ? displayAlpha2:displayAlpha;
      displayAlpha = (displayAlpha2 < 0) ? 0:displayAlpha; 
    }else {
      state = 'd' ; 
      backStep -= 1;
      displayAlpha2 +=85;
      displayAlpha = (displayAlpha2 > 0) ? displayAlpha2:displayAlpha;  
      displayAlpha = (displayAlpha2 < 0) ? 0:displayAlpha; 
    }    
  }  
  displayAlpha2 = (backStep == 0) ? 205:displayAlpha2;
  aR_a = 0;
}

int backParty;
int backAlpha = 255;
int back1o0;

void backSystem() {
  if(backParty == 0) {
    backParty = 1;
  }else if(backParty == 1) {
    if(backAlpha > 0 && back1o0 == 1) {
      backAlpha -= 3;
      back1o0 = 0;
    }else if(backAlpha <255) {
      backAlpha += 3;
    }
    if(backAlpha==0) {
      backParty = 2 ;
    }
  }else if(backParty == 2) {
    mode = 3;
    render_doorNumber = 0;
    memoryRender();
    memoryStage -= 1;
    alphaRender();
    backParty= 3;
  }else if(backParty == 3) {
    backAlpha += (backAlpha < 255) ? 1:0;
    if(backAlpha == 255) {
      
        if (bodyChose == 4) {
          backParty = 0;
        }
      
    }
  } 
}

void nowImatch() {
  for(int i = 0; i< nowSize -1; i++) {
    nowInumber[i] = nowIam[i];
  } 
}


void keykey() {
if (keyPressed) {
    if (key == 'a' || key == 'A') {
      bodyChose = 1;
    }else if(key == 'D' || key == 'd') {
      bodyChose = 2;
    }else if(key == 'S' || key == 's') {
      bodyChose = 3;
    }else if(key == 'x' || key == 'X') {
      bodyChose = 4;
    }    
  }
}

void nowIamCounter() {
  stageNumber = 0;
  for(int i =0;i<12;i++) {
    stageNumber += nowIam[i]*pow(10,i);
    println(stageNumber, farmemoryStage);
  }
}