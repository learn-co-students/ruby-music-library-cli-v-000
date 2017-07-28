require 'pry'

class Artist

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs, :genre
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
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
    self.new(name)
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs.include?(song) ? nil : @songs << song
    song.artist == self ? nil : song.artist = self
  end

  def genres
    genres = self.songs.collect {|song|song.genre}
    genres.uniq
  end


end
