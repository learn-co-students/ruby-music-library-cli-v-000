require 'pry'
require_relative '../config/environment.rb'

class Song
  extend Concerns::Findable

  attr_accessor :name, :all, :artist, :genre, :songs

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @artist = artist
    artist.add_song(self) if artist != nil
    @genre = genre
    genre.songs << self if genre != nil
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) 
  end

  def genre=(genre)
    @genre = genre
    self.genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(file)
    file_arr = file.split(" - ")
    new_artist = Artist.find_or_create_by_name(file_arr[0])
    new_genre = Genre.find_or_create_by_name(file_arr[2].gsub(".mp3", ""))
    song = Song.new(file_arr[1], new_artist, new_genre)
  end

  def self.create_from_filename(file)
    file_arr = file.split(" - ")
    new_artist = Artist.find_or_create_by_name(file_arr[0])
    new_genre = Genre.find_or_create_by_name(file_arr[2].gsub(".mp3", ""))
    song = Song.new(file_arr[1], new_artist, new_genre)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    song = self.new(name)
  end

end


