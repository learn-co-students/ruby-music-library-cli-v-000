require "pry"
require "./concerns/concerns.rb"

class Artist
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    name = song.name
    self.songs << song unless self.songs.find { |song| song.name == name }
  end

  def genres
    genres = []
    self.songs.collect { |song| genres << song.genre unless genres.include?(song.genre) }
    genres
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def self.destroy_all
    self.all.clear
  end

end
