require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize(name, artist = nil)
    @name = name
    @artist = artist
    if @artist != nil
      artist.songs << name
    end
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

  def artist=(artist)
    self.artist = artist
  end

end
