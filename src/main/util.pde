void mouseDragged(){
  rotateangleY += (mouseX-pmouseX)*1;
  rotateangleX += (mouseY-pmouseY)*-1;
}

float getDistance(float ratio){
	return sideLength*2*ratio;
}