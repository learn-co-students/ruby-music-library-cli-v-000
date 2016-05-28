require "pry"
require "./concerns/concerns.rb"

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    self.name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    name = self.name
    genre.songs << self unless genre.songs.find { |song| song.name == name }
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.create_from_filename(filename)
    data = filename.split(" - ")
    song = self.find_or_create_by_name(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2].chomp(".mp3"))
    song
  end

  def self.destroy_all
    self.all.clear
  end

  def self.new_from_filename(filename)
    data = filename.split(" - ")
    song = self.find_or_create_by_name(data[1])
    song.artist = Artist.find_or_create_by_name(data[0])
    song.genre = Genre.find_or_create_by_name(data[2].chomp(".mp3"))
    song
  end

end
