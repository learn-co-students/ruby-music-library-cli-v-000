require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.create(name)
    Song.new(name).save
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