require 'pry'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []

  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    gen = self.new(name)
    self.all << gen
    gen

  end

  def artists
    songs.collect {|song| song.artist}.uniq
  end
end
