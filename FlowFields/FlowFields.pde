float changeConst = 0.005;
float pifactor = 2;
  
ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  colorMode(HSB);
  size(720,720);
  background(0);
  
  for(int i = 0; i < 100000; i++){
    particles.add(new Particle(random(width), random(height)));
  }
}

void draw() {
  for (Particle p : particles) {
    p.update(); //updates & displays both
  }
}

class Particle {
  PVector pos;
  PVector vel;
  float nVal;
  
  Particle(float x, float y) {
    pos = new PVector(x,y);
    vel = new PVector(0,0);
  }
  
  void update(){
    if ((pos.x > 0 && pos.x < width) || (pos.y > 0 && pos.y < height)) {
      nVal = noise(pos.x*changeConst,pos.y*changeConst);
      vel = PVector.fromAngle(nVal * pifactor * PI);
      vel.setMag(100);
      pos.add(PVector.div(vel,frameRate));
      display();
    }
  }
  
  void display(){
    fill((nVal * 255) % 255, 255, 255);
    //fill(255,255,255);
    noStroke();
    circle(pos.x,pos.y,0.3);
  }
}
