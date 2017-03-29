require "pry"
require_relative "./concerns/findable"

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def artists
    artists = []

    self.songs.each do |song|
      artists << song.artist unless artists.include?(song.artist)
    end

    artists
  end

end
