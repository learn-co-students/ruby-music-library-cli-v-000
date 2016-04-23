require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "", genre = "")
    @name = name
    artist.add_song(self) unless artist == ""
    genre.add_song(self) unless genre == ""
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
    self
  end

  def genre=(name)
    @genre = name
    @genre.add_song(self)
    self
  end

  def name=(name)
    @name = name
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

  def self.create(song)
    new_song = Song.new(song)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.detect { |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    self.create(name) unless self.find_by_name(name)
    self.find_by_name(name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename[0...-4].split(" - ")
    new_song = self.new(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song.save
    new_song
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename[0...-4].split(" - ")
    new_song = self.find_or_create_by_name(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song.genre = Genre.find_or_create_by_name(genre)
    new_song
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
  # binding.pry
end
