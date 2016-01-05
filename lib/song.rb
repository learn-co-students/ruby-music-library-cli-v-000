require 'pry'
require_relative './artist.rb'
require_relative './genre.rb'
require_relative '../concerns/findable.rb'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file = filename.split(" - ")
    genre = file[2].split(".")
    new_song = Song.new(file[1])
    new_song.artist = Artist.find_or_create_by_name(file[0])
    new_song.genre = Genre.find_or_create_by_name(genre[0])
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    new_song.save
    new_song
  end
end