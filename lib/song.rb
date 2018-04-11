require 'artist'
require 'genre'
require "pry"
require_relative './concerns/concerns.rb'

class Song
  extend Concerns::Findable

  attr_reader :artist, :genre, :filename
  attr_accessor :name, :number

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
    @artist.add_song(self)
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    file_array = filename.split(/ - /).map { |section| section.strip }
    file_array[-1].slice!(".mp3")
    song = Song.find_or_create_by_name(file_array[1])
    song.artist = Artist.find_or_create_by_name(file_array[0])
    song.genre = Genre.find_or_create_by_name(file_array[2])
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

end
