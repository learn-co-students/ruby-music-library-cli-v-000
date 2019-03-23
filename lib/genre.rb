class Genre 
  extend Concerns::Findable
  attr_accessor :name 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def artists
    @songs.collect do |a| #collect returns a NEW array containing values returned by block
      a.artist
    end.uniq
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all 
    @@all.clear
  end 
  
  def save 
    @@all << self
    self
  end
  
  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
  end
  
  def songs 
    @songs
  end
  
end