class Artist  
  attr_accessor :name, :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    
  end 
  
  def save 
    @@all << self 
  end 
  
  def self.all
    @@all
  end 
  
  def self.destroy_all 
    @@all = []
  end 
  
  def self.create(name)
    name = self.new(name)
    name.save
    name
  end 
  
  
  def add_song(song)
    if song.artist == nil 
      @songs << song
      song.artist = self
    end 
  end
  
  
end 