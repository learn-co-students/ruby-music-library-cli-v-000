require 'pry'
class Song

  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.split(' - ')
    genre = genre.split('.')[0]
    song = Song.new(name)
    song.artist = artist
    song.genre = genre
    song
  end

  def self.create_from_filename(filename)
    artist, name, genre = filename.split(' - ')
    genre = genre.split('.')[0]
    song = Song.create(name)
    song.artist = artist
    song.genre = genre
    song
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      @artist = artist
      @artist.add_song(self)
    end

    if genre
      @genre = genre
      @genre.add_song(self)
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    artist.class == Artist ? @artist = artist : @artist = Artist.find_or_create_by_name(artist)
    @artist.add_song(self)
  end

  def genre=(genre)
    genre.class == Genre ? @genre = genre : @genre = Genre.find_or_create_by_name(genre)
    @genre.add_song(self)
  end
end
