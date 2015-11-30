require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist unless artist.nil?
    self.genre = genre unless genre.nil?
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

  def self.create(name, artist=nil, genre=nil)
    song = self.new(name, artist, genre)
    self.all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  #def self.find_by_name(name)
  #  self.all.detect {|s| s.name == name}
  #end

  #def find_or_create_by_name(name)
  #  self.find_by_name(name) || self.create(name)
  #end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name = Artist.find_or_create_by_name(parts[0])
    genre_name = Genre.find_or_create_by_name(parts[2].gsub(".mp3", ""))
    song = Song.new(parts[1], artist_name, genre_name)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end

end
