require_relative './concerns/concerns.rb'

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
    @@all.clear
  end

  def save
    @@all << self
  end

  # def self.create(genre_name)
  #   genre = Genre.new(genre_name)
  #   genre.save
  #   genre
  # end

  def artists
    songs.map { |song| song.artist }.uniq
  end
end
