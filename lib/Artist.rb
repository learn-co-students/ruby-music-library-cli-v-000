require 'pry'

class Artist 

  extend Concerns::Findable

  # extend Concerns::Findable


  #CLASS VARIABLES 
  
  @@all = []
  
  #INSTANCE VARIABLES
  
  attr_accessor :name, :songs
  
  #INSTANCE METHODS 
  
  def initialize(name) 
    @name = name 
    @songs = []
  end
  
  def save 
    self.class.all << self
  end
  
  def songs 
    @songs
  end 
    
  def add_song(song)
    song.artist = self unless song.artist
    @songs << song unless @songs.include?(song)
  end
  def genres
    uni = self.songs.collect do |song|
      song.genre
    end 
    uni.uniq
  end 
    
  
  #CLASS METHODS 
  
  def self.all
    @@all
  end 
  def self.destroy_all
    self.all.clear
  end 
  def self.create(artist_name)
    artist = Artist.new(artist_name)
    artist.save
    artist
  end
end 