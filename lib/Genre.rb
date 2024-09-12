require 'pry'

class Genre

  extend Concerns::Findable

  attr_accessor :name, :songs, :artists
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    self.all.clear
  end

  def save
    @@all << self
    self
  end

  def self.create(input)
    genre = Genre.new(input)
    genre.save
    genre
  end

  def artists
    self.songs.map {|x| x.artist }.uniq
  end

end