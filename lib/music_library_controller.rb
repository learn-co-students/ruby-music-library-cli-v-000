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
if input == "list songs"
list_songs
end
input = gets.strip
end
end


def list_songs

  Song.all.each {|x| x.name}

end


end