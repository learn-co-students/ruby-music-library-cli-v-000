require 'pry'
class Artist
  @@all = []
  @@songs = []
  attr_accessor :name
  
  #CLASS METHODS 
  
  def self.all
    @@all
  end 
  def self.destroy_all
    self.all.clear
  end 
  def self.create(artist_name)
    artist = Artist.new(artist_name)
  end
  
  
  #INSTANCE METHODS 
  
  def initialize(name) 
    @name = name 
    @songs = []
    self.save
  end
  
  def save 
    self.class.all << self
  end
  
  def songs 
    @@songs
  end 
    
  def add_song(song)
    if song.artist
      # binding.pry
    else
      song.artist = self
      @@songs << song
    end 
  end 
  
  


end 