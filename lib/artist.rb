require 'pry'

class Artist
    attr_accessor :name
    
    extend Concerns::Findable
    
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
    @@all << self
  end
  
  def self.create(name)
   artist = self.new(name)
   artist.save
   artist
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres
     songs.collect do |song|
       song.genre
    end.uniq
  end
  
end