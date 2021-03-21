class RubikCube {
  float cubeLinethickness;
  float sideLinethickness;
  
  RubikCube(float cubeLinethickness, float sideLinethickness){
    this.cubeLinethickness = cubeLinethickness;
    this.sideLinethickness = sideLinethickness;
  }
  
  void createSurface(float len){
    CubeSurface(this.cubeLinethickness, len);
  }

  void createSideline(){
    CubeLine(this.sideLinethickness);
  }
}
