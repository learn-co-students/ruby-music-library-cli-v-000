require_relative "concerns.rb"

class Genre

  extend Concerns::Findable

  attr_reader :songs
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
    Genre.new(name).tap do |genre|
      genre.save
    end
  end

  def artists
    artists = []
    songs.each do |song|
      artists << song.artist if !song.artist.nil? && !artists.include?(song.artist)
    end
    artists
  end

end
