require 'pry'
require_relative './concerns/findable.rb'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if !artist.nil?
    self.genre = genre if !genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    attrs = filename.chomp(File.extname(filename)).split(' - ')
    song = self.new(attrs[1])
    song.artist = Artist.find_or_create_by_name(attrs[0])
    song.genre = Genre.find_or_create_by_name(attrs[2])
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def save
    self.class.all << self
  end

end
