class Song 
  attr_accessor :name, :artist, :genre  
  @@all = []
  def initialize(name, artist = artist)
    @name = name 
    @artist = artist
  
  end
  
  def self.all
    @@all
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all 
    @@all.clear
  end
  
  def self.create(song_name)
    song_created = Song.new(song_name)
    song_created.save
    song_created
  end
  
  
end