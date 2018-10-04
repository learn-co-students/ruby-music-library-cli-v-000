require 'pry'

class Artist  
  
attr_accessor :name 

@@all = []

def initialize(name)
  @name = name 
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

def add_song(song)
  @songs << song 
end 


end 