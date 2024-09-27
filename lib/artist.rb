require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def save
   @@all << self
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
    self.songs << song unless self.songs.include?(song)
    song.artist = self if song.artist == nil
  end

  def genres
    self.songs.collect {|s| s.genre}.uniq
  end
end