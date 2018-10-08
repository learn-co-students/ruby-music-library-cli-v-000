require 'pry'
class Song
  extend Concerns::Findable 
  attr_accessor :name
  attr_reader :artist, :genre 
  
  @@all = []
   
  def initialize(name, artist = nil, genre = nil) 
    @name = name 
   self.artist=(artist) if artist 
   self.genre=(genre) if genre 
  end 
  
  
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self unless genre.songs.include? self 
  end 
 
  
  def self.create(name)
   new_song =  Song.new(name)
   new_song.save 
   new_song 
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
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def self.new_from_filename(filename)
    filename_array = filename.split(" - ")
    
   artist = find_or_create_by_name(filename_array[0]) 
    name = filename_array[1]
    genre = find_or_create_by_name((filename_array[2].gsub(".mp3", ""))
   new_song =  Song.new(name, artist, genre)
    
  end 
end 
  
  
