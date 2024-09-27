require 'pry'

class Song

  attr_accessor :name
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
    artist
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.find_by_name(name)
    self.all.detect{|song|song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    song = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    new_artist = Artist.find_or_create_by_name(artist) unless Artist.all.include?(artist)
    genre = filename.split(" - ")[2].chomp(".mp3")
    new_genre = Genre.find_or_create_by_name(genre) unless Genre.all.include?(genre)
    if self.find_by_name(song)
      self.find_by_name(song)
    else
      new_song = self.new(song, new_artist, new_genre)
    end
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
