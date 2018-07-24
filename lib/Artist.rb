require 'pry'

class Artist

attr_accessor :name

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def save
  @@all << self
end

def self.all
  @@all
end

def add_song (song)
song.artist = self unless song.artist == self
@songs << song unless @songs.include? song
 end

def songs
  @songs
end


def self.destroy_all
  @@all.clear
end

def self.create(name)
  artist = self.new(name)
  artist.save
  artist
end


end
