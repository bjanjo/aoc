say = "Hello world"
puts say
def load_­comics( path )
      comic­s = {}
        File.­foreach(pa­th) do |line­|
                name,­ url = line.­split(': ')
            comic­s[name] = url.s­trip
              end
          comic­s
end


