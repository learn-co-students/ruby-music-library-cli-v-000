require 'pry'

class Song
  attr_accessor :name , :genre, :artist
  extend Concerns::Findable
  
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
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
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(file)
    artist, name, genre = file.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song = Song.new(name, artist, genre)
    song
  end

  def self.create_from_filename(file)
    artist, name, genre = file.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    song = Song.new(name, artist, genre)
    song.save
    song
  end
end
