require "pry"
class Song 
  #attr_reader :artist
  attr_accessor :name, :artist
  #attr_writer :artist
  
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    self.artist = @artist 
  end
  
  def name
    @name
  end
  
  def artist 
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    if artist != nil
      artist.add_song(self)
    end
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