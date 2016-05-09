require 'pry'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :song, :genre
  attr_reader :songs, :genres

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
    # if self.all.detect {|n| n.name }
    #   self.all.detect {|n| n.name }
    # else

      self.new(name).tap(&:save)
    # end
  end

  def add_song(name)
    @songs << name unless @songs.include?(name)
    if name.artist != self
      name.artist = self
    end
  end

  def genres
    @songs.map(&:genre).uniq
  end
end
