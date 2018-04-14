require "pry"

class Song

  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    # @artist = artist
  end

  def self.all
    @@all

  end

  def self.destroy_all
    self.all.clear

  end

  def save
    self.class.all << self
  end

  def self.create(name)
    song = self.new(name)
    song.save
    song
  end

end
