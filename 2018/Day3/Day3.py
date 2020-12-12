def read_in():
    with open("input.txt") as fh:  
        return [line.strip() for line in fh]

def claim_cloth(cloth, claim):
    id, a0, coords, size = claim.split(" ")
    id = int(id.strip("#"))
    coords = coords.strip(":")
    x,y = coords.split(",")
    x = int(x)
    y = int(y)

    w,h = size.split("x")
    w = int(w)
    h = int(h)

    for i in range(x, x+w):
        for j in range(y, y+h):
            if cloth[i][j] != 0:
                cloth[i][j] = "X"
            else:
                cloth[i][j] = id
    return cloth

def test_claim(cloth, claim):
    id, a0, coords, size = claim.split(" ")
    id = int(id.strip("#"))
    coords = coords.strip(":")
    x,y = coords.split(",")
    x = int(x)
    y = int(y)

    w,h = size.split("x")
    w = int(w)
    h = int(h)
    
    for i in range(x, x+w):
        for j in range(y, y+h):
            if cloth[i][j] == "X":
                return False
    return True

claims = read_in()    
cloth = [[0 for i in range(1000)] for j in range(1000) ]


for cl in claims:
    cloth = claim_cloth(cloth, cl)
for cl in claims:
    if test_claim(cloth, cl):
        print(cl)
        break

	
count = 0
for i in range(1000):
    for j in range(1000):
        if cloth[i][j] == "X":
            count += 1
            

