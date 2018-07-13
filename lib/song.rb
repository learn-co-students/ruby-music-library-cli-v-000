require 'pry'

class Song 
  attr_accessor :name, 
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
end
