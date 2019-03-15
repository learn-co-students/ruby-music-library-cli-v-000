require_relative './concerns/findable.rb'
class Genre
  extend Concerns::Findable
  
  attr_accessor :name, :songs
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end
  
  def artists
    @songs.collect {|s| s.artist}.uniq
  end
end