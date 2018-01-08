require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) if artist
    self.genre=(genre) if genre
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
    new_song = self.new(name)
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

  def self.find_by_name(name)
    self.all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end

  def self.create_from_filename(filename)
    filename_split = filename.split(/ - /)
#    binding.pry
    artist = Artist.find_or_create_by_name(filename_split[0])
    genre = Genre.find_or_create_by_name(filename_split[2].split(/\./)[0])
    new_song = self.new(filename_split[1], artist, genre)
    new_song
  end
end
