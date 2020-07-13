class Circle {
  float innerDiam;
  float outerDiam;
  float startAngle;
  float currAngle;
  float speedAngle;
  float frequency;
  float amplitude;

  Circle(float id, float od, float sta, float spa, float f, float a) {
    this.innerDiam = id;
    this.outerDiam = od;
    this.startAngle = sta;
    this.currAngle = this.startAngle;
    this.speedAngle = spa;
    this.frequency = f;
    this.amplitude = a;
  }

  void update(float t) {
    if (this.innerDiam != 0) {
      this.innerDiam = (1+this.amplitude*sin(this.frequency*t)) * separationDiam;
      this.outerDiam = maxDiam;
      this.currAngle = this.speedAngle*t + this.startAngle;
    } else {
      this.innerDiam = 0;
      this.outerDiam = (1+this.amplitude*sin(this.frequency*t)) * separationDiam;
      this.currAngle = this.startAngle;
    }
  }

  void display() {
}
