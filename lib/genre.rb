require 'pry'
class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @all << self
  end

  def self.create(name)
    genres = Genre.new(name)
    genres.save
    genres
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless @songs.include?(song)
  end

  def artists
    # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    #   does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
    #   collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    self.songs.collect {|s| s.artist}.uniq
  end
end
