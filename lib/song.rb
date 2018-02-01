require 'pry'

class Song
  attr_accessor :name, :genre, :artist
  @@all = []
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end
  def self.all
    @@all
  end
  def self.destroy_all
    @@all = []
  end
  def save
    @@all << self
  end
  def self.create (name)
    song = Song.new(name)
    song.save
    song
  end
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
      genre.songs << self if !genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.gsub(".mp3", "").split(" - ")
    artist = parts[0]
    song = parts[1]
    genre = parts[2]

    artist = Artist.find_or_create_by_name(artist)
    genre  = Genre.find_or_create_by_name(genre)
    new(song, artist, genre)
  end
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  end
