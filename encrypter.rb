require 'CSV'

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

def encrypt(filename)
  config = CSV.read('encryption.config')
  publickeypath = config[2][0]
  file = File.open(filename, "r")
  contents = file.read
  ordcontents = []
  #convert text file to ordinal values (IE X = 88)
  contents.each_char do |char|
    ordcontents.push(char.ord)
  end
  #get the public key value as an integer
  publickey = readFile(publickeypath).to_i
  encryptedmessage = []
  #use the algorithm to encrypt the message using the public key and modulo
  ordcontents.each { |i| encryptedmessage.push((i + publickey) % 256) }
  #write the encrypted value to a file
  File.open("encryptedmessage.txt", "w+") do |f|
  f.puts(encryptedmessage)
  end
end

def decrypt(filename)
  config = CSV.read('encryption.config')
  privatekeypath = config[1][0]
  message = []
  #read the encrypted file one line at a time and save it as an array
  File.read(filename).each_line do |line|
  message << line.chop.to_i
  end
  privatekey = readFile(privatekeypath).to_i
  decryptedmessage = []
  decodedmessage = []
  #decrypt message using private key and modulo
  message.each { |i| decryptedmessage.push((i + privatekey) % 256) }
  #decode message from ordinal to character value (88 = X)
  decryptedmessage.each { |i| decodedmessage.push(i.chr) }
  #write the decrypted/decoded values to the decrypted file
  File.open("decryptedmessage.txt", "w+") do |f|
  decodedmessage.each { |i| f.write i }
  end
end

encrypt("test.txt")
decrypt("encryptedmessage.txt")
