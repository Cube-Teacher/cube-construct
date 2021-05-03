import sys

for j in range(50):
    ans_file = "../answer/"+str(j)+".txt"
    res_file = "../result/"+str(j)+".txt"
    ans_file = open(ans_file,"r")
    res_file = open(res_file,"r")
    ans = ans_file.read().splitlines()
    res = res_file.read().splitlines()
    ans = ans[0:53]
    res = res[0:53]
    print("test%02d" % (j) + ":", end=" ")
    if(ans==res):
        print("\033[1;32mAccept ✅️ \033[0m", end=" ")
    else:
        print("\033[1;31mWrong ❌️ \033[0m", end=" ")
    if(j % 5 == 0 and j > 1):
        print()
