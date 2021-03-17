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
float sideLength = 150;

int find_color(String cubeColor){
  if(cubeColor=="GREEN")        {return #009b48;}
  else if (cubeColor=="WHITE")  {return #ffffff;}
  else if (cubeColor=="RED")    {return #b71234;}
  else if (cubeColor=="YELLOW") {return #ffd500;}
  else if (cubeColor=="BLUE")   {return #0046ad;}
  else if (cubeColor=="ORANGE") {return #ff5800;}
  else if (cubeColor=="BLACK")  {return #000000;}
  return 0;
}

void draw(){
  background(255);
  translate(600, 480, 0);
  rotateX(radians(rotateangleX));
  rotateY(radians(rotateangleY));
  strokeWeight(10);

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

  strokeWeight(1);
  endShape();


  // Draw the Black line in every block of cube.

  beginShape(LINES);
  noFill();
  
  float oneThirdDistance = getDistance(1.0/3.0);
  float twoThirdDistance = getDistance(2.0/3.0);

  // WHITE
  strokeWeight(15);
  vertex(-sideLength+oneThirdDistance, -sideLength, -sideLength);
  vertex(-sideLength+oneThirdDistance, -sideLength,  sideLength);
  vertex(-sideLength+twoThirdDistance, -sideLength, -sideLength);
  vertex(-sideLength+twoThirdDistance, -sideLength,  sideLength);

  vertex(-sideLength, -sideLength, -sideLength+oneThirdDistance);
  vertex( sideLength, -sideLength, -sideLength+oneThirdDistance);
  vertex(-sideLength, -sideLength, -sideLength+twoThirdDistance);
  vertex( sideLength, -sideLength, -sideLength+twoThirdDistance);

  // YELLOW
  vertex(-sideLength+oneThirdDistance,  sideLength, -sideLength);
  vertex(-sideLength+oneThirdDistance,  sideLength,  sideLength);
  vertex(-sideLength+twoThirdDistance,  sideLength, -sideLength);
  vertex(-sideLength+twoThirdDistance,  sideLength,  sideLength);

  vertex(-sideLength,  sideLength, -sideLength+oneThirdDistance);
  vertex( sideLength,  sideLength, -sideLength+oneThirdDistance);
  vertex(-sideLength,  sideLength, -sideLength+twoThirdDistance);
  vertex( sideLength,  sideLength, -sideLength+twoThirdDistance);
  
  // RED 
  vertex(-sideLength, -sideLength+oneThirdDistance, -sideLength);
  vertex(-sideLength, -sideLength+oneThirdDistance,  sideLength);
  vertex(-sideLength, -sideLength+twoThirdDistance, -sideLength);
  vertex(-sideLength, -sideLength+twoThirdDistance,  sideLength);

  vertex(-sideLength, -sideLength, -sideLength+oneThirdDistance);
  vertex(-sideLength,  sideLength, -sideLength+oneThirdDistance);
  vertex(-sideLength, -sideLength, -sideLength+twoThirdDistance);
  vertex(-sideLength,  sideLength, -sideLength+twoThirdDistance);

  // GREEN
  vertex( sideLength, -sideLength+oneThirdDistance, -sideLength);
  vertex(-sideLength, -sideLength+oneThirdDistance, -sideLength);
  vertex( sideLength, -sideLength+twoThirdDistance, -sideLength);
  vertex(-sideLength, -sideLength+twoThirdDistance, -sideLength);

  vertex(-sideLength+oneThirdDistance, -sideLength, -sideLength);
  vertex(-sideLength+oneThirdDistance,  sideLength, -sideLength);
  vertex(-sideLength+twoThirdDistance, -sideLength, -sideLength);
  vertex(-sideLength+twoThirdDistance,  sideLength, -sideLength);

   // ORANGE
  vertex( sideLength, -sideLength+oneThirdDistance, -sideLength);
  vertex( sideLength, -sideLength+oneThirdDistance,  sideLength);
  vertex( sideLength, -sideLength+twoThirdDistance, -sideLength);
  vertex( sideLength, -sideLength+twoThirdDistance,  sideLength);

  vertex( sideLength, -sideLength, -sideLength+oneThirdDistance);
  vertex( sideLength,  sideLength, -sideLength+oneThirdDistance);
  vertex( sideLength, -sideLength, -sideLength+twoThirdDistance);
  vertex( sideLength,  sideLength, -sideLength+twoThirdDistance);
  
  // BLUE
  vertex( sideLength, -sideLength+oneThirdDistance,  sideLength);
  vertex(-sideLength, -sideLength+oneThirdDistance,  sideLength);
  vertex( sideLength, -sideLength+twoThirdDistance,  sideLength);
  vertex(-sideLength, -sideLength+twoThirdDistance,  sideLength);

  vertex(-sideLength+oneThirdDistance, -sideLength,  sideLength);
  vertex(-sideLength+oneThirdDistance,  sideLength,  sideLength);
  vertex(-sideLength+twoThirdDistance, -sideLength,  sideLength);
  vertex(-sideLength+twoThirdDistance,  sideLength,  sideLength);
  strokeWeight(1);
  
  endShape();
}