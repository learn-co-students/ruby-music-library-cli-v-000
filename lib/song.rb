require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre, :artist_name, :genre_name

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name = name
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

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

  def self.new_from_filename(filename)
    artists_name = filename.split(" - ")[0]
    songs_name = filename.split(" - ")[1]
    genres_name = filename.split(" - ")[2].gsub(".mp3", "")
    song = Song.find_or_create_by_name(songs_name)
    song.artist_name = artists_name
    song.genre_name = genres_name
    song
  end

#this one isn't really doing anything different than the new from filename as it also initializes and saves - try refactoring new_from_filename so that it only instantiates
  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    #song.save
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by_name(name)
    genre.add_song(self)
  end

end
