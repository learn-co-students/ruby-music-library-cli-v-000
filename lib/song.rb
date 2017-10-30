require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist="artist")
    @name = name
    @artist = artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
  created_song = self.new(song)
  created_song.save
  created_song
  end
end
