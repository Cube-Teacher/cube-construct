import random
import sys
from util import *

sys_original_stdout = sys.stdout
number_to_test = 100

os.system("mkdir ../result")
os.system("mkdir ../testcase")
os.system("mkdir ../result")

for j in range(100):
	file_name = "../testcase/"+str(j)+".txt"
	with open(file_name, "w+") as file_stdout:
			sys.stdout = file_stdout
			for i in range(number_to_test):
					print(command[random.randint(0,35)])
			sys.stdout = sys_original_stdout
			print("🚧️ Gen Test%02d Done"%(j),end=" ")
			if(j%6==0 and j>1):print()
