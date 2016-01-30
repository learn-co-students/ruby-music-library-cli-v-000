require_relative './concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if !artist.nil?
    self.genre = genre if !genre.nil?
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

  def self.create(name)
    @@all << Song.new(name)
    @@all.last
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) if !genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.gsub(".mp3", "").split(" - ")[2]
    song = Song.new(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    artist = filename.split(" - ")[0]
    name = filename.split(" - ")[1]
    genre = filename.gsub(".mp3", "").split(" - ")[2]
    song = Song.create(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

end