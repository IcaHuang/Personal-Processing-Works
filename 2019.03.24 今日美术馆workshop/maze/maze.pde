import processing.pdf.*;

boolean saveOneFrame = false;

int gridx = 20; //迷宫的步长
int gridy = 20; 
void setup() {
  size(500, 500);
  frameRate(100);
  //noLoop();
  //colorMode(HSB);
}


void draw() {
  if (saveOneFrame == true) {
    beginRecord(PDF, frameCount+"Line.pdf");
  }

  gridx = (int)map(mouseY, 0, width, 10, 100);
  gridy = gridx;
  randomSeed(100);
  background(255, 255, 255);
  strokeWeight(2);
  for (int i=0; i < width; i += gridx) {
    for (int j=0; j < height; j += gridy) {
      float random = random(1);
      if (random > 0.5) {
        stroke(113, 238, 131);
        line(i, j, i+gridx, j+gridy);
      } else {
        stroke(71, 84, 202);
        line(i+gridx, j, i, j+gridy);
      }
    }
  }


  if (saveOneFrame == true) {
    endRecord();
    saveOneFrame = false;
  }
}

void mousePressed() {
  saveOneFrame = true;
}
