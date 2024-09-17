require 'pry'

class Artist
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
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

  def self.create(artist)
    self.new(artist)
  end

  def songs
    @songs
  end

  def add_song(song)
     song.artist = self if song.artist == nil
     @songs << song if !self.songs.include?(song)
  end

  def genres
    all_genres = self.songs.collect {|song| song.genre}
    all_genres.uniq
  end
end
