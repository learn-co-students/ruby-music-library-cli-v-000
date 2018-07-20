# require '../lib/artist'

class Song 
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, options = {})
    @name = name
    @artist = options[:artist] || nil
    @genre = options[:genre] || nil
  end
  
  def self.create(name, options = {})
    self.new(name, options = {}).save
  end
  
  def artist=(a)
    @artist = a 
    a.songs << self
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
end

s = Song.create("Love NYC")
p s 
puts Song.all.inspect
    