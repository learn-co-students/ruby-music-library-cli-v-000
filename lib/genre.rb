class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  @@all = [] 
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self 
  end
  
  def self.create(name)
    genre = new(name)
    genre.save 
    genre
  end
  
  def songs
    @songs
  end
  
  def artists 
    songs.map(&:artist).uniq
  end
end