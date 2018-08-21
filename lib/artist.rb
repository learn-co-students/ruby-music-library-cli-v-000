require 'pry'

class Artist 
  extend Concerns::Findable

  @@all = []

  attr_accessor :name, :songs

  def initialize(name) 
   @name = name 
   @songs = []
  end 

  def self.all 
   @@all 
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def self.create(name) 
   self.new(name).tap {|artist| artist.save} 
  end
  
  def add_song(song)
    if song.artist == nil 
       song.artist = self
    end
    
    if !@songs.include?(song)
      self.songs << song
    end
  end
  
 def genres 
   self.songs.collect{|s| s.genre}.uniq
 end
    

  
end