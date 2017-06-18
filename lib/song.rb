require 'pry'
class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
    song.artist # hey song, here's an artist

  end

  def self.all # candidate for module
    @@all
  end

  def self.destroy_all # candidate for module
    @@all.clear
  end

  def save # candidate for module
    self.class.all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

end
