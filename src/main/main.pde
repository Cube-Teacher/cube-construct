import peasy.*;

void settings() {
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 960, P3D);
}

float sideLength = 100;

RubikCube Cube;
PeasyCam cam;

BufferedReader reader;
String line;
String[] command;
int commandmaxcnt = 0;
int commandcnt = 0;

void setup(){
  noFill();
  Cube = new RubikCube(10,15);
  
  //  to init PeasyCam then we can easily to use mouse to rotate or move.
  cam = new PeasyCam(this,sideLength*3.0/2.0,sideLength*3.0/2,sideLength*3.0/2,1000);
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(2000);

  command = loadStrings("./command.txt");
  commandmaxcnt = command.length;
  // for(int i=0;i<command.length;i++){
  //   print("|",trim(command[i]),"|");
  // }
}


boolean mutex = true;

void draw(){

  background(255);

  line(-700, 0, 0, 700, 0, 0);  
  line(0, -700, 0, 0, 700, 0);  
  line(0, 0, -700, 0, 0, 700);  

  textSize(25);
  text("white",200,-200,200);
  text("orange",500,200,200);
  text("yellow",200,400,200);
  text("red",-300,200,200);
  text("blue",150,200,500);
  text("green",150,200,-300);

  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      for(int k=0;k<3;k++){
        pushMatrix();

        if(commandcnt<commandmaxcnt && mutex){
          find_command(command[commandcnt]);
          ++commandcnt;
          mutex = false;
        }

        // i==0 Green1 Blue3
        // i==1 Green2 Blue2
        // i==2 Green3 Blue1        
        if((i==0 && Cube.green1_clockwise) || (i==1 && Cube.green2_clockwise) || (i==2 && Cube.green3_clockwise) || 
           (i==0 && Cube.blue3_clockwise)  || (i==1 && Cube.blue2_clockwise)  || (i==2 && Cube.blue1_clockwise) ){
          translate(150-(150*sqrt(2)*sin(radians(45-Cube.rotateAngle))),150-(150*sqrt(2)*cos(radians(45-Cube.rotateAngle))),0);
          rotateZ(radians(Cube.rotateAngle));
        }

        // j==0 White1 Yellow3
        // j==1 White2 Yellow2
        // j==2 White3 Yellow1
        if((j==0 && Cube.white1_clockwise)  || (j==1 && Cube.white2_clockwise)  || (j==2 && Cube.white3_clockwise) || 
           (j==0 && Cube.yellow3_clockwise) || (j==1 && Cube.yellow2_clockwise) || (j==2 && Cube.yellow1_clockwise)){
          translate(150-(150*sqrt(2)*cos(radians(45-Cube.rotateAngle))),0,150-(150*sqrt(2)*sin(radians(45-Cube.rotateAngle))));
          rotateY(radians(Cube.rotateAngle));
        }

        // k==0 Orange3 Red1
        // k==1 Orange2 Red2
        // k==2 Orange1 Red3
        if((k==0 && Cube.orange3_clockwise) || (k==1 && Cube.orange2_clockwise) || (k==2 && Cube.orange1_clockwise) ||
           (k==0 && Cube.red1_clockwise)    || (k==1 && Cube.red2_clockwise)    || (k==2 && Cube.red3_clockwise)){
          translate(0,150-(150*sqrt(2)*sin(radians(45-Cube.rotateAngle))),150-(150*sqrt(2)*cos(radians(45-Cube.rotateAngle))));
          rotateX(radians(Cube.rotateAngle));
        }
        
        translate(sideLength/2+k*sideLength, sideLength/2+j*sideLength, sideLength/2+i*sideLength);
        Cube.cubebox[k][j][i].creatBox();
        popMatrix();
      }
    }
  }

  if(Cube.green1_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateGreen1();
      Cube.rotateAngle = 0.0;
      Cube.green1_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.green2_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateGreen2();
      Cube.rotateAngle = 0.0;
      Cube.green2_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.green3_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateGreen3();
      Cube.rotateAngle = 0.0;
      Cube.green3_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.white1_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateWhite1();
      Cube.rotateAngle = 0.0;
      Cube.white1_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.white2_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateWhite2 ();
      Cube.rotateAngle = 0.0;
      Cube.white2_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.white3_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateWhite3();
      Cube.rotateAngle = 0.0;
      Cube.white3_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.red3_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateRed3();
      Cube.rotateAngle = 0.0;
      Cube.red3_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.red2_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateRed2();
      Cube.rotateAngle = 0.0;
      Cube.red2_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.red1_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateRed1();
      Cube.rotateAngle = 0.0;
      Cube.red1_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.orange1_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateOrange1();
      Cube.rotateAngle = 0.0;
      Cube.orange1_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.orange2_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateOrange2();
      Cube.rotateAngle = 0.0;
      Cube.orange2_clockwise = false;
      mutex = true;
    }
  }
  
  if(Cube.orange3_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateOrange3();
      Cube.rotateAngle = 0.0;
      Cube.orange3_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.blue3_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateBlue3();
      Cube.rotateAngle = 0.0;
      Cube.blue3_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.blue2_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateBlue2();
      Cube.rotateAngle = 0.0;
      Cube.blue2_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.blue1_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateBlue1();
      Cube.rotateAngle = 0.0;
      Cube.blue1_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.yellow1_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateYellow1();
      Cube.rotateAngle = 0.0;
      Cube.yellow1_clockwise = false;
      mutex = true;
    }
  }
  
  if(Cube.yellow2_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateYellow2();
      Cube.rotateAngle = 0.0;
      Cube.yellow2_clockwise = false;
      mutex = true;
    }
  }

  if(Cube.yellow3_clockwise){
    Cube.rotateAngle += 1;
    if(Cube.rotateAngle>90){
      Cube.UpdateYellow3();
      Cube.rotateAngle = 0.0;
      Cube.yellow3_clockwise = false;
      mutex = true;
    }
  }
}


