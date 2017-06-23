require 'pry'
class Genre

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all # candidate for module
    @@all
  end

  def self.destroy_all # candidate for module
    @@all.clear
  end

  def save # candidate for module
    @@all << self
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect do |song|
         song.artist
    end.uniq
  end 

end
