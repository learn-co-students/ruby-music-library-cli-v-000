require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # Class methods

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
    filename_arr = filename.chomp(".mp3").split(" - ")
    song = Song.find_or_create_by_name(filename_arr[1])
    song.artist = Artist.find_or_create_by_name(filename_arr[0])
    song.genre = Genre.find_or_create_by_name(filename_arr[2])
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename)
    song.save if song
  end

  #Instance Methods

  def save
    @@all << self unless @@all.include?(self)
  end

  def artist=(artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
  end
end
