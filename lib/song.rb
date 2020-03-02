require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    # @artist = artist
    # @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # artist argument below is the artist object and not a string.
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song == nil
      song = Song.create(name)
    end
    song
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, song_name = info[0], info[1]
    genre = info[2].gsub(".mp3", "")

    song = self.new(song_name)
    song.artist = Artist.find_or_create_by_name(artist)
    song.genre = Genre.find_or_create_by_name(genre)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
  end

end
