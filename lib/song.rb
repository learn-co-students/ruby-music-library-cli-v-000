require_relative "../concerns/modules.rb"
require "pry"

class Song
  @@all = []
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  def initialize(name, artist = nil, genre = nil)
    @name = name
    if genre != nil
      @genre = genre
      genre.add_song(self) unless genre.songs.include?(self)
    end
    if artist != nil
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
    end
  end

  def artist=(artist)
    artist.add_song(self) unless artist.songs.include?(self)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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

  def self.create(name, artist = nil, genre = nil)
    song = self.new(name, artist, genre)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    file_parse = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(file_parse[0])
    genre = Genre.find_or_create_by_name(file_parse[2].split(".")[0])
    song = Song.new(file_parse[1], artist, genre)
  end

  def self.create_from_filename(file_name)
    file_parse = file_name.split(" - ")
    artist = Artist.find_or_create_by_name(file_parse[0])
    genre = Genre.find_or_create_by_name(file_parse[2].split(".")[0])
    Song.create(file_parse[1], artist, genre)
  end




end
