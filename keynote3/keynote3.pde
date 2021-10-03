void setup(){
  size(700, 500);
  background(0);
  //colorMode(HSB,100,360,360);
  rectMode(CORNERS);
}

void draw(){
  //添加不同砖块的颜色
  color org = color(193,88,45);
  color yel = color(252,236,158);
  color blue = color(44,85,152);
  color white = color(234,234,234);
  
  float time = millis()/10.0;
  float pingPong1 = sin(radians(time));
  float pingPong2 = sin(radians(time)+HALF_PI);
  float pingPong3 = sin(radians(time)+0.6*QUARTER_PI);
  float pingPong4 = sin(radians(time)+0.2*QUARTER_PI);
  float pingPong5 = sin(radians(time)+1.2*QUARTER_PI);
  
  //x1-3: 横向的交点坐标，从左到右 y1,y2: 纵向的交点坐标，从上到下
  //float x1 = width/9;
  //float x2 = width/7*3;
  //float x3 = width/9*7;
  //float y1 = height/14*7;
  //float y2 = height/4*3;
  
  float x1 = width/9 + map(pingPong1,-1.0,1.0,-20.0,20.0);
  float x2 = width/7*3 + map(-pingPong2,-1.0,1.0,-20.0,20.0);
  float x3 = width/9*7 + map(pingPong3,-1.0,1.0,-20.0,20.0);
  float y1 = height/14*7 + map(-pingPong4,-1.0,1.0,-20.0,20.0);
  float y2 = height/4*3 + map(pingPong5,-1.0,1.0,-20.0,20.0);
  strokeWeight(8);
     
  fill(org);
  rect(0,0,x2,y1);
  
  fill(yel);
  rect(0,y2,x1,height);
  
  fill(blue);
  rect(x2,y2,x3,height);
  
  fill(white);
  rect(x2,0,width,y1);
  rect(0,y1,x2,y2);
  rect(x2,y1,width,y2);
  rect(x1,y2,x2,height);
  rect(x3,y2,width,height);
}
