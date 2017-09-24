require "pry"
class Song
  @@all = []

  attr_accessor :name

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist == nil ? self : self.artist = artist
    genre == nil ? self : self.genre = genre
  end

  def self.new_from_filename(filename)
    song = self.new(name, artist = nil, genre = nil)
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.name = filename.split(" - ")[1]
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def genre=(genre)
    @genre = genre
    genre.songs.include?(self) ? genre.songs : genre.songs << self
  end

  def genre
    @genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
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
    song = self.new(name)
    song.save
    song
  end
end
