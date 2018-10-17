class Artist 
  
  attr_accessor :name, :songs
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
  artist = new(artist)
  artist.save
  artist
end

def self.add_song
  song.artist = song.artist
  song
  
end
  
end