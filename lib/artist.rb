class Artist 

 
  attr_accessor :name, :genres
  attr_reader :songs
  
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.destroy_all
    all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
  
  end

  def genres

  end

end