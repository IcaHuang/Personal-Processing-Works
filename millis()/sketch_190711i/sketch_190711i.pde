//加上Berlin随机的小尝试
//Berlin随机的函数：noise()
float time;
float rad;
float pingPong;
float r;
float t;
void setup() {
  size(500, 500);
  t = 0;
}


void draw() {
  background(0);
  fill(255);
  t = t + 0.1;
  float nosi = noise(t);
  float nos = map(nosi, 0.0, 1.0, 0.0, 25.8);
  time = millis()/5.6;
  rad = radians(time);
  pingPong = sin(rad);
  r = map(pingPong, -1.0, 1.0, 0.0, 100.0) + nos;
  //r = nos;
  ellipse(width/2, height/2, r, r);
}
