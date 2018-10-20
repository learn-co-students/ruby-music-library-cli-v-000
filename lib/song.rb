class Song 
  attr_accessor :artist, :genre, :name 
  @@all = []
  
  def initialize(name)
    @artist = artist
    @name = name
    @song = song 
    @@all << self
  end 
  
  def self.all
    @@all 
  end 
  
  def self.create(name)
    new(name).tap {|s| s.save}
    #new_song = self.new(name)
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def save 
    @@all << self
  end 

  
end 