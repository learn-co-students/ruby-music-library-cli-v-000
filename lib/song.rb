require 'pry'

class Song

attr_accessor :name, :artist, :genre

@@all = []

def initialize(name,artist=nil)
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
  song = self.new(name)
  song.save
  song
end


end