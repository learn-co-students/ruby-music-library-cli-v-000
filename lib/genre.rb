class Genre extend Concerns::Findable 
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
    all.clear 
  end
  
  def save
    @@all << self 
  end
  
  def self.create(name)
    new = new(name)                 
    new.save
    new 
  end
  
  def songs
    @songs 
  end
  
  def artists
    @songs.collect(&:artist).uniq 
  end
  
end