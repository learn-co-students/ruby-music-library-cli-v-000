require_relative '../concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def artists
    @songs.collect do |song|
        song.artist
    end
    .uniq
  end

  # constructor
  def self.create(name)
    new_by_name = Genre.new(name)
    new_by_name.save
    new_by_name
  end
end
