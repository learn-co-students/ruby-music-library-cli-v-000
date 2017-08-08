require 'pry'
require 'concerns/findable'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  extend Concerns::Findable
  @@all = []

  def initialize(song_name, artist_name = nil, genre_name = nil)
    @name = song_name
    self.artist = artist_name if artist_name
    self.genre = genre_name if genre_name
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
    new_song = new(name)
    @@all << new_song
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    names = filename.split(" - ")
    artist_name = names[0]
    song_name = names[1]
    genre_name = names[2].split(".")[0]
    new_song = self.find_or_create_by_name(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    new_song.genre = genre
    new_song.artist = artist
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
