require 'pry'

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
    self.all.clear
  end

  def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre=(self) if !song.genre
    @songs << song if !@songs.include?(song)
  end

  def artists
    self.songs.collect {|song| song.artist}.uniq
  end
end
