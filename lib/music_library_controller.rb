

class MusicLibraryController


attr_accessor :path

def initialize(path = './db/mp3s' )
  @path = path
  new_path = MusicImporter.new(path)
  new_path.import
  end


def call
input = gets
until input == "exit"
if input == "list songs"
list_songs
end
input = gets
end
end


def list_songs
  Song.all.each_with_index {|x,index|
    print index + 1,". ",x.artist.name," - ",x.name," - ",x.genre.name
 


}
end




end