require 'pry'

class Genre

  extend Concerns::Findable
  attr_accessor :name, :artists, :genre
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def artists
    got_artists =songs.collect {|song| song.artist}
    got_artists.uniq
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
    @@all << self
  end

  def self.create(genre)
    genre = self.new(genre)
    genre.save
    genre
  end

end
