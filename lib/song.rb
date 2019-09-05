require_relative './concerns.rb'

require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name

    if genre != nil
      self.genre = genre
    else
      @genre = nil
    end

    if artist != nil
      self.artist = artist
    else
      @artist = nil
    end

    @@all << self
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
    Song.new(name)
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
    filename_array = filename.split(" - ")
    new_song = find_or_create_by_name(filename_array[1])
    new_artist = Artist.find_or_create_by_name(filename_array[0])
    new_genre = Genre.find_or_create_by_name(filename_array[2].gsub(".mp3", ""))

    new_song.artist = new_artist
    new_song.genre = new_genre

    new_song
  end

  def self.create_from_filename(filename)
    new_song = new_from_filename(filename)
    new_song.save
  end

end
