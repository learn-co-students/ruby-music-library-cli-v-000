class Genre
  extend Concerns::Findable

  attr_accessor :name
  
  @@all = []
  
  def initialize(name, genre = nil)
    @name = name 
    @songs = []
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
    genre = new(name)
    genre.save
    genre 
  end 
  
  def songs
    @songs
  end 

def add_song(song)
    if song.genre == nil
      song.genre = self 
    end 
    
  if !@songs.include?(song)
      @songs << song
    end 
  end 
  
  def artists
    songs.collect(&:artist).uniq
  end 
  
end 