require_relative './concerns/findable.rb'

class Genre
  extend Concerns::Findable
  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
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
    @@all << Genre.new(name)
    @@all.last
  end

  def add_song(song)
    @songs << song
  end

  def artists
    self.songs.collect{|song| song.artist}.uniq
  end

end