require 'pry'
require_relative '../config/environment.rb'
class Artist 
  extend Concerns::Findable 
  
  attr_accessor :name, :songs, :genres
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
    @@all << self 
  end 
  
  def songs 
    @songs 
  end 
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all 
    @@all.clear 
  end 
 
  def save 
    @@all << self 
    @@all.uniq!
  end 
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist  
  end 
  
  def add_song(song)
   
      song.artist = self  unless song.artist 
    songs << song unless songs.include?(song)
   
    
  end 

  def genres 
    #returns all of the artists songs 
    artist_songs = songs.collect {|song| #binding.pry 
    song.genre}.uniq 
  artist_songs 
  end 

end 