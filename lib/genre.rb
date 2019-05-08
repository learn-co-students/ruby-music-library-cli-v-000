require 'pry'

class Genre
  extend Concerns::Findable
  attr_accessor :name
  @@all = []
  @songs = []

  def initialize(name)
    @name = name
    @songs = []
    @@all << self
  end

  def add_song(song)
    @songs << song
  end

  def songs
    @songs
  end

  def artists
    songs.collect {|s|s.artist}.uniq
  end


  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap {|n|n.save}
  end

end
