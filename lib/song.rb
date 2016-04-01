require_relative '../concerns/findable.rb'
require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@songs = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
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

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def add_artist(artist)
    new_artist = artist
    new_song = artist.add_song(self)
    new_song.artist = new_artist
  end

  def self.new_from_filename(filename)
    # song = self.create(filename)
    song = filename.chomp!(".mp3")
    # song = filename.split(" - ")
    name = song.split(" - ")[1]
    artist = song.split(" - ")[0]
    genre = song.split(" - ")[2]
    new_song = Song.new(name)
    new_song.artist=(artist)
    new_song.genre = genre
    new_song
  end

end
