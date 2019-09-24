class Song 
  attr_reader :name, :artist
  
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    @artist = artist 
  end
  
  def name
    @name
  end
  
  def artist 
    @artist
  end
  
  def artist=(artist)
    @artist = artist
  end
  
  def name=(name)
    @name = name
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
    @name = name
    self.new(name).save
    self
  end
end