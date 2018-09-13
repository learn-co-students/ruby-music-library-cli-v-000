require 'pry'
class Song
  @@all = [ ]
  attr_reader :artist
  attr_accessor :name, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
  end
  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

# Class methods
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
