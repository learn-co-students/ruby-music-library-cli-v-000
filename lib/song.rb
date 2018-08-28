

class Song 
  require "pry"
  attr_accessor :name
  attr_reader :artist, :genre
  
  @@all = []
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end 
    
  
  def self.all
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
  
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end 
    
    if genre !=nil
      self.genre=(genre)
    end 
    
  end 
  
  def genre=(genre)
    @genre = genre
    if genre.songs.detect{|a| a = self} == nil
      genre.songs << self
    end
  end
  
end 