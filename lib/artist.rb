class Artist 
  attr_accessor :name, :song
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
   def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    artist = self.new name
    @@all << artist.save
  end 
  
  def songs
    @songs
  end
  
  def add_song(song)
    if song.artist != self
      song.artist = self
        @songs << song
    else 
      song.artist
    end
  end
 
    
end