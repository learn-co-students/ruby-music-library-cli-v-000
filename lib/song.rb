require 'pry'

class Song
  extend Concerns::Findable

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
    @@all << self
  end

  def self.create(name)
    self.new(name).tap {|song| song.save}
  end

  def self.find_by_name(name)
    @@all.detect {|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create(name)
    end
  end

  def self.new_from_filename(file_name)
    if self.find_by_name(name) == nil
      file_array = file_name.gsub(".mp3", "").split(" - ")
      song = self.new(file_array[1])
      song.artist = Artist.find_or_create_by_name(file_array[0])
      song.genre = Genre.find_or_create_by_name(file_array[2])
      song
    end
  end

  def self.create_from_filename(file_name)
    self.new_from_filename(file_name).tap {|song| song.save}
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
