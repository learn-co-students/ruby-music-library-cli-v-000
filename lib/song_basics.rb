require 'pry'

class Song 
  
attr_accessor :name
attr_reader :artist, :genre 

@@all = []

def initialize(name, artist=nil, genre=nil)
  @name = name 
  if artist 
    self.artist=(artist)
  end 
  if genre 
  self.genre=(genre) 

end 
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

def artist=(artist)
  @artist = artist 
  artist.add_song(self)
end 
  
def genre=(genre)
  @genre = genre 
  if !(genre.songs.include? self)
 genre.songs << self 
 end 
  
end 

  

end 