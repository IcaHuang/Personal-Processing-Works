
void setup(){
  size(500, 500);
}

void draw(){
  background(0);
  stroke(255);
  strokeWeight(3.0);
  line(mouseX,mouseY,pmouseX,pmouseY);
}
