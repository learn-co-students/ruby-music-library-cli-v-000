require 'pry'
require_relative "../concerns/findable.rb"

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist = nil,genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Song.all << self
  end

  def self.create(name)
    Song.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end