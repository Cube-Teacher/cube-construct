
test test1;

void settings() {
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 960, P3D);
}

void setup(){
  camera(width/2, height/2,  (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  noFill();
  stroke(0);
  strokeWeight(3);
}

float rotateangleX = 0;
float rotateangleY = 0;
float rotateangleZ = 0; 

void draw(){
  background(255);
  translate(600, 480, 0);
  rotateX(radians(rotateangleX));
  rotateY(radians(rotateangleY));
  // no need rotate of z-axix
  // rotateZ(radians(ratateangleY));

  box(200); 
}
