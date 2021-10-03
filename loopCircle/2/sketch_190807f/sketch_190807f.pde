 float time = 0.0;

void setup() {
  size(700, 700);
}

void draw() {
 
  background(0);
  noStroke();
  fill(255);
  for (int i=10; i<width; i=i+7) {
    for (int j=10; j<height; j=j+12) {
      float x = 7*noise(time, 0);
      float y = 5*noise(0,time+40);
      ellipse(x+i, y+j, 21, 2);
      time+=2.66;
    }
  }
}
