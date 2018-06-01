require 'pry'
require_relative './concerns_module.rb'

class Song
  extend Concerns::Findable
  # include Concerns::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.send("artist=", artist) if artist
    @genre = genre
    self.send("genre=", genre) if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    if !genre.songs.include?(self)
      genre.songs << self
    end
    @genre = genre
  end

  def self.new_from_filename(filename)
    array = filename.gsub(".mp3", "").split(" - ")
    artist = array[0]
    name = array[1]
    genre = array[2]

    song = Song.find_or_create_by_name(name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end
end
