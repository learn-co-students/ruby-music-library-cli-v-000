require "pry"

class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    # @genre = genre
    self.genre = genre if genre
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
    self.new(name).tap {|song| song.save}
  end
  #
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    # self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
    # if boolean == true ? do this positive thing : do this negative thing
     if !self.find_by_name(name)
       self.create(name)
     else
       self.find_by_name(name)
      @@all.detect {|song| song.name == name || self.new(name) }
     end
  end

  def self.new_from_filename(file)
  new_song = file.split(" - ")[1]
  # self.new(new_song)
  new_artist = file.split(" - ")[0]
  artist = Artist.find_or_create_by_name(new_artist)
  new_genre = file.split(" - ")[2].gsub(".mp3", "")
  genre = Genre.find_or_create_by_name(new_genre)
  song = Song.new(new_song, artist, genre)
  binding.pry
  song
  end

  def self.create_from_filename(file)
    new_from_filename(file).save
    # new_song = file.split(" - ")[1]
    # self.new(new_song)
    # new_artist = file.split(" - ")[0]
    # artist = Artist.find_or_create_by_name(new_artist)
    # new_genre = file.split(" - ")[2].gsub(".mp3", "")
    # genre = Genre.find_or_create_by_name(new_genre)
    # song = Song.new(new_song, artist, genre)
    # song

  end

end
