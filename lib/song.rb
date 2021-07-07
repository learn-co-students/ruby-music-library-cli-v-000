require 'pry'
class Song

  attr_accessor :name, :artist
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist == nil
      @artist = nil
    else
      self.artist=(artist)
    end
    if genre == nil
      @genre = nil
    else
      self.genre=(genre)
    end
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
    @@all << song
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self
    genre.songs.uniq!
  end

  def self.find_by_name(name)
    @@all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end

  def self.new_from_filename(filename)
    split_filename = filename.split(" - ")
    name = split_filename[1]
    artist = split_filename[0]
    genre = split_filename[2].gsub(".mp3", "")
    a = Artist.find_or_create_by_name(artist)
    g = Genre.find_or_create_by_name(genre)
    song = self.new(name, a, g)
  end

  def self.create_from_filename(filename)
    @@all << self.new_from_filename(filename)
  end

end
