require 'pry'

class Song
  extend Concerns::Findable


  attr_accessor :name, :artist, :genre

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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

  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    artistname, songname, genrename = splits[0], splits[1], splits[2].gsub(".mp3", "")
    artist = Artist.find_or_create_by_name(artistname)
    genre = Genre.find_or_create_by_name(genrename)
    self.new(songname, artist, genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end


end
