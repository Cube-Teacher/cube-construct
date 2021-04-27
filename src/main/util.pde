// void mouseDragged(){
//   rotateangleY += (mouseX-pmouseX)*1;
//   rotateangleX += (mouseY-pmouseY)*-1;
// }

float getDistance(float ratio){
	return sideLength*2*ratio;
}

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

void find_command(String commandstr){
  // print(commandstr.trim());
  if(commandstr.equals("green1_clockwise")){
    Cube.green1_clockwise = true;
  } else if(commandstr.equals("green2_clockwise")){
    Cube.green2_clockwise = true;
  } else if(commandstr.equals("green3_clockwise")){
    Cube.green3_clockwise = true;
  } else if(commandstr.equals("red1_clockwise")){
    Cube.red1_clockwise = true;
  } else if(commandstr.equals("red2_clockwise")){
    Cube.red2_clockwise = true;
  } else if(commandstr.equals("red3_clockwise")){
    Cube.red3_clockwise = true;
  } else if(commandstr.equals("yellow1_clockwise")){
    Cube.yellow1_clockwise = true;
  } else if(commandstr.equals("yellow2_clockwise")){
    Cube.yellow2_clockwise = true;
  } else if(commandstr.equals("yellow3_clockwise")){
    Cube.yellow3_clockwise = true;
  } else if(commandstr.equals("blue1_clockwise")){
    Cube.blue1_clockwise = true;
  } else if(commandstr.equals("blue2_clockwise")){
    Cube.blue2_clockwise = true;
  } else if(commandstr.equals("blue3_clockwise")){
    Cube.blue3_clockwise = true;
  } else if(commandstr.equals("orange1_clockwise")){
    Cube.orange1_clockwise = true;
  } else if(commandstr.equals("orange2_clockwise")){
    Cube.orange2_clockwise = true;
  } else if(commandstr.equals("orange3_clockwise")){
    Cube.orange3_clockwise = true;
  } else if(commandstr.equals("white1_clockwise")){
    Cube.white1_clockwise = true;
  } else if(commandstr.equals("white2_clockwise")){
    Cube.white2_clockwise = true;
  } else if(commandstr.equals("white3_clockwise")){
    Cube.white3_clockwise = true;
  }
}

void CubeSurface(float lineThickness, float len){
  beginShape(QUADS);

  strokeWeight(lineThickness);
  // TOP
  len /= 2;
  fill(find_color("WHITE"));
  vertex(-len, -len, -len);
  vertex( len, -len, -len);
  vertex( len, -len,  len);
  vertex(-len, -len,  len);
  
  // DOWN
  fill(find_color("YELLOW"));
  vertex(-len,  len, -len);
  vertex( len,  len, -len);
  vertex( len,  len,  len);
  vertex(-len,  len,  len);

  // 
  fill(find_color("ORANGE"));
  vertex( len, -len, -len);
  vertex( len, -len,  len);
  vertex( len,  len,  len);
  vertex( len,  len, -len);
  
  // 
  fill(find_color("RED"));
  vertex(-len, -len, -len);
  vertex(-len, -len,  len);
  vertex(-len,  len,  len);
  vertex(-len,  len, -len);

  // 
  fill(find_color("GREEN"));
  vertex( len, -len, -len);
  vertex(-len, -len, -len);
  vertex(-len,  len, -len);
  vertex( len,  len, -len);
  
  // 
  fill(find_color("BLUE"));
  vertex( len, -len,  len);
  vertex(-len, -len,  len);
  vertex(-len,  len,  len);
  vertex( len,  len,  len);

  strokeWeight(1);
  endShape();
}

void CubeLine(float lineThickness){
  beginShape(LINES);
  noFill();
  
  float oneThirdDistance = getDistance(1.0/3.0);
  float twoThirdDistance = getDistance(2.0/3.0);

  // WHITE
  strokeWeight(lineThickness);
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
  
  // reset line thickness
  strokeWeight(1);
  // end shape 

  endShape();
}