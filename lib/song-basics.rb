require "byebug"
require_relative "../config/environment.rb"

class Song
  include Concerns::Stringable

  @@all = []

  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist == nil
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre == nil
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    @@all.detect {|a| a.name == name}
  end

  def self.create(name)
    new(name).tap { |it| it.save }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.destroy_all
    @@all.clear
  end

  def self.new_from_filename(filename)
    matches = filename.match /(?<artist>.+) - (?<title>.+) - (?<genre>.+).mp3/
    song = new(matches[:title])
    song.artist = Artist.find_or_create_by_name matches[:artist]
    song.genre = Genre.find_or_create_by_name matches[:genre]
    song
  end

  def self.create_from_filename(filename)
    file_name_song = new_from_filename(filename)
    file_name_song.save
    file_name_song
  end


  def save
    self.class.all << self
  end

end
