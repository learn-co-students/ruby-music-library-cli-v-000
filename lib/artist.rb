require "pry"
class Artist
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def genres
    genres = self.songs.collect {|song| song.genre}
    genres.uniq
  end

  def songs
      @songs
  end

  def add_song(song)
    song.artist ||= self
    self.songs.include?(song) ? song : self.songs << song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end
end
