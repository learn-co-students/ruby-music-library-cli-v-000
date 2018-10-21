require 'pry'
class Song 
  attr_accessor :genre, :name 
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def self.all
    @@all 
  end 
  
  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap {|s| s.save}
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def artist=(artist)
    @artist = artist 
    @artist.add_song(self)
  end
  
  def save 
    @@all << self
  end 

      # new_song = Song.new("")
      # new_song_name = new_song.instance_variable_get(:@name)
    
  def genre=(genre)
     @genre = genre
     genre.songs << self unless genre.songs.include? (self)
  end 

  def self.find_by_name(name) 
    self.all.detect{ |s| s.name == name}
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name) 
  end 
  
  
  
  
end 