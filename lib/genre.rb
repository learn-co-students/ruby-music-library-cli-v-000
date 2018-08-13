require 'pry'

class Genre
  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(genre_name)
    song = Genre.new(genre_name)
    song.save
    song
  end

  def initialize(name)
    @name = name
  end

  def save
    @@all << self
  end

end
