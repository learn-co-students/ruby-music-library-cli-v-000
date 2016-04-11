require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
    song.artist = artist
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
    song = Song.new(name)
    song.save
    song
  end
end