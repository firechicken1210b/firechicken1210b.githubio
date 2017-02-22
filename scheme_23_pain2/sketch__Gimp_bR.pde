float linedegStep = .5;
int goulike_PB = 100;       //higher than harder  
int ob_PB = 300;
int notagainJUMP_PB = 120;  //higher than harder
int JUMPvalue = 200;
float ruleSize = 0.53;

int g_width = 1000;
int g_height = 1000;
 
void bigRule() {
  degRule();
  
  //outside ball then get in
  if( abs(m-g_width/2) > g_width*ruleSize  || abs(n-g_height/2) > g_height*ruleSize) {
    m = random(g_width*.1,g_width*.9);n=random(g_height*.1,g_height*.9);
  }
  
  //get the before way then jump
  if(round(noise(oneOone))==1) {
    if(pg.get((int)(m+1*COS*o_Size),(int)(n+1*SIN*o_Size)) == P || pg.get((int)(m+1*COS*o_Size),(int)(n+1*SIN*o_Size)) == Pm) {
      if(probability((int)(noise(deg)*notagainJUMP_PB)) == 1) {
        m += random(-1*JUMPvalue*(noise(oneOone)+.5), JUMPvalue*(noise(oneOone)+.5)); n+=random(-1*JUMPvalue*(noise(oneOone)+.5), JUMPvalue*(noise(oneOone)+.5));
        println("aaa");
      }
    }
  }else if(round(noise(oneOone))==0) {
    if(pg.get((int)(m-1*COS*o_Size),(int)(n-1*SIN*o_Size)) == P || pg.get((int)(m-1*COS*o_Size),(int)(n-1*SIN*o_Size)) == Pm) {
      if(probability((int)(noise(deg)*notagainJUMP_PB)) == 1) {
        m += random(-1*JUMPvalue*(noise(oneOone)+1.5), JUMPvalue*(noise(oneOone)+1.5)); n+=random(-1*JUMPvalue*(noise(oneOone)+1.5), JUMPvalue*(noise(oneOone)+1.5));
        println("aaa");
      }
    }
  } 
} 
 
void degRule() {
  
//for not keep rolling + for not get to big deg  
  if(abs(deg2 - deg) >= 200) {
    if(deg > deg2) {
      deg2 = deg2 + 160;
      //println('c');
    }else if(deg2 > deg) {
      deg2 = deg2 - 160;
      //println('c');
    }
  }else if(abs(deg2) >= 800) {
    if(deg2 < 0 ){
      deg2 = deg2 + 720;  
      deg = deg + 720;
    }else if(deg2 > 0) {
      deg2 = deg2 - 720;
      deg = deg -720;
    }  
  }
 
// line the deg  
  if(deg != deg2) {
    if(deg > deg2) {
      deg -= linedegStep;      
    }else if(deg < deg2) {
      deg += linedegStep;      
    }
  }
  
//goulike
  if(probability(round(goulike_PB*noise(oneOone))) == 1) {
    int newDirectionKid = (int)random(1,50);
    deg2 = (int)map(newDirectionKid,1,50,-90,90);
    //println('a');
  }
  
//almost outside then get back
  if(sqrt(pow(m-g_width/2,2)+pow(n-g_height/2,2)) > (1+noise(deg))*(g_height+g_width)/2*.3) {
    if(probability(ob_PB) == 1) {
      deg = deg - 90 + random(-10,10);
    }else{
      int newDirectionKid = (int)random(1,50);
      deg2 = deg - 90 + map(newDirectionKid,1,50,-9,9);
    }
    //println('b');
  } 
}