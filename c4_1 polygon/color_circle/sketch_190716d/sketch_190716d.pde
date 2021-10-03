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
  //stroke(255,65);//带一点透明
  //用i让每一次正弦波的弧度都不一样
  for(int i=1; i<=20; i++){  //i=圈的个数
    stroke(noise(i)*255,noise(i+20)*255,noise(i+40)*255,124);
    deg = (millis()*1.0+150*i)/8.0;  //第1个参数(mill())：调整一个周期的速度大小;
                                    //第2个参数(*i)：调整一个周期的长度，一个周期越小，同时能看到的周期越多
    rad = radians(deg);
    pingPong = sin(rad);
    //不同节奏的来回往复用在笔触上
    sw = map(pingPong,-1.0,1.0,0.0,46.4);//第3,4个参数：调整单个环的大小
    strokeWeight(sw);
    ellipse(width/2,height/2,i*25,i*25);
  }
}
