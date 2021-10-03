
void setup() {
  size(700, 700);
}

void draw() {
  background(0);
  noStroke();
  fill(255);
  for (int i=1; i<width; i=i+7) {
    for (int j=10; j<height; j=j+12) {
      float x = 21*noise((millis() + i*j)/1000.0, 0);
      float y = 6*noise(0, (millis()+i*j)/1000.0);

      ellipse(x+i, y+j, 21, 2);
    }
  }
}
