class MusicLibraryController
  attr_accessor :path

def initialize(path="./db/mp3s")
  importer = MusicImporter.new(path)
  importer.import
end

def call
  input = gets.chomp
  while true
  if input == "exit"
    return "exit"
  end
end
end

end
