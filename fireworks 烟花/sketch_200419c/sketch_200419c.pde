float lineCount;
float ellipseCount;
float ellipseR;
float rotateSpeed;
float a;

float deg;
float rad;
float pingPong;
float sw;
float col;

void setup() {
  size(800, 800);
  a = 0;
}

void draw() {
  background(0);

  pushMatrix();
  ellipseMode(CENTER);
  //移动坐标中心到画布中心
  translate(width/2, height/2);  

  rotateSpeed = 0.18;  //整体图形的旋转速度
  a+=rotateSpeed;      //a作为整体图形旋转角度的累加器
  rotate(radians(a));

  lineCount = 36;      //每一圈的线条个数
  ellipseCount = 14.0;  //圈数
  //ellipseR = 700;

  //让整体图形按正弦方式缩放
  //float b =(sin(millis()/497.6));  
  //ellipseR = map(b, -1.0, 1.0, 600, 700);
  ellipseR = 600;

  /*总体画法：从大环开始画起，往内一个个画
   每个环的画法：从画布中心发射线条，然后在中间盖一个跟背景色相同的、没有描边的圆
   以此类推
   */
  for (int j=0; j<ellipseCount; j++) {
    float lineR = ellipseR / ellipseCount * (ellipseCount-j);
    float elliR = ellipseR / ellipseCount * (ellipseCount-j-1);
    rotate(radians(9*j));

    deg = (millis()+705*j)/5.0;
    rad = radians(deg);
    pingPong = sin(rad);
    sw = map(pingPong, -1.0, 1.0, 0.0, 10.0);
    col = map(pingPong, -1.0, 1.0, 0.0, 255.0);
    strokeWeight(sw);
    stroke(col, 95, 250);
    noFill();
    strokeWeight(1.3);
    for (int z=0; z<lineCount; z++) {
      line(0, 0, lineR/2*cos(radians(360/lineCount*z)), lineR/2*sin(radians(360/lineCount*z)));
    }

    //stroke(0);
    noStroke();
    fill(0);
    ellipse(0, 0, elliR, elliR);
  }

  popMatrix();
}
