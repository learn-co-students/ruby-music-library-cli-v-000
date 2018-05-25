require "pry"

class Artist
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = []
  end
  
  def save 
    @@all << self
  end
  
  def songs
    @songs 
  end
  
  def add_song(song)
    binding.pry
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end
  
end 