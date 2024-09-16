require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    self.save
  end

  #ClassMethods

  def self.create(name)
    self.new(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    genre_name = filename.split(" - ")[2].split('.')[0]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

  #InstanceMethods
  def save
    @@all << self
  end

  def artist=(artist)
    @artist=artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    @genre.add_song(self)
  end

end
