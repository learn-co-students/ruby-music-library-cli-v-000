require 'pry'

class Song

  attr_accessor :name
  attr_reader :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.songs << self if not @genre.songs.include?(self)
  end

  def self.find_by_name(name)
    @@all.find { |i| i.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.split(" - ").each { |i| i }
    genre = genre.gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    artist, name, genre = filename.split(" - ").each { |i| i }
    genre = genre.gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)

    self.create(name, artist, genre)
  end

end