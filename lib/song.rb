require 'pry'

class Song

  attr_accessor :name, :artist
  attr_reader

  @@all = []

  def initialize(name, artist=nil)
    @name = name
  #  self.artist = artist
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

def artist=(artist)
  @artist = artist
  artist.add_song(self)
end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end



end #Song class
