require_relative '../config/environment.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  # Constructors

  # Usual constructor.
  def initialize(name, artist = nil, genre = nil)
    self.name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # New and Save
  def self.create(name, artist = nil, genre = nil)
    self.new(name, artist, genre).tap {|s| s.save}
  end

  # Instance methods.

  def save
    @@all << self
  end

  def artist=(artist)
      raise AssociationTypeMismatchError unless artist.is_a? Artist
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
      raise AssociationTypeMismatchError unless genre.is_a? Genre
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
  end

  # Class methods.

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end
end
