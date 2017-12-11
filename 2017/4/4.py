
import unittest
from collections import Counter

def is_file_valid():
    count = 0
    readfile = open("input.4", "r")
    for line in readfile:
        if is_valid(line.strip().split()):
            count += 1
    return count

def is_valid(line):
    counter = Counter(line)
    occs = counter.most_common()
    if occs[0][1] > 1:
        return False
    return True

class Test4(unittest.TestCase):
    def test_input1(self):
        line = "aa bb cc dd ee"
        self.assertTrue(is_valid(line.split()))
        
    def test_input2(self):
        line = "aa bb cc dd aa"
        self.assertFalse(is_valid(line.split()))
        
    def test_input3(self):
        line = "aa bb cc dd aaaa"
        self.assertTrue(is_valid(line.split()))
        
    def test_input_file(self):
        print "Count =", is_file_valid()