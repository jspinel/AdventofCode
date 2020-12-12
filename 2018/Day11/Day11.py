def get_power(x, y, serial):
    rackID = x+10
    power = rackID + serial
    power *= rackID
    if power > 99:
        p = int(str(power)[-3])
    else:
        p = 0
    return p - 5



grid = [[j for j in range(300)] for x in range(300)]
for i in range(300):
    for j in range(300):
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
			
		


