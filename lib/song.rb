require_relative './concerns_module.rb'
require 'pry'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    if artist != nil
      self.artist=(artist)
    end
    if genre != nil
      self.genre=(genre)
    end
  end

  def name=(name)
    @name = name
  end

  def name
    @name
  end

  def artist=(artist)
    @artist = artist
    self.artist.add_song(self)
  end

  def artist
    @artist
  end

  def genre=(genre)
    if self.genre.nil?
      @genre = genre
    end
    if genre.songs.include?(self) == false
      genre.songs << self
    end
  end

  def genre
    @genre
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.create(name)
    song = self.new(name).save
    song
  end

  def self.destroy_all
    @@all = []
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist_var = filename.split(" - ")[0]
    genre = filename.split(" - ")[2]
    genre = genre.split(".")[0]
    artist = Artist.find_or_create_by_name(artist_var)
    genre = Genre.find_or_create_by_name(genre)
    song = self.new(name, artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = new_from_filename(filename).save
    song
  end


  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || self.create(name)
  end

end
