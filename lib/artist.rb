require 'pry'

class Artist
  attr_accessor :name, :songs
  # The class as a whole
  @@all = []
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.create(name)
    self.new(name).save[-1]
  end
  # Individual instances
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def add_song(song)
    binding.pry if @songs.include?(song)
    @songs << song unless @songs.include?(song)
    binding.pry
    song.artist = self if song.artist != self
  end
end
