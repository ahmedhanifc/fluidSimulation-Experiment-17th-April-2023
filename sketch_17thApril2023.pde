

Fluid fluid;
float t = 0;
void settings() {
  size(N*SCALE, N*SCALE);
  
}

void setup() {
  
  fluid = new Fluid(0.4,0,0.000001);
  
}



void draw() {

  background(0);
  int cx = int(0.5*width/SCALE);
  int cy = int(0.5 * height / SCALE);
  for (int i = -1; i <= 1; i ++) {
    for (int j = -1; j <=1; j++) {
      
      fluid.addDensity(cx+i, cy+j,random(0,100));
    
    }
  }

  
  float angle = noise(t) * TWO_PI * 2;
  PVector v = PVector.fromAngle(angle);
  v.mult(0.3);
  t+=0.01;
  fluid.addVelocity(cx, cy, v.x,v.y);
  
  
  fluid.step();
  fluid.renderD();
  fluid.fadeD();

}
