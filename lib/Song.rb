require 'pry'

class Song


attr_accessor :name, :artist

@@all =[]

def initialize(name, artist = [])
@name = name
@artist = artist
end

def save
  @@all << self
end


def self.all
  @@all
end

def artist=
self.add_song
end


def self.destroy_all
  @@all.clear
end

def self.create(name)
  song = self.new(name)
  song.save
  song
end


end
