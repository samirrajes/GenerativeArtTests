PImage img;

void setup() {
  size(900,900,P3D);
  img = loadImage("statue.jpg");
  img.resize(900,900);
}

void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  
  sphereDetail(3);

  
  // rasterize image
  float tiles = 200;
  float tileSize = width/tiles;
  
  push();
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  for (int i=0; i<tiles; i++) {
    for (int j=0; j<tiles; j++) {
      
      color c = img.get(int(i*tileSize),int(j*tileSize));
      float b = map(brightness(c),0,255,1,0);
      
      float z = map(b,0,1,-75,75);
      
      push();
      translate(i*tileSize-width/2,j*tileSize-width/2, z);
      sphere(tileSize*b);
      pop();
    }
  }
  
  pop();
  
  // rotate in 3d space around its own y axis
  
  
  
  
  //distribute position of grid tiles in z position
  
  
}
