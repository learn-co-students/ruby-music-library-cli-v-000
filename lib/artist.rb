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

   def add_song(song)
    self.songs << song
    song.artist = self
  end
  
  def self.destroy_all
    @@all.clear
  end       
  
  def save
    @@all << self
  end
  
  def self.create(artist)  
    artist = self.new(artist)
    artist.save
    artist
  end
end  


