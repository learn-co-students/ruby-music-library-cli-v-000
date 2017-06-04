# require_relative './concerns/findable.rb'
require 'pry'
class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end


  def self.new_from_filename(file_name)
    new_song = self.new(file_name.split(" - ")[1])
    new_song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    new_song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(".mp3", ""))
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new(file_name.split(" - ")[1])
    new_song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    new_song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(".mp3", ""))
    new_song.save
    new_song
  end

end
