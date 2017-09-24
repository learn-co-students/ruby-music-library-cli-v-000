require 'pry'

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.create(name, artist = nil, genre = nil)
    song = Song.new(name, artist, genre)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    name = file_name.split(" - ")[1]
    artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(/(\.mp3)/, ""))
    song = self.new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    name = file_name.split(" - ")[1]
    artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(/(\.mp3)/, ""))
    song = self.create(name, artist, genre)
  end

  def to_s
    "#{self.artist.name} - #{self.name} - #{self.genre.name}"
  end

end