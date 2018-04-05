require 'artist'
require 'genre'
require "pry"
require_relative './concerns/concerns.rb'

class Song
  extend Concerns::Findable

  attr_reader :artist, :genre
  attr_accessor :name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    # binding.pry
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    # binding.pry
    @artist.add_song(self)
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  # def self.find_by_name(words)
  #   all.find { |song| song.name == words }
  # end
  #
  # def self.find_or_create_by_name(words)
  #   self.find_by_name(words) ? self.find_by_name(words) : self.create(words)
  # end
end
