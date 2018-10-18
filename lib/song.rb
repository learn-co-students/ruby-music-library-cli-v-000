class Song 
  attr_accessor :artist, :genre, :name 
  @@all = []
  
  def initialize(name)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def self.all
    @@all 
  end 
  
  def self.create(name)
    new(name).tap {|s| s.save} 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 

  
end 