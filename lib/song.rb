require 'pry'

class Song

  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    @genre = genre
    self.artist = artist if artist
    self.genre = genre if genre
    @@all << self
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

  def self.create(name)
    self.new(name)
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.find_by_name(title)
    self.all.detect{|song|song.name == title}
  end

  def self.find_or_create_by_name(title)
    # binding.pry
    self.find_by_name(title) || self.create(title)
  end

end
