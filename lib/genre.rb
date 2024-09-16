require 'pry'

class Genre

  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
    @artist = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self.name
  end

  def self.create(name)
    Genre.new(name)
  end

  def songs
    @songs
  end

  def artist
    @artist
  end

  def add_song(song)
    @songs.include?(song) ? nil : @songs << song
    song.genre == self ? nil : song.genre = self
  end

  def artists
    artists = self.songs.collect {|song|song.artist}
    artists.uniq
  end

end
