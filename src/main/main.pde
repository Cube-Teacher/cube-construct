void settings() {
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 960, P3D);
}

float rotateangleX = 0;
float rotateangleY = 0;
float rotateangleZ = 0; 
float sideLength = 150;
RubikCube Cube;

void setup(){
  camera(width/2, height/2,  (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  noFill();
  Cube = new RubikCube(10,15);
}

void draw(){
  background(0);
  translate(600, 480, 0);
  rotateX(radians(rotateangleX));
  rotateY(radians(rotateangleY));
  Cube.createSurface();
  Cube.createSideline();
}