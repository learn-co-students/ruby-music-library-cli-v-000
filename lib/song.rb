require 'pry'

class Song
  attr_accessor :name, :genre, :artist

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    @genre = genre
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self) unless artist == nil
  end

  def save
    @@all << self
  end

end
