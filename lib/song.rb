require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name)
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.chomp(".mp3").split(" - ")
    song = self.new(name)
    song.artist_name=(artist)
    song.genre_name=(genre)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by_name(genre)
  end
end
