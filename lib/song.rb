require 'pry'

class Song 
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end 
  
  def self.all 
    @@all
  end 
  
  def save 
    self.class.all << self
  end 
  
  def self.destroy_all 
    self.all.clear
  end 
  
  def self.create(name)
    self.new(name).tap {|song| song.save}
  end 
  
  def artist=(artist)
    artist.add_song(self)
  end
end 