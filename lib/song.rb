require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
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

  def save
    self.class.all << self
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(song)
    self.all.detect {|s| s.name == song}
  end

  def self.find_or_create_by_name(song)
    self.find_by_name(song) || self.create(song)
  end

  def self.new_from_filename(filename)
    artist = Artist.find_or_create_by_name(filename.split(/\s-\s|\.mp3/)[0])
    genre = Genre.find_or_create_by_name(filename.split(/\s-\s|\.mp3/)[2])
    Song.new(filename.split(/\s-\s|\.mp3/)[1],artist,genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
end
