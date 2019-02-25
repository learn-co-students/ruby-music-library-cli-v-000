class Genre 
  attr_accessor  :name, :songs
  
   @@all = []
   
def initialize(name)
  @name = name
  @songs = []
  save
  
end

def self.all
  @@all
end

def self.destroy_all
  all.clear
  
end

def save
  @@all << self
end

def self.create(name)
  genre = new(name)
  genre.save
  genre
end



end