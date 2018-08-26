class Genre 
  attr_accessor :name, :artist 
  attr_reader :genre
  
  extend Concerns::Findable
  
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
  
  def songs
    @songs
  end
  
  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end
  
  def artist 
    genre.artist = self
  end
  
  def artists 
    @songs.collect {|song| song.artist}.uniq
  end
  
end