require 'pry'
class Genre 
  attr_accessor :name, :songs 
  @@all = [] 
  
  def self.all 
    @@all 
  end 
  
  def initialize(name) 
    @name = name
    @songs = songs
    @songs = []
    @genre = genre  
    @songs << songs
    new_genre = self.new   
    #binding.pry
  end 
  
  def new
    @song << genre
    #new_genre = self.new  Creates infinite loop ?
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