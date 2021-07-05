require 'pry' 

class Genre 
  extend Concerns::Findable
  
   @@all = []

  attr_accessor :name, :songs

  def initialize(name) 
   @name = name 
   @songs = []
  end 

  def self.all 
   @@all 
  end
  
  def save 
    @@all << self
  end
  
  def self.destroy_all 
    self.all.clear 
  end 
  
  def self.create(name) 
   self.new(name).tap {|genre| genre.save} 
  end

  def artists 
   self.songs.collect{|s| s.artist}.uniq
  end
  
  
end