require 'pry'
class Song
  attr_accessor :name, :artist, :genre
    @@all = []
    @songs = []
  def initialize(name,artist=nil,genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self

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

def self.create(song)
  self.new(song)
end

def artist=(art)
  @artist = art
  art.add_song(self)
end
#binding.pry
end
