require 'pry'

class Genre

  attr_accessor :name
  @@all = []

  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
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
    new(name).save
  end

  def artists
    artists = self.songs.collect{|s| s.artist}
    artists & artists
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end
end
