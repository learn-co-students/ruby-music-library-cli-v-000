require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist != nil ? self.artist=(artist) : ""
    genre != nil ? self.genre=(genre) : ""
  end

  def self.new_from_filename(filename)
    name = filename.split(' - ')[1]
    artist_name = filename.split(' - ')[0]
    genre_name = filename.split(' - ')[2].chomp(".mp3")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    find_by_name(name) ? " " : song = self.new(name, artist, genre)

    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
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
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

end
