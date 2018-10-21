require 'pry'
class Genre 
  attr_accessor :name, :songs 
  @@all = []
  
  def self.all 
    @@all 
  end 
  
  def initialize(name) 
    @name = name
    @songs = []
    .new 
    genre << song
  end 
  
  
  def self.destroy_all 
    @@all.clear
  end 

  def save 
    @@all << self 
  end 

  def self.create(name)
    new(name).tap {|s| s.save} 
  end 
  
    
end