require "genre"
require "song"
require_relative './concerns/concerns.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end

  def add_song(song)
    # binding.pry
    song.artist = self if !song.artist
    @songs << song if !songs.include?(song)
  end

  def genres
    songs.map { |song| song.genre }.uniq
  end
end
