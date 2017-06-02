void setup(){
  int xx = displayWidth
  println(xx);
  size(displayWidth,displayHeight);
}

int x=20,y=0;

void draw(){
  background(0);
  fill(255);
  rectMode(CENTER);
  rect(width/2,height/2,width-30,height-30);
  
  translate(0,y);
  puffer(x,y,20,20);
  textPuffer("jjjjjjjjH",20,120,100);
  stroke(255);
  point(20,120);
}



void puffer(float x, float y,float pufferWidth, float pufferHeight){
  if(mouseX > x && mouseX < x+pufferWidth && mouseY > y && mouseY < y+pufferHeight){
    fill(255,0,0);
  }else{
    fill(0);
  }
  rect(x,y,pufferWidth,pufferHeight);
}

void textPuffer(String text, float x, float y,int textSize){
  noStroke();
  float scalar = 0.8;
  float a = textAscent() * scalar;
  float b = textDescent() * scalar;
  
  textSize(textSize);
  if(mouseX > x && mouseX < x+textWidth(text) && mouseY < y+b && mouseY > y-a){
    fill(255,0,0);
  }else{
    fill(0);
  }
  text(text,x,y);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
  y += e*3;
}
