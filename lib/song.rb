class Song
  @@all = []
  attr_accessor :name
  
  def initialize(name)
    @name = name
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