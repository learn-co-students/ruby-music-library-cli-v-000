require_relative './concerns/concerns_module.rb'
require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize (name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist != nil
    self.genre=genre if genre != nil
    self.save
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include? (self)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include? (self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    self.new(name)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
   self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename (file_name)
    artist_name, song_name, genre_name = file_name.chomp(".mp3").split(" - ")
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename (file_name)
    self.new_from_filename(file_name)
  end

end
