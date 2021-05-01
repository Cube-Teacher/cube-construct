// The file contain functions or classes used for debug

class debugTemplate{

  void printcommand(){
    print(Command.command,"\n");
  }

  // used for printing current six face color of Cube
  void printcolor(){
    // print uppper color
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        println(Cube.cubebox[n][0][m].upFace);
      }
    }

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        println(Cube.cubebox[0][m][n].leftFace);
      }
    }

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        println(Cube.cubebox[n][m][2].frontFace);
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        println(Cube.cubebox[2][m][n].rightFace);
      }
    }

    for(int m=0;m<3;m++){
      for(int n=2;n>=0;n--){
        println(Cube.cubebox[n][m][0].backFace);
      }
    }

    for(int m=2;m>=0;m--){
      for(int n=0;n<3;n++){
        println(Cube.cubebox[n][2][m].downFace);
      }
    }
  }

  void formatprintcolor(){
    String[] tmpcolor = new String[54];

    int index = 0;
    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        tmpcolor[index++] = Cube.cubebox[n][0][m].upFace;
      }
    }

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        tmpcolor[m*12+9+n] = Cube.cubebox[0][n][m].leftFace;
      }
    }

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        tmpcolor[m*12+12+n] = Cube.cubebox[n][m][2].frontFace;
      }
    }

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        tmpcolor[m*12+15+n] = Cube.cubebox[2][n][m].rightFace;
      }
    }

    for(int m=0;m<3;m++){
      for(int n=0;n<3;n++){
        tmpcolor[m*12+18+n] = Cube.cubebox[n][m][0].backFace;
      }
    }

    for(int m=2;m>=0;m--){
      for(int n=0;n<3;n++){
        tmpcolor[m*3+45+n] = Cube.cubebox[n][2][m].downFace;
      }
    }

    for(int m=0;m<3;m++){
      print("                           ");
      print("────────────────────────────","\n");
      print("                           ");
      for(int n=0;n<3;n++){
        print("|");
        System.out.printf("%-8s",tmpcolor[m*3+n]);
      }
      print("|","\n");
    }

    for(int m=0;m<3;m++){
      print("───────────────────────────────────────────────────────────────────────────────────────────────────────────","\n");
      for(int n=9;n<=20;n++){
        print("|");
        System.out.printf("%-8s",tmpcolor[n+12*m]);
      }
      print("\n");
    }

    for(int m=0;m<3;m++){
      print("                           ");
      print("────────────────────────────","\n");
      print("                           ");
      for(int n=0;n<3;n++){
        print("|");
        System.out.printf("%-8s",tmpcolor[m*3+n+45]);
      }
      print("|","\n");
    }
  }
}

