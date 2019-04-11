class Song
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name, *artist_name)
    @name = name
    @artist = Artist.new(artist_name)

  end 
  
  def save
    @@all << self
  end
  
  def self.all 
    @@all
  end 
  
  def self.destroy_all
    # self.@@all.clear
    @@all = []
  end 
  
  def self.create(new_song) 
    n_s = Song.new(new_song)
    # new_song.initialize
    n_s.save
    n_s
  end 
  
end   
  