// The file contain functions or classes used for debug

// used for printing current six face color of Cube
void printcolor(){
  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      for(int k=0;k<3;k++){
        print(i,j,k, " ");
        print(Cube.cubebox[i][j][k].upFace);
        print(" ");
        print(Cube.cubebox[i][j][k].downFace);
        print(" ");
        print(Cube.cubebox[i][j][k].leftFace);
        print(" ");
        print(Cube.cubebox[i][j][k].rightFace);
        print(" ");
        print(Cube.cubebox[i][j][k].frontFace);
        print(" ");
        print(Cube.cubebox[i][j][k].backFace);
        print("\n");
      }
    }
  }
}