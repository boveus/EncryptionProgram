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

simple example
modulto value = 256
secret random (pri) value of 1-255
for example pri=133
public key pub = 256 - pri = 123.
This public key (123) you can share to the world.
3rd party does not know how to compute private key from a public. So, they know only public key (123).
Someone from public want to send you encrypted ASCII-byte.
encrypted = (input_value + pub) % modulto;
For example, I want send you letter "X", ASCII code = 88 in encrypted form. So, I compute:
(88 + 123) % 256 = 211;
I am sending you value 211 - encrypted byte.
You decrypt it by same scheme with your private key:
decrypted = (input_value + pri) % 256 = (211 + 133) % 256 = 88;

ascii + public key % 256 = encrypted value

encrypted value + private key % 256 = decrypted value


create dictionary of ASCII-bytes correlated to ALPHABET
use above algorithm to convert/store public/private keys
and messages
