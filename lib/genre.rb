require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  # Instance Methods

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def songs
    @songs
  end

  def artists
    genre_artists = self.songs.collect do |song|
      song.artist
    end
    genre_artists.uniq
  end

  # Class Methods

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
