require 'artist'
require 'genre'
require "pry"

class Song
  attr_reader :artist
  attr_accessor :name

  @@all = []

  def initialize(name, artist_name = nil )
    @name = name
    self.artist=(artist_name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    @artist
  end
end
