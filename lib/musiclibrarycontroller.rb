class MusicLibraryController
  attr_accessor :path

def initialize(path="./db/mp3s")
  importer = MusicImporter.new(path)
  importer.import
end

def call
  input = ""
  until input == "exit"
  input = gets.chomp
  if input == "list songs"
    i = 0
    Song.all.each do |song|
      i += 1
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
end
end

end
