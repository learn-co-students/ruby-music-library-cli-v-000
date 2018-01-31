require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs, :artist

  @@all =[]

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
    self.new(name).tap { |new_genre| new_genre.save }
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end

end
