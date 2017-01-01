#!/usr/bin/python
import re, collections
from sys import argv

def calc_checksum(enc_name):
    d = {}
    for letter in enc_name.replace("-",""):
        if letter in d:
            d[letter] += 1
        else:
            d[letter] = 1
    sorted_on_letter = sorted(d.items())
    D = sorted(sorted_on_letter, key=lambda letter: letter[1], reverse=True)
    return D[0][0]+D[1][0]+D[2][0]+D[3][0]+D[4][0]

script, filename = argv

lines = [line.rstrip('\n') for line in open(filename)]
sum_of_ids = 0
for line in lines:
    match = re.search(r'([a-z-]+)-([0-9]+)\[([a-z]+)\]', line)
    enc_name = match.group(1)
    sector_id = match.group(2)
    checksum = match.group(3)
    calculated_checksum = calc_checksum(enc_name)
    if calculated_checksum  == checksum:
        sum_of_ids += int(sector_id)
print "Sum of sector IDs:%r" % sum_of_ids
