require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

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
    @@all << self
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    a, s, g = splits[0], splits[1], splits[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)
    self.new(s, artist, genre)
  end

  def self.create_from_filename(filename)
    splits = filename.split(" - ")
    a, s, g = splits[0], splits[1], splits[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(a)
    genre = Genre.find_or_create_by_name(g)
    self.create(s, artist, genre)
  end
end

