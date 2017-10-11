require 'pry'
class Genre
  attr_accessor :name
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
    genre = self.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    artists = []
    self.songs.collect do |song|
      artists << song.artist
    end
    artists.uniq
  end
end

class Genre
  extend Concerns::Findable
end
