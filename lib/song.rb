require 'pry'
require_relative './Concerns/findable.rb'

class Song

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist
    genre.add_song(self) if genre
  end

  def artist=(artist)
      @artist = artist
      artist.add_song(self) unless artist.songs.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self) unless genre.songs.include?(self)
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

  def self.new_from_filename(file_name)
    artist_name = file_name.split(' - ')[0]
    song_name = file_name.split(' - ')[1]
    genre_name = file_name.split(' - ')[2].gsub(/\.mp3$/, '')
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    song = Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).save
  end
end
