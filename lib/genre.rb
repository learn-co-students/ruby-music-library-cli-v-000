#f

class Genre 
  
  extend Concerns::Findable
  

  attr_accessor :name, :songs
  
  @@all = []
  
  def artists 
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all
    @@all = []
  end
  
  def save
    @@all << self
  end 
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  def songs
    @songs
  end 
    
  def initialize(name) 
    @name = name 
    @songs = []
  end 
  
end 