require 'pry'

class Genre
  attr_accessor :name, :songs

  @@all = Array.new

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
    Genre.new(name).save
    self
  end

  def artists
    unique_artist = []
    @songs.each do |i|
      unique_artist << i.artist unless unique_artist.include?(i.artist)
    end
    unique_artist
  end
end
