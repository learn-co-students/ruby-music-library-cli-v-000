class Artist 
  
  attr_accessor :name
  
  @@all = []  
  
  def initialize(name)
    @name = name 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear 
  end 

  def save
  @@all << self 
  self  
  end 
  
  def self.create(name)  
  song = new(name)
  song.save 
  song
 end 
  
end 