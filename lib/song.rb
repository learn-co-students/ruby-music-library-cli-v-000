require 'pry'
class Song
  extend Concerns::Findable 
  attr_accessor :name, :artist, :genre 
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
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

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    song = Song.find_or_create_by_name(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    song
  end

  def self.create_from_filename(filename)
    create = self.new_from_filename(filename)
  end

end