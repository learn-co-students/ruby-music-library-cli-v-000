require 'pry'

class Song
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil
  end

  def self.all
    @@all
  end
  def save
    @@all << self
  end
  def self.destroy_all
    self.all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song # REVOIR!! basic test: last one.
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    #binding.pry
    song = Song.new(filename[1])
    #binding.pry

    song.artist = Artist.find_or_create_by_name(filename[0])
    song.genre = Genre.find_or_create_by_name(filename[2].chomp(".mp3"))
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end




end
