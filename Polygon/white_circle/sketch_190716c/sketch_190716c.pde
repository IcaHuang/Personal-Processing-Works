float deg;
float rad;
float pingPong;
float sw;

void setup() {
  size(800, 800);
}


void draw() {
  background(0);
  noFill();
  stroke(255,65);//带一点透明
  //用i让每一次正弦波的弧度都不一样
  for(int i=1; i<=20; i++){  //i=圈的个数
    //stroke(noise(i)*255,noise(i+20)*255,noise(i+40)*255,100);
    deg = (millis()+136*i)/8.0;  //第一个参数：调整一圈的大小；第二个参数：调整速度的大小
    rad = radians(deg);
    pingPong = sin(rad);
    //不同节奏的来回往复用在笔触上
    sw = map(pingPong,-1.0,1.0,0.0,46.4);//第3,4个参数：调整单个环的大小
    strokeWeight(sw);
    ellipse(width/2,height/2,i*25,i*25);
  }
}
