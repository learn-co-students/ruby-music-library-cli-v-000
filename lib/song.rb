require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist
    self.genre = genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    new(name).tap { |song| song.save }
  end

  def new(name)
    Song.new(name)
  end

  def save
    @@all << self
  end

  def artist=(artist)
    @artist = artist ## Why do I need the instance variable?
    artist.add_song(self) unless artist.nil?
  end

  def genre
    @genre
  end

  def genre=(genre)
    @genre = genre ## How did this work?
    unless genre.nil?
      genre.add_song(self) unless genre.songs.include?(self)
    end
  end

  def self.find_by_name(name)
    all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(file_name)
    name = file_name.split(' - ')[1]
    genre_name = file_name.split(' - ')[2]
    genre_name.slice! ".mp3"
    artist = Artist.find_or_create_by_name(file_name.split(' - ')[0])
    genre =  Genre.find_or_create_by_name(genre_name)
    new(name, artist, genre)
  end

  def self.create_from_filename(file_name)
    new_from_filename(file_name).tap { |song| song.save }
  end

end