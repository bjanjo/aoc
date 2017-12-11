#!/usr/bin/ruby
#
#text=File.open('input').read
#text.each_line do |line|
#    print "#{line_num += 1} #{line}"
#end
#

def find_abba(str)
    
    str.each_char {
        |c| print c, ' '
    }
end

line_num=0
File.readlines('test').each do |line|
    find_abba line
    #print "#{line_num += 1} #{line}"
end
        
