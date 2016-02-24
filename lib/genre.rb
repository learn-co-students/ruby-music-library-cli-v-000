require_relative '../concerns/findable'
require 'pry'

class Genre

  @@all = []

  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre # if I don't either return genre here, or don't return self in self.create, one test doesn't pass
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
    #self # if I don't either return self here, or return genre in self.create, one test doesn't pass. because otherwise returns entire array?
  end

end

