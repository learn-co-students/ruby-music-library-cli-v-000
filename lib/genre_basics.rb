require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :song, :artist
  attr_reader :songs, :artists

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
      self.new(name).tap(&:save)
  end

  def add_song(name)
    @songs << name unless @songs.include?(name)
    if name.genre != self
      name.genre = self
    end
  end

  def artists
    @songs.map(&:artist).uniq
  end
end
