require_relative '../lib/concerns/findable.rb'
require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre 
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create(name)
    Song.new(name).save
    Song.all.last
  end

  def self.destroy_all
    @@all.clear
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    filename = self.parse_filename(filename)
    binding.pry
    artist = Artist.find_or_create_by_name(filename[0]) 
    genre = Genre.find_or_create_by_name(filename[2]) 
    Song.new(filename[1], artist, genre).save

  end

  def self.parse_filename(filename)
    filename.scan(/(^.*)\s-\s(.*)\s-\s(.*)\.mp3/).flatten
  end

end
