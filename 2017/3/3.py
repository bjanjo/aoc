#!/usr/bin/python3 

import unittest


def factor(number):
    fac = number // 8
    rem = number % 8
    print (number," = 8 *",fac, " + ", rem)
    
    return fac
    
class Test2(unittest.TestCase):              
    def test_factor1(self):
        self.assertEquals(factor(1), 0) 
    def test_factor2(self):
        self.assertEquals(factor(12), 3)
        self.assertEquals(1,0)
    def test_factor3(self):
        self.assertEquals(factor(23), 2)
    def test_factor4(self):
        self.assertEquals(factor(1024), 31)
