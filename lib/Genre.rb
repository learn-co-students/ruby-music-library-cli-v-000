require 'pry'

class Genre
attr_accessor :name, :song, :songs, :artist

@@all = []

def initialize(name)
@name = name
@songs = []
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
genre = Genre.new(self)
genre.save
genre
end

def songs
  @songs
end

def artists
  @songs.collect do |songs|
  songs.artist
end.uniq
end




end
