require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name; :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self if song.artist == nil
    self.songs << song if self.songs.detect {|s| s == song} == nil
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
end
