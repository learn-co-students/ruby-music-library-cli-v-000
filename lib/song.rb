require 'pry'

class Song
  attr_reader :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    self.name=(name)
    if artist
      self.artist=(artist)
    end
    if genre
      self.genre=(genre)
    end
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    new(name).tap{|s| s.save}
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
    all.detect{|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    #binding.pry
    filename_array = filename.chomp(".mp3").split(" - ")
    artist = Artist.find_or_create_by_name(filename_array[0])
    genre = Genre.find_or_create_by_name(filename_array[2])
    song = self.new(filename_array[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    all << new_from_filename(filename)
  end
end
