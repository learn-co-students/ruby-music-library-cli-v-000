require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self if genre.songs.include?(self) == false
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
      song = Song.new(name)
      song.save
      song
  end

  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) == nil ? self.create(name) : self.find_by_name(name)
  end

  def self.new_from_filename(filename)
    song = Song.new(filename.split(" - ")[1])
    song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    song
  end

  def self.create_from_filename(filename)
    if Song.find_by_name(filename.split(" - ")[1]) == nil
      song = self.new_from_filename(filename)
      song.save
      song
    #song = Song.find_or_create_by_name(filename.split(" - ")[1])
    #song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
    #song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].split(".")[0])
    end
  end

end
