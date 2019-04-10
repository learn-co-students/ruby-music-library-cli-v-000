require_relative "./concerns/findable.rb"

class Genre 
  attr_accessor :name, :songs
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
  
  def self.create(genre)
    genre = Genre.new(genre)
    genre.save 
    genre 
  end 
  
  def artists 
    @songs.collect {|s|s.artist}.uniq 
  end 
end 