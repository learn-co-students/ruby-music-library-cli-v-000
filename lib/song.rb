
class Song
  
  attr_accessor :name
  attr_reader :artist
  attr_writer 
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    if artist != nil
      self.artist = artist
    end
  end 
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    self.all.clear
  end 
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    @@all << song = self.new(name)
    song
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

end