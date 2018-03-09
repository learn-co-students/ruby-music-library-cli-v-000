require 'pry'
require_relative 'concerns.rb'
class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist=(artist)
    @artist = artist
    if self.artist && !artist.songs.include?(self)
      self.artist.add_song(self)
    end
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def genre=(genre)
    @genre = genre
    if self.genre && !genre.songs.include?(self)
      self.genre.add_song(self)
    end
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

  def self.new_from_filename(file)
    file = file.split(" - ")
    song = self.find_or_create_by_name(file[1])
    song.artist = Artist.find_or_create_by_name(file[0])
    song.genre = Genre.find_or_create_by_name(file[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(file)
    new_from_filename(file)
  end

end
