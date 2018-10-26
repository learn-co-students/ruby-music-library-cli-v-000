class Song 

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

def self.create 
    self.new.initialize
end 

end 

