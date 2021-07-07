class Genre 
  extend Concerns::Findable
  attr_accessor :name, :songs
  
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
    @@all << self
  end 
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save 
    genre
  end 
  
  def self.songs 
    @songs 
  end 
  
  def artists 
    songs.map(&:artist).uniq   #shorthand for array iteration
    #binding.pry
  end 
end 