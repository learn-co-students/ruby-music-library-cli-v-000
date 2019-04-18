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
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    # self.@@all.clear doesn't work because...???
    @@all = []
  end 
  
  def self.create(new_artist) 
    n_a = Artist.new(new_artist)
    n_a.save
    n_a
  end 
  
  def songs
    @songs  
  end 
  
  def add_song(song)
    song.artist ||= self
    song.artist = self 
  end 

end   
  