class Artist  
  attr_reader :name 
  attr_accessor :song 
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def songs 
    @songs
  end
  
  def name
    @name
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
  
  def add_song
    @song.artist = self
  end
end