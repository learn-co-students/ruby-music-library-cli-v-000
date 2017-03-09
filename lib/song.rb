require_relative '../concerns/findable.rb'

class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
  end

  def artist=(artist)
    @artist = artist
    @artist.songs << self
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  # constructor
  def self.create(name)
    new_by_name = Song.new(name)
    new_by_name.save
    new_by_name
  end
end
