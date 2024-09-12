require 'pry'

class Song
  extend Concerns::Findable
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
    genre.songs << self unless genre.songs.include?(self)
    genre
  end

  #class methods

  # def self.find_by_name(name)
  #   all.detect { |song| song.name == name }
  # end
  #
  # def self.find_or_create_by_name(name)
  #   find_by_name(name) || create(name)
  # end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.gsub(".mp3","").split(" - ")
    artist = Artist.find_or_create_by_name(artist_name)
    genre =  Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre )
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save
    song
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.the_hotness
    "This program is the hotness!"
  end

end # class Song
