class Artist
  attr_accessor :songs, :name, :genre
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end
  
  def new_song(name, genre)
    Song.new(name, self, genre)
  end
  
  def songs 
    Song.all.select{|something|something.artist==self}
  end

  def add_Artist()
    self.Artist << Artist
    song.artist = self
  end
  
  def self.all 
    @@all
  end
  
  def self.reset 
    @@all.clear
  end
  
  def save 
    @@all << self
  end
  
  def self.count
    @@all.size 
  end
  
  def self.find_by_name(name)
    @@all.detect{|artist| artist.name = name}
  end

end