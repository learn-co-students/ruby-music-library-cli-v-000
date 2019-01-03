require 'pry'

class Artist 
  
  attr_accessor :name, :song, :genre
  
  @@all = []
  
  
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
    
  def new_song(name, genre)
   song = Song.new(name, self, genre)
   song
  end

  def songs
  # Song.all.select { |song| song.artist == self }    
    @songs
  end
  
  def genres
    genres = []
    self.songs.map { |song| 
    genres << song.genre
    }
    genres
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(artist)
    artist = self.new(artist)
  end
  
  def add_song(song)
    song.artist = self
  end
  
end