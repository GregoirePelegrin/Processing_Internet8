Circle innerWhite;
Circle innerBlack;
Circle outerWhite;
Circle outerBlack;

float time;
float separationDiam;
float minDiam;
float maxDiam;
float incrAngle;
int nbrLayers;

void setup(){
  size(600, 600);
  frameRate(30);
  
  time = 0;
  separationDiam = 300;
  minDiam = 0;
  maxDiam = 600;
  incrAngle = PI/20;
  nbrLayers = 10;
  
  float freq1;
  float freq2;
  float amp1;
  float amp2;
  float speed1;
  float speed2;
  int addLay1;
  int addLay2;
  freq1 = 10;
  freq2 = 20;
  amp1 = 40;
  amp2 = 40;
  speed1 = 0;
  speed2 = PI/5;
  addLay1 = 10;
  addLay2 = 10;
  
  innerWhite = new Circle(minDiam, separationDiam, 0, speed1, freq1, amp1, addLay1);
  innerBlack = new Circle(minDiam, separationDiam, incrAngle, speed1, freq1, amp1, addLay1);
  outerWhite = new Circle(separationDiam, maxDiam, 0, speed2, freq2, amp2, addLay2);
  outerBlack = new Circle(separationDiam, maxDiam, incrAngle, speed2, freq2, amp2, addLay2);
}

void draw(){
  background(127);
  translate(width/2, height/2);
  
  innerWhite.update(time);
  innerBlack.update(time);
  outerWhite.update(time);
  outerBlack.update(time);
  
  innerWhite.display();
  innerBlack.display();
  outerWhite.display();
  outerBlack.display();
  
  time += 0.01;
}
