require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
    self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
    Genre.new(genre_name).save
  end

  def songs
    @songs
  end

  def artists
    artists = self.songs.collect do |song|
      song.artist
    end
    artists.uniq
  end

end
