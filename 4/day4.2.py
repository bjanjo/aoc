#!/usr/bin/python
import re, collections
from sys import argv

def decrypt(enc_name, sector_id):
    alph=list('abcdefghijklmnopqrstuvwxyz')
    d = [] 
    for letter in enc_name:
        if letter == '-':
            d.append(' ')
        else: 
            d.append(alph[(alph.index(letter)+int(sector_id))%26])

    return ''.join(d)

script, filename = argv

lines = [line.rstrip('\n') for line in open(filename)]
print "Number of lines: %r" % len(lines)
sum_of_ids = 0
for line in lines:
    match = re.search(r'([a-z-]+)-([0-9]+)\[([a-z]+)\]', line)
    enc_name = match.group(1)
    sector_id = match.group(2)
    checksum = match.group(3)
    
    print "%s %s" % (decrypt(enc_name, sector_id), sector_id)
