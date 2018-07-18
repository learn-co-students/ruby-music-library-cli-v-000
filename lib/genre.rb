#genre class definition
require 'pry'
require_relative "./concerns/findable.rb"

class Genre
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

#INSTANCE METHODS
  def save
    @@all << self
  end

  def songs
    @songs
  end

  def artists
    artists_array = self.songs.collect {|song| song.artist}
    artists_array.uniq
  end

#CLASS METHODS
  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    object = self.new(name)
    object.save
    object
  end



end
