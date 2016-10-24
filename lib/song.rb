require_relative 'concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
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

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.chomp(".mp3").split(" - ")
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    self.new(song, new_artist, new_genre)
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename.chomp(".mp3").split(" - ")
    new_artist = Artist.find_or_create_by_name(artist)
    new_genre = Genre.find_or_create_by_name(genre)
    new_song = self.create(song, new_artist, new_genre)

  end

end
