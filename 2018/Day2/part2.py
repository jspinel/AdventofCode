def read_in():
    with open("input.text") as fh:  
        return [line.strip() for line in fh]

def test_code(code, list_of_codes):
    for i in range(len(codes)):
        counter = 0
        for c in range(len(code)):
            if code[c] != codes[i][c]:
                counter += 1
        if counter == 1:
            print_codes(code, codes[i])
    return 0

def print_codes(code1, code2):
    cod = ""
    for c in range(len(code1)):
        if code1[c] == code2[c]:
            cod += code1[c]
    print cod

codes = sorted(read_in())

for i in range(len(codes)-1):
    if test_code(codes[i], codes[i:]):
        print(test_code(codes[i], codes[i:])) 
