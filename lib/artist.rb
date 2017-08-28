require "pry"
class Artist
  attr_accessor :name, :songs
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
    self.all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end
end
