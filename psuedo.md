step 1
ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

ENCODING = "MOhqm0PnycUZeLdK8YvDCgNfb7FJtiHT52BrxoAkas9RWlXpEujSGI64VzQ31w"

def encode(text)
  text.tr(ALPHABET, ENCODING)
end

def decode(text)
  text.tr(ENCODING, ALPHABET)
end

basic example.

step 2 file operations
read

file = File.open("sample.txt", "r")
contents = file.read
puts contents   #=> Lorem ipsum etc.

write
fname = "sample.txt"
somefile = File.open(fname, "w")
somefile.puts "Hello file!"
somefile.close
