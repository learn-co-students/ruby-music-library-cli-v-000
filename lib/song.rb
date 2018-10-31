require 'pry'

class Song
  attr_accessor :name

  @@all = Array.new

  def initialize(name, artist = nil, genre = nil)
    @name = name

    !artist.nil? ? self.artist=(artist) : @artist = artist
    !genre.nil? ? self.genre=(genre) : @genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    (name = self.new(name)).save
    return name
  end

  def self.find_by_name(name)
    self.all.detect { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    @artist = filename.split(" - ")[0]
    @name = filename.split(" - ")[1]
    @genre = filename.split(" - ")[2].gsub(".mp3", "")
    self.new(@name, @artist, @genre)
  end

  def save
    @@all << self if !@@all.include?(self)
  end

  def artist
    @artist
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if !genre.songs.include?(self)
  end
end
