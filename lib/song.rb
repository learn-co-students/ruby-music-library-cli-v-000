require_relative '../concerns/findable.rb'
require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end


  def genre=(genre)
    @genre = genre
    unless @genre.songs.include?(self)
      @genre.songs << self
    end
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.split(" - ")
    song = self.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    genre = genre.split(".")[0]
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  # constructor
  def self.create(name)
    new_by_name = Song.new(name)
    new_by_name.save
    new_by_name
  end
end
