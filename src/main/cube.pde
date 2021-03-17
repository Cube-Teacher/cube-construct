class RubikCube {
  float cubeLinethickness;
  float sideLinethickness;
  
  RubikCube(float cubeLinethickness, float sideLinethickness){
    this.cubeLinethickness = cubeLinethickness;
    this.sideLinethickness = sideLinethickness;
  }
  
  void createSurface(){
    CubeSurface(this.cubeLinethickness);
  }

  void createSideline(){
    CubeLine(this.sideLinethickness);
  }
}
