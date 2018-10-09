
class Genre
  
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
    self.all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    @@all << genre = self.new(name)
    genre
  end
  
  def songs 
    @songs
  end 
  
  def artists
    songs.collect{|song| song.artist}.uniq
  end
  

end 
