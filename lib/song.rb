require "pry"
class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @songs = []
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
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

  def self.create(song_name)
    song = self.new(song_name)
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
end
