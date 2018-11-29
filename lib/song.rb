require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist
  
  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil 
      self.artist=(artist)
    end
     if genre != nil 
      self.genre=(genre)
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
    new_song = Song.new(song)
    new_song.save
    new_song
  end
  
  def artist=(artist)
    @artist=artist
    artist.add_song(self)   
  end
  
  def artist
    @artist
  end
  
  def genre
    @genre  
  end
  
  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end
    
end