#require_relative '../lib/concerns/findable.rb'
require "pry"

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)     
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? nil : genre.add_song(self)
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
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    files = filename.split(/ - |\./)
    song_name = files[1]
    artist = Artist.find_or_create_by_name(files[0])
    genre = Genre.find_or_create_by_name(files[2])
    Song.new(song_name,artist,genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end