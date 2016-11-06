require 'pry'

class Song
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
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
    self.new(name).tap do |song|
      song.save
    end
  end
end
