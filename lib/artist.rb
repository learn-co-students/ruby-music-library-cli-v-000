require 'pry'
class Artist

  attr_accessor :name, :songs, :genres

  extend Concerns::Findable

    @@all = []

def initialize(name)
  @name = name
  @songs = []
end

def genres
  songs.collect{ |s| s.genre }.uniq
end

def self.all
  @@all
end



def save
  @@all << self
end

def self.create(name)
  song = new(name)
  song.save
  song
end

def add_song(song)
  song.artist= self unless song.artist
  songs << song unless songs.include?(song)
end

end
