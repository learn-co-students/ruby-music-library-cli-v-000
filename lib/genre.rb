require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs =[]
  end

  def songs
    @songs
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    genre = self.new(name)
    self.all << genre
    genre
  end


  def artists
    self.songs.collect do |song|
      song.artist
    end
    .uniq
  end


end
