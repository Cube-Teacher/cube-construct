
class boxTemplate{
  String  upFace         ;
  String  downFace       ;
  String  leftFace       ;
  String  rightFace      ;
  String  frontFace      ;
  String  backFace       ;
  float   len            ;
  float   lineThickness  ;

  boxTemplate(){
    upFace         = "WHITE";
    downFace       = "YELLOW";
    leftFace       = "ORANGE";
    rightFace      = "RED";
    frontFace      = "GREEN";
    backFace       = "BLUE";
    len            = sideLength/2;
    lineThickness  = 15;
  }

  void creatBox(){
    beginShape(QUADS);

    strokeWeight(this.lineThickness);
    len = this.len;

    // TOP
    fill(find_color(this.upFace));
    vertex(-len, -len, -len);
    vertex( len, -len, -len);
    vertex( len, -len,  len);
    vertex(-len, -len,  len);
    
    // DOWN
    fill(find_color(this.downFace));
    vertex(-len,  len, -len);
    vertex( len,  len, -len);
    vertex( len,  len,  len);
    vertex(-len,  len,  len);

    // 
    fill(find_color(this.leftFace));
    vertex( len, -len, -len);
    vertex( len, -len,  len);
    vertex( len,  len,  len);
    vertex( len,  len, -len);
    
    // 
    fill(find_color(this.rightFace));
    vertex(-len, -len, -len);
    vertex(-len, -len,  len);
    vertex(-len,  len,  len);
    vertex(-len,  len, -len);

    // 
    fill(find_color(this.frontFace));
    vertex( len, -len, -len);
    vertex(-len, -len, -len);
    vertex(-len,  len, -len);
    vertex( len,  len, -len);
    
    // 
    fill(find_color(this.backFace));
    vertex( len, -len,  len);
    vertex(-len, -len,  len);
    vertex(-len,  len,  len);
    vertex( len,  len,  len);

    strokeWeight(1);
    endShape();
  }
}

class RubikCube {
  float cubeLinethickness           ;
  float sideLinethickness           ;
  boxTemplate[][][] cubebox         ;
  boxTemplate[][][] prebox          ;

  boolean orange1_Counterclockwise  ;
  boolean orange2_Counterclockwise  ;
  boolean orange3_Counterclockwise  ;
  boolean red1_Counterclockwise     ;
  boolean red2_Counterclockwise     ;
  boolean red3_Counterclockwise     ;

  boolean green1_Counterclockwise   ;
  boolean green2_Counterclockwise   ;
  boolean green3_Counterclockwise   ;
  boolean blue1_Counterclockwise    ;
  boolean blue2_Counterclockwise    ;  
  boolean blue3_Counterclockwise    ;

  boolean white1_Counterclockwise   ;
  boolean white2_Counterclockwise   ;
  boolean white3_Counterclockwise   ;
  boolean yellow1_Counterclockwise  ;
  boolean yellow2_Counterclockwise  ;
  boolean yellow3_Counterclockwise  ;

  boolean orange1_clockwise  ;
  boolean orange2_clockwise  ;
  boolean orange3_clockwise  ;
  boolean red1_clockwise     ;
  boolean red2_clockwise     ;
  boolean red3_clockwise     ;

  boolean green1_clockwise   ;
  boolean green2_clockwise   ;
  boolean green3_clockwise   ;
  boolean blue1_clockwise    ;
  boolean blue2_clockwise    ;  
  boolean blue3_clockwise    ;

  boolean white1_clockwise   ;
  boolean white2_clockwise   ;
  boolean white3_clockwise   ;
  boolean yellow1_clockwise  ;
  boolean yellow2_clockwise  ;
  boolean yellow3_clockwise  ;

  float rotateAngle;

  RubikCube(float cubeLinethickness, float sideLinethickness){
    this.cubeLinethickness = cubeLinethickness;
    this.sideLinethickness = sideLinethickness;
    this.cubebox = new boxTemplate[3][3][3];
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        for(int k=0;k<3;k++){
          cubebox[i][j][k] = new boxTemplate();
        }
      }
    }
    
    this.prebox = new boxTemplate[3][3][3];
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        for(int k=0;k<3;k++){
          prebox[i][j][k] = new boxTemplate();
        }
      }
    }

    this.orange1_Counterclockwise = false ;
    this.orange2_Counterclockwise = false ;
    this.orange3_Counterclockwise = false ;
    this.red1_Counterclockwise    = false ;
    this.red2_Counterclockwise    = false ;
    this.red3_Counterclockwise    = false ;

    this.green1_Counterclockwise  = false ;
    this.green2_Counterclockwise  = false ;
    this.green3_Counterclockwise  = false ;
    this.blue1_Counterclockwise   = false ;
    this.blue2_Counterclockwise   = false ;  
    this.blue3_Counterclockwise   = false ;

    this.white1_Counterclockwise  = false ;
    this.white2_Counterclockwise  = false ;
    this.white3_Counterclockwise  = false ;
    this.yellow1_Counterclockwise = false ;
    this.yellow2_Counterclockwise = false ;
    this.yellow3_Counterclockwise = false ;

    this.orange1_clockwise = false ;
    this.orange2_clockwise = false ;
    this.orange3_clockwise = false ;
    this.red1_clockwise    = false ;
    this.red2_clockwise    = false ;
    this.red3_clockwise    = false ;

    this.green1_clockwise  = false ;
    this.green2_clockwise  = false ;
    this.green3_clockwise  = false ;
    this.blue1_clockwise   = false ;
    this.blue2_clockwise   = false ;  
    this.blue3_clockwise   = false ;

    this.white1_clockwise  = false ;
    this.white2_clockwise  = false ;
    this.white3_clockwise  = false ;
    this.yellow1_clockwise = false ;
    this.yellow2_clockwise = false ;
    this.yellow3_clockwise = false ;

    this.rotateAngle = 0.0;
  }
  
  void createSurface(float len){
    CubeSurface(this.cubeLinethickness, len);
  }

  void createSideline(){
    CubeLine(this.sideLinethickness);
  }

  void UpdateOrange3(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[0][m][n].upFace;
        this.cubebox[0][m][n].upFace    = this.cubebox[0][m][n].backFace;
        this.cubebox[0][m][n].backFace  = this.cubebox[0][m][n].downFace;
        this.cubebox[0][m][n].downFace  = this.cubebox[0][m][n].frontFace;
        this.cubebox[0][m][n].frontFace = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[0][m][n];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[0][n][m] = tmpColorArr[m*3+2-n];
      }
    }
  }

  void UpdateOrange2(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[0][m][n].upFace;
        this.cubebox[1][m][n].upFace    = this.cubebox[1][m][n].backFace;
        this.cubebox[1][m][n].backFace  = this.cubebox[1][m][n].downFace;
        this.cubebox[1][m][n].downFace  = this.cubebox[1][m][n].frontFace;
        this.cubebox[1][m][n].frontFace = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[1][m][n];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[1][n][m] = tmpColorArr[m*3+2-n];
      }
    }
  }

  void UpdateOrange1(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[2][m][n].upFace;
        this.cubebox[2][m][n].upFace    = this.cubebox[2][m][n].backFace;
        this.cubebox[2][m][n].backFace  = this.cubebox[2][m][n].downFace;
        this.cubebox[2][m][n].downFace  = this.cubebox[2][m][n].frontFace;
        this.cubebox[2][m][n].frontFace = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[2][m][n];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[2][n][m] = tmpColorArr[m*3+2-n];
      }
    }
  }

  void UpdateGreen1(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[m][n][0].upFace;
        this.cubebox[m][n][0].upFace    = this.cubebox[m][n][0].rightFace;
        this.cubebox[m][n][0].rightFace = this.cubebox[m][n][0].downFace;
        this.cubebox[m][n][0].downFace  = this.cubebox[m][n][0].leftFace;
        this.cubebox[m][n][0].leftFace  = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[m][n][0];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[n][m][0] = tmpColorArr[m*3+(2-n)];
      }
    }
  }

  void UpdateGreen2(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[m][n][1].upFace;
        this.cubebox[m][n][1].upFace    = this.cubebox[m][n][1].rightFace;
        this.cubebox[m][n][1].rightFace = this.cubebox[m][n][1].downFace;
        this.cubebox[m][n][1].downFace  = this.cubebox[m][n][1].leftFace;
        this.cubebox[m][n][1].leftFace  = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[m][n][1];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[n][m][1] = tmpColorArr[m*3+(2-n)];
      }
    }
  }

  void UpdateGreen3(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[m][n][2].upFace;
        this.cubebox[m][n][2].upFace    = this.cubebox[m][n][2].rightFace;
        this.cubebox[m][n][2].rightFace = this.cubebox[m][n][2].downFace;
        this.cubebox[m][n][2].downFace  = this.cubebox[m][n][2].leftFace;
        this.cubebox[m][n][2].leftFace  = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[m][n][2];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[n][m][2] = tmpColorArr[m*3+(2-n)];
      }
    }
  }

  void UpdateWhite1(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[n][0][m].leftFace;
        this.cubebox[n][0][m].leftFace    = this.cubebox[n][0][m].backFace;
        this.cubebox[n][0][m].backFace = this.cubebox[n][0][m].rightFace;
        this.cubebox[n][0][m].rightFace  = this.cubebox[n][0][m].frontFace;
        this.cubebox[n][0][m].frontFace  = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[n][0][m];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[m][0][n] = tmpColorArr[m*3+(2-n)];
      }
    }
  }

  void UpdateWhite2(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[n][1][m].leftFace;
        this.cubebox[n][1][m].leftFace    = this.cubebox[n][1][m].backFace;
        this.cubebox[n][1][m].backFace    = this.cubebox[n][1][m].rightFace;
        this.cubebox[n][1][m].rightFace   = this.cubebox[n][1][m].frontFace;
        this.cubebox[n][1][m].frontFace   = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[n][1][m];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[m][1][n] = tmpColorArr[m*3+(2-n)];
      }
    }
  }

  void UpdateWhite3(){
    boxTemplate [] tmpColorArr = new boxTemplate[9];
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        String tmpcolor = this.cubebox[n][2][m].leftFace;
        this.cubebox[n][2][m].leftFace    = this.cubebox[n][2][m].backFace;
        this.cubebox[n][2][m].backFace    = this.cubebox[n][2][m].rightFace;
        this.cubebox[n][2][m].rightFace   = this.cubebox[n][2][m].frontFace;
        this.cubebox[n][2][m].frontFace   = tmpcolor;
        tmpColorArr[m*3+n] = this.cubebox[n][2][m];
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        this.cubebox[m][2][n] = tmpColorArr[m*3+(2-n)];
      }
    }
  }

  void UpdateRed1(){this.UpdateOrange3();}
  void UpdateRed2(){this.UpdateOrange2();}
  void UpdateRed3(){this.UpdateOrange1();}

  void UpdateBlue1(){this.UpdateGreen3();}
  void UpdateBlue2(){this.UpdateGreen2();}
  void UpdateBlue3(){this.UpdateGreen1();}

  void UpdateYellow1(){this.UpdateWhite3();}
  void UpdateYellow2(){this.UpdateWhite2();}
  void UpdateYellow3(){this.UpdateWhite1();}
}
