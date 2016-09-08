require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def self.create(name)
    @@all << Song.new(name)
    binding.pry
  end

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

end
