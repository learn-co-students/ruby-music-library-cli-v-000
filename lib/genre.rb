require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = new(name)
    new_genre.save
    new_genre
  end

  def songs
    @songs
  end

  def artists
    songs.collect{|s| s.artist }.uniq
  end

end
