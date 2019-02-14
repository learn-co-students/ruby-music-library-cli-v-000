class Song 
  
  attr_accessor :name, :artist, :genre 
  
  @@all =[]
  
  def initialize(name)
    @name= name 
  
  end 
  
  
  def self.all 
    @@all 
  end 
  
  
  def self.destroy_all
   @@all.clear
  end 
  

  
  
  
  
  
  
end 