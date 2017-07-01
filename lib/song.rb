require "pry"

class Song
  attr_accessor :name, :artist, :genre, :song
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def artist
    @artist
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file)
    artist_name = file.split(" - ")[0]
    artist = Artist.find_or_create_by_name(artist_name)
    song_name = file.split(" - ")[1]
    genre_name = file.split(" - ")[2].gsub(/[.mp3]/, '')
    genre = Genre.find_or_create_by_name(genre_name)
    song = self.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    song = self.new_from_filename(file)
    @@all << song
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    @@all << song
    song
  end

end
