require 'pry'

class Genre
  extend Concerns::Findable
attr_accessor :name, :songs, :artist

@@all=[]

def initialize(name)
  @name=name
  @songs=[]
end

def save
  @@all<<self
end

def self.all
  @@all
end

def add_song(song)
  if @songs.include?(song)
  else
  @songs<<song
  song.genre=self
end
end

def self.destroy_all
  self.all.clear
end
def songs
  @songs
end

def artists
  @songs.collect {|song| song.artist}.uniq
end

def self.create(name)
  genre = self.new(name)
genre.save
genre
end


end