require_relative '../lib/findable.rb'
require "pry"

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist.songs << self unless artist.nil?
    self.genre.songs << self unless genre.nil?
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

  def self.create(title) 
    new_song = Song.new(title)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self unless @genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    filename_array = self.normalize_filename(file)
    new_song = Song.new(filename_array[1])
    new_song.set_artist(filename_array[0])
    new_song.set_genre(filename_array.last)
    new_song
  end

  def self.create_from_filename(file)
    filename_array = self.normalize_filename(file)
    new_song = Song.create(filename_array[1])
    new_song.set_artist(filename_array[0])
    new_song.set_genre(filename_array.last)
    new_song
  end

  def self.normalize_filename(file)
    file.gsub(".mp3", "").split(" - ")
  end

  def set_artist(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end

  def set_genre(name)
    self.genre = Genre.find_or_create_by_name(name) 
    self.genre.add_song(self)
  end
    
end