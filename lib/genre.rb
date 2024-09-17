require_relative '../config/environment'

class Genre

  attr_accessor :name
  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
    @all
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    self.all << genre
    genre
  end

  def songs
    @songs
  end

  def artists
    @songs.collect { |song| song.artist }.uniq
  end

end
