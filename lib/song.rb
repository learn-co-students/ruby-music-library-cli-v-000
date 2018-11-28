class Song
  @@all = []
  attr_accessor :name, :artist
  
  def initialize(name, artist)
    @name = name
    @artist = artist
    
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
    new_song = Song.new(song)
    new_song.save
    new_song
  end
end