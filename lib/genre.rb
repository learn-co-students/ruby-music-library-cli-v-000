require 'pry'
require './concerns/findable.rb'

class Genre
  extend Concerns::Findable

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def songs
    @songs
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

  def save
    @@all << self
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

end
