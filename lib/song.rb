require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    song = self.new(name)
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

  def self.new_from_filename(filename)
    artist_name_string = filename.split(" - ")[0]
    song_name_string = filename.split(" - ")[1]
    genre_name_string = filename.split(" - ")[2].chomp(".mp3")

    song = self.new(song_name_string)
    song.artist = Artist.find_or_create_by_name(artist_name_string)
    song.genre = Genre.find_or_create_by_name(genre_name_string)
    song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end
end
