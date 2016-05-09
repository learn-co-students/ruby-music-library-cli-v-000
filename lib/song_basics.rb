
require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name, :genre
  attr_reader :artist

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless  genre == nil
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    @genre.add_song(self)
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
    if self.all.detect {|n| n.name }
      self.all.detect {|n| n.name }
    else
      self.new(name).tap(&:save)
    end
  end

  def self.new_from_filename(file)
    temp_song_file = file.split(' - ')

    artist = Artist.create(temp_song_file[0])
    genre = Genre.create(temp_song_file[2].split(".mp3").join)
    self.new(temp_song_file[1], artist, genre)
  end

  def self.create_from_filename(file)
    self.new_from_filename(file).tap(&:save)
    # binding.pry

  end
end
