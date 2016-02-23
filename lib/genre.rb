require 'pry'

class Genre
attr_accessor :name, :songs, :artist

@@all=[]

def initialize(name)
  @name=name
  @songs=[]
end

def save
  Genre.all<<self
end

def self.all
  @@all
end

def self.destroy_all
  self.all.clear
end
def songs
  @songs
end

def self.create(name)
  genre = self.new(name)
genre.save
genre
end


end