require_relative '../concerns/findable.rb'
require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :artist, :genre


  @@all = []

  def initialize(name, artist = "" , genre = "")
    @name = name
     if artist.is_a?(Artist)
       self.artist=(artist)
     else
       self.artist=(Artist.new(artist))
     end

     if genre.is_a?(Genre)
       self.genre=(genre)
     else
       self.genre=(Genre.new(genre))
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

  def self.create(name, artist = "" , genre = "")
    song = self.new(name, artist, genre)
    song.save
    song

  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self) unless @artist.songs.include?(self)

  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self) unless @genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
      music = filename.split(" - ")
      artist = Artist.find_or_create_by_name(music[0])
      genre = Genre.find_or_create_by_name(music[2].chomp(".mp3"))
      song = self.new(music[1],artist,genre)

      # binding.pry
  end

  def self.create_from_filename(filename)
    music = filename.split(" - ")
    artist = Artist.find_or_create_by_name(music[0])
    genre = Genre.find_or_create_by_name(music[2].chomp(".mp3"))
    song = self.find_or_create_by_name(music[1])
    song.artist=(artist)
    song.genre=(genre)
    song

  end

end
