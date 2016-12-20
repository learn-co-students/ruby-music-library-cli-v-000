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
    genre = Genre.new(name)
    self.all << genre
    genre
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def artists
    self.songs.map{|song| song.artist}.uniq
  end

  def self.destroy_all
    self.all.clear
  end
end
