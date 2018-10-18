require "pry"

class Artist 
  extend Concerns::Findable 
   
  attr_accessor :name, :songs, :genres  
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = [] 
  end
  
  def save
    @@all << self 
  end
  
  def self.create(name)
    artist = new(name)
    artist.save 
    artist  
  end
  
  def add_song(song)
    song.artist = self unless song.artist != nil 
    @songs << song unless @songs.include?(song)
  end
  
  def genres 

    genre_array = self.songs.collect {|song| song.genre}
    genre_array.uniq 
  end
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
    
  
end
