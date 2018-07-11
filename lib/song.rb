require 'pry'
class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def artist=(artist)
    @artist = artist
  end

  def genre=(genre)
    @genre = genre
  end

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def artist
    Artist.add_song(self)
  end

  def genre
    self.genre
  end



  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name, artist = nil)
    new_song = self.new(name, artist)
    @@all << new_song

  end

end
