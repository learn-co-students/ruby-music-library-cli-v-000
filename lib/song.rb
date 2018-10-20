require 'pry'
class Song 
  attr_accessor :genre, :name 
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist 
    self.genre = genre if genre
  end 
  
  def self.all
    @@all 
  end 
  
  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap {|s| s.save}
  end
  
  def self.destroy_all
    @@all.clear
  end 
  
  def artist=(artist)
    @artist = artist 
    
    #binding.pry
    @artist.add_song(self)
  end
  
  def save 
    @@all << self
  end 

      # new_song = Song.new("")
      # new_song_name = new_song.instance_variable_get(:@name)
    


  
end 