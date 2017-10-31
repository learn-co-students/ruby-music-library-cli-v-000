require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :musicimporter
  attr_reader :artist, :genre
  @@all = []

  def initialize(new_song, artist="", genre="")
    @name = new_song
    self.artist=(artist) unless artist == ""
    self.genre=(genre) unless genre == ""
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

  def self.create(song)
    created_song = self.new(song)
    created_song.save
    created_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(file)

  end

end
