require_relative '../concerns/findable.rb'
require 'pry'

class Song

  extend Concerns::Findable
  

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @artist = artist
    @genre = genre
    artist.add_song(self) if artist
    genre.add_song(self) if genre
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


  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    song = self.find_or_create_by_name(parsed[1])
    song.artist = Artist.find_or_create_by_name(parsed[0])
    song.genre = Genre.find_or_create_by_name(parsed[2].gsub(".mp3", ""))  
    song
  end

  def self.create_from_filename(filename)
    (self.new_from_filename(filename)).tap do |song|
      song.save
    end
  end


end





