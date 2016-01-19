require 'pry'
require_relative './artist.rb'
require_relative './genre.rb'

require_relative 'concerns/concerns.rb'

class Song
  attr_accessor :name, :artist, :genre

  extend Concerns::Findable

  @@all=[]

  DEFAULT_ARTIST = Artist.new("default artist")
  DEFAULT_GENRE = Genre.new("default genre")

  def initialize(name, artist=DEFAULT_ARTIST, genre=DEFAULT_GENRE)
    @name = name
    @artist = artist
    artist.add_song(self)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file_name)
    data = file_name.split(' - ')
    artist = Artist.find_or_create_by_name(data[0].strip)
    name = data[1].strip
    genre = Genre.find_or_create_by_name(data[2].strip.chomp('.mp3'))
    self.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    song = self.new_from_filename(file_name)
    song.save
    song
  end

end