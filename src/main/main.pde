import peasy.*;
import java.util.Scanner;
import java.io.IOException;

void settings() {
  System.setProperty("jogl.disable.openglcore", "true");
  size(1200, 960, P3D);
}

float sideLength = 100;

RubikCube Cube;
debugTemplate Debug;
commandTemplate Command;
PeasyCam cam;

void setup(){
  noFill();
  Cube = new RubikCube(10,15);
  
  //  to init PeasyCam then we can easily to use mouse to rotate or move.
  cam = new PeasyCam(this,sideLength*3.0/2.0,sideLength*3.0/2,sideLength*3.0/2,1000);
  cam.setMinimumDistance(1000);
  cam.setMaximumDistance(2000);

  Command = new commandTemplate();
  Debug = new debugTemplate();

  Cube.init();

  // command = loadStrings("./command.txt");
  // commandmaxcnt = command.length;
  // for(int i=0;i<command.length;i++){
  //   print("|",trim(command[i]),"|");
  // }
}

void draw(){

  Command.read();

  background(255);

  line(-700, 0, 0, 700, 0, 0);  
  line(0, -700, 0, 0, 700, 0);  
  line(0, 0, -700, 0, 0, 700);  

  textSize(25);
  text("white up",200,-200,200); // UP
  text("orange right",500,200,200); // right
  text("yellow down",200,400,200); // down
  text("red left",-300,200,200);   // left
  text("blue front",150,200,500);   // front
  text("green back",150,200,-300); // back

  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      for(int k=0;k<3;k++){
        pushMatrix();

        if(Command.fileMutex == true){
          if(Command.processMutex==true){
            Command.enable(Command.command);
            Command.processMutex = false;
          }
        }

        // i==0 Green1 Blue3
        // i==1 Green2 Blue2
        // i==2 Green3 Blue1        
        if((i==0 && Cube.back1_clockwise)   || (i==1 && Cube.back2_clockwise)   || (i==2 && Cube.back3_clockwise) || 
           (i==0 && Cube.front3_clockwise)  || (i==1 && Cube.front2_clockwise)  || (i==2 && Cube.front1_clockwise) ){
          translate(150-(150*sqrt(2)*sin(radians(45-Cube.rotateAngle))),150-(150*sqrt(2)*cos(radians(45-Cube.rotateAngle))),0);
          rotateZ(radians(Cube.rotateAngle));
        }

        if((i==0 && Cube.back1_Counterclockwise)  || (i==1 && Cube.back2_Counterclockwise)  || (i==2 && Cube.back3_Counterclockwise) || 
           (i==0 && Cube.front3_Counterclockwise) || (i==1 && Cube.front2_Counterclockwise) || (i==2 && Cube.front1_Counterclockwise) ){
          translate(150-(150*sqrt(2)*cos(radians(-45+Cube.rotateAngle))),150+(150*sqrt(2)*sin(radians(-45+Cube.rotateAngle))),0);
          rotateZ(radians(-Cube.rotateAngle));
        }

        // j==0 White1 Yellow3
        // j==1 White2 Yellow2
        // j==2 White3 Yellow1
        if((j==0 && Cube.up1_clockwise)   || (j==1 && Cube.up2_clockwise)   || (j==2 && Cube.up3_clockwise) || 
           (j==0 && Cube.down3_clockwise) || (j==1 && Cube.down2_clockwise) || (j==2 && Cube.down1_clockwise)){
          translate(150-(150*sqrt(2)*cos(radians(45-Cube.rotateAngle))),0,150-(150*sqrt(2)*sin(radians(45-Cube.rotateAngle))));
          rotateY(radians(Cube.rotateAngle));
        }

        if((j==0 && Cube.up1_Counterclockwise)   || (j==1 && Cube.up2_Counterclockwise)   || (j==2 && Cube.up3_Counterclockwise) || 
           (j==0 && Cube.down3_Counterclockwise) || (j==1 && Cube.down2_Counterclockwise) || (j==2 && Cube.down1_Counterclockwise)){
          translate(150+(150*sqrt(2)*sin(radians(-45+Cube.rotateAngle))),0,150-(150*sqrt(2)*cos(radians(-45+Cube.rotateAngle))));
          rotateY(radians(-Cube.rotateAngle));
        }

        // k==0 Orange3 Red1
        // k==1 Orange2 Red2
        // k==2 Orange1 Red3
        if((k==0 && Cube.right3_clockwise)  || (k==1 && Cube.right2_clockwise) || (k==2 && Cube.right1_clockwise) ||
           (k==0 && Cube.left1_clockwise)   || (k==1 && Cube.left2_clockwise)  || (k==2 && Cube.left3_clockwise)){
          translate(0,150-(150*sqrt(2)*sin(radians(45-Cube.rotateAngle))),150-(150*sqrt(2)*cos(radians(45-Cube.rotateAngle))));
          rotateX(radians(Cube.rotateAngle));
        }

        if((k==0 && Cube.right3_Counterclockwise) || (k==1 && Cube.right2_Counterclockwise) || (k==2 && Cube.right1_Counterclockwise) ||
           (k==0 && Cube.left1_Counterclockwise)  || (k==1 && Cube.left2_Counterclockwise)  || (k==2 && Cube.left3_Counterclockwise)){
          translate(0,150-(150*sqrt(2)*cos(radians(-45+Cube.rotateAngle))),150+(150*sqrt(2)*sin(radians(-45+Cube.rotateAngle))));
          rotateX(radians(-Cube.rotateAngle));
        }
        
        translate(sideLength/2+k*sideLength, sideLength/2+j*sideLength, sideLength/2+i*sideLength);
        Cube.cubebox[k][j][i].creatBox();
        popMatrix();
      }
    }
  }

  if(Cube.right1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_right1();
      Cube.rotateAngle = 0.0;
      Cube.right1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_right2();
      Cube.rotateAngle = 0.0;
      Cube.right2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_right3();
      Cube.rotateAngle = 0.0;
      Cube.right3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.back1_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateback1();
      Cube.rotateAngle = 0.0;
      Cube.back1_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.back2_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateback2();
      Cube.rotateAngle = 0.0;
      Cube.back2_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.back3_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateback3();
      Cube.rotateAngle = 0.0;
      Cube.back3_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.back1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_back1();
      Cube.rotateAngle = 0.0;
      Cube.back1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.back2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_back2();
      Cube.rotateAngle = 0.0;
      Cube.back2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.back3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_back3();
      Cube.rotateAngle = 0.0;
      Cube.back3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.up1_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateup1();
      Cube.rotateAngle = 0.0;
      Cube.up1_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.up2_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateup2();
      Cube.rotateAngle = 0.0;
      Cube.up2_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.up3_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateup3();
      Cube.rotateAngle = 0.0;
      Cube.up3_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.up1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_up1();
      Cube.rotateAngle = 0.0;
      Cube.up1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.up2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_up2();
      Cube.rotateAngle = 0.0;
      Cube.up2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.up3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_up3();
      Cube.rotateAngle = 0.0;
      Cube.up3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.left3_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateleft3();
      Cube.rotateAngle = 0.0;
      Cube.left3_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.left2_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateleft2();
      Cube.rotateAngle = 0.0;
      Cube.left2_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.left1_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateleft1();
      Cube.rotateAngle = 0.0;
      Cube.left1_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }
  
  if(Cube.left1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_left1();
      Cube.rotateAngle = 0.0;
      Cube.left1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.left2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_left2();
      Cube.rotateAngle = 0.0;
      Cube.left2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.left3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_left3();
      Cube.rotateAngle = 0.0;
      Cube.left3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right1_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateright1();
      Cube.rotateAngle = 0.0;
      Cube.right1_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right2_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateright2();
      Cube.rotateAngle = 0.0;
      Cube.right2_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }
  
  if(Cube.right3_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updateright3();
      Cube.rotateAngle = 0.0;
      Cube.right3_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_right3();
      Cube.rotateAngle = 0.0;
      Cube.right3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_right2();
      Cube.rotateAngle = 0.0;
      Cube.right2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.right1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_right1();
      Cube.rotateAngle = 0.0;
      Cube.right1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.front3_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updatefront3();
      Cube.rotateAngle = 0.0;
      Cube.front3_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.front2_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updatefront2();
      Cube.rotateAngle = 0.0;
      Cube.front2_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.front1_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updatefront1();
      Cube.rotateAngle = 0.0;
      Cube.front1_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.front1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_front1();
      Cube.rotateAngle = 0.0;
      Cube.front1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.front2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_front2();
      Cube.rotateAngle = 0.0;
      Cube.front2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.front3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_front3();
      Cube.rotateAngle = 0.0;
      Cube.front3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.down1_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updatedown1();
      Cube.rotateAngle = 0.0;
      Cube.down1_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }
  
  if(Cube.down2_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updatedown2();
      Cube.rotateAngle = 0.0;
      Cube.down2_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.down3_clockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Updatedown3();
      Cube.rotateAngle = 0.0;
      Cube.down3_clockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.down1_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_down1();
      Cube.rotateAngle = 0.0;
      Cube.down1_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.down2_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_down2();
      Cube.rotateAngle = 0.0;
      Cube.down2_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }

  if(Cube.down3_Counterclockwise){
    Cube.rotateAngle += Cube.rotateSpeed;
    if(Cube.rotateAngle>90){
      Cube.Update_Counterclockwise_down3();
      Cube.rotateAngle = 0.0;
      Cube.down3_Counterclockwise = false;
      Command.processMutex = true;
      Command.clear();
    }
  }
}


