require_relative './concerns/findable.rb'

class Genre
 attr_accessor :name
 attr_reader :songs

 extend Concerns::Findable
 
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

  def self.destroy_all
    @@all = []
  end

  def self.create(name)
    @genre = Genre.new(name)
    @genre.save
    @genre
  end

  def songs
    @songs
  end

  def artists
    @songs.collect { |song| song.artist}.uniq
  end
end
