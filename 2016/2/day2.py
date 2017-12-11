#!/usr/bin/python
from sys import argv

filename = argv[1]

lines = [line.rstrip('\n') for line in open(filename)]

for line in lines:
    print line

