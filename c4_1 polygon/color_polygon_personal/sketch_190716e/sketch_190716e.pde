float deg;
float rad;
float pingPong;
float sw;
float cx;
float cy;
float x;
float y;
float r;

void setup() {
  size(800, 800);
  cx = width/2;
  cy = height/2;
}


void draw() {
  background(0);
  noFill();
  //stroke(255,65);//带一点透明
  //用i让每一次正弦波的弧度都不一样
  for(int i=1; i<=20; i++){  //i=圈的个数
    stroke(noise(i)*255,noise(i+20)*255,noise(i+40)*255,100);
    deg = (millis()+136*i)/8.0;  //第一个参数：调整一个循环的大小；第二个参数：调整速度的大小
    rad = radians(deg);
    pingPong = sin(rad);
    //不同节奏的来回往复用在笔触上
    sw = map(pingPong,-1.0,1.0,0.0,46.4);//第3,4个参数：调整单个环的大小
    strokeWeight(sw);
    r = map(pingPong,-1.0,1.0,0.0,i*45); //i相乘的常数：调整多边形的大小
    
    
    //多边形的绘制
    beginShape();
    for(float j = 0.0; j<=360.0; j=j+60.0){
      rad = radians(j);
      x = cx + r*sin(rad);
      y = cy + r*cos(rad);
      vertex(x,y);
    }
    endShape(CLOSE);
  }
}
