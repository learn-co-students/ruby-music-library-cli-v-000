require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end

  def artist
    @artist
  end

  def artist= (artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    return song
  end

  def self.find_by_name(name)
    song = self.all.select {|song| song.name == name}.first
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(name)
    self.new_from_filename(name)
  end

  def self.new_from_filename(filename)
    file_name = filename.split(" - ")
    song_name = file_name[1]
    artist_name = file_name[0]
    genre_name = file_name[2].chomp(".mp3")
    song = self.find_or_create_by_name(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.destroy_all
    @@all = []
  end

end
