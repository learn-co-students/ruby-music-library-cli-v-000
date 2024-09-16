require 'pry'
class Genre
  extend Concerns::Findable
  @@all = []

  attr_accessor :name, :songs, :artists

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    name = self.new(name)
    name.save
    name
  end

  def artists
    self.songs.map do |song|
      song.artist
    end.uniq
  end

end
