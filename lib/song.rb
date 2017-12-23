require 'pry'

class Song
  extend Concerns::Findable
  extend Concerns::Memorable::ClassMethods
  include Concerns::Memorable::InstanceMethods

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist=artist if artist
    self.genre=genre if genre
  end

  def self.all
    @@all
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(filename)
    artist_name, song_name, genre_name = filename.chomp(".mp3").split(" - ")
    new_song = self.new(song_name)
    artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(new_song)
    genre = Genre.find_or_create_by_name(genre_name)
    genre.add_song(new_song)
    new_song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end
end
