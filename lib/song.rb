require "pry"
class Song 
  attr_accessor :name    
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    #@artist = artist
    self.artist=(artist) if artist

  end

  def self.all
    @@all
  end
  
  def artist
    @artist
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def save
    self.class.all << self
  end
  
  def self.create(name)
    song = self.new name
    @@all << song.save
  end 
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) 
      return find_by_name(name)
    else
      create_by_name(name)
    end
  end
end