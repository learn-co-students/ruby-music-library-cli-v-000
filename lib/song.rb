require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre
    if genre.songs.include?(self) == false
      genre.songs << self
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
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  def self.new_from_filename(filename)
      song = self.find_or_create_by_name(filename.split(" - ")[1])
      song.artist = Artist.find_or_create_by_name(filename.split(" - ")[0])
      song.genre = Genre.find_or_create_by_name(filename.split(" - ")[2].delete ".mp3")
      song
    end

  def self.create_from_filename(filename)
      song = self.new_from_filename(filename)
      @@all << song
      song
  end

end
