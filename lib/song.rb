require_relative '../lib/concerns/findable.rb'
require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if !artist.nil?
    self.genre = genre if !genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.create(name, artist=nil, genre=nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(file)
    artist_str, song_str, genre_str = file.split(/\s-\s|\.mp3/) # parses file into artist, song, and genre strings with multiple assignment
    artist = Artist.find_or_create_by_name(artist_str)
    genre = Genre.find_or_create_by_name(genre_str)
    self.new(song_str, artist, genre)
  end

  def self.create_from_filename(file)
    artist_str, song_str, genre_str = file.split(/\s-\s|\.mp3/)
    artist = Artist.find_or_create_by_name(artist_str)
    genre = Genre.find_or_create_by_name(genre_str)
    self.create(song_str, artist, genre)
  end
end