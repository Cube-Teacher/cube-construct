
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

// void draw(){
//   background(255);
//   translate(600, 480, 0);
//   rotateX(radians(rotateangleX));
//   rotateY(radians(rotateangleY));
//   // no need rotate of z-axix
//   // rotateZ(radians(ratateangleY));

//   box(200); 
// }

int find_color(String cubeColor){
  if(cubeColor=="GREEN") return #009b48;
  else if (cubeColor=="WHITE") return #ffffff;
  else if (cubeColor=="RED") return #b71234;
  else if (cubeColor=="YELLOW") return #ffd500;
  else if (cubeColor=="BLUE") return #0046ad;
  else if (cubeColor=="ORANGE") return #ff5800;
  return 0;
}

void draw(){
  background(255);
  translate(600, 480, 0);
  rotateX(radians(rotateangleX));
  rotateY(radians(rotateangleY));

  float sideLength = 100;
  beginShape(QUADS);

  // TOP
  fill(find_color("WHITE"));
  vertex(-sideLength, -sideLength, -sideLength);
  vertex( sideLength, -sideLength, -sideLength);
  vertex( sideLength, -sideLength,  sideLength);
  vertex(-sideLength, -sideLength,  sideLength);
  
  // DOWN
  fill(find_color("YELLOW"));
  vertex(-sideLength,  sideLength, -sideLength);
  vertex( sideLength,  sideLength, -sideLength);
  vertex( sideLength,  sideLength,  sideLength);
  vertex(-sideLength,  sideLength,  sideLength);

  // 
  fill(find_color("ORANGE"));
  vertex( sideLength, -sideLength, -sideLength);
  vertex( sideLength, -sideLength,  sideLength);
  vertex( sideLength,  sideLength,  sideLength);
  vertex( sideLength,  sideLength, -sideLength);
  
  // 
  fill(find_color("RED"));
  vertex(-sideLength, -sideLength, -sideLength);
  vertex(-sideLength, -sideLength,  sideLength);
  vertex(-sideLength,  sideLength,  sideLength);
  vertex(-sideLength,  sideLength, -sideLength);

  // 
  fill(find_color("GREEN"));
  vertex( sideLength, -sideLength, -sideLength);
  vertex(-sideLength, -sideLength, -sideLength);
  vertex(-sideLength,  sideLength, -sideLength);
  vertex( sideLength,  sideLength, -sideLength);
  
  // 
  fill(find_color("BLUE"));
  vertex( sideLength, -sideLength,  sideLength);
  vertex(-sideLength, -sideLength,  sideLength);
  vertex(-sideLength,  sideLength,  sideLength);
  vertex( sideLength,  sideLength,  sideLength);

  endShape();
}