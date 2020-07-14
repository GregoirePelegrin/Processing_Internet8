class Circle {
  float innerDiam;
  float outerDiam;
  float startAngle;
  float currAngle;
  float speedAngle;
  float frequency;
  float amplitude;
  int additionalLayers;

  Circle(float id, float od, float sta, float spa, float f, float a, int al) {
    this.innerDiam = id;
    this.outerDiam = od;
    this.startAngle = sta;
    this.currAngle = this.startAngle;
    this.speedAngle = spa;
    this.frequency = f;
    this.amplitude = a;
    this.additionalLayers = al;
  }

  void update(float t) {
    if (this.innerDiam != 0) {
      this.innerDiam = separationDiam+this.amplitude*sin(this.frequency*t);
      this.outerDiam = maxDiam;
      this.currAngle = this.speedAngle*t + this.startAngle;
    } else {
      this.innerDiam = 0;
      this.outerDiam = separationDiam+this.amplitude*sin(this.frequency*t);
      this.currAngle = this.startAngle;
    }
  }

  void display() {
    /*noFill();
    stroke(255, 0, 0, 100);
    ellipse(0, 0, this.innerDiam, this.innerDiam);
    ellipse(0, 0, this.outerDiam, this.outerDiam);*/
    
    float layerWidth;
    float offset;
    if(this.innerDiam != 0){
      offset = this.innerDiam/2;
    } else {
      offset = 0;
    }
    layerWidth = (this.outerDiam/2-this.innerDiam/2)/nbrLayers;
    
    //stroke(0, 255, 0, 100);
    if(this.startAngle != 0){
      fill(0);
    } else {
      fill(255);
    }
    for(int i=0; i<nbrLayers+this.additionalLayers; i++){
      //ellipse(0, 0, offset + i*layerWidth, offset + i*layerWidth);
      
      for(int j=0; j<2*PI/incrAngle; j++){
        if((i+j) % 2 != 0){
          beginShape();
          vertex((offset + i*layerWidth)*cos(this.currAngle + j*incrAngle), (offset + i*layerWidth)*sin(this.currAngle + j*incrAngle));
          vertex((offset + (i+1)*layerWidth)*cos(this.currAngle + j*incrAngle), (offset + (i+1)*layerWidth)*sin(this.currAngle + j*incrAngle));
          vertex((offset + (i+1)*layerWidth)*cos(this.currAngle + j*incrAngle + incrAngle), (offset + (i+1)*layerWidth)*sin(this.currAngle + j*incrAngle + incrAngle));
          vertex((offset + i*layerWidth)*cos(this.currAngle + j*incrAngle + incrAngle), (offset + i*layerWidth)*sin(this.currAngle + j*incrAngle + incrAngle));
          endShape(CLOSE);
        }
      }
    }
  }
}
