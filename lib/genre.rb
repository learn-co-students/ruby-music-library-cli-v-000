require 'pry'
class Genre 
  
   extend Concerns::Findable
  
   @@all = []

  attr_accessor :name, :songs
  
  def initialize(name)
    @name = name 
    @songs = []
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
   new_instance= self.new(name)
   new_instance.save 
   new_instance
  end

# ------ Passing 003

  def songs 
   @songs
  end 
  
  def artists 
  artists1 = []
    @songs.collect do |song|
        artists1 << song.artist 
    end 
 artists1 = artists1.uniq
 artists1 
  end 
     
  
end 