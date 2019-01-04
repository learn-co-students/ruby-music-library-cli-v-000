require 'pry'
class Genre 
  extend Concerns::Findable
  attr_accessor :name, :artists, :songs
  @@all = []
  
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
    #self.new.tap {|o| o.name = name}
    genre = new(name)
    genre.save
    genre
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists
    @songs.collect{|s| s.artist}.uniq
  end

end