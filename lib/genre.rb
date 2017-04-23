require 'pry'
class Genre
  attr_accessor :name
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
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
    genre = self.new(name)
    genre.save
    genre
  end

  def add_song(song)
    @songs << song unless @songs.include?(song)
  end

  def songs
    @songs
  end

  def artists
    self.songs.collect{|a| a.artist}.uniq
  end



end
