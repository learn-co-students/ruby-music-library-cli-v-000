require 'pry'

class Song
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :genre, :artist

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
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def self.new_from_filename(fn)
    song = self.new(
            fn.split(" - ")[1],
            Artist.find_or_create_by_name( fn.split(" - ")[0] ),
            Genre.find_or_create_by_name( fn.split(" - ")[2].chomp(".mp3") )
          )
    song
  end

  def self.create_from_filename(fn)
    new_from_filename(fn).save
  end
end
