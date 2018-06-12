require 'pry'
class Genre 
  extend Concerns::Findable
  
  @@all = []
  
  attr_accessor :name 
  attr_reader :songs 
  
  def initialize(name)
    @name = name 
    @songs = []
  end 
  
  def save 
    @@all << self 
  end 

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save 
    new_genre 
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    @@all.clear
  end 
  
  def artists
    @songs.map {|song| song.artist}.uniq 
  end 
  
end 