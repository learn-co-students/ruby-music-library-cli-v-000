require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.create(name)
    artist = self.new(name).tap { |a| a.save }
  end

  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.collect { |song| song.genre }.uniq
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
