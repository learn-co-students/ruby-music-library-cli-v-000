require 'pry'

class Song
  include Memorable::InstanceMethods
  extend Memorable::ClassMethods

  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) #unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.all
    @@all
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap {|x| x.save}
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre.gsub!(".mp3","")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    artist, song, genre = filename.split(" - ")
    genre.gsub!(".mp3","")
    artist = Artist.find_or_create_by_name(artist)
    genre = Genre.find_or_create_by_name(genre)
    self.create(song, artist, genre)
  end

  def self.list_song(song)
    "#{song.artist.name} - #{song.name} - #{song.genre.name}"
  end
end
