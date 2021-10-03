void setup(){
  size(500,500);
}

void draw(){
  background(0);
  float a = atan2(mouseY-height/2, mouseX-width/2);
  pushMatrix();
  translate(width/2,height/2);
  rotate(a);
  rectMode(CENTER);
  rect(0,0,100,100);
  popMatrix();
  
}
