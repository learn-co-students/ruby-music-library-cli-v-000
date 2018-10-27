class Artist 
  
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
  @name=name 
  end 

  def save
  @@all << self 
  end 

  def self.all
  @@all
  end 

  def self.destroy_all
  @@all.clear 
  end 

  def self.create(name)
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end 

  
end 
