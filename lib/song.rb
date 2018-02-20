require 'pry'
class Song
  @@all = []
  attr_accessor :name, :artist, :genre

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist unless artist == nil
    self.genre = genre unless genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.destroy_all
    @@all.clear
  end

  def self.find_by_name(name)
    self.all.detect {|artist| artist.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    self.new(filename.split(" - ")[1], Artist.find_or_create_by_name(filename.split(" - ")[0]), Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3")))
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

end
