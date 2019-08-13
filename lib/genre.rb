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
  
  def self.create(name)
    self.new(name).tap do |song|
      song.save
    end    
  end 
  
  def artists
    songs.map { | song| song.artist }.uniq
  end 
end 