require 'pry'
require 'concerns/findable'

class Artist
  attr_accessor :name, :songs
  attr_reader :genres
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = new(name)
    @@all << new_artist
    new_artist
  end

  def add_song(song)
    song.artist ||= self
    @songs << song unless @songs.include?(song)
  end

  def genres
    genres = []
    self.songs.each do |song|
      genres << song.genre unless genres.include?(song.genre)
    end
    genres
  end
end
