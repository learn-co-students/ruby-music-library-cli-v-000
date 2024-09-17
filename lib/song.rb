class Song 
  attr_accessor :name
  attr_reader :artist
  @@all = []
  
  def initialize(name, artist = nil)
    @name = name
    artist=(artist)
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
    Song.new(name).tap do |song|
      song.save
    end 
  end 
  
  def artist=(artist)
    artist.add_song(self) unless artist == nil 
    @artist = artist 
  end 

end 