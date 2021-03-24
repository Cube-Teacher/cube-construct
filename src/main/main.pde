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
}

int r = 0;

void draw(){
  background(255);
  line(-500, 0, 0, 500, 0, 0);  
  line(0, -500, 0, 0, 500, 0);  
  line(0, 0, -500, 0, 0, 500);  

  // orange center line
  // line(-500,150,150,500,150,150);
  
  // blue center line
  // line(150,150,-500,150,150,500);

  // white center line
  // line(150,-500,150,150,500,150);

  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      for(int k=0;k<3;k++){

        pushMatrix();
         
        // rotate orange center line
        // if(k==0 || k==2){
        //   translate(0,150-(150*sqrt(2)*sin(radians(45-r))),150-(150*sqrt(2)*cos(radians(45-r))));
        //   rotateX(radians(r));
        // }

        // blue orange center line
        // if(i==2 || i==0){
        //   translate(150-(150*sqrt(2)*sin(radians(45-r))),150-(150*sqrt(2)*cos(radians(45-r))),0);
        //   rotateZ(radians(r));
        // }

        // white orange center line
        // if(j==2 || j==0){
        //   translate(150-(150*sqrt(2)*cos(radians(45-r))),0,150-(150*sqrt(2)*sin(radians(45-r))));
        //   rotateY(radians(r));
        // }

        translate(sideLength/2+k*sideLength, sideLength/2+j*sideLength, sideLength/2+i*sideLength);
        
        Cube.createSurface(sideLength);   
        popMatrix();
      }
    }
  }
  r+=1;
  
  // delay(500);
 

  // Cube.createSideline();
}