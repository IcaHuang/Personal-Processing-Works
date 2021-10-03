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
    deg = (millis()+136*i)/8.0;  //第一个参数：调整一圈的大小；第二个参数：调整速度的大小
    rad = radians(deg);
    pingPong = sin(rad);
    //不同节奏的来回往复用在笔触上
    sw = map(pingPong, -1.0, 1.0, 8.6, 53.4);//第3,4个参数：调整单个环的大小
    strokeWeight(sw);
    //s = map(pingPong, -1.0, 1.0, 0.0, 255.0);
    s = map(i, 1, 20, 0.0, 255.0);
    stroke(s, 255, 255, 66);//带一点透明
    //fill(s, 255, 255, i%255);

    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(s));
    drawPolygon1(i*16, 5);
    popMatrix();
  }
}


void drawPolygon1(float r, int count) {
  beginShape();
  for (int i=1; i <=count; i++) {
    float unit = 360/count;
    float x = r*sin(radians(unit*i));
    float y = r*cos(radians(unit*i));
    vertex(x, y);
  }
  endShape(CLOSE);
}
