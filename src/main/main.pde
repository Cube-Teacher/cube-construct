import peasy.*;

void settings() {
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 960, P3D);
}

float rotateangleX = 0;
float rotateangleY = 0;
float rotateangleZ = 0; 
float sideLength = 100;

RubikCube Cube;
PeasyCam cam;

void setup(){
  // camera(width/2, height/2,  (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  noFill();
  Cube = new RubikCube(10,15);
  cam = new PeasyCam(this,sideLength*3.0/2.0,sideLength*3.0/2,sideLength*3.0/2,1000);
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(2000);
  // cam.lookAt();
}

void draw(){
  background(255);


  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      for(int k=0;k<3;k++){
        pushMatrix();
        // translate(500+k*sideLength, 400+j*sideLength, 0+i*sideLength);
        translate(sideLength/2+k*sideLength, sideLength/2+j*sideLength, sideLength/2+i*sideLength);
        // rotateX(radians(rotateangleX));
        // rotateY(radians(rotateangleY));
        Cube.createSurface(sideLength);        
        popMatrix();
      }
    }
  }
  
  // Cube.createSideline();
}