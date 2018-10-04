require 'pry'

class Song 
  
attr_accessor :name, :artist 

@@all = []

def initialize(name, artist=nil)
  @name = name 
  @artist = artist 
 
end 
 

def self.all 
  @@all 
end 

def save 
  @@all << self 
end 

def self.destroy_all 
  @@all = []
end 

def self.create(name)
  self.new(name).save 
  @@all[0]
end 


end 