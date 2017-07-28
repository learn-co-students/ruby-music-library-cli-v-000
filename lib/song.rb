require 'pry'

class Song

  extend Concerns::Findable

  attr_accessor :name, :genre, :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
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
    @artist=artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre=genre
    genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect{|song| name == song.name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create(name)
  end

  # another find_or_create_by_name method that is cleaner - you can use or !!!
  #
  # def self.find_or_create_by_name(name)
  #   self.find_by_name(name) or self.create(name)
  # end

  def self.new_from_filename(file_name)
    new_song = self.new(file_name.split(" - ")[1])
    new_song.artist = Artist.find_or_create_by_name(file_name.split(" - ")[0])
    new_song.genre = Genre.find_or_create_by_name(file_name.split(" - ")[2].gsub(/.mp3/, ""))
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    @@all << new_song
  end


end
