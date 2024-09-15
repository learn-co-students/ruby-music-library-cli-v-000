require 'pry'

class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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
    self.class.all << self
  end

  def artists
    artists = []
    self.songs.each do |song|
      artists << song.artist
    end
    artists.uniq
  end

end
