class MusicLibraryController

def initialize(path = "./db/mp3s")
  @path =path
  MusicImporter.new(path).import
  #menu
end

def call

##loop do
puts "list songs"
puts "list artist"
puts "list genres"
puts "exit"
ch = gets.chomp
##if ch=="exit"
##   break
##end

##end

end
end
