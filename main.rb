

def readFile(filename)
file = File.open(filename, "r")
contents = file.read
puts contents
end

def writeMessage(filename)
somefile = File.open(filename, "w")
somefile.puts message
somefile.close
end
