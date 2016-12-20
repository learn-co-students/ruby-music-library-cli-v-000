require 'pry'
class Song
  extend Concerns::Findable
  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

      self.artist = artist if !artist.nil?

      self.genre = genre if !genre.nil?
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

  def self.create(song_name, artist = nil, genre = nil)
    song = Song.new(song_name, artist, genre)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist

    artist.songs << self
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    if !genre.songs.include?(self)

      genre.songs << self
    end
  end

  def self.new_from_filename(filename)
      name = filename.split(" - ")[1]
      artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
      genre_to_split = filename.split(" - ")[2]
      genre = Genre.find_or_create_by_name(genre_to_split.split(".")[0])

      song = Song.new(name, artist, genre)

  end


  def self.create_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    genre_to_split = filename.split(" - ")[2]
    genre = Genre.find_or_create_by_name(genre_to_split.split(".")[0])

    song = Song.create(name, artist, genre)
  

  end






end
