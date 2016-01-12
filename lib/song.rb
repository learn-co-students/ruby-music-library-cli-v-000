require_relative '../lib/concerns/findable.rb'
require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if !artist.nil?
      self.artist = artist
    end
    if !genre.nil?
      self.genre = genre
    end
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)
    genre.songs << self
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self 
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    @@all << self.new(name, artist, genre)
    @@all.last
  end

  def self.new_from_filename(filename)
    parsed_filename = filename.split(".")[0]
    artist_name = parsed_filename.split(" - ")[0]
    genre_name = parsed_filename.split(" - ")[2]
    song_name = parsed_filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    parsed_filename = filename.split(".")[0]
    artist_name = parsed_filename.split(" - ")[0]
    genre_name = parsed_filename.split(" - ")[2]
    song_name = parsed_filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)

  end
end