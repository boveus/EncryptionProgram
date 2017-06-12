
require 'CSV'

def configuration
config = CSV.read('encryption.config')
privatekeypath = config[1][0]
publickeypath = config[2][0]
return publickeypath
end

def generatekeypair#(filename)
privatekey = rand(1..256)
publickey = 256 - privatekey
#writeFile(filename, publickey)
#writeFile(filename, privatekey)
return privatekey
end

config = generatekeypair
puts config
