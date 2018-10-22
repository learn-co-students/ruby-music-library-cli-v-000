require "pry"

class Song
  extend Concerns::Findable
   
  attr_accessor :name 
  attr_reader :artist, :genre 
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre 
  end
  
  def genre=(genre)
    @genre = genre 
    unless genre.songs.include?(self)
    genre.songs << self 
    end
  end
  
   def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end
  
  def save
    @@all << self 
  end
  
   def self.create(name)
    song = new(name)
    song.save 
    song 
  end
  
  def self.new_from_filename(file_name)
    song_name = file_name.split(" - ")[1]
    artist_name = file_name.split(" - ")[0]
    genre_name = file_name.split(" - ")[2].chomp(".mp3")
    
    a = Artist.find_or_create_by_name(artist_name)
    g = Genre.find_or_create_by_name(genre_name)
    
    new_song = self.new(song_name, a, g)
    
  end
  
  def self.create_from_filename(file_name) 
    song = self.new_from_filename(file_name)
    song.save 
    song 
  end
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
    
  
end