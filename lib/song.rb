require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :genre, :artist
  @@all = []
  def initialize(name,artist=nil,genre=nil)
    @name = name
    @artist = artist
    @genre = genre
    genre.add_song(self) unless @genre == nil
    artist.add_song(self) unless @artist == nil
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

  def self.create(name,artist=nil,genre=nil)
    song = self.new(name)
    song.save
    song.artist = artist unless artist == nil
    song.genre = genre unless genre == nil
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

  def self.create_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.create(song_name, artist, genre)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts.first, parts[1], parts[2].gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name,artist,genre)
  end

end
