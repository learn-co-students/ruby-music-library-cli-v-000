require 'pry'
class Genre
  attr_accessor :name, :songs
  extend Concerns::Findable
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
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
    genres = new(name)
    genres.save
    genres
  end

  def artists
    # returns a collection of artists for all of the genre's songs (genre has many artists through songs)
    #   does not return duplicate artists if the genre has more than one song by a particular artist (genre has many artists through songs)
    #   collects artists through its songs instead of maintaining its own @artists instance variable (genre has many artists through songs)
    self.songs.collect {|s| s.artist}.uniq
  end
end
