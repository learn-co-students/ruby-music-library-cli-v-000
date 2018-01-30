require_relative '../concerns/findable.rb'
require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name, :artist, :genre

  @@songs = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
  end

  def self.all
    @@songs
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@songs << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


  def self.new_from_filename(filename)
    song = filename.chomp!(".mp3")

    name = song.split(" - ")[1]
    artist = song.split(" - ")[0]
    genre = song.split(" - ")[2]

    song_artist = Artist.find_or_create_by_name(artist)
    song_genre = Genre.find_or_create_by_name(genre)

    self.new(name, song_artist, song_genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end

end
