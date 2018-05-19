class Genre 
  extend Concerns::Findable
  @@all = []
  attr_accessor :name
  def initialize(name)
    @name = name
    @@all << self
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
  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre.save 
    genre
  end 
  def songs
    @songs
  end 
  def artists 
    artist_collection = self.songs.collect do |song|
      song.artist
    end 
    artist_collection.uniq
  end 
  
    
  
    
  

end 