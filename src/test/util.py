command = [
    "back1_clockwise",
    "back2_clockwise",
    "back3_clockwise",
    "left1_clockwise",
    "left2_clockwise",
    "left3_clockwise",
    "down1_clockwise",
    "down2_clockwise",
    "down3_clockwise",
    "front1_clockwise",
    "front2_clockwise",
    "front3_clockwise",
    "right1_clockwise",
    "right2_clockwise",
    "right3_clockwise",
    "up1_clockwise",
    "up2_clockwise",
    "up3_clockwise",
    "back1_Counterclockwise",
    "back2_Counterclockwise",
    "back3_Counterclockwise",
    "left1_Counterclockwise",
    "left2_Counterclockwise",
    "left3_Counterclockwise",
    "down1_Counterclockwise",
    "down2_Counterclockwise",
    "down3_Counterclockwise",
    "front1_Counterclockwise",
    "front2_Counterclockwise",
    "front3_Counterclockwise",
    "right1_Counterclockwise",
    "right2_Counterclockwise",
    "right3_Counterclockwise",
    "up1_Counterclockwise",
    "up2_Counterclockwise",
    "up3_Counterclockwise",
    "up_right",
    "up_left",
    "up_back",
    "up_front",
    "up_fix_right",
    "up_fix_left"
]


def color_init(up, down, left, right, front, back):
    up_init(up)
    down_init(down)
    left_init(left)
    right_init(right)
    front_init(front)
    back_init(back)

def up_init(up):
    for i in range(9):
        up.append("WHITE")


def down_init(down):
    for i in range(9):
        down.append("YELLOW")


def left_init(left):
    for i in range(9):
        left.append("RED")


def right_init(right):
    for i in range(9):
        right.append("ORANGE")


def front_init(front):
    for i in range(9):
        front.append("BLUE")


def back_init(back):
    for i in range(9):
        back.append("GREEN")

def printcube(u,d,l,r,f,b):
    for i in range(3):
        print("                        ", end="")
        for j in range(3):
            print(("%8s") % (u[i*3+j]), end="")
        print()

    for i in range(3):
        print(("%8s") % (l[i]),end="")
    for i in range(3):
        print(("%8s") % (f[i]),end="")
    for i in range(3):
        print(("%8s") % (r[i]),end="")
    for i in range(3):
        print(("%8s") % (b[i]),end="")
    print()
    for i in range(3,6):
        print(("%8s") % (l[i]),end="")
    for i in range(3, 6):
        print(("%8s") % (f[i]), end="")
    for i in range(3, 6):
        print(("%8s") % (r[i]), end="")
    for i in range(3, 6):
        print(("%8s") % (b[i]), end="")

    print()
    for i in range(6,9):
        print(("%8s") % (l[i]), end="")
    for i in range(6, 9):
        print(("%8s") % (f[i]),end="")
    for i in range(6, 9):
        print(("%8s") % (r[i]), end="")
    for i in range(6, 9):
        print(("%8s") % (b[i]),end="")
    
    print("")

    for i in range(3):
        print("                        ", end="")
        for j in range(3):
            print(("%8s") % (d[i*3+j]), end="")
        print()


def printans(tmpup, tmpleft, tmpfront, tmpright, tmpback, tmpdown):
    for i in tmpup:
        print(i)
    for i in tmpleft:
        print(i)
    for i in tmpfront:
        print(i)
    for i in tmpright:
        print(i)
    for i in tmpback:
        print(i)
    for i in tmpdown:
        print(i)

# a would be covered by b
# b would be covered by c
# c would be covered by d
# a would be covered by a
def center_Rotate(a,b,c,d,idx1,idx2,type=0):
    tmpcolor = a.copy()
    steps = 1 
    if(idx2-idx1>3):
        # print(type)
        if(type==1):
            for m in range(idx1, idx2, 3):
                # print(m, " ", 6+(2-idx1)-(m-idx1))
                a[m] = b[m]
                b[m] = c[m]
                c[m] = d[6+(2-idx1)-(m-idx1)]
                d[6+(2-idx1)-(m-idx1)] = tmpcolor[m]
        else:
            for m in range(idx1, idx2, 3):
                # print(m, " ", 6+(2-idx1)-(m-idx1))
                a[m] = b[m]
                b[m] = c[6+(2-idx1)-(m-idx1)]
                c[6+(2-idx1)-(m-idx1)] = d[m]
                d[m] = tmpcolor[m]
    else:
        for m in range(idx1, idx2):
            a[m] = b[m]
            b[m] = c[m]
            c[m] = d[m]
            d[m] = tmpcolor[m]


def center_Rotate2(a,b,c,d,idx1,idx2):
    tmpcolor = a.copy()
    steps = int((idx2-idx1)/3+0.5)
    for m in range(0, 3):
        # print((2-m)*3+int(idx1/3), " ", idx1+m, " ", 2+3*(2-int((idx1)/3))-m, 2-int(idx1/3)+3*m)
        a[idx1+m]                = b[(2-m)*3+int(idx1/3)]
        b[(2-m)*3+int(idx1/3)]   = c[2+3*(2-int((idx1)/3))-m]
        c[2+3*(2-int((idx1)/3))-m] = d[2-int(idx1/3)+3*m]
        d[2-int(idx1/3)+3*m] = tmpcolor[idx1+m]


def center_Rotate3(a, b, c, d, idx1, idx2):
    tmpcolor = a.copy()
    steps = int((idx2-idx1)/3+0.5)
    for m in range(0, 3):
        # print((2-m)*3+int(idx1/3), " ", idx1+m, " ", 2 + 3*(2-int((idx1)/3))-m, 2-int(idx1/3)+3*m)
        a[idx1+m] = d[2-int(idx1/3)+3*m]
        d[2-int(idx1/3)+3*m] = c[2+3*(2-int((idx1)/3))-m]
        c[2+3*(2-int((idx1)/3))-m] = b[(2-m)*3+int(idx1/3)]
        b[(2-m)*3+int(idx1/3)] = tmpcolor[idx1+m]


def edge_Counterclockwise_Rotate(a):
    tmpcolor = a.copy()
    a[0] = tmpcolor[6]
    a[1] = tmpcolor[3]
    a[2] = tmpcolor[0]
    a[3] = tmpcolor[7]
    a[4] = tmpcolor[4]
    a[5] = tmpcolor[1]
    a[6] = tmpcolor[8]
    a[7] = tmpcolor[5]
    a[8] = tmpcolor[2]


def edge_clockwise_Rotate(a):
    tmpcolor = a.copy()
    a[0] = tmpcolor[2]
    a[1] = tmpcolor[5]
    a[2] = tmpcolor[8]
    a[3] = tmpcolor[1]
    a[4] = tmpcolor[4]
    a[5] = tmpcolor[7]
    a[6] = tmpcolor[0]
    a[7] = tmpcolor[3]
    a[8] = tmpcolor[6]
