require 'pry'
class Artist
  extend Concerns::Findable 
  
  attr_accessor :name   
  attr_reader :songs, :genre
  
  @@all = []    

  def initialize(name)    
    @name = name
    @songs = []
  end
  
  def self.all    
    @@all
  end 
  
  def self.destroy_all    
    all.clear
  end 
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end 
  
  def add_song(song)
    song.artist = self unless song.artist   #makes association with song unless song already associated, song.artist == true
    @songs << song unless @songs.include?(song)     #pushes song into songs array unless already there
    #binding.pry
  end 
  
  def genres 
    songs.collect(&:genre).uniq   #shorthand for array iteration
    #binding.pry
  end 
end 