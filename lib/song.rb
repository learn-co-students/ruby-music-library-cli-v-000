require_relative '../concerns/findable.rb'
require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist

  @@songs = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    @artist=(artist)
  end

  def self.all
    @@songs
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@songs << self
  end

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.songs << self
    artist.add_song(self)
  end

  def add_artist(artist)
    new_artist = artist
    new_song = artist.add_song(self)
    new_song.artist = new_artist
  end

end
