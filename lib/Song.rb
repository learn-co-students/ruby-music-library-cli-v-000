class Song 

attr_accessor :name, :artist 
@@all = []

def initialize(name, artist = nil)
  @name = name
  if !Artist.all.include?(artist) && artist != nil 
    Artist.new("#{artist}".capitalize)
  end 
  artist=(artist)
  if artist != nil  
    @artist = artist
    @artist.songs << self
  end 
end 

def save 
@@all << self 
end 

def artist=(artist) 
  @artist = artist 
  artist.songs << self
  artist.add_song(self)
end 

def self.all 
@@all 
end

def self.destroy_all
  @@all = []
end

def self.create(name)
  x = Song.new(name) 
  x.save 
  x
end 
end 