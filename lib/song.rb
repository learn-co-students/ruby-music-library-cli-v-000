require 'pry'
require 'artist.rb'
require 'genre.rb'

class Song

  attr_accessor :name
  attr_reader :artist, :genre


  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    if artist != nil
      self.artist= (artist)
    end
    if genre != nil
      self.genre= (genre)
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

  def artist= (artist)
    @artist = artist
    @artist.add_song(self)
  end

  def genre= (genre)
    @genre = genre
    @genre.add_song(self)
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create(name)
    else
      self.find_by_name(name)
    end
  end

  def self.new_from_filename(filename)
    split_filename = filename.gsub(".mp3", "").split(" - ")
    @artist = Artist.find_or_create_by_name(split_filename[0])
    @genre = Genre.find_or_create_by_name(split_filename[2])
    self.new(split_filename[1], @artist, @genre)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end
