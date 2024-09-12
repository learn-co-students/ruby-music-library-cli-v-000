require 'pry'

class Genre 
  extend Concerns::Findable
  
  attr_accessor :name 
  attr_reader :songs

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = [] # This is filled with songs by calling each song's #genre= method.
  end 
  
  def self.all 
    @@all
  end 
  
  def save 
    self.class.all << self
  end 
  
  def self.destroy_all 
    self.all.clear
  end 
  
  def self.create(name)
    self.new(name).tap {|genre| genre.save}
  end 

  def artists 
    self.songs.collect{|song| song.artist}.uniq
  end
end 