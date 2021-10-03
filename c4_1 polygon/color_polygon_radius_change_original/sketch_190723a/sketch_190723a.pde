float deg;
float rad;
float pingPong;
float sw; 
float s;
float rot;
float num;

void setup() {
  size(800, 800);
  colorMode(HSB);
}


void draw() {
  background(0);
  noFill();
  num = 20.0;
  //用i让每一次正弦波的弧度都不一样
  for (int i=1; i<=num; i++) {  //i=圈的个数
    //stroke(noise(i)*255,noise(i+20)*255,noise(i+40)*255,100);
    deg = (millis()+136*i)/8.0;  //第一个参数：调整一个循环的大小；第二个参数：调整速度的大小
    rad = radians(deg);
    pingPong = sin(rad);
    //不同节奏的来回往复用在笔触上
    sw = map(pingPong, -1.0, 1.0, 8.6, 53.4);//第3,4个参数：调整单个环的笔触大小
    strokeWeight(sw);
    //s = map(pingPong, -1.0, 1.0, 0.0, 255.0);
    s = map(i, 1, num, 0.0, 255.0);
    stroke(s, 255, 255, 66);//带一点透明

    drawPolygon(width/2, height/2, i*12, 5);

    //pushMatrix();
    //translate(width/2, height/2);
    //rotate(radians(s));
    //drawPolygon(width/2,height/2,i*11, 5);
    //popMatrix();
  }
}


//cx,cy: 多边形的中心坐标 r:多边形大小 count:多边形个数
void drawPolygon(int cx, int cy, 
  float r, int count) {
  float unit;
  float mr;
  float x;
  float y;
  pushMatrix();
  translate(cx, cy);
  //rotate(radians(millis()/12.4));
  beginShape();
  for (int i=1; i <=count; i++) {
    unit = 360/count;
    mr = r+map(sin(radians((millis()+437*i)/3.5)),-1,1,-43,224); 
    x = mr*sin(radians(unit*i));
    y = mr*cos(radians(unit*i));
    vertex(x, y);
  }
  endShape(CLOSE);
  popMatrix();
}


void drawPolygon1(float r, int count) {
  beginShape();
  for (int i=1; i <=count; i++) {
    float unit = 360/count;
    float mr = r+map(sin(radians(millis()/3.4+442*i)),-1,1,-30,30); 
    float x = mr*sin(radians(unit*i));
    float y = mr*cos(radians(unit*i));
    vertex(x, y);
  }
  endShape(CLOSE);
}
