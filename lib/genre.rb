require_relative '../lib/concerns/findable.rb'
class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def name=(name)
    @name = name
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    @@all << self.new(name)
    @@all.last
  end

  def artists
    @songs.collect {|song| song.artist}.uniq
  end

end