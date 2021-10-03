
void setup() {
  size(700, 700);
}

void draw() {
  background(0);
  noStroke();
  fill(255);
  for (int i= -14; i<width; i=i+20) {
    for (int j= -21; j<height; j=j+20) {
      float x = 65*noise((millis() + i*j)/1000.0, 0);
      float y = 70*noise(0, (millis()+i*j)/1000.0);

      ellipse(x+i, y+j, 10, 10);
    }
  }
}
