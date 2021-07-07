require_relative './concerns/findable.rb'
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
    @@all = []
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    g = self.new(name)
    g.save
    g
  end
  
  def artists
    @songs.map { |m| m.artist }.uniq
  end
  
end