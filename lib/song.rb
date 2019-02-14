class Song 
  
  attr_accessor :name, :artist, :genre 
  
  @@all =[]             #is initialized as an empty array
  
  def initialize(name)
    @name= name 
   
  end 
  
  def self.all          #returns the class variable @@all
    @@all 
  end 
  
  
  def self.destroy_all  #resets the @@all class variable to an empty array
   @@all.clear
  end 
  
  def  save            #adds the Song instance to the @@all class variable
  @@all << self  
  self 
  end 
  

  def self.create
    
  end 
  
  
  
end 