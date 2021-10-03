import processing.pdf.*;
boolean saveOneFrame = false;
float rot;
float rectSize;
float rectNum;
float deg;
float rad;
float pingPong;
float sw;
float col;

void setup() {
  size(500, 500);
  rot=0;
  //re=0;
}

void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, frameCount+"Line.pdf");
    //beginRecord(PDF, "Line"+re+".pdf");
    //re++;
  }
  //为了正确保存图像，需要将rectMode()放到beginRecord后面
  rectMode(CENTER);
  background(0);
  //rot=rot+radians(16.9);
  rectSize=43;
  rectNum=5;
  noFill();
  //stroke(255);
  //strokeWeight(2.0);
  for (int i =1; i <= rectNum; i++) {
    pushMatrix();
    translate(width/2, height/2);
    //rotate(radians(rot)*i);

    deg = (millis()+753*i)/5.0;
    rad = radians(deg);
    pingPong = sin(rad);
    sw = map(pingPong, -1.0, 1.0, 0.0, 10.0);
    col = map(pingPong, -1.0, 1.0, 0.0, 255.0);
    strokeWeight(sw);
    //stroke(col, 0, 0, col);
    stroke(col,95,250);

    ellipse(0, 0, rectSize*i, rectSize*i);

    popMatrix();
  }


  if (saveOneFrame == true) {
    endRecord();
    saveOneFrame = false;
  }
}

void mousePressed() {
  saveOneFrame = true;
}
