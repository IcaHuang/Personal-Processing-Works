import processing.pdf.*;
boolean saveOneFrame = false;
float rot;
float rectSize;
float rectNum;
void setup() {
  size(500, 500);
  rot=0;
}

void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, frameCount+"Line.pdf");
  }
  //为了正确保存图像，需要将rectMode()放到beginRecord后面
  rectMode(CENTER);
  background(0);
  rot=rot+radians(5.8);
  rectSize=30;
  rectNum=7;
  noFill();
  stroke(255);
  strokeWeight(1.5);
  for (int i =1; i <= rectNum; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(rot)*i);
    rect(0, 0, rectSize*i, rectSize*i);
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
