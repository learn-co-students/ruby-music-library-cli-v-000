require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist="", genre="")
    @name = name
    self.artist = artist if artist != ""
    self.genre = genre if genre != ""
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    song = self.new(song_name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split('-')[1].strip!
    artist_name = file_name.split('-')[0].strip!
    genre_name = file_name.split('-')[2].strip!.split('.')[0]
    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end

  def self.create_from_filename(file_name)
    song_name = file_name.split(' - ')[1]
    artist_name = file_name.split(' - ')[0]
    genre_name = file_name.split(' - ')[2].split('.')[0]
    song = self.create(song_name)
    song.artist = Artist.find_or_create_by_name(artist_name)
    song.genre = Genre.find_or_create_by_name(genre_name)
    song
  end
end