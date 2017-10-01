require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name, :genre

  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @songs = []
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

  def songs
    @songs
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
  end

  def genres
      self.songs.collect{ |s| s.genre }.uniq
  end

end
