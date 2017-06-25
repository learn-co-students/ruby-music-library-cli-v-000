require 'pry'
#require_relative "../concerns/findable.rb"
class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
    @songs = []
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  #We can set an individual instance of Song equal
  #to an instance of the Artist class like this:

  def self.all # candidate for module (Class reader)
    @@all
  end

  def self.destroy_all # candidate for module (Class helper)
    @@all.clear
  end

  def save # candidate for module
    @@all << self
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def songs
    @songs
  end

  def self.find_by_name(name)
    @@all.detect{|a| a.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(file_name)
    artist_name = file_name.split(" - ")[0]
    song_name = file_name.split(" - ")[1]
    genre_name = file_name.split(" - ")[2].gsub(".mp3", '')

      song = self.new(song_name)
      song.artist_name = artist_name
      genre = Genre.find_or_create_by_name(genre_name)
      song.genre = genre
      #binding.pry
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end

end
