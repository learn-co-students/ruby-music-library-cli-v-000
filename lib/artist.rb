require 'pry'

class Artist 
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
    @@all.clear
  end
  
  def self.create(name)
    self.new(name).tap { |s| s.save }
  end
  
  def save
  @@all << self
  end
  
  def add_song(song)
    if song.artist == nil 
      song.artist = self
    end
    unless @songs.include?(song)
      @songs << song 
    end
  end
  
  def songs 
    @songs
    
  end
end