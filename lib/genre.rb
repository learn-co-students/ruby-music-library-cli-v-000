require 'rspec'

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
    genre = self.new(name)
    @@all << genre
    genre
  end

  def add_song(song)
    song.genre = self unless song.genre != nil
    @songs << song unless @songs.include?(song)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
