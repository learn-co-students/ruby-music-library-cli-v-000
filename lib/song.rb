require 'pry'
class Song

  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name, artist_param=nil, genre_param=nil)
    @name = name
    self.genre = genre_param if genre_param
    self.artist = artist_param if artist_param
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def genre
    @genre
  end

  def save
      @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    song = self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

end
