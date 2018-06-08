require "pry"
class Genre

  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    create = self.new(name)
    create.save
    create
  end

  def songs
    @songs
  end

  def artists
songs.map(&:artist).uniq
    # Song.all.collect {|genre| genre.artist}.uniq
  end
end
