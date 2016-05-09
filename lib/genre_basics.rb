require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :artist, :song
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
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    if self.all.detect {|n| n.name }
      self.all.detect {|n| n.name }
    else
      self.new(name).tap(&:save)
    end
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
