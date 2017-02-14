require 'pry'

class Song
  attr_accessor :name, :artist, :genres
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    all.clear
  end

  def self.create(name)
    Song.new(name).tap{|song| song.save}
  end
end


Song.create("heyo")
