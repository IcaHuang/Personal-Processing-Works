 float xAxis;  //通过map()缩小随鼠标移动的范围（否则鼠标移动100个像素，阵列也移动100个像素）
float yAxis;  //
float r;
float roff = 0;
float a;
float b;

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  float range = 196;  //鼠标控制阵列移动的范围（x轴、y轴）
  float gap = 90;    //各个元素中心的距离
  float xNum = 5;    //x轴上的元素个数
  int yNum = 5;      //y轴上的元素个数

  roff += 0.04;      //noise()的变化参数
  r = noise(roff)*34+9;  //元素的大小
  //r = 25;
  xAxis = map(mouseX, 0, width, 0, range);
  yAxis = map(mouseY, 0, height, 0, range);

  rectMode(CENTER);

  //绘制底部不变的圆形阵列
  pushMatrix();
  translate(width/2, height/2);
  a += map(noise(roff),0,1,-4,4);
  b = radians(a);
  rotate(b);
  noStroke();
  for (int i=0; i<xNum; i++) {
    for (int j=0; j<yNum; j++) {
      //在底部绘制带透明度的白色矩形
      fill(255, 255, 255, 125);
      rect(-gap*(xNum-1)/2+i*gap, -gap*(yNum-1)/2+j*gap, r*2, r*2);
      //绘制带透明度的颜色矩形
      fill(229, 1, 1, 160);
      rect(-gap*(xNum-1)/2+i*gap, -gap*(yNum-1)/2+j*gap, r*2, r*2);
    }
  }
  popMatrix();

  //绘制随鼠标移动的阵列，通过改变坐标系的中心实现
  pushMatrix();
  translate(width/2-range/2+xAxis, height/2-range/2+yAxis);
  rotate(b);
  noStroke();
  for (int i=0; i<xNum; i++) {
    for (int j=0; j<yNum; j++) {
      //在底部绘制带透明度的白色矩形
      fill(255, 255, 255, 125);
      rect(-gap*(xNum-1)/2+i*gap, -gap*(yNum-1)/2+j*gap, r*2, r*2);
      //绘制带透明度的颜色矩形
      fill(12, 35, 253, 160);
      rect(-gap*(xNum-1)/2+i*gap, -gap*(yNum-1)/2+j*gap, r*2, r*2);
    }
  }
  popMatrix();
}
