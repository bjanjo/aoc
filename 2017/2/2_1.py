import unittest


class FileReader:
    def __init__(self):
        with open("input.2") as f:
            self.content = f.readlines()
            self.content = [x.strip() for x in self.content]

class CheckSummer:
    def __init__(self, sheet):
        self.checksum = 0
        cs = 0
        for line in sheet:
            numbers = line.split('\t')
            asints = list(map(int, numbers))
            for x in asints:
                for y in asints:
                    if x%y == 0 and x!=y:
                        cs += x/y;
        self.checksum = cs

class Test2(unittest.TestCase):              
    def test_fileReader(self):
        fr = FileReader()
        print("fr.content=", fr.content)

    def test_checksum_example(self):
        sheet = ["5\t9\t2\t8", "9\t4\t7\t3", "3\t8\t6\t5"]
        cs = CheckSummer(sheet)
        print("checksum=", cs.checksum)
        self.assertEquals(cs.checksum, 9) 

    def test_checksum_(self):
        fr = FileReader()
        cs = CheckSummer(fr.content)
        print("checksum=", cs.checksum)
        self.assertEquals(cs.checksum, 191) 