require 'pry'
class Artist 
  extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name, :songs 
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def add_song(song)
    song.artist = self if song.artist == nil
    @songs << song if !@songs.include?(song)
  end 

  def save 
    @@all << self 
  end 
  
  def genres
    @songs.map {|song| song.genre}.uniq 
  end 
  
  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save 
    new_artist 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
end 