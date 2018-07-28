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

  def self.new_from_filename(filename)
    #binding.pry
    artist_name = filename.split(" - ")[0]
    song_name = filename.split(" - ")[1]
    Song.new(song_name, artist_name)
  end

  def create_from_filename(filename)

  end

  def name
    @name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
    self
  end

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    song = self.new(name).save
    song
  end

  def artist=(artist)
    #if self.artist.nil?
      @artist = artist
    #end
    self.artist.add_song(self)
    binding.pry
  end

  def artist
    @artist
  end

  def genre=(genre_obj)
    if self.genre.nil?
      @genre = genre_obj
    end
    if genre_obj.songs.include?(self) == false
      genre_obj.songs << self
    end
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      if song.name == name
        return song
      end
    end
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || Song.create(name)
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[1]
    artist = filename.split(" - ")[0]
    song = self.new(name).save
    song
    binding.pry
  end
end
