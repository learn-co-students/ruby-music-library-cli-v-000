class Song
  
  attr_accessor :name, :songs, :genre
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    @genre = genre 
  end
    
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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
    @@all << Song.new(song)
     Song
     
     
  end

  
  
end

