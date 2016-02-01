require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = []

  def songs
    @songs
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
    new_artist = Artist.new(name)
    @@all << new_artist
    new_artist
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
    unless song.artist ==  self
      song.artist = self
    end
  end

  def genres
    genres = []
    @songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end
end