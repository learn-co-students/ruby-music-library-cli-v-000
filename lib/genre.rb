require 'pry'

class Genre
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs
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
end
