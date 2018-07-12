

require 'pry'
class Song 
  
attr_accessor :name, :artist, :genre 

@@all = []

def initialize(name,artist = nil,genre = nil )
  @name = name 
  self.artist = artist unless artist == nil
  self.genre = genre unless genre == nil 
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


def self.create(song_name)
   new(song_name).tap{|song| song.save} 
end 


def add_song(song)
    @songs << song unless song.artist == self
    song.artist = self
end


def artist=(artist)
  @artist = artist 
artist.add_song(self)
end 


def genre=(genre)
  @genre = genre 
  genre.add_song(self)
end 


def self.find_by_name(name)
  self.all.detect{|find_name| find_name.name == name} 
end 



  
def self.new_from_filename(filename)
artist_name_string = filename.split(" - ")[0]
song_name_string = filename.split(" - ")[1]
genre_type_string = filename.split(" - ")[2].chomp(".mp3")

song = self.new(song_name_string)
song.artist = Artist.find_or_create_by_name(artist_name_string)
song.genre = Genre.find_or_create_by_name(genre_type_string)
song
end 
 

def self.create_from_filename(filename) 
   new_from_filename(filename).save 
end 






end 