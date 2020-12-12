#!/usr/bin/env python

import string

def read_in():
    with open("input.txt") as fh:  
        return [line.strip() for line in fh]

chain = str(read_in()[0])
alph = ["aA", "bB", "cC", "dD", "eE", "fF", "gG", "hH", "iI", "jJ", "kK", "lL",
        "mM", "nN", "oO", "pP", "qQ", "rR", "sS", "tT", "uU", "vV", "wW", "xX",
        "yY", "zZ",
        "Aa", "Bb", "Cc", "Dd", "Ee", "Ff", "Gg", "Hh", "Ii", "Jj", "Kk", "Ll",
        "Mm", "Nn", "Oo", "Pp", "Qq", "Rr", "Ss", "Tt", "Uu", "Vv", "Ww", "Xx",
        "Yy", "Zz"]



count = 0
change = True
while (count < 500):
    for l in alph:
        chain = chain.replace(l, '')
    count += 1


def part_1(chain, alph):
    alph = ["aA", "bB", "cC", "dD", "eE", "fF", "gG", "hH", "iI", "jJ", "kK", "lL",
        "mM", "nN", "oO", "pP", "qQ", "rR", "sS", "tT", "uU", "vV", "wW", "xX",
        "yY", "zZ",
        "Aa", "Bb", "Cc", "Dd", "Ee", "Ff", "Gg", "Hh", "Ii", "Jj", "Kk", "Ll",
        "Mm", "Nn", "Oo", "Pp", "Qq", "Rr", "Ss", "Tt", "Uu", "Vv", "Ww", "Xx",
        "Yy", "Zz"]

    count = 0
    change = True
    while (count < 1000):
        for l in alph:
            chain = chain.replace(l, '')
        count += 1
    return chain

def part_2(alph):
    m = 500000
    l = 'a'
    alph2 = list(string.ascii_lowercase)
    
    for l in alph2:
        chain = str(read_in()[0])
        L = l.upper()
        c = chain.replace(l, '')
        c = c.replace(L, '')
        count = 0
        while (count < 10000):
            for i in alph:
                c = c.replace(i, '')
            count += 1
        if len(c) < m:
            m = len(c)
        print(l, len(c))
    print(m)
    
    
chain = part_1(chain, alph)
print(len(chain))

part_2(alph)



with open('input.txt') as day5input:
    data = day5input.read().strip()

def removeMatches(data):
    matches_found = True
    while matches_found:
        matches_found = False
        pos = 0
        while pos < len(data)-1:
            c1 = ord(data[pos])
            c2 = ord(data[pos+1])
            if abs(c1 - c2) == 32:
                data = data[:pos] + data[pos+2:]
                matches_found = True
            else:
                pos += 1
    return(data)

data = removeMatches(data)
print(len(data))

values = dict()
for c in range(0, 26):
    polymer = chr(ord('a') + c)
    polymer2 = polymer.upper()
    input = list(data)
    d = list(filter(lambda a: a != polymer and a!= polymer2, input))
    d = removeMatches(d)
    values[polymer] = len(d)
    print(polymer, polymer2, values[polymer])

print(min(values.items(), key=lambda x: x[1]))


    
    
