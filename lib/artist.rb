require 'pry'

class Artist

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    # binding.pry
    @songs << song
    song.artist = self if song.artist == nil
    self.songs.uniq!
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    @@all << artist
    artist
  end

  def self.destroy_all
    self.all.clear
  end

end
