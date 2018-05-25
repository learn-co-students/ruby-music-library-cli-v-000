class Artist
  
  attr_accessor :name
  
  @@all = []
  
  def initialize(name) 
    @name = name 
    @songs = []
  end
  
  def save 
    @@all << self
  end
  
  def songs
    @songs 
  end
  
  def add_song(song)
    @songs << song 
    song.artist = self
  end
  
  def self.all 
    @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save 
    artist
  end
  
end 