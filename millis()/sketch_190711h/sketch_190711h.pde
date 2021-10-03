float time;
float rad;
float pingPong;
float r;
void setup() {
  size(500, 500);
}


void draw() {
  background(0);
  fill(255);
  time = millis()/5.6;  //控制速度
  println("mills:"+ millis());
  println("time:"+time);
  rad = radians(time);
  pingPong = sin(rad);
  r = map(pingPong, -1.0, 1.0, 0.0, 100.0);  //控制圆的最大半径
  ellipse(width/2, height/2, r, r);
}
