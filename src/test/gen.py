import random
import sys
import os
from util import *

sys_original_stdout = sys.stdout
number_to_test = 200

os.system("mkdir ../result")
os.system("mkdir ../testcase")
os.system("mkdir ../answer")

for j in range(50):
	file_name = "../testcase/"+str(j)+".txt"
	with open(file_name, "w+") as file_stdout:
			sys.stdout = file_stdout
			for i in range(number_to_test):
					print(command[random.randint(0,41)])
			sys.stdout = sys_original_stdout
			print("🚧️ Gen Test%02d Done"%(j),end=" ")
			if(j%6==0 and j>1):print()
