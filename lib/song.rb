require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def self.create(name)
    Song.new(name)
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist != nil
    self.genre=(genre) if genre != nil
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    song_string = filename.split(" - ")[1]
    artist_instance = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre_string = filename.split(" - ")
    genre_instance = Genre.find_or_create_by_name(genre_string[2].split(".")[0])
    new_song = self.new(song_string, artist_instance, genre_instance)
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
  end


end
