require 'pry'
class Song

attr_accessor :name
attr_reader :artist, :genre
@@all = []

def initialize(name, artist = nil, genre = nil)
   @name = name
   self.artist = artist if artist
   self.genre = genre if genre
end

def genre=(genre)
  @genre = genre
  genre.songs << self if !genre.songs.include?(self)
end

def save
@@all << self
end

def artist=(artist)
  @artist = artist

  artist.add_song(self)
end

def self.all
@@all
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  x = Song.new(name)
  x.save
  x
end
end
