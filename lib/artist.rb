require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(song)
    !(self.songs.include?(song)) ? self.songs << song : self.songs
    song.artist == nil ? song.artist = self : song.artist
  end

  def self.destroy_all
    self.all.clear
  end
end
