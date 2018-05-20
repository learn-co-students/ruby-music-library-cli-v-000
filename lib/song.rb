require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist.nil?
    self.genre=(genre) unless genre.nil?
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
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    artist_name = (filename.split(" - ")[0])
    artist = Artist.find_or_create_by_name(artist_name)
    genre_name = (filename.split(" - ")[2].chomp(".mp3"))
    genre = Genre.find_or_create_by_name(genre_name)
    song_name = (filename.split(" - ")[1])
    song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

end
