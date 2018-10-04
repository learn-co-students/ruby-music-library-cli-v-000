require 'pry'

class Artist  
  
attr_accessor :name, :songs  

@@all = []

def initialize(name)
  @name = name 
  @songs = []
end 

def self.all 
  @@all 
end 

def save 
  @@all << self 
end 

def self.destroy_all 
  @@all.clear 
end 

# def self.create(name)
#   self.new(name).save 
#   @@all[0]
# end 

def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end

def add_song(song)
  if song.artist != self  
    song.artist = self 
    self.songs << song 
  end 
end 

def songs
  @songs 
end 


def genres 
 genres =  @songs.collect do |song|
   song.genre 
  end 
  genres.uniq 

end 

end 