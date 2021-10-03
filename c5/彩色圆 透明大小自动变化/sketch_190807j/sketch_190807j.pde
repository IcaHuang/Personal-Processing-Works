
void setup() {
  size(700, 700);
  colorMode(HSB);
}

void draw() {
  background(0);
  noStroke();
  fill(255);
  for (int i=10; i<width-5; i=i+40) {
    for (int j=10; j<height-5; j=j+40) {
      float x = 21*noise((millis() + i*j)/1000.0, 0);
      float y = 6*noise(0, (millis()+i*j)/1000.0);
      float r = 28*noise((millis()+i*j)/1500.0);
      float alpha = 255*noise((millis()+i*j)/1800.0);
      float hsb1 = 236*noise((millis()+i*j)/1800.0, 0);
      float hsb2 = 126*noise(0, (millis()+i*j)/4800.0);
      fill(hsb1+hsb2,255,255,alpha);
      ellipse(x+i, y+j, r+6, r+6);
    }
  }
}
