require 'pry'

class Genre

  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize name
    @name = name
    @songs = []
    @all_artists = []
    @@all << self
  end

  def artists
    @all_artists
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    self.class.all << self
    self
  end

  def self.create name
    self.new(name).save
  end

end