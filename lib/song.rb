require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    save
  end

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist = nil, genre = nil)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist, song = filename.split(" - ")
    song = self.new(name).tap { |s| s.save }
    song.artist = Artist.find_or_create_by_name(name)
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
end
