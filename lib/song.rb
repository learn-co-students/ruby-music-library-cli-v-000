require 'pry'
class Song 
  
  attr_accessor :name, :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name 
    self.artist = artist if artist != nil 
    self.genre =  genre if genre != nil 
    #@@all << self 
  end 
  
 
 def self.find_by_name(name_string)
  self.all.detect {|song| song.name == name_string} 

   
 end 
 
 def self.find_or_create_by_name(name_string)
   find_by_name(name_string) || create(name_string)
 end 
 
 
 
 
 
 
 
  def self.all 
    @@all
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
 
  def save 
    self.class.all << self 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save 
    song 
    
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self 
    genre.songs.uniq! 
  end 

end 