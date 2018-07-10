require_relative '../lib/concerns/findable.rb'
class Genre
  @@all = []
  extend Concerns::Findable
  attr_accessor :name, :songs
  def initialize(name)
    @name = name
    @songs = []
  end
  def save
    @@all << self
  end
  def songs
    return @songs
  end

  def artists
    arr = []
    songs.each do |song|
      if arr.include?(song.artist) == false
        arr << song.artist
      end
    end
    return arr
  end

  def self.all
    return @@all
  end
  def self.destroy_all
    @@all = []
  end
  def self.create(name)
    genre = Genre.new(name)
    @@all << genre
    return genre
  end
end
