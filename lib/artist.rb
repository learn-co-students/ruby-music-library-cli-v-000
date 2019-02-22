class Artist 
  
  attr_accessor :name
  attr_reader :songs 
  
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

  def save
  @@all << self 
  self  
  end 
  
  def self.create(name)  
  song = new(name)
  song.save 
  song
 end 
 
  def songs
   @songs  
 end 
  
  def add_song(song) 
     @songs << song unless songs.include?(song)
     song.artist = self unless song.artist
     songs 
 end 
 
 def genres
   songs.map(&:genre)
 end 
 
 
  
end 