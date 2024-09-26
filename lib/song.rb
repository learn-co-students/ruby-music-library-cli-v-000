require 'pry'

class Song
  extend Concerns::Findable
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    f = filename.split(/\s-\s|\.mp3/)
    song = new(f[1])
    song.artist = Artist.find_or_create_by_name(f[0])
    song.genre = Genre.find_or_create_by_name(f[2])
    song
  end

  def self.create_from_filename(filename)
    f = filename.split(/\s-\s|\.mp3/)
    song = new(f[1])
    song.artist = Artist.find_or_create_by_name(f[0])
    song.genre = Genre.find_or_create_by_name(f[2])
    song.save
    song
  end
end
