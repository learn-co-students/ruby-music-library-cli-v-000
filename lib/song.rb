class Song 
  
  attr_accessor :name, :artist 
  
  @@all = []
  
  def initialize(name, *artist_object)
    @name = name 
    self.artist=(artist_object)
  end
  
  def artist=(artist_object)
    @artist = self.artist(artist_obect)
    Artist.add_song(self)
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear 
  end
  
  def save
    @@all << self 
  end 
  
  def self.create(song)
    song = self.new(name)
    song.save
    song
  end
  
  
end
  