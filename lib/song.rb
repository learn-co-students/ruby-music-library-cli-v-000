require 'pry'

class Song
attr_accessor :name, :artist, :genre

@@all=[]

def initialize(name, artist=nil, genre=nil)
  @name=name
  @genre=genre
  artist=(artist)
end

def save

  @@all<<self
end

def self.all
  @@all
end

def artist=(name)
  @artist=name
  @artist.add_song(self)
end


def self.destroy_all
  self.all.clear
end

def self.create(name, artist=nil, genre=nil)
  song = self.new(name, artist, genre)
song.save
song
end


end