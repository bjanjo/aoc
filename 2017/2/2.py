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
            print("Max=", max(asints), " min=", min(asints))
            print("Partial difference=", (max(asints) - min(asints)))
            cs += (max(asints) - min(asints))
        self.checksum = cs
        print("Checksum: ", cs)
                
class Test2(unittest.TestCase):              
    def test_fileReader(self):
        fr = FileReader()
        print("fr.content=", fr.content)

    def test_checksum_example(self):
        sheet = ["5\t1\t9\t5", "7\t5\t3", "2\t4\t6\t8"]
        cs = CheckSummer(sheet)
        self.assertEquals(cs.checksum, 18) 

    def test_checksum_(self):
        fr = FileReader()
        cs = CheckSummer(fr.content)
        print("checksum=", cs.checksum)