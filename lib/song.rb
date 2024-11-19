
require "pry"
class Song 
  
  extend Concerns::Findable
  
  attr_accessor :name, :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    if artist 
      self.artist = artist 
      artist.songs << self
    end 
    
    if genre
      self.genre = genre
    end 
  end
  
  
  def self.all  #class reader
    @@all 
  end
  
  def self.destroy_all 
    @@all = []
  end
  
  def save 
    @@all << self 
  end 
  
  def self.create(name)
    new_song = Song.new(name)
    new_song.save 
    new_song
  end
  
  def artist=(artist) 
    @artist = artist
    artist.add_song(self)
  end
  
   def genre=(genre) 
    @genre = genre
    if !genre.songs.include?(self)
      genre.songs << self
    end
  end
  
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    artist = Artist.find_or_create_by_name(filename[0])
    genre = Genre.find_or_create_by_name(filename[2].chomp(".mp3"))
    song = self.new(filename[1], artist, genre)
  end 
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end 
end 



