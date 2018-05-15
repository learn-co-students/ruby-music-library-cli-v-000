require 'pry'

class Song

  attr_reader   :artist, :genre
  attr_accessor :name

  @@all = Array.new

  def initialize(name, artist = nil, genre = nil)
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
    self.class.all << self
  end

  def self.create(name)
    new(name).tap{ |s| s.save }
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    artist_str = filename.split(" - ")[0]
    genre_str = filename.split(" - ")[2].split(".")[0]
    song_str = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(artist_str)
    genre = Genre.find_or_create_by_name(genre_str)
    new(song_str, artist, genre)
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end
end
