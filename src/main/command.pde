class commandTemplate{

	String[] 	commandfile 	;
	String 		command				;
	boolean 	fileMutex			;
	boolean 	processMutex	;

	commandTemplate(){
		this.command 			= "";
		this.fileMutex 		= false;
		this.processMutex = true;
	}
    
	void enable(String commandstr){
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

	void disable(String commandstr){
		Cube.green1_clockwise 	= false;
		Cube.green2_clockwise 	= false;
		Cube.green3_clockwise 	= false;
		Cube.red1_clockwise 		= false;
		Cube.red2_clockwise 		= false;
		Cube.red3_clockwise 		= false;
		Cube.yellow1_clockwise 	= false;
		Cube.yellow2_clockwise 	= false;
		Cube.yellow3_clockwise 	= false;
		Cube.blue1_clockwise 		= false;
		Cube.blue2_clockwise 		= false;
		Cube.blue3_clockwise 		= false;
		Cube.orange1_clockwise 	= false;
		Cube.orange2_clockwise 	= false;
		Cube.orange3_clockwise 	= false;
		Cube.white1_clockwise 	= false;
		Cube.white2_clockwise 	= false;
		Cube.white3_clockwise 	= false;
	}

	void read(){
		this.commandfile = loadStrings("./command.txt");
		if(this.commandfile.length==0){
			this.fileMutex = false;
		} else {
			this.command = this.commandfile[0];
			this.fileMutex = true;
		}
	}

	void clear(){
		this.command = "";
		PrintWriter outputfile;
		outputfile = createWriter("./command.txt");
		for(int i=1;i<this.commandfile.length;i++){
			outputfile.println(commandfile[i]);
		}
		outputfile.flush();
		outputfile.close();
	}
}