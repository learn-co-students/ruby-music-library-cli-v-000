 require 'pry'
class Genre

  attr_accessor :name, :songs, :artists, :genre

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.sort
    @@all.sort! { |a, b|  b.name <=> a.name}
  end

  def to_s
    self.name
  end

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end
