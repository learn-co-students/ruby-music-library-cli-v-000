require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  # CLASS VARIABLES AND METHODS
  @@all = Array.new

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_song = Song.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)

    song.nil? ? self.create(name) : song
  end

  def self.new_from_filename(song_file)
    song_array = song_file.split(" - ")

    artist_name = song_array[0]
    artist = Artist.find_or_create_by_name(artist_name)

    genre_name = song_array[2].split(".")[0]
    genre = Genre.find_or_create_by_name(genre_name)

    song_name = song_array[1]
    new_song = find_or_create_by_name(song_name)

    new_song.artist=(artist)
    new_song.genre=(genre)
    new_song
  end

  def self.create_from_filename(song_file)
    self.new_from_filename(song_file)
  end

  # INSTANCE VARIABLES AND METHODS
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if !(artist.nil?)
      self.artist=(artist)
    end

    if !(genre.nil?)
      self.genre=(genre)
    end
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end
end
