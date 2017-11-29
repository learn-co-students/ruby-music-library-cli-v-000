require 'pry'
class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = new(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def artist_name=(name)
    if (self.artist.nil?)
      self.artist = Artist.find_or_create_by_name(name)
      self.artist.add_song(self)
    else
      self.artist.name = name
    end
  end

  def genre_name=(name)
    if (self.genre.nil?)
      self.genre = Genre.find_or_create_by_name(name)
      self.genre.add_song(self)
    else
      self.genre.name = name
    end
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(filename)
    unless self.find_by_name(filename.split(" - ")[1])
      song = self.new(filename.split(" - ")[1])
      song.artist_name = (filename.split(" - ")[0])
      song.genre_name = filename.split(" - ")[2].split(".")[0]
      song
    end
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end
end
