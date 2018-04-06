class Song
  attr_accessor :name, :artist
 
  @@all= []
  
  def initialize(name)
    @name = name
    # @@all =[]
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
  
  def self.create(song)
    song = self.new(song)
    song.save
  end
  
  def song_with_artist(name, artist)
    song = self.new(name)
    artist = Artis.new(artist)
  end
end