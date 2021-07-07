class Genre
  attr_accessor :name
  
  extend Concerns::Findable
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
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
  
  def self.create(name)
    self.new(name)
  end
  
  def songs
    @songs
  end
  
  def artists
    songs.map {|songs| songs.artist}.uniq
  end
end
