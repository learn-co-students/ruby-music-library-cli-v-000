
require 'pry'

class Genre

  extend Concerns::Findable


  attr_accessor :name, :songs

  @@all = []


  def initialize(name, song = nil, artist = nil)
    @name = name
    @songs = []
    self.artist = artist if artist
    self.song = song if song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self #self.class.all is the same as @@all
  end

  def self.create(name)
    genre = new(name)
    genre.save
    genre
  end

  def self.destroy_all
    @@all.clear
  end


  def songs
    @songs
      # returns the genre's 'songs' collection (genre has many songs)
  end

# Associations — Artist and Genre: Genre #artists returns a collection of artists for all of the genre's songs (genre has many arti
#sts through songs)

  def artists
    songs.collect {|song| song.artist }.uniq
      # returns a collection of artists for all of the genre's songs
      # => (genre has many artists through songs)
      # does not return duplicate artists if the genre has more than one song by a particular artist
      # => (genre has many artists through songs)
      # collects artists through its songs instead of maintaining its own @artists instance variable
      # => (genre has many artists through songs)
  end

  end
