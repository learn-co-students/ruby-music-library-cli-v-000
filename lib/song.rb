require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name)
    @@all << Song.new(name)
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

end