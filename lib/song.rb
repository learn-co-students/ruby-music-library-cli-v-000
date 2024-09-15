require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    song_name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    genre =  filename.split(" - ")[2].split(".")[0]
    song_instance = find_or_create_by_name(song_name)
    artist_instance = Artist.find_or_create_by_name(artist)
    song_instance.artist = artist_instance
    genre_instance = Genre.find_or_create_by_name(genre)
    song_instance.genre = genre_instance
    song_instance
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

end
