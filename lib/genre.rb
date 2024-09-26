require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre =self.new(name)
    genre.save
    genre
  #  binding.pry
  end

  def artists
    artists =self.songs.map do
      |song| song.artist
    end
    artists.uniq
  end

end
