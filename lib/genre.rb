class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs, :artists
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
    @artists = []
    self.save
  end
  
  def save
    @@all << self
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end
  
end