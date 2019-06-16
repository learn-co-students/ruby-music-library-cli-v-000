require 'pry'
class Song < Base

  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    self
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    new(name).save
  end

  def self.new_from_filename(filename)
    file = filename.gsub(".mp3", "").split(" - ")
    artist = Artist.find_or_create_by_name(file[0])
    genre = Genre.find_or_create_by_name(file[2])
    Song.new(file[1], artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
