require 'pry'
class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist="")
    @name = name
    
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
  end

  def save
    @@all << self
  end

  def self.all 
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
