class Artist 
  attr_accessor :name, :artist  
  @@all = [] 
  
  def self.all 
    @@all 
  end 
  
  def initialize(name) 
    @name = name
    @songs = []
  end 
  
  def self.destroy_all 
    @@all = [] 
  end 
  
  def save 
    @@all << self
  end 
  
  def self.create(name)
    new(name).tap {|s| s.save} 
  end 
  
  def songs
    @songs
     
  end 
  
  def add_song(song)
    @songs << song
    songs
  end
  
  # def name
  #   self.select {|a| a == name}
  # end 
    
  
  
end