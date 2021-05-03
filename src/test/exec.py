import sys
import os

commandfile = "../main/command.txt"
for j in range(50):
    filename = "../testcase/" + str(j) + ".txt "
    resultname = "../result/" + str(j) + ".txt "
    os.system("cp " + str(filename) + commandfile)
    os.system("~/./pjava.sh ~/project/cube/src/main > " + resultname)
    print("🚀️ Answering Test%02d Done" % (j), end=" ")
    if(j % 5 == 0 and j > 1):
        print()
