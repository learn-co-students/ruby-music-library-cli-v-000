require 'pry'

class Artist
extend Concerns::Findable

attr_accessor :name, :songs

@@all = []

def initialize(name)
  @name = name
  @songs = []
end

def self.all
  @@all
end

def save
  @@all << self
  self
end

def self.destroy_all
  @@all.clear
end

def self.create(name)
  self.new(name).save
end

def add_song(song)
  song.artist = self if song.artist!=self
  @songs << song if @songs.include?(song) == false

end

def genres
  self.songs.collect {|x| x.genre}.uniq
end

end
