void mouseDragged(){
  rotateangleY += (mouseX-pmouseX)*1;
  rotateangleX += (mouseY-pmouseY)*-1;
}

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

void CubeSurface(float lineThickness){
  beginShape(QUADS);

  strokeWeight(lineThickness);
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