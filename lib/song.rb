require 'pry'
class Song

  attr_accessor :name, :artist, :genre

  def initialize(name, artist= nil)
    @name = name
    @artist = artist
    @genre = genre
  end

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist= nil)
    new_song = self.new(name, artist= nil)
    new_song.save
    new_song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
end
