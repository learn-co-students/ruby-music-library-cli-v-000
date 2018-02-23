require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre, :create

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

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    file = filename.chomp(".mp3").split(" - ")
    song_name = file[1]
    artist_obj = Artist.find_or_create_by_name(file[0])
    genre_obj = Genre.find_or_create_by_name(file[2])
    self.find_by_name(song_name) || self.new(song_name, artist_obj, genre_obj)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
