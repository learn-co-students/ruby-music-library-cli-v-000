require 'pry'
class Song
attr_accessor :name
attr_reader :artist, :genre
@@all = []
def initialize(name,artist = nil,genre = nil)
  @name = name
  self.artist = artist if artist != nil
  self.genre = genre if genre != nil
  @@all << self
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

def self.create(song)
  song = self.new(song)
  song.save
  song
end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

def genre=(genre)
  @genre = genre
  genre.add_song(self)
end




end
