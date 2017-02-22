int load_a;
int load_b;
int load_c;
int load_d;

int load_FadeAlpha;

int load1o0;

void loading() {
  loadPixels();  
  if((load_a==180) && (load_b==13) && (load_c==2)) {

    }
  
  if (load1o0 == 1) {
    load_a += (load_a<180) ? 1:0;
    load1o0 = 0;
    /*
    load_a += (load_a<180) ? 1:0;
    load_c = ((load_a==180) && (load_c==0)) ? 1:load_c;
    load_b += ((load_c==2) && (load_b<13)) ? 1:0;
    load_a = ((load_c==1)) ? 0:load_a;
    load_c = ((load_c==1)) ? 2:load_c;
    */  
  }else if (load1o0 == 0) {
    load_a -= (load_a>0) ? 1:0;  
    load_d -= (load_d>0) ? 1:0;
    //backAlpha -= (backAlpha > 0) ? 1:0;
    if(load_a == 0) {
      maybeChose = load_a ;
    }
  }
   
  for(int h = 0;h<1441; h+=180) {
    for(int l = 0;l<800;l+=20) {
      for(int k = 0; k <load_a; k++) {
        for (int i = 0; i < 10; i++) {
          for(int j = 0; j < 10;j++) {      
              pixels[i+h+k+(j+l)*width] = color(255);          
              pixels[i+h+k+(j+l+1)*width] = color(0); 
          }
        }
      }
    }  
  }
  
  if(load_a > 175) {
    load_d+= (load_d <20) ? 1:0;
  } 
  for(int k=0; k<40; k++){
    for(int i=0; i< width;i++) {
      for(int j=10; j<load_d;j++) {
         pixels[i+(j+k*20)*width] = color(255);
      }
    }
  }  
  updatePixels();
  
  if(maybeChose == 1) {
    displayL();
  }else if (maybeChose == 2) {
    displayR();
  }
}