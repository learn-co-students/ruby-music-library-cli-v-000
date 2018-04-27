class Song

  attr_accessor :name, :genre, :artist
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    @artist = artist
  end
  
  def self.create(song)
    song = self.new(song)
    @@all << song
    song
  end 

  def save
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def artist=(artist)
    Artist.add_song(song)
  end
    

end