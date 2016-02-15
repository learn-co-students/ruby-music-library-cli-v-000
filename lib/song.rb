require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all =[]

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
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
    new_filename = filename.split(" - ")
    name = new_filename[1]
    artist = Artist.find_or_create_by_name(new_filename[0])
    genre = Genre.find_or_create_by_name(new_filename[2].split(".")[0])
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_filename = filename.split(" - ")
    name = new_filename[1]
    artist = Artist.find_or_create_by_name(new_filename[0])
    genre = Genre.find_or_create_by_name(new_filename[2].split(".")[0])
    self.create(name, artist, genre)
  end
end


