require 'pry'

class MusicLibraryController


attr_accessor :path

def initialize(path = './db/mp3s' )
  @path = path
  new_path = MusicImporter.new(path)
  new_path.import
  end


def call

input = gets.strip
until input == "exit"

input = gets.strip
end

if input == "list songs"
  list_songs
else
end

end

def list_songs

binding.pry
end


end