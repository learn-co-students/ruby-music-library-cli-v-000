require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.class.all << self
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self) if self.artist != nil
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self) if self.genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(song)
    self.new(song)
  end


  def self.new_from_filename(file)
    Song.new(file.split(" - ")[1], Artist.find_or_create_by_name(file.split(" - ")[0]),Genre.find_or_create_by_name(file.split(" - ")[2].split(".")[0]))
  end

  def self.create_from_filename(file)
    Song.new_from_filename(file)
  end
end
