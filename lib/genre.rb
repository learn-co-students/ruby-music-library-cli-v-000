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

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    self.songs << song unless self.songs.include?(song)
    song.genre = self if song.genre == nil
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end

end
