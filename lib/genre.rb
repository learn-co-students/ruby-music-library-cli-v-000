require "./concerns/concerns.rb"

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    self.name = name
    @songs = []
  end

  def artists
    artists = []
    self.songs.collect { |song| artists << song.artist unless artists.include?(song.artist) }
    artists
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def self.destroy_all
    self.all.clear
  end

end
