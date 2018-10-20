class Song 
  attr_accessor :artist, :genre, :name 
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap {|s| s.save}
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 

  
end 