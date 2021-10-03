class Particle{
  float xPos, yPos, xVel, yVel, xAcc, yAcc;
  
  Particle(){
    xPos = random(width);
    yPos = random(height);
    //xPos = width/2;
    //yPos = height/2;
  }
  
  void run(){
    noiseAcc();
    updateMove();
    checkRange();
    render();
  }
  
  void noiseAcc(){
    float noiseStrength = 10.0;
    //float noiseStrength = 83.8;
    float deg = noiseStrength*360.0*noise(xPos/width, yPos/height, millis()/10000.0);
    float rad = radians(deg);
    xAcc = cos(rad);
    yAcc = sin(rad);
  }
  
  void updateMove(){
    xVel = xVel+xAcc;
    yVel = yVel+yAcc;
    //原例子中的maxVel=2.0。发现=1.2的时候线条会卷曲
    float maxVel = 2.0;
    //float maxVel = 1.2;
    float velSize = sqrt(xVel*xVel+yVel*yVel);
    if(velSize>maxVel){
      xVel = (xVel/velSize)*maxVel;
      yVel = (yVel/velSize)*maxVel;
    }
    xPos = xPos+xVel;
    yPos = yPos+yVel;
  }
  
  void checkRange(){
    if(xPos>width || xPos<0 || yPos>height || yPos<0){
      xPos = random(width);
      yPos = random(height);
    }
    //if(xPos>width){
    //  xPos=0.0;
    //}
    //if(xPos<0){
    //  xPos=width;
    //}
    //if(yPos>height){
    //  yPos=0.0;
    //}
    //if(yPos<0){
    //  yPos=height;
    //}
      
  }
  
  void render(){
    noStroke();
    fill(255);
    ellipse(xPos, yPos, 2, 2);
  }
  
}

ArrayList<Particle> particles = new ArrayList<Particle>();
//不用background()填充背景，而是在draw()中用一个半透明的矩形填充
void setup(){
  size(1000,1000);
  for(int i=0; i<20000; i++){
    Particle p = new Particle();
    particles.add(p);
  }
}

void draw(){
  fill(0, 30);
  rect(0, 0, width, height);
  for(int i=0; i<particles.size(); i++){
    Particle p = particles.get(i);
    p.run();
    //如果粒子跟鼠标距离<50,则删除这个粒子，并添加一个新粒子
    if(dist(mouseX, mouseY, p.xPos, p.yPos)<152){
      particles.remove(i);
      Particle a = new Particle();
      particles.add(a);
  }
  }
}
