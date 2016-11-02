require './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  def initialize(name)
    @name = name
    @songs = []
  end

  @@all = [] #holds all Genre objects

  def self.create(name)
    s = Genre.new(name)
    s.save
    s
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def artists
    artists = @songs.collect {|song| song.artist }
    artists.uniq
  end

end
