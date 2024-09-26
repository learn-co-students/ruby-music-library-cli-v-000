require 'pry'
require_relative "../concerns/findable.rb"

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name,artist = nil,genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
    self.save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    Song.all << self
  end

  def self.create(song)
    Song.new(song)
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
    split = filename.gsub(".mp3","").split(" - ")
    artist = Artist.find_or_create_by_name(split[0])
    genre = Genre.find_or_create_by_name(split[2])
    name = split[1]
    #does not account for song already existing at the moment
    Song.new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end