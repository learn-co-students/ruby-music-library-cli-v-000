require_relative '../config/environment.rb'
require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  extend Concerns::Findable
  extend Persistable::ClassMethods
  include Persistable::InstanceMethods

  @@all = []

  def self.all
    @@all
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.new_from_filename(filename)
    name_from_file = filename.split(" - ")[1]
    artist_from_file = filename.split(" - ")[0]
    genre_from_file = filename.split(" - ")[2].split(".")[0]

    artist_object = Artist.find_or_create_by_name(artist_from_file)
    genre_object = Genre.find_or_create_by_name(genre_from_file)
    song_object = Song.new(name_from_file, artist_object, genre_object)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def genre= (genre_object)
    @genre = genre_object
    genre_object.songs << self if !genre_object.songs.include?(self)
  end

  def self.create(name)
    song = Song.new(name)
    self.all << song
    song
  end

  def artist= (artist_object)
    @artist = artist_object
    artist_object.add_song(self)
  end
end
