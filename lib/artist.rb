require 'pry'

class Artist 

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
    if self.song == nil 
       song.artist = self 
       artist.songs << song
     else 
       nil
     end
  end
  
 def genres 
   self.songs.collect{|s| s.genre}.uniq
 end
    

  
end