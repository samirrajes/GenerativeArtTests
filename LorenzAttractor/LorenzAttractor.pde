//Lorenz Attractor
//import peasy.*;
float x = 0.01;
float y = 0.4;
float z = 0.03;

//constants
float a = 10; //sigma
float b = 28; //rho
float c = 8.0/3.0; //beta

ArrayList<PVector> pts = new ArrayList<PVector>();

//PeasyCam cam;

void setup() {
  size(800,600,P3D);
  colorMode(HSB);
  //cam = new PeasyCam(this,500);
}

void draw() {
  background(0);
  float dt = 0.01;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x += dx;
  y += dy;
  z += dz;
 
  pts.add(new PVector(x,y,z));
  
  translate(width/2,height/2);
  scale(5);
  stroke(255);
  noFill();
  
  float hu = 0;
  beginShape();
  for (PVector p : pts) {
    stroke(hu,255,255);
    vertex(p.x,p.y,p.z);
    hu += 0.1;
    if (hu > 255) {
      hu = 0;
    }
  }
  endShape();
}
