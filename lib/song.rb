require 'pry'
class Song
  @@all = [ ]
  attr_reader :artist, :genre
  attr_accessor :name

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def save
    @@all << self
  end

  def artist=(artist)
    # binding.pry
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)

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
