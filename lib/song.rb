require 'pry'

class Song

  extend Concerns::Findable

  @@all = [ ]

  attr_accessor :name
  attr_reader :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist == nil ? @artist = artist : self.artist = artist
    genre == nil ? @genre = genre : self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    self.genre.add_song(self)
  end

  def self.new_from_filename(filename)
    song_title = filename.split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    genre_name = filename.split(" - ")[2].chomp(".mp3")
    s = self.find_or_create_by_name(song_title)
    s.artist = Artist.find_or_create_by_name(artist_name)
    s.genre = Genre.find_or_create_by_name(genre_name)
    s
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
