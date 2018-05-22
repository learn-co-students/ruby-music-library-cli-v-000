require 'pry'
class Song 
  attr_accessor :name
  attr_reader :artist
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    self.artist=(artist)
  end
  
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).save
    self
  end
  
  def artist=(artist)
    binding.pry
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
  
  
  
end