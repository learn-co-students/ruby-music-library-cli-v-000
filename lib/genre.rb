require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.create(name)
    Genre.new(name).save
    self
  end

  # @@all array: methods to save, read & delete list of all Song objects
  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end
  # end @@all methods

  def artists
    songs.collect{|song| song.artist}.uniq
  end

end  # Genre class end
