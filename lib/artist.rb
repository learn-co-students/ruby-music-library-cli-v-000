require 'pry'
class Artist 
  attr_accessor :name, :song, :songs
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all
  end
  
  def save
    @@all << self 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end
    
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end
  
  def artist=(name)
    @artist = name
  end
  
  def songs 
    @songs
  end
  
  def genre 
    artist.genre = self
  end
  
  def genres
    @songs.collect {|song| song.genre}.uniq
  end
  
  
end