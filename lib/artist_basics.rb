require 'pry'

class Artist
  attr_accessor :name, :song

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(artist_name)
    Artist.new(artist_name).save
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end

  def songs
    @songs
  end

end
