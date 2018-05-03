require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  # Instance Methods

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def genres
    artist_genres = self.songs.collect do |song|
      song.genre
    end
    artist_genres.uniq
  end

  def save
    @@all << self
  end

  def add_song(song)
    if @songs.include?(song) == false
      @songs << song
    end
    if song.artist == nil
      song.artist = self
    end
  end

  # Class Methods

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
