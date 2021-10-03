float r;
float cx;
float cy;
float rad;
float x;
float y;
void setup() {
  size(500, 500);
  r = 400;
  cx = width/2;
  cy = height/2;
}


void draw() {
  background(0);
  noFill();
  stroke(255);
  strokeWeight(2.5);
  beginShape();
  for (float i = 0; i<=360.0; i=i+7.0) {
    float deg = millis()/8.0+282.3*i;  //相比于多边形的放大缩小，添加了"常量*i"的部分
    float mrad = radians(deg);
    float pingPong = sin(mrad);
    float r = map(pingPong, -1.0, 1.0, 0.0, 100.0);
    rad = radians(i);
    x = cx + r*sin(rad);
    y = cy + r*cos(rad);
    vertex(x, y);
  }
  endShape(CLOSE);
}
