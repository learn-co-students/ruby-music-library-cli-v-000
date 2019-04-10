require_relative './concerns/findable.rb'


class Genre
  attr_accessor :name, :songs

  extend Concerns::Findable

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end

  def songs
    @songs
  end

  def add_song(song)
    song.genre = self unless song.genre == self
    @songs << song unless songs.include?(song)
  end

  def artists
    @songs.collect{|song| song.artist}.uniq
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    return genre
  end

  def save

  end

  def self.destroy_all
    @@all = []
  end

end
