from collections import defaultdict

def get_power(x, y, serial):
    rackID = x+10
    power = rackID * y
    power += serial
    power *= rackID
    if power > 99:
        p = int(str(power)[-3])
    else:
        p = 0
    return p - 5



grid = [[0 for i in range(300)] for j in range(300)]
for i in range(len(grid)):
    for j in range(len(grid[i])):
        x = i + 1
        y = j + 1
        grid[i][j] = get_power(x, y, 5153)



max = 0
coords = [0, 0]
for i in range(298):
    for j in range(298):
        s = 0
        for x in range(3):
            for y in range(3):
                s += grid[i+x][j+y]
        if s > max:
            max = s
            coords = [i+1, j+1]
            #print(max, coords)  #Debugging

print(coords)

board=[[0]*300 for _ in range(300)]
for y in range(300):
    for x in range(300):
        board[y][x] = get_power(x, y, 5153)
       
squares = defaultdict(lambda:defaultdict(int)) #size : pos : sum
mx = 0
for size in range(1, 300):
    if size % 10 == 0:
	    print(300 - size)
    for y in range(300 - size,-1,-1):
        for x in range(300 - size,-1,-1):
            strip = board[y][x]
            for shift in range(1,size):
                strip += board[y+shift][x]
                strip += board[y][x+shift]
            t = strip + squares[size - 1][x+1, y+1]
            squares[size][x, y] = t
            if t > mx:
                mx = t
                win = x,y,size

print(win, t)

