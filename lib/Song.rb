require_relative "../lib/concerns/concerns.rb"

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    item = self.new(name)
    item.save
    item
  end

  def artist=(artist)
    unless @artist == artist
      @artist = artist
      artist.add_song(self)
    end
  end

  def genre=(genre)
    unless @genre == genre
      @genre = genre
      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
    artist_name = (filename.split(" - ")[0])
    song_name = (filename.split(" - ")[1])
    genre_name = (filename.split(" - ")[2]).gsub(".mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    self.new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end