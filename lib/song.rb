require 'pry'
class Song

extend Concerns::Findable

attr_accessor :name

@@all = []

def initialize(name, artist=nil, genre = nil)
  @name = name
  @songs = []
 if artist == nil
 else
 self.artist = artist 
end

if genre == nil
else
  self.genre = genre
end
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def artist
  @artist
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end

def genre
  @genre
end

def self.all
@@all
end

def self.destroy_all
  @@all.clear
end

def save
@@all << self
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end

def self.new_from_filename(file)
  new_file = file.split(" - ")
  new_song = Song.new(new_file[1])
  new_song.artist = Artist.find_or_create_by_name(new_file[0])
  genre_file = new_file[2].delete(".mp3")
  new_song.genre = Genre.find_or_create_by_name(genre_file)
  new_song
end

def self.create_from_filename(file)
  new_file = file.split(" - ")
  new_song = Song.new(new_file[1])
  new_song.artist = Artist.find_or_create_by_name(new_file[0])
  genre_file = new_file[2].delete(".mp3")
  new_song.genre = Genre.find_or_create_by_name(genre_file)
  new_song.save
  new_song

end



end