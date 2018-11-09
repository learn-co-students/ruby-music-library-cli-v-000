require 'pry'

class Song 
  attr_accessor :name, :songs
  attr_reader :artist, :genre
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
    @@all << self
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self) 
  end
  
  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
    end
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
  
  def self.create(song)
    new_song = self.new(song)
    new_song.save 
    new_song
  end

end 