from util import *
import sys

up 		= []
down 	= []
left 	= []
right = []
front = []
back 	= []

color_init(up, down, left, right, front, back)

for j in range(50):
	file_name = "../testcase/"+str(j)+".txt"
	tmpup 		= up.copy()
	tmpdown = down.copy()
	tmpleft = left.copy()
	tmpright 	= right.copy()
	tmpfront = front.copy()
	tmpback = back.copy()
	with open(file_name, "r") as file_stdout:
		for command in file_stdout.read().splitlines():
			command = str(command)
			if(command == "back1_clockwise" or command == "front3_clockwise"):
				edge_clockwise_Rotate(tmpback)
				center_Rotate2(tmpup, tmpleft, tmpdown, tmpright, 0, 3)
				# 以白色面為準 idx1 為白色面 idx
			elif(command == "back1_Counterclockwise" or command == "front3_Counterclockwise"):
				edge_Counterclockwise_Rotate(tmpback)
				center_Rotate3(tmpup, tmpleft, tmpdown, tmpright, 0, 3)

			elif(command == "back2_clockwise" or command == "front2_clockwise"):
				center_Rotate2(tmpup, tmpleft, tmpdown, tmpright, 3, 6)
			elif(command == "back2_Counterclockwise" or command == "front2_Counterclockwise"):
				center_Rotate3(tmpup, tmpleft, tmpdown, tmpright, 3, 6)

			elif(command == "back3_clockwise" or command == "front1_clockwise"): 
				edge_Counterclockwise_Rotate(tmpfront)
				center_Rotate2(tmpup, tmpleft, tmpdown, tmpright, 6, 9)
			elif(command == "back3_Counterclockwise" or command == "front1_Counterclockwise"):
				edge_clockwise_Rotate(tmpfront)
				center_Rotate3(tmpup, tmpleft, tmpdown, tmpright, 6, 9)

			elif(command == "left3_clockwise" or command == "right1_clockwise"):
				edge_Counterclockwise_Rotate(tmpright)
				center_Rotate(tmpup, tmpfront, tmpdown, tmpback, 2, 9, 1)
			elif(command == "left3_Counterclockwise" or command == "right1_Counterclockwise"):
				edge_clockwise_Rotate(tmpright)
				center_Rotate(tmpfront, tmpup, tmpback, tmpdown, 2, 9, 2)

			elif(command == "left2_clockwise" or command == "right2_clockwise"):
				center_Rotate(tmpup, tmpfront, tmpdown, tmpback, 1, 8, 1)
			elif(command == "left2_Counterclockwise" or command == "right2_Counterclockwise"):
				center_Rotate(tmpfront, tmpup, tmpback, tmpdown, 1, 8, 2)

			elif(command == "left1_clockwise" or command == "right3_clockwise"):
				edge_clockwise_Rotate(tmpleft)
				center_Rotate(tmpup, tmpfront, tmpdown, tmpback, 0, 7, 1)
			elif(command == "left1_Counterclockwise" or command == "right3_Counterclockwise"):
				edge_Counterclockwise_Rotate(tmpleft)
				center_Rotate(tmpfront, tmpup, tmpback, tmpdown, 0, 7, 2)

			# center_Rotate: a,b,c,d   a=b b=c c=d d=a
			elif(command == "down1_clockwise" or command == "up3_clockwise"):
				edge_Counterclockwise_Rotate(tmpdown)
				center_Rotate(tmpleft, tmpback, tmpright, tmpfront, 6, 9)
			elif(command == "down1_Counterclockwise" or command == "up3_Counterclockwise"):
				edge_clockwise_Rotate(tmpdown)
				center_Rotate(tmpleft, tmpfront, tmpright, tmpback, 6, 9)

			elif(command == "down2_clockwise" or command == "up2_clockwise"):
				center_Rotate(tmpleft, tmpback, tmpright, tmpfront, 3, 6)
			elif(command == "down2_Counterclockwise" or command == "up2_Counterclockwise"):
				center_Rotate(tmpleft, tmpfront, tmpright, tmpback, 3, 6)

			elif(command == "down3_clockwise" or command == "up1_clockwise"):
				edge_clockwise_Rotate(tmpup)
				center_Rotate(tmpleft, tmpback, tmpright, tmpfront, 0, 3)
			elif(command == "down3_Counterclockwise" or command == "up1_Counterclockwise"):
				edge_Counterclockwise_Rotate(tmpup)
				center_Rotate(tmpleft, tmpfront, tmpright, tmpback, 0, 3)
			
			elif(command == "up_right"):
				edge_clockwise_Rotate(tmpback)
				center_Rotate2(tmpup, tmpleft, tmpdown, tmpright, 0, 3) 

				center_Rotate2(tmpup, tmpleft, tmpdown, tmpright, 3, 6)

				edge_Counterclockwise_Rotate(tmpfront)
				center_Rotate2(tmpup, tmpleft, tmpdown, tmpright, 6, 9)
			elif(command == "up_left"):
				edge_Counterclockwise_Rotate(tmpback)
				center_Rotate3(tmpup, tmpleft, tmpdown, tmpright, 0, 3) 

				center_Rotate3(tmpup, tmpleft, tmpdown, tmpright, 3, 6)

				edge_clockwise_Rotate(tmpfront)
				center_Rotate3(tmpup, tmpleft, tmpdown, tmpright, 6, 9)
			elif(command == "up_back"):
				edge_clockwise_Rotate(tmpleft)
				center_Rotate(tmpup, tmpfront, tmpdown, tmpback, 0, 7, 1)

				center_Rotate(tmpup, tmpfront, tmpdown, tmpback, 1, 8, 1)

				edge_Counterclockwise_Rotate(tmpright)
				center_Rotate(tmpup, tmpfront, tmpdown, tmpback, 2, 9, 1)
			elif(command == "up_front"):
				edge_clockwise_Rotate(tmpright)
				center_Rotate(tmpfront, tmpup, tmpback, tmpdown, 2, 9, 2)

				center_Rotate(tmpfront, tmpup, tmpback, tmpdown, 1, 8, 2)

				edge_Counterclockwise_Rotate(tmpleft)
				center_Rotate(tmpfront, tmpup, tmpback, tmpdown, 0, 7, 2)
			elif(command == "up_fix_right"):
				edge_clockwise_Rotate(tmpdown)
				center_Rotate(tmpleft, tmpfront, tmpright, tmpback, 6, 9)

				center_Rotate(tmpleft, tmpfront, tmpright, tmpback, 3, 6)

				edge_Counterclockwise_Rotate(tmpup)
				center_Rotate(tmpleft, tmpfront, tmpright, tmpback, 0, 3)
			elif(command == "up_fix_left"):
				edge_Counterclockwise_Rotate(tmpdown)
				center_Rotate(tmpleft, tmpback, tmpright, tmpfront, 6, 9)

				center_Rotate(tmpleft, tmpback, tmpright, tmpfront, 3, 6)

				edge_clockwise_Rotate(tmpup)
				center_Rotate(tmpleft, tmpback, tmpright, tmpfront, 0, 3)

			printcube(tmpup, tmpdown, tmpleft, tmpright, tmpfront, tmpback)
			print()
	file_stdout.close()

	file_name = "../answer/"+str(j)+".txt"
	sys_original_stdout = sys.stdout
	with open(file_name, "w+") as file_stdout:
		sys.stdout = file_stdout
		printans(tmpup, tmpleft, tmpfront, tmpright, tmpback, tmpdown)
		sys.stdout = sys_original_stdout
	file_stdout.close()
	print("🤖️ Solving Test%02d Done" % (j), end=" ")
	if(j % 5 == 0 and j > 1): print()
