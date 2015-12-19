require_relative "../config/environment.rb"
require 'pry'
class Song
  extend Concerns::Findable
  

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist="", genre=" ")
    @name = name
    artist.is_a?(Artist) ? self.artist=artist : artist = Artist.new(artist)
    genre.is_a?(Genre) ? self.genre=genre : Genre.find_or_create_by_name(genre)
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    info = filename.chomp(".mp3").split(" - ")
    # binding.pry
    song = self.new(info[1])
    song.artist = Artist.create(info[0])
    song.genre=Genre.find_or_create_by_name(info[2])
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) || genre.songs << self
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
end


