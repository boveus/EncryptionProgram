
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

def generatekeypair(publickeyFN, privatekeyFN)
privatekey = rand(1..256)
publickey = 256 - privatekey
writeFile(publickeyFN, publickey)
writeFile(privatekeyFN, privatekey)
readFile('encryption.config')
CSV.open('encryption.config', 'wb') do |csv|
    csv << ["filename", "keytype"]
    csv << [privatekeyFN, "private key"]
    csv << [publickeyFN, "public key"]
  end
end

generatekeypair("PublicKey", "PrivateKey")
