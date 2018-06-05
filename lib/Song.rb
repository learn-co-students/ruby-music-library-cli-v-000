require 'pry'

class Song
attr_accessor :name, :artist, :genre

@@all = []

def initialize(name, artist = nil, genre = nil)
@name = name
self.genre = genre if genre
self.artist = artist if artist != nil
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
song = Song.new(self)
song.save
song
end

def artist=(artist)
  @artist=(artist)
  artist.add_song(self)
end

def genre=(genre)
  @genre=(genre)
  if !genre.songs.include?(self)
  genre.songs << self
end
end



end
