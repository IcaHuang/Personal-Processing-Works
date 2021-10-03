float r;
float cx;
float cy;
float pointNum;
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
  strokeWeight(1.0);
  pointNum = 27.0;
  beginShape();
  for (int i = 0; i<pointNum; i++){
    float deg = millis()/8.0+254.0*i;
    float mrad = radians(deg);
    float pingPong = sin(mrad);
    float r = map(pingPong,-1.0,1.0,0.0,100.0);
    rad = radians(360/pointNum);
    x = cx + r*sin(rad*i);
    y = cy + r*cos(rad*i);
    vertex(x,y);
  }
  endShape(CLOSE);
  }
