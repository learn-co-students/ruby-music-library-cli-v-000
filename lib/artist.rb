require "pry"
require_relative "./concerns/findable"

class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  attr_writer :genres

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    if !@songs.include?(song)
      @songs << song
    end
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def genres
    genres = []

    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end

    genres
  end
end
