require 'pry'

class Song
  attr_accessor :name#, :artist

  @@all = []

  def initialize(name, artist=nil)
    @name = name
    self.artist = artist if artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(song)
    new_song = self.new(song)
    new_song.save
  end

end
