require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
    save
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

  def self.find_by_name(name)
    self.all.detect {|a| a.name == name}
  end

  def self.new_from_filename(filename)
    artist, name, genre = filename.chomp(".mp3").split(" - ")
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)
    self.new(name, artist, genre)
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename)
  end
end
