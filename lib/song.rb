require 'pry'
class Song
  extend Concerns::Findable

  @@all = [ ]
  attr_reader :artist, :genre
  attr_accessor :name

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

# Class methods
  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def self.new_from_filename(file_name)
    song_name = file_name.split("-").map(&:strip)
    song = self.find_or_create_by_name(song_name[1])
    song.artist = Artist.find_or_create_by_name(song_name[0])
    song.genre = Genre.find_or_create_by_name(song_name[2].split(".mp3").first)
    song
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
