require "pry"

class Artist
  extend Concerns::Findable
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    @@all << artist = self.new(name)
    artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    
    #if song.artist == nil
      song.artist = self unless song.artist
      @songs << song unless @songs.include?(song)
  end 
  
  def genres
    songs.collect {|song| song.genre}.uniq
  end
    
  
end 
