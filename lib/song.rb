require 'pry'

class Song
  attr_accessor :name, :genre, :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    song = Song.new(name)
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

  def self.find_by_name(name)
    @@all.detect {|x| x.name == name}
  end

  def self.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create(name)
  end

  def self.new_from_filename(name)
    x = name.chomp(".mp3")
    x = x.split(" - ")
    artist = Artist.find_or_create_by_name(x[0])
    genre = Genre.find_or_create_by_name(x[2])
    self.new(x[1], artist, genre)
  end

  def self.create_from_filename(name)
    song = self.new_from_filename(name)
    song.save
    song
  end
end

#binding.pry
