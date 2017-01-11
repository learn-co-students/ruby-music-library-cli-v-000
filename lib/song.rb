require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil)
    @name = name
    self.artist = artist if artist
    save
  end

  def self.create(name, artist = nil)
    song = self.new(name, artist = nil)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
