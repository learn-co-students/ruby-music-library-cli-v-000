class Artist
  attr_accessor :name, :genre, :artist

  def initialize(name)
    @name = name
       
   
  @@all << self
  end
  
  @@all = []
  
  def add_Song()
    self.Artist << Artist
    artist.song = self
  end
  
  def self.all 
   @@all
  end
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end