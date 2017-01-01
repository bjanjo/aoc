#!/usr/bin/ruby

require 'digest'

for i in 3231928..3231930
    str = "abc"
    str2 = Digest::MD5.hexdigest(str.concat(i.to_s))
    if str2[0, 5] == "00000"
       puts "#{str} #{str2}"  
    end
end
