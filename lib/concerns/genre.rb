require 'pry'

class Genre
  attr_accessor :name
  @@all = []
  extend Concerns::Findable

  def initialize(name)
    @name = name
    @songs = []
  end

  def songs
    @songs
  end

  def add_song(song)
    @songs << song
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new = Genre.new(name)
    new.save
    new
  end

  def artists
    songs.map {|song| song.artist}.uniq
  end

end
