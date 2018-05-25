require "pry"

class Artist
  extend Concerns::Findable
  attr_accessor :name
  
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = []
  end
  
  def save 
    @@all << self
  end
  
  def songs
    @songs 
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist != nil
  end
  
  def genres 
    genres = @songs.collect{|song| song.genre}
    genres.uniq
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end
  
end 