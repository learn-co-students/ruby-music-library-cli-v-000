require 'pry'

class Song
  attr_accessor :name
 
  @@all= []
  
  def initialize(name)
    @name = name
    @@all = []
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
  
  def self.create(song)
    song = self.new(song)
    song.save
  end
  
end