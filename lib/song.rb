require "pry"

class Song
  # Initial Set Up
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    if artist != ""
      self.artist=(artist)
    end
    if genre != ""
      self.genre=(genre)
    end
  end

  # Class Methods
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre = filename.split(" - ")
    genre_name, mp3 = genre.split(".")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  # Instance Methods
  def save
    @@all << self
    self
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

end
