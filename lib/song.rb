class Song 
  attr_accessor  :name, :artist
   @@all = []
   
def initialize(name, artist = nil, genre = nil)
  @name = name
  @artist = artist
end

#need to add the has many for artist
def artist
  @artist
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
  song = new(name)
  song.save
  song
end


end
