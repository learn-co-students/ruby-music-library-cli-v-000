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
  
 def self.new_from_filename(filename)
    first_cut = filename.split(" - ")
    artist_name = first_cut[0]
    song_name = first_cut[1]
    genre_name = first_cut[2].split(".")[0]

   song = Song.find_or_create_by_name(song_name)
   art = Artist.find_or_create_by_name(artist_name)
   song.artist = art unless song.artist 
  gen = Genre.find_or_create_by_name(genre_name)
   song.genre = gen unless song.genre 
   song 
 end 
 
 def self.create_from_filename(filename)
     song = Song.new_from_filename(filename)
     self.all << song 
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