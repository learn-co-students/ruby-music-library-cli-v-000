require 'pry'
class Genre
  extend Concerns::Findable

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear

  end

  def save
    @@all << self
  end

  def self.create(name)
    g = Genre.new(name)
    g.save
    g
  end

  def songs
    @songs
  end

  def artists
    @songs.collect {|s| s.artist}.uniq
  end



end
