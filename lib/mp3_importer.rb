class MusicImporter

attr_accessor :path

def initialize(path)
  @path = path

end

def files
  all_files = Dir.entries(path)
  all_files.delete(".")
  all_files.delete("..")
  all_files
end


def import
  files.each {|x| 
    songs = x.split(" - ")
    artist = Artist.find_or_create_by_name(songs[0])
    song = Song.new(songs[1])
    song.artist = artist
    genre = Genre.find_or_create_by_name(songs[2].delete(".mp3"))
    song.genre = genre
  song.save

}

end

end