require 'pry'
class Genre

  attr_accessor :name, :genre
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

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    new_genre = self.new(name)
    new_genre.save
    new_genre
  end
end
