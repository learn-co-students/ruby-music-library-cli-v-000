class Artist
   @@all = []
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
    self.save

  end
  def add_song(song)
    @songs << song
  end
  def save
    @@all << self
  end
  def self.all
    @@all
  end
end  
