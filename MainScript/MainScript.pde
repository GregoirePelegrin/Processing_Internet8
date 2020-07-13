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
float freq;
float amp;

void setup(){
  size(600, 600);
  frameRate(30);
  
  time = 0;
  separationDiam = 300;
  minDiam = 0;
  maxDiam = 600;
  incrAngle = PI/50;
  nbrLayers = 10;
  
  freq = 10;
  amp = 20;
  
  innerWhite = new Circle(minDiam, separationDiam, 0, 0, freq, amp);
  innerBlack = new Circle(minDiam, separationDiam, incrAngle, 0, freq, amp);
  outerWhite = new Circle(separationDiam, maxDiam, 0, PI/10, freq, -amp);
  outerBlack = new Circle(separationDiam, maxDiam, incrAngle, PI/10, freq, -amp);
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
