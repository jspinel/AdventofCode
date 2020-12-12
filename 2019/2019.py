#! /usr/bin/env python3

import math

def read_in(input):
    with open(input) as fh:  
        return [line.strip() for line in fh]

def day1():
    modules = read_in("d1p1.txt")
    #modules = [100756]
    sum = 0
    for m in modules:
        sum += (math.floor(int(m)/3)-2)
    print(sum)
    print("part 2")
    sum = 0
    for m in modules:
        s = (math.floor(int(m)/3)-2)
        fuel = s
        while fuel > 0:
            fuel = (math.floor(fuel/3)-2)
            if fuel > 0:
                s += fuel
        sum += s
    print(sum)

def day2():
    code = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,5,19,23,1,6,23,27,1,27,
            10,31,1,31,5,35,2,10,35,39,1,9,39,43,1,43,5,47,1,47,6,51,2,51,6,55,
            1,13,55,59,2,6,59,63,1,63,5,67,2,10,67,71,1,9,71,75,1,75,13,79,1,
            10,79,83,2,83,13,87,1,87,6,91,1,5,91,95,2,95,9,99,1,5,99,103,1,103,
            6,107,2,107,13,111,1,111,10,115,2,10,115,119,1,9,119,123,1,123,9,
            127,1,13,127,131,2,10,131,135,1,135,5,139,1,2,139,143,1,143,5,0,99,
            2,0,14,0]
    k = 0
    while k < len(code):
        op = code[k]
        i1 = code[k+1]
        i2 = code[k+2]
        o  = code[k+3]
        if op == 1:
            code[o] = code[i1]+code[i2]
        elif op == 2:
            code[o] = code[i1]*code[i2]
        elif op == 99:
            break
        else:
            print(code)
            print(k)
        k += 4
    print(code[0])
    origCode = [1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,5,19,23,1,6,23,27,1,27,
            10,31,1,31,5,35,2,10,35,39,1,9,39,43,1,43,5,47,1,47,6,51,2,51,6,55,
            1,13,55,59,2,6,59,63,1,63,5,67,2,10,67,71,1,9,71,75,1,75,13,79,1,
            10,79,83,2,83,13,87,1,87,6,91,1,5,91,95,2,95,9,99,1,5,99,103,1,103,
            6,107,2,107,13,111,1,111,10,115,2,10,115,119,1,9,119,123,1,123,9,
            127,1,13,127,131,2,10,131,135,1,135,5,139,1,2,139,143,1,143,5,0,99,
            2,0,14,0]
    print("part 2")
    I = 0
    J = 0
    for i in range(101):
        for j in range(101):
            code = origCode[:]
            code[1] = i
            code[2] = j
            k = 0
            try:
                while k < len(code):
                    op = code[k]
                    i1 = code[k+1]
                    i2 = code[k+2]
                    o  = code[k+3]
                    if op == 1:
                        code[o] = code[i1]+code[i2]
                    elif op == 2:
                        code[o] = code[i1]*code[i2]
                    elif op == 99:
                        break

                    k += 4
                if code[0] == 19690720:
                    I = i
                    J = j
            except:
                1+1
    print(I, J)

def day3():
    lineA = "R75,D30,R83,U83,L12,D49,R71,U7,L72".split(",")
    lineB = "U62,R66,U55,R34,D71,R55,D58,R83".split(",")
    
    coordsA = {(0,0)}
    coordsB = {(0,0)}
    intersect = {(0,0)}
    currX = 0
    currY = 0
    for i in lineA:
        #add the coordinates of Line A to coords A 
        dir = i[0]
        dist = int(i.strip("LRDU"))
        if dir == "R":
            for j in range(dist):
                currX += 1
        elif dir == "L":
            for j in range(dist):
                currX -= 1
        elif dir == "U":
            for j in range(dist):
                currY += 1
        elif dir == "D":
            for j in range(dist):
                currY -= 1
        coordsA.add((currX,currY))
    #reset currXY for line B    
    currX = 0
    currY = 0
    for i in lineB:
        #Evaluate coords of line B and add intersections to intersect
        dir = i[0]
        dist = int(i.strip("LRDU"))
        if dir == "R":
            for j in range(dist):
                currX += 1
        elif dir == "L":
            for j in range(dist):
                currX -= 1
        elif dir == "U":
            for j in range(dist):
                currY += 1
        elif dir == "D":
            for j in range(dist):
                currY -= 1
        coordsA.add((currX,currY))
            
    for coord in coordsA:
        if coord in coordsB:
            print(coord)

    


print("Day 1")
day1()
print("Day 2")
day2()
print("Day3")
day3()

