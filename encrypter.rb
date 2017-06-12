ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

ENCODING = "MOhqm0PnycUZeLdK8YvDCgNfb7FJtiHT52BrxoAkas9RWlXpEujSGI64VzQ31w"

def encode(text)
  text.tr(ALPHABET, ENCODING)
end

def decode(text)
  text.tr(ENCODING, ALPHABET)
end

def readFile(filename)
file = File.open(filename, "r")
contents = file.read
return contents
end

def writeFile(filename, message)
somefile = File.open(filename, "w")
somefile.puts message
somefile.close
end

puts "To encrypt a string, please enter E, to decrypt an existing file, please enter D."
choice = gets.chomp
if choice === "E" then puts "Please enter a string containing letters and numbers (Punction is not currently supported)."
  string = gets.chomp
  encryptstring = encode(string)
  writeFile("sample.txt", encryptstring)
  end

if choice === "D" then puts "Please enter the path to the file that contains the encryped message"
  filename = gets.chomp
  encryptedmessage = readFile(filename)
  message = decode(encryptedmessage)
  puts message
end
