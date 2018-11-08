class Genre 
  attr_accessor :name, :songs, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @songs = []
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
  
  def self.create(genre)
    new_genre = self.new(genre)
    new_genre.save 
    new_genre
  end
end