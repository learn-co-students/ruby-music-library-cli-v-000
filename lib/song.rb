require 'pry'
class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist=" ")
    # binding.pry
    @name = name
    # binding.pry
    if artist.is_a?(Artist)
      self.artist=(artist)
    end
   
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
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
