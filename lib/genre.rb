require 'pry'
class Genre
  extend  Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    #binding.pry
    genre
  end

   def songs
    @songs
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
  songs.collect{|song| song.artist}.uniq
  end
end
