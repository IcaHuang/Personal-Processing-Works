float deg;
float degAcc;
float degVel;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  deg=0;
  degAcc=0.1;
  degVel=0;
}

void draw() {
  background(255);
  fill(0);
  degVel+=degAcc;
  deg +=degVel;
  pushMatrix();
  translate(width/4, height/4);
  rotate(radians(-deg));
  rect(0, 0, 50, 50);
  popMatrix();

  pushMatrix();
  translate(width/4*3, height/4);
  rotate(radians(deg));
  rect(0, 0, 50, 50);
  popMatrix();

  pushMatrix();
  translate(width/4, height/4*3);
  rotate(radians(deg));
  rect(0, 0, 50, 50);
  popMatrix();

  pushMatrix();
  translate(width/4*3, height/4*3);
  rotate(radians(-deg));
  rect(0, 0, 50, 50);
  popMatrix();
}
