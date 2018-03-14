
require 'pry'
class Song

  attr_accessor :name, :artist, :genre, :song

  @@all = []

def initialize(name, artist = artist, genre = genre)
@name = name
@genre = genre
@artist = artist
 # @@all << self
# genre.add_song(self)
self.genre = genre
self.artist = artist
end

def self.find_by_name(name)
  self.all.detect do|song|
    song.name == name
  end
end

def self.find_or_create_by_name(name)
    self.find_by_name(name) || self. create(name)
end

# def genre
#   genre.add_song(self)
#   @songs << self
# end

def self.all
  @@all
end

def save
  @@all << self
end

def self.create(name)
  song = Song.new(name)

  song.save
song
end

def self.destroy_all
  @@all.clear
end

end
