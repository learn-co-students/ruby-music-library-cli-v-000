class Genre 
  
include Concerns::Findable

attr_accessor :name, :songs 

@@all = []


def initialize(name)
     @name = name 
     @songs = []
end 

def self.all 
  @@all 
end 

def self.destroy_all 
    @@all.clear 
end 

def save 
  @@all << self
end 
  
  
def self.create(genre_name)
  new(genre_name).tap{|genre| genre.save} 
end 


def add_song(song) 
  @songs << song unless @songs.include?(song)
  song.genre = self unless song.genre == self
end  


def artists
    self.songs.collect{|song| song.artist}.uniq
end
end 