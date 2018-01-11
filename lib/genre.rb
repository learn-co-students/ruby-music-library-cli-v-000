require 'pry'

class Genre
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

  def save
    @@all << self
  end

  def self.create(name)
    new_genre = Genre.new(name)
    new_genre.save
    new_genre
  end

  def artists
    artists_array = []
    self.songs.each do |song|
      artists_array << song.artist
    end
    artists_array.uniq
  end

  def self.destroy_all
    self.all.clear
  end
end
