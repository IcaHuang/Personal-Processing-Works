boolean isIn;

void setup() {
  size(500, 500);
}

void draw() {
  background(0);
  isIn = isInside(width/2, height/2, 100, 100, mouseX, mouseY);
  if (isIn) {
    fill(0,random(255),random(255));
  } else {
    noFill();
  }
  stroke(255);
  strokeWeight(2.0);
  rectMode(CENTER);
  rect(width/2, height/2, 100, 100);
}

//用于判断点是否在矩形内，默认在CENTER的rectMode情况下
//(rx,ry):矩形中心点坐标
//rw: 矩形宽度 rh: 矩形高度
//(x,y)为要判断的点的坐标
boolean isInside(int rx, int ry, 
  int rw, int rh, int x, int y) {  
  if (x>(rx-rw/2) && x<(rx+rw/2) &&
    y>(rx-rh/2) && y<(rx+rh/2)) {
    return true;
  } else {
    return false;
  }
}
