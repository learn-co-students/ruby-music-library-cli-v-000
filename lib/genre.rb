require 'pry'

class Genre
  attr_accessor :name, :genre, :songs
  extend Concerns::Findable
  @@all = []

  def initialize(genre_string)
    @name = genre_string
    @@all << self
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

  def self.create(nm)
    new_genre = Genre.new(nm)
  end

  def artists
    @songs.collect{|s| s.artist}.uniq
  end
end