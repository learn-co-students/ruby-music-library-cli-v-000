require 'pry'
class Song
  @@all = [ ]
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  def save
    @@all << self
  end

# Class methods
  def self.create(name)
    Song.new(name).save
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end
end
